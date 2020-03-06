import random
import time

import numpy as np
import pandas as pd

from s2s.core.build_pddl import build_pddl
from s2s.env.s2s_env import S2SEnv, S2SWrapper
from s2s.env.treasure_game.treasure_game import TreasureGame
from s2s.core.explore import collect_data
from s2s.core.learn_operators import learn_preconditions, learn_effects, combine_learned_operators
from s2s.core.partition import partition_options
from s2s.pddl.domain_description import PDDLDomain
from s2s.pddl.problem_description import PDDLProblem
from s2s.pddl.proposition import Proposition
from s2s.render import visualise_partitions, visualise_symbols
from s2s.utils import save, make_dir, show

if __name__ == '__main__':
    np.random.seed(0)
    random.seed(0)

    options_per_episode = 1000
    n_episodes = 40
    env = TreasureGame()

    millis = int(round(time.time() * 1000))

    make_dir('test')
    transition_data, initiation_data = collect_data(S2SWrapper(env, 1000), max_episode=n_episodes, verbose=True,
                                                    n_jobs=7)
    transition_data.to_pickle('test/transition.pkl', compression='gzip')
    initiation_data.to_pickle('test/init.pkl', compression='gzip')

    print('\n\nTime to collect took {} ms'.format(int(round(time.time() * 1000)) - millis))
    #
    # transition_data = pd.read_pickle('full_run/transition.pkl', compression='gzip')
    # initiation_data = pd.read_pickle('full_run/init.pkl', compression='gzip')

    partitions = partition_options(env, transition_data, verbose=True)
    save(partitions, 'test/partitions.pkl')

    exit(0)

    partitions = load('test/partitions.pkl')

    # TODO: Fix slow :(
    visualise_partitions('full_run/vis_partitions', env, partitions, verbose=True,
                                          option_descriptor=lambda option: env.option_names[option])

    exit(0)

    preconditions = learn_preconditions(env, initiation_data, partitions, verbose=True, n_jobs=8,
                                        max_precondition_samples=10000)
    save(preconditions, 'full_run/new-preconditions.pkl')

    preconditions = load('full_run/new-preconditions.pkl')

    effects = learn_effects(partitions, verbose=True, n_jobs=1)
    save(effects, 'full_run/new-effects.pkl')

    effects = load('full_run/new-effects.pkl')
    operators = combine_learned_operators(env, partitions, preconditions, effects)
    save(operators, 'full_run/new-operators.pkl')

    operators = load('full_run/new-operators.pkl')

    # generate vocabulary
    vocabulary, schemata = build_pddl(env, transition_data, operators, verbose=True, n_jobs=8)

    #
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
    for prop in vocabulary.goal_predicates:
        pddl_problem.add_goal_proposition(prop)

    print(pddl_problem)

    save(pddl_problem, 'full_run/problem.pddl', binary=False)

    print('\n\nBuilding PDDL took {} ms'.format(int(round(time.time() * 1000)) - millis))
