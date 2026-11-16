# Textual Lean-correspondence review

Session `hairer-claude-20261114-c09rev`. The source pin is `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Paths are relative to `Lean/`. Every file read here matches `Lean/SOURCES.sha256` (see `validation.md`).
I only read the source text: nothing was elaborated.

**Verdict:** no discrepancy between the #104 edits and the declarations they rely on.

## Strong forced price (`small-field-budget-selection.tex`)

- `YM.Progress.DirectedRecipe.Payments.Pairing.strong` (`YM/Progress/DIRECTED_RECIPE/Economy.lean`) is `P.C * exp(-P.r * (Instrument.plain.t y / gap beta)^2)`.
  - The rate satisfies `F.rate < P.r`, and `YM.Next.Scheduling.Postage.pos` gives `0 < rate` (`YM/Next/SCHEDULE/Dues.lean`), so `r > 0`.
  - The source only has `C_nonneg : 0 <= C`. The ledger traces strict positivity to `Time.Forecast.pair`. Positivity is irrelevant to the upper bound used in the chapter.
- `YM.Next.Scheduling.Instrument.t M x = Clock.gap x * M.P x`, and `Instrument.plain` has center 2 (`Dues.lean`). `YM.Next.Scheduling.Clock.gap x = (sqrt x)^{-1}` (`YM/Next/SCHEDULE/Clocks.lean`).
  - Hence `(t y / gap beta)^2 = beta * tau^2` with `tau = y^{-1/2} P(y)`, as in the chapter.
- `YM.Next.Scheduling.inBand x beta` is `beta ∈ [x/4, 4x]` (`Dues.lean`). This gives the `beta >= z/4` used in the text.

## Extra-degree remainder (`small-field-budget-selection.tex`)

- `YM.PhysicalNext.Repeat.Height.completed` (`.../RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Census/Revenue.lean`) takes the following hypotheses:
  - `grow^3 <= exp(mark)` and `grow^3 <= exp(epsilon * till)`;
  - two `degreePrice ... <= 1/2` conditions, with root prices `grow * rootHit` (reserve `delta`) and `grow * salary` (reserve `i`).
- Its output is `(grow^3)^{-1} * collars i * (grow * salary * (1-1/2)^{-1})`.
- `grow G L s = betaF^{3/8}` (`Height/Highway.lean`), which is the chapter's `D = z^{3/8}`.
- `collars` is a polynomial reserve price at `i` (`Census/Revenue.lean`), i.e. the factor `C_j e^eta eta^{-pj}`.
- The parameters need a gloss rather than a correction:
  - The source evaluates the second smallness condition and the output price at the same reserve `i`.
  - The manuscript, following C08, uses a reserve `y >= i` for both.
  - The source's condition at `i` implies the manuscript's at `y`, and the manuscript pays the extra `e^y`. The two statements are consistent.

## Larger step and patch (`uniform-stationary-chart.tex`)

- `YM.Bid.Larger S` (`YM/Bid/Station.lean`) is `S.patch.Branches S.kernel G ∧ 100 * macroR S.patch <= f.val ∧ 1 < c.val`.
- `YM.Pressure.macroR P = P.radius + 4 * P.L.val` (`YM/Pressure/Cost.lean`), where `radius = (J+3) * L.val` (`YM/RG/Patch.lean`).
- The structure `YM.RG.Patch` has `order_cut : 4 <= J`, `coarse : 3 <= L.val` and `odd_side : Odd L.val`.
- The chapter's `R_macro = (j_ph+7) l`, with `l >= 3` odd and `j_ph >= 4`, therefore matches.

## Nonwrapping (`regular-principal-producer.tex`)

- `YM.PhysicalNext.JointLoad.Heir.Short S B X` is `(coverNumber B.B X)^3 < S.patch.L.val` (`YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Depth.lean`).
- `YM.PhysicalNext.JointLoad.Heir.short_nonwrap` additionally takes `B.B <= 2 * radiusB x`, `100 * (1 + radiusB x) <= c.val` and `o ∈ X`.
- These match the three hypotheses the edit adds. The chapter writes `B_c` for `radiusB x` and `B_f` for `B.B`. I took that identification from the chapter's notation and did not trace it further.

## Door and grade quantifiers (`heading-history-handoff.tex`)

- `YM.PhysicalNext.Repeat.Legato.Bandage.chorus` (`YM/MergeProof/Escarp.lean`) states `∃ D : GaugeDoor ..., Climbs ... D ∧ ∀ d, d + 3 <= J m → Tune (localSection G d) ... D (waybill ...)`.
- So there is one door for all grades, and a `Tune` for each grade.
- This matches the edit's "heading chosen for that frame and may depend on d", with the transition and marked map common. The finite slot set built in the proof also agrees with the chapter's union of ordinary and forced slots.

## Marked leaf (`marked-kernel-convergence.tex`)

- `YM.PhysicalNext.Repeat.Lotus.Leaf R` (`.../Lotus/Postcards.lean`) is indexed by the representation `R`. Its fields are:
  - support scoping;
  - eligibility `grant : ingredient U ≠ 0 → turn.qualifies R U`;
  - `blank : turn.blank R`;
  - a uniform bound `earn`, gauge invariance and measurability.
- A comparison of two backgrounds therefore needs these conditions for each `R`, including a blank entry in each. That is what the edit states.

## Not checked

- I did not read the C03, C08 and C11 producer proofs in the source.
- I did not check the definitions behind the retained analytic inputs.
- I did not check the applications to the selected history.
