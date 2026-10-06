#import "docs/template.typ": submission, panels, todo, code

#show: submission.with(
  lab: "Take-Home Lab 1",
  title: "Image Comparison Metrics",
  group: none,
  authors: (
    (name: "Member Name", email: "gatorlink@ufl.edu"),
  ),
  date: datetime.today(),
)

= Part 1: MSE, MAE and PSNR

_Quantized must be the exact Lab 0 answer: every channel of mountains.png quantized at thresholds 50, 100 and 150, values below 50 to 50, 50 to 99 to 100, 100 to 149 to 150, 150 and above to 200. If your Lab 0 result differs, fix it first; metrics on any other quantized image are not accepted._

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Quantized*], [#todo[MSE, MAE and PSNR in dB against the original mountains.png.]],
  [*ControlNet*], [#todo[MSE, MAE and PSNR in dB against the original mountains.png.]],
  [*#todo[Name of AI used]*], [#todo[MSE, MAE and PSNR in dB against the original mountains.png.]],
)

$ "MSE" = #todo[The equation you used for MSE.] $

$ "MAE" = #todo[The equation you used for MAE.] $

$ "PSNR" = #todo[The equation you used for PSNR.] $

// manual
= Part 1 discussion

_Written by you. No AI may author or draft the text in this section._

- *Findings*: #todo[What the three metrics say about your Lab 0 results, and whether that matches how the images look.]

- *Posterized or noisy*: #todo[Can any of these metrics tell a posterized image from a noisy one? Why or why not?]

= Part 2: perturbation

#panels(columns: 2, (
  (none, "Original"),
  (none, "Perturbed"),
))

#todo[The perturbation and its parameters, and the MSE between the original and the perturbed image.]

// manual
= Part 2 discussion

_Written by you. No AI may author or draft the text in this section._

- *Higher or lower*: #todo[Why the MSE is higher or lower than in Part 1.]

- *Limitations*: #todo[Some limitations of MSE, and what kind of information a more robust image comparison metric would need.]

= Details

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Images*], [#todo[The original and the Lab 0 results compared, and any resizing done to match the original's size.]],
  [*Language*], [#todo[MATLAB or Python, and the files that hold your code.]],
)

= Extra credit: another comparison metric

#todo[Optional; leave as is if not attempted.]

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.6pt + luma(25%),
  inset: 6pt,
  [*Metric*], [#todo[Which metric, and the function or code that computes it.]],
  [*Lab 0 results*], [#todo[Its value for each Lab 0 result against the original.]],
  [*Perturbed*], [#todo[Its value for the Part 2 result against the original.]],
)

$ #todo[Metric] = #todo[The equation your metric computes.] $

// manual
= Extra credit: discussion

_Written by you. No AI may author or draft the text in this section._

- *How it works*: #todo[How this image comparison metric works.]

- *Posterized or noisy*: #todo[Would this metric let you tell a posterized image from a noisy one?]

= Source code

#todo[One code line per file you wrote, path from the repository root: add metrics.m with "matlab", perturb.py with "python", and so on, and delete the line of any file you did not use.]

#code("metrics.py", "python")

= AI disclosure

- *#todo[Member Name]*: #todo[AI tools this member used and for what.]
