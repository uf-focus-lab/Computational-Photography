#import "docs/template.typ": submission, panels, todo

#show: submission.with(
  lab: 3,
  title: "EPI, COLMAP and VGGT",
  group: none,
  authors: (
    (name: "Member Name", email: "gatorlink@ufl.edu"),
  ),
  date: datetime.today(),
)

= EPI

#panels(columns: 3, (
  (none, "Scene"),
  (none, "EPI, row slice"),
  (none, "EPI, column slice"),
))

#panels(columns: 2, (
  (none, "EPI with the colored patch"),
  (none, "Perpendicular EPI with the patch"),
))

// manual
= Observations

- *EPI images*: #todo[How the row and column slices differ, and what changes with the location of mid.]

- *Patch*: #todo[What happens in the EPI images and in the video when the patch is colored.]

= Reconstruction

== COLMAP

#panels(columns: 3, (
  (none, "Frame 1"),
  (none, "Frame 2"),
  (none, "Frame 3"),
))

== VGGT

#panels(columns: 3, (
  (none, "Frame 1"),
  (none, "Frame 2"),
  (none, "Frame 3"),
))

= Details

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Capture*], [#todo[Objects, camera, how it was slid, number of frames.]],
  [*Patch*], [#todo[Coordinates, color and frame of the patch.]],
  [*Tools*], [#todo[COLMAP and VGGT settings, and any AI help.]],
)

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
