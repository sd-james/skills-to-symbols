from functools import partial
from typing import List, Dict, Tuple
from warnings import warn
from collections import ChainMap

import gym
import numpy as np
import pandas as pd

from s2s.learned_operator import LearnedOperator
from s2s.estimators.kde import KernelDensityEstimator
from s2s.estimators.svc import SupportVectorClassifier
from s2s.estimators.svr import SupportVectorRegressor
from s2s.feature_selection import _compute_precondition_mask
from s2s.partitioned_option import PartitionedOption
from s2s.utils import show, pd2np, run_parallel

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
    n_jobs = kwargs.get('n_jobs', 1)
    show("Running on {} CPUs".format(n_jobs), verbose)
    splits = np.array_split(range(env.action_space.n), n_jobs)
    functions = [
        partial(_learn_effects, splits[i], partitioned_options, verbose, **kwargs)
        for i in range(n_jobs)]
    # run in parallel
    effects: List[
        Dict[Tuple[int, int], List[Tuple[float, KernelDensityEstimator, SupportVectorRegressor]]]] = run_parallel(
        functions)
    return dict(ChainMap(*effects))  # reduce to single dict


def _learn_effects(options: List[int], partitioned_options: Dict[int, List[PartitionedOption]],
                   verbose=False, **kwargs) \
        -> Dict[Tuple[int, int], List[Tuple[float, KernelDensityEstimator, SupportVectorRegressor]]]:
    effects = dict()
    for option in options:

        for i, partition in enumerate(partitioned_options[option]):

            show("Calculating effects for option {}, partition {}:".format(option, i), verbose)

            probabilistic_outcomes = list()  # a list of tuples (prob, effect estimator, reward estimator)

            for j, (prob, states, rewards, next_states, masks) in enumerate(partition.effects()):
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
                reward_estimator.fit(states, rewards, verbose=verbose, **kwargs)  # estimate the reward
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
    n_jobs = kwargs.get('n_jobs', 1)
    show("Running on {} CPUs".format(n_jobs), verbose)
    splits = np.array_split(range(env.action_space.n), n_jobs)
    functions = [
        partial(_learn_preconditions, splits[i], init_data, partitioned_options, verbose, **kwargs)
        for i in range(n_jobs)]
    # run in parallel
    preconditions: List[Dict[Tuple[int, int], SupportVectorClassifier]] = run_parallel(functions)
    return dict(ChainMap(*preconditions))  # reduce to single dict


def _learn_preconditions(options: List[int], init_data: pd.DataFrame,
                         partitioned_options: Dict[int, List[PartitionedOption]],
                         verbose=False, **kwargs) -> Dict[Tuple[int, int], SupportVectorClassifier]:
    preconditions = dict()
    for option in options:

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
            break
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

    show("Calculating mask for option {}, partition {} ...".format(partition.option, partition.partition), verbose)

    # the max number of samples to use for computing the mask
    max_precondition_samples = kwargs.get('max_precondition_samples', np.inf)
    # resample if too much data
    positive_samples, negative_samples = _resample(positive_samples, negative_samples, max_precondition_samples)
    labels = [1] * len(positive_samples) + [0] * len(negative_samples)

    precondition_mask = _compute_precondition_mask(positive_samples, negative_samples, labels, verbose=verbose,
                                                   **kwargs)
    svm = SupportVectorClassifier(precondition_mask)
    data = np.vstack((positive_samples, negative_samples))
    svm.fit(data, labels, verbose=verbose, **kwargs)
    return svm


def _resample(positive_samples: np.ndarray, negative_samples: np.ndarray, max_samples: int) -> Tuple[
    np.ndarray, np.ndarray]:
    """
    Resample the data so the total is less than the maximum number of samples. Maintain the ratio
    :param positive_samples: the positive samples
    :param negative_samples: the negative samples
    :param max_samples: the total number of samples required
    :return: a subset of the initial samples, with their ratios maintained
    """
    n_samples = len(negative_samples) + len(positive_samples)
    if n_samples > max_samples:

        if len(positive_samples) < 10:
            # very little data. Don't lose it!
            n_positive = len(positive_samples)
            n_negative = max_samples - n_positive
        else:
            # resample but maintain ratio
            n_negative = round(max_samples * len(negative_samples) / n_samples)
            n_positive = max_samples - n_negative
        positive_samples = positive_samples[
            np.random.choice(len(positive_samples), n_positive, replace=False)]
        negative_samples = negative_samples[
            np.random.choice(len(negative_samples), n_negative, replace=False)]

        if len(positive_samples) + len(negative_samples) != max_samples:
            raise ValueError("Resampling went wrong!")

    return positive_samples, negative_samples
