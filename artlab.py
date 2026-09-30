"""
Art Lab: read an image and create effects by making the image different.
It writes quantized.png next to this file.
"""

import cv2
import numpy as np

# Read in the picture of green mountains as an H x W x 3 array of uint8.
# OpenCV orders the channels blue, green, red.
im = cv2.imread("mountains.png")

# Q1: What is the size of the image? Use the attribute "shape".
print("size:", ...)

# Q2: Pull out the blue, green and red channels. Each is an H x W array.
blue = im[:, :, 0]
green = ...
red = ...

# Create a gray version of the image. "astype(float)" turns the data into
# floating point numbers so the sum does not overflow uint8.
gray = (red.astype(float) + green.astype(float) + blue.astype(float)) / 3

# Find the min and max values, the range we quantize over.
print("gray range:", gray.min(), gray.max())

# Q3: This is the point of the lab. Figure out how to quantize the image,
# using the range as a starting point. One example is given for green.
level1 = 50
level2 = 100
level3 = 150

quant = np.zeros_like(im)

for i in range(3):
    tmp = im[:, :, i].copy()

    if i == 0:
        # blue quantization
        pass
    elif i == 1:
        # green quantization
        tmp[tmp < level1] = 50
        tmp[(tmp >= level1) & (tmp < level2)] = 100
        tmp[(tmp >= level2) & (tmp < level3)] = 150
    elif i == 2:
        # red quantization
        pass

    quant[:, :, i] = tmp

# quant is already uint8 because it was created with zeros_like(im).
cv2.imwrite("quantized.png", quant)
