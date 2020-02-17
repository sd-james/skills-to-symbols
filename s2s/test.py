import itertools

import gym
import numpy as np
import pandas as pd

from s2s.build_pddl import build_pddl
from s2s.estimators.kde import KernelDensityEstimator
from s2s.learn_operators import combine_learned_operators, learn_preconditions, learn_effects
from s2s.partition import partition_options
from s2s.utils import load, pd2np, show, save

if __name__ == '__main__':
    # start_factors = [[0, 1], [1,2], [2, 3]]
    #
    # for length in range(1, len(start_factors)):
    #     for subset in itertools.combinations(start_factors, length):
    #
    #         print(subset)

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
    # save(partitions, 'data/partitions.pkl')
    partitions = load('data/partitions.pkl')

    # preconditions = learn_preconditions(env, initiation_data, partitions, verbose=True)
    # save(preconditions, 'data/preconditions.pkl')
    preconditions = load('data/preconditions.pkl')
    #
    # effects = learn_effects(env, partitions, verbose=True)
    # save(effects, 'data/effects.pkl')
    effects = load('data/effects.pkl')

    operators = combine_learned_operators(env, partitions, preconditions, effects)

    # # generate vocabulary
    import time

    millis = int(round(time.time() * 1000))
    vocabulary, operators = build_pddl(env, transition_data, operators)
    print(len(operators))
    print('{} ms'.format(int(round(time.time() * 1000)) - millis))
    # save(vocabulary, 'data/predicates.pkl')
    # save(operators, 'data/operators.pkl')
    # propositions_dir = make_path(task_dir, 'propositions')
    # (factors, _), (option_symbols, symbol_list) = generate_symbol_vocabulary(env, propositions_dir,
    #                                                                          operators, n_objects, init_obs)
