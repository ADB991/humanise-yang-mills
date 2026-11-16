# Validation record

Session `stalex444-claude-384rev-20261114`, 2026-11-14. All repository reads were made through git at fixed commits of `codex/existence-monograph`: `3166276d28dff5349f67d3918547d5c272da6f01` (head), `6426c0beed8cff17e6ce54958c56d696182aa476` (merge of #384), `6865f2b308d11f56662a5650a4d07b976f8d7a02` (#384) and `bdd348cdc94106de1ec1fa79a708e55b244998a8` (the state reviewed by #383, after its merge), with `git show <commit>:<path>`, `git grep -n <pattern> <commit> -- <dir>` and `git diff`, without checking out or modifying the clone. The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

This record was prepared after the claim on #372 (14:26 UTC). #372 was re-read and the targets re-hashed after the claim at 14:26 UTC (head `3166276d`; the three revised files unchanged since `6426c0be`; no other claim). The structural checks run on the commit that adds the directory and are reported in the PR body.

## Commands actually run

| Check | Result |
| --- | --- |
| Comments of #372, fetched once after the claim (read-only) and saved locally | 8 comments; the latest is this review's claim (2026-11-14T14:26:32Z); no other claim for a review of #384. |
| Clone state: `.git/FETCH_HEAD` written at 14:26:50 UTC (rewritten by later fetches, still `3166276d`); `git for-each-ref` | `origin/codex/existence-monograph` = `3166276d`. |
| `git diff --stat 6426c0be 3166276d -- <note> <parent> <author README>` | Empty: the three revised files are byte-identical at the merge of #384 and at `3166276d`. |
| `git diff --stat 6865f2b3 6426c0be` | Empty: the merge commit has the tree of #384. |
| `git diff --stat bdd348cd 6426c0be` | Three files, 202 insertions and 103 deletions in all (author README +23; parent 6 lines changed; note the rest), 8 hunks. The full diff was saved locally (SHA-256 `97d4d53b69f55553d33ba8d7cea849a5212279d155332eee54980ce57d114f29`); it contains manuscript text and is not included in `evidence/`. |
| `git log -1 --format='%H %P %ci'` for `6865f2b3`, `6426c0be`, `413e82ad`, `3166276d`; `git merge-base --is-ancestor 6865f2b3 413e82ad` | `413e82ad` (#378, PR #386) has parent `bdd348cd` and does not descend from `6865f2b3`; it was merged at `3166276d` (parents `634ef293`, `413e82ad`) after `6426c0be`. |
| Target SHA-256 at `bdd348cd`, `6426c0be`, `3166276d` (`git show <commit>:<path> \| shasum -a 256`), after the claim | Note `44dd8b53…` → `42ccb549…`; parent `84a5aa4d…` → `5adee4f5…`; author README `65f68f6b…` → `6760e017…`; the values at `6426c0be` and `3166276d` are equal. The values at `bdd348cd` equal those recorded by #383. |
| `python3 -I evidence/make_hashes.py <repo> 3166276d stalex444-claude-384rev-20261114 "#384 (commit 6865f2b3) merged at 6426c0be" <path:category …>` | Produced `hashes.json` (3 target, 5 interface, 17 source; 25 files hashed). The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 17 passed. |
| SHA-256 of the 17 source files in the release checkout at `3456e5e7`, compared with `hashes.json` | 17 of 17 equal. |
| `python3 -I evidence/make_hashes.py <repo> --check <#383 record>/hashes.json 3166276d`; `git diff --quiet bdd348cd 3166276d -- <#383 record>` | ALL MATCH (at the record's own `review_commit`, `0f00ae72`); the #383 record is unchanged at `3166276d`. |
| `python3 -I evidence/response_audit_checks.py` | Exit 0. Reduced threshold: 720,471 cases (20,000 draws), 0 returned levels below K; 8,659 below K with the unreduced θ. Supply identities: differences 0 (symbolic). Monitor bounds for K(i,(i+1)^{-1}) with M = i+2: log₁₀ μ ≥ 1.45, 14.45, 30.54, 48.16, 67.10 for i = 0…4. Output: `evidence/response_audit_checks.out`. |
| `python3 -I evidence/fresh_read_checks.py` | Exit 0. Cost and supply identities to 30–40 digits for M ∈ {2, 3, 10, 52}; width chain on 10,000 random cases; reduced-threshold argument on random non-monotone clocks with K ∈ {0, 1, 2, 5, 13}; K(d,ε) = 4 on the monitor (1, 40, 1, 1, 50, …); i = 0 cost condition trivial. Output: `evidence/fresh_read_checks.out`. |
| `python3 -I scripts/check_blueprint.py`, run in an export of the tree of `6426c0be` (= `6865f2b3`) | "Blueprint structure OK: 4 units. Lean and mathematics were not verified."; exit 0. The export was compared with `git ls-tree -r 6426c0be` file by file with `git hash-object`: 10,945 files, 0 mismatches. Output: `evidence/check_blueprint_6426c0be.out`. This checks the author's "check_blueprint.py → OK" (author README l.76); it is not a check of the commit that adds this record. |
| `git show 3166276d:blueprint/units/YM-000026/unit.json` | Neither revised `.tex` file is in the unit's `manuscript` list. |
| Lean probes v1–v3 (below) | Exit 0 for v1, v2 and v3. |

The two scripts were re-run on 2026-11-14 with Python 3.10.18 (sympy 1.14.0, mpmath 1.3.0); their outputs were identical to the saved ones.

### Lean probes

Command (v2 and v3 exactly; v1 differs only in its stderr redirection, see the table), one Lean process at a time (`pgrep -x lean` and `pgrep -x lake` printed nothing before each run), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` used by #383 (SHA-256 `07c145c3…`, equal to `source/build.md` l.37, as recorded in #383's validation) and the dependency `.olean` files from a local Lake package cache on `LEAN_PATH`, as in #383; the release sources were read and hashed, not placed on `LEAN_PATH`:

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>.lean > <file>.out 2>&1
```

No `lake`, no `leanchecker`, no build, no download. Free disk before the runs: 11 GiB.

| Run | Exit | Time | Peak RSS | Result |
| --- | --- | --- | --- | --- |
| v1 | 0 | 34.24 s | 6.85 GB | 0 errors, no `sorryAx`; one deprecation warning (`push_neg` deprecated, v1 `.out` l.113–119). Run with stderr sent to `Probe384_v1.time` instead of `2>&1`; Lean's messages are all in `.out`. |
| v2 | 0 | 4.20 s | 6.87 GB | v1 with `push_neg` replaced and the `trays d` instance added; 0 errors, 0 warnings. |
| v3 | 0 | 3.12 s | 6.87 GB | v2 plus `probe_chamber_depth`; 0 errors, 0 warnings. |

The later runs were fast because the imports were in the file cache. The full log is `evidence/RUNLOG.txt`.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review. The author's report of `latexmk` exit 0, 1039 pages, 0 undefined references and inspection of pp. 1011–1013 (author README l.76) was read but is not adopted as evidence here.
- **Structural checks on this record.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` on the commit that adds this directory were not run when this record was written; their results are reported in the PR body.
- **Lean.** No kernel replay of any release proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified (lean-correspondence.md).
- **Producers.** No audit of (A), (B), (G4), the bracket property or the proof of `prop:rank-root-output-ticket` (mathematics.md, N1, N5, N6, N24).

No manuscript, author record, `unit.json`, other review record or `Lean/` file was edited.

## Records finding (not a mathematics or Lean finding)

Neither `manuscript/existence/trace-rounded-receipt.tex` nor `manuscript/existence/trace-rounded-comparison.tex` is in the `manuscript` list of `blueprint/units/YM-000026/unit.json` at `3166276d`, so the unit fingerprint does not cover them; the per-file SHA-256 values in `hashes.json` are the operative fingerprint of this review. The target hashes recorded by #383 describe the files before #384.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text. Evidence of #383 is cited by its path in the repository (`blueprint/units/YM-000026/handoff/results/C15/review/stalex444-claude-373rev-20261114/evidence/`), not copied.

| File | SHA-256 |
| --- | --- |
| `Probe384_v1.lean` | `df48d8706c64fc69fd9a9d8365646df6e5b3afb63107d9c745c347d10baafe4d` |
| `Probe384_v1.out` | `11afc2756b82f136b9df954363e7f1d8a5d72492480d0618eabe20f8827a4c96` |
| `Probe384_v1.time` | `17ea5c0909a5e39a021b71458f4a0c11d95ace6441854e51c96df8634bfd2250` |
| `Probe384_v2.lean` | `124069d44292a20e69f89a0ff0906b892705056e4c75baee3dca12e9bfa88414` |
| `Probe384_v2.out` | `9ee242afcc5fc130e390b2e90b9b062720a9fb49b1269c8860245a4dfcdc7b68` |
| `Probe384_v3.lean` | `b06da4063bc86faa925db6f10efa9337ca67c9b53d2728502b7f6c4e3c058940` |
| `Probe384_v3.out` | `be5e21aa7da05e76b0df2008bf7cdae3be1675518d2aa3d763fdc55926c7b47e` |
| `RUNLOG.txt` | `804dedb101417209a0b8899671edfee8a2132ccd68c8bb27a980d115492aa8c1` |
| `check_blueprint_6426c0be.out` | `c05c5eeb68838f8d73102501bcd9a5b6790a32222ac96d8e04da99e845084d55` |
| `fresh_read_checks.py` | `f374e2506954d6fc820a234b56121380604c3d5225bcfe02038a60f7832f0654` |
| `fresh_read_checks.out` | `2b67b92efd8b6ba692d5fdcf84626371d06898052024c50a90d9afb9a78fe332` |
| `response_audit_checks.py` | `c355547c64b95abc43422fed50d94d4de74086117852af34a5cde745e17ef570` |
| `response_audit_checks.out` | `d05d279c45143cbaa3fe5d8d59e04a1f175884d15f45773db9174e135ec7c968` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
