# Independent bounded mathematical review

- Unit: YM-000026, C15 issue56; session `mgubi-astra-c15-trace-20261113`.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/56#issuecomment-6846875394
- Author submission: PR105, `f8022ce0705481b246ee9f8ae933f79848d4320d`, reviewed in monograph snapshot `be0e87db8c520491d25145d3c61f61b97f0ff42d`.
- Assistance: independent GPT-6 Astra subagent delegated by mgubi's Codex parent. No involvement in PR105 authoring. Responsible contributor: mgubi; **human acceptance unset**.
- Scope: complete `trace-spectrum.tex`, `trace-profiles.tex`, `trace-asymptotic.tex`; immediate supplier and C16 consumer statements only. Other seventeen C15 chapters and C14/external33/34 are not independently reviewed here.
- Outcome: **no local mathematical defect identified; locally acceptable conditional arguments**, subject to the exact retained premises and human acceptance. This is not C15 completion or closure of `C15-to-C16-TraceTest`.

## Reviewed content

| File under `manuscript/existence/` | SHA-256 |
| --- | --- |
| `trace-spectrum.tex` | `30cf0d74767436eb03432d3a94e9aca29e31730b401ff4fb39debf1d702cf085` |
| `trace-profiles.tex` | `6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54` |
| `trace-asymptotic.tex` | `ccb50cdba852e470937cd038c3524f2a24a02c6624cbca884b8a1753d1d167c2` |

These are individual file fingerprints, not the machine fingerprint of the whole YM-000026 unit. All three match the author head byte for byte. Supplier hashes are recorded separately in `hashes.json`; changing a supplier statement requires reconsidering the conditional match.

## Spectral construction

The Gaussian boundary-uniqueness calculation has the correct sign: choosing `b=-2 epsilon s` cancels the oscillatory factor on the upper edge and leaves `exp(-epsilon s²)exp(-epsilon t²)`. Boundedness justifies the rescaled Gaussian dominated limit. The characteristic-function integral is holomorphic using time-half-space support and the local majorant `p0 exp(-eta p0) <= eta^-1`. The complex heat matrix element has the same continuous boundary and is bounded by the contraction estimate. Thus the damping density is `exp(-2t p0)`, with the factor two coming from heat applied to both vectors.

Width independence follows from all four mixed Gram products, so the common-width semigroup argument is legitimate. Undamping at height one defines a sigma-finite measure, not necessarily finite. Comparing heights through `s+1` yields both density identities without cancelling a possibly infinite total mass. The Laplace time is the full separation `2s`, so the final density is `exp(-t p0)` at separation `t`.

The growth estimate controls the entire energy sublevel set: at height `1/R`, its damping is at least `exp(-2)`. It implies a ball estimate and the stated dyadic bound `A 2^(k+1)`. This makes the joint Fourier restriction integrable: the embedding `p -> (-p,p)` is injective, and derivatives/weighted seminorms restrict to Schwartz functions. Fubini at positive height uses a finite damped measure; dominated convergence afterwards uses the Schwartz majorant against the undamped measure. The resulting identity holds on all joint Schwartz tests. It does not take an illicit restriction to a null cone or a coincidence set.

Product tests give the correct plus-Fourier weight `conj(f_+) g_+`. Translation of `f` by `a` multiplies `f_+` by `exp(ip.a)`, hence finite-measure uniqueness identifies the field-vector measure with `|f_+|² mu`. Smooth Fourier weights equal to one on successive balls determine the undamped measure and transfer forward-cone support from the actual field representation. Lorentz covariance uses the dual action `Lambda^(-T)` consistently. It is not inferred from the auxiliary chamber's time positivity.

For the trace, real symmetric tensorial stress is expressly a hypothesis. Orthogonal invariance and conjugation make the centered label self-adjoint. The boost-generator argument uses the earlier finite-dimensional label action, with generator `-i L_a`, and ODE uniqueness; no infinite-dimensional differentiation is needed. Zero Euclidean one-point value continues to the same boundary distribution and then to the vacuum expectation of the same reconstructed field. The opening common-data paragraph prevents switching phase or reconstruction in these steps.

The cited immediate C04 statements were inspected: `prop:complex-heat`, `eq:euclidean-positive-energy`, `eq:point-heat-vector`, `lem:mixed-heat-gram`, `lem:continued-matrix`/`eq:gap-power`, `thm:joint-boundary`, `prop:word-fields`/`eq:word-adjoint`, `prop:word-motion`, `thm:field-spectrum`, and `eq:label-boost-input`. Their stated conclusions provide what is consumed here. This does not independently establish their upstream hypotheses or re-review their proofs.

## Finite profile exclusion

The algebra argument correctly allows different approximants at different orders. For multiplication, the growth bound for the chosen first approximant is sufficient; no uniform expansion is presumed. In the primitive lemma the sign of `A=C/(b+1)` is handled correctly when `b+1<0`. For positive `b+1` the oscillation bound gives an actual endpoint constant. The exceptional remainder order `-1` is excluded precisely where necessary.

The radial moments are absolutely integrable, including mass zero: the `k=0,1` bounds start the two-step recurrence, and the point `r=0` is immaterial. Dominated differentiation uses the next moment at `s/2`. The radial primitive vanishes at both ends and gives the stated Euler equation. Differentiating the weighted moment produces `-m² s^(j+3) M_(j,0)`. The bootstrap starts at order `-j-2`; its first integration has order at least one. At `b=-2`, weakening the intermediate order from `-1` to `-2` gives the desired next order `-1` without assuming an integrable arbitrary `s^-1` remainder. This closes the induction at all orders.

Polar integration contributes exactly one half of the ordinary sphere integral. A track is a product of integrals, including the empty product, and coefficients may be complex. Taking real parts is valid because each mode profile is real. The dyadic obstruction combines equal exponent pairs before selecting a nonzero leading coefficient. After weighting, each logarithm degree is at least two. A leading base below one forces zero limit; a base at least one gives a divergent normalizer with nonzero normalized coefficient, contradicting a finite limit. Consequently the exclusion applies to every positive `A`, with no positivity condition on individual profiles.

The exact excluded class is finite complex sums of finite products of integrals with mass `m>=0`, natural spatial/time orders `j,k`, and continuous real positively homogeneous numerator `P` of degree `j`. It neither excludes infinite sums nor continuous mass distributions, and implies no mass gap.

## Trace normalization and all-radius limit

Independent recomputation of the curvature expression gives the orthogonal reflection matrix `H=I-2uu^T`; the ordered four-index square sum is 24. Two cross-Wick pairings, color factor `N`, and `(1/4)^2` give `2N*24/16=3N`, with denominator `pi^4 r^8`. The reference-table identification is explicitly separate from this calculation.

Rank-nullity gives a one-dimensional conserved space from exactly the listed dimensions, surjectivity and kernel equality. The nonzero common shell value, not rank alone, fixes `T_i=c_i R` with `c_i -> 1`. This remains valid for complex shell values and real coefficients. Eventual inverse scalars preserve both limits. A fixed phase-centering correction disappears because the chart preserves the unit and `B_i r_i^4 -> 0`.

The finite-basis argument handles moving labels without needing a bound on `U_i` itself. Continuity bounds the error majorants at rounded configurations; bilinearity and finitely many basis pairs suffice. The precise multiplier is `(4d2)^2/(2b0)^2=1` because `d2=-b0/2`. Positivity uses the standing nonabelian simple gauge setting (`N>0`), not an arbitrary zero-dimensional algebra.

For each fixed diagonal shot the rounded separation tends to `t`; comparison windows contain all shots with `1/2<t<2`. Two fixed choices straddling one suffice for the monotonicity squeeze; no uniform convergence in `t` is needed. The nonnegative multiplier is `r_i^8 log²(1/r_i)`. Finally the bad-sequence argument requires and uses a strictly increasing subsequence of **every** arbitrary positive null sequence, with exactly its original radii. It does not replace that sequence by a convenient one. All four hypotheses in `thm:trace-asymptotic` are needed and explicitly retained.

## Remaining integration obligations

No author change in the three reviewed chapters is requested by this review. The following are blockers to unconditional assembly, not newly discovered local proof errors:

1. `eq:trace-basis-error` still has no located manuscript producer. Tested convergence alone does not supply this rounded pointwise comparison. The window, same chart and continuous majorants must be delivered together.
2. Reference covariance/field normalization, physical Ward stress, rank/comparison and the nonzero shell test retain their supplier premises. The spectral measure is now constructed conditionally from reconstruction and stress; it is not an additional unsupported positive-measure axiom.
3. External33's eventual operator bound and weighted estimate must hold uniformly for all `y` on the same selected chart. The dictionary and use with growing forecasts `O(rho_i)`, `rho_i<=t_i<=z_i`, are correct at statement level. External34 supplies separate three-field limits and exponent-one principal/false trace washout; the false tensor itself need not vanish. Its coefficient divided by `q_i` vanishes. The true branch supplies `tr M_1=4O`. These are distinct conditional inputs, not reviewed deliveries here.
4. The same physical stress and chart must carry `q_i r_i^4 U_i^-1 Theta -> -kappa O`, `log(1/r_i)/q_i -> 1/kappa`, and eventual unit preservation, with `kappa=2b0`. The immediate scribe statements have that form; their paid response, clock and shell premises remain open.
5. **External C14 wording discrepancy, already reported by the author:** `trace-firesky-gallery.tex`, subsection “The gallery handoff”, says the two coefficients converge to a prescribed coefficient and zero and that the zoomed scalar tends to a multiple of the unit. `YM.Trace.Over.Scribe.gallery` instead has the weighted limits `BQ*d -> d2`, `BQ*e -> 0`, and `Scribe.goal` has `4d2 OScale`. The current scribe/asymptotic chapters correctly use curvature-square `O`, not the unit. C14 must repair or clarify that passage before it is treated as a supplier of the complete gallery. This is a read-only interface observation, not a review of all C14 or of any other contributor's PR. The precise supplier snapshot is in `hashes.json`.

C16 `assembly.tex` explicitly says producing the comparison estimates remains necessary. Its centered trace, time-axis points, amplitude and finite class match the conditional outgoing interface. Leave `C15-to-C16-TraceTest` open until the premises are discharged on one hierarchy.

## Literature and acceptance boundary

Read `blueprint/background/README.md`, the available background inventory, `Bots/README.md`, the trace evidence and current author reports. No relevant trace-specific literature note is present in this checkout. These chapters prove the elementary spectral-measure conversion and finite power-log arguments directly and invoke the named reconstruction interfaces; no new external theorem or alternate proof was imported in this report. No external literature search was performed. The broader literature/reconstruction audit remains with its owners.

This is agent-assisted bounded review evidence. No machine approval or human acceptance is set, no global mathematical correctness is certified, and no source build or rendered-page validation is implied.
