# Compact jets on the actual selected trace curve

Author: compact_jets_proof, under parent claim6908902250. Output only `/tmp/ym56-jets-20261116/manuscript/existence/trace-scribe-producer.tex`; baseline is PR465. No GitHub writes or Lean changes.

The compact-jet estimate was already proved in canonical manuscript `actual-stress-normalization.tex`, subsection “Derivative transport and convergence on compact sets”. The missing consumer step was the actual same-curve application. The new text identifies the completed corrected maps, radii, tables, extraction, and ultrafilter with the present Scribe maps, and derives the uniform short-test bound `M K_v/(i+1)` from `eq:ex-lattice-trace-test-error` by the fixed finite-slot expansion in `thm:ex-lattice-selected-trace-gallery`. The completion changes only finitely many terms per grade; for a finite word the agreement tail is independent of the test.

This supplies precisely `eq:stress-uniform-tests`, not only individual-test convergence. The canonical argument recovers transported derivatives using finite separating measurements, extends to moving labels by finite-basis multilinearity, closes discrepancies under all fixed position derivatives, and uses cutoff Fourier inversion with an integrable `(1+|xi|)^(-b)` majorant, b>4n. The new consumer proof records this match and obtains compact convergence of all fixed jets on the same scaling, including coordinate ties away from actual collisions. The independent compact-comparison premise is removed. The earlier shell change-of-variables proof is unchanged.

Incoming inputs remain the original supplied-gallery finite-volume lift, short-test, dimension, and symmetry data; smooth finite-dimensional selected/reference hierarchies and their exact derivative laws; and all-grade reference test separation. No physical stress normalization result is used to prove the compact-jet statement, avoiding a cycle. No second chart curve is introduced. The same further subsequence acts on every datum; its error bound becomes MK_v/(n_i+1).

## Source correspondence

Directly inspected imported source at pin3456e5e75cf8d4cd558955a5c7638fba2d68f464:

- `YM.Next.UVStress.Fades` in Weak.lean: uniform order-zero bounds over tests with fixed compact support and supremum bound. These are stronger than distributional convergence at each individual test.
- `Stations.build_curve` in Rates.lean: the uniform short-test estimate gives Approaches on expanding windows, with the finite grade/arity tail independent of the test.
- `scaled_identity`, `head_tilt`, `bend_limit`, `flowing`, `closed_path`, `travels_jet`, `comparison_jets` in Focus.lean: finite-dimensional recovery of derivative maps, moving-label derivative closure, and compact-jet application.
- `GradientFamily.vanishing`, `radial`, `localized`, `uniform`, `jets` in Local.lean: cutoff Fourier decay and inversion, then fixed-jet convergence on separated compact sets.

Canonical mathematical reuse was preferred to duplicating the Fourier proof. `argument-outline.tex` includes the Fourier transform on Schwartz space among reader prerequisites; no new external theorem or unverified reference is introduced. Shared background notes were consulted.

Checks: `git diff --check` passes. No build or Lean elaboration by child; parent builds the integrated text. Independent reviewer is analytic_jets_review; its final hash and outcome supersede any preliminary author fingerprint.

## Added same-reference dictionary (parent follow-up)

Final candidate file SHA-256: `78844a97748b4d555aa6d56c1b7d73b2d57ae0c45491053bdf53c6594ef43e3a`.

The paragraph “Identifying the actual reference fields and their normalization” now discharges the R1/R2/R3 identification inputs of the existing free Maxwell Ward proof for the actual supplied comparator. The map is explicitly polynomial -> fixed frame coordinates -> reference quotient, not a new choice of comparison model. The defining freeTable moment formula and inverse coordinates give the exact Wick-moment dictionary. All-grade test separation identifies the correlation quotient with the on-shell sector. The derivative and rotation maps are conjugated polynomial derivations, so the existing all-polynomial Ward proof applies to these same fields. Faithfulness also shows any plan specified by its positional derivative laws coincides with the canonical one.

Crucial sign: branch coefficients (-1,1/4,-1) give M0=-J0, whereas the manuscript polynomial outward-flux law for J0 has coefficient -1. Therefore the actual M0 has coefficient +1, as Scribe input2 requires. The same dictionary identifies O as exactly the image of the ordered-pair quarter-square polynomial; the already-proved trace-free-scalar computation gives the actual reference normalization, and then the existing differentiated two-point test proves input3.

Direct source correspondence, same imported pin:

- Climb.Cells.Bel -> Spin.Sheets.comparator -> Euclid.Comparator.freeTable; `decodes` is the exact coordinate-to-Wick moment identity.
- Next/MAXWELL/System.lean: `target_labels`, `fields`, `address`, `display`; `scheme` and `address_derive`; `scopeRewrite`, `gear`, `original`, `inertia`. These are the actual address, derivative plan, rotation, and stress, not inferred from existence of an unspecified free model.
- Next/MAXWELL/Lit.lean `herald` sets W=scheme and K=gear; `maxwell_supplies` installs it on the same supplied Family. UVNext/FREE_STRESS_CERTIFICATE/Pressure.lean `names` preserves W, K, and vacuum while setting the canonical stress.
- TraceExtension/Chart/Auth.lean `ff_pair`, `pair_bill`, `target_sign`, `canonical_meter`, `Litpay`: the branch tensor is torch(-1), and its Ward coefficient is +1.
- Push/STRESS_FLUX/Lift.lean `fromPol_formula`; TraceExtension/Chart/Stage.lean `OScale`; TraceExtension/Foundation/Constant.lean `wick_norm`: exactly the actual curvature-square field and its 3*lieDim/pi^4 normalization.

New equation labels: eq:scribe-reference-dictionary, eq:scribe-reference-derivatives, eq:scribe-reference-stress-sign, eq:scribe-reference-scalar-identification. Referenced manuscript labels checked to exist; diff-check passes. No independent reference stress-law or scalar-identification premise remains for this actual comparator. General upstream supplied-family, finite-volume, and selected physical construction assumptions are not asserted discharged by this child work.

The dictionary explicitly fixes its covariance to eq:maxwell-ward-covariance and potential kernel (4 pi^2 |x|^2)^(-1), matching Maxwell/PotentialKernel.lean `normal`; thus invoking trace-free-scalar does not leave a covariance normalization premise.

Build follow-up: the branch material/coefficients labels exist in external unit YM-000034, which is not included in this manuscript compilation. Converted those two eqref calls to explicit external-unit/file/label citations. Removed the stale sentence retaining the O identification as a premise and now cites eq:scribe-reference-scalar-identification as proved above. Diff-check passes.
