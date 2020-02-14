from typing import List, Tuple, Dict
from warnings import warn

import gym
import itertools
import pandas as pd

import numpy as np

from s2s.learned_operator import LearnedOperator
from s2s.estimators.kde import KernelDensityEstimator
from s2s.pddl.operator import Operator
from s2s.utils import show, pd2np

__author__ = 'Steve James and George Konidaris'


def build_pddl(env: gym.Env, transition_data: pd.DataFrame, operators: List[LearnedOperator], verbose=False, **kwargs):
    """
    Given the learned preconditions and effects, generate a valid PDDL representation
    :param env: teh domain
    :param transition_data: the transition data
    :param operators: the learned operators
    :param verbose: the verbosity level
    :return:
    """

    distributions = list()
    # Factorise the state space: see JAIR paper for more
    show("Factorising state space...", verbose)
    n_dims = env.observation_space.shape[-1]
    factors, options = _factorise(operators, n_dims, verbose=verbose)

    # generate a distribution over start states
    show("Generating start state symbols...", verbose)
    start_distribution = _generate_start_distribution(transition_data, verbose=verbose, **kwargs)

    # integrate all possible combinations of factors out of the start state distribution
    start_factors = _extract_factors(start_distribution.mask, factors)
    for length in range(1, len(start_factors)):
        for subset in itertools.combinations(factors, length):
            new_dist = start_distribution.integrate_out(subset)
            distributions.append(new_dist)

    show("Start position generated {} propositions".format(len(distributions)), verbose)
    show("Generating propositions...", verbose)

    # get propositions directly from effects
    distributions += _generate_vocabulary(operators, factors, verbose=verbose)
    show("Generating full PDDL...", verbose)
    schemata = _build_pddl_operators(factors, operators, distributions, verbose=verbose, **kwargs)


def _build_pddl_operators(factors: List[List[int]], operators: List[LearnedOperator],
                          propositions: List[KernelDensityEstimator], verbose=False, **kwargs):
    """
    Generate the high-level PDDL operators, given the vocabulary and learned operators
    :param factors: the factorisation of the state space
    :param operators: the earned operators
    :param propositions: the vocabulary
    :param verbose: the verbosity level
    :return:
    """
    schemata = list()
    # TODO parallelisation here
    for i, operator in enumerate(operators):
        show("Processing {}/{} operators".format(i, len(operators)), verbose)
        precondition = operator.precondition
        pre_factors_indices = _mask_to_factors(precondition.mask, factors)
        schemata.extend(_build_pddl_operator(factors, operator, pre_factors_indices, propositions, **kwargs))
    return schemata


def _build_pddl_operator(factors: List[List[int]], operator: LearnedOperator,
                         precondition_factor_indices: List[int], propositions: List[KernelDensityEstimator],
                         verbose=False, **kwargs) -> List[Operator]:
    """
    Generate the PDDL representation for the given operator. There may be more than one due to disjunctive preconditions
    :param factors: the factorisation of the state space
    :param operators: the learned operator
    :param precondition_factor_indices: the indices of each factor that should be considered
    :param propositions: the vocabulary
    :param verbose: the verbosity level
    :return: a list of high-level PDDL operators
    """

    pddl_operators = list()

    candidates = list()  # candidates are all possible propositions that we need to consider

    # Get all symbols whose mask matches the correct factors
    for idx in precondition_factor_indices:
        s_list = []
        for proposition in propositions:
            fact = factors[idx]
            if set(proposition.mask) == set(fact):
                s_list.append(proposition)
        candidates.append(s_list)

    high_threshold = kwargs.get('high_threshold', 0.95)
    low_threshold = kwargs.get('low_threshold', 0.1)

    # when intersecting propositions with preconditions allow for the effects to be a subspace of the precondition
    # (and have the missing variables randomly sampled)
    allow_fill_in = kwargs.get('allow_fill_in', False)

    # try out all possible combinations!
    combinations = list(itertools.product(*candidates))
    show("Searching through {} candidates...".format(len(combinations)), verbose)
    for candidates in combinations:
        if _masks_overlap(candidates):
            # This should never happen, but putting a check to make sure
            warn("Overlapping candidates in PDDL building!")
            continue
        # get the precondition masks from the candidates. Make sure sorted to avoid bugs!
        precondition_masks = sorted(
            list(itertools.chain.from_iterable([proposition.mask for proposition in candidates])))

        if (not allow_fill_in and not np.array_equal(precondition_masks, operator.precondition.mask)) or (
            allow_fill_in and not set(precondition_masks).issubset(operator.precondition.mask)):
            #  effect mask does not match precondition!
            continue

        # probability of propositions matching classifier
        prob = _probability_in_precondition(candidates, operator.precondition)
        if prob > low_threshold:

            # we found a match!
            prob = round(prob, 3)  # make look nice
            pddl_operator = Operator(operator)




            pddl_operators.append(pddl_operator)

    return pddl_operators


def _masks_overlap(propositions: List[KernelDensityEstimator]):
    """
    Check if a set of propositions have overlapping masks
    :param propositions: the set of propositions
    :return: whether their masks overlap
    """
    variables = np.hstack([symbol.mask for symbol in propositions])
    return np.unique(variables).size != len(variables)


def _generate_vocabulary(operators: List[LearnedOperator], factors: List[List[int]],
                         verbose=False) -> List[KernelDensityEstimator]:
    """
    Generate a vocabulary for the PDDL. This includes every possible proposition that could ever be required.
    :param operators: the learned operators
    :param factors: the factors
    :param verbose: the verbosity level
    :return: the list of generated propositions
    """
    vocabulary = list()
    # Process each option's effect sets.
    for operator in operators:
        for _, effect, _ in operator.outcomes():
            mask = effect.mask
            factor_list = _extract_factors(mask, factors)
            if len(factor_list) == 1:
                # Independent. Go with it as-is.
                vocabulary.append(effect)
            else:
                show('{} factors:'.format(len(factor_list)), verbose)
                count = 0

                # Integrate all combinations of factors (massive explosion here!)
                for L in range(0, len(factor_list)):
                    for subset in itertools.combinations(factor_list, L):
                        new_symbol = effect
                        for factor in subset:
                            new_symbol = new_symbol.integrate_out(factor)
                        vocabulary.append(effect)
                        count += 1
                show('{} propositions generated'.format(count), verbose)
    return vocabulary


def _generate_start_distribution(transition_data: pd.DataFrame, verbose=False, **kwargs) -> KernelDensityEstimator:
    """
    Generate a distribution over the starting states
    :param transition_data: the transition data from which we can extract the initial states
    :param verbose: the verbosity level
    :return: a density estimation of the initial states
    """
    show("Fitting estimator to initial states", verbose)
    # group by episode and get the first state from each
    initial_states = pd2np(transition_data.groupby('episode').nth(0)['state'])
    full_mask = list(range(initial_states.shape[1]))  # all the state variables
    effect = KernelDensityEstimator(full_mask)
    effect.fit(initial_states, verbose=verbose, **kwargs)
    return effect


def _modifies(operators: List[LearnedOperator], n_variables: int) -> Dict[int, List[Tuple[int, int]]]:
    """
    Determine which options modify each state variable
    :param operators:
    :param n_variables:
    :return: For each state variable, a list of option-effect pairs that modify it
    """
    modifies = dict()
    for x in range(n_variables):
        new_mods = list()
        for i, operator in enumerate(operators):
            for v, (_, effect, _) in operator.outcomes():
                mask = effect.mask
                if x in mask:
                    new_mods.append((i, v))  # modifies[s] -> [(option, effect number], ...]
        modifies[x] = new_mods

    return modifies


def _factorise(operators: List[LearnedOperator], n_variables: int, verbose=True) -> List[List[int]]:
    """
    Factorise the state space based on what variables are changed by the options. For more, see the JAIR 2018 paper
    :param operators: the learned operators
    :param n_variables: the number of state-space variables
    :param verbose: the verbosity level
    :return: factors: for each factor, the list of state variables
    """
    modifies = _modifies(operators, n_variables)  # check which variables are modified by each operator
    factors = list()
    options = list()

    for i in range(0, n_variables):
        found = False
        for x in range(0, len(factors)):
            f = factors[x]
            if options[x] == modifies[i]:
                f.append(i)
                found = True

        if not found:
            factors.append([i])
            options.append(modifies[i])

    show("Factors\tVariables\t\tOptions" + '\n'.join(
        ["F_{}\t\t{}\t{}".format(i, factors[i], options[i]) for i in range(len(factors))]), verbose)

    return factors


def _extract_factors(mask, factors):
    """
    Extract the factors referred to by the mask
    :param mask: the mask
    :param factors: the factors
    """
    ret = []
    m_set = set(mask)
    for f in factors:
        f_set = set(f)
        if not f_set.isdisjoint(m_set):
            part = f_set.intersection(m_set)
            ret.append(part)
            m_set = m_set - f_set

            if len(m_set) == 0:
                return ret
    warn("No overlapping factors in mask?!")
    return ret


def _mask_to_factors(mask, factors):
    """
    Convert a mask to factors
    :param mask: the mask
    :param factors: the factors
    :return: the index of factors referred to by the mask
    """
    f_list = []
    for index, f in enumerate(factors):
        found = False
        for m in mask:
            if m in f:
                found = True
                break
        if found:
            f_list.append(index)
    return f_list
