# Build record: OpenAI-YM-20261028

| Field | Value |
| --- | --- |
| Source | `https://github.com/yang-mills-group/OpenAI-YM-20261028` |
| Revision | `3456e5e75cf8d4cd558955a5c7638fba2d68f464` |
| Toolchain | `leanprover/lean4:v4.32.0` |
| Audit date | 11 November 2026 |
| Status | **Pinned build commands passed from a verified prebuilt artifact; no clean source rebuild was performed on this host** |

## Result

The upstream default-target command

```sh
cd Lean
lake build WilsonReference WilsonConstruction
```

exited successfully with `Build completed successfully (18126 jobs).` in 11.01
seconds. The stricter check

```sh
lake build --no-build WilsonReference WilsonConstruction
```

also exited successfully, with `All targets up-to-date (18126 jobs).`, in 8.65
seconds. Thus the restored artifact contained every required job and the ordinary
build did not hide a missing artifact by compiling it during the audit.

This is not a clean build from source on the audit host. It verifies the build
graph and artifacts restored from Scott Armstrong's
[compiled Lean release](https://github.com/scottnarmstrong/yang-mills-informalization/releases/tag/lean-build-3456e5e).
The release is for the pinned source revision and was produced on Linux x86-64;
the checks below were run after restoring it on Apple Silicon macOS. The combined
archive had SHA-256 digest
`07c145c36a45948ac55044a98d5626c201fe7ad6214d627a0739694c8e464707`,
matching its published checksum. It is retained only in the machine-local shared
cache and has not been added to Git.

The source distribution's own integrity check had previously passed:

```sh
cd Lean
shasum -a 256 -c SOURCES.sha256
```

All 9,507 listed files reported `OK`. This checks the imported files against the
distribution's manifest; it does not independently authenticate the manifest or
establish a Lean proof.

## Environment

| Component | Audited value |
| --- | --- |
| Host | `Darwin 27.3.0`, `arm64`, macOS 27.3 build `26C5035r` |
| Lean | `4.32.0`, commit `8c9756b28d64dab099da31a4c09229a9e6a2ef35`, `arm64-apple-darwin24.6.0` |
| Lake | `5.0.0-src+8c9756b` |
| `Lean/lean-toolchain` SHA-256 | `2773c517aa90b66ea8a2c52bddddf84393157797f8341be0df45294fff7fd32e` |
| `Lean/lake-manifest.json` SHA-256 | `389c72d12e69c19b8a699df76405b2b1538f8f46ae77837fd2e972dda52724c3` |

The commands used the pinned toolchain directory first on `PATH` so that
Mathlib's cache helper could find the matching `leantar` executable:

```sh
env PATH=/Users/hairer/.elan/toolchains/leanprover--lean4---v4.32.0/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin COMMAND
```

## Commands and outcomes

| Command, from `Lean/` unless noted | Result | Wall time |
| --- | --- | ---: |
| `lake exe cache get` | Pass; timed recheck found 8,639 files already decompressed and no download required | 6.59 s |
| `lake unpack /Users/hairer/.local/share/humanise-yang-mills/lean-build-3456e5e/ym-build-3456e5e.tgz` | Pass; restored `.lake/build` | 29.39 s observed by the command runner |
| `lake build --no-build WilsonReference WilsonConstruction` | Pass; all 18,126 jobs up to date | 8.65 s |
| `lake build WilsonReference WilsonConstruction` | Pass; 18,126 jobs | 11.01 s |
| `lake env lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 VerifyJoint.lean` | Pass; type match, 17 endpoint axiom checks, and kernel replay | 828.66 s |
| Temporary-overlay run of `verification/Usage.lean` | Pass; 17 roots, 250,319 project declarations | 104.49 s |
| `lake env lean ... verification/Inventory.lean`, before building aggregate root | Fail; `YM.olean` was absent from the release artifact | 2.95 s |
| `lake build YM` | Pass; built the one missing aggregate root from existing modules | 38.21 s |
| `lake env lean ... verification/Inventory.lean`, second run | Pass; 249,713 `YM` declarations, no direct placeholder or project axiom | 36.66 s |

The first `Inventory.lean` failure is retained because it describes the exact
coverage of the downloaded artifact. It was not a source or proof failure. The
aggregate `YM` root is outside the two advertised default build targets, and its
single missing object was produced without changing `Lean/` sources.

Detailed axiom evidence is in
[`evidence/axioms-3456e5e.md`](evidence/axioms-3456e5e.md), and inventory evidence
is in [`evidence/usage-3456e5e.md`](evidence/usage-3456e5e.md).

## Retained logs

Raw logs are retained locally under the ignored directory
`Lean/.lake/audit-issue2/`; they are not committed or uploaded. Their SHA-256
digests are:

| Log | SHA-256 |
| --- | --- |
| `build.log` | `c6085f53e7cadd4eb11f8949bec10ee384424ac518e64f7f063765045c89b2a2` |
| `build-no-build.log` | `562414ed78e43790e7fee87cd015293a99222e907a57afa174e7c49682d7e94e` |
| `cache-get.log` | `e93e7ac5d9e5461738d848ea7ecf25031fef776b47e22727e5836ac8580cd7d6` |
| `verify-joint.log` | `f565c053c1ed5264923a7865d6e536c9108e0c749bd074c63124d6da4444166d` |
| `usage.log` | `953211dba5d17997e158eb4cd73357ea3fb0bbc9d0a6a0f6915e556d5d468657` |
| `inventory.log` (expected preliminary failure) | `df8484e67012a885409fc2b2a1ceee1a0d41fa5ee0cf730671639c76a17cf873` |
| `build-ym-root.log` | `65cb5f2f92baf6deb208fd73d3e721621b434401d13d3e87441d4d97bb1b9e23` |
| `inventory-success.log` | `03d413ca89eb91bd7bb023b404ff4117a47e7095b6be35ae10575087aa019ed8` |

The linked release and its recorded checksum identify the retained build artifact.
A reviewer can reproduce the compact evidence files from it without obtaining
these local logs.

## Limitations

- The successful commands do not independently establish the intended physical
  interpretation or adequacy of any theorem statement.
- This run trusts the pinned Lean executable, kernel implementation, and pinned
  external package artifacts. The project replay checks proof terms against that
  kernel; it is not a diverse implementation check.
- The audit used a third-party prebuilt project artifact rather than deleting all
  objects and recompiling every source file on this host. The `--no-build` pass
  establishes artifact completeness relative to Lake's recorded build traces.
- Existing linter and axiom-information messages were replayed during the build.
  They did not cause failure. The deliberate reference placeholder in
  `Challenge.lean` is accounted for in the axiom evidence.
