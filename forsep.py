"""Direct/global separation of a static scene from a video taken while a
light or shadow sweeps across it. Every pixel must be directly lit in some
frames and shadowed in others.

Fill in the two gaps, then run:
    python forsep.py video.mp4
It writes floodlit.png, direct.png and global.png next to this file.
"""

import sys

import cv2
import numpy as np

path = sys.argv[1] if len(sys.argv) > 1 else "video.mp4"
MAX_WIDTH = 960      # frames wider than this are downscaled to save memory
STRIDE = 1           # use every STRIDE-th frame; raise it for long videos

# Read the video into an array of shape T x H x W x 3, uint8, BGR.
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
print("frames used:", vid.shape[0], "size:", vid.shape[1:3])

# The global (indirect) illumination image is the minimum over time, taken
# per channel. Pixels are never darker than their indirect light.
global_im = vid.min(axis=0)

# The floodlit image is the maximum over time. Fill in the right code.
floodlit_im = ...

# The direct image is floodlit minus global. Fill in the right code. Beware:
# subtracting uint8 arrays wraps around, so convert to int first and clip
# back to 0..255 before saving.
direct_im = ...

cv2.imwrite("global.png", global_im)
cv2.imwrite("floodlit.png", floodlit_im)
cv2.imwrite("direct.png", direct_im)
print("wrote floodlit.png, direct.png, global.png")
