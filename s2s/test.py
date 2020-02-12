import itertools

import gym
import numpy as np
import pandas as pd

from s2s.kde import KernelDensityEstimator
from s2s.learn_operators import learn_effects, combine_learned_operators
from s2s.utils import load, save, pd2np, show

def _modifies(symbols, n_variables):
    modifies = []
    for x in range(0, n_variables):
        new_mods = []

        for i, symbol in enumerate(symbols):
            for v in range(0, len(symbol.list_probabilities)):
                mask = symbol.list_effects[v].mask
                if x in mask:
                    new_mods.append((i, v))  # modifies[s] -> [(option, effect number], ...]
        modifies.append(new_mods)

    return modifies

def factorise(symbols, n_variables, verbose=True):
    """
    Factorise the state space based on what variables are changed by the options
    :param symbols: the learned symbols
    :param n_variables: the number of state-space variables
    :param verbose: whether to print information to screen
    :return: the factors and options
    """

    modifies = _modifies(symbols, n_variables)
    factors = []
    options = []

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

    if verbose:
        print("Factors\tVariables\t\tOptions")
        for i in range(0, len(factors)):
            print("F_" + str(i) + "\t\t" + str(factors[i]) + "\t" + str(options[i]))

    return factors, options



def _generate_start_distribution(transition_data: pd.DataFrame, verbose=False, **kwargs):
    show("Fitting estimator to initial states", verbose)
    # group by episode and get the first state from each
    initial_states = pd2np(transition_data.groupby('episode').nth(0)['state'])
    full_mask = list(range(initial_states.shape[1]))  # all the state variables
    effect = KernelDensityEstimator(full_mask)
    effect.fit(initial_states, verbose=verbose, **kwargs)
    return effect


def _extract_factors(mask, factors):
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

def generate_vocabulary(env, transition_data, operators, verbose=False, **kwargs):

    show("Factorising state space...", verbose)

    n_dims = env.observation_space.shape[-1]

    # Factorise: see JAIR paper for more
    (factors, options) = factorise(operators, n_dims, verbose=verbose)

    show("Generating start state symbols...", verbose)
    start_dist = _generate_start_distribution(transition_data, verbose, **kwargs)

    vocabulary = list()
    # integrate all possible combinations of factors out of the start state distribution
    for L in range(1, len(factors)):
        # TODO wtf
        factors = list(range(len(factors)))
        for subset in itertools.combinations(factors, L):
            symbol = start_dist.integrate_out(subset)
            symbol_list.add(symbol)
        return symbol_list



    if verbose:
        print("Start position generated " + str(len(symbol_list)) + " propositions")
        print("Generating propositions...")

    (option_symbols, symbol_list) = generate_symbol_set(operators, factors, symbol_list)

    write_propositions(ppddl_symbol_dir, symbol_list, verbose=verbose)

    return factors, operators, symbol_list, option_symbols


if __name__ == '__main__':
    temp = [np.array([0, 1, 2, 3], dtype=object) for _ in range(10)]
    temp = np.array(temp)

    x = np.where(temp == (0, 1, 2, 3))
    d = 0

    env = gym.make('CartPole-v0')
    # transition_data, initiation_data = collect_data(env, max_episode=50, verbose=True)
    # transition_data.to_pickle('data/transition.pkl', compression='gzip')
    # initiation_data.to_pickle('data/init.pkl', compression='gzip')

    transition_data = pd.read_pickle('data/transition.pkl', compression='gzip')
    initiation_data = pd.read_pickle('data/init.pkl', compression='gzip')

    # partitions = partition_options(env, transition_data, verbose=True)
    #
    # save(partitions, 'partitioned_options/partitions.pkl')
    partitions = load('partitioned_options/partitions.pkl')

    # preconditions = learn_preconditions(env, initiation_data, partitions, verbose=True)
    # save(preconditions, 'preconditions.pkl')
    preconditions = load('preconditions.pkl')
    #
    # effects = learn_effects(env, partitions, verbose=True)
    # save(effects, 'effects.pkl')
    effects = load('effects.pkl')

    operators = combine_learned_operators(env, partitions, preconditions, effects)

    _generate_start_distribution(transition_data)
    x = 0



    # initial_states = get_initial_states(task_id, '20191230_raw', pca, 10)
    #
    # init_obs = [x[1] for x in initial_states]
    #
    # # generate vocabulary
    # propositions_dir = make_path(task_dir, 'propositions')
    # (factors, _), (option_symbols, symbol_list) = generate_symbol_vocabulary(env, propositions_dir,
    #                                                                          operators, n_objects, init_obs)