# C03 author findings

**Revision 1 (issue #122).** F2 and F3 below contained the two statements that review PR #77 found false
(M1, M2). They are corrected in place, marked "Corrected in revision 1". F6 is restated per M12. The full
response is in `revision-1.md`.

Scope: the 13 chapters listed in `../../C03.md`. Every chapter was read in full. All initial SHA-256 hashes
matched `coverage-inventory.json`. Arithmetic and logic were rechecked step by step in: `reflection.tex`,
`phases.tex`, `phase-selection.tex`, `phase-regularity.tex`, `reflection-transport.tex`, `phase-fields.tex`,
`actual-slab-copy-bounds.tex`, `smooth-limits.tex`, `limits.tex`, `fullmesh-fixedbounds-producer.tex`,
`fullmesh-correlation-cauchy.tex`, and `lem:ex-selected-cone-step` / `prop:ex-selected-interpolation` /
`lem:ex-holomorphic-insertion` of `phase-quantitative-producer.tex`. The rest of that chapter was read but
not checked line by line.

## Repairs made (author edits; need independent review)

**F1. Separation metric in the full-mesh bound (fullmesh-fixedbounds-producer.tex).** The statement of
`thm:ex-fullmesh-fixedbounds-producer` required sites "separated by at least r in physical units" without a
metric. The proof's injectivity step only works for the periodic maximum-coordinate (ℓ∞) distance: two sites
in one tiling cell are within `T.side` in each coordinate. With Euclidean separation one would need
2a_ℓ<r in four dimensions. The theorem now states a_N·sep_{N,p}(x_u,x_u')≥r with sep the periodic ℓ∞ site
distance, and the injectivity paragraph spells out the per-coordinate step. This matches the source:
`YM.FullVolume.FixedBounds.bounds` uses `YM.FullVolume.spaceout` (`r ≤ C.S.a N * separation (x u) (x v)`),
with `YM.Lattice.separation x y = pdist (x-y)` and `pdist x = sup_i |lift x i|` (`Lean/YM/Lattice/Site.lean`
78–81). `YM.Cells.Tiling.extent` (`Lean/YM/Cells/Proximity.lean` 69) gives `separation x y ≤ T.side`, as
used in `YM.FullVolume.cohort`.

**F2. Full-mesh convergence versus extraction (limits.tex, new `rem:ex-limits-fullmesh`).** The chapter
presented only the subsequential compactness argument, with a mesh subsequence `t`. Nothing in it said that
the main theorem's mesh limit is a full limit, obtained from different inputs. The new remark states this.
At each eligible period, the full-mesh route (`thm:ex-fullmesh-fixedbounds-producer` +
`sec:fullmesh-correlation-cauchy` + `ex-smooth-grid-limit`) gives convergence along the whole mesh sequence,
on NoHit_p. Corrected in revision 1: the source and `assembly.tex` do **not** drop stage 1. They extract
the hierarchy along a refined order whose mesh component is a subsequence, and identify the full-mesh row
limit with the extracted one (`ex-full-mesh`; Lean `YM.FullVolume.Final.from_spec`). Running stage 1 with
`t` the identity is an alternative for the correlations only; it does not transfer the other order-dependent
data of the extracted hierarchy. Stage 2 still selects the volume subsequence. This matches the G01 ledger (statement-ledger.md line
147: "The mesh limit is a full limit; the volume limit is along the subsequence") and `YM.FullVolume.positioned`
(`PositionsUV C e` from `FixedBounds C` and `Purchased C e`). It is the issue's first mathematical check.

**F3. Reflected conjugate versus ordinary reflection (reflection-transport.tex).** The proof of
`ex-ordinary-reflection` used M(ρw)=M(θw) for conjugation-fixed labels, and the conjugation corollary used
"θw is a permutation of ρw̄". Both need J v = R_ρ v̄. Corrected in revision 1: they follow from that definition alone; the
commutation of conjugation with signed label actions is needed for J² = 1 (hence θ² = 1), not for these steps.
The chapter never stated this. It is now stated as the definition of the reflected conjugate, with the
consequence derived. Source: `YM.Register.adj d a = (mirrorGroup d (Signed.mirror a)).comp (bar d)` and
`YM.Register.star_mirror` (`Lean/YM/Euclid/Register.lean` 67–74). The descended version is `YM.Table.adj`
(`Lean/YM/Euclid/Null.lean` 165, under the section hypothesis `H : S.RealSpin`; name corrected in revision 1).

**F3a (editorial).** actual-slab-copy-bounds.tex used `D` for the grade bound while applying
`ex-train-bound`, whose norm constant is also `D`. The application now names B_v=X^{2|v|} and the norm
constant explicitly.

## Findings not repaired here (open, with owner)

**F4. Duplicate same-run Cauchy argument.** `phase-quantitative-producer.tex` §"Same-run Cauchy input for the
full mesh" (`ex-public-same-run-cauchy`) repeats the inflation, Cauchy-estimate and density argument of
`sec:fullmesh-correlation-cauchy`, in different notation. The constants agree: S_j=e^{B_j/64}>2, exponent
lowered by 2, F_0 independent of j, error 2F_0/S_j. C09's `fixed-rung-convergence.tex` cites the former. For
F01/G05: keep one canonical proof and make the other a pointer. This is not a mathematical error. It changes
labels used by C09, so it is not done in this pass.

**F5. Lean scaffolding vocabulary in the monograph (phase-quantitative-producer.tex).** The chapter still uses
source identifiers as mathematical terms: "vault", "Drake separation", "pond", "Winter/Pillars witness", "Tale
witness", "voice", "coupon", "barunit", "alto", "vowel", "Works quantifiers", "f.fuse/f.late", "C.ref(d)",
`T.side`. This is contrary to AGENTS.md ("Omit Lean implementation scaffolding") and to the common contract.
A notation pass needs G05's contract and the C02/C12 definitions these words abbreviate. The proofs I checked
are correct under their stated hypotheses. Recommended: a bounded follow-up in C03, after G05.

**F6. Producer of C04's edge E4 (field levels) is not C03.** (Restated in revision 1 per review M12: C03
produces the grade-wise null spaces and quotients; the maps between grades and the directed-system facts have
no producer statement in the manuscript; `physical-angular-actions.tex` is a consumer, not a producer. See the
ledger.) See the ledger. The C04 ledger
(`results/C04/ledger.md`, written by this account's previous session) attributes the finite levels,
inclusions and direct limit to C03 `limits.tex`. No C03 chapter contains them. They are part of
`input:calibrated-actions` in C04's label-descent.tex. For G06 and the C04 reviewer.

**F7. Unique heat-fixed vector holds almost everywhere only.** `ex-pure-ground` proves H_{χ,0}=CΩ_χ for
μ-a.e. χ, not every χ. The other phase statements in C03 hold for every character: caps, slab bounds,
original nulls, no new nulls, O(4) covariance. Any consumer needing uniqueness of the vacuum must choose
the phase in the full-measure set, after fixing the countable word family of `ex-phase-horizon`. C04
records the Lean variant `Next/BOUNDARY/Stage.establishing` as omitting this hypothesis. G01 should match
the endpoint's use.

**F8. Two inputs with unidentified producers.** (a) Full O(4) covariance of the *unselected* table, assumed
at the start of "Spatial invariance of the ground space" (phases.tex) and needed for `ex-ground-spatial` and
`ex-ground-commutative`. (b) The exact slot identity (ex-raw-slot-identity) for the smooth table
(slab-regularity.tex). Both are stated as inputs in the chapters; I did not locate their producers in this
pass. Ledger I-C05-O4, I-C01-slot.

**F9. Cross-package cycle to check.** C12's `actual-phase-grid-approximants.tex` uses C03's
`thm:ex-public-grill` and its lemmas. C03's `ex-ordinary-reflection` takes C12's pair receipts as input.
These are opposite edges at different theorem levels. They form no premise cycle unless C12's receipts use
O(4) covariance of individual phases (`ex-individual-rotations`). Not checked; for G06.

**F10. Citation numbering.** `phase-selection.tex` cites Williams Thm 2.13 for the commutative Gelfand theorem
and Thms 2.17/2.19 for spectral permanence/CFC. C04 cites Williams Thm 2.19 for CFC. Not re-inspected; G03
(#59) owns the bibliography audit.

## Checked and found correct (no edit)

- reflection.tex: Hermitian form via θ²=1; Cauchy–Schwarz; contraction M²≤aM; self-adjointness; strong continuity.
- phases.tex: `ex-ground-spatial` (Kb=|b|e_0 gives (Ke_0)_0=⟨K^Te_0,e_0⟩=b_0/|b|); the four-cluster exchange
  displacements (times 0,n,2n,3n, swapped to 0,2n,n,3n); cyclic/separating argument; compression width/placement independence.
- phase-selection.tex: metrizability, Riesz, full support, barycenter, a.e. uniqueness via
  ∫(‖P_{χ,0}[v]‖²−|S_χ(v)|²)dμ=0.
- phase-regularity.tex: `ex-phase-original-null` holds for every χ; `ex-phase-slab-bounds` via X(v_n)=(a^*a)^nX(v).
- actual-slab-copy-bounds.tex: constants 20n a_k<20uδ… ≤ b_0r²≤a_m; a_k≥t u²(r/n)⁴; K=4(D+1); width reduction s.
- fullmesh-correlation-cauchy.tex: the decay a_mB_m²→0 matches `YM.FullVolume.Eves.price` (uses
  `Push.Corrected.Grows.walls … 2`, i.e. B_{m+1}²≤2B_m² eventually, and `block_large` L_m≥3; requires `G.Simple`);
  separation of ancestral points matches `YM.FullVolume.Eves.positions`; Cauchy at ancestral points is
  `YM.PhysicalNext.Repeat.Legato.Bandage.Rising.cinema` (`Lean/YM/FullVolume/Fields/Seat.lean` 38).
- phase-quantitative-producer.tex: `lem:ex-selected-cone-step` inequalities (q≥2K(1+s), the three perturbation
  bounds, r≤2K‖core y‖≤4K²‖core u‖); `lem:ex-public-radial-choice` (η<γ/3).
