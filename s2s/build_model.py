import random
import time

import numpy as np
from gym.spaces import Discrete

from domain.treasure_game import TreasureGame
from s2s.build_pddl import build_pddl
from s2s.env import S2SWrapper, S2SEnv
from s2s.explore import collect_data
from s2s.learn_operators import learn_preconditions, learn_effects, combine_learned_operators
from s2s.partition import partition_options
from s2s.pddl.domain_description import PDDLDomain
from s2s.pddl.problem_description import PDDLProblem
from s2s.pddl.proposition import Proposition
from s2s.render import visualise_partitions, visualise_symbols
from s2s.utils import save, make_dir, show


def build_model(env: S2SEnv,
                seed=None,
                n_episodes=40,
                options_per_episode=1000,
                n_jobs=1,
                save_dir=None,
                visualise=False,
                verbose=False,
                **kwargs):

    assert isinstance(env.action_space, Discrete)

    if seed is not None:
        np.random.seed(0)
        random.seed(0)

    millis = int(round(time.time() * 1000))

    # 1. Collect data
    transition_data, initiation_data = collect_data(S2SWrapper(env, options_per_episode),
                                                    max_episode=n_episodes,
                                                    verbose=verbose,
                                                    n_jobs=n_jobs,
                                                    **kwargs)

    show('\n\nTime to collect took {} ms'.format(int(round(time.time() * 1000)) - millis), verbose)

    # 2. Partition options
    partitions = partition_options(env,
                                   transition_data,
                                   verbose=verbose,
                                   **kwargs)

    # 3. Estimate preconditions
    preconditions = learn_preconditions(env,
                                        initiation_data,
                                        partitions,
                                        verbose=verbose,
                                        n_jobs=n_jobs,
                                        **kwargs)

    # 4. Estimate effects
    effects = learn_effects(env, partitions, verbose=verbose, n_jobs=n_jobs, **kwargs)
    operators = combine_learned_operators(env, partitions, preconditions, effects)

    # 5. Build PDDL
    vocabulary, schemata = build_pddl(env, transition_data, operators, verbose=verbose, n_jobs=n_jobs, **kwargs)
    pddl = PDDLDomain(env, vocabulary, schemata)

    pddl_problem = PDDLProblem('{}-problem'.format(env.name), env.name)
    pddl_problem.add_start_proposition(Proposition.not_failed())
    for prop in vocabulary.start_predicates:
        pddl_problem.add_start_proposition(prop)

    pddl_problem.add_goal_proposition(Proposition.not_failed())
    for prop in vocabulary.goal_predicates:
        pddl_problem.add_goal_proposition(prop)

    show('\n\nBuilding PDDL took {} ms'.format(int(round(time.time() * 1000)) - millis), verbose)

    if save_dir is not None:
        show("Saving data in {}...".format(save_dir), verbose)
        make_dir(save_dir)
        transition_data.to_pickle('{}}/transition.pkl'.format(save_dir), compression='gzip')
        initiation_data.to_pickle('{}/init.pkl'.format(save_dir), compression='gzip')
        save(partitions, '{}}/partitions.pkl'.format(save_dir))
        save(preconditions, '{}/preconditions.pkl'.format(save_dir))
        save(effects, '{}/effects.pkl'.format(save_dir))
        save(operators, '{}/operators.pkl'.format(save_dir))
        save(vocabulary, '{}/predicates.pkl'.format(save_dir))
        save(schemata, '{}/schemata.pkl'.format(save_dir))
        save(pddl, '{}/domain.pddl'.format(save_dir), binary=False)
        save(pddl_problem, '{}/problem.pddl'.format(save_dir), binary=False)

        if visualise:
            show("Visualising data...", verbose)
            # TODO: Fix slow :(
            visualise_partitions('{}}/vis_partitions'.format(save_dir), env, partitions, verbose=verbose,
                                 option_descriptor=lambda option: env.describe_option(option))
            visualise_symbols('full_run/vis_symbols', env, vocabulary, verbose=True, render=env.render_symbol_states)

    return pddl, pddl_problem


if __name__ == '__main__':
    env = TreasureGame()
    domain, problem = build_model(env)
    print(domain)
    print(problem)