"""Edgerton-style multiple-copies photograph from a video of a moving
subject. The camera must be still.

Run:
    python edgerton.py video.mp4
It writes edgerton.png next to this file.
"""

import sys

import cv2
import numpy as np

path = sys.argv[1] if len(sys.argv) > 1 else "video.mp4"
STRIDE = 5          # keep every STRIDE-th frame; larger means fewer copies
MODE = "max"        # "max" for a bright subject on a dark background,
                    # "min" for a dark subject on a bright background
MAX_WIDTH = 1280

cap = cv2.VideoCapture(path)
frames = []
k = 0
while True:
    ok, frame = cap.read()
    if not ok:
        break
    if k % STRIDE == 0:
        h, w = frame.shape[:2]
        if w > MAX_WIDTH:
            frame = cv2.resize(frame, (MAX_WIDTH, h * MAX_WIDTH // w), interpolation=cv2.INTER_AREA)
        frames.append(frame)
    k += 1
cap.release()
vid = np.stack(frames)
print("frames used:", vid.shape[0])

# A subject brighter than the background survives a max over time; a darker
# one survives a min. Try both, then try a median background subtraction.
composite = vid.max(axis=0) if MODE == "max" else vid.min(axis=0)

cv2.imwrite("edgerton.png", composite)
print("wrote edgerton.png")
