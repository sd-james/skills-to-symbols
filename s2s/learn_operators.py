from typing import List, Dict, Tuple
from warnings import warn

import gym
import numpy as np
import pandas as pd

from s2s.learned_operator import LearnedOperator
from s2s.estimators.kde import KernelDensityEstimator
from s2s.estimators.svc import SupportVectorClassifier
from s2s.estimators.svr import SupportVectorRegressor
from s2s.feature_selection import _compute_precondition_mask
from s2s.partitioned_option import PartitionedOption
from s2s.utils import show, pd2np

__author__ = 'Steve James and George Konidaris'


def combine_learned_operators(env: gym.Env, partitioned_options: Dict[int, List[PartitionedOption]],
                              preconditions: Dict[Tuple[int, int], SupportVectorClassifier],
                              effects: Dict[
                                Tuple[int, int], List[Tuple[float, KernelDensityEstimator, SupportVectorRegressor]]]) \
        -> List[LearnedOperator]:
    """
    Merge all the learned partitions, preconditions and effects into a data structure
    :param env: teh domain
    :param partitioned_options: the partitioned options
    :param preconditions: the learned preconditions
    :param effects: the learned effects
    :return: the combined operators
    """
    operators = list()
    for option in range(env.action_space.n):
        for partition in partitioned_options[option]:
            key = (option, partition.partition)
            operator = LearnedOperator(partition, preconditions[key], effects[key])  # bundle them all together
            operators.append(operator)
    return operators


def learn_effects(env: gym.Env, partitioned_options: Dict[int, List[PartitionedOption]],
                  verbose=False, **kwargs) \
        -> Dict[Tuple[int, int], List[Tuple[float, KernelDensityEstimator, SupportVectorRegressor]]]:
    """
    Estimate the effects from data
    :param env: the domain
    :param partitioned_options: the partitioned options (a dictionary containing a list of partitions for each option)
    :param verbose: the verbosity level
    :return: the probability, next-state estimators and reward estimators
    """
    effects = dict()
    for option in range(env.action_space.n):

        for i, partition in enumerate(partitioned_options[option]):

            show("Calculating effects for option {}, partition {}:".format(option, i), verbose)

            probabilistic_outcomes = list()  # a list of tuples (prob, effect estimator, reward estimator)

            for j, (prob, rewards, next_states, masks) in enumerate(partition.effects()):
                show("Processing probabilistic effect {}".format(j), verbose)

                # make sure no issues with masks. They should all be the same,  else there's a problem with partitioning
                if not (masks == masks[0]).all():
                    raise ValueError("Masks in effect for option {}, partition {} are different!"
                                     .format(option, partition.partition))
                mask = sorted(masks[0])  # sorting to prevent any bugs ever!

                show("Fitting effect estimator", verbose)
                effect = KernelDensityEstimator(mask)
                effect.fit(next_states, verbose=verbose, **kwargs)  # compute the effect
                show("Fitting reward estimator", verbose)
                reward_estimator = SupportVectorRegressor()
                reward_estimator.fit(partition.states, rewards, verbose=verbose, **kwargs)  # estimate the reward
                probabilistic_outcomes.append((prob, effect, reward_estimator))
            effects[(option, partition.partition)] = probabilistic_outcomes

    return effects


def learn_preconditions(env: gym.Env, init_data: pd.DataFrame, partitioned_options: Dict[int, List[PartitionedOption]],
                        verbose=False, **kwargs) -> Dict[Tuple[int, int], SupportVectorClassifier]:
    """
    Learn all the preconditions for the partitioned options
    :param env: the domain
    :param init_data: the initiation data
    :param partitioned_options: the partitioned options (a dictionary containing a list of partitions for each option)
    :param verbose: the verbosity level
    :return: the classifiers
    """
    preconditions = dict()
    for option in range(env.action_space.n):

        negative_data = pd2np(init_data.loc[(init_data['option'] == option) &
                                            (init_data['can_execute'] == False)]['state'])
        # must do equals False because Pandas!

        for i, partition in enumerate(partitioned_options[option]):
            show('Learning precondition for option {}, partition {}'.format(option, partition.partition), verbose)
            if kwargs.get('augment_negative', True):
                # augment negative samples from the initiation sets of the other partitions
                negative_samples = _augment_negative(negative_data, partition.partition, partitioned_options[option])
            else:
                negative_samples = negative_data
            positive_samples = partition.states
            precondition = _learn_precondition(partition, negative_samples, positive_samples,
                                               verbose=verbose, **kwargs)
            preconditions[(option, partition.partition)] = precondition
    return preconditions


def _augment_negative(negative_data: np.ndarray, current_partition: int,
                      partitions: List[PartitionedOption]) -> np.ndarray:
    """
    Add data from other partitions as negative sample instances
    :param negative_data: the states currently labelled as negatives
    :param current_partition: the current partitioned option
    :param partitions: all the partitioned options for the current option
    :return: the augmented set of negative data
    """
    if len(negative_data) == 0:
        negatives = list()
    else:
        negatives = [negative_data]
    for partition in partitions:
        if partition.partition == current_partition:
            continue  # ignore the current one
        negatives.append(partition.states)  # add the others as negatives
    return np.vstack(negatives)


def _learn_precondition(partition: PartitionedOption, negative_samples: np.ndarray,
                        positive_samples: np.ndarray, verbose=False, **kwargs) -> SupportVectorClassifier:
    """
    Learn a single classifier for a partitioned option
    :param partition: the partitioned option
    :param negative_samples: the negative samples
    :param positive_samples: the positive samples
    :param verbose: the verbosity level
    :return: the classifier
    """
    if len(negative_samples) == 0 or len(positive_samples) == 0:
        warn("Need positive and negative samples!")
        return None

    data = np.vstack((positive_samples, negative_samples))
    labels = [1] * len(positive_samples) + [0] * len(negative_samples)

    show("Calculating mask for option {}, partition {} ...".format(partition.option, partition.partition), verbose)

    precondition_mask = _compute_precondition_mask(positive_samples, negative_samples, labels, verbose=verbose,
                                                   **kwargs)
    svm = SupportVectorClassifier(precondition_mask)
    svm.fit(data, labels, verbose=verbose, **kwargs)
    return svm
