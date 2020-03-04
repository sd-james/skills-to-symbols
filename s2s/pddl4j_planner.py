import enum
from subprocess import Popen, PIPE
from typing import Tuple, List, Any

from s2s.utils import exists


class Planner(enum.Enum):
    """
    Enums that specify the type of planner to use
    """
    HSP = 0  # default
    FF = 1
    FF_ANYTIME = 2


class PDDL4JPlanner:
    """
    A class that wraps Java's PDDL4J library.
    """

    def __init__(self, path_to_jar: str, planner: Planner = Planner.HSP, max_time=10, initial_memory=2048,
                 max_memory=2048, **kwargs):
        """
        Create a new PDDL planner object
        :param path_to_jar: the path to PDDL4J's JAR file
        :param planner: the type of planner to use. Default is HSP
        :param max_time: the maximum time in seconds the planner is allowed. Default is 10
        :param initial_memory: the initial memory allocation. Default is 2048 Mb
        :param max_memory: the maximum memory allocation. Default is 2048 Mb
        :param kwargs: allows user to specify additional PDDL4J settings. See this file for more:
         https://github.com/pellierd/pddl4j/blob/master/src/main/java/fr/uga/pddl4j/planners/statespace/StateSpacePlannerFactory.java
        """
        if not exists(path_to_jar):
            raise ValueError("Could not find JAR file at {}".format(path_to_jar))

        # prevent using PDDL4J arguments that will be set by us
        if any(item in kwargs for item in 'opft'):
            raise ValueError("Cannot use PDDL4J arguments -o, -p -f -t")

        self._jar_path = path_to_jar
        self._planner = planner
        self._initial_memory = initial_memory
        self._max_memory = max_memory
        self._max_time = max_time
        self._params = [str(item) for k in kwargs for item in (k, kwargs[k])]
        self._params = ['-{}'.format(x) if i % 2 == 0 else x for i, x in enumerate(self._params)]

    def find_plan(self, domain_path: str, problem_path: str) -> Tuple[bool, bool, Any]:
        """
        Given a path to the PDDL domain and problem file, determine if a plan can be found
        :param domain_path: the path to the domain file
        :param problem_path: the path to the problem file
        :return: the first boolean represents whether the files were valid PDDL, the second represents whether a plan
        could be found, and the third is a list of output from the planner
        """
        main_class = 'fr.uga.pddl4j.planners.statespace.StateSpacePlannerFactory'
        p = Popen(
            ['java',
             '-javaagent:{}'.format(self._jar_path),
             '-server',
             '-Xms{}m'.format(self._initial_memory),
             '-Xmx{}m'.format(self._max_memory),
             main_class,
             '-p',
             '{}'.format(self._planner.value),
             '-t',
             '{}'.format(self._max_time),
             '-o',
             domain_path,
             '-f',
             problem_path], stdout=PIPE, universal_newlines=True)
        output = [line.strip() for line in p.stdout if len(line.strip()) > 0]

        if output[0] == 'problem file is not valid':
            # invalid problem file
            return False, False, output
        elif 'error' in output[0]:
            # invalid domain file
            return False, False, output
        elif 'no plan found' in output:
            # no plan found
            return True, False, output
        elif 'no search will solve it' in output[3]:
            # goal impossible
            return True, False, output
        else:
            return True, True, (self.extract_plan(output))

    def extract_plan(self, output: List[str]) -> Tuple[float, List[str]]:
        start_idx = output.index('found plan as follows:')
        end_idx = [i for i, s in enumerate(output) if 'total cost' in s][0]
        plan = [' '.join(output[i].split(' ')[1:]) for i in range(start_idx + 1, end_idx)]
        cost = float(output[end_idx].split(' ')[-1])
        return cost, plan



if __name__ == '__main__':
    planner = PDDL4JPlanner('../pddl4j/build/libs/pddl4j-3.8.3.jar', Planner.FF)
    valid, found, output = planner.find_plan('full_run/domain.pddl', 'full_run/problem.pddl')
    if not valid or not found:
        raise ValueError('\n'.join(output))

    print(output)
    cost, plan = output
    print("Total cost {}".format(cost))
    print("Plan:\n{}".format('\n'.join(plan)))

    x = 0