# Issue 318: selected-step reprise and one Music

Session: `hairer-codex-318-reprise-20261115`.
Claim: https://github.com/hairer/humanise-yang-mills/issues/318#issuecomment-6899730361
Base selected manuscript blob: `ff427cabe9b205cc3f2b54bc8b1e5316701f9fd2`, merged PR #457.
Status: draft; human acceptance and independent review remain required.

## Scope and dependency boundary

The authoritative proof is in `manuscript/existence/selected-centered-service.tex`:
`lem:selected-coefficient-merger`, `lem:selected-coupon-merger`,
`prop:selected-reprise`, and the strengthened `prop:selected-music`.
The proof sums the component comparisons with their separate input and output
prices, derives nonvanishing of the actual stored evaluation, verifies the
selected ticket, and invokes the existing finite linear interpolation and cone
proof to obtain the one lower voice, its profile and Carol. Finite backward
induction uses exactly the terminal marked voice already constructed here.

The regular remainder definition is clarified to require the full ordered
left-derivative bound in spatially weighted directions, not just a value bound.
This is essential for applying the regular insertion ticket and agrees with
`BudgetPoint.supBounds`. The zeroth-order part supplies masked-series domination.
No new analytic purchase theorem is asserted. The result remains relative to
the common funded-history and observable-purchase interfaces of this section,
including the local primary, regular, and forced producers. No Lean, shared
ledger, or other manuscript file is changed.

## Source correspondence

Pinned source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` as recorded
in `source/README.md`. The upstream commit object was absent locally. Readers
verified the inspected files against `Lean/SOURCES.sha256`; no Lean elaboration
was run. Paths below are relative to `Lean/YM/`.

| Mathematical step | Fully qualified declarations | Source path |
| --- | --- | --- |
| Coefficient sum and prices | `YM.Extra.Histories.merge`, `YM.Extra.Histories.merge_format`, `YM.Extra.Histories.merge_budget`, `YM.Extra.Histories.merge_density` | `Extra/SOURCE_HISTORIES/Merge.lean` |
| Regularity and true derivative majorants | `YM.Source.Coefficient.Format`, `YM.Source.Coefficient.remBound`; `YM.RG.BudgetPoint.Regular`, `YM.RG.BudgetPoint.supBounds` | `Source/Insertion.lean`; `RG/Masks.lean` |
| Coupon addition and lead summability | `YM.MergeProof.coupons`, `YM.MergeProof.Gig.all_in`, `YM.MergeProof.Coupon.weaken` | `MergeProof/Sonata.lean` |
| Two-cost witness | `YM.MergeProof.Odyssey`, `YM.MergeProof.SoundDoor` | `MergeProof/Gallery.lean` |
| Countable Tale | `YM.MergeProof.Tale.upon`; `YM.MergeProof.profile_shop`, `YM.MergeProof.perform`, `YM.MergeProof.stackFee`, `YM.MergeProof.hook_charge` | `MergeProof/Memo.lean`; `MergeProof/Orchestra.lean` |
| Whole-column comparison | `YM.MergeProof.single` | `MergeProof/Meringue.lean` |
| Lower voice and response | `YM.MergeProof.repriseQ` | `MergeProof/Renaissance.lean` |
| Entry covariance | `YM.MergeProof.Chorus`, `YM.MergeProof.chanting`, `YM.MergeProof.lyric` | `MergeProof/Jubilee.lean` |
| Positive stored evaluation | `YM.Extra.Histories.Tour.bright_kernel`, `YM.Extra.Histories.Tour.bright`; `YM.RG.History.Selected`; `YM.RG.StepData.noise`, `YM.RG.StepData.chosen` | `Extra/SOURCE_HISTORIES/Offsets.lean`; `RG/History.lean`; `RG/Block.lean` |
| Ticket and finite downward induction | `YM.MergeProof.Tune`, `YM.MergeProof.Carol`, `YM.MergeProof.compose` | `MergeProof/Largo.lean` |
| Heard clauses | `YM.Extra.Histories.Voice`, `YM.Extra.Histories.Heard`, `YM.Extra.Histories.Responds` | `Extra/SOURCE_HISTORIES/Replay.lean` |
| Paid cone | `YM.Work.G08.cone_step` | `Work/G08.lean` |

Two user-authorized Luna source readers, sessions `reprise_source` and
`coupon_source`, worked in separate clones. They supplied definition-level
reports and checksum verification. The author wrote the mathematical prose.
An additional independent reviewer audited the prose and dependency application.
The shared literature notes were searched; the new summations use elementary
absolute convergence, Tonelli, dominated convergence, and finite-dimensional
linear algebra. No additional external theorem is required.

## Validation

- `python3 scripts/check_blueprint.py`: passed (structure only).
- `git diff --check`: passed.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build-318 existence.tex`:
  passed, 1123 pages; no undefined references at stable pass.
- Rendered and inspected pages 728–732 with PDFKit: readable equations and text.
- Lean build: not run; imported source was not changed.

Final manuscript SHA-256:
`337ad96e0ca4880e4e1d887193610dbbc9ae3b10a83f0bd820190d9c6edd8d25`.
Git blob: `5035adc0861de7e3fe981ae74afb29e432186b85`.
The final corrected text was rebuilt successfully with the same command;
1123 pages and no undefined or multiply-defined references. Final response-sum
pages were rendered again and inspected. One attempted build from the repository
root failed because `existence.tex` is in `manuscript/`; the corrected command
above passed.

## Independent mathematical review

Reviewer session `/root/audit457_inputs`, separate clone
`/tmp/ym318-independent-review`, returned PASS at the final SHA-256 above.
Reviewed the coefficient and two-cost Tale mergers, reprise, removal of (RS)
from Music, and applications of local splitting, three-port estimates, finite
interpolation and stored-service budgets. The reviewer identified the derivative
norm and supportwise-response issues described above, then rechecked their fixes.
Actual lead summability is separate from remainder summability; the forced
normalizations, both Tale costs, fixed finite wing, coefficient linearity,
unit and room/bank calculations passed the final review.

This is a scoped agent-assisted review, not human acceptance or a promotion of
the whole unit to reviewed status. The reviewer did not independently build or
run Lean, and did not re-establish the underlying local analytic producers.
Source facts on positivity and soundness were supplied by the dedicated source
readers and their use in the prose was reviewed.
