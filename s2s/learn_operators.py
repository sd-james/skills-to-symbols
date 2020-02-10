from collections import defaultdict
from warnings import warn

from sklearn.model_selection import StratifiedKFold
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import cross_val_score

from sklearn.svm import SVC

from symbols.data.data import load_option_partitions, load_precondition_samples
from symbols.data.partitioned_option import PartitionedOption
from symbols.domain.domain import Domain

import numpy as np

from symbols.experimental.feature_selection import get_classification_mask, get_object_classification_mask
from symbols.experimental.pca import PCA
from symbols.file_utils import make_path, make_dir
from symbols.render.image import Image
from symbols.symbols.kde import KernelDensityEstimator
from symbols.symbols.svc import SupportVectorClassifier


def debug_samples(render, states, folder):
    d = render(None, states)
    images = list()
    for key in d:
        ims = d[key]
        for i in range(len(ims)):
            if i >= len(images):
                images.append([ims[i]])
            else:
                images[i].append(ims[i])
    final_ims = list()
    for temp in images:
        q = []
        for x in temp:
            if len(x.shape) == 3:
                image = Image.to_image(x, mode='RGB')
            else:
                image = Image.to_image(x)
            q.append(image)
        im = Image.combine(q)
        final_ims.append(im)
    make_dir(folder)
    for i, image in enumerate(final_ims):
        filename = make_path(folder, str(i) + ".bmp")
        Image.save(image, filename, mode='RGB')


def learn_preconditions(env: Domain,
                        data_dir,
                        partition_dir,
                        max_precondition_mask_samples=2000,
                        view='problem',
                        verbose=False,
                        render=None):
    partitions = load_option_partitions(env.action_space, partition_dir)
    preconditions = dict()
    for option in env.action_space:

        # if option not in [3, 4]:
        #     continue

        if len(partitions[option]) > 0:

            if verbose:
                print('Learning precondition for option {}'.format(option))

            negative_label = 0
            # negative_samples = load_precondition_samples(data_dir, option, negative_label, view=view,
            #                                              verbose=verbose)

            for i, partition in enumerate(partitions[option]):

                # get samples that cannot be executed by this option at all

                object_ids = partition.object_ids
                if len(set(object_ids)) != 1:
                    raise ValueError

                negative_samples = load_precondition_samples(data_dir, option, object_ids[0], negative_label, view=view,
                                                             verbose=verbose)

                if verbose:
                    print('Learning precondition for partition {}'.format(i))

                # add samples where other partitions of the current option (but not this one) could be executed
                # negative = _augment_negative(i, partitions[option], negative_samples)  # TODO check
                negative = negative_samples
                positive = partition.states

                precondition = _learn_precondition(env, partition, negative, positive, max_precondition_mask_samples,
                                                   verbose=verbose)
                preconditions[(option, partition.partition)] = precondition

    return preconditions


#  get samples from OTHER partitions of the option as negatives!
def _augment_negative(partition_idx, partitions, negative_samples):
    neg = negative_samples
    for i, p in enumerate(partitions):
        if i == partition_idx or not p.can_augment(partition_idx):
            continue
        neg = np.concatenate((neg, p.states))
    return neg


def debug(mask, examples, labels):
    images = list()
    pca = PCA(20)
    pca.load("C:\\Users\\Steve\\PycharmProjects\\marlo\\white_data\\white_pca.dat")
    i = 0

    d = make_path('C:\\Users\\Steve\\PycharmProjects\\marlo\\white_data\\debug')
    make_dir(d)
    for state, label in zip(examples, labels):
        i += 1
        # images = [state[mask[j]] for j in [0, -1]]
        # x = Image.merge(images)
        x = state[mask[0]]
        im = pca.unflatten(pca.uncompress_(x))
        name = 'good' if label > 0 else 'bad'
        filename = make_path(d, name + '-' + str(i) + ".bmp")
        Image.save(im, filename)


def _learn_precondition(env, partition: PartitionedOption, negative, positive, max_precondition_mask_samples,
                        verbose=False):
    # First calculate the precondition mask using feature selection

    if negative.shape[0] == 0 or positive.shape[0] == 0:
        warn("Need positive and negative samples!")
        return None

    if negative.shape[0] > 0 and positive.shape[0] > 0:
        examples = np.vstack((positive, negative))
    elif negative.shape[0] == 0 and positive.shape[0] == 0:
        raise RuntimeError("No examples whatsoever!")
    elif negative.shape[0] == 0:
        warn("No negative examples! Pressing on...")
        examples = positive
    else:
        warn("No positive examples! Pressing on...")
        examples = negative

    labels = ([1] * len(positive)) + ([0] * len(negative))
    if verbose:
        print("Calculating mask for option {}, partition {} ...".format(partition.option, partition.partition))

    # Use less samples if indicated
    if negative.shape[0] > max_precondition_mask_samples:
        t1 = negative[
            np.random.choice(negative.shape[0], max_precondition_mask_samples, replace=False)]
    else:
        t1 = negative

    if positive.shape[0] > max_precondition_mask_samples:
        t2 = positive[
            np.random.choice(positive.shape[0], max_precondition_mask_samples, replace=False)]
    else:
        t2 = positive

    t3 = ([1] * len(t2)) + ([0] * len(t1))
    mask = get_object_classification_mask(env, np.concatenate((t2, t1)), t3, partition_mask=partition.combined_mask,
                                          object_ids=partition.object_ids, verbose=verbose)

    if verbose:
        print("Precondition mask calculated")

        print("Calculating precondition:")

    try:
        # debug(mask, examples, labels)
        # exit(1)

        # TODO: a test - learn a distribution over data, then use that to pass to SVM
        # neg_sym = KernelDensityEstimator(mask=mask, data=t1)
        pos_sym = KernelDensityEstimator(mask=mask, data=t2)
        pos_x = pos_sym.sample(len(negative))

        pos_x = np.array([np.concatenate(sample).ravel() for sample in pos_x])

        negative = np.array([np.concatenate(sample).ravel() for sample in negative[:, mask]])

        examples = np.vstack((pos_x, negative))
        labels = ([1] * len(pos_x)) + ([0] * len(negative))
        return SupportVectorClassifier(mask, examples, labels, use_mask=False)
        return SupportVectorClassifier(mask, examples, labels)
    except Exception as e:
        print(str(e))
        return None


def _get_classification_mask(examples, labels, improvement_threshold=0, verbose=True):
    # A 3-fold cross-validation score is computed using the support vector machine classifier
    # implementation in scikit-learn, with an RBF kernel, automatic class reweighting,
    # and parameters selected by a grid search with 3-fold cross-validation.
    # We test whether leaving out each state variable independently damaged the score,
    # keeping only variables that did. Finally, we added each state variable back when doing so improved the score.

    # return get_classification_mask(examples, labels, verbose)

    mask = []
    n_vars = examples.shape[1]
    all_vars = range(0, n_vars)
    (tot_score, params) = _get_orig_score_params(examples, labels)

    if verbose:
        print(tot_score)

    for m in range(0, n_vars):
        used_vars = list(all_vars[:])
        used_vars.remove(m)
        nscore = _get_subset_score(examples, labels, used_vars, params)

        if nscore < (tot_score - 0.02):
            mask.append(m)

    mxpos = -1
    mxscore = 0.0

    if len(mask) == 0:
        for m in range(0, n_vars):
            score = _get_subset_score(examples, labels, [m], params)
            if score - mxscore > improvement_threshold:
                mxscore = score
                mxpos = m

        mask.append(mxpos)

    msk_score = _get_subset_score(examples, labels, mask, params)
    if verbose:
        print("mask score: " + str(msk_score))
        print(mask)

    for m in range(0, n_vars):
        if m not in mask:
            n_score = _get_subset_score(examples, labels, mask + [m], params)
            if verbose:
                print(str(m) + " : " + str(n_score))
            if n_score - msk_score > improvement_threshold:
                msk_score = n_score
                mask = mask + [m]
                if verbose:
                    print("Adding " + str(m))

            if msk_score == 1:
                break  # can't improve

    return mask


def _get_orig_score_params(examples, labels):
    if len(set(labels)) == 1:
        # everything is in the same class! SVM can't handle :(
        warn("Everything is in the same class! SVM can't handle :(")
        return 1, {'gamma': 5, 'C': 1}

    C_range = np.arange(1, 16, 2)
    gamma_range = np.arange(5, 20)
    param_grid = dict(gamma=gamma_range, C=C_range)
    # param_grid = dict(C=C_range)
    cv = StratifiedKFold(y=labels, n_folds=3)
    grid = GridSearchCV(SVC(class_weight='balanced'), param_grid=param_grid, cv=cv)
    try:
        grid.fit(examples, labels)
    except ValueError:
        return 1, {'gamma': 5, 'C': 1}
    return grid.best_score_, grid.best_params_


def _get_subset_score(examples, labels, used_vars, best_params):
    if len(set(labels)) == 1:
        # everything is in the same class! SVM can't handle :(
        warn("Everything is in the same class! SVM can't handle :(")
        return 1
    examples = examples[:, used_vars]
    if examples.shape[1] == 0:
        return 0
    labels = np.asarray(labels)

    try:
        return np.mean(
            cross_val_score(
                SVC(class_weight='balanced', C=best_params['C'], gamma=best_params['gamma']),
                X=examples, y=labels, cv=3))
    except ValueError:
        return 1
