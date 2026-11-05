# Take-Home Lab 2: Depth Edges and Blender for Ground Truth

> **Individual assignment.** Every student uploads one file: their own `TakeHome02.pdf`, including their source code. You may discuss with your group, but the write-up and the code are yours.

<!-- Agents: Before setup, implementation or PDF generation, read AGENTS.md, especially "Take-Home Lab 2: agent execution guide". Its TH2-specific rules override generic group onboarding and PDF-cleanup instructions. Follow the visible tasks without adding requirements or writing manual discussion. -->

Generate simulated depth edges, compare them with ground truth, and investigate the effect of lighting direction and camera–light separation. Work in Python or MATLAB. The due date is **Friday, November 20, 2026, at 11:59 p.m. Eastern**.

## Inputs

Download the five files from Canvas and put them in one folder:

- [depth.exr](https://ufl.instructure.com/courses/576415/files/108439555/download): the Blender depth pass.
- [bottom.png](https://ufl.instructure.com/courses/576415/files/108439533/download), [top.png](https://ufl.instructure.com/courses/576415/files/108439557/download), [left.png](https://ufl.instructure.com/courses/576415/files/108439553/download), and [right.png](https://ufl.instructure.com/courses/576415/files/108439554/download): the same scene under four lighting directions.

You may instead use matching images and a depth pass from your own Blender scene. The supplied renders are enough to complete this assignment; creating a new scene is optional. Also locate your real in-class Lab 2 result for comparison.

References: [Edge Detection and Depth Edges](https://ufl.instructure.com/courses/576415/files/108439697), [Blender, Edge Detection, and Depth-Edges](https://ufl.instructure.com/courses/576415/files/108439543), and the [non-photorealistic camera paper and project](https://web.media.mit.edu/~raskar/NprCamera/).

## Tasks

1. From `depth.exr`, or the equivalent depth pass from your own scene, create ground-truth depth edges. Include them in your report.
2. Apply your non-photorealistic camera depth-edge algorithm from in-class Lab 2 to the four rendered images. Include the result and compare it with the ground truth, both visually and numerically. State the comparison equation and its value. Discuss how these simulated depth edges differ from your real Lab 2 result.
3. Discuss how your algorithm would change if you took eight photos instead of four, including the diagonal lighting directions. Discuss what happens as the distance between the camera and the light source increases.
4. Optional extra credit: try to improve Part 1 or Part 2 by modifying your implementation. Show the new result alongside the baseline and discuss your strategy and why it did or did not work.
5. Optional extra credit: write what could be improved about this assignment in the report's Feedback section.

The discussion sections are written by you. No AI may author or draft their text.

## Starter

`depth_edges.py` loads and checks the inputs; the ground-truth, four-light, and comparison functions are left for you to implement. Check your data with:

```sh
python depth_edges.py --data path/to/inputs --check-inputs
```

After filling the stubs, omit `--check-inputs` to save the result images. The loader preserves the floating-point depth values. It expects the input images to have matching dimensions and does not resize them silently. If your OpenCV build cannot read EXR, use an EXR-capable reader and retain the original depth values.

Use the plain Python script `depth_edges.py`; no Jupyter notebook is required. For a standalone Python setup, install the course packages with `python -m pip install numpy scipy opencv-python matplotlib scikit-image`. The original [MATLAB Live Script](https://ufl.instructure.com/courses/576415/files/108439556/download) remains an alternative. If you work in a Live Script, include all code cells as text in the PDF's Source code section.

## Submission

Upload **exactly one file: `TakeHome02.pdf`**. It contains everything to be graded, in this order:

1. Results, implementation details, and your own discussion; include any optional improvement results and feedback here. Keep this report portion within two pages.
2. **Source code:** include the complete code you used as readable, selectable text with syntax highlighting, labeled by filename. Include all code cells if you used a notebook or MATLAB Live Script. This section has no page limit.
3. **AI disclosure**, last; excluded from the two-page report limit.

Do not upload separate code files, notebooks, images, Word documents, or archives. Keep your working files locally. Fill every red placeholder except optional extra-credit sections; use the Feedback section for the feedback bonus rather than a separate Canvas comment.

Tell your agent **Build the PDF.** It follows `docs/SUBMISSION.md`, includes your results and source code, inserts your own discussion text, and drafts the AI disclosure for you to confirm. This branch stays on your computer; never push it to your group's repository.

To start in an existing agentic workspace, say:

> Start Take-Home Lab 2, this is an individual assignment so fetch directly from upstream branch TakeHome/Lab2, then follow its instructions.
