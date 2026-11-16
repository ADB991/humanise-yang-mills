# Validation record

Session `stalex444-claude-373rev-20261114`, 2026-11-14. All repository reads were made through git at `codex/existence-monograph` `0f00ae72f910506d5968174225392531de5a4c8b` (`git show 0f00ae72:<path>`, `git grep -n <pattern> 0f00ae72 -- <dir>`), without checking out or modifying the clone. The Lean release was read at `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Commands actually run

| Check | Result |
| --- | --- |
| `git diff --stat a8c24495 0f00ae72 -- <note> <parent> <author README>` | Empty: the three target files are byte-identical at the merge of #373 and at `0f00ae72`. |
| Issue and PR state: four unauthenticated read-only GitHub API requests at 09:48 UTC (comments of #372, repository comments since 08:28 UTC, branch head, last 30 PRs) | `codex/existence-monograph` head `0f00ae72`; #373 merged as `a8c24495`; no claim for a review of the #373 note on #372. Rechecked at 11:37 UTC on 2026-11-14, after the claim: head still `0f00ae72`; #372 carries this claim and no other claim on a review of #373; the three target hashes are unchanged. |
| `python3 -I evidence/make_hashes.py <repo> 0f00ae72 stalex444-claude-373rev-20261114 "#373 merged at a8c24495" <path:category …>` | Produced the `files` list of `hashes.json` (3 target, 5 interface, 24 source). The script asserts that each source hash equals `Lean/SOURCES.sha256` at the same commit; all 24 passed. The script was tested beforehand with `--check` on the hashes.json of `hairer-claude-356rev-20261114` (at `08b0b6bd`) and `hairer-claude-c15-local-20261114` (at `dcbdcc82`): all entries matched. |
| SHA-256 of the 24 source files in the release checkout at `3456e5e7`, compared with `hashes.json` | 24 of 24 equal. |
| Target hashes compared with the values recorded at 09:48 UTC | `trace-rounded-receipt.tex` `44dd8b53…`, `trace-rounded-comparison.tex` `84a5aa4d…`, author README `65f68f6b…`: unchanged. |
| `python3 -I evidence/math_checks_372.py` | Exit 0. Supply identities true; cost and width thresholds pass 10,000 random cases each; log₁₀ of the cost-condition threshold on μ for i = 0…4: 0, 14.45, 30.54, 48.16, 67.10 (at i = 0 the width condition μ ≥ 28.28 binds). Output: `evidence/math_checks_372.out.txt`. |
| `python3 -I evidence/math_lane_forward_checks.py` | Exit 0. Cost threshold, supply identities, width extremal case (8·100 = 800), Φ_{01} identity, proposition threshold, and β b(g) identity all true. Output: `evidence/math_lane_forward_checks.out.txt`. |
| `python3 -I evidence/math_lens_checks.py` | Exit 0. Width extremal case a_ℓ/8; cost equality case ε; Φ_{01} difference 0; μ thresholds 28.28 (i = 0), 2.81·10¹⁴ (i = 1), 3.43·10³⁰, 1.46·10⁴⁸, 1.26·10⁶⁷. Output: `evidence/math_lens_checks.out.txt`. |
| `python3 -I evidence/obj_ticket_check.py` | Exit 0. Under the rank-root conditions, max LHS − T_M = −2.28 over 108,489 admissible draws (of 200,000 generated); harmonic condition dropped: +200.05; r = 5 test point: −11.0 (not a test of dropping δ ≤ 1; with δ = 20 and all other conditions met, LHS − T_M = +20.5 at the parameters of mathematics.md M4 (A = 1, β = 4, β̂ = 1, θ_R = θ_clock = 0.5, q = 10⁹, X = 1+M, Λ = 0), computed by hand from the script's formulas). Output: `evidence/obj_ticket_check.out.txt`. |
| `python3 -I evidence/unit_fingerprint_from_git.py <repo> <commit> YM-000026` at `0f00ae72` and `a8c24495` | A re-implementation from git blobs of the fingerprint function of `scripts/check_blueprint.py` (the checker itself was not run): `af19fa51…883c66` at `0f00ae72`, `7c796eff…43d3a1` at `a8c24495` (the difference comes from #377, which does not touch the reviewed files). At both commits neither reviewed file is in the unit's manuscript list. Output: `evidence/unit_fingerprint.out.txt`. |
| Lean probes v1–v5 (below) | Exit 0 for v1, v3, v4, v5; exit 1 for v2 (fixed in v3–v4). |

Python 3.10.18 was used for the scripts (sympy 1.14.0, mpmath 1.3.0).

### Lean probes

Command for every run, one Lean process at a time (checked with `pgrep -x lean` / `pgrep -x lake` before each run), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` (SHA-256 `07c145c3…`, equal to `source/build.md` l.37) and the dependency `.olean` files from a local Lake package cache on `LEAN_PATH` (in order: the archive's `lib/lean`, then `.lake/build/lib/lean` of LeanSearchClient, Qq, aesop, batteries, importGraph, mathlib (`81a5d257`), plausible and proofwidgets, at the revisions of the release's `lake-manifest.json`, SHA-256 `389c72d1…`; the release sources were read and hashed, not placed on `LEAN_PATH`):

```
LEAN_PATH=<release build and dependencies> /usr/bin/time -l <toolchain leanprover/lean4:v4.32.0>/bin/lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>.lean > <file>.out
```

No `lake`, no `leanchecker`, no build, no download. Free disk before the runs: 12 GiB.

| Run | Exit | Time | Peak RSS | Result |
| --- | --- | --- | --- | --- |
| v1 | 0 | 47.2 s | 6.84 GB | 0 errors; signatures and axioms printed; the three `rfl` unfoldings (budget, trays, costHint) pass |
| v2 | 1 | 6.5 s | 6.89 GB | sections A–C ran; D failed (a `run_cmd` argument split across lines); E had a tactic error (`sorryAx`) |
| v3 | 0 | 3.2 s | 6.89 GB | fixes applied; `value?` returned none for theorems |
| v4 | 0 | 3.2 s | 6.89 GB | all sections ran; E without `sorryAx` |
| v5 | 0 | 3.2 s | 6.90 GB | v4 plus a type-equality check of the probe copies against `open_readSky` |

The later runs were fast because the imports were already in the file cache. The full log is `evidence/RUNLOG.txt`; the `/usr/bin/time` outputs are `evidence/Probe372_v*.time`.

The header comment of `Probe372_v1.lean` ("NOT RUN by its author", an intended invocation) predates the runs and is superseded by this table; line 1 of `RUNLOG.txt` describes the state at the time of the runs.

## Not run

- **Manuscript build.** No LaTeX build was run and no rendered page was inspected; this is a report-only review and no manuscript file is changed. The author's `latexmk` result was read but is not adopted as evidence here.
- **Structural checks.** `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` were not run. They check the working tree that contains this record, which exists only in the fork worktree from which the report PR is opened; they were not run when this record was written; their results on the commit that adds this directory are reported in the PR body. No exported copy of the repository was made for them.
- **Lean.** No kernel replay of any proof (`leanchecker`), no build from source, no Mathlib rebuild; the extracted files were not re-verified against the archive and the dependency `.olean` files were not independently verified (lean-correspondence.md, N9–N10).
- **Producers.** No audit of the producers of (A) and (B) or of the clock conditions (mathematics.md, N1, N5, N6).

No manuscript, author record, `unit.json`, other review record or `Lean/` file was edited. The record was prepared before the claim on #372 was posted; #372 was rechecked and the targets re-hashed after the claim, before this PR.

## Records finding (not a mathematics or Lean finding)

Neither `manuscript/existence/trace-rounded-receipt.tex` nor `manuscript/existence/trace-rounded-comparison.tex` is in the `manuscript` list of `blueprint/units/YM-000026/unit.json` at `0f00ae72` or at `a8c24495`. The unit fingerprint (`python3 scripts/check_blueprint.py --fingerprint YM-000026`) hashes only the listed files, so it does not cover the two reviewed files; the per-file SHA-256 values in `hashes.json` are the operative fingerprint of this review. Adding both files to the list is a coordinator decision. The parent's file hash changed with #373 (`84a5aa4d…` now); the target hash `69c54766…` recorded for it by `hairer-claude-356rev-20261114` describes the file before #373.

## Evidence files (SHA-256)

Plain-text files in `evidence/`; they contain no manuscript text.

| File | SHA-256 |
| --- | --- |
| `Probe372_v1.lean` | `52910f3bd8bec2414a33a7fa4b53de7facbee04e8865b76956c204f7904793d0` |
| `Probe372_v1.out` | `79cffb6d5ff945882dc4893a7692a5c1a64612dbff8c7815cebc064c13987a9b` |
| `Probe372_v1.time` | `685016b2371819cc7adc9bb94feb96ab29ab4623b3b5fdc737543ef8d873cbdc` |
| `Probe372_v2.lean` | `a1f8e3c75618da90291811e1565440ddab839e3d28c2775f64716802215c60a3` |
| `Probe372_v2.out` | `455b3c82b9efe5dfd355024aba6e100740caefe0ca767e29d36087cf4dafef44` |
| `Probe372_v2.time` | `ec5bb2b19cbbdbd955009d0e35c7c38406cc40fa414320fda1232bb15e03c998` |
| `Probe372_v3.lean` | `5ad71a260cbd69bf01c9e33f2f6f6aca50316c2b117efdf0cb4be4f177d8eee7` |
| `Probe372_v3.out` | `bf5c0aa78b49e19b79bc1fd260f5bddc7920d664bc93ad52ed068ecd7495d21d` |
| `Probe372_v3.time` | `3b09636a47d53b7d0627ec496c954b8eacee9bb1956e6bf578ccc0ac6049e869` |
| `Probe372_v4.lean` | `762583d0cbb1ea726246342fdeb4b6fe9b6fb64aa2bc75dae64f90e31007f06b` |
| `Probe372_v4.out` | `7d80d5fa8ffdbd46110269d8ef906573cf20970951b956f10b5c243ca3c7fb90` |
| `Probe372_v4.time` | `89db6c96c2cd2df40db6243bcd8f8af50cf5f58b27dc9334edfcba3bc5d2eac3` |
| `Probe372_v5.lean` | `307604d85bf5e987de380df87da47e6e76d24af54996e19417e8a262c4b6cf09` |
| `Probe372_v5.out` | `6050773961f69577ee7aca3a3d4bfe8f94c80d106f53cff8d73756a33f32ba29` |
| `Probe372_v5.time` | `5b331f69f82189812374bf3120ad60a97181b0a911a3487ea5953c56b2e8323e` |
| `RUNLOG.txt` | `c1b598a47929eee54dca87b7dc51649419d07a6c8241ce5b8f1a6b44bd4111cf` |
| `make_hashes.py` | `fa5f92efa1d80229896433cec388fbb105177db332b220ce14eb9b3153129684` |
| `math_checks_372.py` | `1319e099657bdb0a7a704a5510ffb60e622248aed4aafc8d7e8a38c32f53d2a4` |
| `math_checks_372.out.txt` | `086092518deb48c3ac0c74f668b899156ad02998f8732eb42caaba261bee9669` |
| `math_lane_forward_checks.py` | `1fbdb8ec54358723f8e5835931c2e12e0eb339cec4a94f1b6ba282afe0ec14c4` |
| `math_lane_forward_checks.out.txt` | `9e0da982e2d933b706a89267794af667f7f105da7f89be2c658f75d42772ff18` |
| `math_lens_checks.py` | `bc8babcdc9cc0d02bce3354090d53cc8849adf02603d99e40e564a1cc90ceff7` |
| `math_lens_checks.out.txt` | `4c34a72104ee111b6a07acc483a1d4a8b1dfa7f968fe7052cf57a0785016748b` |
| `obj_ticket_check.py` | `fdbd3cef26118bdc60c27e4c6bd0f10069d86d6c181e4739e14b6e84d5dc89ae` |
| `obj_ticket_check.out.txt` | `d956d87b88a74dc82052258c8a7d73e408bac400d2062c1872ead6173796cb3d` |
| `unit_fingerprint_from_git.py` | `98188d05cdf783c51d0299fe764a5d2a5b9a33d529e42f9b67890bea61bc121d` |
| `unit_fingerprint.out.txt` | `541eace53eabfa3521004335114de33521df916e238213b146fe5fcc8cceb313` |
