from typing import Callable

from s2s.estimators.kde import KernelDensityEstimator

__author__ = 'Steve James and George Konidaris'

from s2s.pddl.proposition import Proposition


class UniquePredicateList:
    """
    A class that wraps a list. The user add density estimators to the list, and they are wrapped in PDDL predicates.
    The list automatically deals with duplicates
    """

    def __init__(self, comparator: Callable[[KernelDensityEstimator, KernelDensityEstimator], bool] = None):
        """
        Create a list data structure that ensues no duplicates are added to the list
        :param comparator: a function that accepts two objects and returns whether they are equal
        """
        self._comparator = comparator if comparator is not None else lambda x, y: x is y
        self._list = list()
        self.__idx = 0

    def append(self, item: KernelDensityEstimator) -> Proposition:
        """
        Add an item to the list
        :param item: the item to add
        :return: the predicate in the list. If the item is a duplicate, the predicate will refer to the
        existing item in the list
        """
        for x in self._list:
            if self._comparator(item, x):
                return x
        idx = len(self._list)
        predicate = Proposition('symbol_{}'.format(idx), item)
        self._list.append(predicate)
        return predicate

    def __iter__(self):
        self.__idx = 0
        return self

    def __next__(self) -> Proposition:
        if self.__idx < 0 or self.__idx >= len(self):
            raise StopIteration
        x = self._list[self.__idx]
        self.__idx += 1
        return x

    def __len__(self):
        return len(self._list)