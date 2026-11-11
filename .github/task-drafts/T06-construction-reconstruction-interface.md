# [Task] Audit the construction-to-reconstruction interfaces PU-15--PU-19

**Suggested labels:** `kind:audit`, `status:blocked`, `priority:critical`

## Task kind

Audit.

## Proposed coordinator

`@hairer` (must be confirmed by a maintainer when this issue is published).

## Mathematical interface and source scope

At source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, fix the exact
mathematical handoffs among provisional PU-15 (construction run/UV rate), PU-16
(infinite-volume subsequence and Euclidean axioms), PU-17 (phase decomposition),
PU-18 (OS reconstruction), and PU-19 (phasewise reconstruction).

Begin from `YangMills.constructed`, `YM.Nonperturbative.existence`,
`YM.Nonperturbative.continuum`, and
`YM.Nonperturbative.continuum_with_position_tests`, using T03's cluster links to
navigate to the bounded declaration neighbourhoods. Preserve quantifier order,
especially the relationship between requested volume sequences and selected
refinements/subsequences.

## Expository treatment and literature search

This is an interface audit, not a proof translation. For each handoff, identify the
mathematical data, hypotheses, and conclusion that a later proof unit may rely on.
Classify internal declarations as substantive proof obligations, applications of a
verified standard theorem, formal scaffolding, or unresolved. Apply T05's OS
checklist without claiming hypotheses that have not been located in the source.

## Owned outputs and exclusions

- Create `blueprint/interfaces/construction-to-reconstruction.md` with one section
  per handoff, including exact formal declarations and paths, mathematical
  statement, quantifier order, direct formal inputs, proposed expository inputs,
  and open questions.
- Update only the PU-15--PU-19 rows and dependencies in `blueprint/unit-plan.md` if
  the audit proves a correction is needed.
- Do not write the detailed proofs, inspect the nonlinear RG internals PU-08--PU-12,
  or create canonical unit directories.

## Prerequisites and overlap search

Blocked until [#3](https://github.com/hairer/humanise-yang-mills/issues/3)
(public-statement audit),
[#4](https://github.com/hairer/humanise-yang-mills/issues/4) (external-map
synchronisation), and
[#6](https://github.com/hairer/humanise-yang-mills/issues/6) (OS reconstruction
literature) are accepted.

Before posting a self-claim, search live issues/PRs and unit metadata for ownership of
the same declarations or shared outline rows.

## Acceptance criteria

- Each of the five provisional units has a bounded declaration set or a precisely
  stated unresolved boundary question.
- Every edge in the proposed PU-15--PU-19 expository graph records the actual data
  passed, hypotheses needed, and quantifier order; implementation imports are not
  mistaken for mathematical dependence.
- Euclidean axioms, phase assumptions, reconstruction hypotheses, and conclusions
  are individually located and compared with T05's checklist.
- The audit states whether PU-18 and PU-19 should remain separate and why.
- Formal scaffolding proposed for omission is grouped by mathematical purpose and
  supported by inspected examples.
- Inspection commands/evidence are recorded, and an independent
  Lean-correspondence reviewer checks the result.

