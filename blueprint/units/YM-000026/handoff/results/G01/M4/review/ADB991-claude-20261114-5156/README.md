# Independent review of the G01 M4 free-field formalisation (PR #339)

- Unit: YM-000026, result G01, record M4. Reviewed artefact: `results/G01/formal/FreeField/` (72 Lean files), with `formal/Adequacy.lean`, `formal/GroupIndependence.lean` and `formal/lakefile.toml`. Main theorem `YangMills.jointExistence_of_freeField : YangMills.JointExistence` (`FreeField/Main.lean`). Task: issue #162, parent #26.
- Role: INDEPENDENT reviewer. Scope: source correspondence (trusted-base and import-closure audit) and mathematical spot-checks. Session `ADB991-claude-20261114-5156`. Claim: https://github.com/hairer/humanise-yang-mills/issues/162#issuecomment-6869545645
- Independence: the account ADB991 did not author #236, #305, #339, the M4 record or any file of the development. ADB991 did not take part in the earlier M4 reviews (mgubi, schmittj).
- Human reviewer: none. Prepared autonomously by a Claude agent (scheduled routine) on behalf of ADB991, and not read by ADB991 before submission. Human acceptance is **unset**.
- Reviewed content: `codex/existence-monograph` @ `97f806c7fa243c616cf7a13341815298815a310d`. The `formal/` tree there is byte-identical to the #339 head `2f60be36` (`git diff 2f60be36 97f806c7 -- …/G01/formal` is empty); the `FreeField/` tree object is `a0fa6c16051168e2166607579b8432de07b7ea36`. File hashes are below. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Outcome: **no defect found in what was checked; no required change.** The checks were textual and numerical. **No Lean was elaborated and the build was not reproduced**: the Mathlib hosts are blocked from this sandbox (github.com/leanprover-community/mathlib4 → 403 and mathlib4.lean-cache.cloud → CONNECT 403, both re-tested in this session). So the independent rebuild that #339's handoff asks for (its item (1)) is **still open**, and so is item (2), a replay with an external checker.

## What was checked

### A. Statement correspondence

1. **The theorem's type is the public one.** `Main.lean` declares `theorem jointExistence_of_freeField : JointExistence` inside `namespace YangMills` with `open FreeField`. Name resolution could pick a shadowing `YangMills.FreeField.JointExistence`, so the development was checked for one. No file declares a constant named `JointExistence` (grep over all 72 files, `Adequacy.lean` and `GroupIndependence.lean`), so the name resolves to `YangMills.JointExistence` (`Lean/ChallengeSpec.lean:186`). `FinalCheck.lean` restates the claim with fully qualified names, both as `YangMills.JointExistence` and as its unfolded body. That body was compared by hand with `ChallengeSpec.lean:186-188`: it is the same, including `WilsonRegularity`, the `StrictMono` refinement and `Properties (p ∘ q)`.
2. **The public files are the pinned ones.** `Lean/PublicTheory.lean`, `PublicWilson.lean` and `ChallengeSpec.lean` at the reviewed commit have the SHA-256 values listed in `Lean/SOURCES.sha256` (`94111ad2…ecfff8`, `c1542c81…7e3233`, `e48b0be2…243749`). The development keeps no copy of them; the README's build recipe copies them from `Lean/`.
3. **Toolchain and Mathlib.** `formal/lakefile.toml` requires Mathlib at `81a5d257c8e410db227a6665ed08f64fea08e997`. That is the `inputRev` in `Lean/lake-manifest.json`, the file the recipe copies. `Lean/lean-toolchain` is `leanprover/lean4:v4.32.0`. The lakefile's only `leanOptions` are `maxHeartbeats = 0` and `maxRecDepth = 4096`, which bound elaboration and do not affect the kernel.

### B. Import closure

Every `import` line in `FreeField/**/*.lean`, `Adequacy.lean` and `GroupIndependence.lean` was listed. Outside the development itself, the only imports are:

- `ChallengeSpec`, in `Adequacy.lean`;
- `Adequacy`, in `GroupIndependence.lean` and `FreeField/Labels.lean`;
- `GroupIndependence`;
- 29 `Mathlib.*` modules.

`ChallengeSpec` imports `PublicWilson`, which imports `PublicTheory`, which imports `Mathlib`. No file imports `Solution`, `Construction`, `YM.*` or any other file of the release. This confirms the README's closure statement. `AxiomReport.lean` and `FinalCheck.lean` are leaves: no file imports them, so their `run_cmd`/`#print` cannot affect `Main.lean`.

### C. Trusted-base scan

`scan_trusted_base.py` removes comments and string literals, then searches all 72 files plus `Adequacy.lean` and `GroupIndependence.lean` for these keywords:

`sorry`, `admit`, `axiom`, `unsafe`, `extern`, `implemented_by`, `native_decide`, `opaque`, `partial`, `ofReduceBool`/`reduceBool`, `skipKernelTC`/`debug.*`, `elab`, `macro`/`macro_rules`, `syntax`, `notation`/`infix`/`prefix`/`postfix`, `run_cmd`/`run_tac`/`run_elab`, `initialize`, `addDecl`, `csimp`, `export`, `attribute`, `mutual`, `decreasing_by`/`termination_by`.

The only hits are the following.

- **`run_cmd`**, once, in `AxiomReport.lean:94`, a leaf file. It reads `collectAxioms` for 81 names and throws unless each has exactly `[propext, Classical.choice, Quot.sound]`. It declares nothing.
- **`set_option`, 125 hits**, of four kinds:
  - 118 × `autoImplicit false`;
  - 3 × `maxHeartbeats`;
  - 2 × `backward.isDefEq.respectTransparency false`, in `Reconstruction/HostReconstruct.lean:7` and `Theory/PsiCovariant.lean:900`;
  - 2 × linter switches.

  All of these are elaborator options. None turns off kernel checking.
- **23 `instance` declarations.** All are on types the development or `Adequacy`/`GroupIndependence` introduce (`GradeLE`, `Channel`, `ProperLorentz`, `Sym`, `Phase`, and the `UnitaryRepresentation`/`g.image` countability and compactness facts). They cannot change the type of an already elaborated public constant.
- The remaining hits are only `open`, `scoped`, `private`, `noncomputable` and `Classical`.

So, read textually, nothing in the closure weakens the kernel check or redefines a public notion. Whether the files actually build, and with exactly the stated axioms, remains for a rebuild.

### D. Mathematics: the trace normalisation

The only place the gauge group enters is `traceScale g = √(3 dim𝔤/π⁴ /(384π))` (`Main.lean`), via `traceTwo = λ² Sr(r)` (`Trace.lean:107`, `traceTwo_eq`). The limit `r⁸ log²(1/r) Sr(r) → 384π` (`Sr_asymptotic`) was therefore re-derived independently from the definitions in `TwoPoint.lean`:

- `Sr(r) = ∫_{ℝ⁴} e^{-r p_t} w(p) d⁴p`;
- `w = s²/log²(e+s)` on the closed forward cone, with `s = p_t² − |𝐩|²`.

**Derivation.**

1. On the cone, `d⁴p = ds d³p/(2E)` with `E = √(s+|𝐩|²)`.
2. Next, `∫ d³p e^{-rE}/(2E) = 2π √s K₁(√s r)/r`.
3. Hence `Sr(r) = 2π r⁻¹ ∫₀^∞ s^{5/2} K₁(√s r) log⁻²(e+s) ds`.
4. Substitute `s = u/r²` and multiply by `r⁸ log²(1/r)`. This gives `2π ∫₀^∞ u^{5/2} K₁(√u) [log(1/r)/log(e+u/r²)]² du`.
5. The bracket tends to 1/4 pointwise as `r → 0`. It is bounded by 1/4 for `r < e^{-1/2}`, because `log(e+u/r²) ≥ log(e/r²) ≥ 2 log(1/r)`. Dominated convergence then applies.
6. The limit is therefore `(π/2) ∫₀^∞ u^{5/2} K₁(√u) du = π ∫₀^∞ t⁶ K₁(t) dt`.
7. By the Mellin formula `∫₀^∞ t^{μ−1} K_ν(t) dt = 2^{μ−2} Γ((μ−ν)/2) Γ((μ+ν)/2)`, with μ = 7 and ν = 1, the last integral is `2⁵ Γ(3) Γ(4) = 384`. This is the standard formula, e.g. DLMF 10.43.19, cited from memory and confirmed numerically below.
8. So the limit is **384π**, as `Sr_asymptotic` states.

With `traceScale² · 384π = 3 dim𝔤/π⁴`, the `shortDistance` constant is the public one.

**Numerical confirmation.**

- `trace_reduction.py`, mpmath at 30 digits, confirms ∫u^{5/2}K₁(√u)du = 768.000… and step 2 above at a sample mass and radius.
- `trace_limit.py` evaluates the scaled integral at L = log(1/r) = 5, 20, 10², 10³, 10⁴, 10⁶. The ratio to 384π is 0.550, 0.844, 0.965, 0.9964, 0.99964 and 0.9999964. This is the expected `1 − O(1/L)` approach.

The KL remark in `TwoPoint.lean`'s docstring, `ρ(ds) = (2π)³ s²/log²(e+s) ds`, is consistent with step 1 under the standard `(2π)^{-3} d³p/(2E)` convention. It also agrees with the coordinating-session check in `../schmittj-claude-20261113/README.md`.

The density is non-negative and supported in the closed forward cone. It is finite there, since `log(e+s) ≥ 1` for `s ≥ 0`, and polynomially bounded. These are the properties the spectral clauses need. The kernel checks the clauses themselves, provided the build succeeds.

## Not checked

- No Lean elaboration and no `#print axioms`. The claims "builds (8734 jobs)", "81 of 81 standard axioms" and "no `sorry`" rest on the author's logs and on the textual scan in C.
- The 75 lemma proofs were not read. The theorem's type is public, so their correctness is the kernel's job, given a successful build.
- No external checker (`lean4checker`, Comparator).
- `DESIGN.md`, `CONSOLIDATION.md`, `TASKS.md` and `reviews/` were not reviewed.
- The wider consequences for G01 `adequacy.md` (d)(3) and G06 were not assessed. Neither was any statement-section wording; that is a coordinator decision, as #339's handoff says.

## Hashes (SHA-256)

| File | SHA-256 |
| --- | --- |
| `formal/lakefile.toml` | `020467495724e36c38958c969a5727549d255ac50fe74dc7d7c9ba0739e191cf` |
| `formal/Adequacy.lean` | `581880ef39e48a1af37af8b67b50869a011958411be2c6fb291a5a38e43b18f3` |
| `formal/GroupIndependence.lean` | `71441f89e6ebe5a4dc3c291dc98c8d00151b3b4dabdbf7574fb9b39d02ebeebc` |
| `FreeField/Main.lean` | `6acf212e6c39363032ca47ebea2581c186e947a2d72fd1042eeaa18c11f8f8be` |
| `FreeField/FinalCheck.lean` | `665a72a6ab2975091f24c9990e876d70465fd610eb934be6ecdd6612a54f8b47` |
| `FreeField/AxiomReport.lean` | `b23b012a9dbf83bf1a55c9b2b1dff85b3f94f2abddf9a3b7af69bca243223428` |
| `FreeField/TwoPoint.lean` | `83a58d1c96657b968acef9f269b74b0d8b3f6e32509198e264dcb1fdadda600d` |
| `FreeField/Hierarchy.lean` | `d1dbb74dcea52e19693152f7a9ac8bafb24cec71d7dc0ad3767910164e13b0e7` |
| `FreeField/Trace.lean` | `ae83bf9d8ac597ca155c6c8919e21c4d708e6766a5339ea84f69ee98c5558ff7` |
| `FreeField/SHA256SUMS` | `6fb6cfcebbfafa22916489ada881cb7b4b41161a70b072b226154c94b5c525a1` |
| `Lean/lake-manifest.json` | `389c72d12e69c19b8a699df76405b2b1538f8f46ae77837fd2e972dda52724c3` |

`sha256sum -c FreeField/SHA256SUMS`, run from `formal/`, reports 73 OK and 0 failures. The listed `.lean` paths are exactly the 72 files present.

## Commands run

- `sha256sum -c FreeField/SHA256SUMS` (from `formal/`): 73 OK.
- `sha256sum Lean/{PublicTheory,PublicWilson,ChallengeSpec}.lean`, compared with `Lean/SOURCES.sha256`: match.
- `grep -rhoE '^import .*'` over the closure (B).
- `python3 scan_trusted_base.py …` (C): 1097 hit lines, all accounted for above.
- `python3 trace_reduction.py` and `python3 trace_limit.py`, with mpmath 1.4.1 (D).
- `curl -I` to the Mathlib hosts: 403 (blocked). No `lake` or `lean` command was run.

## Next

An account with Mathlib access should reproduce the README's "How to check" in a fresh directory, record the three expected output lines, and if possible run `lean4checker`. With that done, M4 items (1) and (2) of #339's handoff close.
