from typing import Iterable, List, Any

import gym

from s2s.env import S2SEnv
from s2s.pddl import operator
from s2s.pddl.operator import Operator, PrettyPrint
from s2s.pddl.proposition import Proposition
from s2s.utils import indent


class PDDLDomain:

    def __init__(self, env: S2SEnv, vocabulary: List[Proposition], operators: Iterable[Operator], **kwargs):
        self._env = env
        self._vocabulary = vocabulary
        self._operators = operators
        self._probabilistic = kwargs.get('probabilistic', True)
        self._rewards = kwargs.get('rewards', True)

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

    # from sklearn.cluster import DBSCAN
    #
    # START_CHAR = ord('w')
    #
    # # CLASSES = {0: 'Hand', 1: 'Block', 3: 'Slippy'}
    #
    # CLASSES = {i: 'type_{}'.format(i) for i in range(20)}
    #
    # CLASSES = {0: 'agent', 1: 'door', 9: 'inventory', 8: 'gold', 7: 'redstone', 6: 'chest', 5: 'pickaxe',
    #            4: 'otherDoor'}
    #
    # import numpy as np
    #
    # class TypedSymbol:
    #     def __init__(self, symbol, object_class):
    #         self.symbol = symbol
    #         self._mask = [object_class.get(i) for i in symbol.mask]
    #
    #     def __str__(self):
    #         return self.name
    #
    #     @property
    #     def mask(self):
    #         return self._mask
    #
    #     @property
    #     def name(self):
    #         return self.symbol.name
    #
    #     def is_similar(self, other):
    #         similar = np.array_equal(self.mask, other.mask) and self._is_similar(self.symbol, other.symbol)
    #         return similar
    #
    #     def _is_similar(self, A, B):
    #         n_samples = 1000
    #         x = A.sample(n_samples)
    #         x = np.array([np.hstack(i) for i in x])
    #         y = B.sample(n_samples)
    #         y = np.array([np.hstack(i) for i in y])
    #         if x.shape != y.shape:
    #             return False
    #         data = np.concatenate((x, y))
    #         eps = 0.5  # 1
    #         db = DBSCAN(eps=eps).fit(data)
    #         labels = set(db.labels_)
    #         if -1 in labels:
    #             labels.remove(-1)
    #         return len(labels) == 1
    #
    # class Predicate:
    #     def __init__(self, name):
    #         self.name = name
    #         self.params = list()
    #         self.types = list()
    #         self.sign = 1
    #
    #     def add_param(self, name, type):
    #         self.params.append(name)
    #         self.types.append(type)
    #
    #     def __call__(self, *parameters):
    #         pred = Predicate(self.name)
    #         pred.params = list(parameters)
    #         return pred
    #
    #     def __str__(self):
    #         if len(self.params) == 0:
    #             return self.name
    #         if len(self.types) == 0:
    #             return self.invoke_str()
    #         s = '{} {}'.format(self.name,
    #                            ' '.join(['?{} - {}'.format(name, t) for name, t in zip(self.params, self.types)]))
    #         if self.sign < 0:
    #             return 'not ({})'.format(s)
    #         return s
    #
    #     def invoke_str(self):
    #         if len(self.params) == 0:
    #             return self.name
    #         s = '{} {}'.format(self.name,
    #                            ' '.join(['?{}'.format(name) for name in self.params]))
    #         if self.sign < 0:
    #             return 'not ({})'.format(s)
    #         return s
    #
    # class Operator:
    #     def __init__(self, name):
    #         self.name = name
    #         self.preconditions = [Predicate('notfailed')]
    #         self.effects = list()
    #         self.object_type = dict()
    #
    #     def is_duplicate(self, other):
    #         ps = sorted([p.name for p in self.preconditions])
    #         o_ps = sorted([p.name for p in other.preconditions])
    #
    #         if ps != o_ps:
    #             return False
    #
    #         es = sorted([p.name for p in self.effects])
    #         o_es = sorted([p.name for p in other.effects])
    #
    #         return es == o_es
    #
    #     def add_precondition(self, predicate, objects, classes):
    #         vars = list()
    #         for object, t in zip(objects, classes):
    #             if object not in self.object_type:
    #                 self.object_type[object] = (chr(len(self.object_type.keys()) + START_CHAR), t)
    #             var, type = self.object_type[object]
    #             vars.append(var)
    #         self.preconditions.append(predicate(*vars))
    #
    #     def add_effect(self, predicate, objects, classes, sign):
    #         vars = list()
    #         for object, t in zip(objects, classes):
    #             if object not in self.object_type:
    #                 self.object_type[object] = (chr(len(self.object_type.keys()) + START_CHAR), t)
    #             var, type = self.object_type[object]
    #             vars.append(var)
    #         pred = predicate(*vars)
    #         pred.sign = sign
    #         self.effects.append(pred)
    #
    #     def __str__(self):
    #         params = ' '.join(['?{} - {}'.format(var, CLASSES[t]) for _, (var, t) in self.object_type.items()])
    #         pre = ''
    #         if len(self.preconditions) > 0:
    #             pre += 'and '
    #         pre += ' '.join(['({})'.format(p) for p in self.preconditions])
    #         eff = ''
    #         if len(self.effects) > 0:
    #             eff += 'and '
    #         eff += ' '.join(['({})'.format(e) for e in self.effects])
    #
    #         return '\t(:action {}\n' \
    #                '\t :parameters ({})\n' \
    #                '\t :precondition ({})\n' \
    #                '\t :effect ({})\n' \
    #                '\t)'.format(self.name, params, pre, eff)
    #
    # class TypedDescription:
    #     def __init__(self, pddl, object_class, n_objects):
    #         self.propositional = pddl
    #         self.object_class = object_class
    #
    #     def typed(self, symbols):
    #         mapping = dict()
    #         merged = list()
    #         for symbol in symbols:
    #             symbol = TypedSymbol(symbol, self.object_class)
    #             dup = False
    #             for other in merged:
    #                 if symbol.is_similar(other):
    #                     dup = True
    #                     mapping[symbol.name] = other.name
    #                     # print('{} = {}'.format(symbol, other))
    #                     break
    #             if not dup:
    #                 merged.append(symbol)
    #         return merged, mapping
    #
    #     def to_str(self):
    #         domain_name = self.propositional._domain_name
    #         domain_name = 'simple'
    #         description = "; Automatically generated " + domain_name + " domain PPDDL file.\n"
    #         description += "(define (domain " + domain_name + ")\n"
    #         description += "\t(:requirements :strips :typing)\n"
    #         description += "\t(:types {})\n".format(' '.join([x for _, x in CLASSES.items()]))
    #
    #         symbols = self.propositional._symbols
    #         symbols, redundant = self.typed(symbols)
    #         symbols_to_preds = dict()
    #         description += "\t(:predicates\n"
    #         for symbol in symbols:
    #             pred = Predicate(symbol.name)
    #             for i, object in enumerate(symbol.mask):
    #                 var_name = chr(START_CHAR + i)
    #                 type = CLASSES[self.object_class.get(object)]
    #                 pred.add_param(var_name, type)
    #             symbols_to_preds[symbol.name] = pred
    #             description += ("\t\t(" + str(pred) + ")\n")
    #         description += ("\t\t(notfailed)\n")
    #         description += '\t)\n'
    #
    #         operators = list()
    #
    #         for schema in self.propositional._schemata:
    #             operator = Operator(schema.option_name + '-partition-' + str(schema.partition))
    #             for pre in schema._preconditions:
    #                 for p in pre:
    #                     if isinstance(p, str):
    #                         continue
    #                     if p.name in redundant:
    #                         q = redundant[p.name]
    #                     else:
    #                         q = p.name
    #                     operator.add_precondition(symbols_to_preds[q], p.mask,
    #                                               [self.object_class.get(i) for i in p.mask])
    #             # if len(schema.rules) > 1:
    #             #     raise ValueError("Not implemented yet")
    #
    #             # TODO Fix bug with duplicates
    #             fix = set()
    #             for rule in schema.rules:
    #                 for wrapper in rule.symbols:
    #
    #                     if isinstance(wrapper.symbol, str):
    #                         continue  # TODO FIX!!!
    #                     else:
    #                         name = wrapper.symbol.name
    #                     if name in redundant:
    #                         name = redundant[name]
    #
    #                     pred = symbols_to_preds[name]
    #                     p = wrapper.symbol
    #                     if wrapper.sign < 0:
    #                         if p.name in fix:
    #                             continue
    #                         fix.add(p.name)
    #                     operator.add_effect(pred, p.mask, [self.object_class.get(i) for i in p.mask], wrapper.sign)
    #             dup = False
    #             for other in operators:
    #                 if operator.is_duplicate(other):
    #                     dup = True
    #                     break
    #             if not dup:
    #                 operators.append(operator)
    #         for operator in operators:
    #             description += str(operator) + "\n\n"
    #         # description = description.replace('Red', 'Block')
    #         # description = description.replace('Blue', 'Block')
    #         # description = description.replace('Green', 'Block')
    #
    #         return description + ')', len(operators)
    #
    #         # class Description:
    #         #     def __init__(self, domain_name, symbols, action_descriptor):
    #         #         self._domain_name = domain_name
    #         #         self._symbols = symbols
    #         #         self._schemata = list()
    #         #         self._action_descriptor = action_descriptor
    #         #
    #         #     def add_schema(self, schema: Schema):
    #         #         schema.set_id(len(self._schemata))
    #         #         schema.action_descriptor = self._action_descriptor
    #         #         self._schemata.append(schema)
    #         #
    #         #     def __str__(self):
    #         #         description = "; Automatically generated " + self._domain_name + " domain PPDDL file.\n"
    #         #         description += "(define (domain " + self._domain_name + ")\n"
    #         #         description += "\t(:requirements :strips :probabilistic-effects :rewards)\n"
    #         #         description += "\t(:predicates\n"
    #         #         description += "   \t\t(notfailed)\n"
    #         #         for i in range(len(self._symbols)):
    #         #             description += ("\t\t(" + str(self._symbols[i]) + ")\n")
    #         #         description += "\t)\n\n"
    #         #         description += "\t(:functions (partition))\n\n"
    #         #         description += '\n\n'.join([str(s) for s in self._schemata])
    #         #
    #         #         return description + '\n)'
