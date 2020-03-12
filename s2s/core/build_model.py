import random
import time
from typing import Tuple

import numpy as np
from gym.spaces import Discrete

from s2s.core.build_pddl import build_pddl, find_goal_symbols
from s2s.core.explore import collect_data
from s2s.core.learn_operators import learn_preconditions, learn_effects, combine_learned_operators
from s2s.core.partition import partition_options
from s2s.env.s2s_env import S2SEnv, S2SWrapper
from s2s.pddl.domain_description import PDDLDomain
from s2s.pddl.problem_description import PDDLProblem
from s2s.pddl.proposition import Proposition
from s2s.render import visualise_partitions, visualise_symbols
from s2s.utils import save, make_dir, show, load

__author__ = 'Steve James and George Konidaris'


def build_model(env: S2SEnv,
                seed=None,
                n_episodes=40,
                options_per_episode=1000,
                n_jobs=1,
                save_dir=None,
                visualise=False,
                verbose=False,
                **kwargs) -> Tuple[PDDLDomain, PDDLProblem]:
    """
    Build a PDDL model from an environment
    :param env: the environment
    :param seed: the random seed, if any
    :param n_episodes: the number of episodes to collect data
    :param options_per_episode: the number of options to execute per episode
    :param n_jobs: the number of CPU cores to execute on
    :param save_dir: the directory to save data to, if any
    :param visualise: whether to visualise the data
    :param verbose: whether to output logging info
    :return the PDDL description and problem
    """

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
    effects = learn_effects(partitions, verbose=verbose, n_jobs=n_jobs, **kwargs)
    operators = combine_learned_operators(env, partitions, preconditions, effects)

    # 5. Build PDDL
    factors, vocabulary, schemata = build_pddl(env, transition_data, operators, verbose=verbose, n_jobs=n_jobs,
                                               **kwargs)
    pddl = PDDLDomain(env, vocabulary, schemata)

    # 6. Build PDDL problem file
    pddl_problem = PDDLProblem('{}-problem'.format(env.name), env.name)
    pddl_problem.add_start_proposition(Proposition.not_failed())
    for prop in vocabulary.start_predicates:
        pddl_problem.add_start_proposition(prop)

    goal_prob, goal_symbols = find_goal_symbols(factors, vocabulary, transition_data, verbose=verbose, **kwargs)
    pddl_problem.add_goal_proposition(Proposition.not_failed())
    for prop in vocabulary.goal_predicates + goal_symbols:
        pddl_problem.add_goal_proposition(prop)

    show('\n\nBuilding PDDL took {} ms'.format(int(round(time.time() * 1000)) - millis), verbose)

    if save_dir is not None:
        show("Saving data in {}...".format(save_dir), verbose)
        make_dir(save_dir)
        transition_data.to_pickle('{}/transition.pkl'.format(save_dir), compression='gzip')
        initiation_data.to_pickle('{}/init.pkl'.format(save_dir), compression='gzip')
        save(partitions, '{}/partitions.pkl'.format(save_dir))
        save(preconditions, '{}/preconditions.pkl'.format(save_dir))
        save(effects, '{}/effects.pkl'.format(save_dir))
        save(operators, '{}/operators.pkl'.format(save_dir))
        save(factors, '{}/factors.pkl'.format(save_dir))
        save(vocabulary, '{}/predicates.pkl'.format(save_dir))
        save(schemata, '{}/schemata.pkl'.format(save_dir))
        save(pddl, '{}/domain.pddl'.format(save_dir), binary=False)
        save(pddl_problem, '{}/problem.pddl'.format(save_dir), binary=False)

        if visualise:
            show("Visualising data (this may take time)...", verbose)
            # TODO: Fix slow :(
            visualise_partitions('{}/vis_partitions'.format(save_dir), env, partitions, verbose=verbose,
                                 option_descriptor=lambda option: env.describe_option(option))
            visualise_symbols('{}/vis_symbols'.format(save_dir), env, vocabulary, verbose=True,
                              render=env.render_states)

    return pddl, pddl_problem
