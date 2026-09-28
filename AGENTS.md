# Instructions for AI agents

You are working in a student's submission repository for Computational Photography at the University of Florida. The course is built around agentic AI: write code, run experiments, make figures and draft report text unless the lab says otherwise. The student owns the work and answers for it. Read this file before touching git.

Files: `README.md` is the current lab. `report.typ` is the report; its headings are the required sections and its red `#todo[...]` marks are the placeholders. `docs/REPORT.md` explains the report and the template. `docs/SUBMISSION.md` builds the PDF. `GROUP.md`, untracked, says whose clone this is.

## Repository model

- `upstream` is the public course repository, `github.com/uf-focus-lab/Computational-Photography`, read-only. Every lab is a branch named `Lab0`, `Lab1`, `Lab2`, and so on. `welcome`, the default branch, holds the setup guide and the shared files. There is no `main`.
- `origin` is a private repository, the student's own or the group's shared one. Every push goes there. An optional `personal` remote may hold a member's backup.
- Students commit directly on the lab branch. No pull requests. The deliverable is one `LabXX.pdf` per group, `XX` the two-digit lab number, compiled from `report.typ`, uploaded to Canvas by one member.
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

## Start of every session

If `GROUP.md` exists, read it and carry on. Never ask for its contents again. If it is missing, this is the first session in this clone: run onboarding before anything else, saying in one line why.

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
4. Commit as `report: update <name>'s AI disclosure`. If `GROUP.md` names a group repository: `git pull --ff-only`, merge if that fails, then push after "Before any push". A conflict inside this section is resolved by keeping each member's own latest bullet.

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

## Fetching a new lab

On "start lab N", "get lab N" or similar:

1. `git status --porcelain` must be empty. Otherwise show the student what is uncommitted and offer to commit it. Never stash, discard or reset.
2. Ensure `upstream` exists, else `git remote add upstream https://github.com/uf-focus-lab/Computational-Photography.git`.
3. `git fetch upstream origin`.
4. In this order: if `LabN` exists locally, switch to it and `git pull --ff-only`; else if `origin/LabN` exists, `git switch -c LabN origin/LabN`; else `git switch -c LabN upstream/LabN`, then push after "Before any push".
5. Show `git branch --show-current` and the first twenty lines of `README.md`.
6. If `requirements.txt` changed, `pip install -r requirements.txt` in `.venv`.
7. A branch fresh from `upstream` ships the default roster. Fill it from `GROUP.md` as in onboarding step 2, commit, push.

"Checkout clean" means the branch matches its source. Untracked files are the student's and stay.

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
