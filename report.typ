#import "docs/template.typ": submission, panels, todo, code

#show: submission.with(
  lab: "Take-Home Lab 2",
  title: "Depth Edges and Blender for Ground Truth",
  group: none,
  authors: ((name: "Member Name", email: "gatorlink@ufl.edu"),),
  date: datetime.today(),
)

= Results

#panels(columns: 3, height: 1.1in, (
  (none, "Ground truth depth edges"),
  (none, "Four-light depth edges"),
  (none, "Real Lab 2 depth edges"),
))

= Details

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Inputs*], [#todo[Provided renders or your own scene; image size and source of the real Lab 2 result.]],
  [*Ground truth*], [#todo[Depth channel, filters, thresholds and any preprocessing used in Part 1.]],
  [*Four-light method*], [#todo[Filters, directions, thresholds and any preprocessing used in Part 2.]],
  [*Comparison*], [#todo[The equation and value of your numerical comparison against ground truth.]],
)

// manual
= Discussion

_Written by you. No AI may author or draft the text in this section._

- *Ground truth comparison*: #todo[Where your four-light result agrees or disagrees with ground truth.]

- *Simulated and real*: #todo[How your simulated edges differ from your real in-class Lab 2 edges.]

- *Eight lights*: #todo[How your algorithm would change for eight lighting directions instead of four.]

- *Camera and light separation*: #todo[What happens as the distance between the camera and light increases.]

= Extra credit results

#todo[Optional; leave as is if not attempted.]

#panels(columns: 2, height: 1.1in, (
  (none, "Baseline"),
  (none, "Modified result"),
))

// manual
= Extra credit discussion

_Written by you. No AI may author or draft the text in this section._

#todo[Your change to Part 1 or 2, the evidence of improvement or failure, and why it did or did not work.]

// manual
= Extra credit feedback

_Written by you. No AI may author or draft the text in this section._

#todo[Optional: what could be improved about this assignment? Write your feedback here in the PDF.]

= Source code

_Upload only TakeHome02.pdf. Include complete source code below as readable, selectable text, labeled by filename. Do not upload source files separately. This section has no page limit._

#todo[Include the complete code you used, labeled by filename. Add one code block per file and remove unused files. For notebooks or Live Scripts, include all code cells as text.]

*depth_edges.py*

#code("depth_edges.py", "python")

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
