# Renewed review of the interface note: construction to reconstruction (#160, PR #244)

- Reviewed file: `blueprint/interfaces/continuum-reconstruction.md` at draft PR #244, head `6097bd5a381349674f1d364486b1816b26392fd4`. PR #244 is the author response, by session `mgubi-astra-interface160-response-20261113`, to review #228 (R1–R5).
- Content SHA-256: `3df158a0c57ab41f783e104047049951da15046ce6550be2388cca9a9da238c9`. This matches the hash in the author's handoff.
- Base: `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. The note there (as reviewed in #228) has SHA-256 `c6748f08…a3c558`. PR #244 changes no other file.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, which is `Lean/` in this repository. `Lean/` is identical at the base and at `6097bd5`. `sha256sum -c Lean/SOURCES.sha256` reports 9,497 files OK.
- Role: Lean correspondence, renewed, with a check of the mathematical meaning of the new ownership statements.
- Human reviewer: ADB991. No acceptance is recorded.
- Agent assistance: Claude Code (Anthropic), running as a scheduled agent on behalf of ADB991 (session `ADB991-claude-20261113-6bb7`), did the inspection and wrote this report. ADB991 had not read it before it was submitted. No subagents were used.
- Review task: [issue #160](https://github.com/hairer/humanise-yang-mills/issues/160), claim <https://github.com/hairer/humanise-yang-mills/issues/160#issuecomment-6863545621>.
- Independence: ADB991 wrote review #228, which this response answers. It did not write the note (#18, #170), the author response (#244), the PR #18 review or G01 P9.
- Outcome: **R1–R5 resolved; one minor correction requested (N1), plus two optional wording points (N2, N3).** Every source statement added by PR #244 that I checked is accurate, with one exception. The fifteen-clause map labels `injective` and `represents` as open PU-16 inputs. In fact both hold for every `Table` by construction (N1).

## Method and limits

Evidence level: **[S]** means source text read at the pin, including binders and the proof terms quoted below. **Nothing was elaborated.** This sandbox cannot reach the Mathlib cache, so `lake` cannot build dependencies. The PR body lists 17 frozen input files with SHA-256 hashes. I checked all 17 against the base (`sha256sum -c`), and all match.

Files read at the pin for this review:
- `ChallengeSpec.lean` 117–143 (`Reconstructed`);
- `HierarchyBridge.lean` 16–45, 79–133 (`hierarchy`, `publicReconstruction`);
- `Construction.lean` (whole);
- `YM/Spec/Closed.lean` 28–100 (`Algebra`, `Calibrated`, `Final`);
- `YM/EveryPhase/Extension.lean` 60–80;
- `YM/OPE/Eye/Views.lean` 26–30 (`spectator`, `spectate`);
- `YM/Euclid/Union.lean` 1–40;
- `YM/Euclid/Null.lean` 1–105;
- `YM/Euclid/Words.lean` 103;
- `YM/Euclid/Lift.lean` 108–113 (statements);
- `YM/FullVolume/Finale/Program.lean` 117–126, 148;
- `YM/FullVolume/Profiles.lean` 25–33;
- `YM/R2I/Campaign/Accepted.lean` 150–165;
- `YM/MergeProof/Powder.lean` 48–54;
- `YM/Extraction/Held.lean` 136;
- `YM/MergeProof/Emanate.lean` 15, 31–36;
- `YM/Next/UV_STRESS/Invert.lean` 108–110;
- `YM/Pert/Construction.lean` 21–31;
- `YM/RG17/Joint.lean` 61–90;
- `YM/Nonperturbative/Headlines.lean` 20–30;
- `YM/Price/Intent.lean` 26–55;
- `YM/PCalc/Band.lean` 26–36;
- `YM/Shoot/Reach.lean` 93.

The proofs of `all_characters`' other fields, of `rated` past line 54 and of `Relativistic.allWorld` were not read. Neither PR #244 nor this review claims anything about them.

## R1–R5 of review #228: status [S]

| Item | Response in PR #244 | Verdict |
| --- | --- | --- |
| R1, two mixtures | The pointwise identity is assigned to PU-17. `all_characters` fills `at_words` by `F.α.space.barycenter _ F.phase.phase.decomposition F.phase.phase.chosen F.room.kernel.translations` (Extension.lean 79–80), which uses no field of `L`. The boundary mixture `at_boundary` / `Headline.Reconstruction.average` is assigned to PU-19. The P9.2 response-table row is corrected. | **Resolved.** Lines 79–80 are exact. The statement of `at_words` (Extension.lean 68–69) mentions only `F.α` and `S`, not `L`, so the PU-17 ownership is a property of the statement, not only of this proof. |
| R2, public clauses | A fifteen-clause table is given. The "literal call versus smaller interface" paragraph says that `publicReconstruction` takes `L, h` but uses only `h.at_words`, and that the stronger conjuncts of `constructed` still need PU-19. | **Resolved**, apart from N1. The clause count and order match `Reconstructed` (ChallengeSpec 117–143). Each "immediate source" entry matches the bridge proof term (HierarchyBridge 81–132). `constructed` passes `core.reconstruction` as `h` and keeps `Independent.Core`, `Headline.Reconstruction` and `∀ i, (view (L.actors i)).Axioms` as separate conjuncts (Construction.lean 25–27, 37–39). |
| R3, full mesh | `from_spec` (Program.lean 117–126) combines `F.room.ordered` with `PositionsUV R.family .full`. It identifies the limits by `tendsto_nhds_unique (hx.comp f.mesh.cofinal) (hD p h)` and keeps `hV`. `fromFunded` calls it with `hJ.fullMesh` (Accepted.lean 165). | **Resolved.** All anchors are exact. `Jewel.fullMesh : PositionsUV R.family Extraction.Sequence.full` is at Program.lean 148. The note's statement that no rank receipt is moved to the full-mesh order agrees with the docstring at Program.lean 115–116 ("Not asserting CellHyp etc on that order"). |
| R4, whole seed | `rated` (Powder.lean 48–54) returns `∃ s : Seed C (f.refine g) T, …` and starts with `Extraction.crops` (Held.lean 136). `emanate` (Emanate.lean 31–36) passes `s.cutoff s.ordered s.generic s.kernel s.copies` and `cap_given s.corrected` to `readyA`. | **Resolved.** "Dimension bound" is accurate: `cap_given : Cells.RankWidths C F S → DimAbove S`, where `DimAbove S := ∀ d, finrank (S.Field d) ≤ finrank ((Bel L).Field d)` (Invert.lean 108–110). |
| R5, calibration and sector | `Final.calibration : Calibrated C` is a family-level receipt, proposed for PU-15. `withFinal` takes it as input, `extractible17` supplies it from `hT.reception`, and `existence` projects `F.calibration` (Headlines.lean 26). `Final.sector : Algebra S` has fields `derivatives`, `turns` and `energy`, and is assigned outside PU-15–PU-19. | **Resolved.** `Calibrated` (Closed.lean 58–61) depends on `C` only. `Algebra` (Closed.lean 28–31) has exactly these three fields. `withFinal` (Construction.lean 21–31) returns `h.sector = ⟨W, mill M I c U, J⟩`. See N2 for one wording point. |

## Changes requested

**N1 (minor, correction): `injective` and `represents` are structural facts about every table.** The new table describes:
- `injective` (`S.pin_inj`) as a "Proposed PU-16 table/physical-label input; its construction is not established here and does not follow from extraction bounds alone";
- `represents` (`S.representative`, `S.rep`) as a "Proposed PU-16 table/quotient representative input; no quotient construction is certified here".

At the pin, neither depends on any property of the particular table:
- `Table.Field d` is *defined* as `L.Ref d ⧸ S.null d` (Null.lean 74). Here `S.null d = ker (S.replies d)` is the space of reference labels whose correlations with every separated exterior word vanish (Null.lean 31–34, criterion 36–42).
- `pin d` is the codomain restriction of `spectra d = (S.null d).liftQ (S.replies d)` (Union.lean 25–26, Null.lean 93). `pin_inj` is proved for every `S : Table L` from `faithfully`, which is `ker_liftQ_eq_bot` (Union.lean 29–30, Null.lean 97–98).
- `representative` is a linear right inverse of the quotient map, obtained by choice. `rep` is its defining property, and both hold for every table (Null.lean 87–91).

So the mathematical content of these two clauses is the *definition* of the physical label space: the quotient of the reference labels by the null space of the Euclidean correlations, which is a standard OS-type quotient. Two facts then follow: the induced map into functions on exterior words is injective, and the finite-dimensional quotient has a linear section. No unit has to produce these from extraction data, so they are not open inputs. Suggested wording for both rows: "holds for every table by the quotient definition of `Table.Field` (`Lean/YM/Euclid/Null.lean`, `Union.lean`); the monograph must state this definition where the physical labels are introduced (PU-16 or notation), with no further proof obligation". `acts` is different: it really does use a PU-16 hypothesis, `S.Basic` via `F.room.kernel.laws` in `S.alive` (Null.lean 102), and the table states this correctly.

## Optional

- **N2 (wording).** In the "Final.sector" paragraph, "with the equality retained by `Run.extractible17`" overstates what the statement exports. In `extractible17` the equality `hFa` is passed to `attached` to prove `Pert.FirstExtension F X` (Joint.lean 88–90), but its conclusion does not export it. Downstream consumers cannot recover `F.sector = ⟨W, mill M I c U, J⟩` from the statement. "used internally by" would be accurate.
- **N3 (reading of `Calibrated`).** The prose "sheet, block lengths, protection/delays, directed trajectory and finite histories" was checked for `Sheet` and for `Rolls` (`L : ℕ → Side`, large, odd and monotone; Intent.lean 26–53), which are the block side lengths. `Trail B.a p` is `∀ m, Rep G (a.S.side m p)` (Reach.lean 93), a sequence indexed by all scales `m`. Only the `Move` relation is restricted to `m < N`, so "finite histories" is an interpretation. I did not unfold `Protection`, `Delays`, `Bar`, `Wait`, `Stays` or `Move`. Since the note proposes this as a PU-15 output requirement, the PU-15 author should take the field meanings from the definitions, not from this summary.

## Also confirmed [S]

- In the `permutation` and `smooth` rows, `spectate F s` is `U.room.kernel` for the mixed viewer and `U.phase.phase.states _` for a character (Views.lean 30). So the PU-16/PU-17 split in those rows is exact. `class_perm` and `class_smooth` (Lift.lean 108, 113) are general lemmas with `Symmetric`/`Smooth` hypotheses.
- `covers` uses `F.sector.derivatives.covered F.room.kernel.laws.toSymmetric F.phase.transport.injection` (HierarchyBridge 90). `DiffPlan.covered` (Union.lean 40) needs `S.Symmetric` and `P.Inclusions S`, so the derivative-side crossing that the note adds to open question 3 is real.
- `boundary` rewrites with `publicMoment _ F.realization.qt.meets` (HierarchyBridge 123–128), and `emerges.int` is not used. This matches the row and the earlier P9.3 finding.
- `hierarchy F Q` (HierarchyBridge 27–43) mentions no almanac. Its `phaseMeasure` is `F.α.space.μ` and its `selected` is `F.α.atPoint`.
- The "literal call" paragraph correctly avoids claiming a Lean refactoring, and correctly keeps `constructed`'s source route through `L, h`.

## Not checked

No `#print axioms`, kernel replay or LaTeX build was run (the change is Markdown only). The literature side (#6) was not addressed. The unchanged parts of the note were reviewed in #228 and were not re-read here, beyond the diff context.

## Recommendation

After N1, which changes two table cells, no further correspondence review of this note is needed for R1–R5. The note can go to human acceptance together with #228 and this report. N2 and N3 are optional. This is an agent-assisted review, not an acceptance.
