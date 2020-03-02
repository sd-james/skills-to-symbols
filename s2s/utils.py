import multiprocessing
import os
import shutil
import warnings
from typing import Callable, List, Iterable, Any

import pandas as pd
import numpy as np
import pickle
import textwrap

__author__ = 'Steve James'


def indent(x: Any, count: int = 1) -> str:
    """
    Indent an object
    :param x: the object
    :param count: the number of tab spaces
    """
    return textwrap.indent(str(x), '\t' * count)


def select_rows(data: pd.DataFrame, indices: Iterable, reset_index=True) -> pd.DataFrame:
    """
    Select a set of rows from a data frame
    :param data: the data frame
    :param indices: teh row indices
    :param reset_index: whether the indices should be reset
    :return: the subframe
    """""
    frame = data.loc[indices]
    if reset_index:
        return frame.reset_index(drop=True)
    return frame


def run_parallel(functions: List[Callable]):
    """
    Run the list of function in parallel and return the results in a list
    :param functions: the functions to execute
    :return: a list of results
    """
    n_procs = len(functions)
    pool = multiprocessing.Pool(processes=n_procs)
    processes = [pool.apply_async(functions[i]) for i in range(n_procs)]
    return [p.get() for p in processes]


def is_single_sample(data: np.ndarray) -> bool:
    """
    Determine if the array is a single sample of data
    :param data: the array
    """
    if len(data.shape) == 1:
        return True
    return data.shape[0] == 1


def range_without(start, end, *skips):
    """
    Create a range while omitting certain values
    :param start: the start of the range
    :param end: the end of the range (excluded)
    :param skips: the numbers to skip
    """
    skip = set(skips)
    return [x for x in range(start, end) if x not in skip]


def pd2np(data: pd.Series):
    """
    Convert a Pandas series of arrays to a numpy 2D array
    :param data: the series
    :return: a numpy 2D array
    """
    return np.array([np.asfarray(x) for x in data.values])


def show(data, verbose):
    """
    Convenience method to display data, if verbose is set to true
    :param data: the information to print
    :param verbose: the mode
    """
    if verbose:
        print(data)


def save(object, filename=None, binary=True):
    """
    Convenience method for saving object to file without risking wrong mode overwrites
    :param binary: whether to save as a binary file
    :param object: the object to pickle
    :param filename: the filename
    """
    if filename is None:
        warnings.warn("No filename specified, saving to temp.pkl...")
        filename = 'temp.pkl'
    mode = 'wb' if binary else 'w'
    with open(filename, mode) as file:
        if binary:
            pickle.dump(object, file)
        else:
            file.write(str(object))
    return filename


def load(filename=None, binary=True):
    """
    Convenience method for loading object from file without risking wrong mode overwrites
    :param binary: whether to load as a binary file
    :param filename: the filename
    """
    if filename is None:
        warnings.warn("No filename specified, loading from temp.pkl...")
        filename = 'temp.pkl'
    mode = 'rb' if binary else 'r'
    with open(filename, mode) as file:
        return pickle.load(file)


def get_dir_name(file):
    """
    Get the directory of the given file
    :param file: the file
    :return: the file's directory
    """
    return os.path.dirname(os.path.realpath(file))


def get_sibling_file(file,
                     sibling_name):
    """
    Get the full path to a file within the same directory as another file
    :param file: the file whose directory we care about
    :param sibling_name: the name of the file we're looking for
    :return: a full path to the sibling file
    """
    return make_path(get_dir_name(file), sibling_name)


def make_path(root,
              *args):
    """
    Creates a path from the given parameters
    :param root: the root of the path
    :param args: the elements of the path
    :return: a string, each element separated by a forward slash.
    """
    path = root
    if path.endswith('/'):
        path = path[0:-1]
    for element in args:
        if not isinstance(element, str):
            element = str(element)
        if element[0] != '/':
            path += '/'
        path += element
    return path


def exists(path):
    return os.path.exists(path)


def make_dir(path,
             clean=True):
    """
    Create a new directory (create the entire tree if necessary)
    :param path: the directory's path
    :param clean: whether the directory should made empty (if it already exists)
    """

    exists = os.path.exists(path)
    if not exists:
        # print("Directory missing, creating: " + path)
        os.makedirs(path)
    elif clean:
        # Delete directory
        has_files = False
        for dirpath, dirnames, files in os.walk(path):
            if files:
                has_files = True
            break
        # if has_files:
        #     print("NOT DELETING!!!! TOO DANGEROUS!")
        #     exit(1)
        shutil.rmtree(path)
        os.makedirs(path)


def copy_directory(source, dest):
    """
    Copy a directory tree from source to a destination. The directory must not exist in the destination
    :param source:
    :param dest:
    """
    if os.path.exists(dest):
        raise ValueError(dest + " already exists!")
    shutil.copytree(source, dest)


def merge(input_files, output_file):
    """
    Merge a list of files into one single file
    :param input_files: the list of input files
    :param output_file: the output file
    """
    with open(output_file, 'w') as wfd:
        for f in input_files:
            with open(f, 'r') as fd:
                shutil.copyfileobj(fd, wfd)


def files_in_dir(directory):
    """
    Generate the files inside a directory tree
    :param directory: the directory tree to traverse
    :return: the path and filename of files within the tree
    """

    for dirpath, dirnames, filenames in os.walk(directory):
        for f in filenames:
            file = make_path(dirpath, f)
            if os.path.isfile(file):
                yield dirpath, f
