# Initial task wave: publication checklist

T01--T05 have been published as ready GitHub issues. The remaining files are
issue-ready drafts for the next coordinated work wave; they are not claimable
tasks. Publish a draft as a GitHub issue with precise scope and satisfied
prerequisites before self-claiming it under
[`docs/coordination.md`](../../docs/coordination.md). No manual grant is required.

The `T06`--`T08` labels below are temporary publishing references, not proof-unit
IDs. For an explanation issue, the issue number determines the canonical
`YM-<six-digit issue number>` directory. GitHub issues, rather than this directory,
are the authoritative records for T01--T05.

## Before inviting public claims

1. Name a contact for scope questions and independent review in each issue;
   contributors post and check their own claims.
2. Check the live repository for overlapping issues and PRs, create the documented
   task/status labels if absent, and enable branch protection before accepting
   contributions. A code of conduct is also advisable before broad public outreach.
   If equivalent labels already exist under different names, use those rather than
   creating duplicates; the labels in the drafts are suggestions.
3. Publish the drafts in order, replace every `Txx` dependency with the resulting
   issue link, and remove or replace the local draft with that link so GitHub stays
   the sole live task record.

The root project material is licensed under CC BY 4.0; `Lean/` retains its separate
upstream licence. The build, statement, map, and literature tasks below form the
initial live ready queue.

## Proposed queue

| Draft | Kind | Publish as | Purpose |
| --- | --- | --- | --- |
| [T01 / #2](https://github.com/hairer/humanise-yang-mills/issues/2) | audit | ready | Reproduce the pinned build, usage inventories, and axiom reports |
| [T02 / #3](https://github.com/hairer/humanise-yang-mills/issues/3) | audit | ready | Record the exact scope of all 17 release roots |
| [T03 / #4](https://github.com/hairer/humanise-yang-mills/issues/4) | map | ready | Reconcile the blueprint with Scott Armstrong's source map |
| [T04 / #5](https://github.com/hairer/humanise-yang-mills/issues/5) | literature | ready | Find and verify a citable SU(2) simplicity result |
| [T05 / #6](https://github.com/hairer/humanise-yang-mills/issues/6) | literature | ready | Build a precise Osterwalder--Schrader reference checklist |
| [T06](T06-construction-reconstruction-interface.md) | audit | blocked on #3, #4, #6 | Fix the PU-15--PU-19 mathematical interfaces |
| [T07](T07-su2-pilot-proof-unit.md) | explain | blocked on #2, #3, #5 | Calibrate a small citation-heavy proof unit |
| [T08 / #22](https://github.com/hairer/humanise-yang-mills/issues/22) | explain | draft submitted | Canonical running-coefficient unit YM-000022 |

Do not yet distribute the large nonlinear RG packages PU-08--PU-12. Their claimable
boundaries depend on T06 and on lessons from the two pilot units. When a pilot draft
is complete, create separate `review-lean` and `review-math` issues rather than
putting review inside the author's claim.

