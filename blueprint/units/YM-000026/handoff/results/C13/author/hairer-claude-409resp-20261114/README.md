# Author response to review #409 (C13 (G3) additions)

- **Session:** `hairer-claude-409resp-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/375#issuecomment-6882971826 (scope note 6882995501).
- **Base:** `codex/existence-monograph` @ `edd3c4e`. **Pin:** `3456e5e`.
- **Review answered:** `results/C13/review/schmittj-claude-g3-20261114/` (Q1–Q5).

## Q2: route through the upper interval

The source route is adopted. In `allarity-marked-propagation.tex`:

- **Two weights.** The leading interval [ℓ, k] is run at ω₋ = H^{1/(8u)−U} (`eq:allarity-upper-weight`). From the launch down to the output torus the weight is ω = H^{1/(8u)}.
- **Leading budget.** The leading budget H^{−4} at ω₋ is now proved (`lem:allarity-leading-budget`) from an unweighted bound H^A, by choosing U ≥ A + 4 + 1/(8u). The H^A bound is an input. The old open item, "we have not located the normalization", is resolved this way. Source: `loot`, `divySky`, `Caff.lit`.
- **Withdrawn lemmas.** `lem:allarity-upper-retuned` and `lem:allarity-forced-retuned` are removed. The corrected recurrence on every rung is false at the top (coefficient −κ), as M2 says. M4, the retuned multiplier, disappears with them: on the leading interval l ≤ max(1, H^{q−3}), as purchased in the compiler section.
- **The launch.** `subsec:allarity-corrected-budget`, now titled "The launch at the middle level", has four parts:
  - the commuting reference factor, qualified;
  - the failed-mask identity χW − R = χ(W − R) − (1 − χ)R (M3);
  - `lem:allarity-corrected-pieces` at the middle level, and input **(W)** for the regular remainder at the restored weight. The factor H^{Un} applies to single-cell letters. For multi-cell letters, `lem:allarity-weight-raise` gives a sufficient condition using a spare support exponent and a covering-number bound on the same letters.
  - the stated input **(L)**, failed-mask regrouping and forced weight change, with forced output ≤ H^{c_L} η₋, and `prop:allarity-launch`: regular ≤ H^{−3/4} and forced ≤ H^{−q} at ω, under (W) and (L).
- **Middle-level receipt (M1).** The lower propagation now starts from H^{−3/4} and needs (α+1)^{ℓ−w} ≤ H^{1/4}. `lem:allarity-lower-count-free` now proves this for every fixed positive power. Source: `Perch.spouse`.
- **Amplitude (M5).** `lem:allarity-amplitude` is restricted to the middle level. The per-rung amplitude κ_τ < 1/2 is now a hypothesis of `lem:allarity-step-discrepancy`, and it appears in the input list.
- **Parameter order.** α, b̄, then U, then q ≥ max{6, κ+4}. The sufficient condition for (W) also uses q ≥ κ+Un+2. All of these are fixed before s.

## Other items

- **E1:** the line was in the withdrawn `lem:allarity-forced-retuned`. The analogous condition in `lem:allarity-step-purchases` is now stated as H^{−1} ≤ log 2.
- **E2:** the launch uses the realigned G(x_ℓ) (`prop:allarity-launch`, forced part).
- **M6:** `lem:allarity-step-charge` now *defines* X_{c,I} as the set of sites within QB of every reader of I in cell c, with Q ≥ a. It assumes a reader separation > 2QB between cells and proves the three geometric hypotheses, with R_e = exp{e(⌈Q⌉+1)⁴}. Source: `d_olmSky`, `roomTestSky.radius`; the source takes Q ≥ a+10.
- **M7 and M8:** in `actual-rank-purchases.tex`, the tested readout and the change of stage profile inside the window are now stated inputs, (T) and (V). The proposition assumes them.
- **S1:** `prop:allarity-output-price` states the root conclusion for u = M, and notes what holds for general u.
- **S2:**
  - There is now one current status list at the end of `sec:allarity-marked-propagation`.
  - The block-length floor and the old step-count purchase are removed.
  - The optional margin purchase is restated as q ≥ κ + uV + 2.
  - The rank-root sentence on the bracket now cites `lem:ex-lattice-firesky-clock-fields`.
  - The receipt and rank-root sentences about a "constant" weight are corrected.
- **S3:** ϑ_j = θ_j, the protection exponents of `sec:common-scale-selection`.
- **S4:** errata are appended to the author records 375, 376, 376count, 378 and 390. The original text is kept.

## Not done (remains open)

- (L) is not proved.
- The unweighted bound H^A, the per-rung amplitude, and the reader separation 2QB are inputs.
- (T), (V), the (F3) representation comparisons and the (F5) stamp duty remain open (#398).

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references in `existence.log`.
- The launch section was inspected in the rendered text (`pdftotext`).
- `python3 scripts/check_blueprint.py`: OK.
- The Lean source was read textually for `loot`/`cashFt` and `divySky` (`Dink.lean`). No Lean was elaborated.

## Follow-up to the review of #411

The nonleading regular alphabet can contain mixed-cell letters.
`YM.Next.Rank.Dock.Change.Reception.regular` (in
`Lean/YM/Next/RANK/DockBudget.lean`) distinguishes the single-cell and
mixed-cell receipts, and `YM.Next.Rank.Dock.Change.mixed_cost` uses `dispersal_cost` to trade
support charge for marker weight. The manuscript now proves that trade
under an explicit support inequality and leaves the corresponding
spare-exponent purchase on the actual regular remainder as an input.
This does not use the separate forced-background receipt (L).
