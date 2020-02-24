import random

from domain.treasure_game import TreasureGame
from s2s.explore import collect_data
from s2s.partition import partition_options
from s2s.render import visualise_partitions, save_visualised_partitions
from s2s.wrappers import MaxLength, ConditionalAction, ActionExecutable
import numpy as np
import pandas as pd
from s2s.utils import save, load

if __name__ == '__main__':
    np.random.seed(1)
    random.seed(1)

    options_per_episode = 500
    n_episodes = 40
    env = TreasureGame()
    env = ConditionalAction(env)  # support actions that are not executable everywhere
    env = MaxLength(env, options_per_episode)  # restrict episode lengths
    env = ActionExecutable(env)  # determine at each state which actions/options are executable
    #
    # transition_data, initiation_data = collect_data(env, max_episode=n_episodes, verbose=True, n_processes=8)
    # transition_data.to_pickle('data/transition.pkl', compression='gzip')
    # initiation_data.to_pickle('data/init.pkl', compression='gzip')

    transition_data = pd.read_pickle('data/transition.pkl', compression='gzip')
    initiation_data = pd.read_pickle('data/init.pkl', compression='gzip')

    # partitions = partition_options(env, transition_data, verbose=True)
    # save(partitions, 'data/partitions.pkl')
    partitions = load('data/partitions.pkl')

    env = TreasureGame()
    # vis_partitions = visualise_partitions(env, partitions, verbose=True)
    # save(vis_partitions)
    vis_partitions = load()
    save_visualised_partitions('data/vis_partitions', vis_partitions, verbose=True,
                               option_descriptor=lambda option: env.option_names[option])

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
