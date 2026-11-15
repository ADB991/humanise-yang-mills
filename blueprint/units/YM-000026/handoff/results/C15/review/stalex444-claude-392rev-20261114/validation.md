# Validation record

Session `stalex444-claude-392rev-20261114`, 2026-11-14. All repository reads for the review were made through git objects at fixed commits: `1e51190627606f8662263bd7a4b8502e8c3f9790` (head of `codex/existence-monograph` when the review was claimed), and, for history, `67de7339`, `63820370`, `29f27cdb`, `44ed50d6`, `7b80cabc`, `f1fbe95d`, `434c02a6` and their parents, with `git show <commit>:<path>`, `git grep -n <pattern> <commit> -- <dir>`, `git log`, `git blame` and `git diff`; these reads did not fetch, check out or modify the clone. The local clone received `1e511906` at 22:09:58 UTC (`git reflog show --date=iso refs/remotes/upstream/monograph`: 2026-11-14 17:09:58 -0500). The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

This record was prepared after the claim on #392 (22:09:15 UTC, 14 November 2026). #392 was read before the claim at 22:08:44 UTC (open; 7 comments, the last by hairer at 20:04:02 UTC; no live claim) and re-read after it (8 comments, the last being this review's claim). When read at 22:08:44 UTC the head of `codex/existence-monograph` was `1e511906`. The structural checks run on the commit that adds the directory and are reported in the PR body.

## Commands actually run

| Check | Result |
| --- | --- |
| `git show 1e511906:manuscript/existence/trace-firesky-gallery.tex`, `git grep -n '\\subsection'` | The subsection is l.78–342 (`\subsection` at l.78, label at l.79); the next `\subsection` is at l.343. |
| `git log --format='%h %cI %s' 1e511906 -- <gallery>` | Since the base of #393: `67de7339`, `63820370`, `29f27cdb`, `44ed50d6`, `7b80cabc` (all 16:17–17:29 +0100), `f1fbe95d` (18:53:32 +0100; author `hairer`, from `git show -U0 f1fbe95d` below), `434c02a6` (21:03:52 +0100). |
| `git show -U0 f1fbe95d`, `git show -U0 434c02a6` | `f1fbe95d` changes only the gallery (+6/−4, hunk `@@ -279,4 +279,6 @@`; parent `7b80cabc`); `434c02a6` changes only the gallery (hunks `@@ -124,2 +124,11 @@` and `@@ -181,2 +190,2 @@`). Neither has an author record. |
| `git diff 29f27cdb 1e511906 -- <gallery>`; byte comparison of `29f27cdb` l.188–234 with `1e511906` l.197–243, and of l.1–120 | Three hunks (+111/−4); the two ranges are identical (diff exit 0), and l.1–120 are identical. `git diff --stat 29f27cdb 1e511906` of `trace-rounded-comparison.tex`, `trace-rounded-receipt.tex`, `centered-construction.tex`, `centered-estimates.tex`, `common-scale-selection.tex` and the #395 author record: empty. |
| `git log -S'label{subsec:rank-root-output-ticket}'`; `git grep` at `67de7339`, `434c02a6^`, `1e511906` | Added in `413e82ad`; at `rank-root-normalization.tex` l.283 at all three commits (mathematics.md, Notes). |
| `git grep -n -i 'stamp duty\|clock factor'` at `1e511906` over `manuscript/` | Gallery l.113, l.146, l.337 and `actual-rank-purchases.tex` l.436 only (mathematics.md M4). |
| `git grep -n ex-lattice-firesky-chamber` at `1e511906` over `manuscript/` | Gallery l.198, 205, 212, 231, 240 only. |
| `git grep` for `395rev`, `#395` and N ≥ k wording in `blueprint/units/YM-000026/handoff/results/C15/` at `1e511906` | No record other than 395rev itself responds to its M1. |
| `git blame` of receipt l.266–267 and l.287–289, rank-root l.381–383, allarity l.763–764 | `6865f2b3`, `413e82ad`, `71b21fae`, all before `67de7339` (mathematics.md, Notes). |
| `python3 -I evidence/make_hashes.py <repo> 1e511906 stalex444-claude-392rev-20261114 "merged text of subsec:ex-lattice-firesky-witness on codex/existence-monograph @ 1e511906 (from #393, #395, #397 and #412)" <the 45 path:category pairs, in the order of the files list of hashes.json>` | Produced the `files` list of `hashes.json` (4 target, 11 interface, 30 source; 45 files hashed); the `scope` key was added by hand. The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 30 passed. The script is the one used for `stalex444-claude-384rev-20261114` and `stalex444-claude-395rev-20261114` (same SHA-256). |
| SHA-256 of the 30 source files in the release checkout at `3456e5e7`, compared with `hashes.json` | 30 of 30 equal. |
| `git show 1e511906:blueprint/units/YM-000026/unit.json` | `trace-firesky-gallery.tex` is in the `manuscript` list. |
| `python3 -I evidence/solves_linear_core.py` | Exit 0. Exact rationals: 160 instances with A invertible and half-accuracy, T singular in none, X e solves the equation exactly; controls (A singular; constant 1) give singular T. A sanity check of the linear-algebra core (mathematics.md C17). Output: `evidence/solves_linear_core.out`. |
| `python3 -I evidence/clock_fields_check.py` | Exit 0. Four clocks of the restated form (β_* = 3; see mathematics.md C28), b ∈ {0.5, 5.5, 20}, k ≤ 400000; for each check, the last k at which it fails (mathematics.md C28). Output: `evidence/clock_fields_check_output.txt`. |
| `python3 -I evidence/chamber_range_check.py` | Exit 0. The example of mathematics.md (395rev M1, standing) and 16,253 random trials in which N = ℓ < k satisfies the mesh condition in every trial. Output: `evidence/chamber_range_check.out`. |
| Lean probes, lane A v1–v3 and lane B v1 (below) | Lane A: exit 1, 1, 0. Lane B: exit 0. |

The three scripts were run again from `evidence/` when this record was written, with Python 3.10.18; each exited 0 and printed output identical to the saved file.

### Lean probes

Command for every run, with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` used by #383 and the reviews 384rev (#402) and 395rev (#405) (SHA-256 `07c145c36a45948ac55044a98d5626c201fe7ad6214d627a0739694c8e464707`, equal to `source/build.md` l.37, as recorded in #383's validation) and the dependency `.olean` files from a local Lake package cache on `LEAN_PATH`, as in 384rev and 395rev; the release sources were read and hashed, not placed on `LEAN_PATH`:

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>.lean > <file>.out 2>&1
```

(Lane A v1 only: stderr went to `Probe392a_v1.time`.) No `lake`, no `leanchecker`, no build, no download. Free disk before the runs: 49 GiB.

| Run | Start (UTC) | Exit | Time | Peak RSS | Result |
| --- | --- | --- | --- | --- | --- |
| A v1 | 22:17:58 | 1 | 42.65 s | 6.74 GB | Errors from `YM.Next.Rank.clim` (release name `YM.Next.Rank.Atlas.clim`), `YM.RG.Schedule` (release name `YM.Schedule`) and an unparenthesised argument in `probe_width_formula`; one unused-variable warning; `sorryAx` only in the axioms of `probe_gain_empty`. Kept. |
| A v2 | 22:18:58 | 1 | 38.14 s | 6.74 GB | Errors in `probe_width_formula` only (the same parse fault). Kept. |
| A v3 | 22:19:49 | 0 | 30.84 s | 6.74 GB | 0 errors, 0 warnings; `sorryAx` does not occur; every printed axiom list is `[propext, Classical.choice, Quot.sound]` (l.450–456 for the probe theorems). |
| B v1 | 22:18:04 | 0 | 36.83 s | 6.75 GB | 0 errors, 0 warnings; `sorryAx` does not occur; every printed axiom list is `[propext, Classical.choice, Quot.sound]` (l.201–203, 217, 251, 287–293, 305). |

The time report is at the end of each `.out` (lane A v1: `Probe392a_v1.time`). The run logs are `evidence/RUNLOG_probe_a.txt` and `evidence/RUNLOG_probe_b.txt`.

**Process deviation.** The runs were meant to be one Lean process at a time. Before lane B v1, `pgrep -x lean; pgrep -x lake` printed one PID (69487), and the run was started in the same shell command without waiting; `ps -p 69487` right after the run showed that process had exited. By the start times and durations in the two run logs, lane B v1 (22:18:04–22:18:41 UTC) ran almost entirely inside lane A v1 (22:17:58–22:18:41 UTC), so the two runs overlapped for about 36 s; PID 69487 was most likely lane A v1 (the logs record no PID for lane A's runs). The header of `RUNLOG_probe_a.txt` ("One Lean process at a time") describes lane A's own pre-run checks, which printed nothing; it does not record this overlap. Both runs completed; the failure of lane A v1 is from errors in the probe source listed above.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review. The author records' reports of `latexmk` exit 0, page counts, 0 undefined references and pages inspected were read but are not adopted as evidence here.
- **Structural checks.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` were not run when this record was written; their results are reported in the PR body. The unit fingerprint of YM-000026 at `1e511906` was not computed.
- **Lean.** No kernel replay of any release proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified (lean-correspondence.md, N6).
- **PR #397's discussion.** Not read (no network access in the review run); the review that prompted `f1fbe95d` is not among the eight #392 comments. The 18:36 UTC comment on #392 says "#397 was revised after a review posted from the hairer account"; `f1fbe95d` was committed at 17:53:32 UTC.

No manuscript, author record, `unit.json`, other review record or `Lean/` file was edited.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text.

| File | SHA-256 |
| --- | --- |
| `Probe392a_v1.lean` | `c442a3e75fd412e0b9c95cf12102ffbb658d62dbc8a4f897ae83a42ec274bc8d` |
| `Probe392a_v1.out` | `5519bc43a424d70e6147eaebf7c36154b2984347666620bf823a26fcc8d9568c` |
| `Probe392a_v1.time` | `c343fba65572d0b1c55f16c86a79374e6a5f98ba874db0a877ed3329dda19954` |
| `Probe392a_v2.lean` | `c08d86a8e9637744a5be8e381a45ed1380954559a48d7eefb1d46b73dbc279ff` |
| `Probe392a_v2.out` | `5be621fc8ef7b7924fe70ce9574897fee0134dcdd8560df330f10f0d7b03ac45` |
| `Probe392a_v3.lean` | `0e383473587395c842860305db06cfa335d3a19883fc9d1e30c3671efb426ef5` |
| `Probe392a_v3.out` | `b0f7ae4fd3630976f4bf007f0421f1da035a9bd140d76263a049e7e5ade4d6d8` |
| `Probe392b_v1.lean` | `8116c076da306e5d2ad6f8c72e606e8e4a4c55816e9328061dd5df713c3c1b75` |
| `Probe392b_v1.out` | `0b14e8b1dddb1527df2ab99bd6ec4dd18ea48da8814abf78fe162c80d97e157c` |
| `RUNLOG_probe_a.txt` | `c9e10682dae79fc5a7034a8c693096c09d4f07812d97458419b493ccbe5a8e94` |
| `RUNLOG_probe_b.txt` | `978979d37863a3e3f5b7caa0ed3da564ef09ffcda73de51aa2c6414ed0d3c79b` |
| `solves_linear_core.py` | `021196b9a910398d00ab7dcc220b6d0a5cad2d5073e0e80eacf8c8b396f9a2c1` |
| `solves_linear_core.out` | `76314b7316cacbc96c95d755fb1b8603846d0af4a3769c8ca8b499479287cc32` |
| `clock_fields_check.py` | `37aaa8c0e0e28f17c60f789c0de3976da0fb8b29b4729417478232d89eba6a2b` |
| `clock_fields_check_output.txt` | `8f663805048c2e27f322da42e197f623d203daf38e9430b229862811f83c58a8` |
| `chamber_range_check.py` | `195cef0e67ae2daf8f88c435141efbadb51c690c3e2e5552c1c44dbefebdaf52` |
| `chamber_range_check.out` | `fc6ecc722f070a6d77555799a866ceab46438ff4cafe739a0957cc16c2e72754` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
