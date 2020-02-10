from typing import List, Dict, Tuple

import gym
import numpy as np
import pandas as pd

from s2s.partitioned_option import PartitionedOption
from s2s.svc import SVM
from s2s.utils import show, load, pd2np


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
                      partitions: List[PartitionedOption]) -> pd.Series:
    for partition in partitions:
        if partition.partition == current_partition:
            continue
        negative_data = negative_data.append(partition.states, ignore_index=True)
    return negative_data


def _learn_precondition(env: gym.Env, partition: PartitionedOption, negative_samples: np.ndarray,
                        positive_samples: np.ndarray, verbose=False, **kwargs) -> SVM:
    return None


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
