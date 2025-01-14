import cv2
import numpy as np

import random

def main():
    color_palette()
    # frame_buffer()
    # black_image()
    # index_image()
    # random_image()
    # test_image()

def color_palette():
    for i in range(64):
        print('{3:08b}{2:08b}{1:08b}{0:08b}'.format(4*i, 4*i+1, 4*i+2, 4*i+3))
    
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


if __name__ == '__main__':
    main()
