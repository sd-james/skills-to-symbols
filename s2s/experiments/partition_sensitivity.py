"""
The aim of this experiment is to investigate how changing the partitioning hyperparameters affects the number of
partitions that are discovered. There is no correct answer here, since it is a clustering procedure, so we are just interested
in the variance. We are also interested in the variance due to the random seed (which results in different data being
collected) and the variance due to the total amount of data collected.
"""

import numpy as np
import random

from s2s.core.explore import collect_data
from s2s.env.s2s_env import S2SWrapper
from s2s.env.treasure_game.treasure_game import TreasureGame
from s2s.utils import make_dir, make_path

if __name__ == '__main__':
    np.random.seed(0)
    random.seed(0)

    n_experiments = 20
    max_episodes = 60

    seeds = np.random.randint(0, 10000, (n_experiments,))

    base = 'partition_sensitivity'
    make_dir(base)
    for i, seed in enumerate(seeds):
        print("Collecting data for experiment {}".format(i))
        np.random.seed(seed)
        random.seed(seed)
        env = TreasureGame()
        transition_data, _ = collect_data(S2SWrapper(env, options_per_episode=1000),
                                          max_episode=max_episodes,
                                          verbose=False,
                                          n_jobs=8)
        dir = make_path(base, i)
        transition_data.to_pickle('{}/transition.pkl'.format(dir), compression='gzip')
