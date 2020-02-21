import gym

from s2s.env import S2SEnv


class MaxLength(gym.Wrapper):
    """
    A wrapper that limits the number of option executions in an episode before terminating
    """

    def __init__(self, env: gym.Env, max_episode_steps=None):
        super().__init__(env)
        if max_episode_steps is None and self.env.spec is not None:
            max_episode_steps = env.spec.max_episode_steps
        if self.env.spec is not None:
            self.env.spec.max_episode_steps = max_episode_steps
        self._max_episode_steps = max_episode_steps
        self._elapsed_steps = None

    def step(self, action):
        assert self._elapsed_steps is not None, "Cannot call env.step() before calling reset()"
        observation, reward, done, info = self.env.step(action)
        if not info.get('option_failed', False):
            # only count if the option was actually executed. Otherwise, the environment wasn't interacted with
            self._elapsed_steps += 1
        if self._elapsed_steps >= self._max_episode_steps:
            info['TimeLimit.truncated'] = not done
            done = True
        return observation, reward, done, info

    def reset(self, **kwargs):
        self._elapsed_steps = 0
        return self.env.reset(**kwargs)


class ConditionalAction(gym.Wrapper):
    """
    Wrapper to deal with the case of actions not being valid. The environment must provide a function called can_execute
    """

    def __init__(self, env: S2SEnv):
        super().__init__(env)

    def step(self, action):
        can_execute = self.env.can_execute(action)
        observation, reward, done, info = self.env.step(action)
        info['option_failed'] = not can_execute
        return observation, reward, done, info


class ActionExecutable(gym.Wrapper):
    """
    Wrapper that adds information about which actions are available at the current and next state. Each is given as a binary vector
    """
    def step(self, action):
        current_actions = self.env.available_mask
        observation, reward, done, info = self.env.step(action)
        info['current_actions'] = current_actions
        info['next_actions'] = self.env.available_mask
        return observation, reward, done, info

