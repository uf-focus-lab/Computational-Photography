// Shared typst template. Usage is documented in docs/REPORT.md.

#let submission(
  lab: 0,
  title: "",
  group: none,
  authors: (),
  date: datetime.today(),
  body,
) = {
  // lab is a number, or a full name such as "Take-Home Lab 1".
  let name = if type(lab) == str { lab } else { "Lab " + str(lab) }
  set document(
    title: name + ": " + title,
    author: authors.map(a => a.name),
  )
  set page(
    paper: "us-letter",
    margin: (x: 1in, top: 0.9in, bottom: 0.8in),
    header: [
      #set text(size: 9pt, fill: luma(40%))
      Computational Photography | #name
      #h(1fr)
      #date.display("[month repr:long] [day], [year]")
    ],
    footer: context [
      #set align(center)
      #set text(size: 9pt, fill: luma(40%))
      #counter(page).display("1 of 1", both: true)
    ],
  )
  set text(font: ("Libertinus Serif", "New Computer Modern", "Times New Roman"), size: 11pt)
  set par(justify: true, leading: 0.65em)
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => block(above: 1.4em, below: 0.8em, it)
  // Code blocks with their own theme are drawn by code() below.
  show raw.where(block: true): it => if it.theme != auto { it } else { block(
    fill: luma(96%),
    inset: 8pt,
    radius: 3pt,
    width: 100%,
    text(size: 9pt, it),
  ) }
  show figure.caption: set text(size: 9.5pt)

  // Title block.
  align(center)[
    #text(size: 17pt, weight: "bold")[#name: #title]
    #v(0.15em)
    #text(size: 10.5pt)[
      #if group != none [#text(weight: "semibold")[Group #group] #h(0.8em)]
      #authors.map(a => link("mailto:" + a.email)[#a.name]).join([, ])
    ]
  ]
  v(0.6em)

  body
}

// Red underlined placeholder; empty body prints TODO.
#let todo(body) = {
  let inner = if body == [] [TODO] else { body }
  text(fill: red, underline(inner))
}

// Bordered table of image panels with shaded labels; none = IMAGE PENDING.
#let panels(columns: 2, height: 1.75in, stroke: 0.6pt + luma(25%), inset: 6pt, label-fill: luma(94%), cells) = {
  let image-cell(path) = if path == none {
    box(
      width: 100%, height: height,
      align(center + horizon, text(fill: red, size: 11pt, weight: "semibold")[IMAGE PENDING]),
    )
  } else {
    box(width: 100%, height: height, image("/" + path, width: 100%, height: 100%, fit: "contain"))
  }
  let label-cell(label) = table.cell(
    fill: label-fill,
    stroke: (top: (dash: "dashed", paint: stroke.paint, thickness: stroke.thickness)),
    align(center, text(size: 9.5pt, weight: "semibold", label)),
  )
  let rows = ()
  for chunk in cells.chunks(columns) {
    rows += chunk.map(c => image-cell(c.at(0)))
    rows += chunk.map(c => label-cell(c.at(1)))
  }
  table(
    columns: (1fr,) * columns,
    stroke: stroke,
    inset: inset,
    ..rows,
  )
}

// A source file, path from the repository root, syntax highlighted in VS Code's
// Dark Modern colours on a dark rounded block that breaks across pages.
#let code(path, lang) = block(
  fill: rgb("#1f1f1f"),
  radius: 6pt,
  inset: 10pt,
  width: 100%,
  breakable: true,
  {
    set text(size: 8pt, fill: rgb("#cccccc"))
    set par(justify: false)
    raw(read("/" + path), lang: lang, block: true, theme: "/docs/dark-modern.tmTheme")
  },
)
