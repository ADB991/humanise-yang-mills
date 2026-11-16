# Mathematical review: `lem:actual-derivative-shift-payment` (PR #282 @ 5f664eb)

Line numbers refer to `manuscript/existence/actual-insertion-derivative-relay.tex` at the PR head unless stated otherwise. Cited chapters are unchanged from base `69b2631`.

## What the lemma claims

On the funded common history, at each level `N ≥ 0`, let `q_N, w_N` be the order and power of the level-`N` top budget, i.e. of the stage profile `J(N)`. Then `1 ≤ J_N := 2^{w_N q_N} ≤ β̂_N` for every period. Along every extraction order and every refinement, `J_N` is subpower. So the protected prices `(J_N+1)c_{N,p}` and `2b_{N,p}` of the difference relay (eq. `relay-difference-weight`) are subpower whenever `c_{N,p}, b_{N,p}` are.

Before this PR the bound `J_N ≤ β̂_N` was an unproved hypothesis, and only "for all sufficiently large N". The lemma replaces it.

## Step-by-step check

1. **The profile-cost clause.** In the calibration section (`marked-portfolio-calibration.tex` l. 223–253), the delay is built pair by pair. For a fixed stage `i` and its adjacent profile `j` (`j ≤ i ≤ j+1`), the conditions are that `x` exceeds the fixed profile cost, the finitely many credits, and the tail comparison. Each holds on a tail of `x`. The finite conjunction at stage `i` holds on a tail; prefix maxima, together with the earlier delay, give a monotone entrance delay `E_i`. Every `x ≥ E_i` then satisfies all clauses for the pair, and enlargement of `E` preserves them. The lemma's restatement (l. 119–133) is a faithful summary. **Caveat M1:** the calibration text never says what "the fixed profile cost" is. The lemma's `C_j = (2^{w(j)})^{q(j)}` is the source's `step_cost`. Mathematically nothing is lost, because the finite-threshold argument works for any fixed finite number attached to the profile, and the lemma itself says so (l. 125–127). But "says precisely" overstates what the cited text contains. Suggested fix, inside the owned file: "We take the fixed profile cost of Section 161 at stage `j` to be `C_j`; the finite-threshold construction there applies to it because `C_j` is a fixed finite number determined by the profile." Alternatively, a follow-up task could define it in the calibration section.

2. **Retention in the common history.** `common-observable-purchases.tex` l. 266–284 includes the calibration's entrance delay among the entry delays before the final delay is selected. `common-scale-selection.tex` l. 238–255 lists it, "including its profile-cost, credit and tail clauses", in the final entry threshold `d_j` (item 1). So `E_j ≤ d_j`. ✔

3. **Payment at every level, including N = 0.** `common-scale-selection.tex` l. 88–95: for `J(m+1) > j_*` the entries hold by the choice of `b_{j-j_*}`; on the first plateau `β̂_m ≥ β_* ≥ d_{j_*}`. Hence `d_{J(m+1)} ≤ β̂_m` for every `m ≥ 0`. `J(m) ≤ J(m+1) ≤ J(m)+1` is the step property of the stage map, also used by the calibration caller (l. 266–269). ✔ The old "for all sufficiently large N" qualifier is therefore correctly removed. The credit clause still needs `d ≤ J(N)`, which holds only eventually, but the profile-cost clause has no grade and holds at every `N`. The lemma uses only the latter. ✔

4. **Identification of the budget.** The relay's `q_N, w_N` are defined (l. 89–91) as the order and power of the top budget. The lemma's statement fixes them as those of the profile at stage `J(N)`. This matches the source (`params_eq`, `Levels.budget`; see `lean.md`). Then `C_{J(N)} = (2^{w_N})^{q_N} = 2^{w_N q_N} = J_N`. Integer order and power give `J_N ≥ 1`. ✔

5. **Period independence.** `β̂_m = β_* + s_G s_m` (common-scale-selection l. 60) does not depend on the period `P_p`, and neither does the profile. ✔

6. **Subpower.** The relay uses the ordered-cutoff notion of `actual-equation-kernel-relay.tex` l. 126–133: for every `η > 0`, the norm is eventually at most `e^{η s_N}` on the ordered filter. `β̂_N = β_* + s_G s_N` is affine in `s_N` and `s_N → ∞`, so `β̂_N` is subpower. **M2:** the lemma asserts this (l. 149) without a reference; cite common-scale-selection l. 60 or calibration l. 486–487. Domination `0 ≤ J_N ≤ β̂_N` transfers subpower to `J_N`, and refinement keeps eventual statements. ✔ The explicit products are correct. With `J_N, c_{N,p} ≤ e^{εs_N/3}`, `J_N ≥ 1` and `c ≥ 0`, we get `(J_N+1)c ≤ 2J_N c ≤ 2e^{2εs_N/3} ≤ e^{εs_N}` once `e^{εs_N/3} ≥ 2`. Similarly `2b ≤ e^{εs_N}` from `b ≤ e^{εs_N/2}`. ✔ No exchange of period and mesh limits is involved.

## Notation (N1) and a remark outside the PR (N2)

- N1. In the cited calibration section, the stage-`i` profile's order and power are `k_i, P_i` (l. 177) and `w_d` is the tail exponent (l. 226). The lemma's `q(j), w(j)` reuse `w` for a different object. The pre-existing symbols `J_N` (shift factor) and `J(N)` (stage map) are now juxtaposed (l. 140–144). Both are readable in context but invite error. Optional.
- N2. `common-observable-purchases.tex` l. 277–279 reads "at every transition from stage `j` to stage `i` and every coupling `x` beyond the entry delay of stage `j`, the profile-cost bound, the credit bounds for all grades `d ≤ i`". For this to agree with the calibration caller and with source `dusk`, `j` must be the entrance stage and `i` the profile stage. That is the reverse of the natural reading of "from `j` to `i`". The lemma does not rely on that sentence's indices. Not a finding against #282.

## Literature

The step is an inequality substitution plus elementary exponential domination. I agree with the author that no external theorem is needed. I searched `blueprint/background/` and `Bots/` for "profile cost", "shift" and "step_cost" and found no relevant note.

## Verdict

Mathematically correct as stated, conditional on the section's retained hypotheses (funded history, simple group, service, reserves, keepers, opened-scale bounds). Two minor citation and wording recommendations (M1, M2); no required change.
