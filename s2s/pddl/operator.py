from typing import List

from s2s.estimators.svr import SupportVectorRegressor
from s2s.learned_operator import LearnedOperator
from s2s.pddl.proposition import Proposition
from s2s.utils import indent


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
            self.name = 'option-{}-partition-{}'.format(self.option, self.partition)
            if task is not None:
                self.name = 'Task-{}-{}'.format(task, self.name)
        self._task = task
        self.preconditions = [Proposition.not_failed()]
        self.effects = list()

    @property
    def partition(self):
        return self._partition

    @property
    def option(self):
        return self._option

    def add_preconditions(self, predicates: List[Proposition]):
        self.preconditions += predicates

    def add_effect(self, effect: List[Proposition], probability: float = 1, reward: float = None):
        self.effects.append((probability, effect, reward))

    def is_probabilistic(self):
        return len(self.effects) > 1

    def __str__(self):
        return str(PrettyPrint(self))


class PrettyPrint:

    def __init__(self, operator: Operator, index=None, probabilistic=True, use_rewards=True,
                 option_descriptor=None):
        self._operator = operator
        self._probabilistic = probabilistic
        self._use_rewards = use_rewards
        self._option_descriptor = option_descriptor
        self._index = index

    def __str__(self):
        precondition = self._propositions_to_str(self._operator.preconditions)

        if self._probabilistic:
            effects = self._operator.effects
        else:
            effects = [max(self._operator.effects, key=lambda x: x[0])]  # get most probable

        if len(effects) == 1:
            end = None
            if self._use_rewards and effects[0][2] is not None:
                end = '{} (reward) {:.2f}'.format('increase' if effects[0][2] >= 0 else 'decrease',
                                                  abs(effects[0][2]))
            effect = self._propositions_to_str(effects[0][1], end=end)
        else:
            effect = '(probabilistic '
            for prob, eff, reward in effects:
                end = None
                if self._use_rewards and reward is not None:
                    end = '{} (reward) {:.2f}'.format('increase' if reward >= 0 else 'decrease', abs(reward))
                effect += indent('\n\t{} {}'.format(prob, self._propositions_to_str(eff, end)), 3)
            effect += '\n\t\t\t)\n\t'

        if self._option_descriptor is None:
            name = self._operator.name
        else:
            name = '{}-partition-{}'.format(self._option_descriptor(self._operator.option), self._operator.partition)
        if self._index is not None:
            name += '-{}'.format(self._index)

        return '(:action {}\n\t:parameters ()\n\t:precondition ({})\n\t:effect ({})\n)'.format(name,
                                                                                               precondition,
                                                                                               effect)

    def _propositions_to_str(self, propositions: List[Proposition], end=None) -> str:
        if len(propositions) == 0:
            raise ValueError("No propositions found")

        propositions = list(map(str, propositions))
        if end is not None:
            propositions.append(end)

        if len(propositions) == 1:
            return '{}'.format(propositions[0])
        return 'and {}'.format(' '.join(['({})'.format(x) for x in propositions]))

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
#
#
# import numpy as np
#
# from warnings import warn
#
# from symbols.domain.domain import Domain
# from symbols.symbols.distribution_symbol import DistributionSymbol
# from symbols.symbols.kde import KernelDensityEstimator
#
# __author__ = 'Steve James'
#
# NOT_FAILED = 'notfailed' # KernelDensityEstimator.not_failed()
#
#
# class Schema:
#
#     def __init__(self, option, partition):
#         """
#         Create a new action schema
#         :param option:  the option identifier
#         :param partition: the partition identifier
#         """
#         self.option = option
#         self.partition = partition
#         self._preconditions = list()
#         # self._conditional_effects = list()
#         self._effects = list()
#         self._id = 0
#         self._precondition_conjunction = None
#         self.action_descriptor = None
#
#     def set_id(self, id):
#         self._id = id
#
#     def add_precondition(self, symbols):
#         """
#         Add a new precondition to the schema
#         :param symbols: a conjunction of symbols in a list
#         """
#         if len(self._preconditions) > 0:
#             warn("Not allowing disjunctions in preconditions (unlike ADL). Ignoring...")
#         else:
#             self._preconditions.append(symbols)
#             self._precondition_conjunction = DistributionSymbol.conjoin(
#                 [x for x in self._preconditions[0] if str(x) != str(NOT_FAILED)])
#
#     def add_effect(self, conjunction):
#         """
#         Add a new effect to the schema
#         :param conjunction: the action rule
#         """
#         self._effects.append(conjunction)
#
#     # def add_conditional_effect(self, rule: Rule):
#     #     """
#     #     Add a new conditional effect to the schema
#     #     :param rule: the action rule
#     #     """
#     #     self._effects.append(rule)
#
#     def log_likelihood(self, state):
#         return self._precondition_conjunction.score(state)
#
#     def rule_probabilities(self, state):
#         """
#         Calculate the probability of the state belonging to the distribution represented by each respective effect
#         :param state: the state
#         :return: the list of probabilities
#         """
#         log_likelihoods = [rule.log_likelihood(state) for rule in self._effects]
#         # Shove them through a softmax
#         e_x = np.exp(log_likelihoods - np.max(log_likelihoods))
#         return e_x / e_x.sum()
#
#     def __str__(self):
#         name = self.option_name.replace(' ', '-')
#         return '\t;Action ' + name + '-partition-' + str(self.partition) + '\n' + \
#                '\t(:action ' + name + '_' + str(self._id) + '\n' + \
#                '\t :parameters()\n' + \
#                '\t :precondition ' + self._precondition_to_str() + '\n' + \
#                '\t :effect ' + self._effect_to_str() + '\n' + \
#                '\t)'
#
#     @property
#     def option_name(self):
#         names = ['Walk to', 'Attack', 'Pickup', 'Walk North Door', 'Walk South Door', 'Through Door', 'Craft', 'Open Chest', 'Toggle Door']
#         return names[self.option]
#         # if self.action_descriptor is None:
#         #     return str(self.option)
#         # return self.action_descriptor(self.option)
#
#     def _precondition_to_str(self):
#         if len(self._preconditions) > 1:
#             return '(' + ' or '.join([Schema.conjunction_to_str(p) for p in self._preconditions]) + ')'
#
#         return Schema.conjunction_to_str(self._preconditions[0])
#
#     def _effect_to_str(self):
#
#         if len(self._effects) == 1:
#             return str(self._effects[0])
#
#         #TODO: hack - fix this - just checking PDDL validity
#         # if self._effects[0].probability > 0.50:
#         #     return str(self._effects[0])
#         # return str(self._effects[1])
#
#         return '(probabilistic\n' + '\n'.join(['\t\t\t\t' + str(rule) for rule in self._effects]) + '\n\t\t\t )'
#
#     @staticmethod
#     def conjunction_to_str(symbols):
#
#         if len(symbols) == 1:
#             return ' '.join(['(' + str(symbol) + ')' for symbol in symbols])
#
#         return '(and ' + ' '.join(['(' + str(symbol) + ')' for symbol in symbols]) + ')'
#
#     @property
#     def rules(self):
#         return self._effects
#     #
#     #
#     # @staticmethod
#     # def evaluate(domain: Domain,
#     #              option,
#     #              partitioned_options,
#     #              n_samples=100):
#     #
#     #     for _ in range(n_samples):
#     #         state, next_state = Schema._sample_domain(domain, option)
#     #
#     #         for partition_id, candidates in partitioned_options.items():
#     #             print("Checking partition " + str(partition_id))
#     #
#     #             for candidate in candidate:
#     #
#
#     #
#     #
#     #
#     #
#     #
#     # def evaluate(self, domain: Domain, n_samples):
#     #
#     #     prob = 0
#     #
#     #     for effect in self._effects:
#     #
#     #         if effect._conjunction is None:
#     #             continue
#     #
#     #         states = self._precondition_conjunction.get_samples(n_samples)
#     #         next = np.array([self._sample_domain(domain, state, self._precondition_conjunction.get_mask()) for state in states])
#     #         # next_states = next[::2]
#     #         # next_rewards = next[1::2]
#     #
#     #         score = np.mean([effect.log_likelihood(state) for state in next])
#     #         p = 0
#     #         # score_rewards = abs(np.mean(next_rewards) - effect.reward)
#     #
#     # def _sample_domain(self, domain: Domain, state, mask):
#     #
#     #     s = np.random.uniform(0, 1, len(domain.current_state))
#     #     s[mask] = state
#     #     domain.init(s)
#     #     if domain.can_execute(self.option):
#     #         st, reward, _, _ = domain.step(self.option)
#     #         return st
#     #     return list(s)
#     #
#     #     # if domain.can_execute(self.option):
#     #     #     state, reward, _, _ = domain.step(self.option)
#     #     #     return state, reward
#     #     # return list(s), -1
#
#
# from symbols.pddl.predicate import Predicate, TypedPredicate, NamedParameterPredicate
#
#
# #  operator description. Does not support probabilistic effects!
# class Operator:
#     def __init__(self, name, option, partition):
#         self.name = name.replace(' ', '-')  # NB ensure no spaces in name
#         self.preconditions = [Predicate('notfailed')]
#         self.effects = list()
#         self._option = option
#         self._partition = partition
#         self._linking = list()  # map from problem space symbol to problem space symbol
#
#     @property
#     def partition(self):
#         return self._partition
#
#     @property
#     def option(self):
#         return self._option
#
#     # todo: LOOK AT
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
#     def add_precondition(self, predicate: Predicate):
#         self.preconditions.append(predicate)
#
#     def add_effect(self, predicate: Predicate):
#         self.effects.append(predicate)
#
#     def link(self, precondition: Predicate, effect: Predicate):
#         self._linking.append((precondition, effect))
#
#     def __str(self, precondition: Predicate, effect: Predicate):  # problem_space preconditions and effects
#         pre = ''
#         if len(self.preconditions) > 0:
#             pre += 'and '
#         pre += ' '.join(['({})'.format(p) for p in self.preconditions])
#
#         if precondition is not None:
#             pre += ' ({})'.format(precondition)
#
#         eff = ''
#         if len(self.effects) > 0:
#             eff += 'and '
#         eff += ' '.join(['({})'.format(e) for e in self.effects])
#
#         if effect is not None:
#             eff += ' ({})'.format(effect)
#             eff += ' ({})'.format(precondition.negate())
#
#         return '\t(:action {}\n' \
#                '\t :parameters ()\n' \
#                '\t :precondition ({})\n' \
#                '\t :effect ({})\n' \
#                '\t)'.format(self.name, pre, eff)
#
#     def __str__(self):
#
#         if len(self._linking) == 0:
#             return self.__str(None, None)
#         return '\n\n'.join([self.__str(p, e) for p, e in self._linking])
#
#
# # typed operator description. Does not support probabilistic effects!
# class TypedOperator(Operator):
#     def __init__(self, name, option, partition):
#         super().__init__(name, option, partition)
#         self.id = -1
#         self.child_type = dict()
#         self._child_type = list()  # list of old types and the new ones!
#         # not doing probablistic effects, but will do probabilistic failures!
#         self.failure_probability = 0
#         self.probabilistic = False
#
#     def _create_named_predicate(self, predicate: TypedPredicate, variable_names):
#         if not predicate.is_grounded():
#             return predicate
#         names = list()
#         for object in predicate.grounding:
#             names.append(variable_names[object])
#         return NamedParameterPredicate(predicate, names)
#
#     def instantiate_object(self, param_idx, new_type):
#
#         if param_idx == -1:
#             self._child_type.append((None, None))
#             return
#
#         # change the parameter at the index to be the new type
#         predicate = self.preconditions[param_idx + 1]  # plus one because first is always notfailed
#         groundings = predicate.grounding
#         if len(groundings) != 1:
#             raise NotImplementedError("Haven't tackled predicates with multiple groundings")
#         # predicate.param_types[0] = new_type
#         self._child_type.append((predicate.param_types[0], new_type))
#         self.child_type[predicate.param_types[0]] = new_type
#
#     def __type(self, type, old_type, new_type):
#         if old_type is None:
#             if new_type is not None:
#                 raise ValueError
#             return type
#         if type == old_type:
#             return new_type
#         return type
#
#     def __str(self, linking_precondition: Predicate, linking_effect: Predicate, old_type: str, new_type: str,
#               variant=None):
#         object_to_var_name = dict()
#         params = list()
#         for predicate in self.preconditions:
#             if not predicate.is_grounded():
#                 continue
#             for object, type in predicate.ground_types():
#                 if object not in object_to_var_name:
#                     object_to_var_name[object] = chr(ord('w') + len(object_to_var_name))
#                 variable_name = object_to_var_name[object]
#                 params.append((variable_name, type))
#
#         params = ' '.join(
#             ['?{} - {}'.format(var, self.__type(type, old_type, new_type)) for (var, type) in
#              params])
#         pre = ''
#         if len(self.preconditions) > 0:
#             pre += 'and '
#         pre += ' '.join(
#             ['({})'.format(self._create_named_predicate(p, object_to_var_name)) for p in self.preconditions])
#
#         if linking_precondition is not None:
#             pre += ' ({})'.format(linking_precondition)
#
#         eff = ''
#         if len(self.effects) > 0:
#             eff += 'and '
#         eff += ' '.join(['({})'.format(self._create_named_predicate(e, object_to_var_name)) for e in self.effects])
#
#         if linking_effect is not None:
#             eff += ' ({})'.format(linking_effect)
#             eff += ' ({})'.format(linking_precondition.negate())
#
#         if self.probabilistic and self.failure_probability > 0:
#             prob = round(self.failure_probability, 2)
#             eff = 'probabilistic {} {} {} ({})'.format(prob, '(not (notfailed))', 1 - prob, eff)
#
#         name = '{}-{}'.format(self.name, self.id)
#         if variant is not None:
#             name += variant
#
#         return '\t(:action {}\n' \
#                '\t :parameters ({})\n' \
#                '\t :precondition ({})\n' \
#                '\t :effect ({})\n' \
#                '\t)'.format(name, params, pre, eff)
#
#     def __str__(self):
#
#         if len(self._linking) != len(self._child_type):
#             raise ValueError
#
#         if len(self._linking) == 0:
#             return self.__str(None, None, None, None)
#         return '\n\n'.join(
#             [self.__str(precondition, effect, old_type, new_type, variant=chr(ord('a') + i)) for
#              i, ((precondition, effect), (old_type, new_type))
#              in enumerate(zip(self._linking, self._child_type))])
#
#     def extract_symbol_names(self):
#         """
#         Get the names of all symbols mentioned in this operator (except notfailed!)
#         """
#         names = set()
#         for pred in self.preconditions + self.effects:
#             if isinstance(pred, TypedPredicate):
#                 names.add(pred.name)
#         return names
#
