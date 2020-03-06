import multiprocessing
import random
from functools import partial

import numpy as np
import pandas as pd

from s2s.env.s2s_env import S2SWrapper
from s2s.utils import show, run_parallel

__author__ = 'Steve James and George Konidaris'


def collect_data(env: S2SWrapper, max_timestep=np.inf, max_episode=np.inf, verbose=False, seed=None, n_jobs=1,
                 **kwargs) -> (
        pd.DataFrame, pd.DataFrame):
    """
    Collect data from the environment through uniform random exploration in parallel

    :param env: the environment
    :param max_timestep: the maximum number of timesteps in total (not to be confused with maximum time steps per episode) Default is infinity
    :param max_episode: the maximum number of episodes. Default is infinity
    :param verbose: whether to print additional information
    :param seed: the random seed. Use for reproducibility
    :param n_jobs: the number of processes to spawn to collect data in parallel. If -1, use all CPUs
    :return: data frames holding transition and initation data
    """
    if max_timestep == np.inf and max_episode == np.inf:
        raise ValueError('Must specify at least a maximum timestep or episode limit')

    if seed is not None:
        random.seed(seed)
        np.random.seed(seed)

    if n_jobs == -1:
        n_jobs = multiprocessing.cpu_count()

    # run collection in parallel
    max_timestep /= n_jobs
    max_episode /= n_jobs

    functions = [
        partial(_collect_data, env, np.random.randint(0, 1000000), max_timestep, max_episode, verbose,
                int(max_episode * i))
        for i in range(n_jobs)]

    results = run_parallel(functions)
    transition_data = pd.concat([x[0] for x in results], ignore_index=True)
    initiation_data = pd.concat([x[1] for x in results], ignore_index=True)
    return transition_data, initiation_data


def _collect_data(env: S2SWrapper, seed=None, max_timestep=np.inf, max_episode=np.inf, verbose=False,
                  episode_offset=0) -> (
        pd.DataFrame, pd.DataFrame):
    """
    Collect data from the environment through uniform random exploration
    :param env: the environment
    :param seed: the random seed. Use for reproducibility
    :param max_timestep: the maximum number of timesteps in total (not to be confused with maximum time steps per episode) Default is infinity
    :param max_episode: the maximum number of episodes. Default is infinity
    :param verbose: whether to print additional information
    :return: data frames holding transition and initation data
    """

    if seed is not None:
        random.seed(seed)
        np.random.seed(seed)

    transition_data = pd.DataFrame(
        columns=['episode', 'state', 'option', 'reward', 'next_state', 'done', 'mask', 'next_options'])
    initiation_data = pd.DataFrame(columns=['state', 'option', 'can_execute'])

    n_episode = 0
    n_timesteps = 0
    while n_episode < max_episode and n_timesteps < max_timestep:
        show('Running episode {}'.format(n_episode + episode_offset), verbose)
        state = env.reset()
        done = False
        ep_timestep = 0
        while not done:
            action = env.sample_action()
            next_state, reward, done, info = env.step(action)
            failed = info.get('option_failed', False)
            # timestep only counts if we actually executed an option
            if not failed:
                n_timesteps += 1
                mask = np.where(np.array(state) != np.array(next_state))[0]  # check which indices are not equal!
                next_options = info.get('next_actions', np.array([]))

                # the max length wrapper might set it to done and we have not succeeded
                success = done and info.get('goal_achieved', False)

                if success:
                    done = False  # we're going to keep going until we run out of time!

                transition_data.loc[len(transition_data)] = [n_episode + episode_offset, state, action,
                                                             reward, next_state, success, mask,
                                                             next_options]
                ep_timestep += 1
            if 'current_actions' in info:
                # the set of options that could or could not be executed
                for i, label in enumerate(info['current_actions']):
                    initiation_data.loc[len(initiation_data)] = [state, i, bool(label)]
            else:
                # just use the information we have
                initiation_data.loc[len(initiation_data)] = [state, action, not failed]

            show('\tStep: {}'.format(ep_timestep), verbose and ep_timestep > 0 and ep_timestep % 50 == 0)

            if done or n_timesteps >= max_timestep:
                break
            state = next_state
        n_episode += 1
    return transition_data, initiation_data
