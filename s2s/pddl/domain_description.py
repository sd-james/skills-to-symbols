from typing import Iterable, List

from s2s.env.s2s_env import S2SEnv
from s2s.pddl.operator import Operator, PrettyPrint
from s2s.pddl.proposition import Proposition
from s2s.pddl.unique_list import UniquePredicateList
from s2s.utils import indent


class PDDLDomain:

    def __init__(self, env: S2SEnv, vocabulary: UniquePredicateList, operators: List[Operator], **kwargs):
        self._env = env
        self._vocabulary = vocabulary
        self._operators = operators
        self._probabilistic = kwargs.get('probabilistic', True)
        self._rewards = kwargs.get('specify_rewards', True)

    @property
    def operators(self) -> List[Operator]:
        return self._operators

    def __str__(self):
        comment = ';Automatically generated {} domain PPDDL file.'.format(self._env.name)
        definition = 'define (domain {})'.format(self._env.name)
        requirements = '(:requirements :strips{}{})'.format(' :probabilistic-effects' if self._probabilistic else '',
                                                            ' :rewards' if self._rewards else '')

        symbols = '({})\n'.format(Proposition.not_failed()) + '\n'.join(
            ['({})'.format(x) for x in self._vocabulary])

        predicates = '(:predicates\n{}\n)'.format(indent(symbols))

        format_spec = ':'
        if self._probabilistic:
            format_spec += 'p'
        if self._rewards:
            format_spec += 'r'

        operators = '\n\n'.join(
            [str(PrettyPrint(x, i, self._probabilistic, self._rewards, self._env.describe_option)) for i, x in
             enumerate(self._operators)])

        description = '{}\n({}\n{}\n\n{}\n\n{}\n)'.format(
            comment,
            definition,
            indent(requirements),
            indent(predicates),
            indent(operators)
        )
        return description
