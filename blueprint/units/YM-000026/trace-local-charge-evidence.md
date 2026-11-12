# Local charged-configuration estimate audit

- Unit: YM-000026, local response size and flux.
- Status: draft; independent review requested.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`).
- Manuscript: `manuscript/existence/trace-local-charge.tex`.
- Scope: reorganize and prove the final finite-dimensional norm/flux estimate in the local charged-configuration calculation, preserving the source's decomposition and its four error contributions.

## Correspondence

| Manuscript item | Exact declaration and source path | Correspondence/status |
| --- | --- | --- |
| Local charged response conclusion | `YM.Trace.Margin.brass`, `Lean/YM/TraceExtension/Margin/Beans.lean` | Exact conclusions: normalized coefficient-field norm at most `Wave(1/6,t)` and normalized flux differs from `midPay/12` by at most `4‖MintR‖Wave(−1,t)+calorie(t)/12`. The field estimate uses `Push.Local.norm_le_size`: coefficient size at most `thetaP(t)^2 Wave(1/6,t)`, multiplied by `u=thetaP(t)^−2`. |
| Directionwise contraction | `YM.Trace.Slate.cost_range`, `Lean/YM/TraceExtension/Slate/Ven.lean` | This is a separate core projection, not the local nonlinear map `altoD`. No contraction of `altoD` is used in the manuscript. |
| Exact field decomposition | `YM.Trace.Margin.brass`, same `Beans.lean`, local identity `hV` | The exact `Combat` field decomposition is `V = W + F(B) − F(K) + F(D) + E + L′`, where `F=altoD R t H Z`, `B=stubJ(lush z)`, `K=rill(quietL R t Q) z`, `D=swellW R Q t z`, `W=F(relic R J t U)`, `E=F(Weir.kerr t k z (ochre R t U Q))`, and `L′=addUp R t J k q U Q L H Z`. The local identity `hV` follows from the finite charge equation, `filmR(K)=filmR(rimW)+filmR(D)`, and regularity-restricted additivity of the coefficient read `altoD` on those inputs; the core projection is the separate `cost_range` map. The evaluated arrays `F(B),F(K),F(D),W,E` are coefficient arrays; the separate `cost_range` map is not substituted for `F`. |
| Neutral cancellation component | `YM.MergeProof.Accent.Merch.weld`/`.bloom` use inside `YM.Trace.Margin.brass`, `Lean/YM/TraceExtension/Margin/Beans.lean` | `Merch.weld` gives the finite charge relation between the neutral component and `D`; `Merch.bloom`, together with the local reflection/regularity hypotheses, gives zero priced contribution for `K`. This becomes the exact zero in the manuscript's flux cancellation receipt. |
| Distinguished component and target payment | `YM.MergeProof.Accent.mack` and `YM.MergeProof.Accent.Craft.earning` use inside `YM.Trace.Margin.brass`, same `Beans.lean` | `mack` evaluates the distinguished `B` component as the finite charge divided by 12. `Craft.earning` compares that charge with `midPay`; the remaining error is the stated inverse-thirtieth-power cost after dividing by 12. |
| Four residual flux bounds | `YM.Trace.Margin.brass`, using `YM.MergeProof.Accent.Combat` fields `phase`, `march`, `lower`, `money` | The four error arrays are exactly `W=altoD(relic)`, `F(D)=altoD(swellW)`, `E=altoD(Weir.kerr)`, and `L′=addUp`. Their coefficient sizes are bounded by `thetaP(t)^2 Wave(−1,t)` from `Combat.phase`, `.march`, `.lower`, and `.money` (the last includes the `wane(t,−2≤−1)` comparison). `Push.Local.norm_le_size` and multiplication by `u=thetaP(t)^−2` give the normalized norm bound; applying `MintR` then bounds each flux by `‖MintR‖Wave(−1,t)`. Summing these four terms gives the coefficient 4, with no hidden direction-count factor. |
| Normalization and rate functions | `YM.Trace.Slate.barter`, `YM.Trace.Zn.Wave`, `.calorie`; `Lean/YM/TraceExtension/Slate/Ven.lean`, `Lean/YM/TraceExtension/Zn/Have.lean`, `Lean/YM/TraceExtension/Zn/Setup.lean` | `barter=(threshold²)^{-1}` is the scalar `σ`; `Wave(a,t)=exp(a(log log t)²)`; `calorie(t)=t^{-30}`. The local price error tends to zero as the threshold tends to infinity. |
| Placement in response limit | `YM.Trace.Slate.penumbra`, `Lean/YM/TraceExtension/Slate/Pony.lean` | The source applies the local charged estimate to typical finite-volume configurations, then uses `TravelsC.hi` and continuity to pass the norm and flux bounds to the separated limit. The manuscript's local proposition supplies the finite-dimensional decomposition calculation; its ultrafilter transfer is in `trace-weighted-estimates.tex`. |

## Proof boundary

The proposition is a newly reorganized proof of the final estimate inside `YM.Trace.Margin.brass`: the coefficient-size receipt gives the response norm; the explicit component decomposition, neutral cancellation, distinguished payment, and four residual bounds give the price error. The exact numeric constants and target `midPay/12` match the source.

The producers of the component receipts are not discharged here. They arise from the selected finite-volume conditions `Wealth`, `Merch`, `Craft`, and `Combat`, together with regularity, interior, and separation assumptions in `brass`. The actual public finite-volume construction must supply those structures; this chapter neither creates them nor treats their constructors as proof substitutes. The next source task needed to close this local producer is to derive those receipts from the selected run's actual `Combat`/charge fields and funded finite-volume configuration.

## Commands and verification record

Inspected `Lean/YM/TraceExtension/Margin/Beans.lean`, `Lean/YM/TraceExtension/Slate/Ven.lean`, `Lean/YM/TraceExtension/Slate/Pony.lean`, `Lean/YM/TraceExtension/Zn/{Have,Setup}.lean`, and the immediate `Accent` declarations used by `brass` with `rg -n` and `sed -n`. No Lean or LaTeX build was run. No Lean source was modified.
