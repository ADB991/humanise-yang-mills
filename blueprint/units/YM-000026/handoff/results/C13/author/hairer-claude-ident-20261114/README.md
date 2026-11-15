# Identification of the prescribed polynomial with the reference integral

- **Session:** `hairer-claude-ident-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/375#issuecomment-6884212395
- **Base:** #421's branch. **Pin:** `3456e5e`.

## Established

- **Moment–cumulant identity.** `eq:allarity-moment-cumulant` holds in the marker algebra: log_* has exactly the partition coefficients of the connected polynomials of `sec:marked-healthy-cumulant-launch`. The proof counts the j! orderings of each partition, and exp_* and log_* are mutually inverse because the algebra is nilpotent.
- **`lem:allarity-prescribed-reference`.** If the Gaussian history is transported by the reference integrals 𝒢_i (q^{(i−1)}_T = 𝒢_i q^{(i)}_T), then D^{(i−1)} = log_* 𝒢_i(exp_* D^{(i)}). This is exact: 𝒢_i is linear and unital, applied coefficientwise.
- **`lem:allarity-step-discrepancy`, rewritten.** The actual projected polynomial is log_* of the normalized actual-sector integral of exp_* D^{(i)} (from `eq:planted-selection`–`eq:planted-integral`).
  - The comparison `eq:principal-comparison-final` is applied to the moment insertions q_T, which are bounded by b_n max(1, τ)^n, and to 1, which gives the normalization.
  - The difference of the logarithms is then bounded by the Lipschitz constant C_n K^{n−1}, so y has upper exponent −1/2.
  - The amplitude hypothesis is now "upper exponent 0", which `cor:allarity-rung-amplitude` supplies. The old κ_τ < 1/2 would not survive the n-fold products.

## What remains, and what to check

- **The convention** that the Gaussian history on the leading interval is transported by the reference integrals 𝒢_i, i.e. that the prescribed moment polynomials are defined this way. The text now says that the transport bounds of `sec:marked-healthy-cumulant-launch` must then be applied with 𝒢_i as the step. That section's step is a linear substitution followed by Wick contraction; 𝒢_i adds the density ratio R_9 and the cutoff χ_9. A reviewer should check that the norm bound A_{nK} per step still holds for 𝒢_i. (I) It should, up to the jet bounds on R_9χ_9 used in `sec:principal-gaussian-comparison`.
- (U) **The compiler's output.** I read the output leading letters as log_*(𝒜_i(exp_* P)/𝒜_i(1)), with the scalar factor going to the unmarked normalization. This is my reading of `actual-mixed-marked-compiler.tex` l. 235–249 together with the planted integral.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- The rendered lemma was inspected.
- `python3 scripts/check_blueprint.py`.

## Follow-up to the reviews of #423 (2026-11-15)

The reviews of 643c722 and 86c0fd0 asked for one common insertion in the two integrals, a bounded transport, consistent use of masked moments, and an inverse bound in the jet norm for the normalization. I agree with all four points.

Changes in `allarity-marked-propagation.tex`:
- **One insertion.** The insertions are now the masked moments Q_T of D_χ = Σ χ_I c_I z_I, defined through exp_* D_χ = 1 + Σ Q_T z_T. They are used in both integrals. Unmasked moments are no longer used.
- **Hypothesis (CI).** It has three parts: (a) the compiler integrates exactly Ã_i(exp_* D_χ); (b) D^{(i−1)} = log_* 𝒢_i(exp_* D_χ), and this is the Gaussian history used at the middle level and at the launch; (c) bounded transport ‖𝒢_i(Q_T)‖ ≤ τ_n in the jet norm. The Wick route 𝒯_i remains an alternative, which replaces (c) with a tail bound.
- `lem:allarity-prescribed-reference` now states the moments of D^{(i−1)} under (CI)(b).
- **New `lem:allarity-jet-inverse`.** In the jet ℓ¹ norm, which is submultiplicative with ‖1‖ = 1, ‖a − 1‖ ≤ Π ≤ ½ gives ‖a^{−1}‖ ≤ 2 and ‖a^{−1} − 1‖ ≤ 2Π, by a Neumann series. The discrepancy proof uses this for a = Ã_i(1), together with (CI)(c), so the normalization is controlled in the jet norm and not only at point values.
- The two status lists now name (CI) as the input.

(CI) is not proved. In particular, (a) has to be read off from the compiler's planted selection, and (c) is a derivative bound for the cutoff integral.

Checks actually run: `latexmk -g -pdf existence.tex` (rc 0, 0 undefined references) and `python3 scripts/check_blueprint.py`. The branch was merged with `codex/existence-monograph` without conflicts.

## Follow-up to the review of 58de97e4 (2026-11-15)

I agree with both findings and the minor point, and followed the routes the review suggested.

1. **Reference normalization.** The raw integrals Ã_{i,x} and 𝒢̃_{i,x} now have masses a_x and b_x, and 𝒢_{i,x} = b_x^{−1} 𝒢̃_{i,x}. The new clause (CI)(d) gives a uniform inverse bound ‖b_x^{−1}‖ ≤ β₀, with β₀ of upper exponent 0. The proof compares the two normalized integrals directly, via A(h)/a − B(h)/b = a^{−1}[(A−B)(h) − (a−b)G(h)]. It obtains ‖a^{−1}‖ ≤ 2β₀ from ‖a − b‖ ≤ Π and the jet inverse lemma applied to a = b(1+u). The new bound is 4β₀τ_nΠ. A remark says that b_x − 1 would be a cutoff tail if the compensated change of variables were global; this is not used.
2. **Values on the healthy region.** The new clause (CI)(e) makes the comparison data and the payment uniform over healthy base configurations x. The insertion is h = Q_T at x, read on the union of the read supports. (CI)(b) and `lem:allarity-prescribed-reference` are now stated at each x. The proof ends with a **Values** step: the zeroth coefficient of a truncated jet product is the product of the zeroth coefficients, so the jet bound at x bounds the value at x.
3. **Minor (Wick route).** The text now says that a small difference between transports does not replace (c). That route needs (c) for one of the two transports and a difference bound. Calling the difference a Gaussian tail requires identifying the uncut density and the masks that survive outside the cutoff.

The norm is the ℓ¹ norm of the Taylor coefficients, which is submultiplicative. It is equivalent to ‖·‖_{J^n_0} within a factor c_n, because the parameter dimension is at most n; that factor is absorbed into Π.

Checks actually run: `latexmk -g -pdf existence.tex` (rc 0, 0 undefined references) and `python3 scripts/check_blueprint.py`.
