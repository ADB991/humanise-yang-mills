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
