# Final independent C01 analytic/kernel mathematical review

Reviewer: `/root/c01_math_audit`. Parent claim #42 comment 6919165600, session `hairer-codex-c01-completion-20261116`. Base `7a8b49ab78b335a539309139c398f3e325853ad3`. Review performed in isolated clone `/tmp/ym42-math-audit`, with exact final working files copied from parent.

## Verdict

**PASS for the six-file analytic/kernel/symmetry scope at the identities below.** No remaining required mathematical correction identified. This does not certify the other five C01 chapters or the independent cross-package same-data assembly, which parent and the separate reviewers cover. It does not imply human acceptance or full Yang–Mills proof closure.

## Final changes and checks

The final strip argument explicitly narrows the width to at most pi/4 before applying the reciprocal-shift law, and chooses h=sigma=b with 2b<eta in coefficient extraction. These choices are independent of the flight/history and preserve every supplier upper bound.

The rectangular exterior lift now fixes the fine residue and fine three-form label as output coordinates. Division and contraction act on coarse exterior columns only; their four-coordinate construction does not sum over L-dependent output dimension. Thus the initial O(L^-3) bound survives uniformly. The Gram calculation then legitimately introduces L^4 residues and the fixed n_3 label count: each coefficient convolution costs c^2 L^-6, giving n_3 c^2 L^-2. The exponential triangle inequality and Tonelli justify all sums. The analogous O(L^-2) pair gives an O(1) Gram cost. These are cover-row bounds before periodization.

The D_c inverse reference is now explicit and correct: positive-row analytic inversion applies to I+l d_2 B_c d_2^T >= I, with l fixed at the stage and a train-uniform original strip/spectral bound. It supplies the uniform exponential bound used for R. The tower construction correctly says it inherits the donated A0,T differences and proves bounds for remaining blocks.

The top bed clarification is correct: its unamended pulse H is I; the amended G=(I+l d_2^T d_2)^-1 is not generally I. Its exact-form action and zero-frequency value equal I. This prevents accidentally identifying the metric with the pulse off the curl subspace.

## Complete local argument checked

Reread the five analytic/kernel files in full in the initial pass, then read the unchanged signed-symmetry chapter in full in the final pass. Reread the complete semantic delta and its affected interfaces in this final pass. Checks include analytic gluing and contour shifts; real Fourier coefficients; centered residue carries and L^(-e-s) powers; rail/plank and train-history uniform bounds; noise summation and nonzero alias reciprocal bounds; bulb/bend identities and positive lower bounds; regular one-form denominator and both gain branches; dual wire branch multiplication and reciprocal periodicity; rotor/filter-chain identities, covariance recursion, principal brace cancellation and puncture removal; all-period Fourier transfer with L^-3 counting-measure adjoint; analytic inverse and positive root construction; amendment identities; one-sided and two-sided exterior lifts; uniform Gram estimates, curvature positivity and stagewise choice order.

The old missing pilot estimate is now proved in `lem:ex-lattice-primal-entrywise-bound`; its regular sa denominator has a positive principal real term even at zero and bounded analytic continuation. The proof is not circular with the kernel transport identities: the latter supplies explicit algebraic expressions, while the estimate uses their regular formulas and the earlier scalar component estimates. The formulas and estimates together identify the original transport.

The final revision also supplies the explicit forward equation reference for the overlap and states uniformity over all wing train histories in the wire proposition. Both accurately express what its existing proof establishes.

The unchanged signed-symmetry chapter was additionally read in full. The lower-endpoint shifts and orientation signs give the curl pullback relation; the level-response signed equivariance follows by the exact alias-set bijection, even scalar filters, paired rails and induction on the noise list. Fourier uniqueness transfers it to diagonal Laurent coefficients. Equal-face anchor shifts cancel, unequal-face entries vanish, and periodization reindexing is legitimate by absolute summability. The finite bilinear identity follows by the plaquette permutation. Finally the already corrected amendment reference supplies Gd_1=Hd_1, so the equality is for the one-form quadratic form rather than an unsupported off-curl symmetry. Colourwise summation preserves it on every positive period, including seam cases.

## Evidence and limitations

Read AGENTS, contributing/coordination/proof-standard, the six full chapters, relevant horizon passages, historical C01 mathematical reviews, revision-one review, and kernel/horizon evidence. No manuscript changes were made by this reviewer. No new external theorem is used by these repairs; all steps use the printed elementary Cauchy/Fourier/matrix/exterior-algebra arguments. Source correspondence is a separate review. No Lean build, axiom replay, LaTeX build, render inspection or blueprint checker was run by this reviewer; parent owns those checks.

## Reviewed SHA256 identities

- `manuscript/existence/free-kernel-estimates.tex`: `80cae0f70768123152cf993f83e669af3e11c1391a4a47a90618e0a49006f60c`
- `manuscript/existence/free-kernel-components.tex`: `ef75fdd6121eab35bddc6dec9d45fd9b8ed3c0bc7d91de186b9dc7331d9a342d`
- `manuscript/existence/kernel-transport-identities.tex`: `509a2ecd65bd6280619ec3d9675ecf98e8de4a6e3defa0cb329fe81063b73f80`
- `manuscript/existence/positive-row-producer.tex`: `c6b8846923c77873d00763ffe4774a09f66f975d924a957d1e3b04ecc393409c`
- `manuscript/existence/curvature-horizon-producer.tex`: `af0019a23337e20048c9b942e3f2b0f1b308451723d04cf53a56ec54a63957bf`
- `manuscript/existence/quadratic-lattice-symmetry.tex`: `fcd481edaeb9044f8ad67a06b512844fef75bd07efb613feea55c0b6aa51d5e2`
