"""Take-Home Lab 2 scaffold. Complete the three functions below."""

import argparse
import os
from pathlib import Path

# Must be set before importing OpenCV; EXR support depends on the installed build.
os.environ.setdefault("OPENCV_IO_ENABLE_OPENEXR", "1")
import cv2
import numpy as np


def ground_truth_edges(depth):
    """Return a boolean H x W mask from the floating-point depth pass."""
    # TODO: implement Part 1 and record your filters and thresholds.
    raise NotImplementedError("Complete ground_truth_edges for Part 1")


def four_light_edges(images):
    """Return a boolean H x W mask; images maps light names to grayscale arrays."""
    # TODO: adapt your own in-class Lab 2 implementation for Part 2.
    raise NotImplementedError("Complete four_light_edges for Part 2")


def compare_edges(estimated, ground_truth):
    """Return a finite scalar comparison; state its equation in your report."""
    # TODO: implement and document your numerical comparison.
    raise NotImplementedError("Complete compare_edges for Part 2")


def load_inputs(folder):
    images = {}
    for side in ("top", "bottom", "left", "right"):
        path = folder / f"{side}.png"
        if not path.is_file():
            raise FileNotFoundError(path)
        image = cv2.imread(str(path), cv2.IMREAD_GRAYSCALE)
        if image is None:
            raise ValueError(f"Cannot read {path}")
        images[side] = image.astype(np.float32) / 255.0
    path = folder / "depth.exr"
    if not path.is_file():
        raise FileNotFoundError(path)
    try:
        depth = cv2.imread(str(path), cv2.IMREAD_UNCHANGED)
    except cv2.error as exc:
        raise ValueError("EXR read failed. Use an EXR-capable reader.") from exc
    if depth is None:
        raise ValueError(f"Cannot read {path}; check your EXR support")
    if depth.ndim == 3:
        # OpenCV uses BGR order. The provided depth channels are identical.
        if depth.shape[2] < 3:
            raise ValueError("Choose the depth channel explicitly for this EXR")
        depth = depth[:, :, 2]
    if depth.ndim != 2 or not np.issubdtype(depth.dtype, np.floating):
        raise ValueError("Expected a floating-point H x W depth pass")
    depth = depth.astype(np.float32)
    if not np.isfinite(depth).all():
        raise ValueError("Depth has non-finite values; define their handling first")
    if any(image.shape != depth.shape for image in images.values()):
        raise ValueError("Inputs must have identical dimensions; no automatic resize")
    return depth, images


def checked_mask(mask, shape, name):
    mask = np.asarray(mask)
    if mask.shape != shape or mask.dtype != np.bool_:
        raise ValueError(f"{name} must be a boolean mask with shape {shape}")
    return mask


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data", type=Path, default=Path("."))
    parser.add_argument("--output", type=Path, default=Path("results"))
    parser.add_argument("--check-inputs", action="store_true")
    args = parser.parse_args()
    depth, images = load_inputs(args.data)
    print(f"Inputs: {depth.shape[1]} x {depth.shape[0]}; depth {depth.dtype}")
    print(f"Depth range: {depth.min():.6g} to {depth.max():.6g}")
    if args.check_inputs:
        return
    truth = checked_mask(ground_truth_edges(depth), depth.shape, "Ground truth")
    estimate = checked_mask(four_light_edges(images), depth.shape, "Four-light result")
    value = float(compare_edges(estimate, truth))
    if not np.isfinite(value):
        raise ValueError("Comparison must be a finite scalar")
    args.output.mkdir(parents=True, exist_ok=True)
    for name, mask in (("ground_truth_edges", truth), ("four_light_edges", estimate)):
        path = args.output / f"{name}.png"
        if not cv2.imwrite(str(path), mask.astype(np.uint8) * 255):
            raise OSError(f"Could not write {path}")
    print(f"Comparison: {value:.8g} (record the equation in your report)")


if __name__ == "__main__":
    main()
