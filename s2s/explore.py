import pandas as pd
import gym
import numpy as np

from s2s.utils import show

__author__ = 'Steve James and George Konidaris'


def collect_data(env: gym.Env, max_timestep=np.inf, max_episode=np.inf, verbose=False) -> (pd.DataFrame, pd.DataFrame):
    """
    Collect data from the environment through uniform random exploration
    :param env: the environment
    :param max_timestep: the maximum number of timesteps. Default is infinity
    :param max_episode: the maximum number of episodes. Default is infinity
    :param verbose: whether to print additional information
    :return: data frames holding transition and initation data
    """
    if max_timestep == np.inf and max_episode == np.inf:
        raise ValueError('Must specify at least a maximum timestep or episode limit')

    transition_data = pd.DataFrame(columns=['episode', 'state', 'option', 'reward', 'next_state', 'done', 'mask'])
    initiation_data = pd.DataFrame(columns=['state', 'option', 'can_execute'])

    n_episode = 0
    n_timesteps = 0
    while n_episode < max_episode and n_timesteps < max_timestep:
        show('Running episode {}'.format(n_episode), verbose)
        state = env.reset()
        done = False
        while not done:
            action = env.action_space.sample()
            next_state, reward, done, info = env.step(action)
            can_execute = not 'option_failed' in info
            # timestep only counts if we actually executed an option
            if can_execute:
                n_timesteps += 1
                mask = np.where(state != next_state)[0]
                transition_data.loc[len(transition_data)] = [n_episode, state, action, reward, next_state, done, mask]
            initiation_data.loc[len(initiation_data)] = [state, action, can_execute]
            if done or n_timesteps >= max_timestep:
                break
            state = next_state
        n_episode += 1
    return transition_data, initiation_data
