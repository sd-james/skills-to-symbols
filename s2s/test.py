from typing import List, Dict, Tuple

import gym
import numpy as np
import pandas as pd

from s2s.svr import SupportVectorRegressor
from s2s.utils import pd2np
from s2s.kde import KernelDensityEstimator
from s2s.learn_operators import learn_preconditions, learn_effects
from s2s.partitioned_option import PartitionedOption
from s2s.utils import show, load, save


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

    preconditions = learn_preconditions(env, initiation_data, partitions, verbose=True)
    save(preconditions, 'preconditions.pkl')

    effects = learn_effects(env, partitions, verbose=True)
    save(effects, 'effects.pkl')
