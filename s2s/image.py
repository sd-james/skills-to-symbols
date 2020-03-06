import numpy as np
from PIL import Image as I

__author__ = 'Steve James'


class Image:
    """
    A class that wraps RGB data
    """

    def __init__(self,
                 width,
                 height):
        """
        Create a new image
        :param width: the width of the image
        :param height: the height of the image
        """
        self._width = width
        self._height = height
        self._red = None
        self._green = None
        self._blue = None

    @property
    def width(self):
        return self._width

    @property
    def height(self):
        return self._height

    def set(self,
            red,
            green,
            blue):
        """
        Set the RGB data for the image
        :param red: the red channel
        :param green: the green channel
        :param blue: the blue channel
        """
        self._red = red
        self._green = green
        self._blue = blue


    @staticmethod
    def combine(images):
        widths, heights = zip(*(i.size for i in images))
        max_width = max(widths)
        sum_height = sum(heights)
        new_im = I.new('RGB', (max_width, sum_height))
        y_offset = 0
        for im in images:
            new_im.paste(im, (0, y_offset))
            y_offset += im.size[1]
        return new_im

    @staticmethod
    def to_image(image, mode='L'):
        img = I.fromarray(np.uint8(image), mode=mode)
        return img

    @staticmethod
    def to_array(image):
        return np.array(image.convert('RGB'))

    @staticmethod
    def show(image, mode='L'):
        img = I.fromarray(np.uint8(image), mode=mode)
        img.show()

    @staticmethod
    def save(image, filename, mode='L'):
        """
        Write the image to file
        :param filename: the file
        """
        img = I.fromarray(np.uint8(image), mode=mode)
        img.save(filename)

    def free(self):
        """
        Free the RGB data so it doesn't consume to much memory when done
        :return:
        """
        del self._red
        del self._green
        del self._blue

    @staticmethod
    def merge(image_list):
        """
        Merge images into one
        :param image_list: the list of images
        :return: a single merged image
        """
        if len(image_list) == 0:
            return None
        return np.mean(image_list, axis=0)
