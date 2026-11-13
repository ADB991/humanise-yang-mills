# Bounded mathematical review of C05 source-leakage rows 245–246

- Task: [#185](https://github.com/hairer/humanise-yang-mills/issues/185), [PR #204](https://github.com/hairer/humanise-yang-mills/pull/204).
- Exact reviewed author revision: `e6ff008151e491923e97465c1ae24582f219c25f` (parent `2017d6f3ee648beb054322e9b994eb3c757cbcf6`). File SHA-256 values: `reviewed-files.sha256` beside this report.
- Session: `mgubi-astra-c05-leakage-review-20261113`; [claim](https://github.com/hairer/humanise-yang-mills/issues/185#issuecomment-6860828125), expiry 2026-11-13 21:00 UTC.
- Independent OpenAI Codex Astra subagent under @mgubi, distinct from the target author @TrishenGunaratnam. Agent review only; responsible human acceptance is **unset**.
- Scope: the two changed manuscript passages and their new author correspondence, with immediate interfaces only. This is not renewed approval of the fourteen-chapter package or PR #180.

## Verdict

No required mathematical change found in rows 245–246. The rewrite is locally sound, conditional on the already stated analytic inputs. It neither proves those inputs nor closes the package's incoming edges.

## Findings

**Row 245 — same limit and same refinement preserved.** `ope-grid.tex`, following `input:ope-match`, now expressly places the construction under `prop:ope-match-assembly`. That proposition fixes the cluster, degree and intermediate levels, obtains finite-cutoff labels with both discrepancy price and quota bound, and extracts one limit for each outer index. In `ope-cutoff.tex`, “Keeping the match in the continuum limit,” the quota first bounds the finite-dimensional reference norm at the fixed matching level. Compactness supplies a nontrivial finer filter; eventual assertions already valid on the ordered cutoff tail remain valid on this finer filter. This does not assert that compactness alone supplies the discrepancy estimate, or that a cutoff-dependent quota is a continuous function of the limit. The subsequent phase and filtration inputs provide the continuum discrepancy and distances. The changed sentence correctly preserves this distinction in its surrounding context.

The filter refinement may depend on the fixed outer index and matching data. The passage does not claim one common refinement for all outer indices, nor convergence along the full original cutoff filter. The one limiting label is retained for the spectator tests and low-degree conclusions. The further extraction used for a comparison label in the filtration step does not change that limiting label. No rate, degree threshold or channel estimate is edited.

**Row 246 — quantifier strength preserved.** `input:ope-raw-estimates` still fixes the label lists, radius constant M, positive cluster separation parameter and positive exterior clearance c, while allowing the center, all configurations and the phase or mixed-state choice to vary with the sequence. The rewritten paragraph explicitly retains this moving-data assertion at fixed c. It does not replace c by a sequence tending to zero. It also retains the warning that bounds only for individual fixed configurations are insufficient. Universality over moving choices permits the usual bad-choice sequence test for eventual uniformity at fixed geometric parameters; dependence on the fixed label lists, truncation degree, constants and exponent slack remains allowed.

The deleted observation about more general logarithmic exterior scales is now accurately confined to the author correspondence. It is not needed as a new hypothesis or conclusion of the fixed-clearance manuscript input. The rate definition, raw coefficient rate w minus output degree, discrepancy rate w minus D minus one, and zero-rate separated insertion remain unchanged. Raw and homogeneous constructions are still separated by the chapter's transfer argument.

## Limits and acceptance

The ledger's matching, analytic supplier, phase, derivative-identity and mixed-covariance/O(4) obligations remain conditional. Their production was not reviewed here. No full C05 proof review, external literature theorem verification, fresh Lean elaboration, axiom audit or independent rendering was performed. Shared literature notes were searched for this bounded interface; no new literature invocation or new proof was introduced by these two edits. The author's build evidence is recorded as author evidence, not an independently reproduced build.

This report recommends accepting the two edits locally, conditional on the stated inputs. It does not set unit status to `reviewed`, refresh prior review fingerprints, or record human acceptance.
