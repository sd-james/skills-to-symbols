import random

import time

from domain.treasure_game import TreasureGame
from s2s.build_pddl import build_pddl
from s2s.env import S2SWrapper
from s2s.explore import collect_data
from s2s.learn_operators import learn_preconditions, learn_effects, combine_learned_operators
from s2s.partition import partition_options
from s2s.pddl.domain_description import PDDLDomain
from s2s.pddl.problem_description import PDDLProblem
from s2s.pddl.proposition import Proposition
from s2s.render import visualise_partitions, save_visualised_partitions, visualise_symbols
from s2s.wrappers import MaxLength, ConditionalAction, ActionExecutable
import numpy as np
import pandas as pd
from s2s.utils import save, load, pd2np

if __name__ == '__main__':
    np.random.seed(0)
    random.seed(0)

    options_per_episode = 1000
    n_episodes = 40
    env = TreasureGame()

    millis = int(round(time.time() * 1000))

    # transition_data, initiation_data = collect_data(S2SWrapper(env, 1000), max_episode=n_episodes, verbose=True,
    #                                                 n_jobs=8)
    # transition_data.to_pickle('full_run/transition.pkl', compression='gzip')
    # initiation_data.to_pickle('full_run/init.pkl', compression='gzip')

    transition_data = pd.read_pickle('full_run/orig_data.pkl', compression='gzip')
    initiation_data = pd.read_pickle('full_run/orig_init_data.pkl', compression='gzip')

    partitions = partition_options(env, transition_data, verbose=True)
    save(partitions, 'full_run/partitions.pkl')
    partitions = load('full_run/partitions.pkl')

    # TODO: Fix slow :(
    # vis_partitions = visualise_partitions(env, partitions, verbose=True)
    # save_visualised_partitions('full_run/vis_partitions', vis_partitions, verbose=True,
    #                            option_descriptor=lambda option: env.option_names[option])

    #
    preconditions = learn_preconditions(env, initiation_data, partitions, verbose=True, n_jobs=8,
                                        max_precondition_samples=10000)
    save(preconditions, 'full_run/preconditions.pkl')
    preconditions = load('full_run/preconditions.pkl')

    effects = learn_effects(env, partitions, verbose=True, n_jobs=8)
    save(effects, 'full_run/effects.pkl')
    effects = load('full_run/effects.pkl')
    operators = combine_learned_operators(env, partitions, preconditions, effects)
    save(operators, 'full_run/operators.pkl')

    # generate vocabulary
    vocabulary, schemata = build_pddl(env, transition_data, operators, verbose=True, n_jobs=8)
    print(len(operators))

    save(vocabulary, 'full_run/predicates.pkl')
    save(schemata, 'full_run/schemata.pkl')

    schemata = load('full_run/schemata.pkl')
    vocabulary = load('full_run/predicates.pkl')

    # visualise_symbols('full_run/vis_symbols', env, vocabulary, verbose=True, render=env.render_symbol_states)

    pddl = PDDLDomain(env, vocabulary, schemata)
    save(pddl, 'full_run/domain.pddl', binary=False)
    print(pddl)

    pddl_problem = PDDLProblem('test', env.name)

    pddl_problem.add_start_proposition(Proposition.not_failed())
    for prop in vocabulary.start_predicates:
        pddl_problem.add_start_proposition(prop)
    pddl_problem.add_goal_proposition(Proposition.not_failed())
    pddl_problem.add_goal_proposition(vocabulary._list[-1])
    print(pddl_problem)

    print('\n\nBuilding PDDL took {} ms'.format(int(round(time.time() * 1000)) - millis))
