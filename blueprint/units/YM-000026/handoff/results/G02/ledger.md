# G02 ledger: every name for the one-loop slope constant

Base: `codex/existence-monograph` @ `bac6004` (manuscript); Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Line numbers refer to the base.
Session `ADB991-claude-20261113-6470` (issue #136).

## Source: there is exactly one constant

| Declaration | Path | Content (inspected) |
| --- | --- | --- |
| `YM.Gauge.casimir` | `Lean/YM/Gauge/Colors.lean:180–182` | $-\frac{1}{\dim}\sum_i\operatorname{tr}(\operatorname{ad}b_i\circ\operatorname{ad}b_i)$ over `EuclideanSpace.basisFun G.ColorIndex ℝ`, i.e. an orthonormal basis for the colour inner product |
| `YM.Gauge.slopeConstant` | `Lean/YM/Gauge/Colors.lean:184` | `11 * G.casimir / (24 * Real.pi ^ 2)` |
| `YM.Gauge.trace_adjoint`, `YM.Gauge.casimir_pos`, `YM.Gauge.slopeConstant_pos` | `Lean/YM/Gauge/Casimir.lean:140, 160, 174` | $-\operatorname{tr}(\operatorname{ad}x\operatorname{ad}y)=$ `casimir`$\cdot\langle x,y\rangle$; positivity for simple $G$ |
| `YM.Pert.Asymptotics.b0`, `b0_normalizes` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:13–14` | `b0 G = 11*casimir/(48π²)`, `2*b0 G = slopeConstant` |
| `YM.PertExtension.Running.slope` | `Lean/YM/PertExtension/Running.lean:22` | same identity, local notation |
| `YM.RG.Calendar.hatBeta` | `Lean/YM/RG/History.lean:79` | `bar + G.slopeConstant * schedule.scale m` |
| `YM.Pressure.betaF` | `Lean/YM/Pressure/Seeds.lean:23` | `x + G.slopeConstant * log L` |
| `YM.RG.History.Transfer` (second conjunct) | `Lean/YM/RG/History.lean:223–227` | $\lvert\beta_{N,p,m+1}-\beta_{N,p,m}-$`slopeConstant`$\log L_m\rvert\le$ `(params (m+1)).drift` |
| `YM.RG.History.Running`, `YM.RG.History.Selected` (`starts`, `steps`, `reaches`, `running`) | `Lean/YM/RG/History.lean:229–240 (`Selected` at 234)` | $\forall\varepsilon>0$, eventually in $m$, $\forall N\,p$, $m\le N\Rightarrow\lvert\beta_{N,p,m}-$`hatBeta m`$\rvert\le\varepsilon$`scale m`; `starts`: level-$N$ density is `bare (β N p N)`; `reaches`: `β N p 0 = bar` |
| `YM.Precision.Kin.kinetic` | `Lean/YM/PCalc/Loop.lean:110` | $\lvert\alpha_{N,m}+$`slopeConstant`$\log L_m\rvert+1\le$ `(params (m+1)).drift` |
| `YM.Stationary.absoluteGeode` | `Lean/YM/Next/STATIONARY/OneLoop/MomentumIntegral.lean:346–347` | $\lvert$`alphaPay`$+$`slopeConstant`$\log\mu^{-1}\rvert\le\dots$ (the annulus pole law) |
| `YM.PhysicalNext.Repeat.Pane.cloak` | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Pane/Calls.lean:21` | `drift + |slopeConstant * log L| + 1` (the $A_j$ of the reset reorganization) |
| `YM.Family.beta` | `Lean/YM/Source/Construction.lean:38` | `C.path.β N p N` |
| `YangMills.wilsonFamily` | `Lean/WilsonBridge.lean:19–30` | public `denominator := C.S.denominator`, `beta := C.beta` |
| `YM.Schedule.a`, `YM.Schedule.scale`, `block_large` | `Lean/YM/Lattice/Scale.lean:99, 115, 31` | $a_m=1/\text{denominator}_m$, scale $=\log a_m^{-1}$, blocks $\ge3$ |
| `YangMills.WilsonFamily.mesh` | `Lean/PublicWilson.lean:50` | $1/\text{denominator}_N$ |
| `WilsonRegularity.running` | `Lean/ChallengeSpec.lean:13–14` | $\exists$ slope $>0$, $\forall\varepsilon$, eventually in $N$, $\forall p$, $\lvert\beta_{N,p}/\log(\text{mesh}_N)^{-1}-\text{slope}\rvert<\varepsilon$ |
| `YangMills.regular` (first component) | `Lean/HierarchyBridge.lean:15–22` | slope `2*b0`, proved by `zeroUp_bound` at `m = N` (`hN N p le_rfl`) |

All checked by reading the source text at the pin. Nothing was elaborated (see README, Checks).

## Manuscript occurrences

Classification: **S** = the slope constant, same as `slopeConstant` (verified by the matching source anchor); **D** = defining occurrence; **U** = use only.

| Chapter (owner) | Lines | Symbol | Role | Class | Source anchor | Proposed patch |
| --- | --- | --- | --- | --- | --- | --- |
| `annulus-two-wave-estimates` (C10) | 66–82, 116–117 | $C_G$, $\lambda_G$ | definition of $C_G$ with colour form; pole law (AT4) | S, D | `casimir`, `slopeConstant`, `absoluteGeode` | none (settled by #131) |
| `annulus-recording-yield` (C10) | 257–258, 281, 326–328 | $\lambda_G$ | $\lvert\alpha_c+\lambda_G\log L\rvert$ bounds | S, U | `absoluteGeode` | none |
| `annulus-same-data-binding` (C10) | 81, 327 | $\lambda_G$ | same | S, U | same | none |
| `quadratic-pole-transport` (C10) | 37, 122, 207, 212 | $\lambda_G$ | same | S, U | same | none |
| `background-path-convergence` (C11) | 80–81, 320 | $\lambda_G$ ("slope constant of the group") | $\lvert\alpha+\lambda_G\log L_m\rvert+1\le D_{m+1}$ | S, U | `Kin.kinetic` | none |
| `path-attachment-producer` (C11) | 46, 99, 109, 136, 366, 490, 820 | $\lambda_G$ | step bounds | S, U | `Kin.kinetic`, `absoluteGeode` | none |
| `surviving-interval-shooting` (C11) | 9 | $s=s_G$ | shooting slope, said only to be positive | S, **D (missing)** | `hatBeta`, `Transfer` | P1 (definition, derivation of the drift, public running condition) |
| `physical-reset-reorganization` (C11) | 612 | $s_G$ | $A_j=$ drift $+\lvert s_G\log L_j\rvert$ bounds $\lvert\alpha\rvert$ | S, U; correct only if $s_G=\lambda_G$ | `cloak` | none needed after P1 |
| `selected-nonlinear-offering` (C11) | 13 | $s_G$ | $\beta_F(x_0)=x_0+s_G\log L$ | S, U | `betaF` | none needed after P1 |
| `coupling-reset-selection` (C11) | 59 | — | $b(x)=\beta_f(x)+\alpha_{N,m}$; returned coupling $b+d$, $\lvert d\rvert\le w\le1$ | used in P1 | `Transfer` | none |
| `common-scale-selection` (C16) | 60–61, 67, 79, 82 | $s_G$ | $\widehat\beta_m=\beta_*+s_Gs_m$, "$s_G>0$" | S, D (positivity only) | `hatBeta` | P2 |
| `rg-construction` (C02) | 132–142, 180–182 | $s_G$ | top allowance; $\beta_F=\beta+s_G\log L$ | S, U | `betaF` | P3 (line 132) |
| `finite-menu-history-handoff` (C02) | 95 | $s_G$ | $\widehat\beta_{m+1}=\beta_F(\widehat\beta_m,L)$ | S, U | `hatBeta`, `betaF` | none |
| `centered-geyser-scale-estimates` (C02) | 18 | $c_G$ | "positive gauge slope constant" | S, D (alias) | `betaF` (evidence file line 13) | P4b |
| `common-funded-history` (C12) | 184 | $s_G$ | $c=s_G\log L$ | S, U | `betaF` | none |
| `common-observable-purchases` (C12) | 27 | $s_G$ | $y=x+s_G\log L$ | S, U | `betaF` | none |
| `marked-portfolio-calibration` (C12) | 277–279 | $c_G$ | $\widehat\beta_{i+1}=\widehat\beta_i+c_G\log L_i$ | S, D (alias) | `hatBeta` | P4a |
| `trace-calibration-producer` (C14) | 210–211 | $\kappa$ | uncorrected flux $\to-\kappa$; "κ is the slope constant" | S, D (alias) | `YM.Trace.Over.transferX` (per `trace-calibration-producer-evidence.md:20`; not re-inspected) | P5a |
| `trace-local-charge` (C15) | 91 | $\kappa$ | $\lvert m+12\kappa\rvert\le t^{-100}$ | S, D (alias) | per evidence; not re-inspected | P5b |
| `trace-scribe-producer` (C15) | 20–21 | $\kappa$ | "$\kappa=2b_0$" already stated | S, D | — | none |
| `trace-branch-moments` (#34) | 501, 506 | $b$ | "positive slope $b$" of the affine clock $\widehat\beta_j$ | S, U (alias) | `hatBeta` | none: the file is under a live claim (#34, TrishenGunaratnam, until 2026-11-14 12:30); its owner may add "$b=s_G$" |
| `symbolic-index` (G05) | 79–82 | $\lambda_G,b_0,s_G$ | "match to $s_G$ is a separate input" | stale after P1 | — | P6 |
| `argument-outline` (G04) | 209–210, 399–402 | $s_G$ | open interface "must be matched" | stale after P1 | — | none: under live claim (#60); see README, "For G04" |

The other uses of $\kappa$ in the trace chapters are the same symbol within those chapters. Uses of $\kappa$ in `physical-reset-reorganization` and `path-attachment-producer` are unrelated local constants; the grep hits were checked and excluded.
