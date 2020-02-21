from collections import defaultdict
from typing import List, Dict

import gym

from s2s.image import Image
from s2s.partitioned_option import PartitionedOption
from s2s.utils import show


def visualise_partitions(env: gym.Env,
                         option_partitions: Dict[int, List[PartitionedOption]],
                         verbose=False):

    images = defaultdict(defaultdict(list))
    for option in range(env.action_space.n):

        partitions = option_partitions[option]
        show("Visualising option {} with partition(s)".format(option, len(partitions)), verbose)

        for partition in partitions:
            start = Image.merge([env.render_state(state) for state in partition.states])
            for probability, _, next_states, _ in partition.effects():
                end = Image.merge([env.render_state(state) for state in next_states])

            # TODO new
            d = render(env, partition.states)
            images = list()
            for m, im in d.items():
                im = Image.merge(im)
                if len(im.shape) == 3:
                    image = Image.to_image(im, mode='RGB')
                else:
                    image = Image.to_image(im)
                images.append(image)
            im = Image.combine(images)

            filename = _make_filename(output_dir, options.describe(option), 'init', i + 1, partition.combined_mask,
                                      'bmp')
            Image.save(im, filename, mode='RGB')
            # im.free()

            if verbose:
                print("\tPreconditions complete.")
                print("*******************************************************")

            # Write probabilities
            filename = _make_filename(output_dir, options.describe(option), 'transition', i + 1,
                                      partition.combined_mask, 'txt')

            with open(filename, "w") as file:
                t_prob = partition.get_transition_probabilities()
                for item in t_prob:
                    file.write("%s\n" % str(item))

            if verbose:
                print("\tTransition probabilities complete.")

            # Write images
            n_transition = partition.get_number_effects()
            for j in range(0, n_transition):
                target_states = partition.get_next_states(j)

                # for state in target_states:
                #     state = _flatten(state)
                #     domain.describe_state(state, list(range(len(state))))
                # print(' ## ')

                # TODO old
                # images = render(domain, target_states)
                # im = Image.merge(images)
                # filename = make_path(output_dir,
                #                      options.describe(option) + "-effect" + str(i + 1) + "-" + str(j + 1) + ".bmp")
                # Image.save(im, filename)
                # im.free()

                # TODO new
                d = render(env, target_states)
                images = list()
                for m, im in d.items():
                    im = Image.merge(im)
                    if len(im.shape) == 3:
                        image = Image.to_image(im, mode='RGB')
                    else:
                        image = Image.to_image(im)
                    images.append(image)
                im = Image.combine(images)
                filename = _make_filename(output_dir, options.describe(option), 'effect', i + 1,
                                          partition.combined_mask, 'bmp')

                Image.save(im, filename, mode='RGB')

                if verbose:
                    print("\t\tImage " + str(j) + " complete.")

            if verbose:
                print("Images complete")
                print("*******************************************************")

    if verbose:
        print("Partitions visualised.")
