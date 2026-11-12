# Prompt for a contributing agent

Give different agents different task numbers: **33** and **34** are the first
two disjoint tasks. Read their live discussions before assigning them. Replace
the bracketed fields, and authenticate with the contributing human's account;
never put credentials in the prompt.

```text
Help complete the Lean-based Yang–Mills monograph in
https://github.com/hairer/humanise-yang-mills.

Your task is issue [33 OR 34]. Your unique session is [SESSION].
Your time/compute budget is [BUDGET]. Use the collaborative checkpoint on
codex/existence-monograph, not an older main-branch draft. Record the exact
checkpoint commit you use. Work in your own clone/worktree and branch.

First read AGENTS.md, CONTRIBUTING.md, docs/coordination.md,
docs/proof-standard.md, and blueprint/units/YM-000026/CHECKPOINT.md.
Read the task issue, all its comments, linked PRs, and relevant evidence notes.
Check for overlapping live work. Follow the applicable claim protocol, including
any coordinator confirmation required by your instructions, and recheck the live
issue before starting. I authorize task-related GitHub claim, progress, question
and handoff comments, pushing your branch, and opening a draft PR under my
authenticated account. Do not merge or publish results.

Follow the pinned Lean argument in its main mathematical steps. The source pin is
3456e5e75cf8d4cd558955a5c7638fba2d68f464. Start from the declarations named in your
issue, inspect their exact definitions/instances and immediate dependencies, and
expand only as needed. Do not infer a statement from its name or read the entire
Lean tree. Preserve Lean/, the pinned toolchain, and dependencies.

Write a detailed, readable mathematical proof in the issue's owned LaTeX file.
Introduce notation before use, state exact hypotheses and quantifiers, and explain
the substantive estimates and how they combine. Reuse existing proof units.
Search shared literature notes and make a focused search of relevant original
sources; use precise references only after checking their statements and
hypotheses. Do not spend a large budget searching for an optional shortcut.
Keep Lean implementation details out of the exposition; put fully qualified
declarations, source paths/revision and source correspondence in the blueprint.

Your task must establish its assigned conclusion, not replace it by a new
assumption. Legitimate upstream inputs may remain explicit draft dependencies:
identify their exact statements, where they are supplied, and anything still
unproved. Never invent a proof to bridge a source gap. Preserve the actual common
family/history, normalization, parameter order and order of limits. Do not claim
the entire existence argument is complete from a local conditional result.

Own only the output paths in your issue, including its new proof-unit record from
templates/proof-unit/. Do not edit the main existence.tex, YM-000026 metadata or
review logs, shared glossary/outline, or another agent's chapters. Parent handles
integration. If a new gap lies outside scope, report it and propose a bounded
follow-up instead of taking over another task.

Run python3 scripts/check_blueprint.py and git diff --check. Build an appropriate
local LaTeX wrapper and inspect the changed rendered pages. Record actual commands
and results; mark unrun Lean/axiom checks as unrun. Request independent Lean
correspondence and mathematical review; do not approve your own prose or refresh
someone else's review fingerprint. If using subagents, give them disjoint outputs
in isolated worktrees and reserve a more capable independent reviewer for the
completed draft, within the stated budget.

Push one focused draft PR targeting codex/existence-monograph, referencing your
task and #26. Leave a concise issue handoff: what is proved, exact source anchors,
remaining inputs/gaps, checks actually run, and the next integration step. All
prose remains draft until independent acceptance. If budget or claim expires,
preserve the useful work and hand it off rather than implying completion.
```
