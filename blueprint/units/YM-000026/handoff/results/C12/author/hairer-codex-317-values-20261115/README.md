# Selected input and value prices

Refs #317, #43, #315. Session `hairer-codex-317-values-20261115`.
Claim: https://github.com/hairer/humanise-yang-mills/issues/317#issuecomment-6898639862.
Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Stacked publication base: PR #452, `6b877b6ce628552e2237ec69a1927ab7bc0e0052`.

## Result and dependencies

The new `sec:selected-value-prices` is the only manuscript change. It attaches
the incoming bounds, path/clip identity, radius, threshold and coupling band to
the actual stored representation, including index zero. It then assembles the
forced, logarithmic and warning prices on their original disjoint alphabet,
with full read supports and the actual extra charges. The single rooted bound
uses head exponent a+2 epsilon+delta. The logarithmic price pays both the log
and its exponential minus one. Packet absorption gives exp(-mu P^2/8), and the
two rooted sums imply the reserved tree smallness and mixed-component estimate.
All requests, including b, nu, rate, halo and reserves, precede the schedule;
the common threshold may depend on them.

The canonical proofs remain in `common-funded-history`, `seed-energy`,
`packet-estimates`, `inherited-activity-prices`, `remote-action-jets`,
`itinerary-prices`, `warning-safety`, `gaussian-warnings` and
`mixed-activity-prices`. No new external theorem is invoked. The retained
funded local seed-energy, chart and normalization hypotheses are not removed.

## Source correspondence

Paths below are relative to `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/`;
all listed source files were checked against the pinned checksum manifest.

| Manuscript step | Fully qualified declarations and paths |
| --- | --- |
| Incoming allowances and same representation | `YM.ConnectedActivityE6.Intake`, `incomingE`, `incomingK`, `loopBill`, `Application.intake_at`, `Intake.lean` |
| Stored funding and common purchase | `YM.ConnectedActivityE6.Planning.testing`, `Planning.walls`, `Wall.lean` |
| Original alphabet, supports, lengths, full exponent | `YM.ConnectedActivityE6.footprints`, `lengths`, `rates`, `Target.relative`, `Target.costs`, `OptionCost.lean` |
| Forest-independent original price families | `YM.ConnectedActivityE6.Offer`, `recommends`, `Quotation.lean`; `Coat.roadway`, `Coat.exCharge`, `Coat.farLog`, `Coat.raiseAir`, `Depot.lean` |
| Exact value service | `YM.ConnectedActivityE6.Target.GrantBodies`, `Target.Invoices`, `Target.issue`, `Issue.lean` |
| Rooted component interface | `YM.ConnectedActivityE6.Cash.charged`, `SalesRoot.lean`; manuscript canonical mixed-component bound |

## Remaining mathematical boundary

This proves value estimates uniform in a fixed forced list. It does not sum
unpriced copies or analytic output variants over the fibers of a component.
The differentiated entrance still requires the actual healthy full support and
stock-extension construction. Ordinary/raised precursor and vapor estimates
also remain. No hypothesis of `prop:selected-centered-retention` is removed.

A separate read-only source audit located the next interfaces:
`YM.Merge.Palette.Garden.accrued`, `shrink`, `field` in
`Lean/YM/MergeProof/Garden.lean`, with `Plot` and `Wreath.tune`, and the
`Dreams.lean` paid/hit construction. These require actual graded component
majorants. `YM.Daisy.Charity.awakening` in `Lean/YM/Daisy/Sparks.lean` supplies
the formal differentiated route through `Captain` and `Herd`; the latter's
integrated per-packet derivative bound is additional analytic content.
`Lean/YM/Mallow/Eco.lean` retains amnesty as a separate producer hypothesis.
The canonical `high-degree-cluster-prices` section likewise explicitly assumes
the actual graded majorants. Regrouping a fiberwise sum does not establish its
absolute summability. This is the next substantive proof task, not a consequence
of the scalar smallness calculation here.

## Review and checks

Prepared by Codex for Martin Hairer. A user-authorized GPT-6 Luna agent inspected
the source in a separate read-only clone. An independent agent reviewed the new
mathematics and correspondence, then confirmed the explicit threshold dependence.
Final scoped verdict: PASS under the retained local premises, at manuscript
SHA256 `7f3cab7727cce010de0049f1da44b8739711e6c81784b24bad1f606271195fce`.
This is scoped agent evidence; the text remains draft and no old review is refreshed.

- `python3 scripts/check_blueprint.py`: passes (four units).
- `git diff --check`: passes.
- Three successful `pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build-local317 existence.tex` passes from `manuscript/`; final PDF 1109 pages. Final log has no undefined references or changed-label warning. Existing whole-book box warnings remain.
- PDFKit render of pages 711--714 inspected: text and equations legible, no clipping.
- No Lean elaboration, axiom replay, or checker tests (checker unchanged).
- Build snapshot includes all manuscript changes through merged #451 and #452.
  Terminal GitHub DNS remains unavailable; publication uses the GitHub plugin.
