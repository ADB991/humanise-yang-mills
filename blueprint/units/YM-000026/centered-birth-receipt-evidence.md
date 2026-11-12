# Selected terminal birth and moment receipt: evidence

Status: author draft; independent mathematical and source-correspondence review
pending. Pinned source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Scope

The prose is `manuscript/existence/centered-birth-receipt.tex` and its main
result is `thm:ex-selected-birth-moment`. It records the selected public route
from the terminal census birth polynomial to its finite-volume normalized
mode moments. The exact backward integration and compactness argument are
proved in the manuscript. The selected service, origin geometry, finite
response price, and vacuum denominator estimates remain conditional inputs;
this unit does not call them automatic consequences of the birth identity.

## Source correspondence

| Mathematical assertion | Pinned declarations / paths | Inspection notes |
|---|---|---|
| Terminal observable list and birth polynomial | `YM.MergeProof.Accent.item`, `YM.MergeProof.Accent.birth`, `.boot`; `Lean/YM/MergeProof/Badlands.lean`, `Bungalow.lean` | `item` is a signed-coordinate pull/translation of the selected physical cylinder. `birth` is `(R.eval U)` times the finite polynomial pass of the sum of marker sends. `boot` gives the singleton fire coefficient; general mode extraction follows from the census pass/product identity. |
| Compactness and terminal integrability | `YM.MergeProof.Accent.hatCont`, `YM.MergeProof.Accent.generics`, `YM.MergeProof.Accent.occurs`; `Lean/YM/MergeProof/Glacier.lean` | The representative evaluation is continuous by the selected Wilson start identity and continuity of the bare evaluation. Each pulled/moved observable is continuous by `generics`. Since configuration space is compact, the finite birth polynomial is integrable against prior Haar. The proof does not claim continuity of arbitrary intermediate density fields. |
| Public selected service and birth route | `YM.MergeProof.Geyser.pond`; `YM.MergeProof.Ponds.past`; `YM.MergeProof.Accent.occursT`; `YM.MergeProof.Accent.tentF`; `Lean/YM/FullVolume/Fields/Pond.lean`, `Lean/YM/FullVolume/Dusk/Placed.lean`, `Tackle.lean` | The public root-test proof `tentF` calls `occursT` with a `Ponds` receipt, then applies the spacer inequality. `Geyser.pond` converts the selected-history `Geyser` input to `Ponds`; `Ponds.past` constructs each label's `Nectar` service from `Freightage`, `Fiesta`, `Cherry`, `Banks`, Brine, and the selected geometry inputs. In `occursT`, `Frost.upper` supplies servedness at the reference scale, `punctual` supplies finite response toll/activity bounds, and `vista` performs finite Wilson moment transfer. `Geyser.at` is a parallel service lemma, not the `occursT` caller on this route. |
| Backward density flow | `YM.Next.Rank.Course.flow`, `.flow_step`, `.flow_int`, `.flow_sum`; `Lean/YM/Next/RANK/Course.lean` | Flow is a finite recursion by the selected probability push, without a physical cell-volume factor. `flow_int` follows by induction from `StepData.push_integrable`; `flow_sum` follows from `StepData.push_integral`. Both use the same selected history above the reference. |
| Slice and product integrability | `YM.RG.StepData.push_slice`, `.push_integrand`, `.push_integrable`, `.push_integral`; `Lean/YM/RG/Push.lean` | A lawful transition has bounded density; each fixed coarse slice is integrable, and the full product integrand is integrable. This is the precise source property used to pass integrability through each finite push and to commute finite-dimensional coefficient extraction with integration. Finite total mass alone is not used as a pointwise slice claim. |
| Finite response and origin price | `YM.MergeProof.Accent.punctual`; `YM.MergeProof.Accent.scratch`; `Lean/YM/MergeProof/Traps.lean`, `Maid.lean` | `scratch` bounds the indexed scalar coefficient by three times the paid coefficient norm and the total tone charge by that norm. `punctual` multiplies by positive marker weights and packages these as the two response budgets `3a` and `a` when every weighted paid size is at most `a`. The geometric assumptions required for the whole mode are supplied by migration, occupancy and separated-origin inputs. |
| Local density price and vacuum normalization | `YM.MergeProof.Accent.hove`, `.sail`; `Lean/YM/MergeProof/Arbol.lean` | `hove` gives the pointwise toll-weighted local density estimate from Served, Lawful, nonnegative coupling, Vault, and the response budgets. `sail` integrates a fixed mode coefficient and uses the vacuum denominator lower bound. The monograph states these pointwise service and denominator estimates as explicit conditional hypotheses and proves cancellation of their common scalar. |
| Final mode-moment estimate | `YM.MergeProof.Accent.vista`; `YM.MergeProof.Accent.occursT`; `Lean/YM/MergeProof/Arbol.lean`, `Lean/YM/FullVolume/Dusk/Placed.lean` | `vista` iterates coefficient extraction through finite backward flow. At the terminal scale, the mode coefficient integrates to the Wilson partition function times the normalized moment. The scale-$k$ local estimate plus vacuum treasury gives exponent `|Sites_k| * Vac.treasury(k) + |V| * 6`; the six is `3a+a+2f` with `a=fly(k)≤1` and reserve `f=1`. `occursT` uses Ponds service; public `tentF` applies the result to its selected observables. |

## Checks and limits

- Read the exact declarations and immediate dependencies in the table; no Lean
  source edits or Lean build were made.
- No literature citation is needed for this finite source-specific passage.
- The temporary wrapper `/tmp/ym-centered-fragment.tex` includes this chapter.
  `latexmk -pdf -interaction=nonstopmode -halt-on-error
  -outdir=/tmp/ym-centered-fragment-build /tmp/ym-centered-fragment.tex`
  succeeded and produced a 36-page PDF. Eleven references remain unresolved
  because the wrapper omits OPE, lattice rate/step, and column-subpower units.
  Pages 33–36 were rendered and inspected. `python3 scripts/check_blueprint.py`
  fails because the shared parent-owned `blueprint/units/YM-000026/unit.json`
  is absent in this worktree; it was not created here.
- No Lean build or tests were run, and no Lean source was changed.
- The remaining substantive producer obligations are: the selected `Geyser`
  and terminal `Freightage` inputs; uniform migration/occupancy/Drake geometry;
  weighted paid-size bounds; and the local response/vacuum price package used
  by `punctual`, `hove`, and `sail`. The manuscript has deliberately not
  replaced these with the names of their receipt fields.
