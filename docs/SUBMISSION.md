# Generate the submission PDF

Paste this file into your agent, or reference it with `@docs/SUBMISSION.md`, when the lab work is done. It also works as a checklist by hand.

1. **Read the lab and the report.** `README.md` gives the tasks and deliverables. `report.typ` gives the structure: its top-level headings are the required sections, `// manual` above a heading marks a section a student must write, and every red `#todo[...]` is a placeholder. `docs/REPORT.md` explains the template. Confirm `git branch --show-current` is `LabN` for lab N, or `TakeHome/LabN` for take-home lab N; stop if not.

2. **Read `GROUP.md`** for the group number, `Me:` and the roster. If it is missing, run the onboarding in `AGENTS.md` first. The roster must match `authors` in `report.typ`; if not, `report.typ` is right and `GROUP.md` is rewritten from it. A take-home lab is individual: there `authors` is the `Me:` member alone with `group: none`, and the checks below about every member apply to that one student.

3. **Collect the results.** For every number and image, know which script produced it. Re-run anything missing. If a result cannot be produced, say so plainly in that section of the report. Never invent, estimate or assume a value. Result images the report shows are committed.

4. **Fill in `report.typ`.** Keep the headings as shipped. Replace every `#todo[...]`. Replace every `none` panel with a file name relative to the repository root, and turn placeholder labels such as "Name of AI used" into the real name everywhere they appear. Plain markup only: headings, bullets, tables, figures. Draft non-manual sections from the results in plain technical prose and tell the student which ones you drafted. For `// manual` sections use the student's text verbatim; if there is none, leave `#todo[To be written by the student.]` and say so. Keep the results on page 1.

5. **Finalise the AI disclosure.** It already holds one bullet per member, kept current after every task per `AGENTS.md`. Update the `Me:` bullet from your own record. Each bullet names tools and models, code the AI wrote or ran, figures it produced, text it drafted, and the parts done without AI. Show the student the section and ask them to bring back the group's confirmation or corrections, the student's own on an individual lab, in one message; do not finalise until they have. Then write the confirmed text, one bullet per member in roster order, one blank line between bullets. This is the one time you may edit other members' bullets, and only to the confirmed text. Never soften or omit. An inaccurate disclosure is worse than heavy AI use.

6. **Compile exactly one PDF from `report.typ`.** Name it `LabXX.pdf` with the lab number padded to two digits, `Lab04.pdf` for Lab 4, or `TakeHomeXX.pdf` for a take-home lab, `TakeHome01.pdf` for Take-Home Lab 1, so each lab's PDF has its own name in the repository. Delete every other PDF in the repository first. Fix every error and warning; a missing image is an error.

   ```sh
   typst compile report.typ Lab04.pdf
   ```

7. **Verify.** Every required heading appears once. No `#todo` remains except `#todo[To be written by the student.]` in a manual section, each reported to the student, and any placeholder in a section whose heading starts with "Extra credit", which may stay untouched. `authors` is no longer the shipped default and every member appears on the first page, spelled as in `GROUP.md`, with the group number when there is one. AI disclosure is the last section, one bullet per member in roster order, one blank line between bullets, confirmed by the group, or by the student on an individual lab. Manual sections contain only the student's words. That PDF is the only PDF in the tree.

8. **Report** in a few lines: the PDF path, which sections you drafted, and anything left for the student to do by hand. Do not commit the PDF. Commit and push `report.typ` so the group has the final version; on a take-home lab commit only, never push.
