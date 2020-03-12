from typing import Tuple, List, Generator

from s2s.estimators.kde import KernelDensityEstimator
from s2s.estimators.svc import SupportVectorClassifier
from s2s.estimators.svr import SupportVectorRegressor
from s2s.core.partitioned_option import PartitionedOption

__author__ = 'Steve James and George Konidaris'


class LearnedOperator:
    """
    Class that hold data for describing a high-level operator. This includes the partitioned option, the precondition
    and the effect
    """

    def __init__(self, partitioned_option: PartitionedOption, precondition: SupportVectorClassifier,
                 outcomes: List[Tuple[float, KernelDensityEstimator, SupportVectorRegressor]], task_id: int = None):
        #  self._partitioned_option = partitioned_option  # no need to save
        self._precondition = precondition
        self._outcomes = outcomes
        self._option = partitioned_option.option
        self._partition = partitioned_option.partition
        self._task_id = task_id if task_id is not None else -1

    def __eq__(self, other) -> bool:
        """
        We check for equality by simply seeing if the learned operators refer to the same option, partition and task
        :param other: the other learned operator
        """
        return self._task_id == other._task_id and self.option == other.option and self.partition == other.partition

    def __hash__(self):
        id: Tuple[int, int, int] = (self._task_id, self.option, self.partition)
        return hash(id)

    @property
    def precondition(self):
        return self._precondition

    @property
    def option(self):
        return self._option

    @property
    def partition(self):
        return self._partition

    @property
    def probabilistic(self):
        return len(self._outcomes) > 1

    def outcomes(self) -> Generator[Tuple[float, KernelDensityEstimator, SupportVectorRegressor], None, None]:
        for probability, effect, reward in self._outcomes:
            yield probability, effect, reward
