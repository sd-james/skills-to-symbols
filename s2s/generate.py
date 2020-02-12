from symbols.data.data import write_propositions, write_schemata
from symbols.data.partitioned_option import Rule
from symbols.data.unique_symbol_list import UniqueSymbolList
from symbols.experimental.generate_ppddl import PPDDLSymbolWrapper, build_ppddl
from symbols.experimental.generate_propositions import factorise, generate_starting_symbol, generate_symbol_set, \
    _is_similar
from symbols.file_utils import make_path
from symbols.pddl.description import Description
from symbols.pddl.schema import Schema, NOT_FAILED
from symbols.render.render import visualise_ppddl_symbols
from symbols.symbols.distribution_symbol import DistributionSymbol
import itertools
import numpy as np
import pickle

from warnings import warn

from symbols.data.data import load_operators, write_propositions
from symbols.data.unique_symbol_list import UniqueSymbolList
from symbols.domain.domain import Domain
import numpy as np

from symbols.symbols.kde import KernelDensityEstimator
import itertools


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

def to_2d(data):
    if data.shape[1] == 1:
        return np.squeeze(data, axis=1)

    if len(data.shape) == 3:
        return np.array([x.ravel() for x in data])
    return np.array([np.concatenate(x.ravel()) for x in data])


def _is_similar(sym1,
                sym2,
                n_samples=100,
                threshold=0.1):

    dist = sym1.kl_divergence(sym2, n_samples)
    return dist < threshold


    # dat1 = np.array(sym1.sample(n_samples))
    # dat2 = np.array(sym2.sample(n_samples))
    #
    # if len(dat1.shape) == 1:
    #     dat1 = np.reshape(dat1, (dat1.shape[0], 1))
    # if len(dat2.shape) == 1:
    #     dat2 = np.reshape(dat2, (dat2.shape[0], 1))
    #
    # dat1 = to_2d(dat1)
    # dat2 = to_2d(dat2)
    #
    # mean1 = np.mean(dat1, axis=1)
    # mean2 = np.mean(dat2, axis=1)
    #
    # diff = np.linalg.norm(mean1 - mean2)
    # if diff > threshold:
    #     return False
    #
    # n_dims = dat2.shape[1]
    # for n in range(0, n_dims):
    #     max1 = np.max(dat1[:, n])
    #     min1 = np.min(dat1[:, n])
    #     max2 = np.max(dat2[:, n])
    #     min2 = np.min(dat2[:, n])
    #
    #     if min1 > max2 or min2 > max1:
    #         return False
    # return True


def generate_starting_symbol(domain: Domain,
                             factors,
                             n_objects,
                             initial_states):
    """
    Generate a distribution over start states
    :param domain: the domain
    :param factors: the factors of the domain
    :param n_samples: the number of start state samples to draw
    :return: all possible symbols necessary to represent the start state
    """

    # domain.reset()

    # start_data = np.zeros([n_samples, n_objects])
    #
    # # Generate samples of the starting position
    # for x in range(0, len(initial_states)):
    #     st = initial_states[x]
    #     st = np.concatenate(st).ravel()
    #     start_data[x, :] = st

    start_data = np.array([x for x in initial_states])

    # learn a distribution over the start states
    kde = KernelDensityEstimator(mask=range(0, n_objects), data=start_data)

    # Get the factors for the start symbol
    factors = _extract_factors(kde.mask, factors)
    # symbol_list = UniqueSymbolList(lambda x, y: set(x.mask) == set(y.mask) and _is_similar(x, y))
    symbol_list = UniqueSymbolList()


    # integrate all possible combinations of factors out of the start state distribution
    # TODO potentially just use L = (factors - 1) to treat indepedently
    # for L in range(1, len(factors)):

    # TODO wtf
    factors = list(range(len(factors)))

    L = len(factors) - 1
    for subset in itertools.combinations(factors, L):
        symbol = kde.integrate_out(subset)
        symbol_list.add(symbol)
    return symbol_list


def generate_propositions(learned_operator_dir,
                          ppddl_symbol_dir,
                          domain: Domain,
                          verbose=True):

    # TODO make sure the view is correctly setup on the Domain

    operators = load_operators(learned_operator_dir, verbose=verbose)

    if verbose:
        print("Factorising state space...")

    # Factorise
    ndims = domain.state_length
    (factors, options) = factorise(operators, ndims, verbose=verbose)

    if verbose:
        print("Generating start state symbols...")

    symbol_list = generate_starting_symbol(domain, factors)

    if verbose:
        print("Start position generated " + str(len(symbol_list)) + " propositions")
        print("Generating propositions...")

    (option_symbols, symbol_list) = generate_symbol_set(operators, factors, symbol_list)

    write_propositions(ppddl_symbol_dir, symbol_list, verbose=verbose)

    return factors, operators, symbol_list, option_symbols

def generate_symbol_set(operators,
                        factors,
                        symbol_list,
                        verbose=True):
    """
    Generate the necessary propositions by identifying independent factors and, for the remaining, projecting all
    combinations of remaining factors out
    :param operators: the learned symbols
    :param factors: the factors
    :param symbol_list: the current symbol list. It should contain the start state propositions
    :return: a list of the necessary propositions
    """
    option_symbols = []
    # Process each option's effect sets.
    for operator in operators:
        sym_list = []
        for effect in operator.list_effects:
            mask = effect.mask
            eff_symbols = []
            factor_list = _extract_factors(mask, factors)
            if len(factor_list) == 1:
                # Independent. Go with it as-is.
                idx, _ = symbol_list.add(effect)
                eff_symbols = [idx]
            else:
                if verbose:
                    print(str(len(factor_list)) + " factors: ")
                count = 0

                # Integrate all combinations of factors (massive explosion here!)
                # for L in range(0, len(factor_list)):
                #     for subset in itertools.combinations(factor_list, L):
                #         new_symbol = effect
                #         for factor in subset:
                #             new_symbol = new_symbol.integrate_out(factor)
                #         idx, _ = symbol_list.add(new_symbol)
                #         eff_symbols.append(idx)
                #         count += 1

                # we're going to make symbols individual effects instead of joint. Should make merging easier
                for subset in itertools.combinations(factor_list, len(factor_list) - 1):
                    new_symbol = effect
                    for factor in subset:
                        new_symbol = new_symbol.integrate_out(factor)
                    idx, _ = symbol_list.add(new_symbol)
                    eff_symbols.append(idx)
                    count += 1

                if verbose:
                    print(str(count) + " propositions generated")
            sym_list.append(eff_symbols)
        option_symbols.append(sym_list)
    return option_symbols, symbol_list



def compute_combinations(operators):
    effects = list()
    combs = []
    for operator in operators:
        for x in operator.list_effects:
            effects.append(x.get_symbols())
    for i in range(1, len(effects) + 1):
        els = [list(x) for x in itertools.combinations(effects, i)]
        combs.extend(els)
    ret = dict
    for x in combs:
        mask = list()
        eff = list()
        for m, e in x:
            mask.append(m)
            eff.append(e)
        ret[tuple(mask)] = eff
    return ret


def describe(option):
    return str(option)


def generate_symbol_vocabulary(domain, ppddl_symbol_dir, operators, n_objects, initial_states, verbose=True):
    (factors, options) = factorise(operators, n_objects, verbose=verbose)
    if verbose:
        print("Generating start state symbols...")

    symbol_list = generate_starting_symbol(domain, factors, n_objects, initial_states)

    if verbose:
        print("Start position generated " + str(len(symbol_list)) + " propositions")
        print("Generating propositions...")

    (option_symbols, symbol_list) = generate_symbol_set(operators, factors, symbol_list)
    write_propositions(ppddl_symbol_dir, symbol_list, verbose=verbose)
    return (factors, options), (option_symbols, symbol_list)


# TODO: reduce same objects to class
def build_forward_model(domain, output_directory, ppddl_symbol_dir, operators, factors, option_symbols, symbol_list,
                        verbose=True):

    if verbose:
        print("Generating PPDDL description...")
    schemata = build_ppddl(factors, operators, symbol_list, option_symbols, verbose=verbose)
    write_schemata(ppddl_symbol_dir, schemata, verbose=verbose)
    desc = Description(str(domain), symbol_list, describe)
    for schema in schemata:
        desc.add_schema(schema)
    filename = make_path(output_directory, 'test.ppddl')
    if verbose:
        print("Writing to file " + filename)

    with open(filename, 'w') as file:
        file.write(str(desc))

    return desc
