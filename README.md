# Lab 3: EPI, COLMAP and VGGT

<!-- AI agents: AGENTS.md at the root is your instruction file. -->

This lab has three parts, A, B and C. B and C should probably have one object, but A must have a few different objects.

## Tasks

### A. EPI

1. Arrange the simple objects you obtained on a flat surface.
2. At some distance away, place your camera.
3. Collect a video from the camera as you slide the camera in a direction that is parallel to the image plane, and perpendicular to the viewing direction.
4. Import this into MATLAB, Python or similar. Suppose the variable name is `vid`; then `vid` has four dimensions, x, y, color and time. `epi.py` reads the video with OpenCV and writes the slices below.
5. Create an EPI slice of this video by extracting `epi_im = vid(mid,:,:,:)`, where `mid` is the midpoint of the rows.
6. Display the EPI image. Try different locations of `mid`. Try the perpendicular EPI images created by `epi_im_perp = vid(:,mid,:,:)`.
7. Write your observations about the differences between the EPI images.
8. Now pick a patch, a set of rectangular coordinates, for example (10, 10, 100, 100). Color all the patch pixels in the video the same color. For example, if you pick red, then at frame 33 you would do `vid(10:100,10:100,:,33) = [255 0 0]`.
9. Generate EPI images and explain what is happening. Play the video back and explain what is happening.

### B. COLMAP

Run COLMAP on your scene, with help from the links on the syllabus or from an AI, and capture the reconstruction and the camera positions.

### C. VGGT

Run [VGGT](https://huggingface.co/spaces/facebook/vggt-omega) on your scene and capture its output.

## Submission

Submit **one PDF** named `Lab03.pdf`, the two-digit lab number. For A it shows a picture of the scene and the two EPI images, plus the patched EPI; for B a view of the 3D structure with camera positions; for C frames of the VGGT output. The **Observations** section is written by a group member, not by an AI; every red underlined placeholder must be filled in.

Tell your agent `Build the PDF.` It collects your results into the report, drafts the AI disclosure for your group to confirm, points out anything missing, and produces the ready-to-submit PDF. Commit the result images and GIFs, not the video.

> [!WARNING]
> **Fall 2027:**\
> Submission requirements updated after the submission deadline will not affect your grade.
