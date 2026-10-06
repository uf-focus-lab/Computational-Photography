"""Take-Home Lab 1: image comparison metrics.

Part 1: MSE, MAE and PSNR by hand, no built-in metric functions.
Part 2: one perturbation of your choice, compared with MSE.
Bonus: one other metric (not here).
quantized.png must be the exact Lab 0 answer: thresholds 50, 100, 150,
levels 50, 100, 150, 200. Run: python metrics.py
"""

import os

import cv2
import numpy as np

original = cv2.imread("mountains.png")
H, W = original.shape[:2]


def mse(y, x):
    """Mean squared error between reference y and image x."""
    # TODO: implement
    raise NotImplementedError("implement MSE without built-in metric functions")


def mae(y, x):
    """Mean absolute error between reference y and image x."""
    # TODO: implement
    raise NotImplementedError("implement MAE without built-in metric functions")


def psnr(y, x, peak=255.0):
    """Peak signal-to-noise ratio in dB, with peak the maximum pixel value."""
    # TODO: implement
    raise NotImplementedError("implement PSNR without built-in metric functions")


def perturb(im):
    """Your Part 2 perturbation: noise, warp, translation, mosaic, filter, ..."""
    # TODO: implement
    raise NotImplementedError("implement one perturbation; pre-made functions are allowed")


def row(name, im):
    """Print one table row: the three metrics of im against the original."""
    # The metrics compare pixel by pixel, so bring AI results that come
    # back at another size to the original's size first, and say so.
    if im.shape[:2] != (H, W):
        print(f"{name} is {im.shape[1]}x{im.shape[0]}, resized to {W}x{H}")
        im = cv2.resize(im, (W, H), interpolation=cv2.INTER_AREA)
    print(f"{name:<16}{mse(original, im):>10.2f}{mae(original, im):>10.2f}{psnr(original, im):>12.2f}")


# Part 1: the Lab 0 results against the original.
print(f"\n{'image':<16}{'MSE':>10}{'MAE':>10}{'PSNR (dB)':>12}")
for name in ["quantized.png", "controlnet.png", "favorite.png"]:
    if os.path.exists(name):
        row(name, cv2.imread(name))
    else:
        print(f"{name} not found, skipped")

# Part 2: runs once perturb() is written.
perturbed = perturb(original)
cv2.imwrite("perturbed.png", perturbed)
row("perturbed.png", perturbed)
