import copy


class Predicate:
    """
    A non-typed, non-lifted predicate (i.e. a proposition)
    """

    def __init__(self, name: str):
        self._name = name
        self.sign = 1  # whether true or the negation of the predicate

    @property
    def name(self) -> str:
        return self._name

    def is_grounded(self) -> bool:
        return False

    def negate(self):
        """"
        Creates a copy of the predicate, negated
        """
        clone = copy.copy(self)
        clone.sign *= -1
        return clone

    def __str__(self):
        if self.sign < 0:
            return 'not ({})'.format(self.name)
        return self.name
