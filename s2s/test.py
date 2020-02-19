import random

from domain.treasure_game import TreasureGame
from s2s.explore import collect_data
from s2s.partition import partition_options
from s2s.wrappers import MaxLength, ConditionalAction, ActionExecutable
import numpy as np
import pandas as pd

if __name__ == '__main__':

    np.random.seed(0)
    random.seed(0)

    options_per_episode = 1000
    n_episodes = 100
    env = TreasureGame(force_render=True, fast_render=False)
    env = ConditionalAction(env)
    env = MaxLength(env, options_per_episode)  # as in the JAIR paper
    env = ActionExecutable(env)
    #
    transition_data, initiation_data = collect_data(env, max_episode=n_episodes, verbose=True, n_processes=4)
    transition_data.to_pickle('data/transition.pkl', compression='gzip')
    initiation_data.to_pickle('data/init.pkl', compression='gzip')

    transition_data = pd.read_pickle('data/transition.pkl', compression='gzip')
    initiation_data = pd.read_pickle('data/init.pkl', compression='gzip')

    # partitions = partition_options(env, transition_data, verbose=True)
    # save(partitions, 'data/partitions.pkl')
    # partitions = load('data/partitions.pkl')
    #
    # # preconditions = learn_preconditions(env, initiation_data, partitions, verbose=True)
    # # save(preconditions, 'data/preconditions.pkl')
    # preconditions = load('data/preconditions.pkl')
    # #
    # # effects = learn_effects(env, partitions, verbose=True)
    # # save(effects, 'data/effects.pkl')
    # effects = load('data/effects.pkl')
    #
    # operators = combine_learned_operators(env, partitions, preconditions, effects)
    #
    # # # generate vocabulary
    # import time
    #
    # millis = int(round(time.time() * 1000))
    # vocabulary, operators = build_pddl(env, transition_data, operators)
    # print(len(operators))
    # print('{} ms'.format(int(round(time.time() * 1000)) - millis))
    # save(vocabulary, 'data/predicates.pkl')
    # save(operators, 'data/operators.pkl')
    # propositions_dir = make_path(task_dir, 'propositions')
    # (factors, _), (option_symbols, symbol_list) = generate_symbol_vocabulary(env, propositions_dir,
    #                                                                          operators, n_objects, init_obs)
