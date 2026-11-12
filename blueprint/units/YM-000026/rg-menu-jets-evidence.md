# Single-menu derivative evidence

- Unit: YM-000026, lattice existence construction.
- Status: draft; independent correspondence and mathematical review pending.
- Imported Lean source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` from `source/upstream.json`.
- Manuscript: `manuscript/existence/rg-menu-jets.tex`.
- The chapter proves the per-menu singleton jet used by the selected canopy assembly, conditional only on the selected paid response model and its exact empty/singleton interpolation identities. The public route supplies those from the ordinary one-step construction.

## Source correspondence

| Mathematical step | Fully qualified declaration | Path | Checked correspondence |
| --- | --- | --- | --- |
| Public consumer of the jet | `YM.PhysicalNext.Repeat.Mallow.Many.ripe` | `Lean/YM/MergeProof/Tanger.lean` | Builds the selected door and response code, obtains the selected paid rows, and passes the per-menu jet receipt into `YM.Merge.Photo.shade`. |
| Actual per-menu jet | `YM.PhysicalNext.Repeat.Mallow.Many.live` | `Lean/YM/MergeProof/Mirrored.lean` | For each menu index, activity index and configuration, derives the limit of the singleton switch score as the tuning coefficient times the derivative of the one-leaf final response. It uses the paid score model from the bought gas receipt. |
| Empty-switch identity | `YM.PhysicalNext.Repeat.Mallow.Many.v0` | `Lean/YM/MergeProof/Mirrored.lean` | The marked response with empty menu set is the vacuum single-leaf response. |
| Singleton-switch identity | `YM.PhysicalNext.Repeat.Mallow.Many.v1` | `Lean/YM/MergeProof/Mirrored.lean` | The marked response at `{i}` is the one-leaf response at amplitude `rA i * t`. |
| Differentiability of one-leaf path | `YM.Merge.Joins.loner` via `YM.Merge.Joins.scenery` and `YM.Merge.Joins.in_final` | `Lean/YM/MergeProof/Mirrored.lean`; `Lean/YM/MergeProof/Silo.lean` | The single-leaf path is joined to a singleton family; final products preserve differentiability and the derivative identity. `YM.Merge.Grouped.galaxy`, `.flame`, and `.verses` give the underlying product-rule calculations in `Lean/YM/MergeProof/Bouquet.lean`. |
| Door hinge is the derivative | `YM.PhysicalNext.Repeat.Mallow.sandboxK` | `Lean/YM/MergeProof/Coffer.lean` | Defines the selected door hinge as the derivative of the same pupil final response used by `live`. |
| Fee equals tuning coefficient | `YM.Merge.Photo.bidding` | `Lean/YM/MergeProof/Tinder.lean` | The selected plot assigns rate `sumFee` to each selected leaf, which is the corresponding `rA i` in the selected profile. |
| Paid score model | `YM.Merge.Switch.Paid.works`; `YM.Merge.Switch.Models.exact` | `Lean/YM/MergeProof/Switch.lean` | A paid code has a model; its limiting score is the jet at parameter zero. The triangular evaluation map for positive parameter is injective by induction on subsets. |
| Canopy uses jet | `YM.Merge.Photo.shade` | `Lean/YM/MergeProof/Shaded.lean` | Consumes this exact jet to identify singleton box coefficients after applying fee-times-normalized-menu equals charged menu. |

## Proof notes

1. For any finite set of switches, the evaluation equation is triangular in subset size. If all scores on proper subsets are known, the value at `F` determines the score on `F` after division by `t^|F|`; this is valid for every `t>0`.
2. The empty and singleton interpolation equations reduce the first-order quotient to `(P_i(r_i t)-P_i(0))/t`. Differentiability gives the limit without a finite-difference remainder assumption.
3. The formal `Grouped` calculus keeps the derivative under finite component products using Leibniz; the manuscript states that ordinary product rule explicitly. The infinite support receipts are used only to provide the paid score majorant and the summable downstream hinge ledger, not to exchange this one-menu derivative with an unbounded sum.
4. The exact singleton equality is `Switch.jet (fun t p => pupilK ... t p j U) {i} = rA i * tonic (pupil ... M_i) j U`. The selected door hinge is the same derivative, and bidding sets `rA i = sumFee(q_i,r)`.

## Commands actually run

- `rg -n 'lemma live|lemma v0|lemma v1|lemma loner|def sandboxK|lemma bidding|def pupilK' Lean/YM/MergeProof -g '*.lean'` — located the actual jet chain.
- `sed -n` reads of `Lean/YM/MergeProof/{Mirrored,Silo,Bouquet,Coffer,Tinder,Signed,Stage,Shaded,Switch}.lean` — checked the interpolation identities, product-rule path, selected door, fee assignment and consumer.
- No Lean build, manuscript compile, or repository-wide check was run for this new chapter.
