# C01 final independent mathematical review: local algebra and interfaces

Reviewer: `/root/c01_interfaces_review`, independent subagent, no manuscript authorship.
Parent claim: #42 comment6919165600. Base: `7a8b49ab78b335a539309139c398f3e325853ad3`.
Reviewed final working versions copied from `/tmp/ym42-completion-20261116` into isolated clone `/tmp/ym42-interfaces-review`, 2026-11-16.

## Verdict

PASS for the five assigned C01 chapters and their bounded same-data application. No required mathematical correction identified. This covers the complete local argument in lattice normalization/reflection, strip-to-atlas conversion, one-step neutral propagation, scalar recurrence, and finite horizon assembly; it is not approval of the other six C01 chapters or of global Yang–Mills existence. The other C01 analytic producers need their own independent review, and the external hypotheses below remain explicit.

## Final additions

1. `cor:ex-lattice-smeared-reflection` has the right quantifier order: fix finite tests and a uniform physical period lower bound P_*>2R, then choose one mesh threshold from b a_N < min(ε,P_*/2−R)/2. Strictly increasing integer D_N tend to infinity. Every endpoint read by every nonzero summand lies in the strict positive site-cut sector, and the spatial margin prevents centered-box wrap. For fixed mesh/period, the sum is finite and all inserted functions are continuous on a compact configuration space, hence bounded and Borel. Gauge invariance and strict locality persist under finite sums, products and linear combinations. Applying finite RP to arbitrary combinations gives positive semidefiniteness; the convention c_ν overline(c_μ) instead of overline(c_ν)c_μ is immaterial because coefficients range over all complex vectors (conjugate them). Empty words are constants and cause no locality exception. Expansion retains exactly a_N^{4(n_ν+n_μ)}, with the same normalized Wilson law. The last paragraph correctly makes reflected-label covariance and ordered convergence separate requirements and does not infer convergence or separated support from finite positivity.
2. `subsec:ex-lattice-c01-selected-application` matches stage indices j=J_(i+1), t=J_i and actual block L=L_(J_(i+1)). The width min(1,α(J_i),α(J_i+1)) lies within both bed widths for either permitted stage transition. Shape-port identities identify the four precision rows and donated transports; they do not claim equality of arbitrary roots. Fine-amendment floor, preselected prices and direct ceiling are retained before lengths. The atlas cost m²e⁴Ω_(i+1)²Ω_i, city law and travel receipt are exactly those used in `lem:ex-lattice-rg-one-step`. The entrance floor pays folding and 2m²A_i²/(σ_(i+1)L), and terminal neutrality uses the same two metrics. Thus the application invokes the existing complete finite-history induction, without a new analytic estimate or a period-dependent choice.
3. The auxiliary completion paragraph preserves the essential boundary: only quadratic outputs transfer by common blocking maps, penalties and terminal one-form precisions. The physical path identity separately uses the actual attached path and its priced bounds, with the actual direct block/root/counting measure. It never substitutes an auxiliary path or square root.
4. No new proof cycle is introduced. The earlier local block, atlas, neutral-packet and scalar arguments do not use this application subsection. The C02 finite-history proof uses those local arguments and explicit schedule inequalities. C16 selects numerical floors/postlength costs from the already fixed local supplier families; this subsection records their resulting common application. It does not use the desired flat bound to purchase its own local constants.
5. The two atlas text corrections are exact: the distance inequality concerns x,y, and odd-L carry condition 2 lift(r)_a=L−1 is equivalent to lift(r)_a=floor(L/2). Changing “integer scale” to “integer stage” is also correct.

## Complete local checks retained from the initial pass

- Finite Wilson probability normalization and gauge invariance; reflection as coordinate permutation/inversion preserving Haar and action; positive transfer kernel from the uniformly convergent tensor-feature series and a common gauge average; link-cut and site-cut factorization, including empty strict sector and coincident boundary slice cases.
- Atlas installation: centered carry, row L^(−2), column L² from L⁴ residues, difference row L^(−3). Sandwich weights use |u|/L+|v| and nonnegative costs; absolute sums justify all regrouping. Travel uses the zero-momentum column, every-period carrier and fine modulus Ln/coarse modulus n.
- Flat propagation: signed coordinate-path centering, extra L^(−1), exact m² label factor, uncentered and centered absolute majorants, neutrality and city stationarity, quotient-fibre composition and transpose identity, mixed Schur cancellation, inherited exact-form identities, completion independence and dominated recovery of cover coefficients.
- Scalar rate: tilt, positive λ and q<1, polynomial age change, backward induction, zero source/degree/interval cases, and scale-ratio rewrite.
- Horizon: symmetric inverses; full augmented-space projection; all six block identities; lower square root plus direct block; actual amendment on exact forms; curvature width in the common minimum; convolution cardinalities and mixed carry estimate independent of L; donated difference bounds; path-to-root absolute regrouping and both direct/path terms in counting measure.

## External dependency boundary

`prop:path-retained-plan` still takes the annulus and one-step/terminal/forest-independence analytic packages (A/B) as premises. Its C01 horizon input (C) is the local output here. The new C01 application cites the actual path Bounds and Attached conclusions without purporting to prove those other analytic packages. C03's `prop:ex-limits-euclidean` still needs exact reflected pairing, ordered smeared convergence, smoothness away from coincidences and its separate cap bound. The new corollary supplies only the finite positivity/locality part. C16 common data are matched, but separate joint-existence clauses and G06 global noncircular closure are not concluded.

## Evidence

Read AGENTS.md, CONTRIBUTING.md, coordination and proof-standard instructions; the five complete assigned chapters; C01 historical reviews and RESULTS; current `rg-construction.tex`, `public-run-binding.tex`, `selected-course-binding.tex`, relevant `common-funded-history.tex`, `path-attachment-producer.tex`, `soft-curvature-receipts.tex`, and `limits.tex` applications. Initial report is `/tmp/ym42-interfaces-review.md`. No Lean source correspondence, fresh Lean build, LaTeX build or rendering is claimed by this mathematical review. Those checks belong to separate review/parent validation.

## Final SHA256 identities
- `manuscript/existence/lattice.tex`: `f77c8b20fdd412b58fe69a1474809c32f3f37095e266c3f0cc102280be6a6c31`
- `manuscript/existence/atlas-estimates.tex`: `5eddb1854586b7b766279d28d385aaa04e23c8d4a1663bcfd502b566b0749a15`
- `manuscript/existence/flat-step.tex`: `d6c8914591ecbd6a09fe4c9af5ddd205af7c4ee44cfe2f79707504d4ca550005`
- `manuscript/existence/flat-estimate.tex`: `0b7f7e9eb6cc6c5a8b4f7b626fce6e504a4060b26ca0e940967a38287a656929`
- `manuscript/existence/rg-horizon-geometry.tex`: `023ebd7980e451cce5d34929b4f06a58d8b3cc3011159e4af7691e08dd8e5cdd`
