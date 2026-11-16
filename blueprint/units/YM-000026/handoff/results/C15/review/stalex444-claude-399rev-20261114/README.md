# Renewed independent review of PR #399: revision of the scribe normalization lemma after review #388 (#337)

- **Session:** `stalex444-claude-399rev-20261114`
- **Contributor:** stalex444, assisted by Claude (Fable 5.2 and Opus 5.5). stalex444 did not author #399 or the files it reviews.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/337#issuecomment-6880175415>
- **Reviewed:** draft PR #399 (commit `817546b7`, on `codex/existence-monograph` @ `3166276d`; not merged when this record was prepared): the revised `manuscript/existence/trace-scribe-producer.tex` (l.62–66, l.276–283, the identification paragraph l.301–334, `lem:ex-lattice-scribe-normalization-ratio` and its proof l.336–381) and the addendum "revision after review #388" to the author record `results/C15/author/hairer-claude-337F1-20261114/README.md` (l.36–47). The reviewed files are those of commit `817546b7` and are not in the base branch; line numbers are those at `817546b7`.
- **Earlier review:** PR #388 (merged at `f2025974` after this review's claim), `results/C15/review/stalex444-claude-377rev-20261114/`. Its labels (M1–M5, L1–L12, C1–C15, N1–N14) are used here unchanged; new items continue the numbering (M6, N15).
- **Source pin:** `3456e5e`. The 14 Lean files hashed in hashes.json match `Lean/SOURCES.sha256` at `817546b7` and the release checkout at `3456e5e7`. This review elaborated one probe file (#388's probe unchanged, plus two `#print` commands and one `#check`) with Lean 4.32.0, with the YM `.olean` files from the compiled release archive used by #388 (`ym-build-3456e5e.tgz`, SHA-256 `07c145c3…`, the checksum in `source/build.md` l.37), and Lean's kernel checked the probe's own theorems as they were elaborated. The release's proofs were loaded from compiled files and not re-checked by an independent kernel checker; nothing was built from source, and Mathlib was not rebuilt. Evidence carried from #388 is cited by its path in that record (see [lean-correspondence.md](lean-correspondence.md)).

Human acceptance is unset. This report is not an approval and changes no unit status or review fingerprint.

## Outcome

- **Mathematics: accepted locally, conditional on stated dependencies; no required change** ([mathematics.md](mathematics.md)). M1–M5 of #388 are addressed as the response table says. M1: the lemma now states the implication 𝖯_i(Δ_i) → M_1 ⟹ tr 𝒫_i(Δ_i) → 4𝒪 (l.351–352), and the proof proves exactly that (l.372–376). M2: l.62–66 call q_i the arch scale ζ(k_i). M3: the ratio is renamed ϑ_i, and λ_i is left only for g_i = λ_iR (l.638–653). M4: both sentences #388 named cite ϑ_i → 1 (l.278–281, l.329–331). M5: the lemma states that β̂ is the same clock coupling in both statements (l.343–345). Every changed line of `trace-scribe-producer.tex` was checked and is correct, and each row of the addendum matches the revised text; the revision introduces no false statement and no gap. No new finding requiring a change; one remark (M6).
- **Lean correspondence: accepted locally, conditional on stated dependencies; no required change** ([lean-correspondence.md](lean-correspondence.md)). L10 is addressed: the addendum names the shared arch coupling `Z.β` at the summit (`BQ Z V = Z.β ∘ Stern V`, `Chart/Dray.lean:42`). No pairing among L1–L9, L11 and L12 changes its verdict. The new clock sentence (l.343–345) has a source counterpart: both ratio statements are the one theorem `gamut` with the one clock term `C.path.levels.clock.hatBeta` (as #388 L6 recorded), and the scribe's clock lemma `zoom_BQ` applies that same `gamut` (read as text). The re-run reproduced the #388 probe output byte for byte and added the definitions of `hatBeta` and `Levels`.

The verdicts are conditional on the inputs the lemma uses (the branch unit's scale ratio and conclusions, and the scribe's first clock input), which this review does not establish.

## Response to #388, finding by finding

Line numbers are those of `trace-scribe-producer.tex` at `817546b7` unless another file is named; "branch" is `trace-branch-moments.tex`, "record" is the author record. Details and checks are in mathematics.md (§1, §2) and lean-correspondence.md.

| Finding (#388) | Where addressed | Status |
|---|---|---|
| M1 (Should): middle conclusion of the lemma stated without its premise | l.351–352; proof l.372–376 | Addressed (stated as an implication) |
| M2 (Should): l.62 still called q_i the selected effective coupling | l.62–66 | Addressed (the optional sub-item, now l.400–402, is unchanged and not claimed by the table) |
| M3 (Minor): λ_i used for two scalars | ϑ_i at l.279–378; λ_i only at l.638–653 | Addressed |
| M4 (Minor): two sentences needed λ_i → 1 | l.278–281; l.329–331 | Addressed |
| M5 (Minor, optional): the clock not named | l.343–345 | Addressed |
| L10 (Minor; author record): no-Lean reason named the scaling J | record l.45 (l.34 unchanged) | Addressed |
| L11 (remark) | — | No change required; l.251–253 unchanged |

## New findings

No new finding requiring a change. One remark:

- **M6 (remark; no change required).** The new name ϑ_i (l.312) is the letter the branch unit uses for its threshold ϑ_k (branch l.128–129), which enters the definitions of the branch moment map (branch l.131–132, l.136, l.142). l.281 and l.315–316 call the scribe's 𝖬_i ϑ_i^{-1} times that map, so a reader who follows the citation meets ϑ_{k_i} next to ϑ_i. Nothing is false (the indices differ and no single formula contains both); ϑ_k is also the threshold in chapters of the book (`trace-crown-buffer.tex` l.110, `trace-coffer-supplier.tex` l.359), and other chapters reuse ϑ locally, so a local ϑ_i is within the book's practice. ϑ is a variant of θ, which #388 M3 proposed after checking only the scribe file, so θ_i would not separate them. Optional: a letter used in neither file (ψ_i, for example), or a clause at l.312 saying that ϑ_i is not the threshold ϑ_k.

## Not established

This review does not establish the inputs of the lemma (the branch unit's scale ratio with its running estimate and fixed-scale limit, `prop:ex-branch-moments`, `prop:ex-branch-washout`, and the scribe's first clock input; #388 N1); the correspondence of the Lean objects to the manuscript symbols beyond names and definitions (#388 N13); or that the extracted compiled files and the dependency `.olean` files used for elaboration are byte-for-byte those of the published archive and the lock file (#388 N9). The manuscript was not built; the addendum's report of `latexmk -g` exit 0, 1040 pages and the inspection of p. 990 was not reproduced (N15). The full list is in mathematics.md and lean-correspondence.md.

## Records

`trace-scribe-producer.tex` is in the `manuscript` list of YM-000026. Because #399 is not merged, no unit fingerprint at the base describes the revised file; the per-file SHA-256 values in [hashes.json](hashes.json) (2 target, 4 interface and 14 source files, hashed at `817546b7`) identify the bytes this review covers. The target hashes recorded by #388 (`2b22a7b8…`, `bb72cdc5…`) are those at `3166276d`. As #388 noted (its README, Records), and not as a change requested of #399: `trace-asymptotic.tex` l.120 and `blueprint/units/YM-000034/correspondence.md` l.144 still use the earlier dictionary; both are unchanged by #399, and since the rewording of l.62, `trace-asymptotic.tex` l.120 is the only line found in `manuscript/` that calls q_i an effective coupling. Validation is recorded in [validation.md](validation.md); the probe output and check script cited are in [evidence/](evidence/).
