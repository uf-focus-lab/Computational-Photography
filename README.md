# Computational Photography Labs

This is a template repository to kick-start in-class labs: it gives your group a private workspace, an AI agent that knows the course rules, and a report that builds itself.

Use of this repo is elective. Every Canvas assignment page also carries the lab handout, a Word report template and, where there is starter code, a MATLAB version, so your group can do any lab the conventional way and hand in the same PDF.

## Agentic setup

> [!CAUTION]
> This section is written for **AI agents**. If you are a human, stop here and point your AI to this page. You may follow the [manual setup](#manual-setup) instructions if you prefer to set it up yourself.

Agent: work through these steps in order. Ask only what a step tells you to ask, and never fork the course repository or make anything public.

1. **Run `git --version` silently.** If it prints a version, continue without comment. If the shell works but git is missing, offer to install it, `xcode-select --install` on macOS, `winget install Git.Git` on Windows, or the distribution's package manager on Linux, and ask before installing. The shell must be on the student's own computer. If you cannot execute commands at all, or you are running in a hosted sandbox or cloud workspace such as Codex cloud, Claude Code on the web, or a Codespace, stop here: tell the student this setup needs a CLI coding agent in a terminal on their own machine, such as Claude Code, Codex CLI or Gemini CLI, and that pasting the same prompt there is all they have to do. Signs of a sandbox: running as root in a container, a home directory that is not the student's, no persistent disk. If unsure, ask the student whether this terminal is on their own computer. Do not describe, simulate or narrate the steps below, and do not ask the student to run commands on your behalf.

2. **Ask two things in one message.** First, how the student wants to collaborate, three options: solo; first in my group, I will host the group repository; or joining my group's repository, in which case ask for its URL. Second, which folder to clone into. If they have no preference, suggest `~/Projects/comp-photo` on macOS and Linux or `%USERPROFILE%\Projects\comp-photo` on Windows, and create it. Read both answers back and get an explicit yes before running any command.

3. **Clone into the chosen folder.**
   - Solo or hosting: `git clone https://github.com/uf-focus-lab/Computational-Photography.git`, enter it, `git remote rename origin upstream`. Then create their private repository. With `gh`: `gh repo create comp-photo-labs --private --source=. --remote=origin --push`. Without it, ask them to create an empty private repository on github.com and paste its URL, then `git remote add origin <url>` and `git push -u origin welcome`. If hosting, tell them to add each teammate under the repository's Settings, Collaborators, and to send teammates the URL.
   - Joining: `git clone <url>`, enter it, then `git remote add upstream https://github.com/uf-focus-lab/Computational-Photography.git`.
   - Confirm with `git remote -v` that `origin` is private and `upstream` is the course repository. Never push to `upstream`.

4. **Environment.** `python3 --version` must be 3.10 or newer and `typst --version` 0.12 or newer. If typst is missing, offer to install it with `brew install typst`, `winget install Typst.Typst`, or `cargo install typst-cli`, and ask before installing. Then `python3 -m venv .venv` and install `requirements.txt` with the venv's pip.

5. **Hand over to `AGENTS.md`** in the clone and follow it from now on. Run its onboarding, which records the group in `GROUP.md`; it already knows the collaboration choice from step 2, so do not ask again. Finish by starting Lab 0 as `AGENTS.md` describes, and tell the student in three lines what was set up and where their work will be pushed.

## Manual setup

Requirements: git, Python 3.10 or newer, typst 0.12 or newer. Install typst with `brew install typst`, `winget install Typst.Typst`, or `cargo install typst-cli`.

First in your group, or working solo:

```sh
git clone https://github.com/uf-focus-lab/Computational-Photography.git
cd Computational-Photography
git remote rename origin upstream
gh repo create comp-photo-labs --private --source=. --remote=origin --push
# Without gh: create an empty private repository on github.com, then
#   git remote add origin git@github.com:<you>/comp-photo-labs.git
#   git push -u origin welcome
```

Add teammates under the repository's Settings, Collaborators.

Joining a repository a teammate already created:

```sh
git clone git@github.com:<teammate>/comp-photo-labs.git
cd comp-photo-labs
git remote add upstream https://github.com/uf-focus-lab/Computational-Photography.git
```

Then, in either case:

```sh
python3 -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

Create `GROUP.md` at the root. Git ignores it.

```markdown
# Group 7

Me: Ada Lovelace
Repository: git@github.com:ada/comp-photo-labs.git

| Name         | UF email       |
| ------------ | -------------- |
| Ada Lovelace | ada@ufl.edu    |
| Alan Turing  | turing@ufl.edu |
```

Each lab: `git fetch upstream`, `git switch -c Lab1 upstream/Lab1`, `git push -u origin Lab1`, do the work described in `README.md`, build `LabXX.pdf` following `docs/SUBMISSION.md`, and upload it to Canvas. Pull before you start each day and push when you stop.
