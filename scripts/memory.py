import cv2
import numpy as np

import random

def main():
    rgb332_color_palette()
    # frame_buffer()
    # black_image()
    # index_image()
    # random_image()
    # test_image()
    # zero()

def rgb332_color_palette():
    for i in range(256):
        r = (i & 0b11100000) >> 5
        g = (i & 0b00011100) >> 2
        b = (i & 0b00000011) >> 0
        rgb444 = (r << 9) | (g << 5) | (b << 2)
        print('.word 0x{0:03x}'.format(rgb444))
    
def frame_buffer():
    for i in range(400*300):
        print('{0:08b}'.format(i%(2**8)))

def index_image():
    for i in range(800*600):
        print('{0:06b}'.format(i%(2**6)))

def random_image():
    for i in range(800*600):
        print('{0:06b}'.format(random.randint(0, 2**6-1)))

def test_image():
    # Read the image
    img = cv2.imread('./data/finch.jpg')

    # Convert to 16-bit RGB
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img = img>>6 # remove 6 out of 8 bits from each color channel

    # Add an alpha channel (fully opaque)
    # alpha_channel = np.full(img_16bit.shape[:2], 0b11)
    # img_rgba_16bit = np.dstack((img_16bit, alpha_channel))
    pixels = img.reshape((-1,3))
    
    for pixel in pixels:
        s = '{0:02b}{1:02b}{2:02b}'.format(pixel[0], pixel[1], pixel[2])
        print(s)

def zero():
    for i in range(128):
        print('{0:08b}'.format(0))


if __name__ == '__main__':
    main()
