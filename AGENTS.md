# Instructions for AI agents

You are working in a student's submission repository for Computational Photography at the University of Florida. The course is built around agentic AI: write code, run experiments, make figures and draft report text unless the lab says otherwise. The student owns the work and answers for it. Read this file before touching git.

Files: `README.md` is the current lab. `report.typ` is the report; its headings are the required sections and its red `#todo[...]` marks are the placeholders. `docs/REPORT.md` explains the report and the template. `docs/SUBMISSION.md` builds the PDF. `GROUP.md`, untracked, says whose clone this is.

## Take-Home Lab 2: agent execution guide

Apply this section only on `TakeHome/Lab2`, or while starting that assignment. It takes precedence over generic setup, group collaboration, reporting and PDF-cleanup steps below and in `docs/`. The visible README and Canvas assignment define the student's tasks and deliverables. These execution instructions do not add grading requirements, authorize reuse of others' work, or supply discussion answers. Read the whole README and `report.typ` before implementing anything.

### Start or resume the individual workspace

- Follow the take-home fetch procedure below; do not run group onboarding, create an `origin` repository, fetch group work, or push as part of starting this lab. A missing `origin` does not require group setup for this individual assignment. Use `TakeHome/Lab2` exactly. If the upstream branch is unavailable, report that fact; do not substitute in-class `Lab2`, another take-home lab, or an instructor solution.
- Preserve uncommitted work and existing local lab files. If this branch already exists, inspect its progress before changing it; do not overwrite completed code, roster, discussion or disclosure with starter defaults. For a new branch, use only the student's identity from `Me:` in `GROUP.md`. If that identity is missing or ambiguous, ask for it; do not infer it from Git or select a teammate. Keep an existing group roster file intact; `report.typ` has just this student and `group: none`.
- Ask together for the location of the five Canvas input files and the student's permitted prior Lab 2 implementation and real four-light depth-edge result, unless already known. Keep supplied originals intact and record provenance. Lab 2 also had AI-generated images: do not silently substitute those for the computational four-light result.
- Do not decide that prior group code is either automatically permitted or automatically misconduct. If reuse permission or ownership is unclear, identify the particular files and ask the student to obtain instructor clarification. Continue with the supplied renders and independent implementation where possible. Do not retrieve group branches or copy another student's code, results or text. If the prior real result is missing, mark that comparison pending; do not invent an image or require an unassigned recapture experiment.
- Check the existing Python environment and Typst before use. Reuse the environment; do not assume `python` means the repository's interpreter. Follow the existing installation-consent rules if dependencies are missing. MATLAB and notebook workflows are alternatives, not additional required submissions.

### Implement and verify the computation

- `depth_edges.py` is a scaffold with three intentional `NotImplementedError` stubs. `--check-inputs` validates loading only; it does not finish any lab part. Run the implemented computation and inspect its outputs before claiming results exist. Do not fetch or import instructor answer keys.
- Verify matching dimensions and floating-point depth at load time. Preserve the EXR values; converting an already quantized integer image to float does not restore depth precision. The supplied scaffold uses an unchanged EXR read. If using another reader or a notebook, check its returned dtype and range rather than assuming it preserved depth. Do not silently normalize depth to an 8-bit display image, resize inputs, or select an arbitrary channel of a custom EXR. Explain and record any necessary handling of custom channels, non-finite depth or zero illumination denominators.
- Check filter axis, sign, scale and boundary conventions when adapting code across libraries. A function named Sobel does not guarantee the same directional response in Python and MATLAB. Use a small synthetic transition to verify the intended polarity; do not adjust signs or thresholds merely to imitate an unexplained reference number. Preserve the student's implementation choices and record their actual parameters.
- The numerical comparison is between the simulated four-light mask and the reference derived from its matching depth pass. Use masks with the same coordinates and dimensions. Comparison with the prior real Lab 2 scene is qualitative; do not compute pixelwise errors between unrelated scenes or claim that they are registered.
- State the metric actually computed, its equation, and its measured value. The assignment does not prescribe one metric: do not silently add IoU, F1, a target score or a grading threshold as a requirement. Check how the chosen metric handles sparse edges and empty masks. Explain limitations to the student without drafting their manual discussion or substituting a fabricated score.
- Part 3 asks for discussion, not an eight-light implementation or an additional capture/render sweep. Camera-light separation refers to the camera-to-light baseline, not automatically to camera-to-scene distance. Do not expand the experiment scope or author the student's answers.
- Extra credit is optional. Do not assume it was attempted or invent improvement/feedback. If the student attempts an improvement, retain the baseline and record what changed. Compare algorithms under the same evaluation settings; distinguish a change to reference construction from a change to the estimate rather than reporting both as an unexplained score improvement.

### Build and check the single PDF

Follow `docs/SUBMISSION.md` with these specific overrides:

- Produce `TakeHome02.pdf` as the single Canvas upload. Never delete other PDFs to satisfy the inherited "only PDF in the tree" instructions. Preserve previous reports, references, source files and other working files. Do not ask for separate code, notebooks, images, archives or repository links as graded uploads.
- Keep one student in the title and one confirmed AI-disclosure entry. Do not rewrite the existing group `GROUP.md` to match this individual report; its `Me:` identity supplies the individual author. No group confirmation, group synchronization or push is needed.
- Insert the student's manual text verbatim in Discussion, Extra credit discussion and Extra credit feedback. Do not draft, paraphrase, shorten or supply answer outlines for those sections. If text is missing, keep it pending and identify the exact missing section. Ask the student for their own shorter text if pagination requires it. Non-manual implementation details must be supported by the actual code and results.
- Apply placeholder checks only to required work and optional work actually attempted. Unattempted extra-credit placeholders may remain as allowed by the visible instructions; do not manufacture images or treat them as missing mandatory results. Feedback belongs in the existing `Extra credit feedback` section inside the PDF, not a separate Canvas comment.
- Include complete authored/adapted code used for the reported results, including helpers, plotting and attempted bonus experiments. Do not include installed dependency source, environment folders, datasets or credentials. Label each source block by filename. For notebooks or Live Scripts, include code cells as readable source text in execution order, not notebook JSON, screenshots or output-only exports. Replace the default scaffold listing if it is not the implementation actually used.
- Verify selectable, readable, syntax-highlighted code in the exported PDF, including long lines and page transitions. Do not silently truncate code or shrink it to illegibility. Keep AI disclosure last. If no AI was used for a particular part, record that accurately; do not infer or invent usage.
- Check the rendered report portion, including attempted bonus results and feedback, against the two-page limit. Code has no page limit and disclosure is excluded. The total PDF may exceed two pages. A page break before Source code can make the boundary clear; never fit by deleting required content or rewriting manual discussion. Check image legibility and clipping as well as successful compilation.
- Distinguish a preview from a submission-ready PDF. A PDF can compile while required results, manual discussion, source code or disclosure confirmation are missing. Such a PDF is a draft: identify what is missing and do not call it ready to submit. Only call it ready after content, pagination, provenance, source-code completeness and disclosure confirmation checks pass. Report the exact file path. Commit permitted work locally; do not push or upload automatically.

## Repository model

- `upstream` is the public course repository, `github.com/uf-focus-lab/Computational-Photography`, read-only. Every lab is a branch named `Lab0`, `Lab1`, `Lab2`, and so on; take-home labs are `TakeHome/Lab1`, `TakeHome/Lab2`, and so on. `welcome`, the default branch, holds the setup guide and the shared files. There is no `main`.
- `origin` is a private repository, the student's own or the group's shared one. Every push goes there. An optional `personal` remote may hold a member's backup.
- Students commit directly on the lab branch. No pull requests. The deliverable is one `LabXX.pdf` per group, `XX` the two-digit lab number, or, for a take-home lab, which is individual, one `TakeHomeXX.pdf` per student, compiled from `report.typ`, uploaded to Canvas by one member, or for a take-home lab by the student; take-home branches stay local.
- Forking is prohibited. A fork of a public repository is public.
- The group roster is the `authors` list in `report.typ`, committed and shared. `GROUP.md` is derived from it.

## Setup

Triggered by "set me up", or by onboarding finding no usable `origin`. The `welcome` branch's README carries the same steps for an agent that is not yet inside a clone. Before anything else, ask how the student wants to collaborate, solo, hosting the group repository, or joining one by URL, and get an explicit yes.

1. Check `python3 --version`, 3.10 or newer, and `typst --version`, 0.12 or newer. If typst is missing, offer to install it: `brew install typst`, `winget install Typst.Typst`, or `cargo install typst-cli`. Ask before installing anything.
2. Remotes, from `git remote -v`:
   - If `origin` points at `uf-focus-lab/`, `git remote rename origin upstream`.
   - If `upstream` is missing, `git remote add upstream https://github.com/uf-focus-lab/Computational-Photography.git`.
   - If the student gave a group repository URL, `git remote add origin <url>` and run "Before any push".
   - Otherwise create their private repository. With `gh`: `gh repo create comp-photo-labs --private --source=. --remote=origin --push`. Without it, ask them to create an empty private repository on github.com and paste the URL, then `git remote add origin <url>` and `git push -u origin <current branch>`. Tell them to add teammates under the repository's Settings, Collaborators.
3. Environment: `python3 -m venv .venv`, then `.venv/bin/pip install -r requirements.txt`, or `.venv\Scripts\pip` on Windows.
4. Continue with onboarding.

## Individual assignments

A lab whose `README.md` has, right under its title, a line starting `> **Individual assignment.**` is done solo, by one student, even in a group repository. Every take-home lab is one. On such a lab:

- Do not ask for a group number or a roster. If `GROUP.md` is missing, ask only for the student's full name and UF email and write it with `# Group none`, `Me:` and a one-row table. If it exists, leave it as it is and use only the `Me:` row.
- In `report.typ`, `group: none`, one author, the student, and exactly one AI disclosure bullet, theirs.
- The PDF, `TakeHomeXX.pdf` for a take-home lab, is built by and for this student alone.
- Work only on the local branch `TakeHome/LabN`, set up as in "Take-home labs" under "Fetching a new lab". It is local only: never push it, or anything while it is checked out, to `origin`, the group's shared repository, and never `git pull`, merge or check out the group's branches or a teammate's for this lab. Never copy another student's results, code or text into it. After every task, commit only: no push, no pull. The deliverable is the PDF uploaded to Canvas, not a branch. A student who wants a backup may add their own private repository as the remote `personal` and push there on request, never to `origin` or `upstream`.
- "Collaboration" below does not apply to this lab's work.

## Start of every session

If `GROUP.md` exists, read it and carry on. Never ask for its contents again. If it is missing, this is the first session in this clone: run onboarding before anything else, saying in one line why, or, on an individual assignment or when the student asks to start a take-home lab, only the short form in "Individual assignments" above.

### Onboarding

1. `git remote -v`. If `origin` exists and is not under `uf-focus-lab/`, `git fetch origin` and `git pull --ff-only` so `report.typ` is current.
2. Read `authors` in `report.typ`.
   - Filled in: that is the roster. Ask only which member the student is.
   - Still `Member Name`: this is the first clone in the group. Ask in one message for the group number or "no group yet", every member's full name and UF email, and which one is the student. Write `authors`, set `group:` to the number or `none`, and give every member one bullet under AI disclosure, each a `#todo[...]`, one blank line between bullets. Commit as `report: set group roster`.
3. Ask whether the group has a shared private repository: a URL, "mine will be it", or "not yet". Skip this if the answer is already known from Setup or from the `welcome` README's agentic setup.
4. Write `GROUP.md` at the repository root:

   ```markdown
   # Group 7

   Me: Ada Lovelace
   Repository: git@github.com:ada/comp-photo-labs.git

   | Name | UF email |
   | --- | --- |
   | Ada Lovelace | ada@ufl.edu |
   | Alan Turing | turing@ufl.edu |
   ```

   The heading is `# Group 7` or `# Group none`. `Me:` is one name from the table, spelled as in `report.typ`. `Repository:` is the URL or `none yet`. The table mirrors `authors` in order. `GROUP.md` is ignored by git and never committed.
5. Set up remotes according to step 3, see Collaboration. Run "Before any push" first. If `.venv` is missing, run Setup step 3.
6. If the student's own bullet is missing because the roster changed, pull, add only their bullet, and commit.
7. Confirm in two lines: group, member count, where pushes go, and that later sessions skip this.

Never take names or emails from git config or the GitHub account.

## After every task

The AI disclosure in `report.typ` is a living record, one bullet per member. After each task that touched the lab:

1. Edit only the bullet whose bold name matches `Me:`. Never touch another member's bullet, not even a typo.
2. Rewrite it: tools and models, code the AI wrote or ran, figures it produced, text it drafted, and the parts done without AI. From your own record plus what the student tells you. One line.
3. Keep one blank line between bullets. Git needs it to merge two members' edits.
4. Commit as `report: update <name>'s AI disclosure`. On a take-home lab stop there: no pull, no push. Otherwise, if `GROUP.md` names a group repository: `git pull --ff-only`, merge if that fails, then push after "Before any push". A conflict inside this section is resolved by keeping each member's own latest bullet.

The bullets are provisional. `docs/SUBMISSION.md` has the group confirm them at the end.

## Collaboration

When the student mentions teammates, a group repository, sharing or joining, in any wording, mention this setup in one line and offer to run it after finishing what they asked.

One member's private repository is the group's central repository. Every member's `origin` points at it. `upstream` stays the course repository.

- **Host.** The student's `origin` becomes the group repository. They add teammates as collaborators on GitHub and share the clone URL. Set `Repository:` in `GROUP.md`.
- **Join from a fresh clone.** Clone the group repository, add `upstream`, onboard.
- **Join with solo work.** Run "Before any push" on the group URL. Then `git remote rename origin personal`, `git remote add origin <url>`, `git fetch origin`. On the lab branch: push if `origin/<branch>` does not exist, otherwise merge `origin/<branch>` and push. The group's roster wins; the student's bullet is kept. Never rebase shared history. Update `GROUP.md`.
- **Daily.** `git pull --ff-only` on the lab branch before work. If it fails, merge and say what came in.

## Before any push

Check with `git remote -v`. If any item fails, stop and explain.

- `origin` exists and is not under `uf-focus-lab/`. Otherwise run Setup.
- `origin` is private: `gh repo view "$(git remote get-url origin)" --json visibility --jq .visibility` prints `PRIVATE`. Without `gh`, ask the student to confirm on the repository's GitHub settings page, once per session.
- The target is `origin`, or `personal` on request. Never `upstream`.
- Never push a branch whose name starts with `TakeHome/` to `origin`, and never push to `origin` at all while such a branch is checked out. Take-home work stays local; the pre-push hook from "Take-home labs" enforces this.

## Fetching a new lab

On "start lab N", "get lab N" or similar, follow the steps below. A request that names a take-home lab, such as `Start Take-Home Lab 1, this is an individual assignment so fetch directly from upstream branch TakeHome/Lab1, then follow its instructions.`, uses only steps 1 and 2 below, then the steps in "Take-home labs" after them.

1. `git status --porcelain` must be empty. Otherwise show the student what is uncommitted and offer to commit it. Never stash, discard or reset.
2. Ensure `upstream` exists, else `git remote add upstream https://github.com/uf-focus-lab/Computational-Photography.git`.
3. `git fetch upstream origin`.
4. In this order: if `LabN` exists locally, switch to it and `git pull --ff-only`; else if `origin/LabN` exists, `git switch -c LabN origin/LabN`; else `git switch -c LabN upstream/LabN`, then push after "Before any push".
5. Show `git branch --show-current` and the first twenty lines of `README.md`.
6. If `requirements.txt` changed, `pip install -r requirements.txt` in `.venv`.
7. A branch fresh from `upstream` ships the default roster. Fill it from `GROUP.md` as in onboarding step 2, commit, push.

"Checkout clean" means the branch matches its source. Untracked files are the student's and stay.

### Take-home labs

Take-home labs are individual and local. The start prompt is `Start Take-Home Lab 1, this is an individual assignment so fetch directly from upstream branch TakeHome/Lab1, then follow its instructions.`, or "start take-home lab N" in any wording. It names the upstream branch and says to follow its instructions: fetch that branch, create the local-only branch from it, and then follow the branch's `README.md`, its agent comment, for everything else. Every detail lives here and in that README, not in the prompt. Do exactly this instead of the steps above:

1. Steps 1 and 2 above. Do not run group onboarding: if `GROUP.md` is missing, use the short form in "Individual assignments", and ask nothing about a group or a group repository.
2. `git fetch upstream TakeHome/LabN`. This, and merging course updates from it, is the only remote interaction on a take-home lab: nothing is fetched, pulled or merged from `origin` and nothing is pushed there.
3. If `TakeHome/LabN` exists locally, switch to it; else `git switch -c TakeHome/LabN --no-track upstream/TakeHome/LabN`, so the branch has no upstream to push to. Never `git pull`, and never merge or check out the group's branches or a teammate's.
4. Install the guard: it refuses pushing a take-home branch, or any commit that is a take-home tip, to `origin` or `upstream`, and any push to them while a take-home branch is checked out. If `.git/hooks/pre-push` does not exist, write it with the content below and make it executable (`chmod +x`). If a pre-push hook already exists, leave it, tell the student, and rely on the rules here.

   ```sh
   #!/bin/sh
   # Take-home labs are individual and local: never push them to origin, the
   # group's repository, or to upstream. Other remotes, such as personal, are allowed.
   case "$1" in origin|upstream) ;; *) exit 0 ;; esac
   case "$(git symbolic-ref --short -q HEAD)" in
     TakeHome/*) echo "pre-push: a take-home branch is checked out; nothing goes to $1" >&2; exit 1 ;;
   esac
   tips=$(git for-each-ref --format='%(objectname)' 'refs/heads/TakeHome/')
   while read local_ref local_sha remote_ref remote_sha; do
     case "$local_ref $remote_ref" in
       *refs/heads/TakeHome/*) echo "pre-push: take-home branches never go to $1" >&2; exit 1 ;;
     esac
     for t in $tips; do
       [ "$local_sha" = "$t" ] && { echo "pre-push: $local_sha is a take-home tip; it never goes to $1" >&2; exit 1; }
     done
   done
   exit 0
   ```

5. Fill the roster with the student alone, `group: none`, one author from `Me:`, one AI disclosure bullet, and commit. Do not push.
6. Show `git branch --show-current` and the first twenty lines of `README.md`, then follow the branch's instructions: the README's agent comment holds this lab's own steps, such as asking where the student's Lab 0 pictures are, and this file's rules still apply.

## Course updates

The course repository changes after a lab is out: a starter fix, a wording change in `README.md`, or a rewrite of a branch's history (on 2026-09-30, `Lab0` to `Lab4` were squashed to one commit each on `welcome`). None of that touches the student's work, and a clone made before a rewrite keeps working; it only needs a merge, never a re-clone. To bring an update in, on the lab branch with `git status --porcelain` empty:

On a take-home lab the branch is the local `TakeHome/LabN` and the source is `upstream/TakeHome/LabN` in place of `upstream/LabN`: fetch it with `git fetch upstream TakeHome/LabN`, merge it, and skip step 5's push; nothing is pulled, merged or pushed with `origin`.

1. `git fetch upstream`.
2. `git merge -X ours upstream/LabN`. Do not rebase, reset or re-clone: a merge keeps every student commit, and it works after a history rewrite because both sides descend from `welcome`. `-X ours` settles the files both sides changed, such as `report.typ`, in the student's favour while still taking every file only upstream changed; after the 2026-09-30 rewrite this merges cleanly and adds one merge commit.
3. If git still reports conflicts, resolve them file by file. Course files, `README.md`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, anything under `docs/`, and starter code the student never edited: take upstream's version, `git checkout --theirs <file>`. The student's files, `report.typ`, result images and code the student changed: keep the student's version, `git checkout --ours <file>`, and carry an upstream fix over by hand only when the student needs it. Then `git add` the files and `git commit` with the default merge message. A conflict in the AI disclosure keeps each member's own latest bullet.
4. If `git merge` refuses with "refusing to merge unrelated histories", add `--allow-unrelated-histories` and resolve as above.
5. Say in one line what came in. Push to `origin` after "Before any push" so teammates get the same update; they then `git pull --ff-only` as usual.

Never run `git pull` against `upstream`, and never force-push an update.

## Hard rules

- Never fork the course repository, run `gh repo fork`, suggest the Fork button, create a public repository, or make a repository public.
- Never push anywhere but `origin`, or `personal` on request, and never when "Before any push" fails.
- Never `git reset --hard`, `git clean`, `git push --force`, or delete a branch. If the student insists, name exactly what will be lost and get a yes.
- Never commit `.venv/`, `GROUP.md`, PDFs, raw datasets or model weights. Result images the report shows are committed, each under 5 MB. Never `git add -f`.
- No `Co-Authored-By` lines or agent signatures in commits.
- Never fabricate a result. Run the script; if it fails, report that. A number not produced by code in this repository does not enter the PDF.
- A section marked `// manual` in `report.typ` is the student's own words: insert verbatim, fix typos only, never draft. If missing, leave `#todo[To be written by the student.]` and say so.
- In AI disclosure, edit only the bullet of `Me:`. The group confirms the final text at submission.
- Do not modify `README.md`, this file, or anything under `docs/`. They are course files.

## Building the PDF

Follow `docs/SUBMISSION.md` exactly.

## Environment

- Python 3.10 or newer in `.venv` at the repository root, created with `python3 -m venv`. pip only, no uv, conda or poetry.
- typst 0.12 or newer, installed system-wide. Check `typst --version` before compiling.
- No GPU. Everything runs on CPU in minutes.
