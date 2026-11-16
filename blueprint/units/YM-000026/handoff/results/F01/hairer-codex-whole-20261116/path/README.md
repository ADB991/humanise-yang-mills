# Retained path producer completion

Parent issue #26 scope extension 6920021498; author `whole_path_author` in isolated clone `/tmp/ym-whole-path`, base `a62f08fbcccdc92797ab910ace65f3e02ee79a06`. Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` unchanged.

## Changes

`path-attachment-producer.tex` now gives:

- The explicit finite-volume Hessian on a pair of coarse/forest variations: bed kinetic form on their fine stretches plus the penalty pairing on their predictor residuals. First-derivative vanishing removes second derivatives of the coordinate lift and predictor.
- `lem:path-forest-independence`: analytic tree-gauge switch, stationary uniqueness, product-Haar change of variables, and cancellation of the squared Hessian Jacobian against the Haar density. The conclusion is a germ near zero; it does not identify vectors in distinct forest coordinate spaces.
- `prop:path-one-step-production`: same-data assembly of the fixed-width bridge and weighted inverses, the classical vertex pictures, determinant recording, inherited-loop picture, scalar coefficient comparison, and curvature coefficient lift. It records widths/prices before the incoming path budgets, and later block floors and amplitudes.
- Explicit loop allowance split: choose the block floor so that the fixed coefficient-realization multiplier times the inherited `C' L^-2` cost is at most `1/256`; the input condition `Lambda/128 <= Lambda'` then pays the inherited half of the outgoing loop budget. The other half pays the absolute determinant/kinetic coefficient term via `Lambda_0(L)`.
- A Hilbert reel on canonical displacement arrays with an exponential margin. Polynomial address growth gives the encoding bound; closed real/invariant/moment conditions and all-period jet kernels permit orthogonal projection. The cubic projection keeps both degrees three and four, rather than invalidating the quartic subtraction.
- The terminal path is constructed by subtracting the blank root-row action from Wilson, removing its cubic coefficient, then removing its residual quartic coefficient. Loops are zero.

The old conditional one-step prose and named-source descriptions are replaced by references to these actual producers. The retained-plan induction remains a transparent application of the named A/B/C constructions; the quadratic horizon remains external to this chapter, and the new annulus W/S/T proof is supplied by the parent's disjoint repair.

## Source and proof boundary

The source map is the cheaper Luna reader's report, including its scope and unrun checks. `YM.Stationary.transition_cap` orders the parameters as in the manuscript; `beckon`/`launch`/`assembly` supply the terminal path; `YM.Work.F05.answer` supplies the forest comparison through `graph_switch`, Hessian congruence and the physical Haar `toll_switch`.

The exact source transition inspected by Luna has a half-loop contraction on the ordinary incoming loop cap. The manuscript's factor-64 input halo with `Lambda/128` is therefore **not** claimed to be a literal transcription of that source clause. It is a stronger elementary consequence of the already proved `C' L^-2 Lambda` inherited-picture estimate: the floor can be enlarged by the fixed factor needed in the displayed split. This strengthening is separately explained and mathematically reviewed.

The Hilbert realization is an expository reorganization of the coefficient realization and closed-kernel projection. The canonical displacement support is finite-dimensional in its integer indices; exponential margin pays every fixed polynomial jet weight. It is not a claim that arbitrary walks have polynomial counting growth.

## Checks

`git diff --check` passes. Parent owns the integrated LaTeX build and rendered-page checks. No Lean build, elaboration or axiom replay was run in this lane. New source and independent mathematical checks are recorded separately; no self-approval or whole-monograph closure is claimed by this author.
