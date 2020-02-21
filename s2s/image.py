from PIL import Image as I

import numpy as np
import pygame

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

        # widths, heights = zip(*(i.size for i in images))
        # total_width = sum(widths)
        # max_height = max(heights)
        # new_im = I.new('RGB', (total_width, max_height))
        # x_offset = 0
        # for im in images:
        #     new_im.paste(im, (x_offset, 0))
        #     x_offset += im.size[0]
        # return new_im

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


        # image = pygame.Surface((self.width, self.height))
        # image.fill((0, 0, 0))
        # image.lock()
        # for x in range(0, self.width):
        #     for y in range(0, self.height):
        #         col = pygame.Color(int(self._red[x, y]), int(self._green[x, y]), int(self._blue[x, y]), 255)
        #         image.set_at((x, y), col)
        #         del col
        # image.unlock()
        # pygame.image.save(image, filename)
        # del image

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

        # red = np.zeros((image_list[0].width, image_list[0].height))
        # green = np.zeros((image_list[0].width, image_list[0].height))
        # blue = np.zeros((image_list[0].width, image_list[0].height))
        #
        # for i in range(0, len(image_list)):
        #     red += image_list[i]._red
        #     green += image_list[i]._green
        #     blue += image_list[i]._blue
        #
        # image = Image(image_list[0].width, image_list[0].height)
        # image.set(red / len(image_list), green / len(image_list), blue / len(image_list))
        # return image
