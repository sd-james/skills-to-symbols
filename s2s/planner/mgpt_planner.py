import enum
import os
import subprocess
import tempfile
import numpy as np
from subprocess import Popen, PIPE
from time import sleep
from typing import Tuple, Any, List

from s2s.utils import exists, show, indent


class Planner(enum.Enum):
    """
    Enums that specify the type of planner to use
    """
    RANDOM = 'random',
    VI = 'vi',
    LRTDP = 'lrtdp',
    ASP = 'asp',


class Heuristic(enum.Enum):
    """
    Enum specifying the type of heuristic to use
    """
    FF = 'ff',
    ZERO = 'zero',
    MIN_MIN_LRTDP = 'min-min-lrtdp',
    MIN_MIN_IDA = 'min-min-ida*',
    MIN_MIN_IDA_NO_TT = 'min-min-ida*-no-tt'


class PlanOutput:

    def __init__(self, raw_output: str):
        self.valid = 'goal reached!' in raw_output
        self.raw_output = raw_output
        if self.valid:
            self.path = self._extract(raw_output)
        else:
            self.path = []

    def _extract(self, output):

        output = output[output.index('<begin-session>'):].split('\n')
        n_rounds = int(output[1][output[1].index('=') + 1:])
        row = 4
        best_score = np.inf
        best = list()
        for _ in range(n_rounds):
            row, success, moves = self._extract_round(output, row)
            if success and len(moves) < best_score:
                best_score = len(moves)
                best = moves
        return best

    def _extract_round(self, output, row):
        line = output[row].strip()
        moves = list()
        while line.startswith('+'):
            moves.append(line[2:-1])
            row += 1
            line = output[row].strip()
        success = 'goal reached!' in output[row]
        return row + 4, success, moves


class mGPT:
    """
    A class that wraps the mGPT planner with mdpsim.
    """

    def __init__(self,
                 mdpsim_path='mdpsim-1.23/mdpsim',
                 mgpt_path='mini-gpt/planner',
                 planner: Planner = Planner.LRTDP,
                 heuristic: Heuristic = Heuristic.FF,
                 port=2323,
                 max_time=10,
                 **kwargs):
        """
        Create a new PDDL planner object
        :param mgpt_path: the path to the mGPT executable
        :param planner: the type of planner to use. Default is LRTDP
        :param heuristic: the heuristic to use. Default is FF
        :param port: the port to run mdpsim on. It can be anything that is free
        :param max_time: the maximum time in seconds the planner is allowed. Default is 10
        :param kwargs: allows user to specify additional mGPT settings
        """
        if not exists(mgpt_path):
            raise ValueError("Could not find executable file at {}".format(mgpt_path))
        if not exists(mdpsim_path):
            raise ValueError("Could not find executable file at {}".format(mdpsim_path))

        # for item in kwargs:
        #     if item != 'wsl' and item not in 'acdeimnprswz':
        #         raise ValueError("Invalid argument {} for mGPT".format(item))

        self._mdpsim_port = port
        self._use_wsl = kwargs.get('wsl', False)  # use the windows subsystem for linux?
        self._mdpsim_path = mdpsim_path
        self._planner_path = mgpt_path
        self._planner = planner
        self._heuristic = heuristic
        self._max_time = max_time
        # self._params = [str(item) for k in kwargs for item in (k, kwargs[k])]
        # self._params = ['-{}'.format(x) if i % 2 == 0 else x for i, x in enumerate(self._params)]

    def find_plan(self, domain: Any, problem: Any, verbose=False) -> Tuple[bool, Any]:
        """
        Given a path to the PDDL domain and problem file, determine if a plan can be found. We do this by spinning up
        mdpsim, then running mGPT, then shutting it all down!
        :param domain: the domain file
        :param problem: the problem file
        :param verbose: the verbosity level
        :return: the first boolean represents whether the files were valid PDDL, the second represents whether a plan
        could be found and a list of output from the planner
        """

        # first, create a new file that has both the domain and problem in it.
        temp_name, problem_name = self._create_temp_file(domain, problem, verbose=verbose)

        command = ('wsl' if self._use_wsl else 'bash')
        p = None
        p2 = None

        try:
            show("Starting mdpsim...", verbose)
            # now run mdpsim with the temp file as input
            p = Popen(
                [command,
                 self._mdpsim_path,
                 '--port',
                 '{}'.format(self._mdpsim_port),
                 '--log-dir=/dev/null',
                 '--warnings=1',
                 temp_name
                 ],
                stdout=PIPE, stderr=PIPE, universal_newlines=True
            )

            # give it a second necessary?
            sleep(1)

            if p.poll():
                # it finished! something bad must have happened
                std_out, std_err = p.communicate()
                if p.returncode != 0:
                    error = self._extract_error(std_err, domain, problem)
                    show("mdpsim failed to start with error: {}".format(error), verbose)
                    return False, error

            show("mdpsim started!", verbose)

            show("Starting mGPT...", verbose)
            # it's running well! now start planner
            p2 = Popen(
                [command,
                 self._planner_path,
                 '-v',
                 '100',
                 '-p',
                 self._planner.value,
                 '-h',
                 self._heuristic.value,
                 'localhost:{}'.format(self._mdpsim_port),
                 temp_name,
                 problem_name
                 ],
                stdout=PIPE, stderr=PIPE, universal_newlines=True
            )
            show("mGPT started! Waiting for output...", verbose)

            try:
                std_out, std_err = p2.communicate(timeout=self._max_time)
                output = PlanOutput(std_out)
                return True, output
            except subprocess.TimeoutExpired:
                return False, 'Timeout!'
        finally:
            os.remove(temp_name)
            os.remove('last_id')  # created by the planner and mdpsim
            if p:
                p.terminate()
            if p2:
                p2.terminate()

    def _create_temp_file(self, domain: Any, problem: Any, verbose=False) -> Tuple[str, str]:

        name = next(tempfile._get_candidate_names())
        show("Generating temp PDDL file {}".format(name), verbose)
        if isinstance(domain, str):

            # it's a path to a file!
            if not exists(domain):
                raise ValueError("Could not find PDDL file at {}".format(domain))
            if not exists(problem):
                raise ValueError("Could not find PDDL file at {}".format(problem))

            with open(name, 'w') as temp_file, open(domain, 'r') as domain_file, open(problem, 'r') as problem_file:
                temp_file.write('{}\n\n{}'.format(domain_file.read(), problem_file.read()))
            problem_name = self._extract_problem_name(problem)
            return name, problem_name

        else:

            # it's the objects!
            with open(name, 'w') as temp_file:
                temp_file.write('{}\n\n{}'.format(domain, problem))

            return name, problem.name

    def _extract_problem_name(self, problem_path: str) -> str:
        search = ' (define (problem '
        with open(problem_path, 'r') as file:
            content = file.read().strip('\n')
            idx = content.index(search)
            end = content.index(')', idx + 1)
            name = content[idx + len(search):end]
            return name

    def _extract_error(self, error: str, domain: str, problem: str) -> str:
        temp = error.split(':')
        line = int(temp[2])
        error = ':'.join(temp[3:])
        if isinstance(domain, str):
            num_lines = sum(1 for line in open(domain))
        else:
            num_lines = len(str(domain).split('\n'))
        if line <= num_lines:
            # error is in domain file
            return "Error on line {} in domain PDDL:\n{}".format(line, indent(error))
        line = line - num_lines - 1  # because we added a blank line in
        return "Error on line {} in problem PDDL:\n{}".format(line, indent(error))

    def extract_plan(self, output: List[str]) -> Tuple[float, List[str]]:
        start_idx = output.index('found plan as follows:')
        end_idx = [i for i, s in enumerate(output) if 'total cost' in s][0]
        plan = [' '.join(output[i].split(' ')[1:]) for i in range(start_idx + 1, end_idx)]
        cost = float(output[end_idx].split(' ')[-1])
        return cost, plan


if __name__ == '__main__':
    planner = mGPT(wsl=True)

    valid, output = planner.find_plan('domain.pddl', 'problem.pddl', verbose=True)
    print(output)
