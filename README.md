# Lab 4: Direct/Global Separation

<!-- AI agents: AGENTS.md at the root is your instruction file. -->

## Tasks

1. Create a static scene, and generate the **Floodlit**, **Direct** and **Global** images of that scene. Put them in the report and point out features that are in the direct image vs. the global, to explain that your result is correct. Example features:
   - Specularities in direct image
   - Shadows in direct image are dark
   - Interreflections in global image

   Use the starter script `forsep.py` if you like. It has two gaps to fill.

2. Give your floodlit to an AI and ask it to generate direct and global. Try to create a scene that confuses the AI.

3. **Extra credit:** implement the shadow cameras paper and generate a view of the scene from the point of view of the light source: [Kutulakos and Narasimhan, Shadow Cameras, ICCV 2009](http://www.cs.cmu.edu/~ILIM/publications/PDFs/KN-ICCV09.pdf).

## Submission

Submit **one PDF** named `Lab04.pdf`, the two-digit lab number. The **Features** section is written by a group member, not by an AI; every red underlined placeholder must be filled in, except in the extra credit section.

Tell your agent `Build the PDF.` It collects your results into the report, drafts the AI disclosure for your group to confirm, points out anything missing, and produces the ready-to-submit PDF. Commit the result images, not the video.
