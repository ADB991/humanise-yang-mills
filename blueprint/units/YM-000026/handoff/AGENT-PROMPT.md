# Copyable prompt for one package

Use only after the threshold handoff is released. Assign different package IDs
to different author agents, and a different agent to each independent review.
The live issue is the claim authority. The contributor may narrow the permissions
below; their instructions always govern their account.

```text
Help finish the Lean-based Yang–Mills monograph at
https://github.com/hairer/humanise-yang-mills.

Assigned package: [C01–C16 or G01–G06].
Live task issue: [ISSUE URL from the handoff index].
Role: [AUTHOR or INDEPENDENT REVIEWER].
Session: [unique account-agent-date identifier].
Budget: [your time/compute limit].

Start from the exact released checkpoint on codex/existence-monograph in your own
clone/worktree and branch. Read AGENTS.md, CONTRIBUTING.md, docs/coordination.md,
docs/proof-standard.md, the parent CHECKPOINT.md, and
blueprint/units/YM-000026/handoff/COMMON-CONTRACT.md plus your package document.
Read the live task, all comments, linked PRs and applicable evidence. Check overlap,
obtain the required valid claim, and recheck before substantial work and submission.

I authorize task-related GitHub claims, progress, questions and handoff comments,
pushing your branch and opening one focused draft PR using my authenticated account.
Do not merge, relicense or publish. Never request or expose another person's token.

Follow the pinned Lean proof's main steps, at revision
3456e5e75cf8d4cd558955a5c7638fba2d68f464. Preserve Lean and its dependencies.
Start with the exact source anchors in your package's canonical evidence, definitions
and immediate dependencies. Do not read the whole Lean tree or invent a separate
proof. Reuse canonical proofs and checked literature, with economical searches.

As AUTHOR, audit and complete your assigned arguments in detailed ordinary
mathematical prose. Do not merely translate declaration names or replace missing
proofs by assumptions. Introduce notation/concepts before use; preserve exact
quantifiers, common history, normalizations, grades and order of limits. Record an
input/output ledger linking every substantive premise to its exact producer and
current status. Make only the edits your package owns. Request a bounded split for
a new producer or shared-file change. Use G05's notation/order contract when ready.

As INDEPENDENT REVIEWER, do not author the proof or edit its files. Check both
mathematics and correspondence to exact Lean definitions and source statements.
Check upstream interfaces, not only local algebra. Record precise final hashes,
source anchors, errors and unchecked material in your package's review directory.
Authors cannot review their own work. A prior local pass does not certify the
whole proof; material edits need renewed independent review.

Run the blueprint checker and whitespace check; build and visually inspect changed
LaTeX using a local wrapper. Record commands actually run and their results, including
failures. Do not repeat the whole Lean build or axiom audit; reuse existing evidence
and the separately owned clean-build issue37 with its stated limitations.

Push a focused draft PR against codex/existence-monograph, referencing your task
and #26. Hand off the exact results, final hashes, remaining inputs/gaps, validation
and review needs. Never label the whole proof complete from your local result.
Respect external claims, especially trace issues33/34 and audit37. F01 final
integration is reserved for the maintainer's later request; do not take it over.
```
