# Mathematical validity review

Unit YM-000026, bounded C10 annulus scope; reviewed PR95 commit
`ebc64a227e0572bd4fe8f6ecb744f6529ef01e07`. Exact four-file SHA-256 values
are in `hashes.json`. Reviewer: Codex session
`mgubi-codex-c10-annulus-20261113`, submitted for @mgubi. This session did not
author the C10 patch. No human approval is represented by this agent report.

## R1 — retain the fixed-film ticket premise in the exported annulus result

**Priority P2; changes requested.**

Locations at the reviewed commit:

- `manuscript/existence/annulus-same-data-binding.tex`,
  `prop:ex-annulus-estimate` and its closure paragraph, lines 367–372.
- `manuscript/existence/annulus-recording-yield.tex`, final scope paragraph,
  lines 342–353.
- The outgoing `C10-to-C11-annulus-estimate` row in the author's part-B ledger.

The same-data chapter explicitly makes the fixed-film ticket calculus an
input at lines 151–161: the gauge-fixing and directional films must record
their finite-torus matrices and first two background derivatives, with the
corresponding rules for products, rears and inverses. The author's ledger
correctly keeps this as `unassigned-to-C10-film-tickets` and its findings
identify the missing proof. However the concluding paragraph says the
finite-layer realization has been discharged and only (W), (S), and the
quadratic coefficient remain; the recording chapter says only the baseline
and response service remain. The outgoing C11 row also omits the ticket edge.

This is a real dependency of the *recording conclusion*, not just terminology.
Adding Q and W gives the intended action's response tickets. It does not, by
itself, identify the slots of the extra regulator/gauge films with derivatives
of the two finite matrices whose logarithmic determinants define the pole test.
The ordinary matrix log-determinant identity can be applied to those slots only
after that identification. In the source, `YM.Stationary.gemF` consumes
`grantM` and `grot`, which use `pelt_ticket` and the product/rear/inverse ticket
rules. The real-momentum denominator identity and common strip do not replace
these first- and second-variation identities.

**Requested repair:** either supply and separately review the fixed-film ticket
calculus, or retain it as a named premise of `prop:ex-annulus-estimate`, the
recording scope statement and the C10-to-C11 handoff/ledger. The latter preserves
the existing conditional draft; it must not be advertised as closure of that
premise. The open edge is already disclosed in the author's report, so this
finding requests consistent propagation of that known gap, not a duplicate
producer or a claim that the annulus numerical bound is false.

## Local arguments checked

All four manuscript files were read. The following are bounded positive findings,
conditional on their stated analytic/supplier inputs and the ticket premise
above. They are not an acceptance of the whole C10 package.

1. **Price calculus and two populations.** (F1)–(F3) preserve the order of matrix
   factors. In the upper face the unshifted inverse is constant, so the local
   arch uses a unit-scale second derivative; the regulator arch instead costs
   mu²/T² at scale T. The resulting upper powers T^-2 and mu²/T^6, lower power
   T^-4 and shell difference (T+mu²/T²)/T^4 agree. The exact four-term
   telescoping identity (F9) is valid without commutativity. The extra cold
   geometry (F4') supplies T² <= 64 peb; it is satisfied for T=|x|+mu and
   for T=|x| on the shell. The halo inverse is not used at x=0.
2. **Reference film and local contacts.** The regulator starts with the ghost
   film, uses its massive inverse, takes the ninth power after multiplying by
   mu², then multiplies by mu² again. The tab/one-leg/two-leg powers are
   consistent with the displayed inverse and product rules. Constant direction
   sandwiches preserve the budgets. The local tab contact is cubic and the
   marked-leg contact quadratic; the Taylor argument correctly converts these
   into scale-weighted derivatives. Summing the three displayed Wilson terms
   and the gauge-fixing term gives the claimed vector linear coefficient.
   Floor normalization and denominator matching remain on the same bed.
3. **Pole and halo normalization.** The ghost and vector numerators, the
   -C_G color trace, and the two quotient second derivatives yield precisely
   the displayed halo difference 2 Pi_G. The spherical averages 1/4 and 1/24
   give -11/12; normalized measure (2 pi)^-4 then gives
   -11 C_G/(24 pi²) log(mu^-1). The factor one half in the picture is
   compatible with alpha being the real second derivative, not an extra
   Taylor coefficient. The two-wave conversion takes real parts only after
   subtracting the complex halo identity.
4. **Fourier recording.** Full-grid character orthogonality leaves frequencies
   in ell Z^4, with nonzero frequency size at least ell. The contour shift and
   geometric sum give the stated royalty and exp(-sigma ell/4) rate. The exact
   finite derivative uses the mesh mean, whereas the limiting picture uses
   the integral. Dividing D² by 2! gives the normalized Recorded estimate,
   with the site count exactly once. The finite real Hessians and cofinal
   dense grids justify the limiting exchange and reality identities; these
   symmetries are not inferred from the factor 1/2 alone.
5. **Common strip and choice order.** The zero-layer identity at cofinal grids
   extends by continuity and holomorphy. The positive floor and exterior
   identity imply invertibility of the two regulated tabs on the real torus.
   Compactness and periodicity give a common complex neighborhood for a fixed
   regulator, with a further shrink for shifted arguments and boundedness.
   This argument is qualitative in L: the width/bound may depend on L, while
   the radial constants are fixed beforehand. One response, bed, clip, path,
   regulator and original side sequence are retained throughout.
6. **Radial integration and C11.** The inner ball costs a pi²/2; the outer
   region costs a times its volume bound; the annulus costs at most 3 pi² b.
   Thus D0 is independent of L and the side sequence. `lem:path-radial-log`
   is an elementary independent input, not a circular appeal to the completed
   annulus theorem. Subject to R1 and the existing (W)/(S) inputs, the resulting
   all-odd-L output has the quantifiers required by C11's HorizCalc, with
   L_min=1, a single picture for the side sequence and error n_i^4 e_i.

## Remaining inputs and review limits

- (W) and (S), the conversion of coefficient pictures to fee-bounded marked
  responses, remain open author-specified inputs. They were not proved here.
- The quadratic path Hessian input `lem:ex-soft-quadratic-hessian` was consumed
  at its stated interface; its separate C10 proof was not independently audited.
- The all-side floor is stronger than a floor on one fixed torus. The real-symbol
  bound also uses the finite Fourier diagonalization and continuity of the row
  symbol. The source `Floor.uniform`, `range_field`, `Bed.holo` and `rug_test`
  support this bridge. Its manuscript explanation is compressed; no false
  stronger positivity premise was identified.
- The manuscript's explicit linear Wilson-vertex arithmetic was checked, but
  the entire upstream Wilson-action differentiation development was not replayed.
  Likewise this is not a transitive review of every film/ticket implementation.
- No external literature theorem is newly invoked by the changed arguments;
  the elementary matrix, Fourier, compactness and polar steps are given locally.
  Shared background notes and canonical evidence were consulted; no new
  literature-based replacement or novelty claim is made.

**Mathematics verdict:** changes requested for R1's dependency export. No further
local numerical/algebra error identified in this bounded pass. Renewed review
at the repaired hashes and responsible human acceptance are required.
