from collections import defaultdict
from typing import List, Dict, Tuple, Iterable

import numpy as np

from s2s.env import S2SEnv
from s2s.image import Image
from s2s.partitioned_option import PartitionedOption
from s2s.pddl.proposition import Proposition
from s2s.utils import show, exists, make_dir, make_path


def visualise_symbols(directory: str, env: S2SEnv, symbols: Iterable[Proposition], verbose=False, **kwargs) -> None:
    """
    Visualise a set symbols
    :param directory: the directory to save them to
    :param env: the domain
    :param symbols: the list of propositions
    :param verbose: the verbosity level
    """

    n_samples = 100
    make_dir(directory)  # make directory if not exists
    for symbol in symbols:
        show("Visualising {}".format(symbol), verbose)
        samples = np.full((n_samples, env.observation_space.shape[0]), np.nan)
        samples[:, symbol.mask] = symbol.sample(n_samples)
        if kwargs.get('render', None) is not None:
            im = kwargs.get('render')(samples)
        else:
            im = Image.merge([env.render_state(state, agent_alpha=0.5) for state in samples])
        filename = '{}_{}.bmp'.format(symbol, symbol.mask)
        Image.save(im, make_path(directory, filename), mode='RGB')


def visualise_partitions(directory: str,
                         env: S2SEnv,
                         option_partitions: Dict[int, List[PartitionedOption]],
                         verbose=False,
                         **kwargs) -> None:
    """
    Visualise a set of partitions and write them to file
    :param directory: the directory to save images to
    :param env: the domain
    :param option_partitions: a dictionary listing, for each option, a list of partitions
    :param verbose: the verbosity level
    :return: a mapping that stores for each option and partition, an image of the start and end states
    (with associated probabilities)
    """
    option_descriptor = kwargs.get('option_descriptor',
                                   lambda option: 'Option-{}'.format(option))  # a function that describes the operator
    make_dir(directory)
    for option, partitions in option_partitions.items():

        show("Visualising option {} with {} partition(s)".format(option, len(partitions)), verbose)

        for partition in partitions:

            effects = list()
            for probability, states, _, next_states, mask, in partition.effects():
                start = env.render_states(states)
                end = env.render_states(next_states)
                effects.append((probability, start, mask, end))
            show("Visualising option {}, partition {}".format(option, partition.partition), verbose)
            for i, (probability, start, masks, effect) in enumerate(effects):
                filename = '{}-{}-init.bmp'.format(option_descriptor(option), partition.partition)
                Image.save(start, make_path(directory, filename), mode='RGB')
                filename = '{}-{}-eff-{}-{}-{}.bmp'.format(option_descriptor(option), partition.partition, i,
                                                           round(probability * 100), list(np.unique(masks)))
                Image.save(effect, make_path(directory, filename), mode='RGB')
