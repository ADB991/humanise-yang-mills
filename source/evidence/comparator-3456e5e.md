# Standalone Comparator run on `3456e5e`

- Audit task: [issue #37](https://github.com/hairer/humanise-yang-mills/issues/37), follow-up to [issue #2](https://github.com/hairer/humanise-yang-mills/issues/2).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read from this repository's `Lean/` at commit `5535cc1579029c69155b0d0a89c13b819bf0f5f1`.
- Contributor and agent assistance: schmittj; run and written up with Claude, session `schmittj-claude-comparator-20261112`.
- Date: 12 November 2026. Status: author evidence, not independently reviewed.

## Result

**PASS, with three qualifications that must be read with it.** The standalone [Comparator](https://github.com/leanprover/comparator) executable, sandboxed with `landrun` (Landlock) and using `lean4export` built for Lean 4.32.0, was run on a byte copy of the clean build of [`clean-build-3456e5e.md`](clean-build-3456e5e.md) for the theorem `YangMills.jointExistence`, challenge module `Challenge`, solution module `Solution`, permitted axioms `propext`, `Quot.sound`, `Classical.choice`. It exited with status 0 after 34 min 19 s. Decisive output lines (run 3 below):

```
Building Challenge
⚠ [8658/8658] Replayed Challenge
warning: Challenge.lean:5:8: declaration uses `sorry`
Build completed successfully (8658 jobs).
Exporting #[YangMills.jointExistence, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.mul, Nat.pow, Nat.gcd, Nat.div, Nat.mod, Nat.beq, Nat.ble, Nat.land, Nat.lor, Nat.xor, Nat.shiftLeft, Nat.shiftRight, String.ofList] from Challenge
Building Solution
[…]
Build completed successfully (18121 jobs).
Exporting #[YangMills.jointExistence, propext, Quot.sound, Classical.choice, Nat.add, …, String.ofList] from Solution
Running Lean default kernel on solution.
Lean default kernel accepts the solution
Your solution is okay!
real	34m19.043s
Finished with result: success
Main processes terminated with: code=exited, status=0/SUCCESS
Memory peak: 17.1G (swap: 0B)
EXIT_CODE=0
```

The three qualifications:

1. **The project's `comparator.json` was not accepted as shipped.** Comparator at its `v4.32.0` tag requires the field `enable_nanoda`; with the shipped file it stops at once with `uncaught exception: Comparator.Config.enable_nanoda: Bool expected` (run 1, exit status 1). The passing run used a copy of the file with the single added line `"enable_nanoda": false`; the four shipped fields are unchanged. (Later Comparator versions make the field optional, so the shipped file is valid for them; they need a newer Lean.)
2. **Comparator was built from its `v4.32.0` tag plus one upstream one-line fix.** Unmodified `v4.32.0` does not work with the current `main` of `landrun` (which the Comparator README requires): `landrun` now consumes the `--` that separates module names from constant names in the `lean4export` command line, and the export step fails with `unknown module prefix 'YangMills'` (run 2, exit status 1). Upstream fixed this on 30 July 2026 in commit `9badaf470d8f724346d33738bd273efacd78df76` ("Insert '--' terminator before the sandboxed command in buildLandrunArgs"), after the `v4.32.0` tag. That commit was applied to `v4.32.0` (the diff is one line of `Main.lean`, quoted under Method); nothing else was changed.
3. **The solution was not compiled inside the sandbox in this run; it was prebuilt.** Comparator's sandboxed `lake build Challenge` and `lake build Solution` found every module up to date and replayed the existing build (the log has 1,259 `Replayed` lines and no `Built` line). The `.olean` files are those of the clean build, which compiled `Solution` and everything else outside any sandbox. The Comparator README covers this case ("if you have obtained a fully pre-built `.lake` directory through other means and without compromising your checking environment, `Solution.lean` will not be rebuilt"), but its assumption 2 ("You have not previously tried to compile the `Solution` file or any other potentially adversarial files") does not hold literally. So the run establishes Comparator's three guarantees for the compiled files of the clean build, relying on that build not having tampered with the challenge-side files, rather than on the sandbox. A supplementary check bounds this: the four project modules on the challenge side were recompiled from source in a second copy that never contained any project build output, and are byte-identical (see below).

Two smaller points: the optional external kernel (nanoda) was not used, so only the Lean 4.32.0 kernel linked into Comparator replayed the proof; and the `systemd-run` wrapper recommended by the README was used with `--wait --pipe` in place of `--pty` (no terminal in a detached run), with `RestrictAddressFamilies=~AF_UNIX` as documented.

The evidence tree was not modified: the SHA-256 digests of a sample of 200 `.olean` files in `/userdata/schmittj/ym-build/repo/Lean/.lake/build`, taken before any work and again after the last run, are identical; no file under its `.lake` is newer than the first digest list; `git status --porcelain` in the clone is empty.

## Method

Host as in `clean-build-3456e5e.md`: Linux `7.2.8-200.fc44.x86_64`, Fedora 44, x86-64, shared 72-core machine. Landlock is active (`/sys/kernel/security/lsm`: `lockdown,capability,yama,selinux,bpf,landlock,ipe,ima,evm`); `landrun --log-level debug` reports `Applying Landlock restrictions: {Landlock V10; FS: all; Net: all; Scoped: all (best effort)}` and `Landlock restrictions applied successfully`, and a write outside the allowed directory from inside the sandbox failed with `Permission denied`. No unsandboxed or fake-landrun mode was used.

| Tool | Version, commit, how obtained | SHA-256 of binary |
| --- | --- | --- |
| Lean / Lake | `leanprover/lean4:v4.32.0`, commit `8c9756b28d64dab099da31a4c09229a9e6a2ef35`, official elan toolchain; `Lake version 5.0.0-src+8c9756b` | — |
| Comparator | `github.com/leanprover/comparator`, tag `v4.32.0` = `07bc4ea40f2266dcb861820a2ec1fa3244ed307f` (its `lean-toolchain` is `v4.32.0`), plus cherry-pick without commit of `9badaf470d8f724346d33738bd273efacd78df76`; built with `lake build lean4export comparator`. Repository `master` at the time: `865edc14486c3388e9225daa971da8e157488c3e` (Lean 4.35.0, deprecated in favour of `lake comparator`), not usable with Lean 4.32.0 | `32f09b96…906bec` (unpatched build: `4ffd95f2…93be42`) |
| lean4export | `github.com/leanprover/lean4export`, tag `v4.32.0` = `4e7915201d3f9f04470d9eae002fa695f7cdc589` (the revision pinned in Comparator's manifest at `v4.32.0`), built from source with `lake build` under Lean 4.32.0. The copy Lake fetched for Comparator as a prebuilt Reservoir archive has the same digest | `e5736998…7266b0` |
| landrun | `github.com/Zouuup/landrun`, `main` = `ec104f6edc1e14d7fec6d31146f1ec6f9c192c5a`, reports `landrun version 0.1.18`; `go build ./cmd/landrun` | `89964580…dd11c8` |
| Go | 1.27.4 `linux-amd64`, official tarball, digest `7226736c2339719cda28fbf3a54d71aa63bcefe376e98cef00034268dab24840` equal to the one published on go.dev | — |

The patch to Comparator, complete:

```diff
--- a/Main.lean
+++ b/Main.lean
@@ -85,7 +85,7 @@ def buildLandrunArgs (spawnArgs : LandrunArgs) : Array String :=
-  args ++ #[spawnArgs.cmd] ++ spawnArgs.args
+  args ++ #["--", spawnArgs.cmd] ++ spawnArgs.args
```

Project copy. The evidence tree `/userdata/schmittj/ym-build/repo/Lean` (clean build, repository commit `5535cc1`) was copied with `cp -a` (a real copy, 48 GB, no hard links) to `/userdata/schmittj/ym-build/comparator/proj`. In the copy, with the pinned toolchain first on `PATH`, `lake build --no-build Challenge Solution WilsonReference WilsonConstruction` reported `All targets up-to-date (18126 jobs).`, so Lake's traces are valid at the new path and nothing was recompiled. After the runs, the only files under `proj/.lake` newer than the copy are the nine `packages/*/.git/index` files (refreshed by Lake's `git` status calls); the 200-file sample has the same digests in the copy as in the evidence tree.

What Comparator does, as read from its README and `Main.lean`, `Comparator/Compare.lean`, `Comparator/Axioms.lean` at the commit used: (1) `lake build Challenge` under `landrun --best-effort --ro / --rw /dev -ldd -add-exec --env PATH --env HOME --env LEAN_ABORT_ON_PANIC --ro <project> --rwx <project>/.lake --rox <lean prefix> --rox <git>`; (2) `lean4export Challenge -- <names>` under `landrun` with no writable path except `/dev`; (3) the same two steps for `Solution`; (4) both exports are parsed as text (Comparator does not load `.olean` files itself); the theorem must be a theorem (or axiom) in both with equal name, universe parameters and type, and every constant reachable from the statement, from the permitted axioms and from the kernel's built-in `Nat`/`String` primitives must be equal in the two environments, bodies included; (5) every constant reachable from the solution theorem, through types and bodies, that is an axiom must be in `permitted_axioms`; (6) the whole exported solution environment is replayed in the Lean kernel inside the Comparator process.

Treatment of the `sorry` in `Challenge.lean`: the README says the challenge "contains at least a theorem named `todo1` that has a `sorry` (or any other proof)". In the code, step (4) compares only the `ConstantVal` of the target theorem (name, universe parameters, type), not its proof, and the axiom check and kernel replay are applied to the solution export only. The challenge's placeholder is therefore expected and ignored; a `sorry` in the solution would appear as the axiom `sorryAx` and be rejected by step (5).

## Commands and outcomes

All on the audit host, files only under `/userdata/schmittj/ym-build/comparator/`, long commands detached. Environment for runs 1 to 3: `PATH=<toolchain v4.32.0>/bin:/usr/local/bin:/usr/bin`, `COMPARATOR_LANDRUN` and `COMPARATOR_LEAN4EXPORT` set to the binaries above, `LEAN_NUM_THREADS=24`, working directory `proj`. Exact invocation (scripts `run1.sh`, `run3.sh`):

```sh
systemd-run --user --wait --pipe --collect --nice=10 --property=RestrictAddressFamilies=~AF_UNIX -E PATH=… -E ELAN_HOME=… -E TMPDIR=… -E LEAN_NUM_THREADS=24 -E COMPARATOR_LANDRUN=…/bin/landrun -E COMPARATOR_LEAN4EXPORT=…/tools/lean4export/.lake/build/bin/lean4export --working-directory …/proj -- bash -c "time lake env <comparator binary> <config>"
```

| Step | Command | Outcome |
| --- | --- | --- |
| Sample digests before | `sha256sum` of 198 evenly spaced entries of the sorted list of 9,471 `.olean` files in `repo/Lean/.lake/build`, plus `Challenge.olean` and `Solution.olean` | list digest `ef3807bf…5d45b1ed` |
| Copy | `cp -a` of sources and `.lake` to `proj` | done in 33 s, 48 GB |
| Up-to-date check | `lake build --no-build Challenge Solution WilsonReference WilsonConstruction` in `proj` | `All targets up-to-date (18126 jobs).`, 11 s |
| Tool builds | see Method | all succeeded |
| Sandbox test | `landrun --best-effort --ro / --rw /dev --rwx proj/.lake --rox /usr /usr/bin/touch logs/SHOULD_FAIL` | `Permission denied`, status 1, file not created |
| Run 1 | unpatched Comparator `v4.32.0`, shipped `comparator.json` | **Fail**, status 1, under 1 s: `uncaught exception: Comparator.Config.enable_nanoda: Bool expected` |
| Run 2 | unpatched Comparator `v4.32.0`, config with `"enable_nanoda": false` added | **Fail**, status 1, 9 s: challenge build replayed, then `uncaught exception: unknown module prefix 'YangMills'` from `lean4export` and `uncaught exception: Child exited with 1` |
| Run 3 | patched Comparator, config with `"enable_nanoda": false` added | **Pass**, status 0, 34 min 19 s wall (33 min 49 s user), peak memory 17.1 GB; output quoted under Result. Start 16:59:56 UTC, end 17:34:15 UTC |
| Challenge-side rebuild | second copy `proj2` with sources and `.lake/packages` only (no `.lake/build`); `lake build Challenge` | `Build completed successfully (8658 jobs).`, 34 s; exactly 4 project `.olean` files produced: `PublicTheory`, `PublicWilson`, `ChallengeSpec`, `Challenge`; each has the same SHA-256 as in `proj` and in the evidence tree (`5ee682d2…`, `3f476073…`, `53dd5a26…`, `33c4a0cc…`) |
| Tool negative control | Comparator's own test project `tests/projects/simple_mismatch` (solution states a different `comm` as an axiom), same patched binary, real `landrun`, same `lean4export` | rejected as intended, status 1: `uncaught exception: Challenge and solution constant kind don't match: 'comm'` |
| Sample digests after | same 200 files in the evidence tree | identical list (`cmp`: no difference); `find repo/Lean/.lake -newer <first list>`: 0 files; `git status --porcelain`: 0 lines, `HEAD` `5535cc1579029c69155b0d0a89c13b819bf0f5f1` |

In run 3 the phases were roughly: both sandboxed Lake builds and the challenge export about 35 s, the solution export by `lean4export` about 4 min (about 12 GB resident), parsing, comparison, axiom check and kernel replay about 29 min. `LEAN_NUM_THREADS` is not passed into the sandbox by Comparator (only `PATH`, `HOME`, `LEAN_ABORT_ON_PANIC` are); this did not matter because nothing was compiled.

## What the run does and does not establish

According to Comparator's README, a successful run guarantees, under its listed assumptions, that the theorem in `Solution` named in `theorem_names` (1) proves the same statement as the one in `Challenge`, (2) uses no more axioms than those in `permitted_axioms`, and (3) is accepted by the Lean kernel. For this project: `YangMills.jointExistence` in `Solution` has the same name, universe parameters and type as in `Challenge`; every constant its statement depends on (transitively, with bodies) is the same in both environments; its proof depends on no axiom other than `propext`, `Quot.sound`, `Classical.choice`; and the exported closure was replayed by the Lean 4.32.0 kernel. This is an independent implementation of what `VerifyJoint.lean` checks for this one theorem, using a text export and a separate process instead of in-process environment loading, and it agrees with the `TYPE_MATCH`, axiom and replay results recorded in `clean-build-3456e5e.md` and `axioms-3456e5e.md`.

It does not establish:

- That the solution build was contained by the sandbox: it was prebuilt (qualification 3). The supplementary rebuild shows that the four challenge-side project modules are exactly what the sources produce, in a tree where the solution was never built, given the same package `.olean` files; it does not cover those package files.
- Anything about Mathlib and the other pinned packages beyond kernel replay of the constants actually reached: their `.olean` files come from the external cache used by the clean build and were copied, not recompiled. `lean4export` reads `.olean` files directly.
- Anything about the other 16 advertised results of `VerifyJoint.lean`, or the SU(2) specialisation: `comparator.json` lists one theorem only.
- That `comparator.json` works unchanged with the Comparator release matching the project's Lean version: it does not (qualification 1), and that release does not work unchanged with current `landrun` (qualification 2).
- Independence from the Lean kernel: no external kernel was run.
- The adequacy of the statement `YangMills.JointExistence` as mathematics. Comparator compares the solution with `Challenge.lean`; whether `ChallengeSpec.lean` says what the README claims is a separate question.
- How many declarations were replayed: Comparator prints no count.

Comparator's assumptions as met here: challenge imports and `lakefile.toml` are the repository's own (assumption 1, trusted as source under audit); assumption 2 not met literally, see above; assumptions 3 and 4, `landrun` and `lean4export` supplied by absolute path, Landlock ABI v10 applied, host kernel 7.2 (the README says the `AF_UNIX` issue guarded by `systemd-run` is fixed from Linux 7.1; the guard was applied anyway); assumption 5, kernel correctness, assumed; assumption 6, run as an unprivileged user.

A Comparator pass certifies the proof of the stated theorem, not the adequacy of the statement. What `YangMills.JointExistence` does and does not require is examined separately in `blueprint/units/YM-000026/handoff/results/G01/adequacy.md` on the branch `codex/existence-monograph`, which shows that the same statement is also satisfied with lattice insertions that do not depend on the gauge configuration.

## Checks not performed

- No run in which Comparator's sandboxed `lake build Solution` compiles the project from an empty build directory (about 3 h or more; inside the sandbox the thread limit would not apply). Unrun.
- No external kernel (`enable_nanoda`, `external_kernels`). Unrun.
- No run with `lake comparator` of Lean 4.35.0 or later, which supersedes the standalone tool; it would need the project on a newer toolchain. Unrun.
- No run with unpatched Comparator `v4.32.0` and a `landrun` commit from before 22 July 2026 (the alternative way round qualification 2). Unrun.
- No project-specific negative control (a weakened `Solution.lean`) through Comparator; only Comparator's own toy mismatch test was run. Upstream's `verification/negative-controls` were not re-run.
- The sample check of the evidence tree covers 200 of 9,471 project `.olean` files and file modification times of the whole `.lake`; a full re-hash was not done.

## Retained logs

Kept on the audit host under `/userdata/schmittj/ym-build/comparator/` (`logs/` unless noted), not committed. SHA-256 digests:

| File | SHA-256 |
| --- | --- |
| `comparator-run1.log` | `b53ed17107f854fdd37981df4d8a534b4216f8c7e3409288011d90dd2c44dba0` |
| `comparator-run2.log` | `33ce7173c0c1fa0fc39e1dbd4e703e7451e1924b35c0e62b57df7160bd12059d` |
| `comparator-run3.log` (passing run, 15,326 lines) | `f90aa53d2e26d1d96ac91ead9f9ef6518d9ea8ce250b1411e25ab636170df41c` |
| `challenge-rebuild.log` | `91baf941096c195494519675ac05ce44a696e424814472dd143719e8e6e782e6` |
| `negative-control.log` | `b52e85f23f6a11b6cd5361071cb01f3f89cb84be2c0f1c844a69d98be44e86d4` |
| `sample-list.txt` | `916b347d1ab5d59302a11aa7a4489815fb029eb02bcd22f6073cb07319cf397d` |
| `sample-before.sha256`, `sample-after.sha256` | `ef3807bfbaa9904fdfb875c450aa761111907675e47be116c3ad995a5d45b1ed` (both) |
| `comparator-patch.diff` | `b19697b1c2b5b39ffcae9041f161999b5f799a8feea24b5e126a1781b4ea99db` |
| `../comparator-with-nanoda-false.json` | `0a35f968e6f0e790cc640e6658f6b3f4437e3bf54bca0da8ea1de719434452d0` |
| `../proj/comparator.json` (as shipped, equal to the evidence tree's) | `23e159f10cdb40b780ad8b42a2fc62d2f8e995ee932d955c97e54526d476b967` |
| `../run1.sh`, `../run3.sh`, `../chal.sh` | `3df9ecd1…9c1866c5`, `fd7d5cae…4c339194`, `c11592a2…fc69961a0` |
| `landrun` binary | `899645806d1f17cbd73b22912879e53ae6cca9e115d6fa6e6029a0d23cdd11c8` |
| patched `comparator` binary | `32f09b9615a971a033ab032f521788a20dec8561b0bf700c985cbdaa59906bec` |
| `lean4export` binary | `e57369980b0b81228580ce08066fb9bd738e717e002673a143f4956d217266b0` |

The working directory holds about 58 GB (two project copies, tools, Go); it can be deleted once the logs are no longer needed.
