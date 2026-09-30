#import "docs/template.typ": submission, panels, todo

#show: submission.with(
  lab: 1,
  title: "Edgerton",
  group: none,
  authors: (
    (name: "Member Name", email: "gatorlink@ufl.edu"),
  ),
  date: datetime.today(),
)

= Results

#panels(columns: 3, (
  (none, "Edgerton from code"),
  (none, "Edgerton by AI from the video"),
  (none, "Frames of the GIF backed out by AI"),
))

= Details

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Video*], [#todo[What moves in the scene, camera setup, number of frames.]],
  [*Code*], [#todo[How the frames were composited: min, max, median, frame stride, and what you changed in `edgerton.py`.]],
  [*AI photo*], [#todo[Which AI, and the prompt.]],
  [*AI GIF*], [#todo[Which AI, the prompt, and how many frames it gave you.]],
)

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
