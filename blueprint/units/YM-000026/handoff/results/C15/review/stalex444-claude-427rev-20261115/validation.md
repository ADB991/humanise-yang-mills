# Validation record

Session `stalex444-claude-427rev-20261115`, 2026-11-15. All repository reads for the review were made through git objects at fixed commits: `dae5af1f4caeadc862ac593312dc14eb24dbf9c0` (the single commit of PR #427, parent `1e511906`), `1e51190627606f8662263bd7a4b8502e8c3f9790` (then the head of `codex/existence-monograph`, on which #427 is based; the text #426 reviewed) and `08222954698b395be012c4fae68dcf5f4e1a5fc6` (`refs/remotes/upstream/pr411`, then the head of draft #411), with `git show <commit>:<path>`, `git grep -n <pattern> <commit> -- <dir>` and `git diff`; these reads did not fetch, check out or modify the clone. The reviewed files are those of `dae5af1f`. The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

This record was prepared at the author's request of 00:32:51 UTC on 15 November 2026; its reads began at 00:33 UTC, and the Lean probe ran at 00:42:07–00:42:55 UTC, before the claim was posted. When read at 00:33 UTC, PR #427 was an open draft with head `dae5af1f` on base `1e511906`, with no comment and no review comment on it (`comments` 0, `review_comments` 0). The claim for this renewed review is recorded at https://github.com/hairer/humanise-yang-mills/issues/392#issuecomment-6886778412 (posted 00:43:02 UTC on 15 November 2026). The structural checks run on the commit that adds the directory and are reported in the PR body.

## Commands actually run

| Check | Result |
| --- | --- |
| `git diff --stat 1e511906 dae5af1f` | 4 files, 85 insertions and 35 deletions: the gallery (81 lines changed), the receipt (13), the #397 record (+4, appended after l.29) and the new note (+22). With default context the gallery diff has 10 hunks and the receipt diff 2. The SHA-256 of the output of `git diff 1e511906 dae5af1f` is `73b22eeb766d493f803193fd9d28345db14b6b028eb9907fa9a7600bb45e3805`; the diff contains manuscript text and is not included in `evidence/`. |
| `git diff --quiet 1e511906 dae5af1f -- Lean` | Exit 0: no file under `Lean/` changes. |
| Target SHA-256 at `1e511906` and `dae5af1f` (`git show <commit>:<path> \| shasum -a 256`) | Gallery `ae73b506…` → `d2054838…`; receipt `42ccb549…` → `4eeb6180…`; #397 record `4a4fdbb6…` → `ff09187a…`; note absent → `229e3fbb…`. The values of the gallery and the #397 record at `1e511906` equal those in #426's `hashes.json`. |
| `python3 -I evidence/make_hashes.py <repo> dae5af1f stalex444-claude-427rev-20261115 "#427 (commit dae5af1f, draft, unmerged) on codex/existence-monograph 1e511906" <path:category …>` | Produced `hashes.json` (4 target, 7 interface, 22 source; 33 files hashed). The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 22 passed. The script is the one used for 384rev, 395rev, 399rev and 392rev (SHA-256 `fa5f92ef…`). |
| SHA-256 of the 22 source files in the release checkout at `3456e5e7`, compared with `hashes.json` | 22 of 22 equal. |
| `git show dae5af1f:blueprint/units/YM-000026/unit.json` | The gallery is in the `manuscript` list; the receipt is not. |
| `git grep -n 'input{existence/…}' dae5af1f -- manuscript/existence.tex` | `rank-root-normalization` at l.213, `trace-firesky-gallery` at l.236 (mathematics.md R1). |
| `git grep -n 'label{prop:rank-root-output-ticket}' dae5af1f -- manuscript` | `rank-root-normalization.tex` l.308 only. |
| `git grep -n 'remain open' dae5af1f -- <receipt>` | l.262 only (mathematics.md R2). |
| `git grep -n -i 'stamp duty' dae5af1f -- manuscript`; `git grep -n halo` in the gallery and the rank chapter | Stamp duty: gallery l.157, rank chapter l.436. Halo: gallery l.158 only. |
| `git grep -n 'not located' <commit> -- <allarity>` at `08222954` and `dae5af1f`; `git show 08222954:<allarity>` l.1076–1087; `git show 08222954:<rank-root>` l.380–386 | No match at `08222954` (exit 1; at `dae5af1f`: l.502 and l.763); allarity l.1081–1084 cite `lem:ex-lattice-firesky-clock-fields` for the plateau and the bracket; rank-root l.382–384 cite `lem:ex-lattice-firesky-clock-fields`. At `dae5af1f` both stale sentences stand (rank-root l.381–383, allarity l.763–764). |
| `python3 -I evidence/chamber_revised_check.py` | Exit 0. Exact rationals; 400 random clock instances: 3959 cases (k, N ≥ k) with the mesh condition, no failure; 326 instances with a mesh-satisfying N < k and a_k/a_N not an integer; the example of #426: ℓ = 15, w = 8, N = 10, …, 19 excluded. Output: `evidence/chamber_revised_check.out`. Python 3.10.18. |
| Lean probe v1 (below) | Exit 0. |

### Lean probe

Command, one Lean process (`pgrep -x lean` and `pgrep -x lake` printed nothing before the run), with the same `LEAN_PATH` as #426: the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` (SHA-256 `07c145c3…`, equal to `source/build.md` l.37, as recorded in #383 and #426) and the dependency `.olean` files from a local Lake package cache; the release sources were read and hashed, not placed on `LEAN_PATH`:

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 Probe427_v1.lean > Probe427_v1.out 2>&1
```

No `lake`, no `leanchecker`, no build, no download. Free disk before the run: 121 GiB.

| Run | Exit | Time | Peak RSS | Result |
| --- | --- | --- | --- | --- |
| v1 | 0 | 47.89 s | 6.85 GB | 0 errors, 0 warnings, no `sorryAx`. Prints only, no probe theorems; both `#print axioms` lists `[propext, Classical.choice, Quot.sound]` (l.12, l.92); lines 148–165 are the `/usr/bin/time` report, which varies from run to run. |

The full log is `evidence/RUNLOG.txt`.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review. The note's "Checks actually run" (`latexmk -g -pdf existence.tex`: rc 0, no undefined references; `python3 scripts/check_blueprint.py`, with no result stated) were read but are not adopted as evidence here (mathematics.md N9).
- **Structural checks on this record.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` on the commit that adds this directory were not run when this record was written; their results are reported in the PR body.
- **Unit fingerprint.** `check_blueprint.py --fingerprint YM-000026` was not run at `dae5af1f`.
- **Lean.** No kernel replay of any release proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified (lean-correspondence.md).
- **#411.** Read only at the lines cited; no merge of #411 with #427 was attempted (mathematics.md N10).

No manuscript, author record, `unit.json`, other review record or `Lean/` file was edited.

## Records finding (not a mathematics or Lean finding)

`manuscript/existence/trace-firesky-gallery.tex` is in the `manuscript` list of `blueprint/units/YM-000026/unit.json`. No unit fingerprint was computed at `dae5af1f`; the per-file SHA-256 values in `hashes.json` identify the bytes this review covers. The target hashes recorded by #426 are those at `1e511906`.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text. Evidence of #426 is cited by its path in that record (PR #426, `blueprint/units/YM-000026/handoff/results/C15/review/stalex444-claude-392rev-20261114/evidence/`), not copied.

| File | SHA-256 |
| --- | --- |
| `Probe427_v1.lean` | `948d545a6adf827aad4efcefef16648350828f1f35391c376304cf7d13bba1eb` |
| `Probe427_v1.out` | `cf0a960df66ddc67659c3c17f625cd6b59e2805ef0152f5b27102c9e478e1516` |
| `RUNLOG.txt` | `22bed924ab138f9500fd65e810e2443a1446a09b4b13c0cd5f46e776917e1ce9` |
| `chamber_revised_check.py` | `4f7f54bc25a61f0c9ebb0949674c17cd6157bfadaba4793b4a080e6302b873dd` |
| `chamber_revised_check.out` | `903d32cb0ac4cb787ded172249d95bc2823f329c56a458bcf6c311bd01243537` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
