# Validation record

Session `stalex444-claude-399rev-20261114`, 2026-11-14. All repository reads for the review were made through git at fixed commits: `817546b7c9d6b305767178906cf3302a638cbea1` (the single commit of draft PR #399, parent `3166276d`), `3166276d28dff5349f67d3918547d5c272da6f01` (the parent of `817546b7`; head of `codex/existence-monograph` when PR #399 was read before the claim) and `7f6f2a6da4df3dfb35c318d3338a4908171501d8` (the commit of PR #388, parent `3166276d`; merged at `f2025974` at 16:08 UTC), with `git show <commit>:<path>`, `git grep -n <pattern> <commit> -- <dir>` and `git diff`; these reads did not fetch, check out or modify the clone. Commit `817546b7` had been fetched into it at 15:49 UTC, before the claim. The reviewed files are those of `817546b7`; they are not in the base branch. The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`git status` clean).

This record was prepared after the claim on #337 (15:56 UTC). Before the claim, PR #399 and the repository's comments were read at 15:45–15:47 UTC (head `817546b7`, base `3166276d`, not merged; the author's handoff on #337 releasing his claim at 15:45 UTC; no later comment at 15:47 UTC). #337 was re-read after the claim (11 comments, the last being this review's claim at 15:56 UTC and the one before it the author's handoff; no other claim). #337 and PR #399 were read again at 16:52 UTC, before the pull request for this record was opened: 11 comments on #337 and no other claim; PR #399 still a draft at head `817546b7`, not merged; the head of `codex/existence-monograph` was `e91c0502` (fetched into the clone at 16:33 UTC, while this record was being checked), which contains the merges of #388 and #402 and holds `trace-scribe-producer.tex` and the author record as at `3166276d` (`2b22a7b8…`, `bb72cdc5…`). The structural checks run on the commit that adds the directory and are reported in the PR body.

## Commands actually run

| Check | Result |
| --- | --- |
| `git diff --stat 3166276d 817546b7` | Two files, 40 insertions and 15 deletions: the author record (+13, appended after l.34) and `trace-scribe-producer.tex`; 7 hunks. The SHA-256 of the full diff output is `7c65330c83c5eb235ae456406787024b861c02f5f271b27850cf086ac5e5e133`; the diff contains manuscript text and is not included in `evidence/`. |
| `git diff --stat 3166276d 817546b7 -- <branch file> trace-clock-cap.tex trace-asymptotic.tex <YM-000034 correspondence>` | Empty. |
| Target SHA-256 at `3166276d` and `817546b7` (`git show <commit>:<path> \| shasum -a 256`) | Scribe file `2b22a7b8…` → `09bd6420…`; author record `bb72cdc5…` → `6e75260d…`. The values at `3166276d` equal those recorded by #388. |
| `python3 -I evidence/make_hashes.py <repo> 817546b7 stalex444-claude-399rev-20261114 "#399 (commit 817546b7, draft, unmerged) on codex/existence-monograph 3166276d" <path:category …>` | Produced `hashes.json` (2 target, 4 interface, 14 source; 20 files hashed). The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 14 passed. |
| SHA-256 of the 14 source files in the release checkout at `3456e5e7`, compared with `hashes.json` | 14 of 14 equal. |
| `python3 -I evidence/make_hashes.py <repo> --check <#388 record>/hashes.json 7f6f2a6d` | ALL MATCH (at the record's own `review_commit`, `bdd348cd`). |
| `python3 -I evidence/response_audit_399.py` | Exit 0. Lines of the scribe file at `817546b7` containing \vartheta (13 lines, l.279–378), \lambda_i (l.638–653), \theta or \Theta (only \Theta, l.670–782); lines of the branch file containing \vartheta (16 lines); scribe lines containing "effective" (l.64, 252, 308, 401); tr M(w)/𝒪 = 0, 0, 4 at w^0, w^−, w^+ from branch l.107. Output: `evidence/response_audit_399.out`. Python 3.10.18. |
| `git grep -n -i 'effective coupl' 817546b7 -- manuscript` | `trace-asymptotic.tex` l.120 (B_i = q_i); branch l.127 and scribe l.64, l.252, l.308 (β_Z). A line-by-line search: scribe l.401–402 split the phrase. |
| `git grep -n '\\vartheta' 817546b7 -- manuscript`; `git grep -n -e '\\theta' -e '\\psi'` in the scribe and branch files | ϑ as threshold (ϑ_k; ϑ_K in `trace-bill-prices.tex`) also in `trace-crown-buffer.tex` l.110, `trace-coffer-supplier.tex` l.359, `trace-bill-prices.tex` l.99 (`\input` at `existence.tex` l.248, l.256, l.257); ϑ reused locally elsewhere (e.g. `all-grade-free-detectors.tex` l.24–26); no \theta and no \psi in either file. |
| `git show 817546b7:blueprint/units/YM-000026/unit.json`; `git grep -n` in `manuscript/existence.tex` | The scribe file is in the YM-000026 `manuscript` list; `existence.tex` inputs the scribe (l.260) and `trace-asymptotic` (l.263), not the branch file. |
| Lean probe v1 (below) | Exit 0. |

### Lean probe

Command, one Lean process (`pgrep -x lean` and `pgrep -x lake` printed nothing before the run), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` used by #388 (SHA-256 `07c145c3…`, equal to `source/build.md` l.37) and the dependency `.olean` files from a local Lake package cache on `LEAN_PATH`, as in #388; the release sources were read and hashed, not placed on `LEAN_PATH`:

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 Probe399_v1.lean > Probe399_v1.out 2>&1
```

No `lake`, no `leanchecker`, no build, no download. Free disk before the run: 11 GiB.

| Run | Exit | Time | Peak RSS | Result |
| --- | --- | --- | --- | --- |
| v1 | 0 | 67.56 s | 6.91 GB | 0 errors, 0 warnings, no `sorryAx`. Lines 1–631 of the output are byte-identical to #388's `Probe377_v2.out` (both SHA-256 `e9531ab8…`); lines 632–656 are the new section F; lines 657–674 are the `/usr/bin/time` report. |

The full log is `evidence/RUNLOG.txt`.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review. The addendum's report (`latexmk -g` exit 0, 1040 pages, 0 undefined references, p. 990 inspected; record l.47) was read but is not adopted as evidence here.
- **Structural checks on this record.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` on the commit that adds this directory were not run when this record was written; their results are reported in the PR body.
- **Unit fingerprint.** `check_blueprint.py --fingerprint YM-000026` was not run at `817546b7`.
- **Lean.** No kernel replay of any release proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified (lean-correspondence.md).
- **Inputs.** No audit of the branch unit's inputs or of the scribe's first clock input (mathematics.md, N1).

No manuscript, author record, `unit.json`, other review record or `Lean/` file was edited.

## Records finding (not a mathematics or Lean finding)

`manuscript/existence/trace-scribe-producer.tex` is in the `manuscript` list of `blueprint/units/YM-000026/unit.json`. Because #399 is not merged, no unit fingerprint at the base describes the revised file; the per-file SHA-256 values in `hashes.json` identify the bytes this review covers. The target hashes recorded by #388 are those at `3166276d`.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text. Evidence of #388 is cited by its path in that record (PR #388, `blueprint/units/YM-000026/handoff/results/C15/review/stalex444-claude-377rev-20261114/evidence/`), not copied.

| File | SHA-256 |
| --- | --- |
| `Probe399_v1.lean` | `96962f14ee156b4f1fe57f88e0a1a408c0b0a1b491d6eefd6f5cb0093dbbb0bd` |
| `Probe399_v1.out` | `cda60321ec771f6968961d872332533d8861344ed22b60052517da0dd2c1fc59` |
| `RUNLOG.txt` | `c022dddb1cf98810e77b687fdfc32ef364b4175965ceff2117105bcf5edbe2c0` |
| `response_audit_399.py` | `956d3fb3d57411a2c6656586d7cbd21a7673d9b5128d5cc7c50a53eb558d4129` |
| `response_audit_399.out` | `d13bef562e00bd1fffe970d6ccfde433e23d393a74766b00591ed47673b02bcc` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
