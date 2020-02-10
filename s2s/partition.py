import gym
import pandas as pd
from gym.spaces import Discrete
import numpy as np
from s2s.partitioned_option import PartitionedOption
from s2s.utils import show, pd2np
from typing import List, Dict

from sklearn.cluster import DBSCAN


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
    for option in range(env.action_space.n):
        show('Partitioning option {}'.format(option), verbose)
        # partition based on data from the current option
        partitioned_options[option] = _partition_option(option,
                                                        transition_data.loc[transition_data['option'] == option],
                                                        verbose=verbose, **kwargs)
    return partitioned_options


def _partition_option(option: int, data: pd.DataFrame, verbose=False, **kwargs) -> List[PartitionedOption]:
    """
    Partition an option into ones that approximately possess the subgoal property
    :param option: the option
    :param data: option execution data
    :param verbose: the verbosity level
    :return: a list of partitioned options
    """
    # Going to do this slightly differently to the JAIR paper. First, we'll cluster then initiation sets, then split
    # potential probabilistic effects. In the paper, they split effects first, then merged initiation sets post-hoc.
    data = data.reset_index(drop=True)
    init_clusters = _cluster_inits(data, verbose=verbose, **kwargs)
    show("Found {} distinct initation sets".format(len(init_clusters)), verbose)
    partition_effects = list()
    for i, cluster in enumerate(init_clusters):
        # extract the masks
        masks = cluster['mask'].apply(tuple).unique()  # TODO there must be a proper way of doing this
        prob_effects = list()
        for mask in masks:  # get the samples with the mask
            samples = cluster.loc[_select_where(cluster['mask'], mask)]
            prob_effects += _cluster_effects(samples, verbose=verbose, **kwargs)  # cluster based on effects
        show("Cluster {} has {} probabilistic effect(s)".format(i, len(prob_effects)), verbose)
        partition_effects.append(prob_effects)

    # now going to store in a data structure
    partitioned_options = list()
    for i, (cluster, effects) in enumerate(zip(init_clusters, partition_effects)):
        partitioned_options.append(PartitionedOption(option, i, cluster, effects))

    show('Total partitioned options: {}'.format(len(partitioned_options)), verbose)
    return partitioned_options

    # # extract the masks
    # masks = data['mask'].apply(tuple).unique()
    # for mask in masks:
    #     show("Clustering samples for mask {}".format(mask), verbose)
    #     # get the samples with the mask
    #     # TODO there must be a proper way of doing this
    #     samples = transition_data.loc[_select_where(transition_data['mask'], mask)]
    #     clusters = _cluster_effects(samples, verbose=verbose, **kwargs)  # cluster based on effects
    #     show('{} cluster(s) found'.format(len(clusters)), verbose)
    #
    #     # now check if, for each pair, the start states overlap significantly, in which case merge to make a
    #     # probabilistic operator
    #
    #     for i in range(len(clusters) - 1):
    #         for j in range(1, len(clusters)):
    #             # use union find to
    #             if _is_overlap_init(clusters[i], clusters[j], verbose=verbose, **kwargs):
    #                 # add to union find
    #                 # union_find.add(i, j)
    #                 pass
    #     merged_clusters = list()
    #     for i, cluster in enumerate(clusters):
    #         group = union_find.get(i)
    #         cluster.insert(len(cluster.columns))
    #         if i == group:
    #             merged_clusters.append(cluster)
    #         else:
    #             # merge i into group
    #             merged_clusters[group].append(cluster)  # label as different!


def _select_where(column: pd.Series, value) -> List[int]:
    """
    Select the indices from there data that equal the value provided. This is for comparing arrays, since there does not
     seem to be a way to do it in pandas
    :param column: the data to search through
    :param value:the value to check for equality
    :return: the indices where the values match
    """
    return [i for i in range(len(column)) if np.array_equal(column[i], value)]


def _cluster_effects(samples: pd.DataFrame, verbose=False, **kwargs) -> List[pd.DataFrame]:
    """
    Cluster samples based on their effects
    :param samples: the samples
    :param verbose: the verbosity level
    :return: a list of data frames, which each element in the list representing a single cluster
    """
    epsilon = kwargs.get('effect_epsilon', 0.05)
    min_samples = kwargs.get('effect_min_samples', 3)
    return _cluster_data(samples, 'next_state', epsilon, min_samples, verbose=verbose)


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
