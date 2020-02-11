import numpy as np
from sklearn.model_selection import GridSearchCV
from sklearn.svm import SVR

from s2s.utils import show

__author__ = 'Steve James and George Konidaris'


class SupportVectorRegressor:
    """
    An estimator that predicts the reward for executing the option in a given state. The option here is implicit
    """
    def __init__(self):
        self._svr = None

    def fit(self, X: np.ndarray, y: np.ndarray, verbose=False, **kwargs):
        """
        Fit the regressor to the reward data
        :param X: the initiation state
        :param y: the rewards received
        :param verbose: the verbosity level
        """
        c_range = kwargs.get('reward_c_range', np.arange(1, 16, 2))
        gamma_range = kwargs.get('reward_gamma_range', np.arange(4, 22))
        param_grid = dict(gamma=gamma_range, C=c_range)
        grid = GridSearchCV(SVR(kernel='rbf'), param_grid=param_grid, cv=3)  # 3 fold CV
        grid.fit(X, y)
        show("Found best SVR hyperparams: C = {}, gamma = {}".format(grid.best_params_['C'],
                                                                     grid.best_params_['gamma']), verbose)
        self._svr = grid.best_estimator_

    def predict_reward(self, state: np.ndarray) -> float:
        """
        Predict the reward for executing the (implicit) option in the given state
        :param state: the current state
        :return: the predicted reward
        """
        return self._svr.predict(state.reshape(1, -1))[0]
