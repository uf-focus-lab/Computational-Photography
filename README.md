# Lab 2: Depth Edges

<!-- AI agents: AGENTS.md at the root is your instruction file. -->

## Tasks

1. Look at the pseudo-code released in class and capture images of your scene from four illumination directions. (a) The light should be near the camera, (b) shadows should be subtle between each of the four images, and (c) the camera should be as still as possible, ideally static.

2. Give the RGB image to an AI and ask for the depth edges. One way to do it is to ask for a depth map, and then ask for edges of that depth map.

3. Take two computational photographs, one of depth edges and the other of ALL edges. You can create these by code or by asking an AI. Then ask a different AI to take the edges and reconstruct the original scene. You can tell the AI, by text, what color stuff was. What is the difference between the AI-reconstructed image from depth edges vs. the AI-reconstructed image from ALL edges?

4. The MIT paper we are looking at is *Non-photorealistic Camera: Depth Edge Detection and Stylized Rendering using Multi-Flash Imaging*. Use your best depth edges and the RGB of the scene to create an NPR image, just like in the paper, using an AI.

## Submission

Submit **one PDF** named `Lab02.pdf`, the two-digit lab number. It shows (i) your best depth edges with the original scene, (ii) your best AI depth edges, (iii) your best reconstruction from depth edges, (iv) your best reconstruction from ALL edges, and (v) your best NPR rendering. The **Discussion** section is written by a group member, not by an AI; every red underlined placeholder must be filled in.

Tell your agent `Build the PDF.` It collects your results into the report, drafts the AI disclosure for your group to confirm, points out anything missing, and produces the ready-to-submit PDF. Commit the result images.

> [!WARNING]
> **Fall 2027:**\
> Submission requirements updated after the submission deadline will not affect your grade.
