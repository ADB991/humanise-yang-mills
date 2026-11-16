# The tilt cap and the logarithmic zoom bound

- Unit: YM-000026, trace selected-scale producer (C15).
- Task: hairer/humanise-yang-mills#361 (finding F4 of report PR #357, part-B ledger edge E-clock, third clause only).
- Session: `ADB991-claude-20261114-ce9e` (Claude, scheduled agent, on behalf of ADB991). Draft; independent mathematics and Lean-correspondence review requested.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Base `codex/existence-monograph` @ `97f806c7`.
- Manuscript: `manuscript/existence/trace-clock-cap.tex` (new, `\input` before `trace-small-means`); citation-only edits in `trace-scribe-producer.tex` (clock paragraph, sentence before `eq:ex-lattice-scribe-clock-inputs`) and `trace-small-means.tex` (ticket paragraph before `lem:ex-trace-small-means`).
- `unit.json` is not edited here: the coordinator should add `trace-clock-cap.tex` to YM-000026's `manuscript` list.

## Treatment

Prove (elementary). No literature result is needed: the only facts used are `log x <= x - 1`, monotonicity of `exp` and of `c -> M^c` for `M >= 1`, and `(log t)^48 / t -> 0`.

## Source correspondence

All declarations were read textually; no Lean was elaborated.

| Manuscript item | Declarations and paths | Correspondence |
| --- | --- | --- |
| Clock, `eq:ex-lattice-clock-cap-rate` | `YM.Calendar.hatBeta` (`Lean/YM/RG/History.lean`: `bar + G.slopeConstant * schedule.scale m`); `fits.delayed : 1 < hatBeta t` (used in `YM.Trace.Terrace.bell`, `lira`, `Lean/YM/TraceExtension/Terrace/Lyre.lean`); `YM.Trace.Terrace.hrate` (same file, `hatBeta -> infinity`, needs `G.Simple`) | `kappa = slopeConstant > 0`. The text uses only `hatBeta_j > 1` and `hatBeta_j -> infinity`. |
| Monitor `M_j = exp((log log hatBeta_j)^2)` | `YM.Calendar.monitor` (`History.lean`) | Exact match. Same object as `\mathcal M_k` in `allarity-marked-propagation.tex` l. 250 and `rank-root-normalization.tex`. |
| Magnified monitor `M_j^c` | `YM.Next.Rank.Station.mag A b k := A.clock.monitor k ^ b` (`Lean/YM/Next/RANK/Station.lean`) | Real power (`rpow`); `mag_pos`. |
| `def:ex-lattice-tiltcap`, `tiltcap(j) = exp((log log hatBeta_j)^3)` | `YM.Trace.Terrace.tilt_cap P i := Station.mag P (Perch.y (P.clock.hatBeta i)) i` (`Terrace/Fund.lean`); `YM.Next.Rank.Perch.y s := log (log s)` (`Lean/YM/Next/RANK/Reign.lean`) | `mag` at exponent `y = log log hatBeta`. The closed form `exp(u^3)` is the computation inside the proof of `titles` (`(exp (u^2))^u = exp(u^2 * u)`). |
| Ticket | `YM.Trace.Terrace.Ticket P a v := forall b > a, eventually 0 <= v i <= watch P b i`, `watch P b k = exp (b * Gate (hatBeta k))`, `Gate x = (log x)^48` (`Fund.lean`, `Terrace/Base.lean`) | Exact match (nonnegativity eventually, as in the source). `trace-small-means.tex` states the notion for nonnegative sequences; the two agree there. |
| `lem:ex-lattice-trace-tiltcap-ticket` (1), (2) for `p = 1` | `YM.Trace.Terrace.titles : Ticket P 0 (tilt_cap P)` (`Fund.lean`) | Source proof: eventually `log hatBeta >= 1` (`lrate`), and `u^3 <= (log hatBeta)^3 <= b (log hatBeta)^48` via `gate_flex 3` (`Terrace/Stanza.lean`). Same argument as the manuscript. |
| Lemma (2), general `p` (the fifth power used by small means) | `YM.Trace.Terrace.Ticket.pows` (`Fund.lean`) | Source derives powers by repeated `Ticket.push`; the manuscript gives the direct bound `p u^3 <= p L^3 <= rho' L^48` once `L^45 >= p/rho'`. Reorganised, same conclusion. |
| Chart receipt `eq:ex-lattice-clock-cap-receipt` | `YM.MergeProof.East.TimberSky.high : 5 < b ∧ b ≤ Perch.y (clim A i)` (`Lean/YM/TraceExtension/Prom/Zoom/Boats.lean`), with `Vane.checked V i := TimberSky F a d V.k i V.b V.c V.R`, so `i := V.k` (frame level); `YM.Next.Rank.clim A k := A.clock.hatBeta k` (`Next/RANK/ParticleGate.lean`); `YM.Trace.Terrace.b_zoom V i := mag A (V i).b (V i).k` and `kamago : X.r i = a_{(V i).k} * b_zoom V i` (`Terrace/SkyEar.lean`); `Gondola.season` (`Terrace/Gondola.lean`); `YM.Trace.Terrace.tiltP` (`Terrace/Cabin.lean`) | Zoom factor `b_i = M_{j_i}^{c_i}` with `5 < c_i <= log log hatBeta_{j_i}`, for every `i`. Upper bound is `tiltP`; lower bound `b_i >= 1` follows from `M >= 1`, `c_i > 0` (the source instead uses `grow_big`, `b_zoom -> infinity`, which needs only the tail). `trace-firesky-gallery.tex` l. 39–41 states `5 < b` and "no larger than the permitted angular bound"; the value `log log hatBeta` of that bound is read from `TimberSky.high`. |
| `lem:ex-lattice-trace-log-zoom`, `eq:ex-lattice-trace-log-zoom` | Inside `YM.Trace.Over.zoom_BQ` (`Lean/YM/TraceExtension/Chart/Orr.lean`): `f i ≤ tilt_cap P' (k i)` from `tiltP` and `(hq.season i).1.high.2`, then `≤ watch _ 1 (k i)` from `titles P' h 1`; `log f i / m i -> 0` by squeeze with `Gate_calm` (`Terrace/Lyre.lean`) | Here `k i = (V i).k` is the frame level `j_i` and `m i = hatBeta (k i)`. The source bound is `log b_i <= (log hatBeta_{j_i})^48` (rate 1 ticket); the manuscript proves the stronger `(log log hatBeta)^3`, which implies it. Lower bound in the source: `grow_big` eventually `>= 1`. |

## What this closes and what it does not

- Closes: the third clause of `eq:ex-lattice-scribe-clock-inputs` (F4 of #357), given the chart receipt `1 <= b_i <= tiltcap(j_i)` (which the selected chart supplies for every `i`, as above); and the tilt-cap zero-rate ticket in `trace-small-means.tex`.
- Not addressed: the two ratio limits in `eq:ex-lattice-scribe-clock-inputs` (`zeta(j)/hatBeta_j -> 1`, source `YM.Trace.Terrace.gamut`; `zeta(j)/zeta(summit j) -> 1`, source `YM.Trace.Terrace.Barry`, uses `PostT`); the summit ticket `hatBeta_{summit(j)} <= 2 hatBeta_j` (`YM.Trace.Terrace.bond`, `stickK`, uses `PostT` and `back_gate`). These remain inputs.
- The manuscript's chart receipt is stated in `trace-mission-price.tex` (l. 63–67) and `trace-small-means.tex` (l. 44–46) as part of the selected chart receipt; this section derives it from the exponent window of the gallery's chart output, whose own producer (the three-panel chart result, F2 of #357) is still conditional.

## Open questions

- None identified for the two lemmas. The identification "permitted angular bound = `log log hatBeta_{j}`" is source-read (`TimberSky.high`), not stated elsewhere in the manuscript; a reviewer should confirm that the gallery's "angular bound" is meant to be this quantity.

## Commands and checks

Recorded in the PR body (checker, unit tests, full `existence.tex` build, page inspection). No Lean command was run: the Mathlib dependencies cannot be fetched in this sandbox (see earlier runs); the correspondence above is textual.
