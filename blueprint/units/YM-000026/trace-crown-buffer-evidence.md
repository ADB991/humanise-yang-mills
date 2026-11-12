# Crown buffer for the selected trace probe

- Unit: YM-000026, trace selected-scale producer.
- Status: draft; elementary finite-volume transfer argument written, awaiting independent mathematical/source review.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-crown-buffer.tex`.

## Source crosswalk

| Manuscript step | Exact source | Correspondence |
| --- | --- | --- |
| Crown data and target two-point bound | `YM.Trace.Terrace.Crown`, `YM.Trace.Terrace.stageCrown`, `Lean/YM/TraceExtension/Terrace/Crown.lean` | `Crown.cost` supplies the local witness `g`, support `Q`, window `l`, global and healthy-set difference bounds, and rooted price `Tau(-1200000)`. `stageCrown` is the result derived by the manuscript proposition. |
| Rooted product bound at distinct anchors | `YM.Trace.Terrace.pulpit`, `Lean/YM/TraceExtension/Terrace/HomePort.lean` | Seam plus chamber-interior fields imply the two-factor rooted Hölder estimate. The proof is `rooted_translates` with the injective two-site map. |
| Root bound from a pointwise cap | `YM.Push.GridApprox.root_sup`, `Lean/YM/Push/GRID_APPROXIMATION/Picture.lean` | The powered rooted moment is bounded by the same pointwise cap: bound every copied factor, multiply over cells, integrate, then take the positive cell root. For the lifted field, `backTo_bound` transfers the sup cap. |
| Exact coarse-to-fine product identity | `YM.Trace.Terrace.backProd`, `Lean/YM/TraceExtension/Terrace/Peeking.lean` | Under a common interior window and room, the coarse two-point pairing equals the fine Wilson expectation of the product of the two anchored pulls. The proof groups the two-site support in `backTo_cells`; no approximation is used. |
| Rare-defect finite-volume bound | `YM.Trace.Shepherd.expire`, `Lean/YM/TraceExtension/Terrace/Mortal.lean`; `YM.Trace.Shepherd.soils`, `YM.Trace.Shepherd.health`, `Lean/YM/TraceExtension/Shepherd/Triton.lean` | The manuscript states the exact one-site action receipt from `health` as an incoming hypothesis, then proves the arbitrary-support estimate by the healthy/complement split and union bound. The source `expire` composes `soils` with `funeral`; the manuscript derives the needed scale-exponent inequality from explicit scale receipts. Producing the one-site receipt and the normalized transfer identity remains an upstream obligation. |
| Exponential rate conversion | `YM.Trace.Terrace.stageCrown`, `Lean/YM/TraceExtension/Terrace/Crown.lean` | The source proves eventually `exp(-2 prism(hatBeta_summit))≤Tau(-1200000)` from the selected prism/Lyra scale inequality and monotonicity of the gate. Also `3≤Tau(1)` eventually. |
| Witness producer boundary | `YM.Trace.Terrace.Cor` and `YM.Trace.Terrace.Grid.tide`, `Lean/YM/TraceExtension/Terrace/Cor.lean`, `Grid.lean` | These are upstream producers of Crown witnesses from the selected stress/probe data. This unit proves their downstream quantitative transfer; it does not re-prove their construction. |

## Mathematical details and scope

The manuscript keeps the three terms separate. The witness term costs
`Tau(-1200000+150000)=Tau(-1050000)`. For the correction, the global product
cap is `Tau(650000)`, the healthy-set cap is `Tau(-350000)`, and support size
is at most `Tau(1000)`. The exceptional-set tail contributes
`Tau(650000+1000-1200000)=Tau(-549000)`. Together with the witness term,
each of the three summands is at most `Tau(-31000)`; `3≤Tau(1)` yields
`Tau(-30000)`.

The source `Mortal.funeral` proof uses the threshold-to-prism inequality, the
treasury bound, and the plaquette/clip lower bound. The manuscript spells out
the scalar scale comparison and applies it to the support union bound. The
one-site action receipt and normalized transfer identity are displayed as
explicit incoming hypotheses, not claimed as proved in this unit. The Crown
witness-production route also remains upstream.

## Audit

Read-only source inspection used `rg -n` and `sed -n` on the paths in the
crosswalk. No Lean source was edited. No Lean, TeX, or blueprint check was run.
