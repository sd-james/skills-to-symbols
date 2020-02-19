from abc import ABC, abstractmethod
import numpy as np
import gym

class S2SEnv(gym.Env, ABC):
    """
    An environment that forces the user to implement the neccesary methods
    """

    @property
    @abstractmethod
    def available_mask(self) -> np.ndarray:
        """
        Return a binary array specifying which options can be run at the current state
        :return:
        """
        pass

    def can_execute(self, action):
        return self.available_mask[action] == 1

    def sample_action(self, valid_only=True):
        """
        Randomly pick an action
        :param valid_only: whether only valid actions should be picked
        :return: an action
        """
        if not valid_only:
            return self.action_space.sample()
        mask = self.available_mask
        return np.random.choice(np.arange(self.action_space.n), p=mask / mask.sum())