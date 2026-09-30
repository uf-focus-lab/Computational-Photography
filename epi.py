"""Epipolar-plane images from a video taken while sliding the camera
sideways. Fill in the patch step, then run:
    python epi.py video.mp4
It writes epi_row.png, epi_col.png, epi_row_patch.png and epi_col_patch.png.
"""

import sys

import cv2
import numpy as np

path = sys.argv[1] if len(sys.argv) > 1 else "video.mp4"
MAX_WIDTH = 960

cap = cv2.VideoCapture(path)
frames = []
while True:
    ok, frame = cap.read()
    if not ok:
        break
    h, w = frame.shape[:2]
    if w > MAX_WIDTH:
        frame = cv2.resize(frame, (MAX_WIDTH, h * MAX_WIDTH // w), interpolation=cv2.INTER_AREA)
    frames.append(frame)
cap.release()
vid = np.stack(frames)                  # T x H x W x 3, uint8, BGR
T, H, W = vid.shape[:3]
print("frames:", T, "size:", H, "x", W)

# The EPI is one row of every frame stacked over time: T x W x 3. Try other
# values of mid. The perpendicular EPI is one column: T x H x 3.
mid_row, mid_col = H // 2, W // 2
epi_row = vid[:, mid_row, :, :]
epi_col = vid[:, :, mid_col, :]
cv2.imwrite("epi_row.png", epi_row)
cv2.imwrite("epi_col.png", epi_col)

# Patch: color a rectangle in one frame, then regenerate the EPIs. Fill in
# the coordinates, the frame and the color, for example rows 10:100,
# columns 10:100, frame 33, red, which in BGR is (0, 0, 255).
patched = vid.copy()
# patched[FRAME, R0:R1, C0:C1, :] = (0, 0, 255)
cv2.imwrite("epi_row_patch.png", patched[:, mid_row, :, :])
cv2.imwrite("epi_col_patch.png", patched[:, :, mid_col, :])
print("wrote epi_row.png, epi_col.png, epi_row_patch.png, epi_col_patch.png")
