# Independent review: compact jets on the trace curve

Reviewer: `/root/analytic_jets_review`; no authorship or manuscript edits. Scope: the new uniform-short-test and compact-jet deduction, with its status edits, in `trace-scribe-producer.tex`. Final reviewed SHA-256: `438ad7a4ade55b24995aeb59679ca9ef28e823aedd0d10a196c37e5c16d08897`.

Verdict: PASS mathematics and textual source correspondence. No required changes. The independent compact-jet assumption is eliminated for the stated completed corrected chart family, using the canonical uniform-test theorem and the hierarchy/derivative laws. This is not a proof of the finite-volume chart receipts or of all weighted response inputs elsewhere in the scribe.

## Mathematics

The source of the needed stronger test convergence is identified precisely: `thm:ex-lattice-selected-trace-gallery`, `eq:ex-lattice-trace-uniform-tests`, and `par:ex-trace-completed-uniform-tests` in trace-calibration-producer. The finite-slot expansion gives a finite constant K_v independent of the test and index. The raw bound depends on the test supremum, not its derivatives. For each fixed word, completion changes only finitely many grade maps, on a common tail independent of the test. Consequently the displayed supremum estimate MK_v/(i+1) holds for those completed maps. After a common subsequence its bound is MK_v/(n_i+1), still vanishing.

The new paragraph explicitly fixes the present maps to this same completed corrected family; it does not deduce that independently selected maps with the same limits can replace them. It retains the prescribed-sequence chart production hypotheses of the canonical theorem/corollary. All subsequent restrictions must be common restrictions of the full data. In particular this review does not independently certify that every other weighted-response receipt has been produced on that family.

The application of the canonical compact upgrade in actual-stress-normalization is valid. Finite separating tests give injective limiting measurement map L and L_i -> L, hence a uniform lower bound for L_i. Integration by parts supplies convergence of L_i applied to the transported derivative, without needing an a priori bound for that derivative. Subtracting L_i D^0 and using the lower bound proves operator-norm derivative convergence in finite dimension.

Finite-basis multilinearity transfers the uniform-test estimate to converging moving labels. Fixed spatial derivatives replace a label by its transported derivative, which converges; thus the discrepancy class is closed under every fixed finite number of derivatives. With a smooth cutoff supported inside configuration space, Fourier test functions have a common supremum norm regardless of frequency. The canonical integration-by-parts argument applied to the finitely many descendants gives an integrable bound C epsilon_i (1+|xi|)^(-b), b>4n, epsilon_i -> 0. Fourier inversion therefore gives compact uniform convergence; repetition gives every fixed jet. The finite grades required by those descendants eventually fit the increasing cutoff. The zero-arity case is scalar. No contact-point bound or unjustified pointwise-to-uniform step occurs.

This compact argument precedes and does not use the conserved-stress normalization in its canonical chapter, so the application is not circular. The existing shell deduction then legitimately uses its order-zero consequence. The final status paragraph was rechecked at the final hash: it removes the now-derived compact/shell assumption while retaining the reference stress laws, paid response, sensor, branch, clock and scale-selection hypotheses.

## Textual Lean correspondence

Independently read actual imported source at revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`:

- `YM.Next.UVStress.Fades`, Next/UV_STRESS/Weak.lean: the uniform bound ranges over compactly supported tests with a common supremum bound; `times`, `small_scalar`, and `sum` give the moving finite-basis closure.
- `head_tilt` and `bend_limit`, Next/UV_STRESS/Focus.lean: exact rescaled derivative identity, tested integration by parts and finite detecting measurements recover transported derivative convergence.
- `flowing`, `Travels`, `closed_path`, and `travels_jet`, same file: moving labels and descendants remain in one comparison family.
- `GradientFamily.scan_uniform`, `vanishing`, `radial`, `localized`, `uniform`, and `jets`, Next/UV_STRESS/Local.lean: uniform Fourier-frequency bounds, integrable decay, inversion and compact jet upgrade. The exposition uses a standard coordinate maximum to express the same decay argument.
- `window_closed` and `comparison_jets`, Focus.lean: the compact separated-window specialization holds for each fixed finite grade, arity and jet order.

Manifest hashes independently checked: Focus `abb3a589bfad409f1eacb3f68e2d8548c29771dacf2900f7cdbb659a9eb411d7`; Local `d891fc350b3f2c496ab3f718e3684fadc1053414aed8ce6ee87521b50ac0a683`; Weak `8ced37b94c281a5f90efb954ea18a2aa86baacc8ddee4da72714e294a28418e7`.

No Lean elaboration, LaTeX build or rendering by this reviewer. The parent handles build validation. No whole-issue or global dependency closure is asserted.

## Final bounded follow-up: actual reference dictionary

Final reviewed scribe SHA256: `8937129fa4d53ce7a9cddc77aec823b762219c348b1d599c7aa89a8c77c8764b`. This supersedes the preceding scribe fingerprint. PASS is maintained.

Independently reviewed the added paragraph “Identifying the actual reference fields and their normalization” and corresponding final status adjustment. The coordinate/register projection dictionary is the actual reference Wick correlation formula, not a new comparison model. The address identifies the quotient precisely with the invariant on-shell sector. Conjugating polynomial translation and rotation through that address proves the derivative/action identities; injectivity and spectator faithfulness give the stated uniqueness check for positional derivatives. This supplies the previously conditional reference identification requirements R1 and R2.

The sign is correct: the branch material coefficients (-1,1/4,-1), with no factor in the ordered-pair curvature labels, give M0=-J0, where J0 is the positive canonical Maxwell polynomial. The already proved polynomial Ward identity has outward collar coefficient -1 for J0, hence +1 for M0, for both translations and rotations. The scalar label is exactly the image of one quarter of the ordered curvature-square sum. Its Wick two-point normalization is therefore the existing 3 dim(g)/(pi^4 |x-y|^8), on this same table. Centering and nonzero two-point correlation exclude the zero field and scalar unit multiples. Removal of independent reference-law input in the concluding status is justified by this addition; paid response, sensor, branch, clock and scale-selection inputs remain explicitly conditional.

Source checked directly: `YM/Next/MAXWELL/System.lean`, especially fields/address/display, scheme/address_derive and scopeRewrite/gear; `YM/Next/MAXWELL/Lit.lean`, herald/maxwell_supplies; `YM/UVNext/FREE_STRESS_CERTIFICATE/Pressure.lean`, names preserving the derivative plan W, rotation K and vacuum when fixing stress. All three hashes match `Lean/SOURCES.sha256`. Also checked the manuscript branch coefficients and scalar definition against `trace-branch-moments.tex` and the collar sign against `free-maxwell-ward-flux.tex`. No further mathematical correction is requested. This remains a mathematical/textual-source review, not compilation or Lean elaboration.

Final covariance-normalization follow-up: PASS at SHA256 `b334281f9fcdce585303adf35a186a0f2214cb3e4a5b2638eb834150fcc68fd2`, superseding all earlier scribe fingerprints. The inserted sentence explicitly fixes the same table's curvature covariance as the two-curl covariance of (4 pi² |x|²)^(-1). Independently checked `YM/Maxwell/PotentialKernel.lean` definitions normal/Green and normalization, and `YM/Maxwell/Curls.lean` definitions curlOpp/bareCurl including the opposite-endpoint differentiation sign. They reproduce the manuscript's displayed Maxwell covariance exactly. Both source hashes match SOURCES.sha256. No additional covariance-normalization premise remains in the scalar inference.

Build-reference follow-up: final PASS fingerprint is `78844a97748b4d555aa6d56c1b7d73b2d57ae0c45491053bdf53c6594ef43e3a`. Checked the branch-material/coefficient references now name external unit YM-000034 and its exact file/labels, and the detector paragraph invokes the scalar identification proved above rather than retaining it as a premise. The cited branch definitions were already independently checked. These changes preserve the mathematical argument and remove stale conditional wording.
