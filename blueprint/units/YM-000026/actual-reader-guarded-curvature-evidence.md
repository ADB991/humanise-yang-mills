# Actual-reader guarded curvature: evidence

- Canonical task: issue #26, unit YM-000026.
- Status: draft; this is a conditional local estimate, not a proof of the public theorem.
- Manuscript: manuscript/existence/actual-reader-guarded-curvature.tex.
- Upstream source pin: 3456e5e75cf8d4cd558955a5c7638fba2d68f464 in source/upstream.json.
- Scope: local four-bond nonlinear curvature estimate, same-parent read estimate, and correlated-Gaussian mask-loss bound under explicit purchased-input hypotheses. This unit does not prove the all-matched-palette socket assertion.

## Exact source correspondence

| Mathematical content | Exact Lean declarations | Inspected source and role |
| --- | --- | --- |
| Price and ticket variables | YM.PhysicalNext.InteractingRank.priceCore, ticketPsi, retractPsi, Sizing, Steady, steady_pass | Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/CoreBudget.lean. Here ticketPsi = ticket (TypeFace 2) (psiBudget z / L^2) and Sizing is 2 * card(ColorIndex) * ticketPsi <= 1/4096. steady_pass constructs Steady eventually in x, uniformly over the stated beta and beta-prime bands, including the color-count torque bound and relative-coupling bill. Manuscript P0 is ticketPsi; its retraction cost is retractPsi. |
| Linearized row read | YM.PhysicalNext.InteractingRank.pointing | Same CoreBudget.lean. It compares the linearized coarse plaquette curvature array with its nonlinear curvature array and compares the fine face-curl row with the shorter coarse row using exact_short_price, high_rows, support_rows, and adjust_rows. The two arrays are respectively flatten(dColor(1,v)) and flatten(look(spine(V,o))); their difference is a deterministic chart Taylor remainder. The conclusion is a phase/2048 curl bound and normalized parent-forecast discrepancy at most x^(-1/16). The parent forecast is purseMean for the same base site, coarse field, and beta-prime; tested patches restrict addresses but do not alter that forecast. The linearized curvature bound is global on every tested coarse coordinate; only the linear-minus-nonlinear second-order estimate is restricted to the support of the parent row. |
| Chart and curvature prices | YM.PhysicalNext.InteractingRank.Enlightened, edgeFire, illuminates | Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Illumined.lean. illuminates supplies chart clearance, the uniform books room bound, near-identity link bound, four-face heat inequality, and helm gauge/read error, eventually uniformly in the beta band. The manuscript keeps three prices distinct: priceCore for the coarse response chart, highPrice for each exponential-chart link, and a fixed curvature Taylor price A_* at least arcPrice. It uses R=x^(-3/8), t=phase(betaF), and e=(A_* + color dimension) R^2, and requires eventual heat/transport inequalities after these constants are fixed. |
| Curvature coordinate | YM.Gauge.curvature | Lean/YM/Gauge/Colors.lean. The article writes the source curvature as the normalized real-linear color projection of one half the antisymmetric matrix part, in a fixed unitary matrix representation viewed over the reals. For group elements the source identity `Ray.direct` also writes curvature as the projection of `M(U)-I`. The two-factor defect is therefore the projection of `(M(U)-I)(M(V)-I)` and has bound `colorScale * chord(U) * chord(V)` by Frobenius submultiplicativity and the normalized projection norm. Iterating over four oriented links gives the exact `1+2+3=6` coefficient; this is the source `Tapes.weave`/`warp4` route, not a generic four-variable Taylor assertion. |
| Four-bond product and same-gauge transport | YM.PhysicalNext.InteractingRank.checkingMask, throughout, laminate | Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Rail.lean. laminate consumes Steady, Enlightened, StrongScope, Pose, one forest and one RoomView. slide_link compares the group curvature coordinate of each actual bond to the packaged link direction at that bond, with link chord and fluctuation bounds; this packaged value is not a face boundary sum. checkingMask takes the alternating four-link face curl, uses warp4 plus the four bond residuals, then applies the curvature lower bound to prove the healthy-face threshold. throughout gives the common-gauge corner read from the same purseMean, plus transported Gaussian curl. |
| Same-pose Gaussian comparison | YM.PhysicalNext.InteractingRank.StrongScope, YM.PhysicalNext.InteractingRank.laminate | Focusing.lean and Rail.lean. This comparison is not reproved here. Its actual source producer is YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.aperture with the LocalGaussianLaws quote/lift/remote-chip/head-switch chain, recorded in package A of the closure audit. This unit assumes the resulting StrongScope and same-pose estimates. |
| Room dimension and guard purchase | YM.PhysicalNext.InteractingRank.parasolPrice, ShadePay, tent_crowd, buys_shade, shade_auth | Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Awning.lean. The radius-(w*walls(y)+8) room has at most C_w (log y)^16 real link-color coordinates. buys_shade pays ShadePay; shade_auth transfers the paid bound through the actual positive-definite palette Gaussian law to Guarded and its away-mask probability. The manuscript's elementary coordinate argument is for the actual vector veil: a bond norm at least v forces a scalar color coordinate to exceed v/sqrt(n_G). It groups coordinates by bond, uses the resulting factor n_G in the reservation, and yields arbitrary fixed power loss from the stated hot scale without independence. |

## Correlated Gaussian reserve calculation

The source reservation in YM.PhysicalNext.PhysicalGuard7f546.Curved is reservation(K,U)=1/[8(1+K U)], and reserve_away proves the exact vector-valued away estimate used by shade_auth. The manuscript separately derives a slightly weaker coordinate estimate, adequate for arbitrary fixed power loss. It correctly uses the source cheque base price psiBudget(z)/L^2, while P0 is the TypeFace(2)-weighted ticket 6*psiBudget(z)/L^2; TypeFace(2) is the six two-axis subsets of the four coordinate axes. The separate factor 2 in the sizing bound comes from the source scale inequality tau≤2t. These are distinct from the retraction base fee in retractPsi. For a centered Gaussian vector of dimension m whose covariance entries have modulus at most U, with U>=1, every scalar marginal variance is at most U. Chernoff's bound and a union bound give

    Pr(max_i |X_i| >= v) <= 2m exp(-v^2/(2U)).

For the actual vector veil on n_G-dimensional color vectors, an away event at norm v implies a coordinate event at v/sqrt(n_G). Thus its probability is at most 2m exp(-v^2/(2 n_G U)). Put rho=1/[8 n_G(1+mU)]; then 1/(2n_GU)-rho >= 3/(8n_GU). If m <= C(log y)^16 and v >= delta exp((log log y)^(3/2)), then 3v^2/(8n_GU)-log(2m) tends to infinity. Therefore, eventually,

    Pr(max_b ||X_b|| >= v) <= exp(2) exp(-rho v^2).

For each fixed p>=0 the same growth comparison gives rho v^2 >= (2+p) log y; with y=x+c_L and x large this is at most x^(-p). The actual radial product veil satisfies 0 <= 1-Gamma <= 1_{max_b ||X_b||>=v} because it is one below the half-threshold, proving the expected mask-loss bound for the actual correlated law. This weaker power conclusion alone is not the exact ShadePay field; the source's stronger reservation is supplied by reserve_away and the purchased ShadePay input.

## Hypotheses retained rather than proved here

1. StrongScope: actual same-pose mean/covariance bounds, positive covariance, palette-entry bound U, and the exact common room/forest data. This is package A's input/output and must hold for the same posed field and same finite reader.
2. Pose, Steady, and Enlightened, including Sizing, ticket bill, sufficient-row estimates, support/separation bounds, room fit, and health-threshold conventions. Their upstream paid histories are not reproved here.
3. Local chart and finite-product estimates: direct second-order Taylor bounds for the group curvature coordinate of two-link and four-link products, the compact-group quadratic lower bound, one-plaquette O(R^2) replacement remainder, and the explicitly expanded nautical gauge-transport bound. The constants are fixed and repurchased before the scale threshold.
4. Local window fits: the enlarged room lies inside the selected coarse/fine domains and every tested two-step neighborhood is readable.

Uniformity in period is only after these fixed data and the scalar threshold are fixed. The conclusions are the posed laminate-type local estimate and this reader's own shade_auth mask payment. They do not establish Opacity/Acreage.Pupil, which quantifies over every matched palette with its Pours bound and zero socket conclusion; one actual-reader bound has a different quantifier.

## Checks

- Inspected targeted declarations and immediate dependencies in the listed Lean files; no Lean files were edited.
- `git diff --check` passed after the final manuscript/evidence edits.
- `python3 scripts/check_blueprint.py` was run; it could not complete because this clone lacks `blueprint/units/YM-000026/unit.json`.
- No Lean build or LaTeX build was run. This unit remains draft pending independent review.
