import random

from domain.treasure_game import TreasureGame
from s2s.build_pddl import build_pddl
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
from s2s.utils import save, load


if __name__ == '__main__':
    np.random.seed(1)
    random.seed(1)

    options_per_episode = 1000
    n_episodes = 40
    env = TreasureGame()
    wrapper = ConditionalAction(env)  # support actions that are not executable everywhere
    wrapper = MaxLength(wrapper, options_per_episode)  # restrict episode lengths
    wrapper = ActionExecutable(wrapper)  # determine at each state which actions/options are executable

    # transition_data, initiation_data = collect_data(wrapper, max_episode=n_episodes, verbose=True, n_jobs=8)
    # transition_data.to_pickle('data/transition.pkl', compression='gzip')
    # initiation_data.to_pickle('data/init.pkl', compression='gzip')

    transition_data = pd.read_pickle('data/orig_data.pkl', compression='gzip')
    initiation_data = pd.read_pickle('data/orig_init_data.pkl', compression='gzip')
    #
    # partitions = partition_options(env, transition_data, verbose=True)
    # save(partitions, 'data/partitions.pkl')
    partitions = load('data/partitions.pkl')

    # TODO: Fix slow :(
    # vis_partitions = visualise_partitions(env, partitions, verbose=True)
    # save_visualised_partitions('data/vis_partitions', vis_partitions, verbose=True,
    #                            option_descriptor=lambda option: env.option_names[option])

    #
    # preconditions = learn_preconditions(env, initiation_data, partitions, verbose=True, n_jobs=6,
    #                                     max_precondition_samples=10000)
    # save(preconditions, 'data/preconditions.pkl')
    preconditions = load('data/preconditions.pkl')

    # effects = learn_effects(env, partitions, verbose=True, n_jobs=7)
    # save(effects, 'data/effects.pkl')
    effects = load('data/effects.pkl')
    # #
    operators = combine_learned_operators(env, partitions, preconditions, effects)
    save(operators, 'data/operators.pkl')
    #
    # # generate vocabulary
    import time

    # millis = int(round(time.time() * 1000))
    # vocabulary, schemata = build_pddl(env, transition_data, operators, verbose=True, n_jobs=8)
    # print(len(operators))
    # print('Building PDDL took {} ms'.format(int(round(time.time() * 1000)) - millis))
    # save(vocabulary, 'data/predicates.pkl')
    # save(schemata, 'data/schemata.pkl')

    vocabulary = load('data/predicates.pkl')
    # visualise_symbols('data/vis_symbols', env, vocabulary, verbose=True, render=env.render_symbol_states)

    schemata = load('data/schemata.pkl')

    # pddl = PDDLDomain(env, vocabulary, schemata)
    # save(pddl, 'data/domain.pddl', binary=False)
    # print(pddl)
    #
    pddl_problem = PDDLProblem('test', env.name)
    pddl_problem.add_start_proposition(Proposition.not_failed())
    pddl_problem.add_goal_proposition(Proposition.not_failed())
    pddl_problem.add_goal_proposition(vocabulary._list[-1])
    vars = set()
    for symbol in vocabulary:
        mask = symbol.mask
        if not any(m in vars for m in mask):
            pddl_problem.add_start_proposition(symbol)
            vars.update(mask)
            if len(vars) == env.observation_space.shape[0]:
                break
    print(pddl_problem)






