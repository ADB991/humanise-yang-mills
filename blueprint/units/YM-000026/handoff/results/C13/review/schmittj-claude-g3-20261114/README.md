# C13 (G3) additions of 14 November: independent review (agent review, no human acceptance)

- Package: C13, issues [#375](https://github.com/hairer/humanise-yang-mills/issues/375), [#376](https://github.com/hairer/humanise-yang-mills/issues/376), [#378](https://github.com/hairer/humanise-yang-mills/issues/378), [#390](https://github.com/hairer/humanise-yang-mills/issues/390), [#398](https://github.com/hairer/humanise-yang-mills/issues/398); parent #54, umbrella #26.
- Role: independent reviewer, mathematics and textual Lean correspondence, reported separately (`mathematics.md`, `lean.md`). schmittj authored none of the reviewed text.
- Session: `schmittj-claude-c13-g3-review-20261114`. Claim: comment on #375, 14 November 2026, until 2026-11-15 18:00 UTC.
- Account and agents: submitted under `schmittj`. Three reading passes were run with GPT-6 Astra (a different model family from the Claude author sessions), one per part; a Claude session then re-read every finding in the LaTeX, and spot-checked the Lean text for the findings that rest on it (list in `validation.md`). Findings that I did not re-check in the Lean text are marked "reviewer pass only" in `lean.md`.
- Reviewed content, at `codex/existence-monograph` `7edd9c2c`, source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`:
  - Part A: `allarity-marked-propagation.tex`, `subsec:allarity-step-supply` (l.293–515, PR #387) and `subsec:allarity-corrected-budget` (l.768–933, PR #391).
  - Part B: same file, `subsec:allarity-output-transport` (l.588–767, PR #389) and `subsec:allarity-lower-count` (l.934–1053, PR #396 and follow-ups).
  - Part C: `rank-root-normalization.tex` l.279–421 (PRs #386, #401) and `actual-rank-purchases.tex` l.315–437 (PR #400).
  - The author records under `results/C13/author/hairer-claude-{375,376,376count,378,390,398,398clock}-20261114/`. Hashes in `hashes.json`.
- **Outcome: changes requested.** The elementary parts are correct: the invoice algebra, the cells-and-sites count, all step counts (including the removal of the block-length floor), the ticket calculation, the late-scale and endpoint lemmas, and every exponent we recomputed. Two inequalities are misstated and have one-line repairs (E1, E2). The chain from the corrected leading budget to the coefficient price at the output is not established as written: eight gaps (M1–M8), of which M1–M3 concern the same place, the passage through the middle level. None of them is a counterexample to the construction; in each case the source pays for the missing item explicitly, and we say where.

## Findings in brief

Required:

1. **M1 (gap, `lem:allarity-lower-propagation`, `prop:allarity-output-price`, l.644–675, 708–711, 995–1003).** The lower calculation has no leading letters, so at the middle level the corrected principal pieces become ordinary regular letters. The regular price entering the lower rungs is therefore `d_{k−ℓ} + cH^{−27/32}`, not `d_{k−ℓ} ≤ H^{κ−q}`. The repair is numerical: the sum is at most `H^{−3/4}` eventually, and the proof of `lem:allarity-lower-count-free` gives `(α+1)^{ℓ−w} ≤ H^{1/4}`.
2. **M2 (gap, `subsec:allarity-corrected-budget`, l.771–791, 808–815, 884–889).** `lem:allarity-corrected-pieces` holds at the launch level only, while `lem:allarity-upper-retuned` and `lem:allarity-forced-retuned` need the corrected budget at every leading rung. It cannot hold at the top: there the connected polynomial is `Σ z_i P_i` (l.203–206), so the corrected coefficient of `z_0z_1` is `−κ`, which is not small. The source does not run a corrected recurrence on the upper interval: it uses a leading budget `H^{−4}` at a smaller marker weight there, and launches the corrected invoice once at the middle level at the large weight. The author's posted finding on #375 ("never priced at H⁻⁴") is too broad in this respect.
3. **M3 (gap, l.781–791, 927–932).** Commuting the reference factor past the push is correct, but with a healthy mask `χ` one has `χW − R = χ(W − R) − (1−χ)R`. The last term is a forced contribution whose price is not controlled by the healthy bound on `W − R`. The source pays for it with a separate bound `‖C_i‖ ≤ H^{1/4}` on the reference coefficients.
4. **M4 (gap, `lem:allarity-upper-retuned`, l.835–871).** The new multiplier `l` exceeds the old one by a factor of order `H^{69/32}`. The compiler section buys its primitive body and hole estimates once, "for multipliers at least as large as both uses", and keeps them under decrease only (`actual-mixed-marked-compiler.tex` l.329–334). The check `l/x_i ≤ 1` pays the warning condition, not these. A hypothesis buying the compiler at multiplier `H^q` is needed.
5. **M5 (gap, `lem:allarity-amplitude`, l.1036–1053).** The constant bound is proved where the corrected-pieces hypothesis holds, at the launch level; `lem:allarity-step-discrepancy` needs the amplitude at each leading rung.
6. **M6 (gap, `lem:allarity-step-charge`, l.379–394).** The prescribed supports `X_{c,I}` are only required to contain the actual supports (l.54–61); nothing bounds their size, so the first subsection does not give the stated radius. Define them, or assume a radius. The source uses a separate radius parameter, at least `a+10`.
7. **M7 (gap, `prop:rank-trace-chart-window`(2), l.359–377, 414–437).** The readout `T_{k,N,p}` with the half-accuracy bound is attributed to `sec:allarity-coordinate-calibration`, which assumes a tested map `T` (its l.216–223) and does not construct one.
8. **M8 (gap, same proposition, "Block ratios", l.389–412).** `sec:restarted-rank-history` fixes one block ratio `L`. Taking the larger constant and later threshold for two ratios covers its numerical estimates, but not that the output of a step at one stage profile satisfies the hypotheses of the next step at another.

Errors with local repair:

- **E1 (l.898).** "`e^δ − 1 ≤ 1` since `δ ≤ 1`" is false as stated; the condition is `δ ≤ log 2`, which holds under the threshold already imposed.
- **E2 (`lem:allarity-lower-forced`, l.1011).** The forced budget at the transition is the realigned `G(x_ℓ)`, not the pre-realignment `G(x_ℓ)²` (l.225–232, 882–889). The argument survives with `G(x_ℓ)`.

Inaccuracies (S1–S4, details in `mathematics.md` and `lean.md`): the root conclusion of `prop:allarity-output-price` needs `u = M`; three status lists are out of date against later lemmas and against the gallery, which now displays the bracket, plateau and lawful-history fields; the loop exponent `ϑ_j` should be identified with the clock's protection exponent `θ_j`; several declaration names and roles in the author records are wrong.

## Requests to the author

- **Q1.** Repair E1, E2 and S1–S3 in the text.
- **Q2.** Decide the route through the upper interval. Either follow the source (budget `H^{−4}` at the smaller weight on the leading rungs, corrected launch at the middle level, with the failed-mask and weight-restoration purchases), or keep the corrected recurrence and state its per-rung budget, the larger compiler purchase and the per-rung amplitude as named inputs. Then state the middle-level receipt with the total regular budget (M1).
- **Q3.** Define the prescribed supports or assume their radius (M6).
- **Q4.** For `prop:rank-trace-chart-window`, either prove a local readout lemma and a variable-profile one-step interface, or move item 2 and the stage change to the list of outstanding inputs (M7, M8).
- **Q5.** Correct the author records (S4).

## Checked and not checked

Checked: the passages listed above, line by line; the cited manuscript inputs as far as each finding needs; the declarations listed in `lean.md`, as text. Not checked: no Lean elaboration, build or axiom print; no rendering of the pages (no manuscript file is changed here); the analytic suppliers behind the cited sections; the rest of C13.

This review records no human acceptance and changes no machine-readable review status.
