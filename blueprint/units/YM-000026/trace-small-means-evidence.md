# Weighted field decay from the priced mission

- Unit: YM-000026, trace selected-scale producer.
- Status: draft; local review requested, no whole-proof approval.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-small-means.tex`.
- Scope: reorganization of the exact local argument behind the weighted field-image estimate `YM.Trace.Terrace.small_means`; the mission price and chart receipts remain explicit inputs.

## Source correspondence

| Mathematical step | Exact Lean declarations and paths | Correspondence and status |
| --- | --- | --- |
| Exact medium/core identity | `YM.Trace.Slate.medium`, `.coreF`, `.canal`, `Lean/YM/TraceExtension/Slate/Phantom.lean` | `medium` is `Z.β(Stern V i)⁻¹ Shine5(Z,X) − Shine5(Z,L.Z)`; `canal` rewrites its coordinates as `Z.β(Stern V i)⁻¹ swale(coreF)`. This Arch scale is distinct from `β̂(Stern V i)`, the weight used in `small_means`. |
| Normalized response and night scaling | `YM.Trace.Terrace.Spun`, `.fisc`, `.gazes`, `Lean/YM/TraceExtension/Terrace/Prism.lean`; `YM.Trace.Terrace.crown`, `Lean/YM/TraceExtension/Terrace/Path.lean` | `Spun.starts` writes the response section through inverse chart and the scale-dependent evaluation `Vault(S,Z,5,k_i,c_i)`. `fisc` gives `Vault(swale x)=crown·S.project_5(x)` for `x` odd under the central signed inversion, meaning `F(archV)x=−x` (source predicate `Knob.night`). The raw grade-five labels map to `S_5` under `P_5=S.project_5`. The manuscript combines these identities with `crown=ζ·(a b)^5` and `X.r=a b`; this yields `z^p b^5 a^5 P_5x`. The frame estimate `b≤m=tilt_cap` is `YM.Trace.Terrace.tiltP`, `Lean/YM/TraceExtension/Terrace/Cabin.lean`, applied to the selected vane's high-scale field. |
| Uniform local price | `YM.Trace.Terrace.ear_price`, `Lean/YM/TraceExtension/Terrace/PriceLimit.lean` | `ear_price` bounds, for each fixed grade-four `w` (with a tail that may depend on `w`), the paired insertion of `a^5 P_5(x_i(0))` against `X.U_i4 w` at the scale-centered point by `Tau(j,-100)`. Its proof consumes `Mission.finances`, the finite-volume `mileage` price receipt, local cover/core receipts, and table projection. |
| Finite detector | `YM.Trace.Terrace.listened_G`, same `PriceLimit.lean`; helper `YM.Trace.StressFlux.ears_det` and `YM.Trace.Terrace.sewn` in its immediate imports | The full family of grade-four front-read pairings separates `TableOne`. Finite-dimensionality selects a finite family; the scale-dependent charts and beacon point give operator-norm convergence, so its least singular value remains positive. The manuscript states and proves this elementary finite-dimensional implication. |
| Negative-ticket rate | `YM.Trace.Terrace.whither`, `.Ticket.prod`, `.stickK`, `.titles`, `.ticket_exp`, `Lean/YM/TraceExtension/Terrace/Fund.lean`; `YM.Trace.Terrace.grow_big`, `YM.Trace.Terrace.tilt_cap`, `Lean/YM/TraceExtension/Terrace/SkyEar.lean`, `Fund.lean` | `stickK` and `titles` provide rate-zero tickets for `β̂(summit)` and `tilt_cap`; `ticket_exp` gives the rate `−100 Dust` ticket for `Tau(-100)`, with `Dust=1/10000`. `Ticket.prod` gives the product rate `−100 Dust<0`, and `whither` proves convergence to zero. `Gondola.growth`, terminal/stage inequalities compare the selected scale `z_i` to the summit rate. The manuscript writes this product argument; the exact source inequalities are the stated inputs. |
| Final theorem | `YM.Trace.Terrace.small_means`, `Lean/YM/TraceExtension/Terrace/Terrain.lean`; applied in `YM.Trace.Slate.hullage`/`.legacy`, `Lean/YM/TraceExtension/Slate/Phantom.lean`, `Lean/YM/TraceExtension/Slate/Garnet.lean` | The manuscript proves the central tested-coordinate-to-field-norm argument from exact scale algebra, the price bound, rate decay, and detector lower bound. It does not claim to prove the local price/mileage or selected chart receipts. |

## Commands and checks

Read-only inspection used `rg -n` and `sed -n` on `Lean/YM/TraceExtension/Slate/{Garnet,Phantom,Limit,Pony}.lean`, `Lean/YM/TraceExtension/Terrace/{Terrain,PriceLimit,Prism,Path,Fund,SkyEar,Ears,Cabin}.lean`, and `Lean/YM/TraceExtension/Chart/{Token,Dray}.lean`. No Lean source was changed. No LaTeX or Lean build was run. Blueprint checking is recorded with the parent unit record; this new evidence file has not independently been run through the checker yet.
