#import "docs/template.typ": submission, panels, todo

#show: submission.with(
  lab: 0,
  title: "Art Lab",
  group: none,
  authors: (
    (name: "Member Name", email: "gatorlink@ufl.edu"),
  ),
  date: datetime.today(),
)

= Results

#panels(columns: 2, (
  ("mountains.png", "Original"),
  (none, "Quantized"),
  (none, "ControlNet"),
  (none, todo[Name of AI used]),
))

= Details

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Quantized*], [#todo[Levels used per channel, and anything else you changed in `artlab.py`.]],
  [*ControlNet*], [#todo[Mode, settings and prompt.]],
  [*#todo[Name of AI used]*], [#todo[Tool, model if known, and the prompt.]],
)

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
