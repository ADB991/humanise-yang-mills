# Mathematical validity review

Reviewed content and identity: [README](README.md); hashes: [validation](validation.md). All line locators below refer to M4/README.md at `c55c16531bbe1eb33dd3c22c289e45d86c8b5d00`. **Outcome: changes requested; no acceptance recorded.** No manuscript files or mathematical labels are being approved.

## M1. Fix the momentum/Euclidean normalization (required)

Lines 37–42 define the unnormalized mass-shell measure
`dμ = ∫ρ(ds) δ(p_t²−|p|²−s) 1_{p_t>0} d⁴p`, but use
`Δ_m(r)=m K₁(mr)/(4π²r)`. Line 78 explicitly identifies the Wightman two-point function with `∫exp(i⟨x₁−x₀,p⟩)dμ(p)`.

These displayed equalities cannot all hold with ordinary Lebesgue `dp`. At zero spatial separation and imaginary-time difference `r>0`, integrating out `p_t` in that last expression gives

`∫_{R³} e^{-r sqrt(|p|²+m²)} d³p/(2 sqrt(|p|²+m²)) = 2π m K₁(mr)/r = (2π)³ Δ_m(r)`.

Thus the written μ and written two-point integral produce `(2π)³ S`, not the `S` in §2. The issue is the bridge from the Fock conventions to S, not the Bessel substitution in §2. A factor `(2π)^{-3}` in the mass-shell measure, or an explicitly compensating field/CCR normalization and correction of line 78, can repair it. State the Fourier transform, creation/annihilation conventions and resulting two-point function together before claiming the exact trace normalization for the theory. A convention hidden in `hat f` alone does not repair the explicit unsmeared equality on line 78.

The primary reference [Dütsch–Rehren, arXiv v1, §2, equations (2.1)–(2.3)](https://arxiv.org/pdf/math-ph/0209035) explicitly keeps a `(2π)^{-(d-1)}` CCR factor; this illustrates why its Fock formulas cannot be transplanted without fixing normalization.

## M2. Specify Wick rotation for derivative labels (required)

Lines 46, 77–78 and 87–93 use the same labels for Minkowski derivative fields and Euclidean derivatives of S, without a time-derivative conversion. The base-field continuation alone does not prove `root` for all those labels.

For the simplest test take the second label to be `ξ_{e_t}` and the first `ξ_0`, at zero spatial separation. Write the normalized scalar analytic two-point function as `F(z)=∫e^{izE}dν(E)`, so `F(ir)=S(r)`. The Minkowski derivative at the second point has continuation

`F'(ir)=i∫ E e^{-rE}dν(E)=−i S'(r)`.

The raw Euclidean derivative Wick formula instead gives `S'(r)`. Here `S'(r)<0`, so these differ. More generally `∂_z|_{z=iτ}=−i∂_τ`. This is not an obstruction to a repaired GFF candidate: one may consistently insert the factors in the Euclidean label map/correlations, or rephase the Minkowski fields and adjust the adjoint and Lorentz-label actions. It is an obstruction to accepting the literal unqualified derivative identification as a proof of `root`. Record the convention, check this two-point example, and propagate it through the graph coefficients and `boundary`.

Also correct or qualify line 38 for complex tests. In the usual Fock convention `a(h)` is antilinear in h and `a*(h)` is linear; `a(hat f)+a*(hat f)` is then only a real-linear formula. The public field is complex-linear in every Schwartz test. A suitable conjugation/reflection in the annihilation wavefunction or explicit complex extension is required. This is another convention to supply, not a no-go theorem.

## M3. Retain the scalar limit; narrow the completed-clause claims (required)

For **S defined exactly by line 42**, the substitution and limit at lines 54–60 are correct. With `L=log(1/r)`, `s=u²/r²` yields the prefactor `c/(8π²)` and the lower endpoint `er`. For sufficiently small r, the low interval contributes at most `O(L²r³)→0`; on `u≥sqrt(r)` the integrand is dominated by `4u⁶K₁(u)`. The latter is integrable, using `K₁(u)~1/u` near zero and exponential decay at infinity. [DLMF 10.43.19](https://dlmf.nist.gov/10.43#E19), with its parameters μ=7, ν=1 (condition 7>1), gives the moment `2⁵Γ(3)Γ(4)=384`. [DLMF 10.30.2](https://dlmf.nist.gov/10.30#E2) and [10.40.2](https://dlmf.nist.gov/10.40#E2) supply the endpoint asymptotics. Consequently the limit is `48c/π²=3n_G/π⁴` for the stated c. The real limit gives the complex limit by the continuous embedding.

`n_G>0` follows from the nonabelian conjunct of `GaugeGroup.IsSimple` and finite-dimensionality of the matrix Lie algebra. Centering is valid for a consistently realized scalar Fock field. The generic `excludes` implication is valid under this positive asymptotic; see the separate source report.

Nevertheless “TraceTest in full”, “the OPE … proved”, and “No clause fails” (lines 10–18, 52, 125, also PR/issue summaries) should be replaced with an explicit conditional ledger. At present the scalar kernel calculation is established; its identification with the chosen theory needs M1, and the all-label analytic/root data need M2 and O1/O3. O2 is not discharged merely by assuming Wick's theorem. The original record does disclose O1–O3; this review requests that its headline and completion statuses respect those disclosures. It does not demand solving O1–O3 within this partial submission.

## M4. Grading, faithfulness and vanishing: sound conditional components

The chosen filtration is finite-dimensional: only `|α|≤d−4` occur among generators of weight at most d, and each has positive weight at least 4, bounding the number of factors. Its union contains every polynomial, so inclusion gives injectivity and coverage. Each exact-weight channel set is finite; weight zero contains the identity monomial. A strictly homogeneous decomposition alone would miss sums of distinct weights. However `covers` does not logically force a filtration among every possible family of subspaces; qualify the final sentence of line 46 to this proposed polynomial construction.

The faithfulness argument at line 76 is sound conditional on the asserted creation-component formula and common operator domain. Degree-k polynomial labels identify with symmetric polynomial tensors in k independent four-momenta; symmetrization is injective on that symmetric tensor space, not an additional quotient by a field equation. For k≥1 the density is positive on the open set `p_t>0, p²>e²`, so a nonzero such polynomial is nonzero on an open positive-measure set. A Schwartz Fourier test nonzero near the corresponding sum makes the k-particle component nonzero. The k=0 case is the identity with a test of nonzero integral. The formula must still be obtained from O1, so the table's conditional status for `faithful` is appropriate; the issue handoff's unconditional list is not.

The phase identities follow from a singleton with Dirac probability. `represents` follows if a Wilson family with the stated token type is supplied (it also requires Haar data and sequences, not just a token type). Smoothness and permutation follow for the defined separated-point Wick graph functions once the derivative conventions are fixed. The all-configuration hypothesis hH follows from multilinearity on separated configurations and the prescribed zero extension on the complement. In particular the zero *label* in grade zero is not the unit polynomial; the latter has nonzero correlations.

## M5. OPE: uniformity is plausible, but O2 remains substantive

The actual `Clear` requires both distance at least c from o and pairwise spectator distance at least c. For `Mr<c/2`, every segment from `x_i` to o stays at least c/2 from a spectator. Thus Taylor derivatives of external lines have uniform bounds; spectator–spectator lines also have uniform bounds. Distant spectators do not create a counterexample to this argument. Polynomial spectral growth together with the positive mass cutoff supports the derivative bounds in lines 90–91. This review found no power-counting obstruction in the stated conditional estimate.

To claim the public OPE, however, O2 must produce **one** family of coefficients for all D, independent of b,y,s, and extend it from monomial insertions to arbitrary polynomial elements of `Field d`. Line 93's grouping still depends on unwritten symmetry factors and must show that the coefficients retained through grade D agree with that single family, rather than define a new coefficient family at each Taylor cutoff. All configurations are arguments of `coefficient`, so its extension off the separated locus must also be specified (the small-r bounds only constrain the admissible locus). These are exact interfaces missing from the purported proof, not demonstrated impossibilities.

Conditionally on those identities and derivative estimates, internal lines cost at most `r^{-w'}`, Taylor errors gain `r^{K+1}`, and a dropped grade `j>D` gains `r^{j-w'}`. Since `w'≤weight a`, K=D+1 suffices. For fixed labels, finite sums and their constants can be absorbed by `r^{-ε}` after shrinking r; the eventual radius may depend on a,b,M,η,c,ε,D as permitted by the source, but not x,o,y,s. Include arbitrary polynomial inputs, empty slot sets and the identity channel in O2. Calling O2 “routine” does not establish it.

## M6. Literature and O1/O3 remain open

The primary [Klein paper, Pacific J. Math. 45 (1973), 275–292](https://msp.org/pjm/1973/45-1/pjm-v45-n1-p23-p.pdf) was opened, including Theorem 2 (p. 287) and Proposition 3/Theorem 3 (p. 290). It gives operator-domain and covariance results with explicit hypotheses. The manuscript's cautious non-discharge of O1 is justified; a domain being different does not by itself prove unusability, and the smearing/spectral restrictions may be verifiable here. No such complete application is supplied or certified in this review. The PDF text extraction garbles some exponents; screenshot retrieval failed, so no stronger condition-by-condition claim is made.

Dütsch–Rehren v1 §2, pp. 5–8, was also opened. Equations (2.9)–(2.11) allow polynomially bounded spectral weights, and (2.14) onward discuss Wick products and derivatives. This is useful primary support for the candidate, not verification of the exact public common domain, vector-valued continuity, label action or boundary formula. Greenberg's original text was not inspected and is not relied upon here.

Lines 109–114 are a route to O1, not a proof of invariant-domain/continuity estimates. Temperedness of μ alone is not the reason the creation wavefunction is square-integrable: the forward-cone support prevents cancellation in sums of positive-energy momenta. Mixed terms and preservation of a suitable domain require their own estimates. O3 additionally needs the exact product-test integral and one-ray limit. No complete common-domain, analytic-continuation or boundary theorem was proved in this review.

Required follow-up: repair M1–M2 and the completion ledger now; preserve the valid scalar limit and conditional components; keep the missing construction/OPE/boundary work explicitly open for separately bounded tasks. No conclusion about correctness of the internal constructed Yang–Mills theory follows from this review.
