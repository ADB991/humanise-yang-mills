# Lean correspondence review

Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; source files
are listed and fingerprinted in `inspected-source.sha256`. The prefix `S/`
below means `Lean/YM/Next/STATIONARY/`. Fully qualified declarations in the
table are in `YM.Stationary` unless another namespace is written explicitly.
The review used source text and immediate definitions, not elaborated types
or fresh Lean execution.

| Manuscript result / interface | Source inspected | Checked match and limits |
| --- | --- | --- |
| (F1)–(F3), slot budgets, `prop:ex-fleet-face-bounds` | `Jam`, `inverseBill`, `Fiesta`, `Fiesta.pair`, `Fiesta.inv`, `Fiesta.invDiff`, `sipPatrol`, `sipLight` in `S/OneLoop/Weights.lean`; `Week`, `Week.pair`, `Week.invW`, `Fleet.tadControl`, `bubbleControl`, `cool0`, `brass`, `haloControl` in `S/OneLoop/Propagators.lean` | Weighted derivatives through order two, separate tab/spot/arch prices, constant unshifted inverse, ordered product differences and shell-only free inverse. The prose's elementary matrix/Taylor proof was checked; not every subordinate source proof was replayed. |
| (F4'), cold denominator bound | `ColdR`, `orbit_lower`, `cold_safe`, `cinderTall`, `grainTall`, `granaryTall` in `Propagators.lean`; `dais_floor`, `throne_floor` in `S/Spectral/AuxReferences.lean` | Source includes `flow`, `slim`, `stage`: T <= |x|+mu, mu <= 1, centered box. They are now present. The total lower constants are min(epsilon,1)/2^16 and 2^-16. |
| Local record, two channels, uniform constants | `Orion`, `Hstar`, `Looms`, `Rally.register`, `Rally.shell`, `astronomy`, `Waves1`, `Waves2` in `S/OneLoop/Bubbles.lean`; `HouseWord` in `S/OneLoop/Lattice.lean` | All-centered scale |x|+mu and restricted shell scale |x| are distinct applications to the same record family. The prose restricts the second bound to |x| <= 1, sufficient for its radial integral. Common constants precede the record/regulator. |
| Ghost regulator and vector extension | `quarry`, `cinder`, `chert`, `chisel`, `coring`, `stony`, `graniteF`, `granary`, `massif`, `amena` in `Lattice.lean` | Massive ghost inverse, ninth power, final mu² weight and constant direction sandwiches. The response weights are vector 1/2 minus ghost; the coefficient derivative introduces the other 1/2. |
| (F14)–(F16), local contacts and positivity | `barePost`, `bareQuarry`, `rockEdge`, `bedLum` in `S/OneLoop/Leading.lean`; `range_field`, `Bed.holo`, `rug_test`, `pure_grade` in `S/Block/Static.lean`; `YM.Precision.Floor` and `Numeric` in `Lean/YM/PREC/Stacks.lean` | Metric normalization is at zero momentum, while the floor is quantified over torus sides. Real-symbol positivity follows from finite Fourier diagonalization and dense grids. The complete Wilson-vertex source derivation remains outside this bounded recheck. |
| Halo identity and pole | `waveOrb`, `waveVec`, `plaidSurge`, `tintTrace`, `divCatch`, `poleVec`, `haloRate` in `Bubbles.lean`; `cartWeight`, `poleSpin`, `costZone`, `absoluteGeode` in `S/OneLoop/MomentumIntegral.lean` | Color sign, derivative normalization, angular averages and the logarithmic coefficient agree. Quotient arithmetic and radial estimates were checked directly. |
| (AT1), alpha normalization | `profitable` in `S/Loops/Fourier.lean`; `speedy`, `leapTip`, `alphaPay` in `S/Films/LeadingRay.lean`; `polar_clock` in `MomentumIntegral.lean`; `YM.Tensor.coeff` in `Lean/YM/Analysis/Homogeneous.lean` | coeff is D^n/n!, profitable is half the internal zero mode, alpha is twice the real quadratic coefficient. The prose matches the assembled picture rather than identifying a finite mesh value with the integral. |
| `lem:ex-pole-recording`, (RY4') | `shop`, `stock`, `wrap_bill`, `royalty`, `Firm.tryout`, `mesh_tend`, `Awards`, `Ticket.award`, `profitable`, `profit` in `Fourier.lean`; `noteAt` in `S/Infrastructure/Jets.lean`; `collected`, `Recorded` in `S/Lift/Pathways.lean` | Exact finite derivative equals site count times mesh mean; normalized coefficient divides by 2!. The recorded error is cents(n) times a scalar tending to zero, on the original cofinal sequence. |
| Finite determinant binding | `pelt_ticket`, `quarry_g`, `crumb`, `grain`, `grantY`, `grot`, `grantV`, `grantM`, `gemF` in `Lattice.lean`; `Ticket.award` in `Fourier.lean` | The source explicitly constructs tickets for the extra films before converting their log determinants into Awards. This establishes the necessity of the missing manuscript dependency in R1. It does not supply the missing prose proof automatically. |
| `lem:ex-annulus-common-strip` | `massifTabs`, `gardenGate`, `luncheon`, `HouseWord.done` in `Lattice.lean`; real-floor source above | Same tab identified at cofinal grids, extended to the strip, positive at real momenta, then compactness gives one fixed-regulator complex strip. Shrink for all shifted momentum arguments. No L-uniform width claimed. |
| `prop:ex-annulus-estimate`, C11 handoff | `Jar.sequelQ`, `Jar.cast_book`, `jig`, `vintageWilson`, `saunter` in `Lattice.lean`; `HorizCalc` in `S/Level/Transition.lean`; `pouring` in `S/FullPlanned.lean` | Quantifiers and output agree conditional on the listed inputs plus R1's fixed-film tickets. Radial constants are chosen before L; z,K and the response picture after L. One arbitrary original side sequence, no extraction. |

## C10-to-C11 edge

Consumer read: the HorizCalc statement and `lem:path-radial-log` in
`manuscript/existence/path-attachment-producer.tex`, plus the corresponding
C11 part-B ledger. The numerical output, choice order, original side sequence
and normalized finite recording match. The producer is
`prop:ex-annulus-estimate`; however the consumer cannot count that edge as
closed until (W), (S), the fixed-film tickets and the quadratic-Hessian input
are accounted for at checked versions. R1 is specifically about keeping the
fixed-film edge in this export.

The same C11 chapter's radial lemma is proved by the three-region integration
used here, independent of the annulus estimate. No circular premise was found
in that use. The other C10-to-C11 one-step and forest/Hessian claims were not
reviewed; they are outside this four-chapter scope.

## Correspondence verdict and limits

**Changes requested for the W/S-only dependency export (R1).** At the expanded
explicit hypothesis set, no further mismatch was identified in the checked
normalizations, spaces, scale choices or quantifier order. This is not a
transitive source or axiom audit, does not revalidate the original import, and
does not approve the other thirteen C10 chapters. The old bounded reviews in
`reviews/draft-review.md` were consulted as history; their fingerprints were
not carried to the changed files or refreshed.
