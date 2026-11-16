# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded renewed review of the #399 revision of the #377 change, for #337.
- Role: Lean correspondence
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): a correspondence read of the revision against the release source and the #388 probe outputs, and one elaboration run (`Probe399_v1`). Each point raised was checked by one independent re-derivation and one author's-advocate refutation; agreement between agents is not offered as evidence. The findings rest on the probe output and the text read, as marked per item.
- Content SHA-256: per-file SHA-256 in `hashes.json`; the 14 source files hashed equal `Lean/SOURCES.sha256` at `817546b7` and the release checkout at `3456e5e7`.
- Manuscript files and labels: `manuscript/existence/trace-scribe-producer.tex` at `817546b7` (l.62–66, l.276–283, l.301–334, `lem:ex-lattice-scribe-normalization-ratio` l.336–381); the author record `results/C15/author/hairer-claude-337F1-20261114/README.md` (l.34 and the addendum l.36–47).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: #337; reviewed PR #399 (commit `817546b7`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies (#388 N8–N14 as below); no required change. L10 is addressed. No pairing among L1–L9, L11 and L12 changes its verdict. The new clock sentence of the lemma (l.343–345) has a source counterpart (L6).

## What was elaborated and what was carried

- **Elaborated in this review.** `evidence/Probe399_v1.lean` is #388's `Probe377_v2.lean` unchanged (including its header comment, which still names it `Probe377_v2`) plus a section F: `#print YM.RG.Calendar.hatBeta`, `#print YM.RG.Levels`, `#check @YM.Trace.Over.zoom_BQ`. It was elaborated once with Lean 4.32.0 (toolchain `leanprover/lean4:v4.32.0`), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` used by #388 (SHA-256 `07c145c3…`, equal to `source/build.md` l.37) and the Mathlib and other dependency `.olean` files from a local Lake package cache, using `lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>`; the release sources were read and hashed, not placed on `LEAN_PATH` (command and resources in `evidence/RUNLOG.txt` and validation.md). The run exited 0 with no errors and no warnings; `sorryAx` does not occur in the output. Lines 1–631 of `evidence/Probe399_v1.out` are byte-identical to #388's `Probe377_v2.out` (SHA-256 `e9531ab8…` for both): the elaborated statements, the 13 `#print axioms` lines and the four probe theorems' axiom lines (each `[propext, Classical.choice, Quot.sound]`), the type-constant lists and the proof-term scans are reproduced unchanged, and the four probe theorems were checked again by Lean's kernel as they were elaborated. Lines 632–656 are section F; lines 657–674 are the `/usr/bin/time` report.
- **Carried from #388, not re-run.** `Probe377_v1.lean` and `.out`, `RUNLOG.txt` and the interpretation of L1–L12, in `blueprint/units/YM-000026/handoff/results/C15/review/stalex444-claude-377rev-20261114/evidence/` (PR #388). "v1 l.N" below refers to lines of `evidence/Probe399_v1.out`; for N ≤ 631 these are the same lines as #388's "v2 l.N".
- **Not done.** The release's proofs were loaded from compiled files and not replayed by an independent kernel checker (no `leanchecker`); nothing was built from source (no `lake`); Mathlib was not rebuilt. The extracted files were not re-verified against the archive, and the dependency `.olean` files were not independently verified (#388 N9).

The revision names no Lean declaration; the pairings are #388's. Paths are relative to `Lean/YM/`; `Chart/`, `Terrace/` and `Shelves/` abbreviate `TraceExtension/Chart/`, `TraceExtension/Terrace/` and `TraceExtension/Shelves/`. Scribe line numbers are those at `817546b7`; #388's scribe line numbers refer to the file at `3166276d`, and lines after its l.61 have moved (old l.64–274 by +3, later lines by +7 to +12; for example #388's l.248–249 are now l.251–252, and its l.693 is now l.705).

## Findings and evidence

| # | Declaration (file:line) | Scribe counterpart at `817546b7` | Verdict now | Level, evidence |
|---|---|---|---|---|
| L1 | `Arch`, `steep.mintS` (`Terrace/Dusk.lean:65–69`) | β_Z (branch l.495–503) | Unchanged; the revision does not change β_Z or its definition (it occurs in changed lines only in the renamed ratio, l.312, l.363) | Elaborated, v1 l.1–29 |
| L2 | `BQ` (`Chart/Dray.lean:42`), `Stern` (`Terrace/Gondola.lean:32`) | q_i = ζ(k_i), l.62–66 (revised), l.249–253 | Matches; the new wording of l.62 ("arch scale at the summit level") is the source's `BQ Z V i = Z.β (Stern V i)` | Elaborated, v1 l.44–108 |
| L3 | `crown` (`Terrace/Path.lean:47`), `Hero` (`Shelves/Route.lean:69`), `Phase4` (`Shelves/Pear.lean:52`), `Moment4` (`Terrace/Calendar.lean:17`) | ω_i, 𝖯_i, 𝖬_i, l.307–316; the new clause l.278–281 | Unchanged; in the source the crown is `BQ · r⁴` by `rfl`, so the factor ϑ_i is 1 and there is one moment map | Elaborated, v1 l.367–398 |
| L4 | probe theorems (`evidence/Probe399_v1.lean` l.119–141) | ϑ_i (formerly λ_i), l.312 | Unchanged: ϑ_i = 1 in the source. The probe theorem keeps its name `probe_lambda_one` | Kernel-checked again; axioms v1 l.567–570 |
| L5 | `YearP`, `tweak`, `Year` (`Chart/Stage.lean:55–56`, `:67`) | 𝒫_i = q_i𝒴_i, l.246–248 | Unchanged | Elaborated, v1 l.54–56, 109–161 |
| L6 | `gamut` (`Terrace/Dusk.lean:89`), `Barry` (`Terrace/Bang.lean:23`), `Calendar.hatBeta` (`RG/History.lean:79`), `zoom_BQ` (`Chart/Orr.lean:42–62`) | the lemma's two ratio hypotheses and the new clock sentence, l.338–345 | Matches; the new sentence has a source counterpart (below) | Elaborated, v1 l.508–521, l.632–656; `zoom_BQ`'s proof read as text |
| L7 | `nearing_h`, `muteP` (`Shelves/Pear.lean:66`, `:74`), `sum_delta`, `yields`, `blossoms` (`Chart/Stage.lean:51`, `:69`, `:82`) | field limits, washout, and the trace statement now in implication form, l.348–355, l.372–376 | Unchanged; the implication form follows the order of inference of `blossoms`, which takes its trace limit from the field limit of `nearing_h` and `sum_delta` (text, #388 N11) | Statements elaborated, v1 l.189–292, 445–507 |
| L8 | proof terms of `blossoms`, `yields`, `Store_l` | same Z, J, V on both sides | Unchanged | Elaborated, v1 l.571–615 |
| L9 | `Gallery.lead` (`Chart/Line.lean:41–44`) | #357 report, "Order of choices" | Unchanged; not touched by #399 | Elaborated, v1 l.328ff |
| L10 | — | record l.34 (unchanged) and addendum l.45 | Addressed | Text; facts of L2–L4 |
| L11 | — | the lemma; l.251–253 | Unchanged remark; l.251–253 unchanged | Facts of L4, L6 |
| L12 | `blossoms` proof (`Chart/Stage.lean:83–85`), `dex` (`Terrace/Dusk.lean:83`) | the third transfer, l.367–368, l.377–379 | Unchanged; rename only (ϑ_i^{-1} ≤ 2) | Text, with v1 l.528–531 |

### L6. The clock sentence (l.343–345)

The new sentence says that β̂_j is the same clock coupling in both ratio statements. In the source, both statements are the single theorem `gamut` (`Terrace/Dusk.lean:89`), whose elaborated type is `Tendsto (fun i => Z.β i / C.path.levels.clock.hatBeta i) atTop (𝓝 1)` (v1 l.508–513); that they are one theorem was already recorded in #388 L6. Its clock is the one term `C.path.levels.clock.hatBeta`, with `hatBeta = S.bar + G.slopeConstant * S.schedule.scale m` (v1 l.632–633) and `clock : Calendar G` a field of `Levels` (v1 l.634–642); this matches β̂_j = β̄ + κ log(𝖺_j^{-1}) (l.707) and the branch unit's affine clock with slope b (branch l.501), with b = κ = `G.slopeConstant` in the source. The scribe's clock lemma `zoom_BQ` (v1 l.643–656; `Chart/Orr.lean:42–62`) applies that same `gamut`, with the same `Z` and steep hypothesis, at `Chart/Orr.lean` l.60 (read as text). There it is evaluated at the frame level `(V i).k` (`Chart/Orr.lean` l.43), the manuscript's j_i, as at scribe l.731–733; the summit k_i = `Stern V i` enters through `BQ` and `Barry`. So, for the correspondence, the identification the manuscript now states (the open point #388 N5) holds in the source, where both statements use the same clock term by construction. What remains is #388 N13: the correspondence of names, `hatBeta` = β̂ among them.

### L10. The author record's no-Lean sentence (addressed)

The addendum row (record l.45) gives the source fact #388 L10 asked for: the shared arch coupling `Z.β` at the summit, `BQ Z V = Z.β ∘ Stern V` (`Chart/Dray.lean:42`; `Stern` = `summit` at `(V i).k`, `Terrace/Gondola.lean:32`), so ϑ_i = 1 there. Its clause "The scaling `J` contributes only U and r" is #388 L10's own reading: the scaling enters `crown` (`Terrace/Path.lean:47`), `Hero`, `Year` and `ZoomValue` only through `r` and `U`, and its field `xi` does not occur there. l.34 is unchanged; it was true (#388 L10), and the record now gives the bearing reason in the addendum. No further change is needed.

### L11. No Lean counterpart (remark, unchanged)

The revision adds no source claim to the lemma; the clock sentence is a manuscript dictionary clause matched by the source (L6). l.251–253 still do not assert q_i = β_Z(k_i), which remains accurate for the manuscripts and weaker than the source.

## Required changes and remaining uncertainty

Required: none for this role. L10 addressed. Remark: L11 (unchanged).

Not checked (labels of #388):

- N8, N10–N12 (unchanged). The hypotheses of `unveil`, `nearing_h`, `muteP` and `blossoms` beyond their printed statements; the internal proof of `Store_l`; the Δ-trace step inside `blossoms` (text); the instantiation of `Gallery.lead` in `gang`. The interior of `zoom_BQ` was read as text (`Chart/Orr.lean` l.43, l.60), not scanned in the proof term; the equation `Schedule.scale m = log(a_m^{-1})` used at `Chart/Orr.lean` l.57 was not elaborated.
- N9 (unchanged). Independent kernel replay of the release's proofs; byte identity of the extracted compiled files with the archive and of the dependency `.olean` files with the lock file.
- N13 (unchanged). The correspondence of Lean objects to manuscript symbols (`Z.β` = ζ and β_Z, `Stern V i` = k_i, `hatBeta` = β̂, `materialB`, `OScale`) rests on names, definitions and the correspondence records.
- N14. Only the 14 files in `hashes.json` were compared between the release and the tree at `817546b7`.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
