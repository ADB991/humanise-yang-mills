# Renewed independent review of PR #427: revision of `subsec:ex-lattice-firesky-witness` after review #426 (#392)

- **Session:** `stalex444-claude-427rev-20261115`
- **Contributor:** stalex444, assisted by Claude (Fable 5.2 and Opus 5.5). stalex444 did not author #427 or the files it reviews.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/392#issuecomment-6886778412>
- **Reviewed:** draft PR #427 (commit `dae5af1f`, on `codex/existence-monograph` @ `1e511906`; not merged when this record was prepared), against the findings of review #426
- **State at submission:** after this record was prepared, on 15 November 2026, #427 was merged at 07:45:17 UTC (`4791210b`), its single commit `dae5af1f` unchanged, and #411 at 07:56:15 UTC (`25e45c08`). At `90e6883a`, the head of `codex/existence-monograph` when read at 09:36 UTC, the gallery is byte-identical to `dae5af1f`; #411 changed other lines of the receipt, and the lead-in and the two items R2 names are there at l.250–251, l.253–257 and l.275–279. Line numbers in this record remain those at `dae5af1f`.
- **Request answered:** <https://github.com/hairer/humanise-yang-mills/issues/392#issuecomment-6886648974>
- **Earlier review:** PR #426, `results/C15/review/stalex444-claude-392rev-20261114/`. Its labels (M1–M6, L1–L16, N1–N8) are used here unchanged; points about the revision are R1–R3, and new unchecked items continue the numbering (N9, N10).
- **Source pin:** `3456e5e`. #427 changes no file under `Lean/` (`git diff --quiet 1e511906 dae5af1f -- Lean`, exit 0). The 22 Lean files hashed in hashes.json match `Lean/SOURCES.sha256` at `dae5af1f` and the release checkout at `3456e5e7`. This review elaborated one probe file (`Probe427_v1`, release declarations printed only, no probe theorems) with Lean 4.32.0, with the same YM `.olean` files as #426 (from the compiled release archive `ym-build-3456e5e.tgz`, SHA-256 `07c145c3…`, the checksum in `source/build.md` l.37, as recorded in #383 and #426); one run, exit 0, 0 errors, 0 warnings, no `sorryAx`. The release's proofs were loaded from compiled files and not re-checked by an independent kernel checker; nothing was built from source (see [lean-correspondence.md](lean-correspondence.md)).

Human acceptance is unset. This report is not an approval and changes no unit status or review fingerprint.

Line numbers are those of the files at `dae5af1f` unless marked "(1e511906)". The reviewed files are those of commit `dae5af1f`, the single commit of PR #427. "Gallery" is `trace-firesky-gallery.tex`, "receipt" is `trace-rounded-receipt.tex`, "rank-root" is `rank-root-normalization.tex`, "rank chapter" is `actual-rank-purchases.tex`, "allarity" is `allarity-marked-propagation.tex`, "the note" is the new author note `results/C15/author/hairer-claude-426resp-20261115/README.md`.

## Outcome

- **Mathematics: accepted locally, conditional on stated dependencies; no required change** ([mathematics.md](mathematics.md)). M1, M2 and M3 of #426 are resolved. M1: the chamber lemma reads "for every $N\ge k$ with" (l.225), and the proof's integrality now rests on it ("since $N\ge k$, $a_k/a_N$ is an integer", l.239–240); re-derived, and N ≥ k suffices for the threshold sentence, for (G4) and for the receipt's root-depth item. M2: (F5) states "$\operatorname{ref}(d')\le k$ for every grade $d'\le d$" (l.143), with both reasons correct, and the solves lemma's proof cites it (l.192). M3: the opening counts the three lemmas, and the opening, the Status paragraph and the closing remark agree that (F3) and (F5) remain inputs (l.87–88, l.216, l.362). M4–M6 and L15 are resolved, and the other changed lines are correct. Two Minor wording points on the revision (R1, R2) and one remark (R3).
- **Lean correspondence: accepted locally, conditional on stated dependencies; no required change** ([lean-correspondence.md](lean-correspondence.md)). Both Lean outcomes of #426 are resolved: L14 (`FitSky.stencils` has `∃ (hN : k ≤ N)`, now the lemma's N ≥ k) and L6/L10 (`PoisedSky.early`, `∀ d ≤ D, C.ref d ≤ k`, now listed in (F5); `Tested.bijective`'s `hk` is supplied). The revised wording of the wheel, σ, θ_k, W_ρ, S_σ, c_k and receipt item (A) matches the source. L7–L9 are not changed, as the note says.

The verdicts are conditional on the inputs the subsection names, (F3) and (F5), and on the cited results this review does not establish (#426 N1–N3).

## Response to #426, finding by finding

Details and checks are in mathematics.md §1 and lean-correspondence.md.

| Finding (#426) | Where addressed (`dae5af1f`) | Status |
|---|---|---|
| M1 (Required): chamber lemma omits N ≥ k | gallery l.225, l.239–240, l.244 | Resolved |
| M2 (Should): ref(d′) ≤ k not stated | gallery l.142–148; proof l.192 | Resolved (k < N in l.192 comes from l.111, which scopes (F5); no change required) |
| M3 (Should): Status and opening predate #395, #397 | gallery l.83–88, l.202–216, l.359–364 | Resolved, with one Minor wording point (R1) |
| M4 (Minor): stamp duty undefined; "clock factors" | gallery l.119–120, l.157–161 | Resolved (remark R3 on the new gloss) |
| M5 (Minor, optional): notation in (F5) and the corrected labels | gallery l.92–95, l.153–155, l.167–177 | Resolved |
| M6 (Minor, optional): clock-fields wording | gallery l.287–290 | Resolved; the letter renaming is not done, as the note says |
| L7–L9 (Minor) | — | Not changed, as the note says; not reopened (lean-correspondence.md) |
| L15 (Minor; #397 record) | #397 record l.31–33 (erratum) | Resolved |
| Root-depth repair (`f1fbe95d`) | gallery l.310–315, unchanged | Certification stands; the erratum's sentence on it matches #426 |
| Records notes: receipt l.266–267, l.287–289 (1e511906) | receipt l.264–268, l.286–290 | Resolved (R2 on the unchanged lead-in) |
| Records notes: rank-root l.381–383, allarity l.763–764 | — | Unchanged at `dae5af1f`; replaced at `08222954`, then the head of draft #411, as the note says (no severity) |

## New points

Labels: Required / Should / Minor. No Required or Should point.

- **R1 (Minor; gallery l.205–207).** The Status paragraph says (F1), (F2) and (F4) "are proved below", and names `prop:rank-root-output-ticket` for (F4). That Proposition is in rank-root (label at l.308), which `existence.tex` inputs at l.213, before the gallery at l.236; the closing remark below only says "(F4) is replaced by" it (l.363). Suggested: "(F1) and (F2) are proved below, by Lemma~\ref{lem:ex-lattice-firesky-clock-fields} and the remark after it, and (F4) by Proposition~\ref{prop:rank-root-output-ticket}", or drop "below".
- **R2 (Minor; receipt l.261–262).** The lead-in "The following inputs remain open." is unchanged, but two of the three items under it now say they are supplied: item (A), for the clock at all large k (l.267–268), and the root-depth item, "This is Lemma~\ref{lem:ex-lattice-firesky-chamber}" (l.288–289), which holds for every chart and gives (G4) in the form it is stated (comparison l.72). Only (B) remains open, and the gallery's Status paragraph already lists "the allowance and the root-depth identification" as supplied (l.210). Suggested: "Of the following inputs, only (B) remains open; (A), for the clock, and the root depth are supplied as stated in their items."
- **R3 (remark; no change required; gallery l.157–159).** In the new gloss of the stamp duty, "whose low-grade reading is $T_{d'}$" (l.158–159): in the source the insertions are tested against the shrunk `scaled (Price.shrink …) (T v)` (`Heating.test`, `Next/RANK/ParticleGate.lean:35–36`), that is S_σ(T_{d′}v), as in the reading equation l.188; the reading itself is `StampDuty.T`, that is T_{d′}. The clause is recorded, not used.
- **Already in the note (no severity).** The note says the rank-root and allarity sentences "are already replaced in draft #411 (S2)". At `08222954` rank-root l.382–384 cites `lem:ex-lattice-firesky-clock-fields` and the allarity sentence is replaced (l.1081–1084 cite the same lemma); at `dae5af1f` both still stand (rank-root l.381–383, allarity l.763–764).

## Not established

This review does not establish the inputs (F3) and (F5), the derivation of `eq:rank-reference-inverse` (only its hypotheses were checked; #426 N2), the cited interiority argument (#426 N1), or the correspondence of Lean objects to manuscript symbols beyond names and the definitions read (#426 N7); nor independent kernel replay of the release's proofs, or that the YM `.olean` files used are byte-for-byte those of the published archive and the dependency `.olean` files those of the lock file (#426 N6). The manuscript was not built, and the note's "Checks actually run" were not reproduced (N9). #411 was read only at the lines cited (N10). The full list is in mathematics.md and lean-correspondence.md.

## Records

`trace-firesky-gallery.tex` is in the `manuscript` list of YM-000026 at `dae5af1f`; `trace-rounded-receipt.tex` is not. No unit fingerprint was computed at `dae5af1f`; the per-file SHA-256 values in [hashes.json](hashes.json) (4 target, 7 interface and 22 source files, hashed at `dae5af1f`) identify the bytes this review covers (gallery `d2054838…`, receipt `4eeb6180…`, note `229e3fbb…`, #397 record `ff09187a…`). The hashes #426 recorded for the gallery (`ae73b506…`) and the #397 record (`4a4fdbb6…`) are those at `1e511906`. The #426 record is not edited. Validation is recorded in [validation.md](validation.md); the probe, its output and run log, and the check script with its output are in [evidence/](evidence/).
