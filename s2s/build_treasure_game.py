from typing import List

import cv2
import numpy as np

from s2s.core.build_model import build_model
from s2s.env.treasure_game.treasure_game import TreasureGame
from s2s.planner.mgpt_planner import mGPT
from s2s.utils import make_path, load


def make_video(path: List[str], directory='.') -> None:
    """
    Create a video of the agent solving the task
    :param path: the list of PDDL operators to execute
    :param directory: the directory where the video should be written to
    """
    plan = list()
    for option in path:
        operator_idx = int(option[option.rindex('-') + 1:])
        operator = domain.operators[operator_idx]

        # check to make sure something weird didn't happen!
        name = '{}-partition-{}-{}'.format(env.describe_option(operator.option), operator.partition, operator_idx)
        if name != option:
            raise ValueError("Expected {} but got {}".format(option, name))

        plan.append(operator)

    # make video!!
    frames = TreasureGame.animate([operator.option for operator in plan])
    height, width, layers = np.array(frames[0]).shape
    print("Writing to video {}.mp4".format(env.name))
    file = make_path(directory, "{}.mp4".format(env.name))
    video = cv2.VideoWriter(file, -1, 75, (width, height))
    for frame in frames:
        video.write(cv2.cvtColor(np.array(frame), cv2.COLOR_RGB2BGR))
    video.release()


if __name__ == '__main__':
    env = TreasureGame()
    save_dir = 'output'

    # Build the PDDL model
    domain, problem = build_model(env,
                                  save_dir=save_dir,
                                  n_jobs=8,
                                  seed=0,
                                  max_precondition_samples=10000,
                                  visualise=True,
                                  verbose=True)

    # Now feed it to a planner
    planner = mGPT(mdpsim_path='./planner/mdpsim-1.23/mdpsim',
                   mgpt_path='./planner/mini-gpt/planner',
                   wsl=True)
    valid, output = planner.find_plan(domain, problem)

    if not valid:
        print("An error occurred :(")
        print(output)
    elif not output.valid:
        print("Planner could not find a valid plan :(")
        print(output.raw_output)
    else:
        print("We found a plan!")
        # get the plan out
        print(output.raw_output)
        print(output.path)
        make_video(output.path, directory=save_dir)

