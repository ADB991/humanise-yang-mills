# Validation record

Session `stalex444-claude-377rev-20261114`, 2026-11-14. All repository reads were made through git at `codex/existence-monograph` `bdd348cdc94106de1ec1fa79a708e55b244998a8` and at the commit under review `01f5bf3c1a54864c097fa162a59d3dd41dc406a2` (`git show <commit>:<path>`, `git grep -n <pattern> <commit> -- <dir>`, `git show 01f5bf3c`), without fetching, checking out or modifying the clone. The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`git status` clean).

This record was prepared after the claim on #337 (13:48 UTC). #337 was re-read immediately after the claim (comments saved 13:48:57 UTC) and the targets re-hashed (head `bdd348cd`; the reviewed files unchanged since `0f00ae72`; no live claim other than this one; the earlier claims on #337, by ADB991 and by hairer for F1, were released at 01:11 and 08:27 UTC). Rechecked at 15:04 UTC on 2026-11-14, before opening the report PR: head `3166276d`; the two target hashes unchanged; no other live claim on #337.

## Commands actually run

| Check | Result |
| --- | --- |
| `git rev-parse 01f5bf3c^` and `git show --stat 01f5bf3c` | One parent, `a8c24495`. The commit changes two files: `trace-scribe-producer.tex` and the author record. |
| `git diff --stat 0f00ae72 bdd348cd -- <scribe> <branch file> <author record> <YM-000034 correspondence> <trace-asymptotic.tex>` | Empty: these files are unchanged between the merge of #377 and `bdd348cd`. |
| `git log -4 bdd348cd -- manuscript/existence/trace-scribe-producer.tex` | `01f5bf3c` (#377), then `3f5cf17e` by ADB991 (refs #361). |
| `git grep -n -i -e 'effective coupl' -e 'effective$' bdd348cd -- manuscript` | The phrase names q_i at scribe l.62 and `trace-asymptotic.tex` l.120; β_Z at branch l.127 and scribe l.249, l.301; β̂_i at `actual-stress-shell-nodes.tex` l.13–14; an unnamed quantity at scribe l.389–390; other hits (`trace-price-recurrence.tex` l.262, `trace-regular-atom.tex` l.20) are unrelated. `statement.tex` has no occurrence of "coupl". |
| `python3 -I evidence/make_hashes.py <repo> bdd348cd stalex444-claude-377rev-20261114 "#377 (commit 01f5bf3c) merged at 0f00ae72" <path:category …>` | Produced the `files` list of `hashes.json` (2 target, 10 interface, 14 source); the `scope` key was added by hand. The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 14 passed. The script is the one used and tested for `stalex444-claude-373rev-20261114`. |
| SHA-256 of the 14 source files in the release checkout at `3456e5e7` (`evidence/SOURCE_SHA256.txt`), compared with `hashes.json` | 14 of 14 equal. |
| SHA-256 of `trace-scribe-producer.tex` at `0f00ae72` and at `bdd348cd` | Both `2b22a7b8…` (full value in `hashes.json`). |
| `python3 -I evidence/math_forward_377.py` | Exit 0. Items 1–3 are symbolic tests: 𝒫_i − λ_i^{-1}𝖯_i = 0 with a random invertible 4×4 matrix for U_i (true); V_{k,q r⁴} − λ_i^{-1}V_{k,ω} = 0 (true); tr M(w)/𝒪 = 0, 0, 4 at w^0, w^−, w^+ (true). The printed line "ALL ALGEBRAIC CHECKS PASS: True" refers to items 1–3 only. Items 4–5 are numerical illustrations on toy sequences, not tests: item 4 prints λ_k (0.94 at k = 10⁷), the check λ_k^{-1} ≤ 2 and the field and washout transfers along k = 10…10⁷ (the trace transfer is not printed); item 5 prints λ = 1.108094 at k = 10⁷ for slopes b = 2.0, κ = 1.7, and the limit b/κ = 1.176471 (the docstring writes this limit as κ/b; mathematics.md M5). Output: `evidence/math_forward_377.out.txt`. |
| `python3 -I evidence/math_adversarial_377.py` | Exit 0. Item 1: the ratio of the scribe crown to the branch crown equals λ_i^{-1} (true). Items 2–3: scalar stand-in for the linearity of V_{k,c} in c, and tr M(w^+)/𝒪 = 4, tr M(w^0)/𝒪 = tr M(w^−)/𝒪 = 0. Items 4–5 are illustrations: three early indices with λ_i^{-1} > 2 and the transfers along i ≤ 4000; and the arithmetic of a clock off by a factor 2. Output: `evidence/math_adversarial_377.out.txt`. |
| Both scripts re-run on 2026-11-14 | Outputs byte-identical to the files in `evidence/`. |
| `python3 -I scripts/check_blueprint.py --fingerprint YM-000026` on a checkout of `bdd348cd` | `c04b73285ad32af314ce6eb75b601088bc84072b027ae8f099a71408fff65b1f`. |
| Lean probes v1, v2 (below) | Exit 0 for both. |

Python 3.10.18 was used for the scripts (sympy 1.14.0).

### Lean probes

Command for every run, one Lean process at a time (checked with `pgrep -x lean` / `pgrep -x lake` before each run), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` (SHA-256 `07c145c3…`, equal to `source/build.md` l.37 at `bdd348cd`) and the dependency `.olean` files from a local Lake package cache on `LEAN_PATH` (in order: the archive's `lib/lean`, then `.lake/build/lib/lean` of LeanSearchClient, Qq, aesop, batteries, importGraph, mathlib, plausible and proofwidgets; the release sources were read and hashed, not placed on `LEAN_PATH`):

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>.lean > <file>.out 2> <file>.time
```

No `lake`, no `leanchecker`, no build, no download. Free disk before the runs: 12 GiB.

| Run | Exit | Time | Peak RSS | Result |
| --- | --- | --- | --- | --- |
| v1 | 0 | 61.24 s | 7.00 GB | sections A–D; 0 errors; four probe theorems accepted; every printed `#print axioms` lists only `propext`, `Classical.choice`, `Quot.sound` |
| v2 | 0 | 29.67 s | 7.03 GB | v1 plus section E (scan by free-variable identity against each statement's own binders; `Scribe` field types); 0 errors; same axioms |

`sorryAx` does not occur in either output. The full log is `evidence/RUNLOG.txt`; the `/usr/bin/time` outputs are `evidence/Probe377_v*.time`. The header comment of `Probe377_v2.lean` describes v2 as v1 plus section E.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review and no manuscript file is changed. The author's `latexmk` result was read but is not adopted as evidence here.
- **Structural checks.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` were not run when this record was written. They check the working tree that contains this record, which exists only in the fork worktree from which the report PR is opened; they are run on the commit that adds this directory, and their results are reported in the PR body.
- **Lean.** No kernel replay of any release proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified (lean-correspondence.md, N9).
- **Inputs.** No audit of the branch unit's inputs or of the scribe's clock inputs (mathematics.md, N1).

No manuscript, author record, `unit.json`, other review record or `Lean/` file was edited.

## Records

`manuscript/existence/trace-scribe-producer.tex` is in the `manuscript` list of `blueprint/units/YM-000026/unit.json` at `bdd348cd`, so the unit fingerprint covers it; that fingerprint also covers the other 244 listed files and changes with any of them. The per-file SHA-256 values in `hashes.json` identify the bytes this review covers. `trace-branch-moments.tex` is in the manuscript list of YM-000034.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text.

| File | SHA-256 |
| --- | --- |
| `Probe377_v1.lean` | `c55089f7e08be8ccc2694ca54c2bec708e9ce0dcbd0b86a3010ade0c568961bc` |
| `Probe377_v1.out` | `f7ec8f0734b284de55ec393061b95bcc3422cc54e29ba705743090b453ef2c92` |
| `Probe377_v1.time` | `da1fb8f4fab43602ea7538eb7da3bb2939183ddbb765334d765aadc318e29ffa` |
| `Probe377_v2.lean` | `ceffe50410bfe2c82f7eb3a2be82fc8c379067cee7643a587119a6278ad7257e` |
| `Probe377_v2.out` | `e9531ab8dcf7a9e97592dd0969c5c8345e46fcc1f56a6cf202f1705470327ab9` |
| `Probe377_v2.time` | `aa59fc90e001fab3ec26d7d86442107adb141c00ebc7089b45dfa41a6e178556` |
| `RUNLOG.txt` | `e820896bb1d57516bdf0918ad0590fdc89e3b63327729d982fefe0de0a2cbd23` |
| `SOURCE_SHA256.txt` | `6ce5a24b67bbb412e8a55fe906852bce602e97ace8ffbe1ea357108fd0c25f9a` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
| `math_forward_377.py` | `c5c9bb1b420eaf8fc31b9462802db13aefbfef1cda41d38fa9c8d0d2d503818f` |
| `math_forward_377.out.txt` | `3ea47c5dcdbc89ed9cc0928ed31436b504a14bddf517b5c5b3e666654e765131` |
| `math_adversarial_377.py` | `9f196f52df12eb7986ebcedf725c9805f4d40d2635bd753251e993f44beda4a3` |
| `math_adversarial_377.out.txt` | `8c8314eee4b5a2790a4a8881507c3678edde5261cc8940eed0b38b01d1e6ef3d` |
