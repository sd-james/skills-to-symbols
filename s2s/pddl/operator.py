from typing import List

from s2s.estimators.svr import SupportVectorRegressor
from s2s.learned_operator import LearnedOperator
from s2s.pddl.predicate import Predicate


class Operator:
    def __init__(self, learned_operator: LearnedOperator, name: str = None, task: int = None):
        """
        Create a new PDDL operator
        :param learned_operator: the estimated operator
        :param name: the name of the operator (optional)
        :param task: the task ID (ignore this if there is only one task)
        """
        self._option = learned_operator.option
        self._partition = learned_operator.partition
        self._learned_operator = learned_operator

        if name is not None:
            self.name = name.replace(' ', '-')
        else:
            self.name = 'Option-{}-Partition-{}'.format(self.option, self.partition)
            if task is not None:
                self.name = 'Task-{}-{}'.format(task, self.name)
        self._task = task
        self.preconditions = [Predicate.not_failed()]
        self.effects = list()

    @property
    def partition(self):
        return self._partition

    @property
    def option(self):
        return self._option

    def add_preconditions(self, predicates: List[Predicate]):
        self.preconditions += predicates

    def add_effect(self, effect: List[Predicate], probability: float = 1, reward: float = None):
        self.effects.append((probability, effect, reward))

    def is_probabilistic(self):
        return len(self.effects) > 1

    # # todo: LOOK AT
    # def is_duplicate(self, other):
    #     ps = sorted([p.name for p in self.preconditions])
    #     o_ps = sorted([p.name for p in other.preconditions])
    #
    #     if ps != o_ps:
    #         return False
    #
    #     es = sorted([p.name for p in self.effects])
    #     o_es = sorted([p.name for p in other.effects])
    #
    #     return es == o_es
    #
    # def add_precondition(self, predicate: Predicate):
    #     self.preconditions.append(predicate)
    #
    # def add_effect(self, predicate: Predicate):
    #     self.effects.append(predicate)
    #
    # def link(self, precondition: Predicate, effect: Predicate):
    #     self._linking.append((precondition, effect))
    #
    # def __str(self, precondition: Predicate, effect: Predicate):  # problem_space preconditions and effects
    #     pre = ''
    #     if len(self.preconditions) > 0:
    #         pre += 'and '
    #     pre += ' '.join(['({})'.format(p) for p in self.preconditions])
    #
    #     if precondition is not None:
    #         pre += ' ({})'.format(precondition)
    #
    #     eff = ''
    #     if len(self.effects) > 0:
    #         eff += 'and '
    #     eff += ' '.join(['({})'.format(e) for e in self.effects])
    #
    #     if effect is not None:
    #         eff += ' ({})'.format(effect)
    #         eff += ' ({})'.format(precondition.negate())
    #
    #     return '\t(:action {}\n' \
    #            '\t :parameters ()\n' \
    #            '\t :precondition ({})\n' \
    #            '\t :effect ({})\n' \
    #            '\t)'.format(self.name, pre, eff)
    #
    # def __str__(self):
    #
    #     if len(self._linking) == 0:
    #         return self.__str(None, None)
    #     return '\n\n'.join([self.__str(p, e) for p, e in self._linking])
