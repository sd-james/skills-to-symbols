import gym
import numpy as np
from sklearn.cluster import DBSCAN
from sklearn.neighbors import KNeighborsClassifier

from s2s.estimators.estimators import RewardRegressor
from s2s.estimators.kde import KernelDensityEstimator

__author__ = 'Steve James'


class SimpleRegressor(RewardRegressor):
    """
    An estimator that predicts the reward for executing the option in a given state. The option here is implicit.
    This is a simple and lightweight approach. We cluster the training data and take the average of the rewards as
    the predicted reward. For a new state, we simple look up the nearest cluster and take its mean as the prediction
    """

    def __init__(self):
        self._knn = None
        self._means = dict()

    def fit(self, X: np.ndarray, y: np.ndarray, verbose=False, **kwargs):
        """
        Fit the simple estimator to the reward data
        :param X: the initiation states
        :param y: the rewards received
        :param verbose: the verbosity level
        """

        epsilon = kwargs.get('init_epsilon', 0.05)
        min_samples = kwargs.get('init_min_samples', 5)
        labels = DBSCAN(eps=epsilon, min_samples=min_samples).fit_predict(X)
        # get all non noise
        X = X[labels != -1]
        y = y[labels != -1]
        labels = labels[labels != -1]
        for label in set(labels):
            reward = np.mean(y[labels == label])
            self._means[label] = reward
        # now train a k-NN  so that when we get new points, we can assign them to clusters
        self._knn = KNeighborsClassifier(n_neighbors=min_samples)
        self._knn.fit(X, labels)

    def predict_reward(self, state: np.ndarray) -> float:
        """
        Predict the reward for executing the (implicit) option in the given state
        :param state: the current state
        :return: the predicted reward
        """
        label = self._knn.predict(state.reshape(1, -1))[0]
        return self._means[label]

    def expected_reward(self, env: gym.Env, state_distribution: KernelDensityEstimator, **kwargs) -> float:
        """
        Predict the reward for executing the (implicit) option in the given state distribution
        :param env: the domain
        :param state_distribution: the current state distribution
        :return: the predicted reward
        """

        n_samples = kwargs.get('n_samples_reward_prediction', 100)
        states = state_distribution.sample(n_samples)

        # missing vars in mask are simply zeroed out
        data = np.zeros(shape=(n_samples, env.observation_space.shape[-1]))
        data[:, state_distribution.mask] = states
        labels = self._knn.predict(data)
        return np.mean([self._means[label] for label in labels])
