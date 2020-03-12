from abc import abstractmethod, ABC
from typing import List, Iterable

import gym
import numpy as np

__author__ = 'Steve James and George Konidaris'


class PreconditionClassifier(ABC):
    """
    A classifier that determines whether an option can be executed in a given state
    """

    @property
    @abstractmethod
    def mask(self) -> List[int]:
        """
        Get the precondition mask
        """
        pass

    @abstractmethod
    def fit(self, X: np.ndarray, y: np.ndarray, verbose=False, **kwargs) -> None:
        """
        Fit the data to the classifier
        :param X: the data
        :param y: the labels
        :param verbose: the verbosity level
        """
        pass

    @abstractmethod
    def probability(self, states: np.ndarray) -> float:
        """
        Compute the probability of the state given the learned classifier
        :param states: the states
        :return: the probability of the state according to the classifier
        """
        pass


class StateDensityEstimator(ABC):
    """
    A density estimator that models a distribution over low-level states
    """

    @abstractmethod
    def fit(self, X: np.ndarray, verbose=False, **kwargs) -> None:
        """
        Fit the data to the effect estimator
        :param X: the data
        :param verbose: the verbosity level
        """
        pass

    @property
    @abstractmethod
    def mask(self) -> List[int]:
        """
        Get the effect mask
        """
        pass

    @abstractmethod
    def sample(self, n_samples=100) -> np.ndarray:
        """
        Sample data from the density estimator
        :param n_samples: the number of samples
        :return an array of samples
        """
        pass

    @abstractmethod
    def integrate_out(self,
                      variable_list: Iterable[int],
                      **kwargs) -> 'StateDensityEstimator':
        """
        Given a distribution p(s) and a list of variables, return a new
        distribution equal to p with those variables marginalized out.
        """
        pass


class RewardRegressor(ABC):
    """
    An estimator that predicts the reward for executing the option in a given state. The option here is implicit
    """

    @abstractmethod
    def fit(self, X: np.ndarray, y: np.ndarray, verbose=False, **kwargs) -> None:
        """
        Fit the regressor to the reward data
        :param X: the initiation states
        :param y: the rewards received
        :param verbose: the verbosity level
        """
        pass

    @abstractmethod
    def predict_reward(self, state: np.ndarray) -> float:
        """
        Predict the reward for executing the (implicit) option in the given state
        :param state: the current state
        :return: the predicted reward
        """
        pass

    @abstractmethod
    def expected_reward(self, env: gym.Env, state_distribution: StateDensityEstimator, **kwargs) -> float:
        """
        Predict the reward for executing the (implicit) option in the given state distribution
        :param env: the domain
        :param state_distribution: the current state distribution
        :return: the predicted reward
        """
        pass
