import os
import random
import time

import numpy as np
from gym.spaces import Discrete, Box

from domain import mine_domain_drawer
from domain.mine_domain import create_options
from domain.mine_domain import mine_domain
from s2s.env import S2SEnv
from s2s.utils import make_path


class TreasureGame(S2SEnv):
    def __init__(self, force_render=False, fast_render=True):

        dir = os.path.dirname(os.path.realpath(__file__))

        self._env = mine_domain(make_path(dir, 'domain.txt'), make_path(dir, 'domain-objects.txt'),
                                make_path(dir, 'domain-interactions.txt'))
        self.drawer = None

        self.option_list, self.option_names = create_options(self._env)
        self.action_space = Discrete(len(self.option_list))
        s = self._env.get_state()
        self.observation_space = Box(0, 1, shape=(len(s),))
        self.force_render = force_render
        self.fast_render = fast_render

    def reset(self):
        dir = os.path.dirname(os.path.realpath(__file__))

        self._env = mine_domain(make_path(dir, 'domain.txt'), make_path(dir, 'domain-objects.txt'),
                                make_path(dir, 'domain-interactions.txt'))
        if self.force_render:
            self.drawer = mine_domain_drawer.drawer(self._env)
        temp = None if self.fast_render else self.drawer
        self.option_list, self.option_names = create_options(self._env, temp)
        return self._env.get_state()

    @property
    def available_mask(self):
        return np.array([int(o.can_run()) for o in self.option_list])

    def step(self, action):
        option = self.option_list[action]
        r = option.run()
        state = self._env.get_state()
        done = self._env.player_got_goldcoin()
        return state, r, done, {}

    def render(self, mode='human'):

        if self.drawer is None:
            self.drawer = mine_domain_drawer.drawer(self._env)

        self.drawer.draw_domain()
        return self.drawer.screen


if __name__ == '__main__':

    env = TreasureGame()

    random.seed(0)
    np.random.seed(0)

    for i in range(5):
        state = env.reset()
        env.render()
        done = False
        j = 0
        while not done:
            print(j)
            action = np.random.choice(np.arange(env.action_space.n), p=env.available_mask / env.available_mask.sum())
            state, reward, done, _ = env.step(action)
            # print(state)
            # print(reward)
            # print(done)
            # print()
            env.render()
            time.sleep(0.05)
            j += 1
