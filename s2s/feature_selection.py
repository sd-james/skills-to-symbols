import threading
from typing import List, Dict, Tuple
from warnings import warn

import numpy as np
from sklearn.model_selection import GridSearchCV, cross_val_score
from sklearn.svm import SVC

from s2s.utils import show, range_without

__author__ = 'Steve James and George Konidaris'


def _compute_precondition_mask(positive_samples: np.ndarray, negative_samples: np.ndarray, labels: List[int],
                               verbose=False, **kwargs):
    """
    Compute the precondition mask using a feature selection procedure. These are the variables that matter when
    determining whether an option can be executed
    :param positive_samples: an array of positive states
    :param negative_samples: an array of negative states
    :param labels: labels corresponding to positive and negative states
    :param verbose: the verbosity level
    :return: the mask
    """
    samples = np.vstack((positive_samples, negative_samples))

    # compute the precondition mask through feature selection
    mask = []
    n_vars = samples.shape[1]

    # compute the score with ALL state variables
    total_score, params = _get_orig_score_params(samples, labels, **kwargs)
    show("Score with all variables: {}".format(total_score), verbose)

    threshold = kwargs.get('mask_selection_threshold', 0.02)

    # try remove each state variable in turn, see what the score is
    for m in range(n_vars):
        used_vars = range_without(0, n_vars, m)
        subset_score = _get_subset_score(samples, labels, used_vars, params)

        if total_score - subset_score > threshold:
            # removing the variable damaged the score. So keep it!
            show("Variable {} causes damage when removed. Keeping...".format(m), verbose)
            mask.append(m)

    # if no mask, just find the best one so far
    if len(mask) == 0:
        mask.append(np.argmax([_get_subset_score(samples, labels, [i], params) for i in range(n_vars)]))

    latest_score = _get_subset_score(samples, labels, mask, params)
    # now try adding variables back!
    for m in range_without(0, n_vars, *mask):
        n_score = _get_subset_score(samples, labels, mask + [m], params)
        if n_score - latest_score > threshold:
            latest_score = n_score
            mask = mask + [m]
            show("Variable {} improves the score when added. Keeping...".format(m), verbose)
            if n_score == 1:
                break  # cannot improve
    mask.sort()  # ensure mask is always sorted to avoid bugs down the line
    show("Final precondition mask: {} with score {}".format(mask, latest_score), verbose)
    return mask


def _get_orig_score_params(states: np.ndarray, labels: List[int], **kwargs):
    """
    Compute the classification score over the full data
    :param states: the states, positive and negative
    :param labels: the associated labels
    :return: the best score and the associated SVM hyperparameters
    """
    if len(set(labels)) == 1:
        # everything is in the same class! SVM can't handle :(
        warn("There is only one class. SVM cannot handle this case")
        return 1, {'gamma': 5, 'C': 1}
    c_range = kwargs.get('precondition_c_range', np.arange(1, 16, 2))
    gamma_range = kwargs.get('precondition_gamma_range', np.arange(4, 22, 2))
    param_grid = dict(gamma=gamma_range, C=c_range)
    grid = GridSearchCV(SVC(class_weight='balanced'), param_grid=param_grid, cv=3, n_jobs=-1)  # 3 fold CV
    grid.fit(states, labels)
    # try:
    #     grid.fit(states, labels)
    # except ValueError:
    #     return 1, {'gamma': 5, 'C': 1}
    return grid.best_score_, grid.best_params_


def _get_subset_score(states: np.ndarray, labels: List[int], mask: List[int], best_params: Dict[str, float]):
    """
    Compute the classification score over the given masked data
    :param states: the states, positive and negative
    :param labels: the associated labels
    :param mask: the state variables to keep
    :param best_params: the hyperparameters
    :return: the average cross-validated SVM score
    """
    if len(set(labels)) == 1:
        # everything is in the same class! SVM can't handle :(
        warn("There is only one class. SVM cannot handle this case")
        return 1, {'gamma': 5, 'C': 1}

    # probably unneccessary, but going to sort!
    mask.sort()

    states = states[:, mask]
    if states.shape[1] == 0:
        warn("Trying to do feature selection with an empty mask!")
        return 0

    return np.mean(
        cross_val_score(
            SVC(class_weight='balanced', C=best_params['C'], gamma=best_params['gamma']),
            X=states, y=labels, cv=3))

    # try:
    #     return np.mean(
    #         cross_val_score(
    #             SVC(class_weight='balanced', C=best_params['C'], gamma=best_params['gamma']),
    #             X=states, y=labels, cv=3))
    # except ValueError:
    #     return 1
