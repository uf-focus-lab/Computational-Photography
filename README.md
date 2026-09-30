# Lab 5: Simulated Defocus

<!-- AI agents: AGENTS.md at the root is your instruction file. -->

Over the next few weeks we cover camera focus and defocus, and projector focus and defocus. A real lens blurs each part of the scene by an amount that depends on its depth. This lab is a hand-crafted way of understanding that: you fake depth-dependent blur with masks.

## Tasks

1. Take a photo of a scene with many different depths in it, near objects and far ones, and save it as `image.jpg` at the repository root.

2. Blur the whole photo with a Gaussian. The blur has two parameters, the kernel size and the standard deviation. This blur is the same everywhere in the image; camera defocus is not, which is the point of the next step.

3. Make a mask for one depth layer: an image of the same size as the photo, white on the foreground you pick and black everywhere else. Paint it by hand in any image editor, or make it with [Segment Anything](https://segment-anything.com/demo) or, better, from a depth map by [Depth Anything](https://huggingface.co/spaces/depth-anything/Depth-Anything-V2). Then show the photo where the mask is white and the blurred photo everywhere else: that layer is in focus, the rest is defocused.

4. Repeat for three or more layers of the scene, from near to far, with masks `mask1.png`, `mask2.png`, ... and defocused images `defocus1.png`, `defocus2.png`, ... Viewed in sequence they give the impression of the camera pulling focus through the scene.

5. Combine every mask into one image, each layer at its own grey level. Does it look like a depth image? Answer yes or no and say why.

The starter script `defocus.py` does steps 2 to 5 once `image.jpg` and the masks are in place: it writes the defocused images and `masks.png`. Your work is the photo and the masks; change the blur if the effect is too weak or too strong.

## Submission

Submit **one PDF** named `Lab05.pdf`, the two-digit lab number. It shows the photo and the combined mask image, then one subsection per focal plane with its mask and its defocused result, from near to far: copy the `Layer X` template in `report.typ` once per mask and delete the template. A Compositing section describes how the layers were put back together, then comes your answer. The **Observations** section is written by a group member, not by an AI; every red underlined placeholder must be filled in.

Tell your agent `Build the PDF.` It collects your results into the report, drafts the AI disclosure for your group to confirm, points out anything missing, and produces the ready-to-submit PDF. Commit the photo, the masks and the result images, each under 5 MB.
