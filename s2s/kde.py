import numpy as np
from typing import List

from sklearn.model_selection import GridSearchCV
from sklearn.neighbors import KernelDensity

from s2s.utils import show

__author__ = 'Steve James and George Konidaris'


class KernelDensityEstimator:

    def __init__(self, mask: List[int]):
        """
        Create a new estimator
        :param mask: the state variables we care about
        """
        self._mask = mask
        self._kde = None

    def fit(self, X: np.ndarray, verbose=False, **kwargs):
        """
        Fit the data to the effect estimator using a grid search for the hyperparameters with cross-validation
        :param X: the data
        :param verbose: the verbosity level
        """
        data = X[:, self.mask]
        bandwidth_range = kwargs.get('effect_bandwidth_range', np.arange(0.001, 0.1, 0.001))
        params = {'bandwidth': bandwidth_range}
        grid = GridSearchCV(KernelDensity(kernel='gaussian'), params, cv=3)
        grid.fit(data)
        show("Best bandwidth hyperparameter: {}".format(grid.best_params_['bandwidth']), verbose)
        self._kde = grid.best_estimator_

    @property
    def mask(self) -> List[int]:
        """
        Get the effect mask
        """
        return self._mask
