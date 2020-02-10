import pandas as pd
import numpy as np
from typing import List

from s2s.utils import pd2np


class PartitionedOption:
    """
    This class holds the data representing a single partitioned option
    """
    def __init__(self, option: int, partition: int, init_cluster: pd.DataFrame, effects: List[pd.DataFrame]):
        self._option = option
        self._partition = partition
        self._states = pd2np(init_cluster['state'])
        total_samples = sum(len(effect['next_state']) for effect in effects)
        self._effects = [(len(effect['next_state']) / total_samples, effect[['reward', 'next_state', 'mask']]) for
                         effect in effects]

    @property
    def option(self):
        return self._option

    @property
    def partition(self):
        return self._partition

    @property
    def states(self):
        return self._states
