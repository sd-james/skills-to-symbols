# (define (problem items)
#    (:domain simple)
#
#    (:objects agent - agent
# 			 door1 - door
# 			 door2 - door
# 			 door3 - door
# 			 door4 - otherDoor
# 			 inventory - inventory
# 			 gold - gold
# 			 redstone -redstone
# 			 chest - chest
# 			 pickaxe - pickaxe
#    )
#
#    (:init (symbol_1 inventory)
#           (symbol_2 gold)
#           (symbol_3 redstone)
#           (symbol_4 chest)
#           (symbol_5 pickaxe)
#           (symbol_6 door4)
#           (symbol_7 door1)
#           (symbol_7 door2)
#           (symbol_7 door3)
#           (symbol_10 agent)
#           (notfailed)
#     )
#    (:goal (symbol_46 chest) )
# )
from typing import List

from s2s.pddl.proposition import Proposition
from s2s.utils import indent


class PDDLProblem:
    def __init__(self, problem_name: str, domain_name: str):
        self.name = problem_name
        self.domain = domain_name
        self.start_propositions = list()
        self.goal_propositions = list()

    def add_start_proposition(self, proposition: Proposition):
        self.start_propositions.append(proposition)

    def add_goal_proposition(self, proposition: Proposition):
        self.goal_propositions.append(proposition)


    def __str__(self):

        init = indent('\n'.join(['({})'.format(x) for x in self.start_propositions]), 2)
        goal = indent(self._propositions_to_str(self.goal_propositions), 2)
        description = ' (define (problem {})\n' \
                      '\t(:domain {})\n\n' \
                      '\t(:init\n{}\n' \
                      '\t)\n\n' \
                      '\t(:goal\n{}\n' \
                      '\t)\n)'.format(self.name, self.domain, init, goal)
        return description

    def _propositions_to_str(self, propositions: List[Proposition]) -> str:
        if len(propositions) == 0:
            raise ValueError("No propositions found")

        if len(propositions) == 1:
            return '({})'.format(propositions[0])
        return '(and {})'.format(' '.join(['({})'.format(x) for x in propositions]))
