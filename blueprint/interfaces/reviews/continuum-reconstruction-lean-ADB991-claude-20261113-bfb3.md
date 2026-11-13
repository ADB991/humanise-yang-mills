# Review of an interface audit: construction to reconstruction (#160 revision)

- Reviewed file: `blueprint/interfaces/continuum-reconstruction.md`, the #160 revision merged in PR #170 (commit `fdfd0867fed13baca9b31d154a2cd394ca78ba1b`). The author session was `hairer-claude-interface-160-20261113`.
- Role: Lean correspondence, with a check of the mathematical meaning of each cited definition. This is the "renewed independent correspondence review" that #160's acceptance criteria call for.
- Human reviewer: ADB991. No acceptance is recorded; see the last section.
- Agent assistance: Claude Code (Anthropic), running as a scheduled agent on behalf of ADB991 (session `ADB991-claude-20261113-bfb3`), did the inspection and wrote this report. ADB991 had not read it before it was submitted. No subagents were used.
- Content SHA-256: `c6748f0844a71a0d35f859b2ca62ed69be8b6fb4835e3116f36d343b7aa3c558`. This is the `sha256sum` of the file at `fdfd086`, and it is identical at `codex/existence-monograph` `69b2631`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, which is `Lean/` in this repository. `sha256sum -c Lean/SOURCES.sha256` reports 9,497 files OK. The only failures are the 10 `verification/*.log` files, which were never imported.
- Review task: [issue #160](https://github.com/hairer/humanise-yang-mills/issues/160), claim <https://github.com/hairer/humanise-yang-mills/issues/160#issuecomment-6862024252>.
- Independence: ADB991 did not write the note (#18, #170), the PR #18 review, or G01 P9.
- Outcome: **minor changes requested.** I found no false statement about a source declaration. Every response-table row is answered as claimed, and every field list I checked is complete. The changes concern ownership. The pointwise mixture identity is a PU-17 output, not a PU-19 output (R1). The public `Reconstructed` clauses come from more units than the note lists, and PU-19 does not reach the public statement at all (R2). Three smaller points follow (R3–R5). The PU-18 reading of `Wightman.Realizes`, which the note marks as unverified, is checked below and is correct, with one omission (`meets`).

## Method and limits

Evidence level: **[S]** means source text read at the pin, including binders and the proof terms that the findings depend on. **Nothing was elaborated.** This sandbox cannot reach the Mathlib cache or Mathlib's GitHub repository, so `lake` cannot build dependencies. All statements about which fields a proof uses come from reading the proof term or tactic script. These scripts are short anonymous-constructor terms, and I quote them below. Where a claim depends on a proof I did not read, I say so.

Files read at the pin: `Construction.lean`, `Solution.lean`, `ChallengeSpec.lean`, `HierarchyBridge.lean`, `WilsonBridge.lean`, `PublicWilson.lean` (`Converges`, `suitable`), `PublicView.lean` 102–114, `YM/Spec/Closed.lean`, `YM/Phase/Mixture.lean`, `YM/EveryPhase/{Extension,Pack,Barycenter}.lean` (the latter two in part), `YM/Boundary/Contour.lean`, `YM/Fields/System.lean`, `YM/Fields/Star.lean` 22–60, `YM/Mink/{Poincare,Geometry}.lean` (in part), `YM/Spectral/Frequencies.lean` 60–75, `YM/Extraction/{Orders,Limits}.lean`, `YM/Extraction/Held.lean` 136, `YM/R2I/Campaign/Accepted.lean` 60, 110–180, `YM/FullVolume/Finale/Program.lean` 117–133, `YM/FullVolume/Profiles.lean` 25–31, `YM/MergeProof/{Powder,Emanate}.lean` (`rated`, `emanate`), `YM/Nonperturbative/{Continuum,Headlines,HeadlineSpec}.lean` (in part), `YM/Independent/{ConstructionRun,Core}.lean` (in part), `YM/RG17/Joint.lean` 55–70, `YM/OS/Dynamics.lean` 106, `YM/Euclid/Words.lean` 141–148. I also read the PR #18 review comment and G01 P9 (`blueprint/units/YM-000026/handoff/results/G01/proposed-patches.md`).

## Confirmed [S]

1. **Response table.** Each of the 14 rows corresponds to an edit that is present in the note, at the place the table names. The note's restatements of the PR #18 review items and of P9.1–P9.3 are faithful to those sources.
2. **Quantifier contract.** `continuum_with_position_tests` (Continuum.lean 28–39) fixes `R := fundedRun hG hb` and then states `∀ p, ∃ q S F L Q M, … ∧ ∃ X, …`. `constructionRun` returns `R, T, W` with the penalty, `R2I.Funded` and the attached native-component recipe. `jointExistence` calls `constructed` at `b = 1` on `⟨.full, ⟨p,hp⟩⟩` and returns `q.per`. `Order.refine` composes both components (Orders.lean 40) and `Sequence.full = id` (27). `Order.limits` takes a mesh limit at **every** period `p` satisfying the side condition, not only at periods in the sequence, and then the period limit along `f.per` (61–64). `WilsonFamily.Converges` (PublicWilson.lean 85–90) has the same two-stage shape, with the full mesh.
3. **Two orders.** `Construction.lean` line 23 is the full-mesh `Ordered` conjunct. `wilsonLimit` (HierarchyBridge 44–56) consumes it through `fromWilson` (WilsonBridge 62–67). `F.room.ordered : (p.refine q).Ordered C S`. The line references 44–56 and 105–112 are exact.
4. **Field lists.** All of these are complete and correctly named:
   - `Seed`: 6 fields.
   - `Locals`: 9 fields, including `charges : StressLaws …`.
   - `Materializes`: `transport`, `phase`.
   - `Relativistic`: `allWorld`, `chosen`, `qt`.
   - `Selection.Certificate`: 12 fields (Mixture.lean 136–148; the note says 136–150, but the file has 149 lines).
   - `Wightman.Realizes`: 11 fields.
   - `Completed`: 11 fields.
   - `Headline.Reconstruction`: 5 fields (HeadlineSpec 75–81).
   - `Waves.Opens`: `int`, `profile` (Contour.lean 89–93).
   - `Table.Hierarchy`: 7 fields.
5. **Anchors.**
   - `YM.R2IGoals.Broad.refine` is `Accepted.lean` 136–148, and its full-mesh conjunct is line 141.
   - `Run.extractible17` (RG17/Joint.lean 61–65) takes `L : OPE.Package …`.
   - `YM.OS.realization : S.Hierarchy → ∀ a, Nonempty (Chamber S a)` (Dynamics.lean 106).
   - `all_characters` takes only `F` (Extension.lean 75–80).
   - `EveryPhase.barycenter` is stated for an arbitrary `L : Almanac F` (Barycenter.lean 75).
   - `Almanac.baseB : contours atPoint = F.A` and `baseR : actors atPoint = F.action` (Pack.lean 131–132).
   - `YangMills.regular` takes only `C.Makes` (HierarchyBridge 16).
6. **`regular`, the step the note marks "not traced further".** The `running` clause is proved by `Pert.Asymptotics.zeroUp_bound C h hε`, applied as `hN N p le_rfl` (HierarchyBridge 22–23). That is the bare-coefficient case `m = N` of the YM-000022 statement, as the note says.
7. **Boundary integrability (P9.3).** The public `Reconstructed.boundary` (ChallengeSpec 139–143) is a `Tendsto` of Bochner integrals with no integrability clause. The bridge proves it from `F.realization.chosen.emerges.profile` (HierarchyBridge 124) and does not use `emerges.int`. The note's request that a unit state integrability is mathematically necessary. A Bochner integral of a non-integrable function is `0`, so without integrability the public clause is weaker than its reading.

## The PU-18 reading of `Wightman.Realizes`, checked [S]

The note marks its prose reading of `Total`, `sharpPair`, `realizes`, `commutes`, `notLost` and `Symmetries` as unverified. Unfolded at `Lean/YM/Fields/System.lean`, `Star.lean`, `Mink/` and `Spectral/Frequencies.lean`:

| Field | Definition | Reading |
| --- | --- | --- |
| `total : Total` (System 41–45) | `‖Ω‖ = 1`; the domain `D` is dense; `D = span{φ(word)Ω}` (algebraic span); for each label `x` and `v ∈ D`, `f ↦ φ_x(f)v` is continuous from `SchwartzMap E4 ℂ` (`Test4 = Probe E4`) to `H` | normalized cyclic vacuum, dense invariant domain, vector-valued temperedness. Correct. |
| `adj : sharpPair J` (47–48) | `⟨φ_x(f)a, b⟩ = ⟨a, φ_{Jx}(f̄)b⟩` on `D`; `Fields.really` (53–56) turns this into `φ_{Jx}(f̄) ⊆ φ_x(f)^*` | Hermiticity relation between the field and its adjoint. Correct. |
| `induced : starRead J h` (Star 42–43) | `J(pin d v) = pin d (S.adj h d timeAxis v)` | ties the label involution to the Euclidean time-reflection adjoint of the table. The note does not mention it. |
| `letters : Spins.Descends` (Star 26–34) | the label action `rail` is a representation of the Lorentz group, compatible with `pin`; each level carries a continuous finite-dimensional representation `shell`; boost generators are `−i` times the Euclidean rotation generator in the `(t, i)` plane; spatial rotations agree with the Euclidean ones | Lorentz covariance of the field labels, obtained from Euclidean rotations by Wick rotation. The note does not mention it. |
| `meets : realizes W` (60) | `⟨Ω, φ(word)Ω⟩ = W.expect word`, with `W := A.world` in `Relativistic.qt` (Closed.lean 54) | **The Wightman functions are the boundary values of the selected contour.** The note's PU-18 row omits this, although it is the field that links the Hilbert-space theory to the Euclidean data (see R2). |
| `localPairs : commutes` (88–89) | if every pair of support points of `f, g` is spacelike (`m(x−y) < 0`, `m = t² − ‖x‖²`), then the fields commute on `D` | locality, as commutation with no grading. Correct. |
| `faithful : notLost` (58) | every nonzero label gives a nonzero field for some test | faithfulness. Named in the note. |
| `covariance : Symmetries` (112–116) | `V(p)` preserves `D` and `Ω`, and `V(p)φ_x(f)a = φ_{rail Λ x}(push p f)V(p)a` | Poincaré covariance. Correct. `Action` (91–96) is isometric, multiplicative and strongly continuous, hence unitary. `Lorentz` has determinant 1 and preserves the forward cone (Poincare.lean 25–29), so the group is the proper orthochronous Poincaré group, with no double cover. |
| `spectral`, `forward` (Frequencies 67–68; Geometry 78) | the characteristic function of `P(·)x` is `⟨x, U(b)x⟩`; `P(coneᶜ) = 0` with `cone = {‖x⃗‖ ≤ t}` | spectral condition with the closed forward cone. Correct. |
| `unique` | translation-invariant vectors are multiples of `Ω` | uniqueness of the vacuum. Correct. |

So the note's reading is correct as far as it goes. It should list `meets`, and preferably `induced` and `letters`, and then drop the "unverified" caveat.

## Requested changes

**R1. The pointwise mixture identity is a PU-17 output, not a PU-19 output.** This affects the PU-19 row's "Two mixture outputs" and P9.2. In `all_characters`, the `at_words` field of `Completed` is proved by the term `F.α.space.barycenter _ F.phase.phase.decomposition F.phase.phase.chosen F.room.kernel.translations` (Extension.lean 79–80). That is `OS.Spread.Resolution.barycenter` (Mixture.lean 113–117) applied to the certificate fields `decomposition` and `chosen` (PU-17) and to `Hierarchy.translations` (PU-16). It uses no field of the almanac `L`. `publicReconstruction` uses `Completed` only through `h.at_words` (HierarchyBridge 112). The public `mixture` clause is therefore exactly the barycenter identity that the PU-17 row already lists ("barycenter identities for distinct whole words"). Requested: in the PU-19 row, attribute the pointwise identity to PU-17. PU-19 then cites it, and keeps as its own output only the boundary-distribution identity (`at_boundary` / `Headline.Reconstruction.average`). P9.2's "two distinct outputs of PU-19" should be read as "two distinct outputs, of PU-17 and PU-19 respectively".

**R2. Name the producer of every public `Reconstructed` clause, and record that PU-19 is off the path to the public endpoint.** The note lists the public clauses as "label faithfulness, phase measure, smoothness, mixture, analyticity and boundary identities". `Reconstructed` (ChallengeSpec 117–143) has 15 fields. `publicReconstruction` (HierarchyBridge 79–133) proves them from:

| Public clause | Source term used | Unit under the note's split |
| --- | --- | --- |
| `axioms`, `faithful` | `view_axioms _ F.realization.qt`, `qt.faithful` | PU-18 |
| `injective`, `represents` | `S.pin_inj`, `S.rep` | table structure (PU-16) |
| `acts` | `S.alive 0 F.room.kernel.laws` and `qt.faithful` | PU-16 and PU-18 |
| `covers` | `F.sector.derivatives.covered … F.phase.transport.injection` | **`Spec.Locals.injection`**, which the note assigns to the derivative/rank/stress units (PU-11/PU-20) |
| `normalized`, `fullSupport` | `F.phase.phase.decomposition` | PU-17 |
| `permutation`, `smooth` | `S.class_perm`, `S.class_smooth` on `spectate F s` | PU-16 (`s = none`); `Certificate.states` (PU-17) for the phases |
| `characterContinuity` | `F.phase.phase.chosen` and `decomposition.weak` | PU-17 |
| `mixture` | `Completed.at_words`, which is PU-17's barycenter (R1) | PU-17 |
| `analytic`, `root`, `boundary` | `F.realization.chosen.heat.hol`, `.heat.roots`, `.emerges.profile`, with `qt.meets` | PU-18 (selected contour `A`) |

Consequences for the note:
- (a) `covers` is a further crossing into the derivative unit, to be added to open question 3.
- (b) `characterContinuity`, `permutation`, `acts`, `covers`, `represents`, `injective` and `root` should be added to the list in the paragraph after the table.
- (c) Nothing in this bridge uses `allWorld`, `at_boundary`, `Headline.Reconstruction`, or any field of `L` other than the `L`-independent `at_words`. The public hierarchy `hierarchy F Q` (HierarchyBridge 27–42) mentions no `L`, and `Headline.SeparatedOPE F Q` and `Headline.TraceExclusions F` take no `L` in their types. I did not read their producers' proofs. So PU-19 and the unselected contour `allWorld` are needed only for the stronger internal conjuncts of `YangMills.constructed`: `Independent.Core`, `Headline.Reconstruction`, and `∀ i, (view (L.actors i)).Axioms`. They are not needed for `YangMills.JointExistence`. This partly answers open question 4. It also affects scheduling: the public endpoint does not wait for PU-19.

**R3. The full-mesh output is derived, and the derivation should be stated.** This is the "Two orders" paragraph and the PU-15 → PU-16 handoff. In the source receipt, the full-mesh `Ordered` is not a separate limit passage. `fromFunded` (Accepted.lean 165) obtains it as `from_spec ((f.refine g).refine w) ⟨F⟩ hJ.fullMesh`. Here `YM.FullVolume.Final.from_spec` (Program.lean 117–126) combines two inputs:
- the refined-order limit `F.room.ordered`;
- `hJ.fullMesh : PositionsUV R.family .full`, the PU-15 output (Program.lean 148).

`PositionsUV` (Profiles.lean 25–31) gives, at each period, convergence along the full mesh sequence. Its limit equals the refined-order row limit because a convergent sequence and its subsequence have the same limit (`tendsto_nhds_unique … (f.mesh.cofinal)`). The period-stage limit is then inherited from `F.room.ordered`. Requested: say that the checkable full-mesh output follows from the refined-mesh extraction plus PU-15's `PositionsUV … .full` by this one-line argument. Also name `PositionsUV` exactly as the PU-16 input "eventual full-mesh UV estimate". The PR #18 review asked about this ("presumably what `PositionsUV … .full` buys"), and the answer is yes.

**R4. The stress construction consumes `copies` as well as `corrected`, and the rank theorem produces the whole seed.** This is the PU-16 row.
- `YM.MergeProof.Acme.emanate` (Emanate.lean 31–36) takes the whole `s : Seed C F S` and calls `readyA s.cutoff s.ordered s.generic s.kernel s.copies … (cap_given s.corrected) …`. So `copies` is also a cross-package stress input, not only `corrected`, and the stress side also uses the PU-16 fields.
- `YM.MergeProof.Accent.rated` (Powder.lean 48–53) returns `∃ g A L R Z T E, … ∧ ∃ s : Seed C (f.refine g) T, Maxwell.Ranks T s.kernel.spin`. That is the **whole** seed, including `ordered`, `generic` and `kernel`. Its proof begins with the extraction `Extraction.crops M …` (Powder.lean 54; Held.lean 136).

So the source has no theorem producing PU-16's three fields apart from the rank-side two. Requested: say this in the PU-16 row or in open question 2, as an editorial split of `Accent.rated`. It is the same situation as `Broad.refine`.

**R5. Two fields of `Spec.Final` are not assigned.**
- `calibration : Spec.Calibrated C` (Closed.lean 58–61, 65) is the source of the `Spec.Calibrated C` conjunct of `constructed`, as `F.calibration` (Headlines.lean 26). It depends only on `C`, which makes it a natural PU-15 output, but no row names it.
- `sector : Algebra S` (derivatives, rotation, stress) is data that the certificate and `Locals` are stated over.

Requested: name both, with an owner or "outside PU-15–PU-19".

## Optional observations

- **O1.** The PU-18 row says the link from `F.action` to the selected phase is "through `Relativistic.chosen`, not through the type". More precisely, the link is `qt : F.Realizes (W := A.world) …` together with `chosen : A.From (ensemble atPoint)`: the Wightman functions are `A.world` (`meets`), and the roots of `A`'s continuation are the selected Schwinger functions.
- **O2.** `Broad.refine` carries `OPE.Facilities`, which contains the `Services` produced by `extractible17` (Accepted.lean 145, 165). The note writes "OPE services".
- **O3.** `Certificate.heat` (selected `UniqueHeat`) is described but not assigned. Under the split it belongs with PU-17's selected point or with PU-18's uniqueness of the vacuum.
- **O4.** In the source chain, the `C.Makes` used by `regular` is supplied as `R.makes` before any order (Headlines.lean 23), not from `Seed.cutoff`. The note's parenthesis "(the `cutoff` field of `YM.Spec.Seed`)" identifies the type, not the provenance. This supports the note's assignment of `cutoff` to PU-15.
- **O5.** `Final.onward` (Closed.lean 80–90) also transports `copies` (`recur`) and `corrected` (`refresh`). The "refinement-stability" group therefore includes two rank-side stability lemmas besides `Order.upon` and `point_retained`.

## Not checked

- No elaboration, `#print axioms` or kernel replay (Mathlib is unreachable here).
- The proofs of `Headline.SeparatedOPE`, `Headline.TraceExclusions`, `Accent.rated` beyond line 54, and `PositionsUV` producers.
- `Spec.Calibrated`'s internal structures, `PointLimits` (`Meshes`, `VolumePoints`), `OS.Chamber`/`Spread`, and `Stress.Force`: existence and signatures only.
- The literature side (issue #6). This review takes no position on which OS reconstruction theorem applies to PU-18.

## Acceptance

None recorded. This is an agent-assisted correspondence review, and a human reviewer must take responsibility for acceptance. R1–R5 are wording and ownership changes to the note. None of them affects the correctness of a source description.
