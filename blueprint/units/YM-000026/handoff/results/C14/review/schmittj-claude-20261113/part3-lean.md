# C14 independent review, part 3: Lean correspondence

Reviewer 3 of 4, session `schmittj-claude-c14-review-20261113`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read under `Lean/` in worktree commit `e058a61`. I compared the texts only. I did not elaborate any file, replay kernels or audit axioms. For each correspondence claim I opened the declaration and read its type and the definitions that determine its meaning, without relying on names.

Overall: the two changed chapters correspond to the source. The PR #98 repairs are justified by `regrade_tri`, `inverse_tier`, `storms`, `seats`, `solaris` and `pudding`. One description in an unchanged chapter is wrong (F1, the gallery receipt). Two source hypotheses appear in the manuscript as if they were proved purchases (F2, F3).

## Findings, ordered by severity

### F1. INACCURACY (manuscript, pre-existing). `trace-firesky-gallery.tex` lines 223–233 against `YM.Trace.Over.Scribe`

The manuscript describes unweighted coefficients converging to `d_2` and `0`, a "canonical stress direction", and a zoomed scalar converging to a multiple of the unit.

The source is `Scribe.gallery` in `Lean/YM/TraceExtension/Chart/Time.lean`, lines 52–60. For each `T : Table C.book` with `T.Hierarchy` and `T.respects S`, eventually `(J.U i 4).symm ((J.r i)^4 • theta T A'.energy) = ScalarP C ![e i, d i]`, together with `BQ Z V i * d i → d2 G` and `BQ Z V i * e i → 0`. `Scribe.goal` gives `ZoomValue J (BQ Z V) (theta T A'.energy) → (4*d2 G) • OScale C.book` for every table.

The supporting definitions:

- `ScalarP` (`Chart/Scalar.lean:41`) is `e • unit 4 + d • (4 • OScale)`.
- `OScale = fromPol (square4 G)` (`Chart/Stage.lean:50`) is the curvature-square field. Lemma `sum_delta` there identifies `4 • OScale` with the trace of `materialB`.
- `BQ = Z.β ∘ Stern V` (`Chart/Dray.lean:42`), and `Scribe.grows` says `BQ → ∞`.

Lemma `leaderB` in the same file derives the weighted decomposition from `goal`.

The English is stronger in one respect and wrong in another. Unweighted convergence to `d_2` is false, since `d_i → 0`. The limit is a multiple of `O`, not of the unit. The paragraph also omits the hypotheses `T.Hierarchy` and `T.respects S`. The field `main` (recentered stress `→ materialB C none`) is described correctly. This independently confirms the C15 review item. Requested change: as in `part3-mathematics.md` F1.

### F2. INACCURACY (manuscript, pre-existing). The budget triple and the slow reserves are hypotheses of `solaris`, discharged by the caller

The manuscript, at `actual-equation-kernel-relay.tex` lines 59–61 and 84–85, says these are supplied by the purchases. In the source:

- `YM.MergeProof.solaris` (`Lean/YM/MergeProof/Canopy.lean`, lines 32–33) takes `he : Braze V b`, which bundles credit, allowance and flight, as a hypothesis.
- The section variables give it `h : Scrim …`, `hF : Fridge C u ζ`, `H : C.Makes`, `B : Stock.Tabs …` and `hG : G.Simple`.
- `Fridge` (`Portions.lean`, lines 16–21) carries the terminal keeper, `u>0`, slow `u⁻¹`, slow `ζ` and `shiftCosts`.
- The public caller discharges `Braze` and `Fridge` (`Lean/YM/MergeProof/Inns.lean`, lines 42–50).

The manuscript's C12 producer itself records the floor condition as open (`marked-portfolio-calibration.tex`, lines 262–265 and 380–383). The consumer should therefore list it as an input. This is a defect of visibility, not a mismatch of types.

### F3. INACCURACY (manuscript, pre-existing). `J_N ≤ β̂_N` in `actual-insertion-derivative-relay.tex` lines 95–98

In the source this is the hypothesis `hp : ∀ i, jump (C.path.levels.budget i) ≤ C.path.levels.clock.hatBeta i` of `YM.MergeProof.freezes` (`Portions.lean`, line 24). `freezes` turns it into `Fridge.shifts`, that is, `shiftCosts C f = Slow C f (jump ∘ budget)` (`Push/RELAY_DIFFERENCE/RawTop.lean:220`). It is consumed by `lofty` through `RawProtected.heighten`. `Inns.lean` line 42 discharges it. The manuscript states "the selected delay explicitly buys" without naming a manuscript producer. The mathematics is correct, but the inequality should be listed as an input.

### F4. NIT. Imprint, not campaign

`actual-equation-kernel-relay.tex` line 31 says the regrading "intertwines conjugation and signed motions". `YM.Push.Mark.twist_real` and `twist_orient` (`Automorphism.lean`, lines 107–109) take `h : Imprint H d F`, and `twist_unit` and `inverse_tier` need only `Campaign`. The manuscript calls `R_d` the "campaign regrading". It should say the imprint, which C12 uses (`R_d=A_d`).

## Correspondence of the PR #98 repairs (my chapters)

| Repair | Source checked | Verdict |
| --- | --- | --- |
| Campaign map unitriangular in stamp; inverse preserves the descending filtration | `YM.Push.Mark.regrade_tri`: for `p.val ∈ rise a`, `(regrade F p).val - p.val ∈ above a`. `inverse_tier`: `(twist h).symm p ∈ rise a`. `stamp m = toLex (m.2,m.1)` and `rise m = restrictSupport {a ∣ stamp m ≤ stamp (weight a)}` (`Rising.lean`, lines 21 and 30). | Matched. The source is stronger: it holds on all of `rise a`, not only on homogeneous stamps. |
| Seat sum and section constants in the forced reserve; stencil cardinality only in sphere | `YM.Push.RelayDifference.Opening.seats` (`Opening.lean:25`) `= ∑ j, threshold⁻¹ ^ (F.grades j).2`. `YM.MergeProof.storms X Y C N j = X*seats + 2*Y*seats` (`Matter.lean:21`). In `solaris`: `Z i = storms (price V) (price T) …`, `E i = 4(1+columns)·sphere(…,card(V.stencil ∪ T.stencil), b i) + exp((α+2)·81)·Z i·ζ d i·(u i)⁻¹`. `seats_slow` gives slowness. | Matched. Here `(grades j).2` is the factor coordinate, the first entry of the stamp. |
| Cite `prop:ex-marked-solaris` | `solaris` produces `Hearth`. In `stamped`, `P N p = decor F (U N p)` with `coeffSize (P⁻¹ i) ≤ 2 coeffSize i`, and `matter` holds for every `k` with `ref d ≤ k < N`, `opens 1 m k`, every motion and `m ≤ N`, with bound `cider·E·flight(-γ)`. In `coined`, `E` is slow for every order. The proof uses `inviting` and `figment`. | Matched to the manuscript display `eq:equation-column-root` and the inverse bound. |
| Backward relay uses item (4), with `ref ≤ N` | `YM.MergeProof.pudding` (`Biscuit.lean`, lines 52–55): from `ref d ≤ N` and a `Cream`, there is `v` with `32(1+columns)^2 · coeffSize(Z.x - terminal.symm v) ≤ 2(1+columns)Q`, and root bounds at every opened pair. It is obtained from `antilles` with `v := terminal (V ℓ).a`. Compare `figment` (`Figment.lean:34`), which needs `ref d < N` and uses `puffs`. | Matched. The insertion relay follows `pudding`, not `figment`, for the coefficient bound. |
| Common tiling from fixed opened pairs | `YM.MergeProof.rotates` (`Dollars.lean`, lines 20–24): `m = max j (ref d)`, `k = Stock.Tabs.chosen … m`, `hk.1 : m ≤ k`, slow `cider·E` sinks `1/8` to `1/16`. | Matched to equation relay lines 130–138. |

## Correspondence in unchanged chapters (spot checks)

- `actual-phase-detector-moments.tex` eq. `episode-conjugate`. `YM.Work.B17.conj_M` (`Lean/YM/Work/B17.lean:22`) needs `Theme V A`, `Phase.reflects V A` and `distinct w`, and gives `M A (conjugate w) = star (M A w)`. Matched; the manuscript correctly calls the reflected-word identification an input.
- The same chapter's eq. `episode-all-powers`. `YM.Bid.B18` (`Lean/YM/Bid/Fetch.lean:74`) states `Sends` for `Δone` and `Δtwo`. Its consumer `fees` derives `Re⟨Ω,(E*E)^nΩ⟩ ≤ (c+ε)^{2n}`. Matched.
- `trace-firesky-gallery.tex` eq. `firesky-gap`. `YM.Next.Rank.Station.gap` (`Lean/YM/Next/RANK/Station.lean`): `gap_pos` gives positivity as `a_k · mag`, and `gap_rate` gives convergence to 0 under `G.Simple`. Matched at the level of the formula. I did not open the one-step comparison lemma.

## Lean declarations opened

| Fully qualified name | Path | Matched |
| --- | --- | --- |
| `YM.Push.Mark.regrade_tri` | `Lean/YM/Push/RELAY_MARK/Automorphism.lean` | yes |
| `YM.Push.Mark.inverse_tier`, `twist`, `twist_real`, `twist_orient`, `twist_unit` | same | yes (F4 wording) |
| `YM.Push.Mark.stamp`, `rise` | `Lean/YM/Push/RELAY_MARK/Rising.lean` | yes |
| `YM.Push.RelayDifference.Opening.seats` | `Lean/YM/Push/RELAY_DIFFERENCE/Opening.lean` | yes |
| `YM.MergeProof.storms`, `sanded`, `sphere` | `Lean/YM/MergeProof/Matter.lean` | yes |
| `YM.MergeProof.Braze`, `matter`, `Hearth`, `solaris` | `Lean/YM/MergeProof/Canopy.lean` | yes (F2: hypotheses) |
| `YM.MergeProof.figment` | `Lean/YM/MergeProof/Figment.lean` | yes |
| `YM.MergeProof.pudding` | `Lean/YM/MergeProof/Biscuit.lean` | yes |
| `YM.MergeProof.rotates`, `unitsC` | `Lean/YM/MergeProof/Dollars.lean` | yes |
| `YM.MergeProof.Fridge`, `freezes`, `onions`, `thyme`, `lofty` | `Lean/YM/MergeProof/Portions.lean` | yes (F3: hypothesis) |
| `YM.Push.RelayDifference.shiftCosts` | `Lean/YM/Push/RELAY_DIFFERENCE/RawTop.lean` | yes |
| caller of `freezes` and `reception` (`Inns.lean`, lines 38–50) | `Lean/YM/MergeProof/Inns.lean` | read for discharge only |
| `YM.Trace.Over.Scribe`, `leaderB`, `Store_l` | `Lean/YM/TraceExtension/Chart/Time.lean` | no: manuscript paragraph mismatched (F1) |
| `YM.Trace.Over.ScalarP` | `Lean/YM/TraceExtension/Chart/Scalar.lean` | definition read |
| `OScale`, `sum_delta`, `Year` | `Lean/YM/TraceExtension/Chart/Stage.lean` | definition read |
| `BQ` | `Lean/YM/TraceExtension/Chart/Dray.lean` | definition read |
| `YM.Work.B17.conj_M` | `Lean/YM/Work/B17.lean` | yes |
| `YM.Bid.B18`, `YM.Work.B18.answer` | `Lean/YM/Bid/Fetch.lean`, `Lean/YM/Work/B18.lean` | yes |
| `YM.Next.Rank.Station.gap_pos`, `gap_rate` | `Lean/YM/Next/RANK/Station.lean` | yes (formula level) |

## Not checked

- Declarations for `physical-ward-stress-cone.tex` and `phase-ward-inheritance.tex`: their evidence files cite no fully qualified names, and I did not search the source for them.
- `YM.MergeProof.Accent.rated` and the `Soft`/`Legato` rank chain for `actual-rank-purchases.tex`, including `Labels.Frame.scaled` against the formula for `t_{k,N,p}`.
- The `East.*Sky` chain of the gallery chapter, and the three-panel chart theorem.
- Bodies of `inviting`, `antilles` and the served-representation step.
- No elaboration, `#print axioms` or replay of the build.
