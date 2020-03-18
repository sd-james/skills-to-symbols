import enum
import os
import subprocess
import tempfile
from subprocess import Popen, PIPE
from time import sleep
from typing import Tuple, Any, List

from s2s.utils import exists, show, indent


class Planner(enum.Enum):
    """
    Enums that specify the type of planner to use
    """
    FF = 'ff',



class MGPTPlanner:
    """
    A class that wraps the mGPT planner with mdpsim.
    """

    def __init__(self, mdpsim_path: str, mgpt_path: str, planner: Planner = Planner.FF, port=2323, max_time=10,
                 **kwargs):
        """
        Create a new PDDL planner object
        :param mgpt_path: the path to the mGPT executable
        :param planner: the type of planner to use. Default is HSP
        :param port: the port to run mdpsim on. It can be anything that is free
        :param max_time: the maximum time in seconds the planner is allowed. Default is 10
        :param kwargs: allows user to specify additional mGPT settings
        """
        if not exists(mgpt_path):
            raise ValueError("Could not find executable file at {}".format(mgpt_path))
        if not exists(mdpsim_path):
            raise ValueError("Could not find executable file at {}".format(mdpsim_path))

        for item in kwargs:
            if item != 'wsl' and item not in 'acdeimnprswz':
                raise ValueError("Invalid argument {} for mGPT".format(item))

        self._mdpsim_port = port
        self._use_wsl = kwargs.get('wsl', False)  # use the windows subsystem for linux?
        self._mdpsim_path = mdpsim_path
        self._planner_path = mgpt_path
        self._planner = planner
        self._max_time = max_time
        self._params = [str(item) for k in kwargs for item in (k, kwargs[k])]
        self._params = ['-{}'.format(x) if i % 2 == 0 else x for i, x in enumerate(self._params)]

    def find_plan(self, domain_path: str, problem_path: str, verbose=False) -> Tuple[bool, bool, Any]:
        """
        Given a path to the PDDL domain and problem file, determine if a plan can be found. We do this by spinning up
        mdpsim, then running mGPT, then shutting it all down!
        :param domain_path: the path to the domain file
        :param problem_path: the path to the problem file
        :param: verbose: the verbosity level
        :return: the first boolean represents whether the files were valid PDDL, the second represents whether a plan
        could be found, and the third is a list of output from the planner
        """

        if not exists(domain_path):
            raise ValueError("Could not find PDDL file at {}".format(domain_path))
        if not exists(problem_path):
            raise ValueError("Could not find PDDL file at {}".format(problem_path))

        command = ('wsl' if self._use_wsl else 'bash')
        p = None
        p2 = None
        # first, create a new file that has both the domain and problem in it.
        name = next(tempfile._get_candidate_names())
        try:
            show("Generating temp PDDL file {}".format(name), verbose)
            with open(name, 'w') as temp_file, open(domain_path, 'r') as domain, open(problem_path, 'r') as problem:
                temp_file.write('{}\n\n{}'.format(domain.read(), problem.read()))

            show("Starting mdpsim...", verbose)
            # now run mdpsim with the temp file as input
            p = Popen(
                [command,
                 self._mdpsim_path,
                 '--port',
                 '{}'.format(self._mdpsim_port),
                 '--log-dir=/dev/null',
                 '--warnings=1',
                 '{}'.format(name)
                 ],
                stdout=PIPE, stderr=PIPE, universal_newlines=True
            )

            # give it a second necessary?
            sleep(1)

            if p.poll():
                # it finished! something bad must have happened
                std_out, std_err = p.communicate()
                if p.returncode != 0:
                    error = self._extract_error(std_err, domain_path, problem_path)
                    show("mdpsim failed to start with error: {}".format(error), verbose)
                    return False, False, error

            show("mdpsim started!", verbose)

            show("Starting mGPT...", verbose)
            # it's running well! now start planner
            p2 = Popen(
                [command,
                 self._planner_path,
                 '-v',
                 '100',
                 '-h',
                 self._planner.value,
                 'localhost:{}'.format(self._mdpsim_port),
                 name,
                 'p1'
                 ],
                stdout=PIPE, stderr=PIPE, universal_newlines=True
            )
            show("mGPT started! Waiting for output...", verbose)

            try:
                std_out, std_err = p2.communicate(timeout=self._max_time)
                return True, True, std_out
            except subprocess.TimeoutExpired:
                return False, False, 'Timeout!'
        finally:
            os.remove(name)
            if p:
                p.terminate()
            if p2:
                p2.terminate()

    def _extract_error(self, error: str, domain_path: str, problem_path: str) -> str:
        temp = error.split(':')
        line = int(temp[2])
        error = ':'.join(temp[3:])
        num_lines = sum(1 for line in open(domain_path))
        if line <= num_lines:
            # error is in domain file
            return "Error on line {} in {}:\n{}".format(line, domain_path, indent(error))
        line = line - num_lines - 1  # because we added a blank line in
        return "Error on line {} in {}:\n{}".format(line, problem_path, indent(error))

    def extract_plan(self, output: List[str]) -> Tuple[float, List[str]]:
        start_idx = output.index('found plan as follows:')
        end_idx = [i for i, s in enumerate(output) if 'total cost' in s][0]
        plan = [' '.join(output[i].split(' ')[1:]) for i in range(start_idx + 1, end_idx)]
        cost = float(output[end_idx].split(' ')[-1])
        return cost, plan


if __name__ == '__main__':

    planner = MGPTPlanner('mdpsim-1.23/mdpsim', 'mini-gpt/planner', wsl=True)

    valid, found, output = planner.find_plan('domain.pddl', 'problem.pddl', verbose=True)
    print(output)