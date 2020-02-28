from collections import defaultdict

import gym
import pandas as pd
from gym.spaces import Discrete
import numpy as np
from sklearn.metrics import silhouette_score

from s2s.partitioned_option import PartitionedOption
from s2s.utils import show, pd2np
from typing import List, Dict, Tuple

from sklearn.cluster import DBSCAN

from s2s.union_find import UnionFind

__author__ = 'Steve James and George Konidaris'


def partition_options(env: gym.Env, transition_data: pd.DataFrame,
                      verbose=False, **kwargs) -> Dict[int, List[PartitionedOption]]:
    """
    Partition options so that the subgoal property is approximately preserved
    :param env: the environment
    :param transition_data: all the transition data from the environment
    :param verbose: the mode
    :return: a dictionary mapping each option to its partitions
    """
    if not isinstance(env.action_space, Discrete):
        raise ValueError("Action space must be discrete")

    partitioned_options = dict()
    count = 0
    for option in range(env.action_space.n):

        show('Partitioning option {}'.format(option), verbose)
        # partition based on data from the current option
        partitioned_options[option] = _partition_option(option,
                                                        transition_data.loc[transition_data['option'] == option],
                                                        verbose=verbose, **kwargs)
        count += len(partitioned_options[option])

    show("{} total partitions discovered".format(count), verbose)
    return partitioned_options


def _num_clusters(X: np.ndarray, epsilon: float, min_samples: int) -> int:
    """
    Use the DBSCAN algorithm to determine the number of clusters in the data. Remove any noisy dtaapoints.
    :param X: the data
    :param epsilon: the neighbourhood radius
    :param min_samples: the minimum number of samples in a cluster
    :return: the number of clusters
    """
    labels = set(DBSCAN(eps=epsilon, min_samples=min_samples).fit_predict(X))
    if -1 in labels:
        return len(labels) - 1
    return len(labels)


def _is_overlap_init(A: pd.DataFrame, B: pd.DataFrame, **kwargs):
    epsilon = kwargs.get('init_epsilon', 0.05)
    min_samples = kwargs.get('init_min_samples', 5)
    X = pd2np(A['state'])
    Y = pd2np(B['state'])
    data = np.concatenate((X, Y))
    return _num_clusters(data, epsilon, min_samples) <= max(_num_clusters(X, epsilon, min_samples),
                                                            _num_clusters(Y, epsilon, min_samples))


def _partition_option(option: int, data: pd.DataFrame, verbose=False, **kwargs) -> List[PartitionedOption]:
    """
    Partition an option into ones that approximately possess the subgoal property
    :param option: the option
    :param data: option execution data
    :param verbose: the verbosity level
    :return: a list of partitioned options
    """

    data = data.reset_index(drop=True)  # reset the indices since the data is a subset of the full transition data
    partition_effects = list()
    # extract the masks
    masks = data['mask'].apply(tuple).unique()
    for mask in masks:
        samples = data.loc[_select_where(data['mask'], mask)].reset_index(drop=True)  # get samples with that mask
        clusters = _cluster_effects(samples, mask, verbose=verbose, **kwargs)  # cluster based on effects

        # TODO: this code could be improved/optimised, but will do that another time
        # now check if part of the data for each cluster should be extracted and placed in existing partition (because
        # initiation sets overlap)
        for cluster in clusters:
            new_clusters = list()
            for i, existing_cluster in enumerate(partition_effects):

                existing_shared, new_shared = _merge(existing_cluster, cluster, verbose=verbose, **kwargs)

                if len(np.unique(existing_shared)) > 1:
                    # split out old data
                    reduced_cluster = existing_cluster.loc[np.where(
                        np.logical_not(existing_shared))].reset_index(drop=True)  # the existing cluster loses some data
                    partition_effects[i] = reduced_cluster
                    new_clusters.append(
                        existing_cluster.loc[np.where(existing_shared)].reset_index(
                            drop=True))  # that data gets added to a new cluster

                if len(np.unique(new_shared)) > 1:
                    # split out new data
                    new_clusters.append(
                        cluster.loc[np.where(new_shared)].reset_index(
                            drop=True))  # that data gets added to a new cluster
                    cluster = cluster.loc[np.where(
                        np.logical_not(new_shared))].reset_index(drop=True).reset_index(
                        drop=True)  # the current cluster loses some data

            new_clusters.append(cluster)
            partition_effects.extend(new_clusters)

    show('{} cluster(s) found'.format(len(partition_effects)), verbose)

    # we now have a set of distinct clusters (maximally split), but they may be over-partitioned.
    # Check overlap in initiation sets and merge into probabilistic option if so

    union_find = UnionFind(range(len(partition_effects)))
    for i in range(len(partition_effects) - 1):
        for j in range(i + 1, len(partition_effects)):
            show("Checking clusters {} and {}".format(i, j), verbose)
            if _is_overlap_init(partition_effects[i], partition_effects[j], verbose=verbose, **kwargs):
                # add to union find
                show("\tMerging clusters {} and {}".format(i, j), verbose)
                union_find.merge(i, j)  # these will be merged

    merged_clusters = defaultdict(list)  # groups of merged partitions
    for cluster_idx in union_find:
        group = union_find[cluster_idx]
        merged_clusters[group].append(partition_effects[cluster_idx])

    # now going to store in a data structure
    partitioned_options = list()
    for i, (_, partitions) in enumerate(merged_clusters.items()):
        combined_data = pd.concat(partitions, ignore_index=True)
        partitioned_options.append(PartitionedOption(option, i, combined_data, partitions))

    show('Total partitioned options: {}'.format(len(partitioned_options)), verbose)

    return partitioned_options



def _merge(existing_cluster: pd.DataFrame, new_cluster: pd.DataFrame, verbose=False, **kwargs) -> Tuple[
    np.ndarray, np.ndarray]:
    """
    Given an existing and new cluster, determine whether there is any overlap in their initation sets. Overlapping data
    should be extracted and put into its own cluster
    :param existing_cluster: the existing cluster
    :param new_cluster: the new cluster
    :param verbose: the verbosity level
    :return: two boolean arrays specifying, for the existing and new cluster, which data should be extracted out into
    its own cluster
    """
    # TODO: this code could be improved/optimised, but will do that another time
    epsilon = kwargs.get('init_epsilon', 0.05)
    min_samples = kwargs.get('init_min_samples', 5)
    X = pd2np(existing_cluster['state'])
    Y = pd2np(new_cluster['state'])
    data = np.concatenate((X, Y))
    labels = DBSCAN(eps=epsilon, min_samples=min_samples).fit_predict(data)

    existing_labels = labels[0:len(X)]  # labels of the existing partition data
    new_labels = labels[len(X):]  # labels of the new partition data
    existing_labels_set = set(existing_labels)
    new_labels_set = set(new_labels)

    shared_labels = existing_labels_set.intersection(new_labels_set)
    shared_labels.discard(-1)  # remove noise if present
    existing_shared = np.isin(existing_labels, list(
        shared_labels))  # cast set to list because numpy is stupid https://docs.scipy.org/doc/numpy/reference/generated/numpy.isin.html
    new_shared = np.isin(new_labels, list(
        shared_labels))  # cast set to list because numpy is stupid https://docs.scipy.org/doc/numpy/reference/generated/numpy.isin.html

    # Handle "noise" - count as intersected if the whole group has been subsumed.
    # TODO is this actually necessary?
    if -1 in existing_labels_set and existing_labels_set.issubset(new_labels_set):
        idx = np.where(existing_labels == -1)  # find all points classifies as noise
        existing_shared[idx] = True

    if -1 in new_labels_set and new_labels_set.issubset(existing_labels_set):
        idx = np.where(new_labels == -1)  # find all points classifies as noise
        new_shared[idx] = True

    show("Splitting data from old cluster", verbose and len(np.unique(existing_shared)) > 1)
    show("Splitting data from new cluster", verbose and len(np.unique(new_shared)) > 1)
    return existing_shared, new_shared


def _select_where(column: pd.Series, value) -> List[int]:
    """
    Select the indices from there data that equal the value provided. This is for comparing arrays, since there does not
     seem to be a way to do it in pandas
    :param column: the data to search through
    :param value:the value to check for equality
    :return: the indices where the values match
    """
    return [i for i in range(len(column)) if np.array_equal(column[i], value)]


def _cluster_effects(samples: pd.DataFrame, mask: List[int], verbose=False, **kwargs) -> List[pd.DataFrame]:
    """
    Cluster samples based on their effects
    :param samples: the samples
    :param mask: the state variables modified by the option
    :param verbose: the verbosity level
    :return: a list of data frames, which each element in the list representing a single cluster
    """
    epsilon = kwargs.get('effect_epsilon', 0.05)
    min_samples = kwargs.get('effect_min_samples', 5)
    data = pd2np(samples['next_state'])  # convert to numpy
    masked_data = data[:, mask]  # cluster only on state variables that changed

    db = DBSCAN(eps=epsilon, min_samples=min_samples).fit(masked_data)
    labels = db.labels_
    show("Found {}/{} noisy samples".format((labels == -1).sum(), len(labels)), verbose)
    clusters = list()
    for label in set(labels):
        if label == -1:
            # noise
            continue
        clusters.append(samples.loc[np.where(labels == label)])
    # reset the index back to zero based
    clusters = [cluster.reset_index(drop=True) for cluster in clusters]  # not in place
    return clusters


def _cluster_inits(samples: pd.DataFrame, verbose=False, **kwargs) -> List[pd.DataFrame]:
    """
    Cluster samples based on their initiation sets
    :param samples: the samples
    :param verbose: the verbosity level
    :return: a list of data frames, which each element in the list representing a single cluster
    """
    epsilon = kwargs.get('init_epsilon', 0.03)
    min_samples = kwargs.get('init_min_samples', 3)
    return _cluster_data(samples, 'state', epsilon, min_samples, verbose=verbose)


def _cluster_data(samples: pd.DataFrame, column_name: str, epsilon: float, min_samples: int,
                  verbose=False) -> List[pd.DataFrame]:
    data = samples[column_name]
    # TODO how to get a non object dtype out of pandas???
    db = DBSCAN(eps=epsilon, min_samples=min_samples).fit(pd2np(data))
    labels = db.labels_
    show("Found {}/{} noisy samples".format((labels == -1).sum(), len(labels)), verbose)
    clusters = list()
    for label in set(labels):
        if label == -1:
            # noise
            continue
        clusters.append(samples.loc[np.where(labels == label)])
    # reset the index back to zero based
    clusters = [cluster.reset_index(drop=True) for cluster in clusters]  # not in place
    return clusters
