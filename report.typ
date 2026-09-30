#import "docs/template.typ": submission, panels, todo

#show: submission.with(
  lab: 2,
  title: "Depth Edges",
  group: none,
  authors: (
    (name: "Member Name", email: "gatorlink@ufl.edu"),
  ),
  date: datetime.today(),
)

= Depth edges

#panels(columns: 3, (
  (none, "Original scene"),
  (none, "Depth edges by code"),
  (none, "Depth edges by AI"),
))

= Reconstructions

#panels(columns: 3, (
  (none, "From depth edges"),
  (none, "From all edges"),
  (none, "NPR rendering"),
))

// manual
= Discussion

#todo[What is the difference between the reconstruction from depth edges and the one from all edges, and why.]

= Details

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Capture*], [#todo[The scene, the four light positions, and how the camera was held still.]],
  [*Tools and prompts*], [#todo[Which AI produced each of the AI images, and the prompts.]],
)

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
