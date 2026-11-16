# C11 bounded leakage review: mathematics

Reviewer: Astra agent acting for @mgubi, independent of the author of PR223. Session `mgubi-astra-c11-leakage-review-20261113`; claim https://github.com/hairer/humanise-yang-mills/issues/190#issuecomment-6862129832. No children. This is an agent report, not human acceptance or a whole-C11 review.

Frozen author head: `1a084088a29f0ae4e4f59d3c414344a74e0843c5`. Scope: all 20 responses in issue190, the two changed chapters and two author records, and immediate interfaces needed to assess those responses. The report branch starts at canonical `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`; the unmerged author commits are not included. Target text was read with `git show`, not substituted by the older worktree chapters.

**Verdict: no required local mathematical correction identified in this bounded revision, conditional on the stated analytic inputs.** In particular, naming an input does not prove its supply. The existing conditional radial, projection, stationary-vertex and retained-plan arguments are not relabelled as missing proofs.

## All audited rows

| Row | Assessment |
| --- | --- |
| 129 | Removing the provenance qualifier leaves positive width and all four path budgets, invariance, metric, summability and normalization conditions intact. |
| 130 | The lemma explicitly assumes coefficient and angular pole identities. The radial proof bounds the inner ball by `A1 π²/2`, the exterior by `A1 vol(E4)`, and the annulus error by `3π² A2`, for `0 < μ ≤ 1`. In four dimensions the annulus contributions are `2π² A2(1−μ)` and `π² A2 μ²(μ⁻²−1)`; both include the endpoint μ=1 correctly. The revised sentence properly distinguishes these proved integrations from the assumed pole identity. |
| 131 | “Source” here describes a mathematical implicit-function argument. The finite-volume chart and uniform gap remain qualified by their displayed hypotheses; the revision does not promise a global nonlinear chart from a Hessian gap alone. |
| 132 | The finite Cauchy–Schwarz/injectivity argument is retained with its curl factor. No numerical or domain change. |
| 133 | The explicit planting/Hessian constants retain their variables and numerical coefficients. |
| 134 | The reel is chosen before the smallness threshold, followed by the floor and price parameters. The revision correctly names the one-step receipt (B), under the same-data hypotheses and `HorizCalc`; it does not construct that receipt. |
| 135 | Four budget components and fine-input/coarse-output attachment directions remain unchanged. |
| 136 | The screened determinant-response estimate is an additional input for the intermediate scalar comparison. It is explicitly not inferred from the bare output interface (B), nor added to the retained-plan proposition that consumes that interface. |
| 137 | Removing provenance leaves injectivity, cofinal errors and the two distinct recordings required. |
| 138 | Firm, contractibility and separated-nose assumptions are explicitly preserved for the same bridge/picture data. Bare pole recordings do not imply them. |
| 139 | The full nose is replaced in the pairing by its horizontal representative using contractibility; the latter has order two at each nonprincipal alias. Firmness and two order-two legs give order four. The argument does not claim the full nose itself has order two. The alias set is finite for each fixed blocking ratio; no uniform estimate over all ratios is silently introduced. |
| 140 | Budget assembly is described as part of the assumed one-step construction. The elementary row calculation and derivative-order distinction survive; no analytic producer is newly certified. |
| 141 | The existing `prop:ex-classical-stationary-pictures` is an appropriate conditional reference. With `C3=A'`, `C4=C'`, `F=D_*`, the prices are `A'/6` and `(C'+3A'D_*A')/24`. Its common strip pictures, fixed completed inverse symbol, stationary branches and derivative matching on every tested torus are required. An inverse-Hessian estimate alone would be insufficient; the new ledger says so. |
| 142 | The abstract orthogonal-projection proof is unchanged. Closed admissibility is now an explicit application hypothesis. For the common tested-jet kernel K in the closed admissible subspace S, subtracting the orthogonal projection onto K preserves every tested jet and decreases the norm. Uniqueness is in `S ∩ K⊥`; this does not assert injectivity on the whole admissible space or outside the tested periods. |
| 143 | Both distinct neighbor extrema and their quantifier order are retained. |
| 144 | The three inequalities are correctly identified as schedule inputs: at incoming stage `j=J_(m+1)`, `W_j(L_j)≤loopCap_m`, `loopCap_(m+1)/2≤loopCap_m`, and `1≤loopCap_m`. The factor 64 against denominator 128 yields the half-next-level term. General monotonicity is not claimed to supply all three. |
| 145 | The renamed boundary still leaves the annulus and multicomponent one-step analytic producers open with retained-horizon and same-history requirements. |
| 147 | The unchanged “one-step source” means a selected mathematical output family. The common dictionary, supports and parameter interval remain essential; independently chosen witnesses cannot replace it. |
| 148 | The unchanged phrase has the same mathematical meaning for the regular budget. The explicit fraction and remainder exponent are retained, including the conditional purchase of a smaller reserve. The offering budget and forecast purchase are not closed. |
| 150 | The auxiliary stationary-service receipt is explicitly an input on the auxiliary tori. It requires the same incoming path, clips and branch, replication to divisible scheduled periods, critical-branch identification, and thermal transfer with summed amplitudes and the minimum decay rate. Physical stationary service on a different branch alone is not sufficient. |

## Scope and open obligations

The new ledger refines the existing annulus, one-step, screened comparison, classical-picture, schedule and auxiliary-service inputs. It does not establish their mutual realizability or all incoming analytic suppliers. The retained-plan implication remains conditional on (A), (B), (C); the separate screened comparison is an explanation under additional assumptions. Nothing here closes selected-history production, history coherence, local two-bed attachment, local expansion, forced forecast purchases, or reserved addresses at earlier levels.

The older C11 background review (PR101, report session `mgubi-codex-c11-background-20261113`) covered three different convergence chapters. Its hypotheses, findings and fingerprints are not renewed by this review. Neither the whole C11 package nor the full downstream construction has been audited here. The author response's build/render claims are not independently replayed by this report-only task.
