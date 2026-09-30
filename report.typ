#import "docs/template.typ": submission, panels, todo

#show: submission.with(
  lab: 4,
  title: "Direct/Global Separation",
  group: none,
  authors: (
    (name: "Member Name", email: "gatorlink@ufl.edu"),
  ),
  date: datetime.today(),
)

= Separation

#panels(columns: 3, (
  (none, "Floodlit"),
  (none, "Direct"),
  (none, "Global"),
))

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Scene*], [#todo[What is in the scene and what materials it has.]],
  [*Capture*], [#todo[Light source, how it was swept, camera settings, number of frames.]],
)

// manual
= Features

- *Specularities*: #todo[Where they appear in the direct image and why that is expected.]

- *Shadows*: #todo[Where the direct image is dark and why.]

- *Interreflections*: #todo[Where the global image shows light bouncing between surfaces.]

= AI separation

#panels(columns: 2, (
  (none, "AI direct"),
  (none, "AI global"),
))

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Tool and prompt*], [#todo[Which AI, and the exact prompt.]],
  [*What confused it*], [#todo[Where the AI's images disagree with yours, and what in the scene caused it.]],
)

= Extra credit: light's view

#panels(columns: 2, (
  (none, "Floodlit"),
  (none, "View from the light"),
))

#todo[How you implemented the shadow camera.]

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
