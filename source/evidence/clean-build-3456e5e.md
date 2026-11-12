# Clean from-source rebuild of `3456e5e` on an independent Linux host

- Audit task: [issue #37](https://github.com/hairer/humanise-yang-mills/issues/37), follow-up to [issue #2](https://github.com/hairer/humanise-yang-mills/issues/2).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read from this repository's `Lean/` at commit `5535cc1579029c69155b0d0a89c13b819bf0f5f1`.
- Contributor and agent assistance: schmittj; run and written up with Claude, session `schmittj-claude-build-20261112`.
- Date: 12 November 2026. Status: author evidence, not independently reviewed.

## Result

Every project module was compiled from source on the audit host, starting from an empty project build directory and without the prebuilt project artifact. All commands exited with status 0:

- `lake build WilsonReference WilsonConstruction`: `Build completed successfully (18126 jobs).`
- `lake build --no-build WilsonReference WilsonConstruction`: `All targets up-to-date (18126 jobs).`
- `lake build YM`: `Build completed successfully (18112 jobs).`
- `VerifyJoint.lean`: `TYPE_MATCH YangMills.jointExistence`, 17 `ENDPOINT_AXIOMS` lines each listing exactly `[propext, Classical.choice, Quot.sound]`, and `REPLAY_PASS project=100168 external=14364 endpoints=17 duplicateAliases=0`.
- `verification/CompactCheck.lean`: `COMPACT_ESTIMATE` for `YangMills.CompactCheck.compactCoefficient` and `compactRemainder`, both `[propext, Classical.choice, Quot.sound]`.
- `verification/Inventory.lean`: `INVENTORY_PASS`, `DECLARATION_SCAN declarations=249713 directSorryAx=0 projectAxioms=0`.
- `verification/Usage.lean`: `USAGE_PASS headlines=17 project=250319 used=100168 outside=150151 modules=9469 modulesWithNoUsedDeclaration=2946`.

These agree with the values recorded under #2 in `source/build.md`, [`axioms-3456e5e.md`](axioms-3456e5e.md) and [`usage-3456e5e.md`](usage-3456e5e.md): the same job count, the same replay counts, the same 17 endpoints with the same three axioms, the same declaration and usage counts. The regenerated inventories have the same SHA-256 digests as the ones regenerated under #2 (`declaration-usage.tsv` `9dc9a62a…be4d2a`, `module-usage.tsv` `f9db49e0…c265dc`), so the three `source_line` differences from the checked-in `declaration-usage.tsv` reported there are reproduced; columns 1–5 of the regenerated and checked-in files are identical (`diff` of `cut -f1-5`: no output).

The build log contains no failed job (`✖`: 0 occurrences) and one `sorry` warning, `Challenge.lean:5:8: declaration uses 'sorry'`, the deliberate reference placeholder already accounted for in `axioms-3456e5e.md`.

## What was and was not compiled here

- **Compiled on this host from source:** all modules of the project libraries `YM`, `WilsonPublic`, `WilsonReference`, `WilsonConstruction`. Before the build, `Lean/.lake/build` did not exist (`ls: cannot access '.lake/build'`), and the working tree had no local change (`git status --porcelain`: 0 lines before and after).
- **Taken from external caches, not recompiled:** Mathlib at `81a5d257c8e410db227a6665ed08f64fea08e997` and the other pinned packages, fetched by `lake exe cache get` (final line `Already decompressed 8639 file(s)`) after Lake cloned the repositories named in `lake-manifest.json`. The 18,126 jobs include these.
- **Lean toolchain:** the official `leanprover/lean4:v4.32.0` binary installed by elan, `Lean (version 4.32.0, x86_64-unknown-linux-gnu, commit 8c9756b28d64dab099da31a4c09229a9e6a2ef35, Release)`, `Lake version 5.0.0-src+8c9756b`. Same commit as in #2, different platform.

So this closes the limitation in `source/build.md` that no host had recompiled every project source file. It does not remove trust in the pinned Lean binary, its kernel, or the pinned external package artifacts, and it says nothing about the adequacy of any theorem statement.

## Source integrity observation

`sha256sum -c SOURCES.sha256` in a fresh clone reports **9,497 files `OK` and 10 files absent**; it exits with status 1 for that reason alone. The absent files are the ten `verification/*.log` files listed in the manifest: `archive-graph.log`, `attributions.log`, `build.log`, `compact-check.log`, `joint-check.log`, `kernel.log`, `negative-controls.log`, `source-match.log`, `su2-check.log`, `usage.log`. They are not tracked in this repository (`git ls-files Lean` has 9,498 entries including the manifest; the manifest has 9,507 lines). No `.lean` file, toolchain file or manifest is affected. The statement in `source/build.md` that all 9,507 listed files reported `OK` therefore describes the original archive, not the Git import; `Lean/README.md` links to several of the missing logs. Whether to add them to the import is left to the maintainer.

The digests of `lean-toolchain` (`2773c517…fd32e`) and `lake-manifest.json` (`389c72d1…724c3`) equal those in `source/build.md`.

## Comparison with the published prebuilt artifact

The artifact used under #2, Scott Armstrong's [compiled Lean release](https://github.com/scottnarmstrong/yang-mills-informalization/releases/tag/lean-build-3456e5e), was downloaded to the same host and unpacked to a separate directory; it was not used for the build. Both parts matched `SHA256SUMS`, and the concatenated archive has digest `07c145c36a45948ac55044a98d5626c201fe7ad6214d627a0739694c8e464707`, as recorded in `source/build.md`. Every file of the artifact (66,290) has a counterpart in the fresh build directory. Byte comparison by SHA-256:

| File kind | Common | Identical | Different |
| --- | ---: | ---: | ---: |
| generated C (`ir/**/*.c`) | 9,470 | 9,470 | 0 |
| `.ilean` | 9,470 | 9,470 | 0 |
| `.olean` | 9,470 | 8,426 | 1,044 |
| `.hash` side files | 28,410 | 27,366 | 1,044 |
| `.trace` | 9,470 | 0 | 9,470 |

Present only in the fresh build: the files of the aggregate root `YM` (absent from the artifact, as #2 found) and 9,471 `.json` files written by Lake.

The 1,044 differing `.olean` files are in every case **larger in the fresh build, by 8 bytes or by 16 bytes** (minimum 8, median 16, maximum 16); their `.hash` side files differ accordingly. They are concentrated in `YM/TraceExtension` (249), `YM/FullVolume` (219), `YM/UVExtension` (126), `YM/OPE` (94), `YM/MergeProof` (78), `YM/MultipleContact` (67), `YM/Pert` (63). For one sample, `YM/Contacts/Solstice/JetLocal.olean` (1,160,784 bytes in the artifact), `cmp -l` reports 5,364 differing byte positions before the end of the shorter file, one in the header region and the rest near the end of the file.

**Cause (determined in a follow-up on 12 November 2026).** The 1,044 modules are those whose `.olean` stores linter messages (environment extension `lintLogExt`, for example `unusedVariables` warnings); each stored message carries the absolute path of the source file. The artifact was built under `/home/scott/OpenAI-YM-20261028/`, the fresh build under `/scratch/userdata/schmittj/ym-build/repo/Lean/`, which is 15 characters longer; with 8-byte alignment this lengthens the file by 8 or 16 bytes and shifts the object addresses that follow, which accounts for the scattered differing bytes. Three checks support this:

1. For all 1,044 files, the printable strings of the two versions (`strings -n 12`, sorted) coincide once each root path is replaced by a common token. With `strings -n 6` this holds for 1,017 files; in the other 27 the differences are short byte runs that are shifted addresses, not text.
2. None of the 8,426 byte-identical `.olean` files of the artifact contains the string `/home/scott/`.
3. Decisive test: the sources were copied to `/scratch/userdata/schmittj/ymb/`, a root path of the same length (30 characters) as the artifact's, and each of the 1,044 modules was recompiled there with exactly the command Lake had recorded for it in its `.trace` file (same `--setup` file and imports from the fresh build), writing to a temporary file. In **all 1,044 cases** the result equals the artifact's `.olean` after replacing the byte string `/home/scott/OpenAI-YM-20261028/` by `/scratch/userdata/schmittj/ymb/` in the artifact file, and has the same length. For the sample module `YM/FullVolume/Umbra/Ambience`, the two files differ in exactly 29 bytes, all inside the path string.

So every `.olean` of the artifact is, up to the embedded source root in stored linter messages, byte-for-byte what this source produces with this toolchain on the audit host. The recompilation in check 3 used the imports of the fresh build, which are themselves identical to the artifact's up to the same substitution. Scripts and logs are retained on the host: `repath.py` (`9763933a…b131fe`), `repath.log` (`b34d6def…dfee50`, final line `REPATH_DONE total=1044 equal_after_path_substitution=1044 other=0`), `pathcheck.log` (`a1571df1…d2a338`). `.trace` files record host-specific build traces and are expected to differ.

## Environment

| Component | Value |
| --- | --- |
| Host | Linux `7.2.8-200.fc44.x86_64`, Fedora Linux 44, x86-64, 72 cores (Intel Xeon Gold 6254), 503 GB RAM; shared machine with other users' jobs running |
| Lean / Lake | 4.32.0, commit `8c9756b28d64dab099da31a4c09229a9e6a2ef35` / `5.0.0-src+8c9756b` |
| Settings | `LEAN_NUM_THREADS=36`, build commands run under `nice -n 10`; `ELAN_HOME`, `XDG_CACHE_HOME`, `MATHLIB_CACHE_DIR` and `TMPDIR` pointed at a scratch directory |
| Repository | `git clone https://github.com/hairer/humanise-yang-mills.git`, checked out at `5535cc1579029c69155b0d0a89c13b819bf0f5f1`; `Lean/` last changed in `9865613` |

## Commands and outcomes

All from `Lean/` of the fresh clone, with the pinned toolchain first on `PATH`. Each command was wrapped in `/usr/bin/time -v`.

| Command | Result | Wall time | Peak RSS of one process |
| --- | --- | ---: | ---: |
| `sha256sum -c SOURCES.sha256` | 9,497 `OK`, 10 absent (see above) | — | — |
| `lake exe cache get` | Pass | 1 min 36 s | — |
| `lake build WilsonReference WilsonConstruction` | Pass, 18,126 jobs | 3 h 16 min 48 s (143,307 s user CPU) | 13.7 GB |
| `lake build --no-build WilsonReference WilsonConstruction` | Pass, all up to date | 9 s | — |
| `lake build YM` | Pass, 18,112 jobs | 16 s | 12.7 GB |
| `lake env lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 VerifyJoint.lean` | Pass, see Result | 22 min 22 s | 29.6 GB |
| `lake env lean -j1 verification/CompactCheck.lean` | Pass | 7 s | 7.1 GB |
| `lake env lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 verification/Inventory.lean` | Pass | 47 s | 13.7 GB |
| `Usage.lean` in a temporary overlay containing only `verification/joint-headlines.txt`, as under #2: `lake env sh -c 'cd OVERLAY && lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 LEAN/verification/Usage.lean'` | Pass | 47 s | 13.5 GB |

The long wall time of the main build reflects the shared host and the thread limit; it is not a property of the project. The order differs from #2 in one respect: `lake build YM` was run before `Inventory.lean`, so the preliminary failure recorded there (missing `YM.olean`) does not occur.

## Retained logs

Raw logs are kept on the audit host and are not committed. SHA-256 digests:

| Log | SHA-256 |
| --- | --- |
| `build.log` | `b794ad3af6d2841e173601cdbd2fa6d892a605bc99ab99661be3f618e59d1fb9` |
| `build-nobuild.log` | `498295121071b8622c1b05d4046e2e5507178d2d1f900b205d616db8330164f0` |
| `build-ym.log` | `ae45ce68349259436d1b9592fde1aa020823c06c40f6866c0cee586ada580227` |
| `cache-get.log` | `be893da9a4295dc530eb8b426b1f5b49206d80f6a3c18f0ef4c2f8caa9d77d08` |
| `sources.log` | `267635c96da05a670352fef03ed4db54024db15d121dbebfe777c1c31b560d7d` |
| `toolchain.log` | `44e4d5ceab76db792d1818bf00fee45e094106615b483add8cd32bf69286c27d` |
| `verify-joint.log` | `2410c8c1eefb052519dd5d281ec7f452a4dfb78e6a3eb6e543277f9345aed26b` |
| `compact-check.log` | `1e17482cb51be4beeffee22a3bb08bca9b5845b56f0e4f0c7d55ca640dc72e36` |
| `inventory.log` | `05707f033cd2bd57eae998b84bd39e2dbd62632ca407e7ea6724e60b140feacc` |
| `usage.log` | `f30a24774b78df2565113ce0350de6bfd9c5ef4a8d12479d57e25de8e4e1b29e` |
| artifact file hashes (`cmp_artifact.sha`) | `e6a8db82965ade3682bc6e039c482b146a22e7631d39fee8d5174ea6f49f2bcf` |
| fresh build file hashes (`cmp_ours.sha`) | `d7ee18cad9535f5634e8e344f5fade009d6e49677ed7ec38e939c39c41ef6b64` |

The digests of `verify-joint.log`, `usage.log` and the build logs differ from those under #2 because the logs contain host paths and timings; the result lines quoted above are the comparable content. The logs and the two hash lists can be supplied on request.

## Checks not performed

- Mathlib and the other external packages were not recompiled from source.
- The standalone Comparator executable was not run with `Lean/comparator.json` (upstream's README records the same). Unrun.
- No independent kernel or checker other than the pinned Lean kernel was used.
- The upstream `verification/negative-controls` were not re-run.
