# Writing the report

`report.typ` at the repository root is the report. Its top-level headings are the required sections, in order. Red underlined text is a placeholder. Build with

```sh
typst compile report.typ LabXX.pdf        # XX is the two-digit lab number, Lab04.pdf for Lab 4
```

## Placeholders

`#todo[...]` renders red and underlined. A bare `#todo[]` prints TODO. The submission procedure checks that no red text remains.

## Title block

```typst
#show: submission.with(
  lab: 0,
  title: "Art Lab",
  group: 7,                      // none if you have no group yet
  authors: (
    (name: "Ada Lovelace", email: "ada@ufl.edu"),
    (name: "Alan Turing", email: "turing@ufl.edu"),
  ),
  date: datetime.today(),
)
```

`authors` is your group's roster, filled once during onboarding and shared through the repository. Every other file takes the roster from here. Names become mailto links on the title page.

## Image panels

```typst
#panels(columns: 2, (
  ("mountains.png", "Original"),
  (none, "Quantized"),
))
```

Each entry is a file name relative to the repository root and a label. `none` shows IMAGE PENDING in red until replaced. A deliverable that is a video or GIF is shown as frames in its own subsection, three per row; add one `("frame4.png", "Frame 4")` entry per extra frame and the grid wraps to a new row. Labels sit in a shaded row under the images. A label that is itself a placeholder, such as `todo[Name of AI used]`, becomes the real name. Optional arguments: `height`, `stroke`, `inset`, `label-fill`.

## Manual sections

`// manual` on the line above a heading means a student writes that section in their own words. Agents insert the text verbatim or leave `#todo[To be written by the student.]`.

## AI disclosure

The last section holds one bullet per member, in roster order, one blank line between bullets:

```typst
= AI disclosure

- *Ada Lovelace*: Claude Code wrote and ran Q1 to Q3 in `artlab.py`. No AI
  for the ControlNet panel.

- *Alan Turing*: Gemini for panel 4. Report text drafted by Claude Code
  from my notes.
```

It is a living record. After every piece of work your agent rewrites your own bullet and pushes. Edit only your own bullet and keep the blank line; it is what lets git merge two members' edits. Each bullet names tools and models, code they wrote or ran, figures they produced, text they drafted, and the parts done without AI. At submission the whole group confirms the section.

## Plain markup only

Headings, bullet lists, tables and figures. No new functions, and no imports beyond `submission`, `panels` and `todo`.
