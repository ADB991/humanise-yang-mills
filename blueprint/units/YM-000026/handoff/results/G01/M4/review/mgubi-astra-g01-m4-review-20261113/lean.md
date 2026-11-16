# Textual Lean-correspondence review

Identity, claim and reviewed commit: [README](README.md). Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. **Outcome: changes requested; no acceptance.** This is source inspection, not elaboration or proof validation. Exact hashes are in [validation](validation.md).

## L1. Correct conditional interface to the witness theorem

`YangMills.constant_insertion_witness`, `formal/Adequacy.lean` lines 735–747, takes an actual `C₀ : WilsonFamily g` and `T₀ : Hierarchy C₀`, followed by `T₀.Reconstructed`, `T₀.OperatorProductExpansion`, `T₀.TraceTest`, and hH. hH quantifies over all n, tags a, and configurations x, and says a slot exactly equal to the grade-zero zero vector forces the selected correlation to vanish. It is not restricted to separated configurations. The M4 zero extension supplies the missing complement, conditional on multilinear separated correlations.

`YangMills.jointExistence_body_constant_insertions`, lines 751–763, yields the body of `YangMills.JointExistence` at g and insertion independence from gauge configurations. Its proof uses the former theorem and q=id. Thus the claimed implication is correct **if** all input structures and hypotheses are supplied for each simple g. This review neither verifies those inputs nor reruns the recorded Adequacy compilation. It does not import `YangMills.constructed` to fill them.

## L2. Trace exclusion has the stated limited scope

`YangMills.Hierarchy.TraceTest`, `Lean/ChallengeSpec.lean`, requires centered operators, positive amplitude, the complex-valued right-hand short-distance limit, and exclusion of every finite list of public `Track`s. A public `Mode` includes a nonnegative mass, natural spatial/time orders, and a continuous homogeneous real numerator. It is not an arbitrary continuous spectral mixture.

`YM.TraceExtension.Wick.real_profile` (`Wick/Refute.lean`) supplies `Expands` for the real part of every finite native collection. `Expands` is all integer orders (`Wick/Expansion.lean:47`); only order zero is needed by `YM.TraceExtension.Wick.no_powerlog` (`Wick/Log.lean:96`). The latter concludes the real limit amplitude is zero. `past` is exactly the right-hand filter at zero. `EuclideanAsymptotic` (`LogScaling.lean:74–75`) uses the same factor `r^8(log r⁻¹)^2` as public `shortDistance`.

Taking real parts, replacing the trace profile by an eventually equal finite profile, then applying `no_powerlog` contradicts the positive amplitude. `Lean/TraceBridge.lean` defines the field-for-field `nativeMode`, `nativeTrack`, `nativeTerms` conversions and proves `profile_eq`; no extra integrability, covariance, mass-gap or Yang–Mills hypothesis enters this profile conversion. The *existing declaration* `euclidean_excludes` is syntactically specialized to the internal `F`; an arbitrary public hierarchy uses the same argument, not a direct application of that declaration without adaptation. M4 explicitly says the generic Lean formalization was not done, correctly.

This confirms the exclusion implication once the trace asymptotic is supplied. It does not exclude a continuous-mass GFF, and does not identify the submitted Fock two-point function with S; see mathematical M1.

## L3. Clauses whose exact quantifiers matter

- `Hierarchy` itself already needs a `WightmanTheory`, finite-dimensional normed complex `Field d`, finite `Channel d`, all label maps, a phase space and globally defined coefficient functions. It is not yet instantiated by a list of candidate formulas.
- `Reconstructed.axioms` asks for all W0–W3. `FieldSystem.field` is complex-linear in labels, tests and domain states; `DomainAxioms.tempered` is continuity into the Hilbert space for each domain state, not just scalar distributional continuity. `cyclicVacuum` is equality with the span of all polynomial vectors. M4 O1 correctly leaves these open.
- `PoincareAction` requires a homeomorphism to all proper orthochronous Lorentz transformations and translations, the affine product law, and fixed pullback of tests. `W2` fixes state/label covariance. Scalar spatial reflection of a rotationally invariant measure does not alone construct the transformed derivative-label action. W2 does not separately demand finite-dimensional label transformations; finite `Field d` are hierarchy data. The proposed filtered derivative action is an additional construction choice.
- `analytic` and `root` quantify over **all** labels and arities. `root` uses the same labels at purely imaginary times; there is no implicit Wick-rotation map in the public predicate. The single scalar two-point sign check is therefore insufficient; mathematical M2 gives a specific missing factor.
- `boundary` is the right-hand one-ray limit for every strictly increasing height and every tuple of Schwartz tests, with ordered vacuum expectation as limit. The public statement has no separate integrability field. This does not excuse proving the displayed integral/limit for the proposed kernel. O3 remains open.
- `Clear` includes mutual spectator separation as well as separation from o. `OperatorProductExpansion.remainder` quantifies eventually in r **before** all x,o,y,s, but after the fixed labels and M,η,c,ε,D. This permits the constants and thresholds used in mathematical M5, and forbids dependence on spectator positions or phase. The public coefficients are indexed independently of D and spectator data.
- `acts` is nonzero as a linear map on the common domain. A nonzero vector obtained by applying the field to the vacuum suffices, once that operator is defined. `faithful` concerns all nonzero polynomial labels, not only single generators.

## Required source-facing changes

Replace the completed-clause ledger and headline with conditional statements; explicitly include normalization, complex-test conventions and derivative-label continuation in the open construction interfaces. Preserve the distinction between the verified scalar profile and an actual `TraceTest` for a coherent `Hierarchy`. The source implication to the constant-insertion witness is useful and correctly scoped, but presently conditional. No source change or weakening of a public predicate is requested.
