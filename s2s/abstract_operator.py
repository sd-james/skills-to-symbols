
class Operator:
    """
    Class that hold data for describing a high-level operator. This includes the partitioned option, the precondition
    and the effect
    """

    def __init__(self, partitioned_option, precondition, outcomes):
        self._partitioned_option = partitioned_option
        self._precondition = precondition
        self._outcomes = outcomes

    @property
    def option(self):
        return self._partitioned_option.option

    @property
    def partition(self):
        return self._partitioned_option.partition

    @property
    def probabilistic(self):
        return len(self._outcomes) > 1