from typing import List

import numpy as np
from sklearn.model_selection import GridSearchCV
from sklearn.svm import SVC
from s2s.utils import show, is_single_sample

__author__ = 'Steve James and George Konidaris'


class SupportVectorClassifier:
    """
    An implementation of a probabilistic classifier that uses support vector machines with Platt scaling
    """

    def __init__(self, mask: List[int], probabilistic=True):
        """
        Create a new SVM classifier for preconditions
        :param mask: the state variables that should be kept for classification
        :param probabilistic: whether the classifier is probabilistic
        """
        self._mask = mask
        self._probabilistic = probabilistic
        self._classifier: SVC = None

    @property
    def mask(self) -> List[int]:
        """
        Get the precondition mask
        """
        return self._mask

    def fit(self, X, y, verbose=False, **kwargs):
        """
        Fit the data to the classifier using a grid search for the hyperparameters with cross-validation
        :param X: the data
        :param y: the labels
        :param verbose: the verbosity level
        """
        c_range = kwargs.get('precondition_c_range', np.arange(1, 16, 2))
        gamma_range = kwargs.get('precondition_gamma_range', np.arange(4, 22))

        param_grid = dict(gamma=gamma_range, C=c_range)
        grid = GridSearchCV(SVC(class_weight='balanced'), param_grid=param_grid, cv=3)  # 3 fold CV
        data = X[:, self.mask]
        grid.fit(data, y)

        if not self._probabilistic:
            self._classifier = grid.best_estimator_  # we're done
        else:
            # we've found the best hyperparams. Now do it again with Platt scaling turned on
            params = grid.best_params_
            show("Found best SVM hyperparams: C = {}, gamma = {}".format(params['C'], params['gamma']), verbose)
            # Now do Platt scaling with the optimal parameters
            self._classifier = SVC(probability=True, class_weight='balanced', C=params['C'], gamma=params['gamma'])
            self._classifier.fit(data, y)
            show("Classifier score: {}".format(self._classifier.score(data, y)), verbose)

    def probability(self, states: np.ndarray) -> float:
        """
        Compute the probability of the state given the learned classifier
        :param states: the states
        :return: the probability of the state according to the classifier
        """
        masked_states = states[self.mask]
        if is_single_sample(masked_states):
            masked_states = masked_states.reshape(1, -1)
        if self._probabilistic:
            return np.mean(self._classifier.predict_proba(masked_states)[0][1])
        else:
            return self._classifier.predict(masked_states)[0]
