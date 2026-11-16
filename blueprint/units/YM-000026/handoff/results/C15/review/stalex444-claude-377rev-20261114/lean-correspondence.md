# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded review of the #377 change for #337.
- Role: Lean correspondence
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): a text-level read of the source and a separate elaboration probe (two runs). The findings behind L10 (the author record's no-Lean sentence) were each checked by one independent re-derivation and one author's-advocate refutation; where the checks disagreed, the item says how it was settled. Agreement between agents is not offered as evidence.
- Content SHA-256: `c04b73285ad32af314ce6eb75b601088bc84072b027ae8f099a71408fff65b1f` (unit fingerprint at `bdd348cd`); per-file SHA-256 in `hashes.json`; the 14 source files hashed equal `Lean/SOURCES.sha256` at `bdd348cd` and the release checkout at `3456e5e7`.
- Manuscript files and labels: `manuscript/existence/trace-scribe-producer.tex` (the crown-normalization sentence, the identification paragraph, `lem:ex-lattice-scribe-normalization-ratio`); the last bullet of "Checks actually run" in the author record `results/C15/author/hairer-claude-337F1-20261114/README.md` (l.34).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: #337; reviewed PR #377 (commit `01f5bf3c`, merged at `0f00ae72`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies (N8–N14); no required change. No mismatch between the change and the source was found. In the source the scribe's normalization and the branch unit's are the same arch coupling, so λ_i = 1 there; the lemma is a manuscript-level bridge with no Lean counterpart, and it claims no source statement. L10 (Minor) concerns the author record only.

## What was elaborated and what was not

- **Elaborated.** Probe files `evidence/Probe377_v1.lean` and `Probe377_v2.lean` were elaborated with Lean 4.32.0 (toolchain `leanprover/lean4:v4.32.0`), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` (SHA-256 `07c145c3…`, equal to `source/build.md` l.37 at `bdd348cd`) and the Mathlib and other dependency `.olean` files from a local Lake package cache, using `lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>` (command and resources in `evidence/RUNLOG.txt` and validation.md). The release sources were read and hashed, not placed on `LEAN_PATH`. The printed outputs are `evidence/Probe377_v1.out` and `Probe377_v2.out` (v2 is v1 plus section E). They contain the elaborated types of the declarations below, `#print axioms` for 13 release theorems (`YearP`, `tweak`, `zoom_BQ`, `sum_delta`, `yields`, `blossoms`, `Store_l`, `gang`, `nearing_h`, `muteP`, `unveil`, `gamut`, `Barry`; not for `dex`, `measured`, the other theorems printed by `#check` only, or the definitions), proof-term constant scans of `blossoms`, `yields`, `Store_l` and `gang`, a scan of `blossoms`, `yields` and `Store_l` by free-variable identity against each statement's own binders (v2 only), and four probe theorems (`probe_crown_eq_BQ`, `probe_Hero_eq_BQ`, `probe_ZoomValue_eq_crown`, `probe_lambda_one`). Both runs exited 0 with no errors. Every declaration printed with `#print axioms` depends only on `[propext, Classical.choice, Quot.sound]` (v2 l.534–546, l.567–570); `sorryAx` does not occur in either output. The probe's own theorems were checked by Lean's kernel as they were elaborated.
- **Not done.** The release's proofs were loaded from compiled files and not replayed by an independent kernel checker (no `leanchecker`); nothing was built from source (no `lake`); Mathlib was not rebuilt. The extracted files were not re-verified one by one against the archive, and the dependency `.olean` files were not independently verified (N9).
- **Hidden instances and coercions.** For the declarations below, the printed elaborated types fix implicit arguments, instances and name resolution (for example the scalar action in `Hero` and `Year`, and the `Arch`, `Scaling` and `Vane` arguments of `BQ`, `crown` and `Phase4`). This is inspection of printed types for the listed declarations, not an exhaustive instance audit.
- **Text only.** L7 (the Δ-trace step inside `blossoms`), L9 (the reading of the #357 report) and L12, as marked.

The change itself names no Lean declaration; the pairings below are this review's, guided by the C15 part-B correspondence (`results/C15/part-B/correspondence.md` l.14), the YM-000033 correspondence (l.25) and the YM-000034 correspondence (l.43). Paths are relative to `Lean/YM/`; `Chart/`, `Terrace/` and `Shelves/` abbreviate `TraceExtension/Chart/`, `TraceExtension/Terrace/` and `TraceExtension/Shelves/`. "v2 l.N" refers to lines of `evidence/Probe377_v2.out`; v1 has the same lines 1–570.

## Findings and evidence

| # | Declaration (file:line) | Manuscript counterpart | Verdict | Level, evidence |
|---|---|---|---|---|
| L1 | `Arch` (`TraceExtension/Terrace/Dusk.lean:65–67`), `steep.mintS` (`:68–69`) | β_Z (branch l.495–503) and the arch scale ζ | One coupling `Z.β`; `mintS` makes `Z.β i` the 𝓛-limit of the finite-volume couplings `C.path.β`, as the branch unit describes β_Z (branch l.126–127, l.498–500) | Elaborated, v2 l.1–29 |
| L2 | `BQ` (`TraceExtension/Chart/Dray.lean:42`); `ZoomValue` (`Chart/Nectar.lean:64`); `Scribe.grows`, `.clock`, `.gallery`, `.goal` (`Chart/Time.lean:52–59`) | q_i = ζ(k_i) and the crown q_i r_i⁴ (scribe l.244–248) | Matches: `BQ Z V = Z.β ∘ Stern V`, the arch coupling at the summit (`Stern`, `Terrace/Gondola.lean:32`) | Elaborated, v2 l.44–108, 367–368, 616–627 |
| L3 | `crown` (`Terrace/Path.lean:47`), `Hero` (`Shelves/Route.lean:69`), `Phase4` (`Shelves/Pear.lean:52`), `Moment4` (`Terrace/Calendar.lean:17`) | ω_i = β_Z(k_i)r_i⁴, 𝖯_i = ω_iU_i^{-1}, 𝖬_i (branch l.124–137) | Matches: `crown Z X Q d i = Z.β (Q i) * (X.r i)^d`; `Hero` is `crown Z J (Stern V) d i` times U^{-1}, `Phase4` applies it entrywise | Elaborated, v2 l.367–398 |
| L4 | probe theorems (`evidence/Probe377_v2.lean` l.119–141) | λ_i = β_Z(k_i)/q_i | In the source λ_i = 1 | Kernel-checked probe theorems; axioms v2 l.567–570 |
| L5 | `YearP` (`Chart/Stage.lean:56`), `tweak` (`:67`), `Year` (`:55`) | 𝒫_i = q_i𝒴_i (scribe l.243–245) | Matches: `Phase4 J V Z k U = Year J k (BQ Z V k • U)`; `tweak` gives `Year` as `(BQ Z V k)⁻¹ • Phase4` on kernel-space vectors | Elaborated, v2 l.54–56, 109–111; `tweak`'s hypotheses v2 l.112–161 (its conclusion is elided in the print and was read at `Chart/Stage.lean:67`) |
| L6 | `gamut` (`Terrace/Dusk.lean:89`), `Barry` (`Terrace/Bang.lean:23`) | the lemma's two ratio hypotheses; the second clock input | Both ratio hypotheses are one source theorem, `gamut` (`Z.β i / hatBeta i → 1`) | Elaborated, v2 l.508–521 |
| L7 | `nearing_h` (`Shelves/Pear.lean:66`), `muteP` (`:74`), `sum_delta` (`Chart/Stage.lean:51`), `yields` (`:69`), `blossoms` (`:82`) | field limits, exponent-one washout, tr M_1 = 4𝒪 | Matches; `nearing_h` and `muteP` are stated for `Phase4`, the one map that is both 𝒫_i and 𝖯_i in the source, `yields` and `blossoms` for `Year` (𝒴_i), and `sum_delta` for `materialB` | Statements elaborated, v2 l.189–292, 445–507; the Δ-trace step inside `blossoms` text only |
| L8 | proof terms of `blossoms`, `yields`, `Store_l` | same Z, J, V on both sides | The scale-carrying constants receive the statement's own `Z`, `J`, `V` | Elaborated, v2 l.571–615 |
| L9 | `Gallery.lead` (`Chart/Line.lean:41–44`) | #357 report l.26 ("Order of choices") | Matches the report's reading: one arch `Z` fixed first, then one scaling `J` per null sequence | Elaborated, v2 l.328ff; the report read as text |
| L10 | — | the record's no-Lean sentence (l.34) | Conclusion correct; the stated reason does not bear on the scalar F1 concerns (Minor; record) | Elaborated facts L1–L4; text |
| L11 | — | `lem:ex-lattice-scribe-normalization-ratio` | No Lean counterpart, and none needed | Elaborated facts L4–L6 |
| L12 | `blossoms` proof (`Chart/Stage.lean:83–85`), `dex` | the third transfer | Consistent; context only | Text, with v2 l.528–531, 595–603 |

### L1–L3. The two normalizations in the source

`Arch` has the fields `β : ℕ → ℝ` and `M`. `steep.mintS i` states that `C.path.β j.1 j.2 i` tends along 𝓛 to `Z.β i`, which is how the branch unit describes β_Z: it calls β_Z the associated effective coupling (branch l.126–127), and its scale-ratio paragraph uses that the same ultrafilter sends β_{j,u} to β_Z(j) (branch l.498–500). The scribe side uses `BQ Z V = Z.β ∘ Stern V` in `Scribe.grows`, `Scribe.clock` (`LogZoom J i / BQ Z V i → slopeConstant⁻¹`), `Scribe.gallery` and `Scribe.goal` (through `ZoomValue J (BQ Z V)`, where `ZoomValue X B v k = (X.U k 4).symm ((B k * X.r k ^ 4) • v)`). The branch side uses `crown Z J (Stern V) 4 i`, in `Hero`, `Phase4` and `Moment4`, matching the YM-000034 correspondence l.43 ("The arch coupling in the crown is `Z.β k`"). The C15 part-B correspondence l.14 records `B_i=BQ Z V i=Z.β(Stern V i)`, and the YM-000033 correspondence l.25 maps the arch scale b_j to `Z.β j`.

### L4. λ_i = 1 in the source

Three probe theorems hold by `rfl`: `crown Z J (Stern V) 4 i = BQ Z V i * (J.r i)^4`; `Hero J V Z 4 i = (BQ Z V i * (J.r i)^4) • (J.U i 4).symm.toLinearMap`; `ZoomValue J (BQ Z V) v i = (J.U i 4).symm (crown Z J (Stern V) 4 i • v)`. The fourth, `probe_lambda_one`, gives `Z.β (Stern V i) / BQ Z V i = 1` under positivity (`div_self`). So in the source the scribe's 𝒫_i and the branch unit's 𝖯_i are one map, and the transfers of the lemma are trivial there.

### L5–L7. The source statements behind the lemma's inputs and conclusions

`YearP` and `tweak` are the source form of 𝒫_i = q_i𝒴_i with 𝒫_i = `Phase4`. `gamut` (`Tendsto (fun i => Z.β i / hatBeta i) atTop (𝓝 1)`, under `G.Simple` and the section's hypotheses) is at once the branch unit's scale ratio and the scribe's first clock input, since `Z.β` is both β_Z and ζ; `Barry` is the second clock input (`Z.β i / Z.β (summit i) → 1`). `nearing_h` gives `Phase4 J V Z k (baron S P' (P! k)) → materialB C B`; `muteP` gives `hatBeta (Stern V i) ^ p • ∑ a, Phase4 … a a → 0` for every p when `B ≠ some true` (as printed, the weight is `C.path.levels.clock.hatBeta` at the summit); `sum_delta` gives the diagonal sum of `materialB C (some true)` as `4 • OScale`. The first two are stated for `Phase4`. That `hatBeta (Stern V i)` is the manuscript's z_i = β̂_{k_i}, and that `materialB` and `OScale` are the manuscript's M(w^b) and 𝒪, rests on names and the records (N13).

### L8. Same Z, J and V

A meta program opens each statement's binders and instantiates the proof with the same free variables. In `blossoms`, `BQ`, `Phase4`, `measured`, `dex`, `muteP`, `nearing_h` and `YearP` receive statement binders #21 (`Z`), #26 (`J`) and #28 (`V`); in `yields`, `Phase4`, `BQ`, `tweak`, `YearP`, `measured` and `nearing_h` receive the same binders; in `Store_l`, `zoom_BQ`, `leaderB` and `BQ` receive #21 (`Z`), #27 (`J`) and #29 (`V`) (v2 l.595–615). In `gang` only `styling` and `Store_l` were caught (v2 l.592–594); whether `Gallery.lead`'s instantiation there supplies the same `Z` to both sides was not traced further (N12).

### L9. The #357 report's "Order of choices"

`Gallery.lead` has the shape: there exist 𝓛, `Z` and `a`; then for every positive null sequence s there exist a strictly monotone f, a scaling `J` with `J.r = s ∘ f`, and `V` with `Scribe … J V Z …`. The #357 report (l.26) reads it the same way and concludes that the chart readings and the moving-label and clock data "share one scaling, with the filter and hierarchy fixed before the sequence". That is a statement about `J`; the same quantifier prefix also fixes the single arch `Z` before the sequence.

### L10. The author record's no-Lean sentence (Minor; author record)

Where: record l.34 ("No Lean. F1 concerns manuscript dictionaries only; the source uses one scaling `J` for both").

"No Lean" is an accurate process statement, and "F1 concerns manuscript dictionaries only" is correct: L1–L4 show that the source has one normalization, so F1 is a mismatch between the two manuscript units (as the #357 report l.54 says, "Neither unit states `beta_Z(k_i) = zeta(k_i)`") and nothing in the source needs repair. The clause "the source uses one scaling `J` for both" is also true: `Hero`, `ZoomValue` and `Year` all take the same `J` (L8), which is why the comparison of 𝒫_i and 𝖯_i is entrywise with one U_i and one r_i. It does not bear on the scalar F1 concerns, ζ(k_i) against β_Z(k_i), although the passage it cites (#357 report l.26) also names the single arch `Z` in the same quantifier prefix (L9): `Scaling` (`Climb/Cells.lean:24–31`) has the fields `U`, `xi`, `r` and their properties; its scalar `xi` (a stress normalization in `Scaling.meter`, l.54–55) does not occur in `crown`, `Hero`, `Year` or `ZoomValue`, to which the scaling contributes only `r` and `U`. In the source the scalar comes from the one arch `Z` (`crown`, `BQ`).

The two checks disagreed on whether to point the record at `BQ`: one advocate check argued that citing `BQ` would raise the question whether ζ and β_Z coincide in the source. Settled at the source: `steep.mintS` makes `Z.β` the 𝓛-limit of the finite-volume couplings, which is the branch unit's β_Z as its l.126–127 and l.498–500 describe it, and the correspondence records map the arch scale to `Z.β` (L1); with L4, the two are the same function at `Stern V i`.

Suggestion (optional): name the shared arch coupling as the source fact, for example: both normalizations use `Z.β (Stern V i)` (`BQ`, `Chart/Dray.lean:42`; `crown`, `Terrace/Path.lean:47`), and `YearP` (`Chart/Stage.lean:56`) gives `Phase4 = Year ∘ (BQ •)`, so λ_i = 1 in the source.

Affects: the author record only.

### L11. The lemma has no Lean counterpart (remark)

No source declaration states λ_i → 1 or transfers limits from 𝖯_i to λ_i^{-1}𝖯_i, because the source has no λ (L4). The lemma bridges the two manuscript dictionaries, which define β_Z (branch l.495–503) and ζ (scribe l.693) separately and do not state that they are equal. The lemma claims no source statement. The scribe's sentence "We do not assert that $q_i$ equals the effective coupling of the branch unit" (scribe l.248–249) is accurate for the manuscripts and weaker than the source, where the two are definitionally equal. Optionally, the blueprint correspondence (not the manuscript) could record that in the source both are the arch coupling `Z.β`, so that λ_i = 1 there. No change is required.

### L12. The weight transfer inside `blossoms` (context; text)

In the source, the exponent-one washout passage converts the weight of `muteP` (the clock `hatBeta` at the summit, applied with p = 1) into the scribe weight `BQ Z V i` by the bound `Z.β k ≤ 2 * hatBeta k` (`dex`, v2 l.528–531; applied at `Chart/Stage.lean:85`), a bounded-ratio step on the weight. The note keeps the weight z_i = β̂_{k_i} and changes the map by λ_i^{-1} ≤ 2. Both are consistent with the source; nothing needs changing.

## Required changes and remaining uncertainty

Required: none for this role. Record note: L10 (optional rewording of the author record). Remark: L11.

Not checked:

- N8. The hypotheses of `unveil`, `nearing_h`, `muteP` and `blossoms` beyond their printed statements, and their match with the manuscript's conditional inputs.
- N9. The release's proofs were loaded from compiled `.olean` files and not replayed by an independent kernel checker (the probe's own theorems were kernel-checked as elaborated); neither the release nor Mathlib was rebuilt; no `lake`. That the extracted YM `.olean` files are byte-for-byte those of the archive whose digest matches `source/build.md` l.37 (the tree was not re-verified against the archive), and that the dependency `.olean` files from the local Lake package cache are those of the lock file.
- N10. The internal proof of `Store_l` (`july`, `reveals`, `zoom_BQ`) beyond the free-variable scan.
- N11. The Δ-trace step inside `blossoms` (read as text, not elaborated separately).
- N12. Whether `Gallery.lead`'s instantiation in `gang` supplies the same `Z` to both sides (only `styling` and `Store_l` were caught in `gang`).
- N13. The correspondence of Lean objects to manuscript symbols (`Z.β` = ζ and β_Z, `Stern V i` = k_i, `hatBeta` = β̂, `materialB`, `OScale`) rests on names, the definitions read and the correspondence records, not on a formal link.
- N14. Only the 14 files in `hashes.json` were compared between the release and the monograph tree.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
