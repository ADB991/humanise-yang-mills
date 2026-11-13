# G01 review: Lean correspondence

Session `hairer-claude-g01-review-20261113`. **No Lean was elaborated, built or replayed in this review.** The Lean toolchain and Mathlib cache hosts are not reachable from the review environment (see `validation.md`). Everything below was read in source at the hashes listed in `validation.md`. The kernel checks reported in `formal/README.md` were **not** repeated.

## L1. `formal/Adequacy.lean`: does the statement say what the note claims?

Yes. `YangMills.constant_insertion_witness` and `YangMills.jointExistence_body_constant_insertions` (lines 735–761) state:

- the hypotheses (H1) as `hR : T₀.Reconstructed`, `hO : T₀.OperatorProductExpansion`, `hT : T₀.TraceTest`, plus the Variant hypothesis `hH`: `T₀.correlation (some T₀.selected) a x = 0` whenever some `a k = ⟨0, 0⟩`, for all `n`, `a` and **all** `x`, not only separated ones;
- the conclusion: there is a `C : WilsonFamily g` with `WilsonRegularity C`, with `C.insertion N p v x U = C.insertion N p v x V` for all arguments, and (second theorem) the first conjunct literally the body of `YangMills.JointExistence` after `∃ C : WilsonFamily g,`. I compared it token by token with `Lean/ChallengeSpec.lean` 186–188.

The constancy conjunct expresses exactly "independent of the configuration". The insertions of `family` are also independent of `N`, `p` and `x` (definition at lines 100–111), which is stronger than stated.

**Constructs that could change meaning.** I searched the file for `axiom`, `sorry`, `opaque`, `unsafe`, `implemented_by`, `extern`, `macro`, `syntax`, `notation`, `elab` and attribute overrides, and found none. The only `set_option` is `autoImplicit false`. The `instance` declarations are either for the new inductive type `YangMills.Adequacy.Phase` (`MetricSpace`, `MeasurableSpace`, `BorelSpace`, `DiscreteTopology`, `CompactSpace`, `IsProbabilityMeasure measure`) or Prop-valued (`SecondCountableTopology` for matrices, the unitary group and `g.image`; `IsProbabilityMeasure (wilsonLaw …)`). A Prop-valued instance cannot change the data of any public definition. The new data instances are on a type that does not occur in the public files. So the public types in the statements mean what they mean in `ChallengeSpec.lean`.

**Definitions match the paper.** `m` is the indicator of `⟨0, 0⟩` (line 80); `M` is the product over slots (92); `family` has `period p = p+1`, `denominator N = N+2`, `beta N _ = log (N+2)`, `haar = C₀.haar`, `Token = T₀.Tag` and constant insertions (100–111); `corr` has `none ↦ M`, `plus ↦ S`, `minus ↦ 2M − S` (113–117); `hcoef` is \(M_a-\sum_ic^{0,i}_a\,m(\langle0,E_{0,i}\rangle)\) (119–121); `hier` adds one channel in every grade with actor `0` and coefficient `hcoef` in grade 0, `0` otherwise (124–142). These agree with `adequacy.md` (c), Variant, and with deviations (1)–(5) listed in `formal/README.md`.

**Hashes.** `Adequacy.lean`, `PublicTheory.lean`, `PublicWilson.lean`, `ChallengeSpec.lean` and `lakefile.toml` have the SHA-256 values recorded in `formal/README.md`. The three public files in the worktree are therefore the ones the author compiled against.

## L2. `formal/AdequacyFull.lean`

The statement of `YangMills.jointExistence_with_constant_insertions` is the body of `JointExistence` plus constancy, for every `g` with `g.IsSimple`.

The proof destructures `YangMills.constructed.{0,0} g hg 1 zero_lt_one` as `⟨C, _, _, _, orders⟩`, matching the conjuncts penalty, `Makes`, `WilsonRegularity` and the order clause (`Lean/Construction.lean` 15–31). It then destructures `orders YM.Extraction.Order.full` as `⟨q, S, F, L, Q, M, X, core, _⟩`, matching the seven existentials and the first conjunct `(hierarchy F Q).Properties _`. It uses `core.reconstruction`, `core.ope` and `core.nonfree`, matching the field names of `Hierarchy.Properties`.

The vanishing step applies `MultilinearMap.map_coord_zero` to `S.classMoment (YM.OPE.spectator F (some …)) (fun i => (a i).1) x`, which is the definitional unfolding of `(hierarchy F Q).correlation` (`Lean/HierarchyBridge.lean` 37; `Lean/YM/Euclid/Lift.lean` 58–59, 67). I read these definitions and the unfolding is as claimed (S). Whether `exact` accepts it is a matter for elaboration, which I did not run.

Same caveat as the author: this file's kernel check relies on the compiled project modules of the #37 clean rebuild. No `lean4checker` or other independent replay of `AdequacyFull.olean` exists.

## L3. Source anchors used by `adequacy.md` (d)

I checked these by reading:

- `YangMills.hierarchy` (`Lean/HierarchyBridge.lean` 27–42): `correlation s v x := S.useAt (spectator F s) x v`, `project := S.classTokens`, `Character := F.α.space.X`.
- `YM.OPE.spectator` (`Lean/YM/OPE/Eye/Views.lean` 26): `v.elim S U.α.ensemble`.
- `YM.Extraction.Order.full` and `Order.refine` (`Lean/YM/Extraction/Orders.lean` 25–42).
- `YangMills.jointExistence` (`Lean/Solution.lean`).
- `YangMills.publicTrace` and `Wick.euclidean_excludes` (see `mathematics.md` M5).

All agree with the note and the ledger. I did not open `Lean/YM/Source/Construction.lean`, `LatticeFamily.lean`, `Words.lean`, `Mixture.lean` or `HeadlineSpec.lean`. The author's statements about positivity of every phase and about `C.seen` are therefore unchecked by me. They bear only on (d)'s explanation of why `constructed` does not admit the construction, not on (c).

## L4. Unrun

- Elaboration of `Adequacy.lean` and `AdequacyFull.lean`, and their `#print axioms`.
- Any independent kernel replay (`lean4checker`, Comparator) of the two files.
- The `example : YangMills.JointExistence := …` check recorded in `formal/README.md`.

A reviewer with network access to the Lean release and Mathlib cache hosts can close the first and third items in under a minute using the commands in `formal/README.md`.
