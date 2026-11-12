# Contract for the post-checkpoint work packages

This is the threshold handoff contract. Ready scopes activate with the parent
claim-release comment in issue26. G04/G06 have prerequisites and F01 is reserved.
A package document is not a lock. Read the live issue, linked PRs and
all claims before starting, and recheck after posting the claim required by your
instructions. Coordinator: @hairer. Source revision:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## One author and a separate reviewer

Each C package is one bounded author session over a coherent group of existing
chapters. Audit its incoming interfaces, complete genuine missing arguments
within that scope, correct errors and improve definitions/explanations. Do not
replace a missing proof by a new assumption. Report upstream draft dependencies
precisely. If a new producer needs a different chapter, propose a disjoint split
with exact scope and await its live allocation; do not duplicate canonical work.
An overlarge package may be split at a mathematical interface before work, with
updated issue ownership and disjoint output paths.

After author handoff, a different agent claims the review phase of that package.
The reviewer owns only `results/Cnn/review/`; the author owns the assigned prose
and the other report files. Review mathematics and Lean correspondence separately,
even if one qualified reviewer performs both. Record final content hashes and
source anchors. Every substantial correction returns to authoring and then renewed
review; no self-approval or updating another reviewer's approval. Existing bounded
passes can be carried only after checking their exact scope and unchanged hashes.
They do not prove dependency closure. Human acceptance remains separate.

All C packages can begin their own audits in parallel. Edits are disjoint, but
mathematical completion may wait for another package. No group is presumed to
have no incoming dependencies merely because it is early in the current PDF.
Track dependencies at theorem/output level: C16, for example, contains both
an early public-run constructor and the final assembly. Opposite edges between
two packages are not by themselves a circular proof; a cycle between the actual
mathematical premises and conclusions is.

## Required input/output ledger

Give every cross-package dependency a stable edge ID, such as C14-to-C16-stress-normalization. Both producer and consumer acknowledge the exact statement and common-data match in their ledgers; unresolved edges remain visible until both sides and the independent reviewer agree.

For each substantive theorem or coherent proof group record:

- Output statement, label and exact hypotheses/quantifiers.
- Every incoming mathematical premise, its producer label/reference and current
  proof/review status. Definitions and reader prerequisites are identified as such.
- Exact common objects: family/history, scale and extraction filter, field quotient,
  operator, stress normalization, coordinate/grade conventions and choice order.
- Pinned fully qualified Lean declarations and paths, after reading their exact
  types, definitions/instances and relevant immediate dependencies.
- Detailed explanation of the match, or a concrete discrepancy/missing proof.
- Final SHA-256 values, actual commands/results, and independent review findings.

Do not substitute a theorem name, clean axiom report, checklist, or proof outline
for mathematical justification. A missing literature match is neither a novelty
claim nor permission to omit a step. Reuse the canonical exposition and shared
literature notes, then make only a focused search in original sources. Prove the
application and every additional variant. Keep implementation details and audit
records in the blueprint, not the monograph.

## Writing and editorial ownership

Use conventional mathematical language. Introduce each symbol and concept before
use; give the mathematical reason for each substantive step and show estimates
with their actual uniformity. Follow the Lean argument's main steps. Once G05
supplies the notation/order contract, each C author applies the agreed local
notation and explanatory edits in its own files, then obtains renewed independent
review. Report any proposed change to a shared definition rather than changing
another group's chapter. G04 owns the outline; G03 the reference audit; G05 the
symbolic index/order contract. F01 alone applies shared includes/preamble/PDF
updates after the user's later instruction.

## Validation and submission

Follow templates/proof-unit for new substantive proof units and keep their
machine-readable source/claim/review record with the prose correspondence. Existing
canonical YM-000026 chapters stay in that unit; do not rename or duplicate it.
Put revision ledgers in your assigned results directory and provide the exact
metadata additions for the eventual integrator. Machine-readable approvals remain
unset until the applicable independent review process accepts the final content.

Run `python3 scripts/check_blueprint.py` for blueprint changes and `git diff --check`.
When changing mathematical LaTeX, build a local wrapper containing your changed
chapters and their referenced canonical inputs; inspect the changed rendered
pages. Audit-only reports do not require an artificial LaTeX wrapper. Record actual commands and
failures; label unrun checks as unrun. Do not rebuild the entire Lean tree or replay
axioms per package. Preserve Lean, the pinned toolchain and dependencies. Reuse the
source evidence and #37's separate clean-build work with their exact limitations.

Push one focused draft PR against the checkpoint branch, reference your issue and
#26, and leave a concise handoff with proven results, outstanding external inputs,
review hashes and next steps. No merge, relicensing or publication. Do not modify
another contributor's credentials or release their claim. Work in a separate
clone/worktree and use a unique session identifier.

## Completion gate

All package labels being checked is insufficient. G06 must test the union of the
ledgers for unproved substantive premises, mismatched common data, cycles and
unsupported citations. External #33/#34 outputs and canonical22 review response
must be integrated at their checked versions. Any failure creates an explicit
bounded repair with an owner. F01 is reserved for the maintainer's later request;
completion of a package does not authorize the stopped parent to resume.

After F01, G06 (or a new independent reviewer) must sign off on the final semantic
diff and exact content hashes. F01 may apply reviewed patches and checked editorial
changes, but any substantive assembly rewrite, renaming or changed mathematical
claim needs renewed independent mathematics/source review. The integrator never
refreshes another reviewer’s approval itself.

Read [newly merged shared evidence](upstream-evidence.md), including the
OS, Gaussian/nonlinear/rank interface, Balaban and running-coupling review notes.
These upstream inputs may be newer than the frozen branch; preserve their ownership.
