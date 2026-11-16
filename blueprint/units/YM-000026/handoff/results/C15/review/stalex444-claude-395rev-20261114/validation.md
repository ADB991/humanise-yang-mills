# Validation record

Session `stalex444-claude-395rev-20261114`, 2026-11-14. All repository reads for the review were made through git objects at fixed commits: `29f27cdb87d39fe0fd464c9548edf25572046faa` (#395), its parent `63820370f7a0b61945aa73cc9e4ad2f9bcd83d83` (head of #393), and `e91c0502dae8abedc6fed4e5872a4e08562ae1fc` (head of `codex/existence-monograph` when the review began), with `git show <commit>:<path>`, `git grep -n <pattern> <commit> -- <dir>` and `git diff`; these reads did not fetch, check out or modify the clone. The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`git status` clean).

This record was prepared after the claim on #394 (16:39:31 UTC). #394 was read just before the claim (16:39:03 UTC; 2 comments; the author's claim released; no other claim) and re-read after it (3 comments, the last being this review's claim). When read at 16:39 UTC, PR #395's head was `29f27cdb` and PR #393's head `63820370`; the clone's fetch at 16:40 UTC gave the base branch head `e91c0502`. #393 and #395 were merged after the claim, unchanged (`74b3529a` at 17:42 UTC and `394f7ea4` at 17:44 UTC). #394 and both PRs were read again at 17:50 UTC, before the pull request for this record was opened: #394 had 4 comments (the 3 read after the claim and, after them, the author's closing comment at 17:48 UTC; no other claim) and was closed; PR #395 carried one review (`hairer`, 17:43 UTC, at `29f27cdb`); the head of `codex/existence-monograph` was `6cb1e760` (fetched into the clone at 17:48 UTC, after the review's reads), which holds both reviewed files with the SHA-256 values of `29f27cdb`. At 17:58 UTC the head was `8d4d9151` (fetched then): later merges add 98 lines to the gallery after l.235; its l.1–235, which contain the lemma and its proof (l.188–234), are identical to `29f27cdb`, and the author record is unchanged. The structural checks run on the commit that adds the directory and are reported in the PR body.

## Commands actually run

| Check | Result |
| --- | --- |
| `git rev-parse 29f27cdb^`, `git rev-parse 63820370^`, `git log -1 --format='%H %cd'` | `29f27cdb` has one parent, `63820370`, whose parent is `67de7339` (mathematics.md M3). Committer dates: `63820370` 17:29:29 +0100, `29f27cdb` 17:29:33 +0100. |
| `git diff --stat 63820370 29f27cdb` | Two files, 78 insertions, no deletions: the gallery +48 (one hunk, `@@ -185,6 +185,54 @@`, new lines l.188–235, l.235 blank) and the new author record +30. The full diff was saved locally; it contains manuscript text and is not included in `evidence/`. |
| `git diff --stat 67de7339 63820370` | The gallery (+9/−9, inside `lem:ex-lattice-firesky-solves`) and the #392 author record (+4). |
| `git grep -n` for the two new labels at `29f27cdb`, `63820370`, `e91c0502` | Each `\label` once at `29f27cdb` (l.189, l.196); `\eqref` at l.203, l.222, l.231; neither label at `63820370` or `e91c0502`. No reference to the lemma from `trace-rounded-comparison.tex` or `trace-rounded-receipt.tex`. |
| `python3 -I evidence/make_hashes.py <repo> 29f27cdb stalex444-claude-395rev-20261114 "draft #395 (commit 29f27cdb), stacked on draft #393 @ 63820370; neither merged" <the 24 path:category pairs, in the order of the files list of hashes.json>` | Produced the `files` list of `hashes.json` (2 target, 7 interface, 15 source; 24 files hashed); the `scope` key was added by hand. The label passed to the script (the `reviewed_pr` key) records the state when the hashes were made; both PRs were merged later (see above). The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 15 passed. The script is the one used for `stalex444-claude-384rev-20261114` (same SHA-256). |
| SHA-256 of the 15 source files in the release checkout at `3456e5e7`, compared with `hashes.json` | 15 of 15 equal. |
| SHA-256 of the #374 endpoint record at `29f27cdb` and at `e91c0502` | Equal (`b2a8a300…`). |
| `git show 29f27cdb:blueprint/units/YM-000026/unit.json` | `trace-firesky-gallery.tex`, `centered-construction.tex` and `centered-estimates.tex` are in the `manuscript` list. |
| `python3 -I evidence/chamber_check.py` | Exit 0. For every odd q ≤ 399 and Z ≤ 29, by exact rational arithmetic: the mesh condition Z+2 < 3q/8 against the worst endpoint ⌊q/8⌋+Z+1 and the proof's chain; prints "counterexamples (cond true, conclusion false): []", and the smallest odd q at which the condition holds against the smallest at which the conclusion holds (Z = 0: 7 against 3; Z = 1: 9 against 5). It is a sanity check of the inequality chain (mathematics.md C6), not a test of M1. Output: `evidence/chamber_check.out`. |
| Lean probes v1, v2 (below) | Exit 1 for v1, exit 0 for v2. |

Python 3.10.18 was used for the scripts.

### Lean probes

Command for both runs, one Lean process at a time (`pgrep -x lean` and `pgrep -x lake` printed nothing before each run), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` used by #383 and review #384 (SHA-256 `07c145c36a45948ac55044a98d5626c201fe7ad6214d627a0739694c8e464707`, equal to `source/build.md` l.37, as recorded in #383's validation) and the dependency `.olean` files from a local Lake package cache on `LEAN_PATH`, as in review #384; the release sources were read and hashed, not placed on `LEAN_PATH`:

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>.lean > <file>.out 2>&1
```

No `lake`, no `leanchecker`, no build, no download. Free disk before each run: 11 GiB.

| Run | Exit | Time | Peak RSS | Result |
| --- | --- | --- | --- | --- |
| v1 | 1 | 32.73 s | 6.95 GB | 4 errors: `Lattice.Axis` unknown (three times; the release name is `YM.Axis`) and one placeholder for the depth proof in `probe_side_odd` not synthesized. `sorryAx` appears only in the axioms of the four probe theorems that failed (`probe_key_scale`, `probe_fit_middle`, `probe_side_odd`, `probe_chamber_closed`). Kept with its output. |
| v2 | 0 | 4.38 s | 6.97 GB | v1 with `YM.Axis` and the depth proof written out; 0 errors, 0 warnings; `sorryAx` does not occur; every printed axiom list is `[propext, Classical.choice, Quot.sound]`. |

The time report is at the end of each `.out`. The v2 run was fast because the imports were in the file cache. The full log is `evidence/RUNLOG.txt`.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review. The author's report of `latexmk` exit 0, 1042 pages, 0 undefined references and inspection of p. 888 (record l.28) was read but is not adopted as evidence here.
- **Structural checks.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` were not run when this record was written; their results are reported in the PR body. The unit fingerprint of YM-000026 at `29f27cdb` was not computed.
- **Lean.** No kernel replay of any release proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified (lean-correspondence.md, N6).
- **#393.** No review of the definitions of `subsec:ex-lattice-firesky-witness` (mathematics.md, N1).

No manuscript, author record, `unit.json`, other review record or `Lean/` file was edited.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text.

| File | SHA-256 |
| --- | --- |
| `Probe395_v1.lean` | `28844fc8cda1dc587f37297f5091c01c2afc882c0f53a7bfad3ca4da043ad26d` |
| `Probe395_v1.out` | `1055b1783c8565dd5273042effa59abac30f9cf5e89ecfc205cc4fd46f687693` |
| `Probe395_v2.lean` | `e75caa51a0104a962bc963f53b81d61a620f3d219282ddf25822c0e74e07a259` |
| `Probe395_v2.out` | `08970b4d02780a800b4efd31f22e67c277f9fbe2754dcc24b39db0cd792e4d15` |
| `RUNLOG.txt` | `746c4e29aa73b334dae3dd62485352017c4bf2260ed8ebc2512c47c29cbba462` |
| `chamber_check.py` | `fd7f69050d8738bc17c2c5b880f12051cb2c3d59bbaf7ed08760f67bd3b4f8c1` |
| `chamber_check.out` | `0e04f5fc3811c628ae154223092fc3ee5d3bca4641c09a4acee931de88d08b3a` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
