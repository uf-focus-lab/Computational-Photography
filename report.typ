#import "docs/template.typ": submission, panels, todo

#show: submission.with(
  lab: 5,
  title: "Simulated Defocus",
  group: none,
  authors: (
    (name: "Member Name", email: "gatorlink@ufl.edu"),
  ),
  date: datetime.today(),
)

= Defocus

#panels(columns: 2, (
  (none, "Photo"),
  (none, "Combined masks"),
))

== Layer 1

#panels(columns: 2, (
  (none, "Mask 1"),
  (none, "Result 1"),
))

== Layer #todo[X]

#todo[One subsection per focal plane: copy this subsection for each mask you made, numbered 2, 3, ... from the nearest layer to the farthest, then delete this template.]

#panels(columns: 2, (
  (none, "Mask X"),
  (none, "Result X"),
))

= Compositing

#todo[How the processed layers were put back together into each result: what is taken from the sharp photo, what from the blurred one, how the mask decides, and what happens at the mask edges.]

// manual
= Observations

- *Depth image*: #todo[Does the combined mask image look like a depth image? Yes or no, and why.]

- *Focus pull*: #todo[What changes from frame to frame, and where the fake defocus differs from a real lens.]

= Details

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Scene*], [#todo[What is in the photo and at what depths.]],
  [*Blur*], [#todo[Kernel size and standard deviation of the Gaussian.]],
  [*Masks*], [#todo[How many layers, and which tool made the masks: painted by hand, Segment Anything, or Depth Anything (and how the depth map was split into layers).]],
)

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
