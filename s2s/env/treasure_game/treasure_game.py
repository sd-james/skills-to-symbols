from typing import List

import PIL
import numpy as np
import pygame
from PIL.Image import Image
from gym_treasure_game.envs._treasure_game_impl._objects import goldcoin, handle, bolt, key
from gym_treasure_game.envs._treasure_game_impl._treasure_game_impl import _TreasureGameImpl, create_options
from gym_treasure_game.envs.treasure_game import TreasureGame as BaseTreasureGame

from s2s.env.s2s_env import S2SEnv
from s2s.env.treasure_game._treasure_game_drawer import _TreasureGameDrawer

__author__ = 'Steve James and George Konidaris'


class TreasureGame(BaseTreasureGame, S2SEnv):
    """
    An environment that extends the Treasure Game and implements additional functionality for visualisation
    """

    def render_states(self, states: np.ndarray, **kwargs):
        """
        Special render for showing propositions
        :param states: the states
        """
        if self.drawer is None:
            self.drawer = _TreasureGameDrawer(self._env)
        surface = self.drawer.draw_background_to_surface()

        alpha_objects = kwargs.get('alpha_object', 1.0 / states.shape[0])
        alpha_player = kwargs.get('alpha_player', 0.5)

        for state in states:
            nan_mask = np.where(np.isnan(state))
            state[nan_mask] = self.observation_space.sample()[nan_mask]
            self._env.init_with_state(state)

            self.drawer.blend(surface, alpha_objects, alpha_player)
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

    @staticmethod
    def animate(plan: List[int]) -> List[PIL.Image.Image]:

        pygame.init()
        # need the raw game!
        env = _TreasureGameImpl.make_default()
        drawer = _TreasureGameDrawer(env, display_screen=True)
        clock = pygame.time.Clock()
        pygame.key.set_repeat()
        options, names = create_options(env, drawer=drawer)
        done = False
        while not done:
            # execute until the plan works (may not work first time because stochasticity)
            env.reset_game()
            drawer.frames.clear()
            for option in plan:
                clock.tick(30)
                r = options[option]
                r.run()
                drawer.draw_domain()
                pygame.event.clear()
            done = env.player_got_goldcoin() and env.get_player_cell()[1] == 0  # got gold and returned

        pygame.display.quit()
        print("Extracting frames...")
        return [
            PIL.Image.frombytes('RGBA', frame.get_size(), pygame.image.tostring(frame, 'RGBA', False)) for frame in
            drawer.frames]


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
