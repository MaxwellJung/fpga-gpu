import cv2
import numpy as np

import random

def main():
    test_image()
    
def pattern_image():
    for i in range(800*600):
        print('{0:016b}'.format(i%(2**16)))

def random_image():
    for i in range(800*600):
        print('{0:016b}'.format(random.randint(0, 2**16-1)))

def test_image():
    # Read the image
    img = cv2.imread('./data/finch.jpg')

    # Convert to 16-bit RGB
    img_16bit = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img_16bit = img_16bit>>6 # remove 6 out of 8 bits from each color channel

    # Add an alpha channel (fully opaque)
    alpha_channel = np.full(img_16bit.shape[:2], 0b11)
    img_rgba_16bit = np.dstack((img_16bit, alpha_channel))
    pixels = img_rgba_16bit.reshape((-1,4))
    
    for pixel in pixels:
        s = '{0:02b}{1:02b}{2:02b}{3:02b}'.format(pixel[0], pixel[1], pixel[2], pixel[3])
        print(s)


if __name__ == '__main__':
    main()
