from typing import List, Dict, Tuple
from warnings import warn

import gym
import numpy as np
import pandas as pd
from sklearn.model_selection import StratifiedKFold, GridSearchCV, cross_val_score
from sklearn.svm import SVC

from s2s.partitioned_option import PartitionedOption
from s2s.svc import SVM
from s2s.utils import show, load, pd2np, range_without


def learn_preconditions(env: gym.Env, init_data: pd.DataFrame, partitioned_options: Dict[int, List[PartitionedOption]],
                        verbose=False, **kwargs) -> Dict[Tuple[int, int], SVM]:
    preconditions = dict()
    for option in range(env.action_space.n):

        negative_data = pd2np(init_data.loc[(init_data['option'] == option) &
                                            (init_data['can_execute'] == False)]['state'])
        # must do equals False because Pandas!

        for i, partition in enumerate(partitions[option]):
            show('Learning precondition for option {}'.format(option), verbose)
            if kwargs.get('augment_negative', True):
                # augment negative samples from the initiation sets of the other partitions
                negative_samples = _augment_negative(negative_data, partition.partition, partitioned_options[option])
            else:
                negative_samples = negative_data
            positive_samples = partition.states
            precondition = _learn_precondition(env, partition, negative_samples, positive_samples,
                                               verbose=verbose, **kwargs)
            preconditions[(option, partition.partition)] = precondition
    return preconditions


def _augment_negative(negative_data: np.ndarray, current_partition: int,
                      partitions: List[PartitionedOption]) -> np.ndarray:
    if len(negative_data) == 0:
        negatives = list()
    else:
        negatives = [negative_data]
    for partition in partitions:
        if partition.partition == current_partition:
            continue
        negatives.append(partition.states)
    return np.vstack(negatives)


def _learn_precondition(env: gym.Env, partition: PartitionedOption, negative_samples: np.ndarray,
                        positive_samples: np.ndarray, verbose=False, **kwargs) -> SVM:
    if len(negative_samples) == 0 or len(positive_samples) == 0:
        warn("Need positive and negative samples!")
        return None

    data = np.vstack((positive_samples, negative_samples))
    labels = [1] * len(positive_samples) + [0] * len(negative_samples)

    show("Calculating mask for option {}, partition {} ...".format(partition.option, partition.partition), verbose)

    precondition_mask = _compute_precondition_mask(positive_samples, negative_samples, labels, verbose=verbose,
                                                   **kwargs)

    return None


def _compute_precondition_mask(positive_samples: np.ndarray, negative_samples: np.ndarray, labels: List[int],
                               verbose=False, **kwargs):
    """
    Compute the precondition mask using a feature selection procedure. These are the variables that matter when
    determining whether an option can be executed
    :param positive_samples: an array of positive states
    :param negative_samples: an array of negative states
    :param labels: labels corresponding to positive and negative states
    :param verbose: the verbosity level
    :return: the mask
    """
    # the max number of samples to use for computing the mask
    max_precondition_mask_samples = kwargs.get('max_precondition_mask_samples', np.inf)
    n_samples = len(negative_samples) + len(positive_samples)
    if n_samples > max_precondition_mask_samples:
        # reduce data
        # resample but maintain ratio
        n_negative = round(max_precondition_mask_samples * len(negative_samples) / n_samples)
        n_positive = max_precondition_mask_samples - n_negative

        positive_samples = positive_samples[
            np.random.choice(len(positive_samples), n_positive, replace=False)]
        negative_samples = negative_samples[
            np.random.choice(len(negative_samples), n_negative, replace=False)]

    samples = np.vstack((positive_samples, negative_samples))

    # compute the precondition mask through feature selection
    mask = []
    n_vars = samples.shape[1]

    # compute the score with ALL state variables
    total_score, params = _get_orig_score_params(samples, labels)
    show("Score with all variables: {}".format(total_score), verbose)

    threshold = kwargs.get('mask_selection_threshold', 0.02)

    # try remove each state variable in turn, see what the score is
    latest_score = 0
    for m in range(n_vars):
        used_vars = range_without(0, n_vars, m)
        subset_score = _get_subset_score(samples, labels, used_vars, params)

        if total_score - subset_score > threshold:
            # removing the variable damaged the score. So keep it!
            show("Variable {} causes damage when removed. Keeping...".format(m), verbose)
            mask.append(m)
            latest_score = subset_score

    # now try adding variables back!
    for m in range_without(0, n_vars, *mask):
        n_score = _get_subset_score(samples, labels, mask + [m], params)
        if n_score - latest_score > threshold:
            latest_score = n_score
            mask = mask + [m]
            show("Variable {} improves the score when added. Keeping...".format(m), verbose)
            if n_score == 1:
                break  # cannot improve
    mask.sort()
    show("Final precondition mask: {} with score {}".format(mask, latest_score), verbose)
    return mask


def _get_orig_score_params(states: np.ndarray, labels: List[int], **kwargs):
    """
    Compute the classification score over the full data
    :param states: the states, positive and negative
    :param labels: the associated labels
    :return: the best score and the associated SVM hyperparameters
    """
    if len(set(labels)) == 1:
        # everything is in the same class! SVM can't handle :(
        warn("There is only one class. SVM cannot handle this case")
        return 1, {'gamma': 5, 'C': 1}
    c_range = kwargs.get('c_range', np.arange(1, 16, 2))
    gamma_range = kwargs.get('c_range', np.arange(5, 20))
    param_grid = dict(gamma=gamma_range, C=c_range)
    grid = GridSearchCV(SVC(class_weight='balanced'), param_grid=param_grid, cv=3)  # 3 fold CV
    grid.fit(states, labels)
    # try:
    #     grid.fit(states, labels)
    # except ValueError:
    #     return 1, {'gamma': 5, 'C': 1}
    return grid.best_score_, grid.best_params_


def _get_subset_score(states: np.ndarray, labels: List[int], mask: List[int], best_params: Dict[str, float]):
    """
    Compute the classification score over the given masked data
    :param states: the states, positive and negative
    :param labels: the associated labels
    :param mask: the state variables to keep
    :param best_params: the hyperparameters
    :return: the average cross-validated SVM score
    """
    if len(set(labels)) == 1:
        # everything is in the same class! SVM can't handle :(
        warn("There is only one class. SVM cannot handle this case")
        return 1, {'gamma': 5, 'C': 1}

    # probably unneccessary, but going to sort!
    mask.sort()

    states = states[:, mask]
    if states.shape[1] == 0:
        warn("Trying to do feature selection with an empty mask!")
        return 0

    return np.mean(
        cross_val_score(
            SVC(class_weight='balanced', C=best_params['C'], gamma=best_params['gamma']),
            X=states, y=labels, cv=3))

    # try:
    #     return np.mean(
    #         cross_val_score(
    #             SVC(class_weight='balanced', C=best_params['C'], gamma=best_params['gamma']),
    #             X=states, y=labels, cv=3))
    # except ValueError:
    #     return 1


if __name__ == '__main__':
    temp = [np.array([0, 1, 2, 3], dtype=object) for _ in range(10)]
    temp = np.array(temp)

    x = np.where(temp == (0, 1, 2, 3))
    d = 0

    env = gym.make('CartPole-v0')
    # transition_data, initiation_data = collect_data(env, max_episode=50, verbose=True)
    # transition_data.to_pickle('data/transition.pkl', compression='gzip')
    # initiation_data.to_pickle('data/init.pkl', compression='gzip')

    transition_data = pd.read_pickle('data/transition.pkl', compression='gzip')
    initiation_data = pd.read_pickle('data/init.pkl', compression='gzip')

    # partitions = partition_options(env, transition_data, verbose=True)
    #
    # save(partitions, 'partitioned_options/partitions.pkl')
    partitions = load('partitioned_options/partitions.pkl')
    # for p in partitions:
    #     save(p, 'partitioned_options/option_{}_partition_{}.pkl'.format(p.option, p.partition))

    learn_preconditions(env, initiation_data, partitions)
