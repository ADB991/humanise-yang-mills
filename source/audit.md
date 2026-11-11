# Statement and scope audit: OpenAI-YM-20261028

| Field | Audited value |
| --- | --- |
| Imported source revision | `3456e5e75cf8d4cd558955a5c7638fba2d68f464` |
| Pinned toolchain | `leanprover/lean4:v4.32.0` |
| Roots | All 17 names in [`source/upstream.json`](upstream.json) |
| Status | Author draft; independent Lean-correspondence review required |

This is the issue [#3](https://github.com/hairer/humanise-yang-mills/issues/3)
statement audit. The [mathematician-readable ledger](../blueprint/public-statement.md)
spells out quantifiers, hypotheses, conclusions, defining predicates, and
interpretation limits. This file records the source correspondence, printed
Lean types, public prose comparison, and audit evidence. The theorem names
are not substitutes for their elaborated types. No proof of any root is attempted
here, and no imported `Lean/` file was changed.

## Audit method and limits

Three read-only, disjoint source inspections covered respectively the five
public/assembly roots, five SU(2)/independent/contact/asymptotic roots, and seven
position/parity/Sharp-Gram roots. They started at the named declarations and
expanded only through immediate meaning-determining definitions. The source
inspections used separate clones at repository commit
`3a20fee84ce46e8f83824b9e3da7078a8313e987` and the immutable imported
source revision above. The parent integrated their reports and compared the
results with a pinned Lean `#check` run covering every root. The full command,
result, and output digest appear below. `#check` is the elaborated-type evidence;
source-text readings identify the structures and abbreviations within those
printed types. The pretty-printer can hide inferred types or abbreviate dependent
arguments; the cited definitions remain authoritative.

The separate [accepted issue #2 evidence](evidence/axioms-3456e5e.md) reports
transitive axioms `propext`, `Classical.choice`, and `Quot.sound` for all 17 roots,
with no `sorryAx` or project-defined endpoint axiom. It also records kernel replay
of 100,168 reachable project declarations. That result used a checksum-verified
prebuilt artifact, not a clean source rebuild on this host. Its structural
reachability inventory is not a mathematical dependency graph, and neither its
axiom report nor this type audit establishes the physical adequacy of a definition.

## Declaration index and source correspondence

The `Type and meaning` column points to the exact printed type below and the
expanded statement in the ledger. Source lines locate the declaration, while
fully qualified names and the pinned revision are the stable identifiers.

| Release root | Declaration and meaning-determining sources | Relation to `jointExistence` |
| --- | --- | --- |
| `YangMills.jointExistence` | `Lean/Solution.lean:4`; `Lean/ChallengeSpec.lean:186–188` (`JointExistence`), `:11–22` (`WilsonRegularity`), `:177–182` (`Hierarchy.Properties`); `Lean/PublicWilson.lean`, `Lean/PublicTheory.lean` | Public endpoint |
| `YangMills.constructed` | `Lean/Construction.lean:15–31`; `Lean/WilsonBridge.lean:10–17`; `Lean/YM/Nonperturbative/HeadlineSpec.lean:143–155` | Supplies public endpoint by projection through bridge definitions |
| `YM.Nonperturbative.existence` | `Lean/YM/Nonperturbative/Headlines.lean:19–20`; `HeadlineSpec.lean:143–155`; `Lean/YM/Gauge/MatrixGroup.lean`, `Lean/YM/Gauge/Lie.lean` | Used by `constructed` in its source proof |
| `YM.Nonperturbative.continuum_with_position_tests` | `Lean/YM/Nonperturbative/Continuum.lean:28–39`; `Lean/YM/Independent/Core.lean`, `Lean/YM/Pert/Position/Four.lean` | Used to construct `existence` |
| `YM.Nonperturbative.continuum` | `Lean/YM/Nonperturbative/Continuum.lean:52–66` | Projection of preceding result, not an additional premise |
| `YangMills.su2Simple` | `Lean/ConcreteSU2.lean:8–12`; `Lean/PublicTheory.lean` | Supplies simplicity input for the specialization |
| `YangMills.su2Theory` | `Lean/ConcreteSU2.lean:15–18`; `Lean/ChallengeSpec.lean:186–188` | Direct specialization of `jointExistence` |
| `YM.Independent.Core.point` | `Lean/YM/Independent/Core.lean:49–63`; `Lean/YM/OPE/Orbits/Profile.lean`, `Words.lean` | In the public theorem's formal constant closure, but not a public conclusion |
| `YM.Contacts.Solstice.celestial` | `Lean/YM/Contacts/Solstice/Result.lean:52–79` | Separate contact-device existence root |
| `YM.Pert.Asymptotics.comparison` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:11–36`; `Lean/YM/Source/Construction.lean` | Conditional running-proxy companion |
| `YM.Pert.Position.finite_leading` | `Lean/YM/Pert/Position/Crest.lean:13`; `Board.lean`, `Actual.lean` | In the public theorem's formal constant closure, but not a public conclusion |
| `YM.Pert.Position.normalized_four` | `Lean/YM/Pert/Position/Four.lean:45–56`; `Crest.lean`, `Lean/YM/Pert/FirstTarget.lean` | Position-test existence companion |
| `YM.Pert.Parity.parityEndpoint` | `Lean/YM/Pert/Parity/End.lean:15–21`; `Branch.lean`; `Lean/YM/Pert/Position/Crest.lean` | Eventual finite-regulator parity companion |
| `YM.Pert.Parity.low_read` | `Lean/YM/Pert/Parity/EvenLow.lean:44`; `Lean/YM/Pert/Position/Board.lean` | Exact low-grade, odd-coefficient vanishing companion |
| `YM.SharpGram.habitat` | `Lean/YM/SharpGram/Measured.lean:11`; `Lean/YM/SharpGram/Weak/Reading.lean`, `Lean/YM/SharpGram/Dense/Passes.lean` | Weak-portfolio/fixed-field companion |
| `YM.SharpGram.inletFirst` | `Lean/YM/SharpGram/Clauses.lean:18–21,126` | Conditional low-grade `Supplies` companion |
| `YM.SharpGram.outletFirst` | `Lean/YM/SharpGram/Clauses.lean:23–29,120` | Conditional low-grade `Releases` companion |

The source proof chain directly inspected for the main theorem is
`continuum_with_position_tests → existence → constructed → jointExistence`.
`continuum` is derived from the first of these; `su2Theory` is derived from the
last, using `su2Simple`. The 17-name manifest and the checked-in usage table
identify roots and constant reachability over their union; they do not by
themselves prove that every focused headline is in the proof of the public
endpoint. The targeted per-root query below supplies that distinction.

## Public prose comparison

The imported [`Lean/README.md`](../Lean/README.md) is the shipped public prose
statement. Its public-challenge section corresponds to `JointExistence` and the
four fields of `Hierarchy.Properties`:

| README claim | Formal anchor and scope |
| --- | --- |
| One Wilson family for each closed matrix subgroup with nonabelian simple real Lie algebra; refinements for every increasing volume sequence | `GaugeGroup`, `IsSimple`, and `JointExistence` in `PublicTheory.lean` and `ChallengeSpec.lean`; one family is chosen before the requested sequence. |
| Wilson plaquette/Haar origin, finite local stencils, running slope, and separated mesh/volume limits | `WilsonFamily`, `WilsonRegularity`, and `WilsonFamily.Converges` in `PublicWilson.lean` and `ChallengeSpec.lean`; the local stencil is per token but uniform in spacing, volume, and placement. |
| Selected Wightman reconstruction, phase integration, spectrum and locality | `Hierarchy.Reconstructed` and its theory axioms in `ChallengeSpec.lean` and `PublicTheory.lean`; positive energy and uniqueness of the translation-invariant vacuum are stated, not a positive mass gap. |
| Separated all-orders OPE | `Hierarchy.OperatorProductExpansion` in `ChallengeSpec.lean`; its cluster and spectator geometry, truncation degrees, uniform remainder, and same-hierarchy readings are predicate-dependent. |
| Centered grade-four nonfreeness test | `Hierarchy.TraceTest` in `ChallengeSpec.lean`; it excludes eventual equality to the specified finite Wick profiles, not every generalized free model. |
| Detailed construction has contacts and leading position tests | `YangMills.constructed` and its internal `MultipleLight`, `FirstExtension`, and `FourMeters` conjuncts; these are not fifth/sixth fields of public `Properties`. |

The README explicitly excludes a positive mass gap, general exclusion of
continuous-mass generalized free fields, and all-orders MS-bar matching. It
also excludes uniqueness over other contact prescriptions and raw cutoff
convergence on collision diagonals. The README mentions an earlier challenge
revision but contains no separate stronger release-statement link. No such
physical conclusion is added by any root name in this audit. The README's build and replay claims
must be read with the narrower local evidence in [`source/build.md`](build.md)
and issue #2, including the prebuilt-artifact limitation.

## Printed elaborated types

The output below is from the pinned Lean toolchain. Each `#check` names the
elaborated theorem type; abbreviated named structures are expanded through the
cited sources and ledger. The repeated axiom lines are retained to avoid
silently suppressing an endpoint finding.

```text
YangMills.jointExistence : YangMills.JointExistence
'YangMills.jointExistence' depends on axioms: [propext, Classical.choice, Quot.sound]
YangMills.constructed.{u, v} (g : YangMills.GaugeGroup) (hg : g.IsSimple) (b : ℝ) (hb : 0 < b) :
  ∃ C,
    C.path.levels.clock.kernel.penalty = b ∧
      C.Makes ∧
        YangMills.WilsonRegularity (YangMills.wilsonFamily C) ∧
          ∀ (p : YM.Extraction.Order),
            ∃ q S F L Q M X,
              (YangMills.hierarchy F Q).Properties (p.refine q).per.choose ∧
                (YangMills.hierarchy F Q).Contacts ∧
                  { mesh := YM.Extraction.Sequence.full, per := (p.refine q).per }.Ordered C S ∧
                    YM.FullVolume.PositionsUV C YM.Extraction.Sequence.full ∧
                      YM.Spec.Calibrated C ∧
                        YM.Independent.Core (YangMills.GaugeGroup.coreSimple hg) F L Q ∧
                          YM.Nonperturbative.Headline.Reconstruction F L ∧
                            (∀ (i : F.α.space.X), (YangMills.view (L.actors i)).Axioms) ∧
                              YM.Nonperturbative.Headline.SeparatedOPE F Q ∧
                                YM.Nonperturbative.Headline.NestedOPE F Q ∧
                                  YM.Nonperturbative.Headline.TraceExclusions F ∧
                                    M.basis = Q.port ∧
                                      YM.Contacts.Solstice.MultipleLight F M ∧
                                        Nonempty (YM.Contacts.Transport.SystemBasis M) ∧
                                          Nonempty (YM.Contacts.Solstice.Thresholds M) ∧
                                            YM.Pert.FirstExtension F X ∧ YM.Pert.Position.FourMeters F X
'YangMills.constructed' depends on axioms: [propext, Classical.choice, Quot.sound]
YangMills.su2Simple : YangMills.su2.IsSimple
'YangMills.su2Simple' depends on axioms: [propext, Classical.choice, Quot.sound]
YangMills.su2Theory :
  ∃ C, YangMills.WilsonRegularity C ∧ ∀ (p : ℕ → ℕ), StrictMono p → ∃ q, StrictMono q ∧ ∃ T, T.Properties (p ∘ q)
'YangMills.su2Theory' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Nonperturbative.existence.{u, v} (G : YM.Gauge) (hG : G.Simple) (b : ℝ) (hb : 0 < b) :
  YM.Nonperturbative.Headline.WilsonExistence G hG b
'YM.Nonperturbative.existence' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Nonperturbative.continuum.{u, v} {G : YM.Gauge} (hG : G.Simple) {b : ℝ} (hb : 0 < b) :
  have R := YM.Independent.fundedRun hG hb;
  R.family.path.levels.clock.kernel.penalty = b ∧
    ∀ (p : YM.Extraction.Order),
      ∃ q S F L Q M,
        { mesh := YM.Extraction.Sequence.full, per := (p.refine q).per }.Ordered R.family S ∧
          YM.FullVolume.PositionsUV R.family YM.Extraction.Sequence.full ∧
            YM.Independent.Core hG F L Q ∧
              YM.OPE.Nesting.Uniform F Q ∧
                M.basis = Q.port ∧
                  YM.Contacts.Solstice.MultipleLight F M ∧
                    Nonempty (YM.Contacts.Transport.SystemBasis M) ∧ Nonempty (YM.Contacts.Solstice.Thresholds M)
'YM.Nonperturbative.continuum' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Nonperturbative.continuum_with_position_tests.{u, v} {G : YM.Gauge} (hG : G.Simple) {b : ℝ} (hb : 0 < b) :
  have R := YM.Independent.fundedRun hG hb;
  R.family.path.levels.clock.kernel.penalty = b ∧
    ∀ (p : YM.Extraction.Order),
      ∃ q S F L Q M,
        { mesh := YM.Extraction.Sequence.full, per := (p.refine q).per }.Ordered R.family S ∧
          YM.FullVolume.PositionsUV R.family YM.Extraction.Sequence.full ∧
            YM.Independent.Core hG F L Q ∧
              YM.OPE.Nesting.Uniform F Q ∧
                M.basis = Q.port ∧
                  YM.Contacts.Solstice.MultipleLight F M ∧
                    Nonempty (YM.Contacts.Transport.SystemBasis M) ∧
                      Nonempty (YM.Contacts.Solstice.Thresholds M) ∧
                        ∃ X, YM.Pert.FirstExtension F X ∧ YM.Pert.Position.FourMeters F X
'YM.Nonperturbative.continuum_with_position_tests' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Contacts.Solstice.celestial (G : YM.Gauge) (h : G.Simple) :
  ∃ C F S Z M,
    YM.Contacts.Solstice.MultipleLight Z M ∧
      Nonempty (YM.Contacts.Transport.SystemBasis M) ∧ Nonempty (YM.Contacts.Solstice.Thresholds M)
'YM.Contacts.Solstice.celestial' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Pert.Position.finite_leading {G : YM.Gauge} {d t : ℕ} {A : YM.Labels.Frames G}
  (Q : YM.Pert.Position.Conditions A d t) (H : YM.Pert.Position.CleanProfiles Q) (L : YM.Lattice.Side) (hL : 1 < ↑L) :
  Filter.Tendsto (fun m => YM.Pert.Position.finite Q L m 0) Filter.atTop (nhds (YM.Pert.Position.white Q))
'YM.Pert.Position.finite_leading' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Pert.Position.normalized_four {G : YM.Gauge} (hg : G.Simple) {p : ℝ} (hp : 0 < p) :
  ∃ C,
    C.path.levels.clock.kernel.penalty = p ∧
      YM.Extraction.Wcmain C ∧
        YM.MergeProof.Ribbons.Materials C ∧
          YM.MergeProof.Ribbons.Plenty C ∧
            ∀ (f : YM.Extraction.Order), ∃ g S b X, YM.Pert.FirstExtension b X ∧ YM.Pert.Position.FourMeters b X
'YM.Pert.Position.normalized_four' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Pert.Parity.parityEndpoint {G : YM.Gauge} (hg : G.Simple) {c : ℝ} (hc : 0 < c) :
  ∃ C,
    C.path.levels.clock.kernel.penalty = c ∧
      YM.Extraction.Wcmain C ∧
        YM.MergeProof.Ribbons.Materials C ∧
          YM.MergeProof.Ribbons.Plenty C ∧
            ∀ (f : YM.Extraction.Order),
              ∃ g S b X,
                YM.Pert.FirstExtension b X ∧
                  YM.Pert.Position.Crest X ∧
                    ∃ n Q φ J,
                      YM.Pert.Position.CleanProfiles Q ∧
                        YM.Pert.Position.BoardAttains Q X φ ∧
                          YM.Pert.Position.Resident b X φ ∧ YM.Pert.Parity.Fair Q J ∧ YM.Pert.Parity.ParityFields φ
'YM.Pert.Parity.parityEndpoint' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Pert.Parity.low_read {G : YM.Gauge} {d : ℕ} {F : YM.Labels.Frames G} (hg : G.Simple) (hd : d ≤ 5) {σ : ℕ}
  (X : YM.Pert.Position.Conditions F d σ) (L : YM.Lattice.Side) (m j : ℕ) (h : Odd j) :
  YM.Pert.Position.finite X L m j = 0
'YM.Pert.Parity.low_read' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Pert.Asymptotics.comparison {G : YM.Gauge} {C : YM.Family G} {N k : ℕ → ℕ} (hc : C.Makes) (hg : G.Simple)
  (hi : ∀ᶠ (i : ℕ) in Filter.atTop, i ≤ N i) :
  Filter.Tendsto (fun i => YM.Pert.Asymptotics.regulatorRun C (N i) (k i) i * √(Real.log (C.S.a i)⁻¹)) Filter.atTop
    (nhds (√(2 * YM.Pert.Asymptotics.b0 G))⁻¹)
'YM.Pert.Asymptotics.comparison' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.SharpGram.habitat {G : YM.Gauge} (hG : G.Simple) {b : ℝ} (hb : 0 < b) (f : YM.Extraction.Order) :
  ∃ C g T F L P,
    C.Makes ∧
      YM.Spec.Calibrated C ∧
        C.path.levels.clock.kernel.penalty = b ∧
          YM.UVExtension.Oasis.Floral C ∧
            { mesh := YM.Extraction.Sequence.full, per := (f.refine g).per }.Ordered C T ∧
              (∀ (d k : ℕ),
                  ∀ᶠ (n : ℕ) in Filter.atTop,
                    ∀ (r : ℕ) (v : Fin r → C.book.Token),
                      (∀ (i : Fin r), (v i).fst ≤ d) → ∃ g, YM.UVExtension.Poppy.Margins C r n k v g) ∧
                YM.OPE.Facilities C (f.refine g) T ∧
                  (∃ W r D, YM.OPE.Log.LogPackage C W r D ∧ YM.SharpGram.TrueSteps C W) ∧
                    YM.EveryPhase.Completed F L ∧
                      YM.OPE.AllShapes F P ∧
                        YM.SharpGram.Dense.Coverage C F.room.cutoff ∧
                          ∀ (U : Ultrafilter (ℕ × ℕ)),
                            ↑U ≤ (f.refine g).fuse →
                              ∀ (D : ℕ),
                                Nonempty (YM.SharpGram.Weak.Portfolio C F.room.cutoff D ↑U) ∧
                                  ∀ (X : YM.SharpGram.Weak.Portfolio C F.room.cutoff D ↑U),
                                    ∃ Y,
                                      YM.SharpGram.PricedIn F X Y ∧
                                        ∀ (d : Fin (D + 1)),
                                          Filter.Tendsto
                                            (fun k => YM.SharpGram.Weak.Portfolio.inBasis F X k (↑d) (Y k ↑d))
                                            Filter.atTop (nhds (YM.SharpGram.Weak.Portfolio.model C ↑d))
'YM.SharpGram.habitat' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.SharpGram.inletFirst {G : YM.Gauge} {C : YM.Family G} {f : YM.Extraction.Order} {S : YM.Table C.book}
  (U : YM.Spec.Final C f S) {d : ℕ} (hG : G.Simple) {φ : Filter (ℕ × ℕ)} (hf : φ ≤ f.fuse) (x : C.label d)
  (hd : d ≤ 3) : YM.SharpGram.Supplies C φ d ((S.project d) x)
'YM.SharpGram.inletFirst' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.SharpGram.outletFirst {G : YM.Gauge} {C : YM.Family G} {f : YM.Extraction.Order} {S : YM.Table C.book}
  (U : YM.Spec.Final C f S) {W : YM.Bid.Worth} {r : ℕ → ℕ}
  {D : (N p m : ℕ) → m < N → YM.MergeProof.GaugeDoor (C.path.rep N p (m + 1)) (C.path.rep N p m)}
  (T : YM.OPE.TableTickets C W r D) {d : ℕ} (hG : G.Simple) {φ : Filter (ℕ × ℕ)} (hf : φ ≤ f.fuse) {w : ℕ}
  (L : S.Field d →ₗ[ℂ] ℂ) (hw : w ≤ d) (he : w ≤ 3) (hp : YM.SharpGram.Kills U.sector.derivatives hw L) :
  YM.SharpGram.Releases C φ d w L
'YM.SharpGram.outletFirst' depends on axioms: [propext, Classical.choice, Quot.sound]
YM.Independent.Core.point.{u, v} {G : YM.Gauge} {C : YM.Family G} {f : YM.Extraction.Order} {S : YM.Table C.book}
  {hG : G.Simple} {F : YM.Spec.Final C f S} {L : YM.EveryPhase.Almanac F}
  {Q : YM.OPE.Orbits.Reader F.sector.derivatives F.sector.turns F.room.kernel.spin} (H : YM.Independent.Core hG F L Q)
  {I J : Type} [Fintype I] [Fintype J] {d : I → ℕ} {e : J → ℕ} (a : YM.OPE.Orbits.Labels S d)
  (b : YM.OPE.Orbits.Labels S e) {M η c ε : ℝ} (hM : 0 ≤ M) (hη : 0 < η) (hc : 0 < c) (hε : 0 < ε) (D : ℕ) :
  ∀ᶠ (r : ℝ) in nhdsWithin 0 (Set.Ioi 0),
    ∀ (x : I → YM.E4) (o : YM.E4) (y : J → YM.E4),
      YM.OPE.WithinRoom r M η x o →
        YM.OPE.ClearOf o y c →
          ∀ (s : YM.OPE.Viewers F),
            ‖YM.OPE.Orbits.whole (YM.OPE.spectator F s) x a y b -
                  ∑ j,
                    ∑ i,
                      Q.coef (↑j) i x a o *
                        YM.OPE.Orbits.whole (YM.OPE.spectator F s) (YM.OPE.sole o) (YM.OPE.sole (Q.actor (↑j) i)) y b‖ ≤
              r ^ (↑D + 1 - YM.OPE.Orbits.weight d - ε)
'YM.Independent.Core.point' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Public-root constant reachability

A temporary pinned Lean meta script imported `ConcreteSU2`, began at
`YangMills.jointExistence`, recursively followed each declaration's
`ConstantInfo.getUsedConstantsAsSet` references in type and value/proof,
and included constructors of reached inductive types. Its visited-name set
prevented repeated traversal. It queried membership for the 17 advertised
names, rather than treating the all-roots usage TSV as a public-root graph.
The script at `/private/tmp/ym-issue3-reach.lean` had SHA-256
`6c5caf8dc03a743cce045bfb01b423f220d64291dd90989fb7d807accc702e01`.
From the original checkout's `Lean/` directory, with the same pinned source
files, `lake env lean /private/tmp/ym-issue3-reach.lean` exited 0 in 28.629 s:

| Root | Reachable in `jointExistence` type/proof closure? |
| --- | --- |
| `YangMills.jointExistence` | Yes, start |
| `YangMills.constructed` | Yes |
| `YM.Nonperturbative.existence` | Yes |
| `YM.Nonperturbative.continuum_with_position_tests` | Yes |
| `YM.Independent.Core.point` | Yes |
| `YM.Pert.Position.finite_leading` | Yes |
| `YM.Nonperturbative.continuum` | No |
| `YangMills.su2Simple`, `YangMills.su2Theory` | No |
| `YM.Contacts.Solstice.celestial` | No |
| `YM.Pert.Position.normalized_four` | No |
| `YM.Pert.Parity.parityEndpoint`, `YM.Pert.Parity.low_read` | No |
| `YM.Pert.Asymptotics.comparison` | No |
| `YM.SharpGram.habitat`, `YM.SharpGram.inletFirst`, `YM.SharpGram.outletFirst` | No |

This is formal constant reachability, not a claim that `Core.point` or
`finite_leading` is a *conjunct* of `jointExistence`. Conversely, a `No` means
the named theorem constant was not in that closure; related definitions,
mathematical ideas, or separately proved variants may still occur. The direct
source proof chain and this closure have different purposes.

## Commands, outcomes, and unperformed checks

- Targeted source inspections used `rg -n`, `nl -ba`, and `sed` on the named
  roots, their immediate defining files, `Lean/README.md`, and the public
  bridge definitions. They found the 17 source declarations and the definition
  locations cited above. The three agent sessions were
  `hairer-codex-issue3-public-20261111`,
  `hairer-codex-issue3-special-20261111`, and
  `hairer-codex-issue3-pert-20261111`; all were read-only and reported to the
  parent session `hairer-codex-issue3-20261111`.
- From `/Users/hairer/humanise-yang-mills/Lean`, the command
  `lake env lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 /private/tmp/ym-issue3-elaborated-types-20261111.lean`
  exited 0. Its 159-line output had SHA-256
  `bacf65af7ad5aa5d70318686fe63d38963d1586f2f66503b25416d387b993c5e`;
  two pretty-printer elisions remained.
- A first attempt to increase print depth using `pp.maxDepth` exited 1 with
  `Unknown option pp.maxDepth`; its output at
  `/private/tmp/ym-issue3-elaborated-types-full-20261111.log` had SHA-256
  `e9e6e21d5a6edeae44ba3bacb17efe753a0b953820be19af184c2c64849d4200`.
- The corrected expanded-type command, from the same `Lean/` directory, was
  `lake env lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 /private/tmp/ym-issue3-elaborated-types-expanded-20261111.lean`.
  It exited 0, produced the 159-line output transcribed above, with no
  pretty-printer elisions, at
  `/private/tmp/ym-issue3-elaborated-types-expanded-20261111.log` (SHA-256
  `554da88654714fd5a87d408d74904831f5bd587202ebd2f83012ab6da40e64d6`).
  The input raised `pp.maxSteps` and the deep-term/proof print thresholds.
  All 17 `#print axioms` outputs were exactly the three standard axioms also
  reported by issue #2.
- The first reachability command in an isolated source clone exited 128 because
  that clone had no `.lake/packages/mathlib` and the sandbox could not resolve
  `github.com` for a new dependency download. The same temporary script run
  against the existing compiled artifact in the original checkout exited 0,
  with the result above. No build or imported-source edit was performed.
- The issue #2 build, verifier, inventory, and axiom checks were read from
  [accepted evidence](evidence/axioms-3456e5e.md) and
  [the build record](build.md); this issue did not rerun the expensive kernel
  replay or perform a clean source rebuild. The upstream standalone Comparator,
  `verification/CompactCheck.lean`, and independent second-implementation proof
  checking were not run here. Their status must not be inferred from this audit.
- `python3 scripts/check_blueprint.py` passed with
  `Blueprint structure OK: 0 units. Lean and mathematics were not verified.`
  `git diff --check` passed. A name-count check found all 17 manifest targets
  in both audit files and 17 printed endpoint axiom lines. These checks verify
  structure and transcription completeness, not mathematical interpretation.

## Open questions and review boundary

- This audit identifies theorem types and defining conditions; it does not prove
  that the constructions satisfy an external mathematical or physical standard
  beyond what the predicates literally express. In particular, the group’s
  external assessment of the submission, if used in a monograph, needs its own
  comparison with the public predicate package and should not be silently
  imported as a stronger theorem.
- The `MultipleLight`, `FirstExtension`, `FourMeters`, portfolio, and trace
  predicates have substantial nested definitions. The ledger records the
  immediate meaning needed to prevent headline inflation; an independent Lean
  correspondence review should inspect any deeper interpretation proposed
  for later proof units.
- No positive mass gap, uniqueness of the subsequential volume limit, general
  generalized-free-field exclusion, or all-orders MS-bar matching follows from
  a name or from the printed types here. Any future claim of one of these
  properties requires a separate located declaration and source audit.
- This is an author draft. An independent Lean-correspondence reviewer must
  check the source-to-English mapping before issue #3 is marked reviewed or done.
