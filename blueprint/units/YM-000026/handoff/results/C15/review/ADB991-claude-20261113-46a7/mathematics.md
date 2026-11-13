# Mathematics review: what was checked

Session `ADB991-claude-20261113-46a7`. Line numbers refer to the files at `13f52dd6` (hashes in `inspected-sha256.txt`).

## `trace-small-means.tex`

**Setup.** `V` is the space of real, signed-equivariant arrays, and `B` is the raw-label analogue (repair G1(a)). Signed permutations act transitively on the axes, so an element of `V` is determined by its entry `y_0`. This is consistent with `λ_w` reading only `Y_0` (l.108–109), so the separation input (1) is not vacuous.

**Night condition (l.83–87).** The central inversion fixes every axis and has sign −1 on each. Signed equivariance therefore gives `F(archV) y_α = −y_α`. Correct.

**Detector (l.157–183).**
- Each `λ_w` is real-linear on the finite-dimensional space `V`, with values in ℂ.
- If the common kernel is zero, finitely many functionals already have zero common kernel. Correct: a minimal-dimension argument on finite intersections of kernels.
- `Λ_i` is real-linear. This needs the chart `U_i^{(5)}` to be linear (see N1) and `p` to be complex-linear in the grade-five slot.
- By input (2), `Λ_i → Λ` pointwise. Evaluating on a basis then gives operator-norm convergence.
- With `2c = min_{‖y‖=1} ‖Λy‖ > 0` and `‖Λ_i − Λ‖ ≤ c`, we get `‖Λ_i y‖ ≥ ‖Λ y‖ − c‖y‖ ≥ c‖y‖`. Correct, and the degenerate case `V = {0}` is handled.
- Input (2) is applied with `ξ_i = ζ_i^pt`. Then `ζ_i^pt → (e_0, 0)` because `b_i^{-1}⌈b_i⌉ → 1` and `b_i^{-1} → 0`, which needs the scale input `b_i → ∞` (l.97). The lemma takes the detector bound as a hypothesis, so the lemma itself does not need `b_i → ∞`.
- The two-point configuration is `r_i ζ_i^pt = (a_i(⌈b_i⌉,1,1,1), 0)`, which follows from `r_i = a_i b_i`. Its two points are distinct lattice points. Correct.

**Rate (l.185–209).**
- Tickets multiply with rates adding. This is the elementary choice `ρ' = ρ + t` for each factor.
- The zero-rate ticket for `β̂_{summit(j)} ≤ 2β̂_j` holds because `p log(2β̂_j) = o((log β̂_j)^48)`.
- `Θ` has rate `−100δ`, since `exp(−100δL) ≤ exp(ρ'L)` for `L ≥ 0` and `ρ' > −100δ`.
- The product has negative rate and so tends to 0 as `β̂_j → ∞`. Composing with `j_i → ∞` is fine; no monotonicity of `j_i` is needed.
- `δ = 10^{-4}` matches `Θ_i = exp(−(100/10^4)(log β̂_{j_i})^48)`.

**Lemma proof (l.227–254).** Recomputed:
- `U(Y_0) = z^p U(s_i(v_i)_0)`, then by (spun-response) `= z^p V_i(v_i(0))`, then by (medium-core) and real-linearity of `V_i` `= z^p ζ_i^{-1} V_i(E_{k_i}(x_i(0)))`, then by (night-scaling) `= z^p ζ_i^{-1} c_i P_5 x_i(0) = z^p (a_i b_i)^5 P_5 x_i(0)`.
- Pulling the positive real `z^p b^5` out of the complex-linear slot, then using the price bound and `b_i ≤ m_i`, gives `‖Λ_i Y_i‖ ≤ √m z^p m_i^5 Θ_i → 0`.
- The detector then gives `‖Y_i‖ → 0`. Correct.

**N1.** The proof uses the real-linearity of `U_i^{(5)}` (l.232), and the operator-norm argument (l.170) uses the real-linearity of `Λ_i`, which needs the linearity of `U_i^{(5)}`. The setup (l.10–12) calls `U_i^{(d)}` only a "scale chart". In the source, `X.U i d : Spin.change S d` is a linear equivalence (`Ears.lean` l.98, `Terrain.lean` l.42). Suggested wording: "the linear scale chart (a complex-linear isomorphism)".

## `trace-crown-buffer.tex`

**Small tail (l.69–81).**
- From `100000 G_k Lyra(k) ≤ Π_k/32`, `Lyra(k) ≥ 1` and `0 ≤ G_i ≤ G_k`: `2Π_k ≥ 6.4·10^6 G_i ≥ 120 G_i`, which is the exponent `1.2·10^6/10^4`. Correct; `G ≥ 0` holds because `Gate = (log ·)^48` is an even power.
- `F_i(1) ≥ 3` holds once `G_i ≥ 10^4 log 3`. Correct.

**Soils (l.133–146).**
- `|E[B h]| ≤ Z^{-1} ∫ ρ |h|`.
- On the healthy set the contribution is at most `U_0 Z^{-1} ∫ρ = U_0`.
- On the complement, `|h| ≤ V_0 ≤ V_0 Σ_{x ∈ P'} I_x`, and the one-site bound gives `V_0 |P'| exp(…)`. Correct, given that "healthy for P'" means "no flag at a site of P' exceeds b" (N3).

**Funeral (l.155–176).**
- With `y > 0`: `y^6 + 2q ≤ m²/(2560y) ≤ Cm²/2560` (from `1/y ≤ C`).
- `C m²/2560 = C x ϑ²/2560 = (x/2)(C/5)(ϑ/16)²`.
- This is at most `β_k (C/5) b²` (from `β_k ≥ x/2` and `C > 0`).
- Subtracting from `(A_{k−1}/A_k)^4 Treasury ≤ y^6` gives `≤ −2q`. Correct (and see O3).

**Good term.**
- `F(−1.2·10^6) · F(1.5·10^5) = F(−1.05·10^6)`. Correct.
- The sup-root bound: a field bounded by R has root at most R, because every tiling copy is bounded by R. Correct.

**Exception.**
- `D_a g_b` is bounded by `F(6.5·10^5)` everywhere and by `F(−3.5·10^5)` on the healthy set of the translated support.
- With `|P'| ≤ F(1000)` and `e^{−2Π_k} ≤ F(−1.2·10^6)`, the exponent is `650000 + 1000 − 1200000 = −549000`. Correct.
- The common window `max{l, l_4}` makes the product identity applicable, because both room conditions hold. Correct.

**Proposition.**
- The three terms are each at most `F(−31000)`, since `F` is increasing in its argument (`G_i ≥ 0`). Then `3 ≤ F(1)` gives `F(−30999) ≤ F(−30000)`. Correct.
- `i_0` depends only on the two scale receipts and on `3 ≤ F_i(1)`. This matches the stated uniformity.

**M1 (required, minor).**
- The proof of `lem:ex-trace-crown-good` rests on a "translated form of the tiled-product inequality, for two fields placed at the two distinct cells". The text only sketches it: "Its proof represents each anchored factor by a tiling copy of an oriented, possibly conjugated chamber-interior field; this preserves the rooted functional."
- The seam condition, as defined at l.42–50, bounds products of *tiling copies* `T.copy(q, h_q)`. `Q(w, g)` is instead a product of *translates* `B w ∘ translate_{α(a)}`.
- Passing from translates to copies needs three things, none proved or cited in the chapter:
  - (i) each translate equals the prescribed copy, at the same cell, of an oriented and possibly conjugated chamber-interior field;
  - (ii) that field has the same root test (conjugation does not change `|E[·]|`, and orientation is a relabelling of the cells);
  - (iii) the other cells are filled with the constant 1, whose root is 1.
- l.50–52 also says the seam condition "holds for every β ≥ 0 by reflection positivity", with no reference.
- The manuscript already has the producers:
  - `prop:ex-centered-planted` (`centered-estimates.tex`, eq. `eq:ex-centered-seam-planted`): the planted bound for injectively placed prescribed copies;
  - `prop:ex-lattice-finite-reflection` (`lattice.tex`): Wilson reflection positivity.
- Requested: cite these two, and prove (i)–(iii) in a few lines, or state them as an explicit input. Also check that the definition of "copy" in `centered-estimates.tex` (reflection in each odd-coordinate axis, conjugation at odd parity) is the one used in this chapter's `T.copy`.
- The "subadditivity of `R_T`" clause of the seam condition is not used (l.51–52 says so). It would be cleaner to drop it from the definition, or to cite a source for it.

**N3.** "Healthy" appears at l.90 before any definition. The intended meaning (every site of P has flag at most the threshold) is implicit only in l.134–137. Define it at l.90.

**N4.** `lem:ex-trace-crown-exception` assumes the one-site estimate "at b = ϑ_k/16". The estimate itself (l.132–133) needs `2b ≤ ϑ_k`, which holds, and room for the radius-eight indicator, which is not among the lemma's hypotheses. Add it or say it is part of the receipt.

## `trace-price-recurrence.tex`

**Contraction (l.47–52).** `P_j I_j / I_{j+1} = P_j κ_{j+1} / (p_j κ_j) ≤ 2P_j/p_j ≤ 1/2`, using `Γ_j = Γ_{j+1} p_j` and `κ_{j+1} ≤ 2κ_j`. Correct.

**Termwise differentiation (E3, l.145–170).**
- The induction on the list length is correct. `𝒟` is open, so the increment curve stays in `𝒟` for small `|t|`.
- Along the one-parameter curve `W(t)`, the derivative at `t = s` of `h(W(t))` is `∂_{A_1} h(W(s))`. This holds because `W` is the increment curve in the fixed direction `A_1`.
- The derivatives are dominated by the summable sequence `u_a` uniformly on the interval, and the series converges at 0. The termwise-differentiation theorem therefore gives differentiability and the derivative of the sum.
- The induction hypothesis at every `W(t)` identifies the sum with the lower-order derivative of `g`. Correct. (O4: citation.)

**Truncation and tail (l.172–219).**
- `G_D` has zero probe, by finitely many applications of the vanishing property.
- The derivatives of `g − G_D` up to order `d` at the identity are bounded by the omitted sup-mass. This follows from (derivative-sum).
- Wrapping terms: `W ≤ e^{−σh} M(X, W)` once the cover radius of a wrapping support containing 0 is at least `h`. This is asserted with a one-line reason, which is acceptable as elementary.
- Letting `D ↑ ℐ_0` gives `π(τ) M_d e^{−σh}(a+b)`. Correct, given the polarization estimate (S1).

**S1.** The statement at l.98 ("if two functions are of class C^d near the identity and all ordered directional derivatives … are bounded by c, then … differ by at most π(τ) M_d c") is a substantive lemma. It combines:
- a polarization bound for symmetric multilinear forms (the source's `polarCost q = 2^q (q+1)^q` per order);
- a chain-rule expansion through the probe's test curve.

It has neither a proof nor a citation. The source proves it (`Cub.speedTest`, which uses `polarizes`). Since `prop:ex-lattice-trace-sharp-read` assumes (one-step) directly, the proposition is unaffected. The derivation of (one-step), however, is complete only modulo this lemma. Requested: a short proof, or a precise reference for the polarization inequality plus the chain-rule step, or listing it as an input.

**Coefficient recovery (l.221–239).** The probes jointly separate coefficients, so `max_τ |R_τ|` is a norm on a finite-dimensional space; norm equivalence gives `T_d`. Correct. Separation is asserted ("the probes jointly separate coefficients"). That is a property of the probe family and is acceptable as stated, but it is an assumption.

**Gas bound (l.262–277).**
- `Σ_{b finite} ∏_{j∈b} a_j = ∏_j (1 + a_j) ≤ exp Σ a_j` for summable `a_j ≥ 0`, by monotone convergence over finite truncations.
- Erasing `i` is injective on the sets `b ∋ i`, so each dressed multiplier is bounded by `C_gas`. Correct.

**Costs (l.246–255).**
- Regular terms contribute `s_j a`, and forced terms contribute `s_j (y b)/y = s_j b`. The total is at most `s_j r_{j+1}`, and likewise with `ρ_j`. Correct.
- The coarse-budget and uniqueness comparison gives the second line of (one-step), with `𝔠_d e^{−σh} ≤ ε_j`. Correct. The insertion paragraph is the author's N3 (not checked line by line against `Surrey.include_one`). It stays an explanation, not a certified proof.

**Lemma (one-step propagation).**
- `‖x_{j+1}‖ ≤ P_j(‖x_j‖ + s_j t/Γ_{j+1} + ε_j t H_j)`.
- Term by term: `P_j s_j t/Γ_{j+1} = t P_j b_j I_{j+1}` and `P_j ε_j t H_j = t I_{j+1}/10`.
- Total: `≤ t I_{j+1}(1/2 + 1/6 + 1/10) = (23/30) t I_{j+1}`. Correct.
- The bound `r_j + P_j‖V x°‖ + ρ_j r_{j+1} ≤ t H_j` uses `‖V_L x°‖ ≤ L^d ‖x°‖`. Correct.

**Proposition.**
- The cone parameters match `reference-cone.tex`: `q_i = p_i = L_i^{1/8}`, `ε_i = p_i^{-3}`, `s_{i+1} − s_i = log L_i`, so `Γ_j = e^{(S_k−S_j)/8}`.
- The bank inequality is the second clause of `eq:reference-bank` with `C_i = c_i`.
- The induction from `x_m = 0` to `j = k` with `Γ_k = 1` gives `κ_k ‖x_k‖ ≤ 4(1+c_k)w`. Correct.
- A finite intersection of eventual period sets is eventual, and every step is uniform in `N ≥ k`. Correct.
- The case `m = k` is handled.

**N5–N7:** see the table in `README.md`.
