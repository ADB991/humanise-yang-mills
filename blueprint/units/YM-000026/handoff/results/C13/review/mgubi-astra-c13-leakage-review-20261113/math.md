# C13 bounded leakage review: mathematics

Session `mgubi-astra-c13-leakage-review-20261113`, Astra agent acting for @mgubi, independent of the C13 author. Claim: https://github.com/hairer/humanise-yang-mills/issues/192#issuecomment-6862643029. No subagents. Agent review, not human acceptance.

Target: PR226, frozen `47dde5260a1b0cb86219b30bf4da6827a691eec0`. Full comparison: canonical `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2` to target, covering seven chapters and two author records. All 29 row dispositions and all mathematical hunks were inspected, including the full rewritten guarded-curvature chapter. This is not a whole-C13 review.

**Verdict: the substantive changed arguments check conditionally on their stated inputs; one minor notation repair is requested.** No new analytic supplier proof is certified. The independent source verdict is in `lean-correspondence.md`.

## M1 — restore the Gaussian-response notation

In target `actual-reader-guarded-curvature.tex`, lines49–54 define the linear map `D_{A,F,x}`. The based-transport argument at lines431–432 then uses `G_{A,F,x}(Z)(u,a)` and refers to the definition of D, but the rewrite deleted the former explicit equation `G_{A,F,x}(Z)=D_{A,F,x}Z` (base line205). No replacement definition of G remains in this chapter or the immediately cited local-Gaussian chapter.

Restore that equation beside the definition of D, or use `(D_{A,F,x}Z)(u,a)` in the read calculation. The intended zero-padded signed-curl response is clear; this is a local notation omission, not a failure of the transport estimate or a new missing supplier.

## All row dispositions

| Row | Assessment |
| --- | --- |
| 191 | The defined signed set contains a permutation of four axes and four independent reflections. Its reciprocal-cardinality weight is the intended positive normalization. |
| 192 | The left addresses already include the signed orientation. One prefactor converts their sum to the normalized average on the right; the right average is not divided again. The separate tag average is unchanged. |
| 193 | The same orientation set, threshold and invariant seed shares appear in the owner lower bound. Averaging the fixed-orientation estimate preserves its constant. |
| 194 | The exterior price retains `4 omega_S y^(-1/4)` on the admissible mask; removal of the formal identifier does not remove a weight. |
| 195 | The inherited quadratic coefficient uses positive `omega_S`; omitting its absolute-value bars is justified. |
| 196 | The cubic coefficient uses positive beta and `omega_S`, with the original power of the threshold. |
| 197 | The quartic coefficient retains the same beta, normalization and fourth power. |
| 198 | Reconstruction sums elementary oriented charges with one `omega_S`, consistently with the owner identity. It does not introduce a tag factor. |
| 199 | Periodization's triangle inequality and summation over the output-label set yield `card(C) A exp(-t h_x)`. The label factor is retained. |
| 200 | The fine inverse diagonal, installed transport and coarse diagonal remain on the same history. Their two label contractions give `m2² z³/L²`; summing output labels gives the additional m2. Movement and turn payments remain distinct. |
| 204 | The floor inequality gives `p≤B/20+4`. The small panel does not change the outer construction or its cutoff. |
| 207 | Diagonalization and full-stack conditions are separate inputs on the same beds, clips and tower. The stack isometry, predictor normalization and adjoint equation are referenced explicitly; its three output identities are printed. None follows merely from the diagonal identities. |
| 211 | Fixed-row chart/path bounds, actual and bare positive Gram gaps, row constants and inverse-window bounds remain hypotheses. The threshold still precedes quantification over the admissible tube, store, pose, direction, forest, tag and period, and the conclusion still includes all active rows. |
| 215 | The finite stencil count uses the outer B, giving `D_x≤C(1+B)^4`. The displayed polynomial has degree at most 15 in `1+B`, hence is eventually at most `x^(1/16)`. Together with the stated squared-temperature bound this yields `x^(-7/8)`. |
| 219 | The map D is now described mathematically as zero insertion followed by signed curl in the fixed frame. M1 concerns the later missing alias G only. |
| 220 | For fixed z, `P0=m2³ z³/L²` tends to zero as L grows. Choosing L for `2 n_G P0≤1/4096` is legitimate before the large-x limit. This is not a uniform assertion for arbitrary z varying with L. |
| 221 | Retiming in `[x,x²]` gives a polynomial logarithmic clearance factor. Phase is `x^(-1/2+o(1))`, while `R=x^(-3/8)`; the stated clearance, tail and coupling comparisons follow. All constants are fixed before x. |
| 222 | The new based-holonomy proof supplies the transport polynomial under nonwrapping and two-step interior conditions. Gauge factors cancel at intermediate vertices; the remaining root conjugation is the prescribed color rotation. Detailed checks appear below. |
| 223 | `4 C0 a_x≤R` and the paid deterministic response bound leave room for the coordinate error and Gaussian reserve. The deterministic relative-response bound is an incoming chart/response premise, supplied in the immediate local-mean interface, not proved from Gaussian control alone. |
| 224 | The linear replica is zero on internal bonds and copies v on crossings. The relative stationary field is `d=ell−b`; the mean comparison is for d in the same active coordinates, not ell. On forest bonds the relative field and inserted noise vanish and the replica is the identity. Summing coordinate errors costs at most n_G. |
| 225 | Replica contraction gives `norm(b_j)≤norm(v)`. Taylor expansion at zero and the two-factor matrix defect give separate fixed chord and curvature constants. Both exponential arguments are kept within R. |
| 226 | The tail `Delta=m2 M0 exp(-s h_x)` matches the output-label row payment. Its use retains row mass and deterministic chart premises on the same data. |
| 227 | Summing color-coordinate bounds gives `norm(f)≤n_G(P0 tau+E)`. Sizing gives the first term at most `t/4096`; `R²=o(t)` pays the second, giving `t/2048`. |
| 228 | Four-link curvature is below `t/32`; the local lower bound gives chord at most `2t/(32 sqrt(3))<t/8`, within the chosen curvature radius. |
| 229 | A bond norm at least v forces one of its real coordinates to be at least `v/sqrt(n_G)`. The union bound needs no independence. |
| 230 | The radial product has full vector radius `kappa0 t/g` and half-radius plateau. Its mask loss is dominated by the weak bond tail at the half radius, on the same enlarged room and joint sample. |
| 231 | The local power-small loss is distinguished from the sharper source reserve and the all-compatible warning assertion. The latter remains a separate hypothesis. |
| 233 | The actual input R and its zero-additive-remainder auxiliary version are distinguished on otherwise identical data. The genuine remainder bound remains independent; `e+4d≤6 omega` and the forced owner-decay allowance retain different purposes. |
| 234 | Each coefficient is bounded by the finite algebra's coefficient sum norm. The factor `2^n` is absorbed only at fixed arity, not uniformly in n. |

## Detailed checks of the larger rewrite

In the physical normalization, projection to color coordinates has norm at most `1/c_G`, while the matrix chord has norm `c_G chord(U)`. Expanding the matrix product gives the curvature defect bound `c_G chord(U) chord(V)`. The two exponential Taylor remainders therefore cost `(c_G C_exp²+2 A_exp)R²`, separately from the chord constant `2 C_exp`. The mean error adds at most `n_G x^(-7/8)≤n_G R²`.

For the four oriented factors, the successive product defects cost `(1+2+3)c_G M²=6c_G M²`; inversion preserves chord and negates curvature. With the four link remainders and guarded noise, the total curvature bound uses `1/2048+4/4096+1/64<1/32`.

For a coordinate path of length at most `4W_f`, its holonomy has chord at most `u=4W_f M`. Applying the two-factor defect to `(H,Xi)` and `(H Xi,H^-1)` gives `c_G[u(4M)+(u+4M)u]`. Adding the four-link defect and dividing by g gives the displayed transport price exactly. Since `W_f²=O((1+B(x))^4)`, its order is a logarithmic polynomial times `x^(-1/4)`, hence `o(x^(-1/8))`. The final read also pays `4e/g` and the row error `x^(-1/16)`, leaving the claimed eventual `x^(-1/32)` bound.

The pointing proof subtracts the full and short rows before applying the Taylor estimate: `|f_a−Q_a|≤C_core Delta R+C_core P0 R²`. The coupling comparison is `|g/g'−1|≤gamma/x` uniformly in the displayed band. This yields the stated ticket bill without choosing a new forecast by address.

For the guard, the room has at most a fixed multiple of `(log y)^16` coordinates. Marginal Gaussian tails with variance at most U give `2m_y exp(-v²/(2n_G U))`. The weakened reserve with `rho_y=[8n_G(1+m_y U)]^-1` is sufficient eventually. At half-threshold, `v` grows like `exp((log log y)^(3/2))`, so `rho_y v²/log y` diverges. This proves every fixed inverse-power loss, including singular positive-semidefinite covariance; it does not claim the source's stronger exact reserve constant.

## Preserved boundaries

The same-pose Gaussian estimates, full-stack construction, chart and row bounds, window/clearance conditions, same history and all-compatible warning hypotheses remain inputs. The proof establishes implications from those inputs, not their joint supply.

PR213's earlier distinction between the unaggregated embedded component family F and the address-summed activity slots of Q is not resolved by this revision: `allarity-planted-compiler.tex` is unchanged and the relevant output-interface passage is not repaired here. The two explicit auxiliary-history derivative/continuity and large-marker-weight replica-root joins also remain open. The author record acknowledges those joins. This report neither renews old whole-package findings nor closes C13, C07 supplier matches or C14 extraction identifications.
