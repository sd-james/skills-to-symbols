from typing import List

import gym
import numpy as np

from s2s.learned_operator import LearnedOperator


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
    state_dist = np.vstack([env.reset() for _ in range(n_samples)])
    return _evaluate_plan(state_dist, operators, plan, use_rewards, verbose=verbose)


def _evaluate_plan(states: np.ndarray, operators: List[LearnedOperator], plan: List[int], use_rewards=True,
                   verbose=False):
    if len(plan) == 0:
        return 1

    best_score = -np.inf

    option = plan[0]
    candidates = [x for x in operators if x.option == option]
    for candidate in candidates:

        pre_prob = candidate.precondition.probability(states)
        if pre_prob < 0.1:
            continue
        for next_prob, eff, reward in candidate.outcomes():
            next_states = np.copy(states)
            next_states[:, eff.mask] = eff.sample(next_states.shape[0])
            total_score = pre_prob * next_prob * _evaluate_plan(next_states, operators, plan[1:])

            if use_rewards:
                total_score *= np.mean([reward.predict_reward(x) for x in states])

            if total_score > best_score:
                best_score = total_score
    return best_score
