# Review of an interface audit: rank, determinant and stress handoffs

- Reviewed file: `blueprint/interfaces/rank-determinant-stress.md` (issue #14, PR #31, author session `mgubi-claude-issue14-20261111`)
- Role: Lean correspondence
- Human reviewer: ADB991 (no acceptance recorded; see the last section)
- Agent assistance: Claude Code (Anthropic), running as a scheduled agent on behalf of ADB991, did the inspection and wrote this report. Three subagents each checked one contract (A, B, C) by reading source. The parent agent then rechecked by hand every finding listed below as definite. ADB991 had not read this report before it was submitted.
- Content SHA-256: `a7477c982ff94b159b3fc5f0cc7d8c4f6425e43c3f4e67038407d00902772555` (`sha256sum` of the file at `main` `4cf1c97`; the same blob as PR #31 head `6cda532`)
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`Lean/` in this repository)
- Review task: [issue #14](https://github.com/hairer/humanise-yang-mills/issues/14), claim <https://github.com/hairer/humanise-yang-mills/issues/14#issuecomment-6825197499>
- Outcome: **changes requested.** Contract A is correct. Contracts B and C misstate one consumer statement and omit hypotheses of several theorems, and the proposed PU-20a boundary needs more inputs than stated. One open question (finding 5 of the note) is largely answered from source.

I am not an author of the note. This is an agent-assisted review, not a human acceptance.

## Method and its limits

Evidence levels used here:

- **[S]** source text read at the pinned revision, including `variable`/`include`/`omit` lines and implicit binders.
- **[I]** module import graph. I parsed the `import` lines of all 9,477 `.lean` files under `Lean/` and computed transitive closures. If module A does not transitively import module B, then no declaration of A can refer to a declaration of B. Non-reachability shown this way is sound. Reachability shown this way is not: an import does not imply a reference.

**Nothing was elaborated.** This sandbox can reach neither the Mathlib cache (`mathlib4.lean-cache.cloud`) nor GitHub's Mathlib repository, and it cannot reach the prebuilt release used in `source/build.md`. The pinned toolchain `v4.32.0` was installed, but `lake` could not fetch dependencies. I therefore could not reproduce any of the note's **[E]** claims by elaboration, or any **[G]** claim through the compiled graph. I could only check them against source text. Theorem counts such as "273 theorems" and "7896 theorems" are unchecked.

## Findings

### Definite errors

1. **Statement attributed to `YM.Org.Commission.picks` is wrong (Contract C "Output to VI.1"; finding 6) [S].** The note says `picks` has the statement `Spec.Calibrated C → V.Inclusions S → V.Derivatives S → Org.UV C f S V W I → Nonempty (Spec.Final C f S)`. That is the statement of `YM.MergeProof.Acme.glistens` (`Lean/YM/MergeProof/Summit.lean:17`). `picks` is at `Lean/YM/Org/Twist.lean:45`:
   `Commission.picks (Z : Commission V W I H) (hv : V.Inclusions S) (hp : V.Derivatives S) : ∃ c U J, Tab S V W I H c U J ∧ ∃ K0 : Boundary.Spins S, K0.Descends (mill W I c U) H.basis.kernel.spin`, where `H : UV C F S V W I` is a section variable.
   `glistens` takes an `Org.UV`, builds a `Commission` with `Bid.station W V I H …` (Summit.lean:18) and then calls `picks` (Summit.lean:22). So the direct consumer of `Org.UV` with the quoted statement is `Acme.glistens`. `Org.UV` also occurs in about two dozen other files, so "its consumer" in the singular is too strong.

2. **`Acme.annular_fieldA`, `Acme.tenet` and `Acme.shells_law` have more hypotheses than stated (Contract C) [S].** `annular_fieldA` (`West/Bravo.lean:55`) also takes `hC : C.Makes`, `hq : Cells.CellHyp C F`, `ho : F.PointLimits C S`, `H : S.Hierarchy` and `h : V.Derivatives S`. Conservation is `hc : Conserved V H.spin J`, which is relative to the derivative plan `V` and to `H.spin`. `tenet` (`West/Blanca.lean:49`) and `shells_law` (`West/Orange.lean:33`) take the same set. The recommendation that PU-20a is "self-contained given the shell estimate", with `Aroma` as its only stated hypothesis, should therefore list the extraction, hierarchy and derivative-plan inputs as well.

3. **`YM.MergeProof.Accent.rated` (`Powder.lean:48`) omits one hypothesis and one output [S].** It also needs the explicit hypothesis `H : ∀ i : ℕ, 0 ≤ generator G i`, which supplies the argument of `(Q i).patronize C (H i)` (the note writes `Panel.patronize C (Q i) …`). The conclusion also contains `∃ E : DiffPlan T`: the full conclusion is `∃ g A L R Z T E, Projected Xf (f.refine g) R Z ∧ Base C (f.refine g) A L R T E ∧ ∃ s : Seed C (f.refine g) T, Maxwell.Ranks T s.kernel.spin`. The note lists only some of the implicit data (`O : HaarBudget G`, `B : RankCovariance.Binding C`). The rest of the statement matches, including the `∀ i, ∃ᶠ j in atTop` order and the `-3` exponents.

4. **`MergeProof.Scotia` (`Eureka.lean:16`) has a quantifier misplaced [S].** The field `step d N p : Mark.Chosen (C.labels.level d) (catalog C R d N p (P d (N,p))) (b.step d (N,p))` holds for **all** `N, p`, not "eventually in `N`". The eventual field `turns d : ∀ᶠ N in atTop, ∀ p, …` contains the reality and signed-axis equivariance the note describes, and also `Mark.Symmetry (C.labels.level d) (b.step d (N,p))`, which the note omits.

5. **Hypotheses missing from the producers of (i)–(iii) [S].**
   - `MergeProof.reception` (`Eureka.lean:22`) also takes the explicit hypothesis `hb : ∀ d, ∃ a : ℕ → ℝ, Braze (V d) a`. The section hypotheses it does list (`Makes`, `Tabs`, `Scrim` with general `ζ`, `Fridge`, portfolio, simplicity) are correct.
   - `Legato.castle` (`Snow.lean:28`) also needs `B : Bolt A`, `C.path = A.B.bake.make B.history` and `∀ j, snows D j ≤ A.delay.shells j`. Its conclusion is `∃ K : RankCovariance.Binding C, K.world ≍ A.B.M ∧ K.prices = M.K`.
   - `Legato.franchise` (`Snow.lean:55`) fixes the chart ratio to `chart G`, and chooses `Q, U` before `∀ C`. The note should say so.

6. **`Legato.uv_log` does not give "the conclusion of `rated`" for every `f` [S].** In `Flowers.lean:75` the per-order conclusion lacks the `Projected Xf … R Z` conjunct and `Z`. Also, `Org.Grill C F ∧ East.CompleteWeak C F` hold only under `∀ F, Cells.CellHyp C F → …`. Further conjuncts not listed: `kernel.penalty = b`, `Spec.Calibrated C`, and others.

7. **The "one consumer" claims of Contract A are incomplete [S].**
   - `YM.Next.Rank.determinant` has a second direct caller, `YM.Next.Rank.Array.postage` (`Lean/YM/Next/RANK/Stamp.lean:131`, call at line 151). I found no textual caller of `Array.postage`.
   - `Soft.coupon` is also called from `YM.Next.Rank.Tapes.West.tenderly` (`YM/MergeProof/West/Equity.lean:86`).
   - `Ship.banking` is also called from `YM.MergeProof.earnings` (`YM/MergeProof/West/Tael.lean:70`) and from a copy under `TraceExtension/Prom/Front/West/Tael.lean`.

   So the PU-12 material also feeds the `West` directory, not only PU-11b. See question Q1.

8. **Smaller corrections [S].**
   - `Soft.v_obtain_purchases` (`Supra.lean:177`) shares a table row with `wheeled` but has a different statement. Hypotheses: `G.Simple`, `C.Makes`, `0 < b`, `Offers_ O p' b`. Conclusion: `∃ Z, Travels_ O p' b Z ∧ Market.Purchases Z`.
   - `Market.Purchases` (`Bought.lean:68`) also has the fields `flat`, `fit` and `axis`, and an `Interior` clause inside `arrays`.
   - In `Maxwell.Ranks`, `h` is a proof of `(freeTable L.grid).RealSpin`, not a "real structure" datum.
   - `Ribbons.laurelE` also uses `G.Simple`. `Ribbons.fugacious` comes after `omit hW L` (`North/Economist.lean:33`), so it uses only `G.Simple` and `Legato.Velour`, not `Scrim`, `Tabs`, `Created` or `Makes`.
   - "`emanate` uses only `corrected` and the extraction fields of the seed": `emanate` uses all six fields of `Spec.Seed`. `copies : CellHyp C F` is not an extraction field. The only rank-specific field is `corrected`.
   - "Inputs" of Contract A: the 82-module YM import closure of `Next/RANK/Determinant.lean` also contains `Pressure`, `PCalc`, `Branch`, `Vac`, `Bid` and other directories. It is not limited to the lattice, gauge-group and RG-definition directories.

### Confirmed

- **Contract A statements [S].** All match the source exactly, with the line numbers given:
  - `Rank.determinant` (`Determinant.lean:240`, with section hypothesis `R.Lawful σ A Λ δ w`)
  - `protection` (:225) and `ent` (:220; `strength p = min 1 p.linear`)
  - `HaarBudget` (:26) and `exists_budget`
  - `Station.affordable` (`StationMeter.lean:119`; the eventual threshold depends only on `G, O, A` and simplicity), with `Station.Meets` (eight fields) and `Station.ticket`
  - `Soft.denture`, and `Ship.banking := Station.affordable`
- **Contract A non-reachability [I].** Neither `YM.Next.RANK.Determinant` nor `YM.Next.RANK.StationMeter` transitively imports the module that defines any of the following, so neither theorem can reach them:
  - `SectorChange.committed` (`SectorNext/GAUSSIAN_SECTOR_CHANGE/Handoff.lean`)
  - `SectorAffine.assembly`
  - `Rain.glazing`
  - `Roost.Factor.worksNow`
  - `Fluctuations.grants`
  - `ConnectedActivityE6.Target.issue`
  - `Dyed.cardinal_spin` (`Opacity/Prism.lean`)
  - `Opacity/Shards.lean`

  This confirms finding 1 and the "no, in either direction" half of finding 2 that concerns `Rank.determinant`, by a sound argument independent of the compiled graph.
- **`Maxwell.Ranks` [S]** (`Euclid/Comparator.lean:135`): for every degree, `f : S.Field d ≃ₗ[ℂ] (freeTable L.grid).Field d` is a complex **linear equivalence** that intertwines `conj` and `mirror`. This settles the point the note left open ("the binder type was not printed").
- **Contract B [S].** These match the note: `Spec.Seed`, `Cells.RankWidths`, `Prayer.fence` (`StrideCost.lean:70`), `RankCovariance.window_prices` (`Window.lean:118`, uniform in the regulator and the group; `a b` are `Degree G`), `Soft.cast_off` and `Soft.wheeled`. `chaletrail` calls `reception` and outputs `Scrim … ∧ ∃ P b, Scotia …`.
- **Reach paths named in the note, checked call by call in the source [S]:**
  - `rated` (Powder.lean:65) → `wheeled` → `v_paid_factory` → `Wall.on_demand` → `Prayer.penalty` → `fence`
  - `wheeled` → `v_obtain_purchases` → `coupon` → `s_postage` → `denture` → `determinant`, with `v_obtain_purchases` calling `banking`
  - `readyA` → `shells_law` → `annular_fieldA` (twice) → `tenet`

  The edge `Tender` → `prepared` → `window_prices` is only partly traced.
- **Contract C [S].** These match the note:
  - `readyA` and `emanate` (statements and proofs; in `readyA`, `a` is a hierarchy on `Bel C.book`)
  - `DimAbove` and `cap_given`
  - `Climb.Pre`, `Table.Conserved` and `Table.StressLaws`
  - `Acme.Aroma` (fields `shells`, `opens`, `notes`)
  - `Org.UV` (all five fields)
  - `Climb.comparison : ActLaw P T J h a → Maxwell.Ranks S h`

  Note that `Table.RawTensor` is covariance under signed mirrors, not symmetry, despite the field name `symmetric`.

### Finding 5 of the note (which `Maxwell.Ranks` is used downstream): largely answered [S]

In `SharpGram.coordination` (`SharpGram/Common.lean:16–35`), the `Ranks` obtained from `uv_log`, and hence from `Accent.rated`, is bound but never used. Only the seed goes on to `emanate`. `Spec.Final` comes from `glistens`, and the `Spec.Locals.comparator : Maxwell.Ranks` it builds is `Climb.comparison H.weak`, inside `picks` (`Twist.lean:51`). In `Acme.xanadu` (`Summit.lean:32–37`) the `rated` output is only passed through to the conclusion. On these two public routes, then, the downstream `Ranks` is the one derived from the action law. The equivariant isomorphism in `rated`'s conclusion is not consumed; only `RankWidths` (the dimension bound) is. This supports the note's remark that PU-11 may need only the dimension count. It still has to be confirmed for the other `Ranks` consumers: `TraceExtension`, `RemainderComparison`, and whether `Spec.Final`/`Materializes` carries `Locals`.

## Open questions for the author (not errors)

- **Q1. Do the stress theorems really avoid PU-11/PU-12?** The note's ordering paragraph says PU-20b reaches only PU-20a and VI.2 [G]. But `YM.MergeProof.Emanate` transitively imports `West/Equity.lean` and `West/Tael.lean` [I], and these call `Soft.coupon` and `Ship.banking` (finding 7). By contrast, `West/Bravo`, `West/Blanca`, `West/Ozone` and `North/Economist` do not import those two files [I]. So the PU-20a anchors and `Aroma`'s producers cannot reach `tenderly`/`earnings`. `Powder.lean` (`rated`) does not import them either. Whether `readyA`/`emanate` reach `tenderly` or `earnings`, for instance through `Work.D06.answer`, `Stations.equivalences` or `produce_current`, I could not settle without the compiled graph. The note's [G] claim that neither reaches `Rank.determinant` should be rechecked against `Array.postage`, `tenderly` and `earnings` in particular.
- **Q2.** `rated` ↛ `Rain.glazing`/`Roost.Factor.worksNow`/`SectorChange.committed`: not refuted. The import graph clears most of `rated`'s direct callees: `Extraction.crops`, `include_projections`, `copy_down`, `Extra.FD.vane`, `Price.from_labels`, and the others in the B report. It also shows that `wheeled`/`cast_off` cannot reach `glazing` or `worksNow`. Paths through `MergeProof.bursts` (`SteamW.lean:54`), `Mark.thrush` (`Thrush.lean:72`) and the definitions in `rated`'s statement remain unchecked.
- **Q3. Notation, for #10.** `DimAbove` compares with `(Climb.Bel L).Field d`, with `Bel L = Spin.comparator L` (`Climb/Cells.lean:20`). `Maxwell.Ranks` compares with `(Maxwell.freeTable L.grid).Field d`. These are different tables. The step from `RankWidths` to `DimAbove` (`cap_given`), and any identification of the two free tables, should be stated explicitly in PU-11c/PU-20b.
- **Q4. V.3.** `readyA` has no caller outside `Emanate.lean`. `emanate` is called only by endpoint assemblies: `Summit.lean`, `SharpGram/Common.lean`, `TraceExtension/Made/World.lean`, `MultipleContact/*`, `UVExtension/*`, `RG08/Reports/Receipt.lean` and `RemainderComparison/Chron/Public.lean`. No source consumer was identifiable as V.3. This agrees with the note's obstruction 4.

## Required changes and remaining uncertainty

Required before canonical proof-unit issues use the split:

1. Correct the `Org.Commission.picks` statement and the VI.1 consumer (finding 1).
2. Add the missing hypotheses to `annular_fieldA`, `tenet`, `shells_law` and the PU-20a "Needs" column (finding 2), and to `rated`, `reception` and `castle` (findings 3 and 5). Correct `Scotia`'s quantifiers (finding 4) and the `uv_log` conclusion (finding 6).
3. Qualify the "one consumer" sentences and the handoff-table consumers of PU-12 (finding 7), and answer Q1 with the compiled graph.
4. Record that `Maxwell.Ranks` is a linear equivalence, and update finding 5 with the source evidence above.

Not checked by this review: any elaboration (**[E]**) or compiled-graph (**[G]**) claim by reproduction; theorem counts; the literature leads; the descriptions of proof ideas that the note takes from the external outline (as the note itself says); `Soft.Available`/`Soft.Kraft` and the other bundles in the note's obstruction 1. An independent reviewer with a built checkout should re-run the note's `#check`/`#print` list and the reference closures, particularly for Q1 and Q2.

## Acceptance

None. This is an agent-assisted review reporting changes requested. A responsible human reviewer must record any acceptance after the required changes are resolved, against a new content fingerprint.

## Commands run

```sh
sha256sum blueprint/interfaces/rank-determinant-stress.md            # a7477c98…2555
git show 6cda532:blueprint/interfaces/rank-determinant-stress.md | sha256sum   # same
python3 imports.py Lean/ imports.json   # parse import lines of 9,477 modules (scratch script, not committed)
python3 reach.py <module> <module>...   # transitive-import queries quoted above
rg -n '<declaration pattern>' Lean/YM  # locate declarations; sed -n of the cited line ranges
python3 scripts/check_blueprint.py      # Blueprint structure OK: 2 units.
python3 -m unittest discover -s tests   # Ran 22 tests, OK
git diff --check
```

Lean: `leanprover/lean4:v4.32.0` was installed from the official release tarball, and `lean --version` reports commit `8c9756b2…`. No `lake` command succeeded, because dependencies could not be fetched; no Lean file was elaborated.
