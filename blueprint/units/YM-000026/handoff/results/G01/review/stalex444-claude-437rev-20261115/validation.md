# Validation record

Session `stalex444-claude-437rev-20261115`, 2026-11-15. All repository reads for the review were made through git objects at fixed commits of a local clone: `9c631687471dcf10a83dc79d8ce8ede30fbef8aa` (head of `codex/existence-monograph` when read), `1d0cad478f248a5818915b77c47a3442a8315e8c` (the merge of #437, parents `90e6883a` and `9d3d0c3e`) and `90e6883a89182324a97f6cee20db146a6fe7c006` (its base), with `git show <commit>:<path>`, `git grep -n <pattern> <commit> -- <dir>` and `git diff`; these reads did not fetch, check out or modify the clone. The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (clean working tree).

The claim on #382 was posted at 11:15:54 UTC on 15 November 2026 (https://github.com/hairer/humanise-yang-mills/issues/382#issuecomment-6893497688). #382 was read before the claim at 11:15:04 UTC (open; 9 comments, the last by hairer at 10:48:14 UTC; no claim on a review of #437) and re-read after it (10 comments, the last being this review's claim). When read at 11:15 UTC the head of `codex/existence-monograph` was `9c631687`. A scope probe and the reading of #437 began before the claim (reads from 10:56 UTC; one Lean run at 11:03:54–11:04:49 UTC, kept in `evidence/`), and everything else followed it. The structural checks run on the commit that adds the directory and are reported in the PR body. The unit fingerprint was not computed.

## Commands actually run

| Check | Result |
| --- | --- |
| `git diff --stat 90e6883a 1d0cad47` | 5 files, 359 insertions and 4 deletions: the author README (+140), `hashes.sha256` (+13), `unit.json` (+1), `construction-headline.tex` (+196), `statement.tex` (+9/−4). The SHA-256 of the output of `git diff 90e6883a 1d0cad47` is `0c78b6f79bdf50ccf0a754b989ac7c297308ba77dc17c5d7b2f6630621a5436c`; the diff contains manuscript text and is not included in `evidence/`. |
| `git rev-parse 1d0cad47:<path>` and `9c631687:<path>` for the five files | Equal blob ids for all five. |
| `git show 9c631687:<path> \| shasum -a 256` for each line of the author's `hashes.sha256` (Lean paths in the clone's `Lean/` directory) | 13 of 13 equal. |
| `python3 -I evidence/make_hashes.py <repo> 9c631687 stalex444-claude-437rev-20261115 "#437 (commit 9d3d0c3e, merged at 1d0cad47) on codex/existence-monograph 9c631687" <the 86 path:category pairs, in the order of the files list of hashes.json>` | Produced the `files` list of `hashes.json` (5 target, 22 interface, 59 source; 86 files hashed); the `scope` key was added by hand. The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 59 passed. The script is the one used for 392rev and 427rev (SHA-256 `fa5f92ef…`). |
| SHA-256 of the 59 source files in the release checkout at `3456e5e7`, compared with `hashes.json` | 59 of 59 equal. |
| `git show 9c631687:blueprint/units/YM-000026/unit.json` | l.546 is the added `construction-headline.tex`; 246 `manuscript` entries; status `draft`; reviews `{lean: null, mathematics: null}`. |
| `git grep -n 'label{<L>}' 9c631687 -- manuscript/` for every `\ref`, `\eqref` and `\cite` target of the headline | Each label defined once; the kind word of each reference matches its target; `\bibitem{YMG26}` at `existence.tex` l.295. |
| `python3 -I evidence/remark_polynomial_step.py` | Exit 0; five checks print `ok` (mathematics.md, the remark). Output: `evidence/remark_polynomial_step.out`. Python 3.10.18. |
| Lean probes (below) | Scope v1 exit 1 (planned error); a v1 exit 0; b v1 exit 1; b v2 exit 0. |

### Lean probes

Each run was one Lean process (`pgrep -x lean` and `pgrep -x lake` checked before it; no two runs overlapped), with `LEAN_PATH` from the same file as #426 and #438: the YM `.olean` files of `3456e5e7` from the compiled release archive used by the earlier reviews (`ym-build-3456e5e.tgz`, SHA-256 `07c145c3…`, the checksum in `source/build.md` l.37, as recorded in #383 and #426; the comparison was not redone in this review) and the dependency `.olean` files from a local Lake package cache; the release sources were read and hashed, not placed on `LEAN_PATH`:

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>.lean > <file>.out 2>&1
```

(The scope probe was run without `/usr/bin/time`.) No `lake`, no `leanchecker`, no build, no download. Free disk before the runs: 122 GiB.

| Run | Time (UTC) | Exit | Result |
| --- | --- | --- | --- |
| `Probe437_scope_v1` (before the claim) | 11:03:54–11:04:49 | 1 | The single error is the planned test at its l.53: `YangMills.award_eq` is private. 15 release names resolved; 0 warnings; `constructed` axioms `[propext, Classical.choice, Quot.sound]`. |
| `Probe437b_v1` | 11:25:13–11:25:42 | 1 | Two errors in probe theorem P4 (`YM.Test4` for `YM.Boundary.Test4`, and the resulting unsolved goal); P4 depended on `sorryAx` (out l.903). The `/usr/bin/time` report went to `Probe437b_v1.time`. Kept. |
| `Probe437b_v2` | 11:25:57–11:26:01 | 0 | Only that name changed (and the header comment). 0 errors, 0 warnings, no `sorryAx`; 3.93 s, max RSS 8249966592 B. |
| `Probe437a_v1` | 11:26:07–11:26:11 | 0 | 0 errors, 0 warnings, no `sorryAx`; 3.80 s, max RSS 8225308672 B. Before the run, `pgrep` showed the process of `Probe437b_v1` (`RUNLOG_probe_a.txt`); the wrapper that waits for none found none at its first check (`Probe437a_v1.wait`: 0 polls) and started the run at 11:26:07, after `Probe437b_v2` (11:25:57–11:26:01) had ended. |

Every printed axiom list is `[propext, Classical.choice, Quot.sound]` except the three probe theorems that use no axioms (lean-correspondence.md) and P4 in the failed run `Probe437b_v1`, which lists `sorryAx` (out l.903). `evidence/RUNLOG_probe_a.txt` gives the axiom lines of the five probe theorems as l.604–608; in `Probe437a_v1.out` they are l.605–609. `RUNLOG_probe_b.txt` states the archive digest equality without qualification; that comparison was not redone in this review. The run logs are kept unchanged.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review. The author's and the earlier review's build claims were read but are not adopted as evidence here (mathematics.md N4).
- **Structural checks on this record.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` on the commit that adds this directory were not run when this record was written; their results are reported in the PR body.
- **Unit fingerprint.** `check_blueprint.py --fingerprint YM-000026` was not run.
- **Lean.** No kernel replay of any release proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified.

No manuscript, author record, `unit.json`, other review record, shared file or `Lean/` file was edited.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text beyond label names. The three run logs are copied under the names `RUNLOG_scope.txt`, `RUNLOG_probe_a.txt` and `RUNLOG_probe_b.txt`.

| File | SHA-256 |
| --- | --- |
| `Probe437_scope_v1.lean` | `cfb6213d5bdf2c4c1b7ec7049e6d034dc82936efe86cab47e3ab8f22a935190c` |
| `Probe437_scope_v1.out` | `9decbcd3bb47a50ccaad3b41cf90fac6e0f697a0ab365025f951c2d502c4560f` |
| `RUNLOG_scope.txt` | `dc0505abc622db4131fa2259161e571ed0a987024a8f5552b17b7425382bce05` |
| `Probe437a_v1.lean` | `57afe38282751a745735e721dde24aefb9e52585a9a0ee43e0e5d480e06826f0` |
| `Probe437a_v1.out` | `fc0d993d734e472e69144ad1a193383a0dfbd48ecb21b640c7f2974ec4ddda9c` |
| `Probe437a_v1.start` | `31f1ff58de89a90cb72076e2aa0f3f61fcbf27f9cd89b60842df1ea1bac4767a` |
| `Probe437a_v1.end` | `d08138115199d99745e9bc3811f28e8c1fcb9f2999b69ca16d2a17a237fd4b65` |
| `Probe437a_v1.exit` | `9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa` |
| `Probe437a_v1.wait` | `57cf5d0ccdaf7af0b95ace0cfe2eb658508cbb9a4a7ab4e466c5b78ff9f127cf` |
| `RUNLOG_probe_a.txt` | `8089289b3bcda6c918dd82f0b397e29735d4f6c2457438c47be2b53a38400486` |
| `Probe437b_v1.lean` | `36e01655c3fe61afd385fe20765b01750569ae80c8b5ed64f98ca8904ee22b24` |
| `Probe437b_v1.out` | `218e919e4d36545119d381bd1feb8cdad92f6cfc67e8ef2b6bc02d3991816256` |
| `Probe437b_v1.time` | `f514d57a9097bbac716d49ae8c250e778f96c0e3bac36618371038f4daffb0bb` |
| `Probe437b_v2.lean` | `4fc2ada838fd15e3cdf90699aee7e99fe71c6734a22102e8c76c87574e499155` |
| `Probe437b_v2.out` | `14dcc90813f05fa7cdda7b91aac90ecea9a3a10b07b13f4ccace2bc6072b6432` |
| `RUNLOG_probe_b.txt` | `9e3ff951518bdec0867cb954f17a4d1f7193e03d7cc2501897c610331cb89970` |
| `remark_polynomial_step.py` | `f29dd9aff22ce3eed5e735a48f0b7ec0938a5cff8a5ad7dc75d2c1607e76351b` |
| `remark_polynomial_step.out` | `e4a3e27dabe1c59df059bb995bd6ded8eca049d7cfa0ab11d961daaef4601ee7` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
