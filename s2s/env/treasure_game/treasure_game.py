import os

import numpy as np
import pygame
from gym.envs.classic_control import rendering
from gym.spaces import Discrete, Box

from s2s.env.s2s_env import S2SEnv
from s2s.env.treasure_game._treasure_game_impl._objects import goldcoin, handle, key, bolt
from s2s.env.treasure_game._treasure_game_impl._treasure_game_drawer import _TreasureGameDrawer
from s2s.env.treasure_game._treasure_game_impl._treasure_game_impl import _TreasureGameImpl, create_options
from s2s.utils import make_path

__author__ = 'Steve James and George Konidaris'


class TreasureGame(S2SEnv):
    """
    The Treasure Game as a Gym environment. For more details of the environment, see
    G.D. Konidaris, L.P. Kaelbling, and T. Lozano-Perez. From Skills to Symbols: Learning Symbolic Representations for
    Abstract High-Level Planning. Journal of Artificial Intelligence Research 61, pages 215-289, January 2018
    """

    def __init__(self):

        dir = os.path.dirname(os.path.realpath(__file__))
        dir = make_path(dir, '_treasure_game_impl')
        self._env = _TreasureGameImpl(make_path(dir, 'domain.txt'), make_path(dir, 'domain-objects.txt'),
                                      make_path(dir, 'domain-interactions.txt'))
        self.drawer = None
        self.option_list, self.option_names = create_options(self._env)
        self.action_space = Discrete(len(self.option_list))
        s = self._env.get_state()
        self.observation_space = Box(0, 1, shape=(len(s),))
        self.viewer = None

    def reset(self):
        self._env.reset_game()
        self.option_list, self.option_names = create_options(self._env, None)
        return self._env.get_state()

    @property
    def available_mask(self):
        return np.array([int(o.can_run()) for o in self.option_list])

    def step(self, action):
        option = self.option_list[action]
        r = option.run()
        state = self._env.get_state()
        done = self._env.player_got_goldcoin() and self._env.get_player_cell()[1] == 0  # got gold and returned
        return state, r, done, {}

    def render(self, mode='human'):
        if self.drawer is None:
            self.drawer = _TreasureGameDrawer(self._env)

        self.drawer.draw_domain()
        rgb = pygame.surfarray.array3d(self.drawer.screen).swapaxes(0, 1)  # swap because pygame
        if mode == 'rgb_array':
            return rgb
        elif mode == 'human':
            # draw it like gym
            if self.viewer is None:
                self.viewer = rendering.SimpleImageViewer()
            self.viewer.imshow(rgb)

    def close(self):
        if self.viewer is not None:
            self.viewer.close()

    def render_states(self, states: np.ndarray, **kwargs):
        """
        Special render for showing propositions
        :param states: the states
        """
        if self.drawer is None:
            self.drawer = _TreasureGameDrawer(self._env)
        surface = self.drawer.draw_background_to_surface()
        for state in states:
            nan_mask = np.where(np.isnan(state))
            state[nan_mask] = self.observation_space.sample()[nan_mask]
            self._env.init_with_state(state)
            self.drawer.blend(surface, 1.0 / states.shape[0], 0.5)
        return pygame.surfarray.array3d(surface).swapaxes(0, 1)  # swap because pygame

    def _render_state(self, state: np.ndarray, **kwargs) -> np.ndarray:
        desc = self._env.get_state_descriptors()
        self._env.playerx = int(state[desc.index("playerx")] * self._env.width)
        self._env.playery = int(state[desc.index("playery")] * self._env.height)

        handle_no = 1

        for obj in self._env.objects:
            if (obj.has_state()):
                if (isinstance(obj, goldcoin) or isinstance(obj, key)):
                    x_label = type(obj).__name__ + ".x"
                    y_label = type(obj).__name__ + ".y"
                    xval = int(state[desc.index(x_label)] * self._env.width)
                    yval = int(state[desc.index(y_label)] * self._env.height)
                    obj.move_to_xy(xval, yval)
                elif (isinstance(obj, handle)):
                    label = 'handle' + str(handle_no) + '.angle'
                    angle = state[desc.index(label)]
                    obj.set_angle(angle)
                    obj.previously_triggered = True
                    handle_no = handle_no + 1
                elif (isinstance(obj, bolt)):
                    val = (state[desc.index("bolt.locked")] > 0.5)
                    obj.set_val(val)

        for obj in self._env.objects:
            if (isinstance(obj, handle)):
                self._env.previously_triggered = False
        if self.drawer is None:
            self.drawer = _TreasureGameDrawer(self._env)
        return pygame.surfarray.array3d(self.drawer.draw_to_surface()).swapaxes(0, 1)  # swap because pygame

    def describe_option(self, option: int) -> str:
        if option < 0 or option >= len(self.option_names):
            return super().describe_option(option)
        return self.option_names[option]


if __name__ == '__main__':

    env = TreasureGame()
    for episode in range(5):
        state = env.reset()
        for _ in range(100):
            action = env.sample_action()
            next_state, reward, done, _ = env.step(action)
            env.render('human')
            if done:
                break
