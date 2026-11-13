# Textual Lean correspondence: PR #227 and PR #234 (session ADB991-claude-20261113-b066)

Source `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read as text in this repository's `Lean/` tree. Nothing was elaborated: the Mathlib hosts are blocked in this environment. Both author manifests verify, so the source files I read are the ones the authors cite. Line numbers are supplementary.

## PR #227

- **L1. Chamber receipt.** `YM.MergeProof.Ribbons.near_center` (`Lean/YM/MergeProof/North/Cent.lean:47`) has the form `∀ᶠ N in atTop, ∀ (h : J ≤ N) p (a : Site …), 8*‖place a‖ ≤ a J → ∀ v : label d, Interior (chamber) (O N p v a)`. The mesh threshold comes first, followed by all periods, all sites in the J-ball and all labels of the grade. In `YM.MergeProof.Ribbons.bricks` (`North/Brim.lean:39–63`), the anchor x is fixed first and `faraway` supplies its eventual period placement. `near_center` is then intersected at grades d, D and 4. Collar points satisfy ‖gridPoint‖ ≤ 4·rad, and the gate `hW : 32*rad ≤ a J` turns this into the J-ball condition. So the source gives chamber control for every m at which the gate holds, uniformly over the collar and over labels, with an x-dependent placement event. This is at least as strong as the manuscript's new hypothesis. The hypothesis is therefore a faithful (slightly weaker) restatement, and the author record describes it accurately. The manuscript does not claim the source proves more than it does.
- **L2. Scalar trace.** `YM.TraceExtension.stressTrace J = Σ_i J i i` and `theta T J = centerIn S T (stressTrace J)`, where `centerIn S T v = v − euclideanVEV S T v • unit` (`Lean/YM/TraceExtension/Centered.lean:17, 63–64`). This matches Θ_T. In `YM.Trace.Over.Scribe` (`Lean/YM/TraceExtension/Chart/Time.lean:52–59`):
  - The `gallery` field holds for every T with `T.Hierarchy` and `T.respects S`. It gives `∀ᶠ i, (J.U i 4).symm ((J.r i)^4 • theta T A'.energy) = ScalarP C ![e i, d i]`, with `BQ·d → d2` and `BQ·e → 0`.
  - The `goal` field holds for every T. It states that `ZoomValue J BQ (theta T A'.energy)` tends to `(4*d2) • OScale`, where `ZoomValue X B v k = (X.U k 4).symm ((B k * X.r k^4) • v)` (`Chart/Nectar.lean:64`).
  - `ScalarP C ![e,d] = e • unit 4 + d • (4 • OScale)` (`Chart/Scalar.lean:41`).

  The manuscript's display, its quantifiers and its b_i = BQ_i all match. The separate recentered-tensor receipt is `main`, which is unchanged.
- **L3. Ward.** `YM.Ward.angular` (`Lean/YM/Ward/Sum.lean:25–27`) is Σ_i (disc(turned slot) + Σ_b (move K (x i))_b • disc(raised slot)). This matches eq:ward-angular-expression term by term. `onLine`/`Collinear` (lines 32–35) use the coordinate axes through the origin, as the text says. Translation invariance is the `translations : S.Homogeneous` field of `YM.Table.Hierarchy` (`Lean/YM/Euclid/Words.lean:144`), and `Homogeneous` (`Lean/YM/Euclid/Table.lean:86`) is invariance of `read` under `Points.across s` on separated configurations. Extending it to field-valued moments is linearity. The new calculation in the text is a consequence of these definitions; the source has no separate declaration for it, and the author record does not claim one.

## PR #234

- **L4. Radial jets.** `YM.Labels.radial` (`Lean/YM/Labels/Jet.lean:22`) consists of symmetric tensors of rank j+1 with `Σ_i z_i • diagonal (A i) z = 0` for all z. `YM.Maxwell.potential_recover` (`Lean/YM/Maxwell/Exterior.lean:197–214`) proves `contracted (closedCurl A) = A`. It does so by differentiating the radial identity (`grad_self`), applying `grad_euler` with factor j+1, and dividing by j+2, which is the manuscript's argument. In `Lean/YM/Push/STRESS_FLUX/Jets.lean`:
  - `curled_deriv` gives `curled j z a b A = grad a (A.value b) z − grad b (A.value a) z`, so F_{ab}(z).
  - `curl0_value` gives `curl0 a b A = A.value b (basis a) − A.value a (basis b)`, which is f_{ab}.
  - `curl1 k = curled 1 (basis k)` is F_{ab}(e_k) = ∂_k F_{ab} = j_{kab}, with no factorial.
  - `leg0_value` is ½((i=b) z_a − (i=a) z_b) c, and `leg1_value` is ⅓((i=b) z_a z_k − (i=a) z_b z_k) c.
  - `sum_legs0` and `sum_legs1` state Σ leg(curl) = 2A, which is the manuscript's outside factor ½.

  Under the renaming (Lean k,a,b) ↦ (manuscript r,k,l), all of these match exactly. `sum_curled` (Σ_k z_k curl1 k a b = curled 1 z a b) is the homogeneity step F_{kl}(z) = Σ_r z_r j_{rkl}.
- **L5. Derivative plan.**
  - `YM.DiffPlan.Derivatives.kernels` (`Lean/YM/Euclid/Differential.lean:61–64`) says that, for every grade d, direction a, field B, spectator word w of any length and configuration in `conf (n+1)`, `useAt T x (cons ⟨d+1, deriv d a B⟩ w) = gradient 0 a (fun y ↦ useAt T y (cons ⟨d,B⟩ w)) x`. This is eq:ex-trace-derivative-compatibility, with the derivative in the first insertion.
  - `DiffPlan.Orientation.realDer` and `.mirrorDer` (lines 66–72) are the reality law and `mirror(s)(deriv b B) = Σ_a s_{ab} deriv a (mirror(s) B)`, matching the displayed covariance law.
  - `YM.Further.PhysicalPeriodLimitF933.tested_div` (`FreeRanks.lean:67–81`) identifies `grad a (signal w i j i j a 0)` at `basis 0` with the vector-label read of `V.deriv 4 a (material w a 0)` against the probe at the origin, via `Work.A01.D_cons`. `free_closure` sums it over a (line 98), and `free_rank` (line 159) takes `hV : V.Derivatives (Bel L)` and `hw : V.Orientation` as explicit hypotheses.

  The manuscript's conditional statement of `prop:ex-trace-free-closure-rank` therefore matches the source. The source discharges these hypotheses through `FreeInput.lit.pales`/`.hers` (`YM.Climb.Lighthouse.Goes`, `Lean/YM/Climb/Beams.lean:34–36`); see optional note O2.

## Verdict

The changed statements are faithful to the pinned source. I found no hidden hypothesis that was dropped, and no conclusion stronger than the source.
