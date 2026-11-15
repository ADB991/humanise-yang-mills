# (CI): mask removal, the cost of (b), the first rung, and (a) from the chart law (#375)

- **Session:** `hairer-claude-375b-20261115` (Claude, on behalf of @hairer).
- **Base:** `codex/existence-monograph` at 90e6883a (after #433). **Pin:** `3456e5e`.

## Changes (`allarity-marked-propagation.tex`)

1. **`lem:allarity-reference-mask-removal`.** Assume (CI)(c), and that each piece's read support contains the support X_{c,I} on which its mask is inspected. Then 𝒢̃_{i,x}(Q_T) = 𝒢̃_{i,x}(q_T). This uses the second identity of `sec:principal-gaussian-comparison`: wherever χ₉ ≠ 0, the configuration is healthy on the insertion support, so every mask equals one. Consequences:
   - In (b), the masked and unmasked prescribed polynomials have the same reference transport.
   - The Wick-route difference involves the cutoff alone, with no masks.
   - The masked moments are still needed in the actual integral.
2. **The cost of (CI)(b), made explicit.** (b) can be read as a recursive definition of the prescribed polynomials on the leading interval. The matching clause is then the healthy-local-error hypothesis of `lem:allarity-corrected-pieces`, applied to this history at the middle level. `sec:marked-healthy-cumulant-launch` proves that hypothesis for its actual polynomial history (linear substitution and Wick contraction), not for the reference-transported one. The open comparison is between these two transports over the leading interval, to accuracy H^{−3/2} on healthy regions.
3. **First rung.** The top initialization of `sec:marked-healthy-cumulant-launch` gives calibrated singletons with vanishing higher connected coefficients. So the first-rung form holds with c_{{j}} equal to the singleton, provided each birth term's mask is inspected on X_{c,{j}}; otherwise a zero-discrepancy realignment is needed at the top. Only this mask condition remains of the terminal-source "form" requirement.
4. **(CI)(a) reduced to a condition (M) on the chart law** (`lem:allarity-measure-identification`). Condition (M): each ν_t is Λ times the sector-cut Gaussian and Haar law of the forest and tag. The lemma then identifies each partition-product integral with Λ times Ã_{i,x} on the union of read supports. The proof uses the joint marginal C_I (projection paragraph of `sec:gaussian-differentiation`) and `eq:gaussian-relative-identity`. The common factor Λ cancels in the normalization. (M) is not checked against the sector partition of `sec:gaussian-reassembly`.

## Remaining on #375

- (M), or (CI)(a) directly.
- The comparison of the reference-transported history with the actual polynomial history at the middle level, which is (b)'s real content.
- (CI)(c), the primitive comparison uniformly over base points.
- The step purchases at e* (#431).

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
