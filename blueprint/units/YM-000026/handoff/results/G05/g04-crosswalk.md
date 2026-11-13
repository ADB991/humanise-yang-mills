# G04 / G05 crosswalk at b13f2ef462ee

G04 is a merged **draft** (#119), not an independent review or a proof of
its cited suppliers. Its `argument-outline.tex` is not in the 241 inputs in
`existence.tex`; F01 owns its inclusion. The following proposals concern its
text and the relevant chapter owners; this session does not edit those files.

| Interface / exact location | Meaning and convention | G05 action / outstanding match |
| --- | --- | --- |
| `ex-outline-limits`, `ex-row-target`, `ex-volume-target` | `P_p` is physical period, `D_N` positive denominator, `a_N=D_N^{-1}`; full mesh at fixed suitable period, followed by requested `p` composed with refinement `q`; one family before `p`, one hierarchy/refinement for all tests. | If the glossary aliases are adopted, replace requested `p` and refinement `q` with `varrho` and `sigma` in both G04 and target, with `varrho∘sigma`. Do not replace the full mesh by the extraction's mesh subsequence. |
| `ex-outline-plan` Step 3; `annulus-two-wave-estimates.tex` (AT2), `manuscript/pilots/running-coupling.tex` `sec:running-coefficient` | `lambda_G=11 C_G/(24 pi²)`; `b_0=11 C_g/(48 pi²)`. Both now use `-Re tr(uv)/r_G` and the same orthonormal-basis trace formula for the Casimir. | At this exact manuscript basis `C_G=C_g`, so `lambda_G=2b_0`. C10 revision 2 is an author correction awaiting independent review. The C16 shooting slope and the uniform running input remain separate matches. G04's residual sentence saying that these Casimir normalizations still need matching is stale and should be revised by its owner. |
| `ex-outline-plan` Step 4, `common-scale-selection.tex:60`, `sec:surviving-interval-shooting`, `eq:running` | `s_G>0` is the shooting-line slope. `2b_0` is the separately specified coefficient in the canonical running unit's input. | Do not identify `s_G` with the already-matched `lambda_G=2b_0` by notation. The owner must match the actual slope, same history and uniformity; G04 correctly records an open running edge. |
| `ex-character-measure`, `ex-mixture`, `ex-outline-plan` steps 5–7 | `Xi,mu` are the character spectrum and its representing probability; target `X,nu` denote a phase space and probability. | Propose `Xi,nu_ph` for the target and the construction; identify them only where the constructed target hierarchy supplies the bridge. Character correlations and mixed correlation remain distinct. |
| `sec:complex-heat`, `sec:lorentz-covariance`, `ex-statement` | Target writes time last; parts of C04 use time-first Minkowski coordinates. | Give the permutation `C(t,x)=(x,t)` with transported metric `eta_last=C eta_first C^T`, cone and Lorentz action `Lambda_last=C Lambda_first C^{-1}`. Euclidean insertion coordinates retain their stated convention. |
| `phase-quantitative-producer.tex` | One file contains three separately labelled sections: `ex-public-grill-producer`, `ex-selected-linear-interpolation`, `ex-public-same-run-cauchy`. | A section range ending at the first label omits the latter two. Refer to all three labels or give an inclusive range ending at the third; do not assume one file is one section. |
| `sec:ex-lattice-actual-stress-annulus` | `E_d` reference coefficient space, `F_d` selected-table field quotient, `pi_d:E_d→F_d`, `tau_{I,D}:F_D→C`; `r_m=128 B_{m+1}² a_{m+1}` is annulus scale. | Preserve the quotient and actual selected table at all joins. Distinguish annulus radius `r_m` from the selected scaling witness's `r_k` unless the particular construction proves equality. |
| `sec:ex-annulus-fleet-faces` (F1)–(F4') | `r_i` is a matrix derivative-price scale, `T_i` a momentum/regulator scale, `mu_i` a positive regulator. `T_i≤||x_i||+mu_i` is additional to (F4). | Different local radii need explicit scope. Preserve the extra (F4') condition when using the lower denominator estimate; it is not implied by the two separate upper bounds in (F4). |
| `ex-outline-open`, C14-to-C16 and C15-to-C16 | `J`, stress coefficient, phase and trace data must refer to one hierarchy and selected history. | Keep the recorded supplier edges open until actual common-object matches are reviewed; editorial reordering or matching letters cannot supply those premises. |

G04's claim-to-producer ledger is a useful navigation and status record, but
its `S` rows were based on agent summaries and label/environment checks. G05's
crosswalk checks the displayed local definitions above; it does not upgrade that
ledger to a full independent proof or source review.

The following scope and choice conventions also apply to G04's nine-step
summary:

* In `ex-outline-plan` Steps 1–4, the bare coefficient is `beta`, the
  positive block-kernel penalty is a separate parameter, and the finite
  plaquette action counts each unordered direction pair once. Uniformity in
  the period or starting cutoff must follow the cited supplier's quantifiers.
* In Steps 4–9, `R,T,W` from `sec:public-run-binding` denote one selected
  history, its campaign and its finite-volume transition witnesses. A later
  period request may select a refinement and hierarchy; it does not select a
  new family. At every application retain the source data and its still-open
  same-object edge. A common name in the outline is not a construction.
* In Step 5, distinguish the full mesh result from the common *subsequence*
  extraction: `ex-full-mesh` uses the former to identify the latter, at each
  suitable fixed period, before the selected volume limit. The compactness
  proof and the smoothing/full-grid estimates have distinct hypotheses.
* In Step 6, the mixture is the integral of character correlations against
  the full-support phase measure; the pure-ground property is only
  almost-everywhere until the selected phase is chosen in the intersection
  of required full-measure sets. The target's selected phase and mixed
  Wilson limit have different roles.
* In Step 7, the selected correlation is continued on the ordered tube
  `Im z_1<...<Im z_n`, with Euclidean values at `z_i=i t_i` for strictly
  ordered Euclidean times. The boundary uses `t_j+i epsilon h_j` with a
  strictly increasing height vector and `epsilon` decreasing to zero;
  it is a distributional boundary, not pointwise boundary convergence.
  Coordinate permutations are the explicit time-first/time-last conversion
  above, not reversal of the tube ordering.
* Steps 8–9 use one selected table, quotient fields, physical inclusions,
  OPE prescription and stress normalization. A grade bounds the label
  filtration and must not be silently identified with the factor degree
  used in a local marked-frame estimate. Fix cutoff/threshold dependence
  as stated in the consumer; the outline's summary does not strengthen it.
