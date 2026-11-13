# G01 adequacy note, section (c): Lean formalisation of the constant-insertion witness

**Status.** The Proposition of section (c) of `../adequacy.md` is fully formalised and proved in Lean 4 in the form of its "Variant" paragraph. Nothing is left as a `sorry` or as an unproved hypothesis: the lattice clause `wilson : C.Converges p (…)` is proved, including total mass one of `wilsonLaw` and the Riemann-sum convergence. No error was found in the paper proof. This is an author-side machine check, not an independent review; the statement below should still be read against the public specification by a reviewer.

**Files.** `Adequacy.lean` (767 lines; imports only `ChallengeSpec`, which imports `PublicWilson`, which imports `PublicTheory`, which imports `Mathlib`) and `lakefile.toml`. The three public files were copied unchanged from `Lean/` of this worktree and are not duplicated here.

**Main theorem (compiles).**

```lean
theorem YangMills.constant_insertion_witness {g : GaugeGroup} (C₀ : WilsonFamily g) (T₀ : Hierarchy C₀)
    (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion) (hT : T₀.TraceTest)
    (hH : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0) :
    ∃ C : WilsonFamily g, WilsonRegularity C ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V) ∧
      ∃ T : Hierarchy C, ∀ p : ℕ → ℕ, StrictMono p → T.Properties p
```

**Corollary (compiles): the body of `JointExistence` at `g`, with `q = id`, for a family with constant insertions.**

```lean
theorem YangMills.jointExistence_body_constant_insertions {g : GaugeGroup} (C₀ : WilsonFamily g)
    (T₀ : Hierarchy C₀)
    (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion) (hT : T₀.TraceTest)
    (hH : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0) :
    ∃ C : WilsonFamily g,
      (WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
        ∃ T : Hierarchy C, T.Properties (p ∘ q)) ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V)
```

The first conjunct is literally the body of `YangMills.JointExistence` after `∃ C : WilsonFamily g,` (the hypothesis `g.IsSimple` is not used). Neither theorem asserts that data `C₀`, `T₀` satisfying the hypotheses exist; that is supplied only by the non-public construction, as discussed in the note.

**Hypotheses beyond (H1).** (H1) is `hR`, `hO`, `hT`. The single further hypothesis `hH` is the hypothesis of the Variant: the selected correlation vanishes whenever some slot carries the tag `⟨0, 0⟩` (the zero vector of `T₀.Field 0`). It replaces the paper's (H2) (existence of `u ≠ 0` in `Field 0` with `S(…,(0,2u),…) = 2 S(…,(0,u),…)`); no non-zero element of `Field 0` is needed. Its relation to multilinearity is recorded by a further lemma that compiles:

```lean
theorem YangMills.Adequacy.vanishes_of_homogeneous {g : GaugeGroup} (C₀ : WilsonFamily g)
    (T₀ : Hierarchy C₀)
    (hom : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n) (k : Fin n) (c : ℂ) (u : T₀.Field 0),
      T₀.correlation (some T₀.selected) (Function.update a k ⟨0, c • u⟩) x =
        c * T₀.correlation (some T₀.selected) (Function.update a k ⟨0, u⟩) x) :
    ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0
```

Here `hom` is homogeneity of the selected correlation in one grade-zero slot, a special case of multilinearity in the field components at fixed grades; only the case `c = 0`, `u = 0` is used. That the constructed witness of `YangMills.constructed` satisfies `hH` was not formalised here (it lies outside the three public files); it remains at the level of source reading in the note.

**Parts left as hypotheses.** None. Intermediate statements that are proved and may be of independent use: `YangMills.Adequacy.wilsonLaw_probability` (for every `g`, `l`, `β` and probability measure `haar`, `wilsonLaw g l β haar` is a probability measure; proved by bounding `wilsonEnergy` through `entry_norm_bound_of_unitary`, without compactness of the group), `YangMills.Adequacy.riemann_real` and `riemann_points` (convergence of the periodic lattice sums with `ZMod.valMinAbs` to the integral, for a continuous function vanishing outside the open cube of side `P`; derived from Mathlib's `tendsto_tsum_div_pow_atTop_integral`), `family_regular`, `hier_reconstructed`, `hier_ope`, `hier_traceTest`, `family_converges`, and the milestone `hier_properties_of_converges`.

**Deviations from the paper construction, and points where Lean forced a choice.** (1) The Variant is formalised, not the main version: `m` is the indicator of the tag `⟨0, 0⟩`. (2) One extra channel is added in every grade, `Channel d := T₀.Channel d ⊕ Unit`, with actor `0 : Field d`; its coefficient is `h_a` in grade `0` and `0` in positive grades. The paper adds a channel only in grade `0`; the uniform sum type avoids a dependent case distinction on the grade and changes nothing in the argument (the extra terms vanish, and the coefficient bound for a zero coefficient is trivial). (3) `Character` is an inductive two-point type `Phase` with the metric induced from an embedding into the reals, the Borel sigma-algebra, and `phaseMeasure = ½δ₊ + ½δ₋`; the correlations are `some plus ↦ S`, `some minus ↦ 2M − S`, `none ↦ M`, as in the paper. (4) `period p = p + 1`, `denominator N = N + 2`, `beta N p = Real.log (N + 2)`, `haar = C₀.haar`, `Token = T₀.Tag`, `project = id`, as in the paper. (5) The row of the lattice limit is the constant `(∫ t) * M`, as in the paper; eventual suitability uses `StrictMono p` through `k ≤ p k`. (6) The measure on `Points n = PiLp 2 (fun _ : Fin n => EuclideanSpace ℝ (Fin 4))` is Mathlib's volume of a finite-dimensional inner product space; it is identified with Lebesgue measure on `(Σ _ : Fin n, Fin 4) → ℝ` through `LinearIsometryEquiv.piLpCurry` and `PiLp.volume_preserving_toLp`. (7) For measurability of the Wilson density on the product space, three instances of `SecondCountableTopology` (complex square matrices, the unitary group, `g.image`) are declared in the file, since Mathlib does not find them automatically; they are proved, not assumed. No clause of the specification failed and no additional hypothesis was needed.

**Axioms.** Output of the three `#print axioms` commands at the end of `Adequacy.lean`, as printed by the final build:

```
info: Adequacy.lean:765:0: 'YangMills.constant_insertion_witness' depends on axioms: [propext, Classical.choice, Quot.sound]
info: Adequacy.lean:766:0: 'YangMills.jointExistence_body_constant_insertions' depends on axioms: [propext, Classical.choice, Quot.sound]
info: Adequacy.lean:767:0: 'YangMills.Adequacy.vanishes_of_homogeneous' depends on axioms: [propext, Classical.choice, Quot.sound]
```

The file contains no `sorry`, no `axiom` declaration and no `native_decide` (checked with `grep`).

**Toolchain and dependencies.** Lean `leanprover/lean4:v4.32.0` (`Lean (version 4.32.0, x86_64-unknown-linux-gnu, commit 8c9756b28d64dab099da31a4c09229a9e6a2ef35, Release)`); Mathlib at revision `81a5d257c8e410db227a6665ed08f64fea08e997`, with transitive dependencies pinned by an unchanged copy of `Lean/lake-manifest.json`; `leanOptions` `maxHeartbeats = 0`, `maxRecDepth = 4096`, as in `Lean/lakefile.toml`.

**Reproduction.** Create an empty directory (used here: `/home/jo314/ym-adequacy`) and copy into it, from `Lean/` of this worktree, `lean-toolchain`, `lake-manifest.json`, `PublicTheory.lean`, `PublicWilson.lean`, `ChallengeSpec.lean`, and from this directory `lakefile.toml` and `Adequacy.lean`. Then run `lake exe cache get` (downloads the prebuilt Mathlib; Mathlib is not compiled from source) and `lake build` (builds the library `WilsonPublic` with roots `PublicTheory`, `PublicWilson`, `ChallengeSpec`, and the library `Adequacy`). For a single-file check, `lake env lean Adequacy.lean`.

**Commands run and results.** `lake exe cache get`: 8639 files downloaded and decompressed. `lake build WilsonPublic`: success. `rm -rf .lake/build && lake build`: `Build completed successfully (8660 jobs)`, wall time 16.7 s (real 0m16.653s; this is the three public files plus `Adequacy.lean`, which alone took 5.1 s; Mathlib comes from the cache), no errors and no warnings, on a 24-core WSL2 machine. `git -C .lake/packages/mathlib rev-parse HEAD` gives `81a5d257c8e410db227a6665ed08f64fea08e997`.

**SHA-256.** `PublicTheory.lean` 94111ad258b4218a263fcc0a7136446d5a6eff0e090809b72036fb3a7aecfff8; `PublicWilson.lean` c1542c816cd42d23448b66b4cb021c7f3bdad64b64f1c643dde27147ce0c3233; `ChallengeSpec.lean` e48b0be2b72d16b9b87c6c1923b3ae814270387bf9312b5cb0661dfa3e243749 (each identical for the worktree copy under `Lean/` and the copy used in the build); `lean-toolchain` 2773c517aa90b66ea8a2c52bddddf84393157797f8341be0df45294fff7fd32e; `lake-manifest.json` 389c72d12e69c19b8a699df76405b2b1538f8f46ae77837fd2e972dda52724c3 (unchanged after `lake exe cache get`); `Adequacy.lean` 581880ef39e48a1af37af8b67b50869a011958411be2c6fb291a5a38e43b18f3; `lakefile.toml` ed67fb3b8344395d6b48c6f3ff54915c8c463397265cae965742396b85fbe855.

**Remarks on the note.** The points listed in the note as "not checked by elaboration" are now checked: `wilsonLaw` has mass one for the public definition; the range of `ZMod.valMinAbs` is as used (`ZMod.valMinAbs_mem_Ioc`, `ZMod.valMinAbs_spec`); a two-point space carries the required `MetricSpace`, `BorelSpace`, `CompactSpace` instances. The reading of the internal `classMoment` as giving the vanishing hypothesis for the constructed witness is not checked here.

---

## Unconditional corollary in the full project

**Statement.** The file `AdequacyFull.lean` in this directory proves, inside the full project (not only over the public specification files), that the body of `YangMills.JointExistence` holds with a Wilson family whose insertions do not depend on the gauge configuration. The first conjunct is literally the body of `JointExistence` (`Lean/ChallengeSpec.lean`, lines 186-188); this was checked by elaborating `example : YangMills.JointExistence := fun g hg => let ⟨C, h, _⟩ := YangMills.jointExistence_with_constant_insertions g hg; ⟨C, h⟩`. The statement is exactly the intended one, with no weakening:

```lean
theorem YangMills.jointExistence_with_constant_insertions :
    ∀ g : GaugeGroup, g.IsSimple → ∃ C : WilsonFamily g,
      (WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
        ∃ T : Hierarchy C, T.Properties (p ∘ q)) ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V)
```

**Imports.** `import Adequacy` and `import Solution` (the latter brings in `Construction`, `HierarchyBridge` and the whole project transitively).

**Project declarations used.** `YangMills.constructed.{0,0} g hg 1 zero_lt_one` (`Lean/Construction.lean`), applied to the single request `YM.Extraction.Order.full`, gives a family `C`, a table `S`, `F : Final C _ S`, a reader `Q`, and `(YangMills.hierarchy F Q).Properties _`, whose projections `reconstruction`, `ope`, `nonfree` supply `Reconstructed`, `OperatorProductExpansion`, `TraceTest`. The vanishing hypothesis `hH` of `YangMills.jointExistence_body_constant_insertions` (from `Adequacy.lean`) is proved for `YangMills.hierarchy F Q` (`Lean/HierarchyBridge.lean`) as follows: its `correlation s v x` is by definition `S.useAt (YM.OPE.spectator F s) x v` (`YM.Spec.Table.useAt`, `Lean/YM/Euclid/Lift.lean`), which unfolds to `S.classMoment (spectator F s) (fun i => (v i).1) x (fun i => (v i).2)`, and `classMoment` is a `MultilinearMap ℂ (fun i => S.Field (d i)) ℂ`; if `a k = ⟨0, 0⟩` then `(a k).2 = 0` (by `subst`), and `MultilinearMap.map_coord_zero` gives the vanishing. All unfolding is by definitional equality (`exact`); the route through `vanishes_of_homogeneous` was not needed. The Wilson regularity of the project's own family is not used; the output family is `YangMills.Adequacy.family` built from the hierarchy data.

**Axioms.** Output of `#print axioms` during the remote compile: `'YangMills.jointExistence_with_constant_insertions' depends on axioms: [propext, Classical.choice, Quot.sound]`. The file contains no `sorry`, no `axiom` declaration and no `native_decide`.

**Remote commands used.** The file cannot be compiled with the small local setup above; it was compiled on the server `ada-25` against the already built project tree `/userdata/schmittj/ym-build/repo/Lean` (not modified, no `lake build` run there; Lean 4.32.0, commit 8c9756b28d64dab099da31a4c09229a9e6a2ef35), with `Adequacy.lean` and `AdequacyFull.lean` placed in `/userdata/schmittj/ym-build/formal/`. `LEAN_PATH` was assembled by hand rather than through `lake env`. The script `compile.sh` that was run there (as `bash compile.sh > compile.log 2>&1`) is equivalent to:

```bash
export ELAN_HOME=/userdata/schmittj/elan PATH=/userdata/schmittj/elan/bin:$PATH TMPDIR=/userdata/schmittj/ym-build/tmp
R=/userdata/schmittj/ym-build/repo/Lean
LP=$R/.lake/build/lib/lean
for d in $R/.lake/packages/*/.lake/build/lib/lean; do LP=$LP:$d; done
cd /userdata/schmittj/ym-build/formal
export LEAN_PATH=$LP:/userdata/schmittj/ym-build/formal
LEAN=$(cd $R && elan which lean)
nice -n 10 $LEAN -DmaxHeartbeats=0 -DmaxRecDepth=4096 Adequacy.lean -o Adequacy.olean
nice -n 10 $LEAN -DmaxHeartbeats=0 -DmaxRecDepth=4096 AdequacyFull.lean -o AdequacyFull.olean
nice -n 10 $LEAN -DmaxHeartbeats=0 -DmaxRecDepth=4096 Check.lean -o Check.olean
```

Results: all three invocations exited with status 0, no errors and no warnings; `Adequacy.lean` printed its three axiom lines as above, `AdequacyFull.lean` printed the axiom line quoted above; both together took under 45 seconds. `Check.lean` is the two-line file containing the `example` quoted under "Statement" plus a `#check`. The `.olean` files, `compile.sh`, `compile.log` and `check.log` remain in `/userdata/schmittj/ym-build/formal/` on the server. To reproduce elsewhere, replace `R` by the `Lean/` directory of any fully built copy of the project and the `formal` directory by any directory holding the two files.

**SHA-256.** `AdequacyFull.lean` a4f05230225a73c36155f1159bda5cb83979333b4a4e7d9f6c97f09cc1c9706e; `Adequacy.lean` 581880ef39e48a1af37af8b67b50869a011958411be2c6fb291a5a38e43b18f3 (local and server copies identical).

**What the check relies on.** Unlike `Adequacy.lean`, this theorem's kernel check relies on the project's compiled modules (`Solution.olean`, `Construction.olean` and their roughly 12,000 transitive imports) from the clean rebuild of issue #37: Lean checked the new declarations against the imported environment and did not re-check the imported modules. The `#print axioms` output covers the full dependency closure as recorded in those compiled modules, so it is as trustworthy as that rebuild. No independent re-check (for example with `lean4checker`) of `AdequacyFull.olean` was run.
