# Mathematical review: five local C15 chapters

Session `hairer-claude-c15-local-20261114`. Targets are the full texts at
`codex/existence-monograph` commit `dcbdcc8d` (hashes in `hashes.json`).
This review checks every displayed step against the chapter's own stated
hypotheses. It does not construct or certify the incoming receipts that each
chapter explicitly leaves open.

**Verdict: no blocking mathematical defect in any of the five chapters.**
Every proved statement follows from its stated hypotheses, with the
constants and exponents as printed. Five non-blocking editorial findings
(E1–E5) are listed at the end.

## `trace-medal-prices.tex`

- *Preliminary.* If f has rate α < 0, then χf has rate α because χ has
  rate 0 and rates add. Taking v in (α, 0) gives χf → 0 because β → ∞. Correct.
- *Cloud price (Lemma `lem:ex-lattice-medal-cloud-price`).* The poster
  coefficient has negative rate q/4, so χ|p_Q| → 0 and eventually
  |p_Q| ≤ a/χ. The attenuation lies in (0, 1] and m_R(Z) ≥ 0. The threshold
  depends only on x, so the bound is uniform over clouds. Correct. The
  auxiliary choice of v in the proof is redundant but harmless.
- *Gas price.* With t = log log β, log H = t² and H^{1/5} = e^{t²/5}, so
  log(χg) = t²/2 − e^{t²/5}/2 → −∞. The factor L^{−2/5} is a fixed positive
  constant. Correct.
- *Tuition price.* A = 4(2b+1) with b = ⌈(log x)²⌉, and β = x + c_L, so A is
  polylogarithmic in β and has rate 0. P_{1/2}(sn) is constant. e^{−b/2} has
  every negative rate, since b/2 ≥ c log β eventually for each c. For c >
  max(0, −q − z), the product has rate −q − c < z. Specialising to z = −1
  gives (4) via the preliminary. Correct.
- *Closing paragraph.* The assignment of prices (cloud and tuition at z, gas
  at y, both fixed before the threshold in x) is consistent with the
  lemmas. See E1.

## `trace-local-paid-budgets.tex`

- *Lemma `lem:ex-lattice-local-budget-choice`.* Take K = Σ q_τ ≥ 0 and B ≥ 1
  as displayed, v = y/(2B) and u = (1+K)v. Then:
  - q_τ v ≤ Kv ≤ u, using q_τ ≥ 0.
  - O(Wu + 2Hav) = vO(W(1+K) + 2Ha) ≤ Bv = y/2.
  - 4OHav ≤ Bv.
  - O(Wv + 2Havc) = vO(W + 2Hac) ≤ Bv.

  All four inequalities hold with room to spare. The empty probe family (K = 0) is
  covered. Correct.
- *Finiteness of I_j.* The conditions i ≤ j ≤ i+1 allow at most two stages,
  and d + 2 ≤ j makes d range over a finite set. The text's "{0,…,j−1}" is a
  correct superset (it is the enumeration range used in the source). Correct.
- *Lemma `lem:ex-lattice-monotone-threshold`.* The prefix maximum of e_j is
  nondecreasing, dominates b_j, and dominates every E_{j,s}. Correct.
- *Application paragraph.* The budgets for each (i,d) are chosen from
  y_{j,i} before the eventual threshold. The extra smallness requirement
  ε ≤ 1/4 is stated. The local atom estimates are explicitly left as inputs.
  The order of quantifiers is correct.

## `trace-local-charge.tex`

- *Field bound.* ‖σX‖_∞ = σ‖X‖_∞ ≤ σ s(X) ≤ θ^{−2}θ²W_{1/6}. Correct.
- *Flux bound.* Applying ℓ to the decomposition, the K′ term vanishes and
  the B′ term equals h/12. This gives ℓ(σX) − m/12 = ℓ(σW) + ℓ(σD′) + ℓ(σE)
  + ℓ(σL) + (h−m)/12. Each of the four terms is at most ‖ℓ‖θ^{−2}s(·) ≤
  ‖ℓ‖W_{−1}, and |h−m|/12 ≤ c(t)/12. The coefficient 4 is exact. Correct.
  Here ‖ℓ‖ is the operator norm with respect to ‖·‖_∞ on Y^I, which is implicit
  in "continuity gives" (E5).
- *Payment accuracy.* |ℓ(σX) + κ| ≤ |ℓ(σX) − m/12| + |m + 12κ|/12, which
  gives the displayed bound with t^{−30} + t^{−100}. Correct. This is the #105
  repair (an inequality instead of an exact identity), and it is right.
- *Transfer paragraph.* This is a correct description of the further inputs
  (a W_{−1/4} transport bound and the arch comparison). These are stated as
  conditional and carried out in `subsec:ex-lattice-trace-weighted-route`.
  That consumer (lines 236–252 and 314–325 of
  `trace-weighted-estimates.tex`) cites the proposition with t = p_i and the
  accuracy bound, consistently.

## `trace-local-pairing.tex`

- *Scale.* t_i(a)t_i(c) = t_i(a+c). The scale is increasing in a when
  p_i > 1, and t_i(1) → ∞. Correct.
- *Negation invariance.* C_a(−F) = −C_aF because conjugation is real-linear.
  The n-fold product changes by (−1)^n, so 𝓡_i(−F) = 𝓡_i(F). Correct.
- *Telescoping identity* (`eq:ex-lattice-pair-telescope`). Verified by
  expansion; the pairing is bilinear (no conjugation in ⟨·,·⟩). Correct.
- *Estimate.* The four terms are t(−200), t(5)t(−300) = t(−295), and
  t(−200)(t(5) + t(−300)) = t(−195) + t(−500). Each is ≤ t(−195), so the
  sum is ≤ 4t(−195) ≤ t(1)t(−195) = t(−194) ≤ t(−100) once t_i(1) ≥ 4.
  Root bounds are applied only to the pairs (P, Q−V) and (P−U, V), as
  stated. Correct. The consumer `trace-mission-price.tex` (lines 145–152)
  repeats the same arithmetic.
- *Application subsection.* The four receipts are correctly identified as
  outstanding inputs. See E4 for a sign convention.

## `trace-local-rate-selection.tex`

- *Lemma `lem:ex-lattice-tail-pays-probe`.*
  - δ_k and C_1 agree term by term with `eq:ex-lattice-local-delta` and
    `eq:ex-lattice-local-C1` in `trace-row-jet-estimates.tex`, with b = ρ(x)
    and m = R(x).
  - exp(−σρ/2) with ρ = 45(1+b) ≍ (log x)² has every negative rate, and all
    other factors have rate 0. Hence E has rate −1 and C_1 has rate 0, so
    Z_d ∈ 𝓡_{−1} and χZ_d → 0.
  - E ≤ C_1 eventually, since E → 0 and C_1 ≥ 1.

  Correct.
- *Proposition `prop:ex-lattice-selected-local-budget`.* Each step was
  rechecked:
  - (18): S_X ≥ 48(1+a)(1+q) dominates 1 + 45(1+a), 8aq + 2q + 4a + 10, and
    ra + 8aq + 2q + 4a + 10. S_X ≤ B_* by monotonicity in q ≤ P_*.
  - (19): u/F_0 = H^{−1}(β(x)/β)^{1/2} ≤ √2/H, using β ≥ β(x)/2.
  - Segment ≤ b_0 t S^{2p+pn}, tranche ≤ (b_0+1)L³ζS^{2p}, and scratch
    ≤ 2ns_L²(D.Z+1)D.Z·ζS^{8+2pn}. Here 1 + heads ≤ s_LS⁴ follows from
    (2·scope+1)⁴ ≤ 16S⁴. Each power is at most 8 + 2p + 2pn. Summing gives
    boost and hence (21).
  - (22): clinicFee·v_R²/F_0 ≤ S_*F_0.
  - Then F ≤ A_*(F_0 + u/F_0) + S_*F_0 + u/F_0 = (A_*+S_*)F_0 + (A_*+1)u/F_0
    ≤ U_*, with the coefficient (2A_*+2)/H exact.
  - (23): meter = 2(1+h)^{m+1}inflate_m with m = 4(n+1), and (1+h)^{4(n+1)+1}
    ≤ s_L^{1+4(n+1)}S^{4(1+4(n+1))}.
  - (16): every fixed polynomial in 1+b is H^{o(1)}, because log Q =
    O(log log β) = o((log log β)²). The first term has rate −1/2. The second
    is ≤ 4H^{−1/4}.
  - (17): χ ≥ 1 and K_* ≥ 1 give F ≤ χU_*K_* ≤ 1. Linearity of the clock and
    d_* = 1 + clocks(1) give the second inequality.

  Uniformity: U_* and K_* depend only on x and the fixed constants. Correct.
- *Closing paragraph.* The remaining strip, growth, weighted-vanishing,
  same-history and chart receipts are correctly left open.

## Non-blocking editorial findings

- **E1 (medal-prices, closing paragraph).** The letter z is used as a price,
  while Lemma `lem:ex-lattice-medal-tuition-price` uses z as an arbitrary
  real rate exponent. Rename one of them. The chapter also does not say what
  the price z is in the selected construction. In the source it is the
  summability budget v of `lem:ex-lattice-local-budget-choice`, and y is the
  transition's target price y_{j,i}. A one-line cross-reference would make
  the same-data match visible.
- **E2 (local-rate-selection, proof of the proposition).** The proof uses
  source names that the text never defines: segment, tranche, scratch, rust,
  opal, paintW, loom, heft, ζ(B,u), gStep, bulk. The statement also uses
  fiery, heads, breadth, scope and coverNumber, which are introduced only
  inside the proof or not at all. Examples: fiery(x) = H(x)/√β(x) and ζ(B,u)
  = F_0 + u/F_0 appear only in passing, and "heads" never gets its formula
  (2·scope+1)⁴·#𝒞_L in the statement. The mathematics can be checked, because
  each quantity is eventually given by a formula. But AGENTS.md asks for
  ordinary mathematical language, without Lean scaffolding names, in the main
  text. Suggested repair: define F_0, ζ, heads, breadth and scope with the
  other quantities before (14), and name the three summands of the first
  three lines of (14b) once ("segment, tranche, scratch") instead of
  introducing "rust"/"opal".
- **E3 (local-rate-selection, notation clashes).**
  - β denotes both the function β(x) and the free variable with β ≥ β(x)/2.
  - t denotes both F_0 (in the proof) and the clock argument in (17).
  - P denotes the support datum, and also appears in P_n and P_*.

  None causes an error, but each forces rereading.
- **E4 (local-pairing, application).** The proposition assumes
  𝓡_i(P−U) ≤ t_i(−200). The probe's receipt, as described, bounds the root of
  the witness minus the marker, i.e. 𝓡_i(U−P). The negation invariance proved
  in the chapter covers this, but the text invokes it only for Q−V. One
  clause noting it also applies to P−U would close the gap in exposition.
- **E5 (local-charge).** State once that ‖ℓ‖ is the operator norm with
  respect to ‖·‖_∞ on Y^I, i.e. the maximum over directions of the norms on Y.
