from collections import deque
from typing import List

import gym
import numpy as np
from gym.envs.classic_control import rendering

from s2s.env.treasure_game.treasure_game import TreasureGame
from s2s.core.learned_operator import LearnedOperator
from s2s.utils import load


def evaluate_plan(env: gym.Env, operators: List[LearnedOperator], plan: List[int], use_rewards=True, n_samples=100,
                  verbose=False):
    """
    Evaluate a plan
    :param env: the domain
    :param operators: the learned operators
    :param plan: the plan
    :param use_rewards: whether to measure based on reward collected, or probability of success
    :param n_samples: the number of samples to use as the empirical state distribution
    :param verbose: the verbosity level
    :return: the probability of executing the plan, or the expected return along the plan
    """

    class _Node:
        """
        Node for a DFS/BFS search
        """

        def __init__(self, states: np.ndarray, remaining_plan: List[int], prob=1, reward=0, parent: '_Node' = None):
            self.states = states
            self.plan = remaining_plan
            self.prob = prob
            self.reward = reward
            self.parent = parent

        @property
        def is_leaf(self):
            return len(self.plan) == 0

        @property
        def neighbours(self):
            if self.is_leaf:
                return []
            neighbours = list()
            option = self.plan[0]
            candidates = [x for x in operators if x.option == option]
            for candidate in candidates:

                pre_prob = candidate.precondition.probability(self.states)
                if pre_prob < 0.05:
                    continue
                for next_prob, eff, reward in candidate.outcomes():
                    next_states = np.copy(self.states)
                    next_states[:, eff.mask] = eff.sample(next_states.shape[0])

                    prob = self.prob * pre_prob * next_prob
                    if reward is None:
                        rew = 0
                    else:
                        rew = self.reward + pre_prob * next_states * np.mean(
                            [reward.predict_reward(x) for x in self.states])
                    neighbours.append(_Node(next_states, self.plan[1:], prob=prob, reward=rew, parent=current))

            return sorted(neighbours, key=lambda x: x.prob, reverse=True)

    state_dist = np.vstack([env.reset() for _ in range(n_samples)])

    viewer = rendering.SimpleImageViewer()

    stack = deque()
    current = _Node(state_dist, plan)
    stack.append(current)
    leaves = list()
    while len(stack) > 0:
        current = stack.pop()
        if current.is_leaf:
            leaves.append(current)
        for next in current.neighbours:
            stack.append(next)

    max_prob = 0
    max_leaf = None
    for leaf in leaves:
        if leaf.prob > max_prob:
            max_prob = leaf.prob
            max_leaf = leaf

    if max_leaf is not None:
        path = deque()
        x = max_leaf
        while x is not None:
            path.append(x)
            x = x.parent
        while len(path) > 0:
            x = path.pop()
            viewer.imshow(env.render_states(x.states, alpha_object=1, alpha_player=1))
    return max_prob


if __name__ == '__main__':
    env = TreasureGame()
    operators = load('full_run/operators.pkl')
    plan = [3, 0, 4, 1, 1, 3, 1, 4, 0, 0, 5, 7, 7, 0, 1, 6, 0, 3, 0, 4, 1, 1, 8, 8, 8, 1, 0, 5, 5, 5, 0, 2, 1, 8, 8, 1,
            1, 4, 0, 2, 0, 2]
    prob = evaluate_plan(env, operators, plan)
    print(prob)
    #                    0       1         2           3            4        5            6          7          8
    # option_list = [go_left, go_right, up_ladder, down_ladder, interact, down_left, down_right, jump_left, jump_right]
