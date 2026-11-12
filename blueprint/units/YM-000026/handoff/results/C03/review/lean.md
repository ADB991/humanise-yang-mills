# Review of work package C03: Lean correspondence

- Unit: work package C03 "Full mesh, Euclidean phases and common field quotients" of unit YM-000026 (`blueprint/units/YM-000026/`), package document `handoff/C03.md`, author reports in `handoff/results/C03/`.
- Role: Lean correspondence.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: four Codex `gpt-6-astra` read-only review passes by chapter group (A: fullmesh-correlation-cauchy, limits, smooth-limits, fullmesh-fixedbounds-producer; B: phase-quantitative-producer; C: reflection, reflection-transport, phases, phase-selection; D: actual-slab-copy-bounds, slab-regularity, phase-regularity, phase-fields and the ledger), verified and synthesised by a Claude agent. Session `schmittj-codex-c03-review-20261112`.
- Content SHA-256: a package has no single unit fingerprint; the thirteen chapters and six author reports reviewed are listed with their SHA-256 in `mathematics.md` (same files, same hashes; recomputed unchanged at the end of the review, see `validation.md`). Evidence files read: `limits-evidence.md` `ba422a98549f58113b7833699beccda0c7eca5080d004078d15258b2078b1662`, `fullmesh-fixedbounds-producer-evidence.md` `3fe228c4014deec7ebd967be19ed7bb122903a8356be0b91e9a25e3c86f4bf7e`, `phase-quantitative-producer-evidence.md` `31e11dcc3068bcf955cdd7ae1e2ea47c8204fae2c22b476db520c6b1e51ea6f7` (all in `blueprint/units/YM-000026/`; none was changed by PR #69).
- Manuscript files and labels: the thirteen chapters of `manuscript/existence/` listed in `mathematics.md`, with the labels given there.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All Lean text quoted below was read from `Lean/` in the worktree; the forty-six files quoted or cited below match `Lean/SOURCES.sha256` (see `validation.md`).
- Review task and PR: issue #44; author draft PR #69, reviewed at its head `6fa64da` (`6fa64da98d307caccab7e625ca67ef6123af66a3`).
- Outcome: changes requested for `limits.tex` (L1), `phase-quantitative-producer.tex` (L5, L6, L8, L12), the author's `correspondence.md`, `findings.md` and `ledger.md` (L7, L10, L11), and the evidence files `limits-evidence.md`, `fullmesh-fixedbounds-producer-evidence.md` and `phase-quantitative-producer-evidence.md` (L2–L5, L12). For `fullmesh-correlation-cauchy.tex`, `smooth-limits.tex`, `fullmesh-fixedbounds-producer.tex`, `reflection.tex`, `phases.tex`, `actual-slab-copy-bounds.tex`, `slab-regularity.tex`, `phase-selection.tex`, `phase-regularity.tex`, `reflection-transport.tex` and `phase-fields.tex` no statement contradicting the pinned source was confirmed (wording points L9, L10, L12 apart); they are "accepted locally, conditional on stated dependencies" only in the sense of this agent review, which is a textual reading without elaboration. No human acceptance is recorded.

## Findings and evidence

Status vocabulary as in `mathematics.md`: CONFIRMED, REFINED, REJECTED, and "carried over" for reviewer findings not re-verified. Qualified names are read off the `namespace` blocks of the source files; nothing was elaborated, so implicit arguments, instances and universe levels were not inspected by Lean. "Audit record" means the evidence files, `correspondence.md`, `findings.md` and `ledger.md`, as opposed to the manuscript chapters. "PR #69" marks text introduced by the author's commit; "pre-existing" marks text the author's pass left unchanged.

Summary. All ten findings labelled ERROR by the agent reviewers were checked against the Lean text. Their factual content is correct in every case. Five are wrong qualified names or a wrong description in the audit record (L2, L3, L4, L5, L7); one is a false sentence in a manuscript remark introduced by PR #69 (L1, the same sentence as M1); one is an index mismatch in a conditional manuscript proposition (L6); two concern the cross-package edge E4, where the C03 author's diagnosis is right and only the proposed new producer is wrong (L11); one is the mathematical point M2 of `mathematics.md`. No manuscript theorem was found to assert more than the corresponding source declaration except `prop:ex-selected-interpolation`, whose listed hypotheses are weaker than those of the source theorem (L8).

### L1. `rem:ex-limits-fullmesh` misdescribes how the source builds the main hierarchy (A-II-1, labelled ERROR). Status: CONFIRMED; manuscript; introduced by PR #69.

Location: `limits.tex` lines 303–305: "The construction used for the main theorem does not take the first selection."

Lean text. `Lean/YM/FullVolume/Finale/Program.lean` (namespace `YM.FullVolume.Final`), lines 115–126:

```lean
/-- The Ordered smear readings already hold with full mesh followed by the
same per subsequence. Not asserting CellHyp etc on that order. -/
lemma from_spec (f : Extraction.Order) {S : Table R.family.book} (hv : Nonempty (Spec.Final R.family f S))
    (hp : PositionsUV R.family Extraction.Sequence.full) :
    (Extraction.Order.mk Extraction.Sequence.full f.per).Ordered R.family S := by
  obtain ⟨F⟩ := hv
  refine ⟨fun n v t => ?_⟩
  obtain ⟨ht,D,hD,hV⟩ := F.room.ordered.reads n v t
  refine ⟨ht,D,fun p h => ?_,hV⟩
  obtain ⟨g,hg,h₁,h'⟩ := hp p n v
  have hx := h₁ t h
  exact tendsto_nhds_unique (hx.comp (f.mesh.cofinal)) (hD p h) ▸ hx
```

and the end of the proof of the endpoint `july`, lines 163–164:

```lean
  obtain ⟨g,S,hS⟩ := (R.again h).2 f
  exact ⟨g,S,hS,from_spec (f.refine g) hS hP⟩
```

with `Order.refine f g = Order.mk (f.mesh.after g.mesh) (f.per.after g.per)` (`Lean/YM/Extraction/Orders.lean` line 40) and the field of `Jewel` (lines 136–138) `sampler : ∀ f, ∃ g S, Nonempty (Spec.Final R.family (f.refine g) S) ∧ (Order.mk Sequence.full (f.refine g).per).Ordered R.family S`.

Assessment. The source obtains the table `S` and the package `Spec.Final` along the refined order, whose mesh component is `f.mesh ∘ g.mesh`, a subsequence in general. Separately it has `PositionsUV R.family Sequence.full` (the full-mesh positioned limit at every period), and `from_spec` identifies the full-mesh row limit with the extracted row limit `D p` by `tendsto_nhds_unique` along the cofinal subsequence. So the source does take the mesh selection for the hierarchy and upgrades only the ordered smeared readings; its docstring says that the other order-dependent data ("CellHyp etc") are not asserted on the full-mesh order. The reviewer's reading is correct. The statement of the remark that the full-mesh limit exists at every period on \(\mathrm{NoHit}_p\) and needs no subsequence is faithful to `YM.FullVolume.PositionsUV` and `YM.FullVolume.positioned` (`Lean/YM/FullVolume/Profiles.lean` lines 25–47: `∀ p n v, ∃ f, ContDiffOn ℝ ∞ f (NoHit C.S p n) ∧ …`, from `FixedBounds C` and `Purchased C e`), and the contrast with `printed` (same file, lines 49–52, "Not full-sequence until Purchased on .full") is as the author's `correspondence.md` says.

Requested change: as in M1 of `mathematics.md`. Add to `correspondence.md` the declarations `YM.FullVolume.Final.from_spec` and `YM.FullVolume.Final.july` for the remark.

### L2. `YM.Extraction.Held.size_done` does not exist (A-II-2, labelled ERROR). Status: CONFIRMED as a wrong name; audit record; pre-existing.

Location: `limits-evidence.md` line 26 (twice: "`YM.Extraction.Held.size_done`" and "`Held.size_done` derives `Bound`").

Lean text. `Lean/YM/Extraction/Held.lean`: line 15 `namespace YM.Extraction`, line 19 `namespace Around`, line 120 `lemma size_done (H : C.Makes) (he : CenteredBook C f) : Bound C f := by`, line 133 `end Around`; line 137 uses `Around.size_done`. The file name `Held` is not a namespace. The correct name is `YM.Extraction.Around.size_done`; `centered-estimates-evidence.md` line 36 already cites it correctly. The described type (from `C.Makes` and `CenteredBook C f` to `Bound C f`) matches.

### L3. The endpoint is `YM.FullVolume.Final.july`, not `YM.FullVolume.Final.Jewel.july` (A-II-3, labelled ERROR). Status: CONFIRMED as a wrong name; audit record; pre-existing.

Location: `fullmesh-fixedbounds-producer-evidence.md` line 23.

Lean text. `Program.lean` line 47 `namespace YM.FullVolume.Final`; line 154 `theorem july (h : G.Simple) (δ : ℝ) (hd : 0 < δ) : ∃ (R : Run G) (T : Campaign R) (W : Pillars R T), R.family.path.levels.clock.kernel.penalty = δ ∧ Jewel R T W`; `namespace Jewel` opens at line 167, after the theorem. `phase-quantitative-producer-evidence.md` line 6 has the correct name.

### L4. Six qualified names in `phase-quantitative-producer-evidence.md` are wrong (B-II-1, labelled ERROR). Status: CONFIRMED as wrong names; audit record; pre-existing.

Each file below has a single `namespace` line, checked by `grep`; the evidence treats the file name as a namespace component.

| Evidence (line) | Declaration in the source |
| --- | --- |
| `YM.MergeProof.Renaissance.repriseQ` (127, 143) | `YM.MergeProof.repriseQ`, `Lean/YM/MergeProof/Renaissance.lean` l.20 (`namespace YM.MergeProof`), l.39 |
| `YM.MergeProof.Meringue.single` (169) | `YM.MergeProof.single`, `Meringue.lean` l.6, l.32 |
| `YM.MergeProof.Sonata.coupons` (171) | `YM.MergeProof.coupons`, `Sonata.lean` l.6, l.56 |
| `YM.MergeProof.Largo.compose` (182) | `YM.MergeProof.compose`, `Largo.lean` l.5, l.22 |
| "`residual_bill` in `YM.Extra.Histories.Motion`" (157–158) | `YM.Extra.Histories.residual_bill`, `Lean/YM/Extra/SOURCE_HISTORIES/Replay.lean` l.18, l.83 |
| `YM.FullVolume.Campaign.realUV` (301) | `YM.PhysicalNext.Repeat.Legato.Campaign.realUV`, `Lean/YM/FullVolume/Fields/Filled.lean` l.4, l.19, l.45 |

The same evidence file cites `YM.PhysicalNext.Repeat.Legato.Campaign.sees` correctly at its step 1. No manuscript statement depends on these names.

### L5. The evidence calls `R.t` the "growth"; the cutoff map in the public caller is the identity (B-II-2, labelled ERROR). Status: CONFIRMED; audit record (pre-existing); the corresponding omission in the manuscript is M4.

Location: `phase-quantitative-producer-evidence.md` lines 264–266: "fixes one `R`, campaign `T`, winter `H`, pillars `W`, growth `R.t`, and transfer tables `R.stories`."

Lean text. `Lean/YM/FullVolume/Fields/Filled.lean` lines 30–37 (namespace `YM.PhysicalNext.Repeat.Legato.Campaign`):

```lean
lemma sees (p n:ℕ) (v:Fin n → R.family.book.Token)(x:Points n)(hv:Eves.ancestor R.family.S x)(hx:x∈ NoHit R.family.S p n)(he:Jams.Wild R.kit.shape R.alloy.delay): CauchySeq fun i=> FullVolume.evaluate R.family Extraction.Sequence.full p v [] i x:=by
    let h:= T.gains.SimpleR; have hi:= R.again h|>.1.scrim
    let HH:Rising R.kit (fun _=>R.T.history) id p 0:=⟨…⟩
    let t:=R.t; …
    have hp(d:ℕ):Rising.Tenable R.b HH (…) R.tuning.receipts d R.t := …
    …
    have hZ:= HH.cinema h R.b («D»:=fun i=>R.doors) (ψ:=R.t) …
```

with `structure Rising (X:Factor A) (q:ℕ→ℕ→∀ p,Shoot.Trail A.B.a p)(f:ℕ→ℕ)(p:ℕ)(k:ℕ)` and `structure Tenable (d':ℕ) (ψ:ℕ→ℕ):Prop where height : k ≤ ψ d' …` (`Lean/YM/FullVolume/Fields/Capital.lean` lines 19 and 44), and the conclusion of `Rising.cinema` (`Seat.lean` line 38) `CauchySeq fun i=> (C' i).numeric (f i) p (fun k=>⟨v k,z k⟩) (o (f i))`.

Assessment. In `sees` the history family is the constant `fun _ => R.T.history` and the cutoff map `f` is `id`; hence the conclusion is Cauchy convergence of `evaluate R.family Sequence.full p v [] i x` in the cutoff `i` itself. `R.t` is passed as `ψ`, a function of the grade that enters `Tenable` as a per-grade reference depth (`k ≤ ψ d'`, `ψ d' ≤ f n`); it is not the cutoff growth map. The author's `correspondence.md` row for `Rising.cinema` ("CauchySeq of `numeric (f i) p … (o (f i))` along the run index") describes the generic lemma correctly and does not record the specialisation either.

Requested change: in the evidence and in `correspondence.md` record `f = id`, the constant history `R.T.history`, and `ψ = R.t` as the grade-dependent reference depth; in the manuscript, M4.

### L6. `prop:ex-public-origin`: the support and root test are those of the station block, not of the block of depth \(m\) (B-II-3, labelled ERROR). Status: REFINED; manuscript; pre-existing.

Location: `phase-quantitative-producer.tex` lines 88–89 ("a block depth \(m\), a station \(J\le N\)"), 102–104 ("back to the block of depth \(m\) preserves its support inside the block"), 105–106, 114–115 ("supported in the centered block").

Lean text. `Lean/YM/MergeProof/South/Dine.lean` line 53 (namespace `YM.MergeProof.Accent`):

```lean
lemma dine (hV : Stock.Tabs.opens C.path.levels 1 J m)(hK : ℓ ≤ m)(hk : m≤k)(hw:0<w)(hc:GridApprox.room C.path.levels J k (lensScope C d))(ht:w*‖alto T m d‖*(4*(1+(T|>.levels.params k).columns)/gainChart T k m) ≤ ζ d m/2) : ∃ A:ℝ,0 ≤ A∧∀ N p,k<N → ∀ hf:J ≤ N,(∀ (v:C.label d), Interior ((center C.S p hf 0).chamber 0) (C.O N p v 0)) → ∃ B:Config G (C.side N p)→ℂ,(∀ U, ‖B U‖ ≤ A) ∧ Interior ((center C.S p hf 0).chamber 0) B∧(center C.S p hf 0).rootTest (C.beta N p) (B - C.O N p L 0) ≤ stockK C k d L * (stakes C J m/w)
```

with `def opens (i j : ℕ) := i≤j ∧ s*(a.clock.coverSize j:ℝ)^(2:ℕ) ≤ a.S.a i/a.S.a j` (`Lean/YM/Overlay/Prior.lean` line 23), `lemma trueLength … (h : m ≤ N) (o) : S.a N * (center S p h o).side.val = S.a m` (`Lean/YM/Cells/Packing.lean` lines 42–43), and `def stakes (m k:ℕ):=Real.exp ((C.S.a m/C.S.a k)^(4:ℕ)*Vac.treasury C.path.levels k+5)` (`Lean/YM/MergeProof/Strudel.lean` line 21). In the proof the approximants `lens C N k p d …` live at depth \(k\) and are transported to the cutoff by `backTo T N p hN.le`; their window is enlarged to the chamber by `room_fits … hc`.

Assessment. The indices satisfy \(J\le m\le k<N\). The output chamber and the root test are those of the centred tiling built with `hf : J ≤ N`, of physical side \(a_J\) by `trueLength`; \(m\) enters only through the opening condition `opens 1 J m`, the scale inequality and the error \(S_{J,m}=\) `stakes C J m`. The manuscript has the error term and the scale inequality with the right indices, and the conclusion "supported in the centered block" is unspecific, but lines 88 and 102–104 attach the block to depth \(m\). Since \(a_m\le a_J\), support in a block of depth \(m\) would be a stronger statement than the one the source proves; and the transport is from depth \(k\) to the cutoff lattice, not "back to the block of depth \(m\)". The proposition is conditional on its items, so it is not false; but item 3 as worded is not what the source supplies. The reviewer's statement of the facts is correct; I classify it as a correspondence inaccuracy in a conditional statement rather than an error of the proposition.

Requested change: call \(J\) the depth of the centred station block that carries the support and the root test, and \(m\) the opened intermediate depth; describe the transport as from the fine depth \(k\) to the cutoff; and add the supremum bound (M5).

### L7. `YM.Table.RealSpin.adj` does not exist; the declaration is `YM.Table.adj` (C-II-1, labelled ERROR). Status: CONFIRMED as a wrong name; audit record; introduced by PR #69.

Location: `results/C03/correspondence.md` line 18 ("descended `YM.Table.RealSpin.adj`, `mirror_star`, `reflect_twice`"); `results/C03/findings.md` lines 39–40.

Lean text. `Lean/YM/Euclid/Null.lean`: line 17 `namespace YM`, line 28 `namespace Table`, line 111 `section RealSpin`, line 112 `variable (H : S.RealSpin)`, line 172 `end RealSpin`; lines 165–166:

```lean
def adj (d : ℕ) (a : Axis) : S.Field d →ₛₗ[starRingEnd ℂ] S.Field d :=
  (S.mirror H d (Signed.mirror a)).comp (S.conj H d)
```

`RealSpin` is a section with a hypothesis `H : S.RealSpin`, not a namespace. The declarations are `YM.Table.adj`, `YM.Table.mirror_star` (lines 158–160) and `YM.Table.reflect_twice` (lines 170–171), each with the explicit argument `H`.

The mathematical correspondence stated in the same row is correct. `Lean/YM/Euclid/Register.lean` (namespace `YM.Register`) lines 67–74:

```lean
@[simp] theorem star_mirror (s : Signed) (d : ℕ) (v : L.Ref d) :
    star (L.mirrorGroup d s v) = L.mirrorGroup d s (star v) := by …

def adj (d : ℕ) (a : Axis) : L.Ref d →ₛₗ[starRingEnd ℂ] L.Ref d :=
  (L.mirrorGroup d (Signed.mirror a)).comp (L.bar d)
```

So \(Jv=R_\rho\overline v\) with \(\rho\) the mirror of the chosen axis, and conjugation commutes with every signed transformation `s`, as the manuscript now says in words. `YM.Register.reflected` (lines 79–84, \(J^2=1\)) is proved with `star_mirror`; this is the use of the commutation, in agreement with M2.

### L8. `prop:ex-selected-interpolation` lists fewer hypotheses than `YM.MergeProof.repriseQ` uses (B-II-4, labelled GAP). Status: CONFIRMED; manuscript; pre-existing.

Lean text. `Lean/YM/Extra/SOURCE_HISTORIES/Replay.lean` lines 32–43:

```lean
structure Heard (m : ℕ) (V : Voice F H p m) : Prop where
  book : Ledger F _ V.plays
  earns v : (V.plays v).Format 0 A (H.rep N p m) ∧ (V.plays v).remBound 0 (H.rep N p m)
    (Real.sqrt (H.levels.clock.forcedAllowance m)) (V.charge v)
  currents v : (V.plays v).x = V.index v
  cone v : V.charge v ≤ (H.levels.params m).columns * F.coeffSize (F.core (V.index v))
  summed i j : V.charge (i+j)≤V.charge i+V.charge j
  moves v y : Motion.patch F y (V.index v)=V.index (Motion.patch F y v)
  unit : V.index (unitVec F H N) = unitVec F H m
  values : IsLinearMap ℂ (fun v => (V.plays v).density 0 B (H.rep N p m))
  travels v y : dance y ((V.plays v).density 0 B (H.rep N p m))=
    (V.plays (Motion.patch F y v)).density 0 B (H.rep N p m)
```

with `structure Ledger … where x : IsLinearMap ℂ fun v => (P v).x; reg : IsLinearMap ℂ fun v => (P v).regular; f : IsLinearMap ℂ fun v => (P v).forced; tags v : (P v).support = (P 0).support` (`Pencil.lean` lines 83–87). In `Lean/YM/MergeProof/Renaissance.lean`, `repriseQ` takes `hq : Heard B H N p A (m+1) V` (line 41), and its proof uses `hq.moves` at lines 126, 184, 201 and 214, `hq.unit` at line 204, and `hq.book` at lines 225 and 231 (`expoLinear … hq.book …`, `inkL V.plays V.charge hq.book …`).

Assessment. The manuscript's "heard identities" (lines 331–335) correspond to `currents`, `values`, `travels` and `cone`; `earns` appears at lines 394–396. The fields `moves`, `unit` and `book` are not stated, and the proof needs them (M3). `summed` is also not stated; I did not check where it is used. The conclusion of `repriseQ` (`Heard … m Q ∧ Responds … ∧ Chorus … ∧ ∃ Y, Y.Finite ∧ ∀ v, Tale Y 0 0 ((L.val:ℂ)^d) …` with budgets `(orbitCost F*F.coeffSize Z)*(t+2*columns)` and `Q.charge v`) agrees with items 1–5 as far as compared.

### L9. Full-mesh bounds: the statement as repaired matches the source; the budget quantifiers and the filter are explicit in the source (A-I-1, A-I-3, A-I-4; author's F1). Status: correspondence of the repaired statement CONFIRMED.

Lean text. `Lean/YM/FullVolume/Discrete.lean` lines 50–52 and `Cohort.lean` line 37 (namespace `YM.FullVolume`):

```lean
structure FixedBounds (C : Family G) : Prop where
    bounds (n : ℕ) (v : Fin n→ C.book.Token)(l:List (MotionIndex n))(r:ℝ) : 0<r→ ∃ B:ℝ, 0≤B ∧
      ∀ᶠ N in atTop, ∀ p:ℕ,∀ x:Positions n, spaceout C r (N,p) (wrap (C.side N p) ∘ x) → ‖gKernel C v l N p x‖ ≤ B

def spaceout (C : Family G)(r : ℝ)(i:Cutoffs)(x : Fin m→ Site (C.side i.1 i.2)) := ∀ u v:Fin m, u≠v → r ≤ C.S.a i.1 * separation (x u) (x v)
```

`Lean/YM/Lattice/Site.lean` (namespace `YM.Lattice`) lines 51 and 78–81: `def lift (x : Site n) : Cover := fun i => ZMod.valMinAbs (x i)`, `def pdist (x : Site n) := Finset.univ.sup fun i : Axis => (lift x i).natAbs`, `def separation (x y : Site n) := pdist (x-y)`. `Lean/YM/Cells/Proximity.lean` lines 69–70: `lemma extent {v : T.Cell} {x y : Site n} (hx : x∈T.chamber v) (hy : y∈T.chamber v) : separation x y ≤ T.side.val`.

Assessment of the author's repair. The quantifier order (fixed \(n,v,l,r\); one \(B\); eventually in \(N\); every \(p\); every position tuple) and the hypothesis \(r\le a_N\cdot\operatorname{separation}\) for every pair of distinct slot indices are exactly the repaired statement; `separation` is the maximum over the four axes of the absolute value of the minimal-absolute-value representative of the coordinate difference, that is the periodic \(\ell^\infty\) distance. The injectivity step in `cohort` (lines 54–58) is the manuscript's: `X.extent` gives `separation ≤ T.side`, and `a_N * T.side = a_l < r` contradicts `spaceout`. F1 is verified. Positions are integer (`Positions n`, wrapped to sites), which supports M9(b).

For M6 and M8. `Lean/YM/FullVolume/Rent.lean` lines 16–22 and `Sluggish.lean` line 13:

```lean
/-- Same stencil and at **every** sufficiently fine fixed centered scale
and cutoff beyond it (in the strong `mesh` sense: eventually in N for
all p). -/
def Affords (F : Trial C) (u : ℕ → Cutoffs → ℝ) :=
    Stencil F ∧ ∀ᶠ m in atTop, ∀ᶠ i in mesh, ∃ h : m ≤ i.1,
      Interior ((center C.S i.2 h 0).chamber 0) (F i.1 i.2 0) ∧
        (center C.S i.2 h 0).rootTest (C.beta i.1 i.2) (F i.1 i.2 0) ≤ u m i

def mesh : Filter Cutoffs := comap Prod.fst atTop
```

and `cohort` (line 39–41) concludes `∀ᶠ k in atTop, ∀ᶠ i in mesh, ∀ z, spaceout C r i z → ‖word F i z‖ ≤ ∏ j,u j k i`: it chooses `l` with `a l < r`, then intersects the tail in `k` where `m*(2*(3*a k)) < a l`, the budget tails and `k ≥ l`, and passes from the fine centred tile to the coarse cell by `staff` (lines 17–21) before `planted`. This is the order requested in M6, and `mesh` is the filter requested in M8.

### L10. The exact-cutoff convergence is a separate hypothesis in the source (C-II-2, labelled GAP). Status: CONFIRMED; manuscript application and audit record; pre-existing in the chapter, the ledger row is new.

Lean text. `Lean/YM/Phase/Approx.lean` (namespace `YM.OS.Grid`) lines 71–79:

```lean
structure Works (f : Extraction.Order) : Prop where
  controls k t j : f.late fun N p => Measurable (P.plots k N p t j) ∧ ∀ q, |P.plots k N p t j q| ≤ P.reserve k
  fillings (k i j) : i < j → ∀ᶠ t : ℕ in atTop, f.late fun N p =>
    |(∫ q,P.plots k N p t i q * P.plots k N p t j q∂law G _ (C.beta N p))-bill h v x i j N p t| ≤ P.small k

/-- Continuum API. Needed separately to use Covering; generic all projections. -/
def Expects := ∀ i j : ℕ, i<j → ∀ᶠ t : ℕ in atTop,
    Tendsto (fun u : ℕ × ℕ => bill h v x i j u.1 u.2 t) f.fuse (𝓝 (event (S:=S) h v x t i j))
```

`Lean/YM/Phase/Square.lean` lines 86–88: `lemma Covering.square … (W : Covering h v x) (he : W.Works h v x f) (H : Steady V) (Y : S.Hierarchy) (hx : Expects (S:=S) (f:=f) h v x) : 0 ≤ answer P (Tag h v x) p`. `Lean/YM/Bid/Phase.lean` line 62: `def B04 : Prop := ∀ … , C.Makes → S.Hierarchy → F.PointLimits C S → Grid.plain (C:=C) v → Order.grid C k w∈generic n → Grid.Expects (S:=S) (f:=F) k v w`, and `B05 : Prop := B04 → …`.

Assessment. The lemma `ex-replicated-positivity` has both hypotheses (the approximants, and \(b_{\mathrm{cut},t}\to b_t\)), like `Covering.square` (`Works` and `Expects`). The application paragraph and the ledger row I-C12-grid name only the first. The second is `YM.OS.Grid.Expects`, obtained in the source from `PointLimits` of the same family, order and table through `YM.Bid.B04`. Requested change: M7; add `YM.OS.Grid.Covering.Works`, `YM.OS.Grid.Expects` and `YM.Bid.B04` to the correspondence. I did not open the proof file `Lean/YM/Work/B04.lean`; the reviewer's description of it is carried over.

### L11. The Lean declarations behind the field-level edge E4 (A-II-4 and D-II-3 labelled ERROR; C-II-3 labelled GAP). Status: facts CONFIRMED; cross-package; the misattribution is in the C04 ledger, the insufficient redirection and the unqualified "matches" are in the C03 ledger (PR #69).

Grade-wise quotient. `Lean/YM/Euclid/Null.lean` (namespace `YM.Table`), lines 31–34 and 74–75:

```lean
def replies (d) : L.Ref d →ₗ[ℂ] Exterior L → ℂ :=
  LinearMap.pi fun v => S.injectFront v.letter v.point d

def null (d : ℕ) := LinearMap.ker (S.replies d)

abbrev Field (d : ℕ) := L.Ref d ⧸ S.null d
abbrev project (d : ℕ) := (S.null d).mkQ
```

with `example (d) : FiniteDimensional ℂ (S.Field d) := inferInstance` (line 82). `Lean/YM/Euclid/Lift.lean` (namespace `YM.Table`) line 20: `def respects (T S : Table L) : Prop := ∀ d, S.null d ≤ T.null d`, with `agrees` (line 22: under `T.Symmetric` and `T.respects S`, `T.value d x v = T.value d x w` when the labels have equal `S`-classes) and `classMoment` (line 58). These are the objects of `ex-phase-original-null` (`respects`) and of `ex-no-new-null`, whose source is `YM.Extraction.Retain.lift_detect` (`Lean/YM/Phase/Picks.lean` line 128): `… (hD : D.Symmetric) (hp : D.respects S) : D.null d=S.null d`, a statement at one fixed `d`.

Inclusions and union. `Lean/YM/Euclid/Differential.lean` (namespace `YM`, then `DiffPlan`), lines 20–22 and 58–60:

```lean
structure DiffPlan (S : Table L) where
  rise {d e : ℕ} (h : d ≤ e) : S.Field d →ₗ[ℂ] S.Field e
  deriv (d : ℕ) (a : Axis) : S.Field d →ₗ[ℂ] S.Field (d+1)

structure Inclusions : Prop where
  kernels {d e : ℕ} (h : d ≤ e) (B : S.Field d) {n : ℕ} {x : Points (n+1)} (hx : x ∈ conf (n+1)) (w : Fin n → S.Tag) :
    S.useAt T x (Fin.cons ⟨e,P.rise h B⟩ w) = S.useAt T x (Fin.cons ⟨d,B⟩ w)
```

Under `(h : S.Symmetric) (hm : P.Inclusions S)` the file proves `through_limit`, `inject : Injective (P.rise H)`, `transit : P.rise J (P.rise H p) = P.rise (H.trans J) p` and `arrival : P.rise le_rfl p = p` (lines 78–92). `Lean/YM/Euclid/Union.lean` lines 23–30 define `YM.Table.observations := ⨆ d, LinearMap.range (S.spectra d)`, `YM.Table.Union := ↥S.observations`, `pin d : S.Field d →ₗ[ℂ] S.Union` and prove `pin_inj`; under the same two hypotheses it proves `YM.DiffPlan.stays` (`S.pin e (P.rise h p) = S.pin d p`), `covered` (every element of the union is `S.pin n x`), `joint` (finitely many elements have a common level) and `uniqueLift` (the universal property), lines 37–63. The inclusion maps are thus data of a `DiffPlan`, and all directed-system statements are conditional on `Inclusions`.

Producer in the source. `Lean/YM/Dash/Inert.lean` (namespace `YM.Dash`) lines 63–71:

```lean
structure MonitorOps (C : Family G) where
  keep {d e : ℕ} : d≤e → C.label d→ₗ[ℂ] C.label e
  tilt (d : ℕ) (a : Axis) : C.label d→ₗ[ℂ] C.label (d+1)

structure MonitorOps.Wakes (Y : MonitorOps C) (S : Table C.book) (h : Live S) : Prop where
  keep d e (hx : d≤e) (p : C.label d) (i : Shot C.book) : i.core S h (Y.keep hx p)=i.core S h p
  tilt d a (p : C.label d) (i : Shot C.book) : i.core S h (Y.tilt d a p)=-(pushT i a).core S h p

lemma lifts_model (h : Live S) (H : f.Ordered C S) (P : Bin S) (hm : Spans h P f) : ∃ Y : MonitorOps C, Y.Wakes S h
```

and `Lean/YM/Dash/Quot.lean` (namespace `YM.Dash.MonitorOps`) line 76 `def descends (H : Live S) (h : Y.Wakes S H) (s : S.Smooth) (hp : S.Symmetric) : DiffPlan S` (the raw maps `keep`, `tilt` descended through `S.null`), line 91 `lemma readies … : (Y.descends H h s hp).Inclusions S`, line 106 `lemma tilts … : (Y.descends H h s hp).Derivatives S`. They are used in `Lean/YM/Org/Input.lean` lines 101–109 (`YM.Org.Arrives.serves : ∃ T : Table C.book, ∃ W : DiffPlan T, Cleaner S P T W F`). I found this producer by searching for constructions of `DiffPlan`; I did not trace it to the public endpoint, and I did not check whether it is the only one. The hypothesis `Spans` of `lifts_model` (fields `p`, `q`: exact dimension; `r`, `t`: "same terminal cylinder approximant across EVERY spectator" for inclusion and derivative) is the source counterpart of the comparison inputs of C14 `actual-insertion-derivative-relay.tex` and `finite-rank-kernel-transport.tex` (`finite-rank-kernel-transport-evidence.md` line 16 cites `YM.Dash.Bin.quiet`, `exactC`). No evidence file in `blueprint/units/YM-000026/` cites `lifts_model`, `MonitorOps.descends`, `readies`, `DiffPlan.inject`, `covered` or `uniqueLift` (search in `validation.md`).

The reflected conjugate on the union (C-II-3). `Lean/YM/Fields/Star.lean` (namespace `YM.Boundary`) lines 42–46:

```lean
def starRead (j : StarOp S) (h : S.RealSpin) : Prop := ∀ d v,
    j (S.pin d v) = S.pin d (S.adj h d timeAxis v)

theorem calibrate {P : DiffPlan S} (hp : S.Symmetric) (he : P.Inclusions S) (h : S.RealSpin) (hy : P.Orientation h) :
    starRead (P.unionAdj hp he timeAxis h hy) h := …
```

`starRead` is a predicate on a given operator of the union; the operator `unionAdj` exists under `Inclusions` and `Orientation` (whose fields `realInc`, `mirrorInc` are the compatibility of conjugation and signed actions with `rise`, `Differential.lean` lines 66–70). So the row of `correspondence.md` "the same J as above, supporting edge C03-to-C04-reflection-J" and the ledger's "**matches**" are right as a formula at each fixed grade and do not cover the clause "compatible with inclusions" of the C04 edge.

Requested change: in both ledgers record E4 as in M12; in the C03 ledger qualify E3 and reflection-J as fixed-grade matches; give the declarations above their own correspondence entries with the package that owns their manuscript statement, once such a statement exists.

### L12. Smaller correspondence points

- D-II-1 (labelled INACCURACY), `actual-slab-copy-bounds.tex` line 48. Status: CONFIRMED on the facts, wording only (M11). `YM.Register.bar` is `star` (`Register.lean` lines 30–33); `YM.Register.adj` is `mirrorGroup (Signed.mirror a) ∘ bar`. The bounded-family lemma `mirror_ball` (`Lean/YM/Next/PHASE/Seats.lean` lines 22–35, private, docstring "not assuming orthonormal action for the raw coefficient norm") bounds `mirrorGroup d s v` by the operator norm and then, for the conjugated member, uses `change ‖star (L.mirrorGroup d s v)‖ ≤ _; rw [norm_star]`. So the isometry used is that of `star`.
- D-II-2 (labelled INACCURACY), `phase-fields.tex` lines 102–107. Status: CONFIRMED (M10). `Lean/YM/Phase/Picks.lean` lines 18–20: `def probe' (k : ℕ) (i : Fin X.amount) : D.Field d →ₗ[ℂ] ℂ := Ward.here (x := Y.realPlace k i) (q := Fin.cons ⟨d,(0:D.Field d)⟩ (fun s => ⟨d,D.project _ (Y.later k ((X.row i).uses s))⟩)) 0 d`: the exterior labels `Y.later k …` depend on `k`. `Lean/YM/Cells/Corrected.lean` line 59 `zoom : Tendsto scale atTop (𝓝 0)` and line 73 `def tested (k : ℕ) (i) := (Z.scale k)⁻¹ • Z.realPlace k i`; `Picks.lean` line 45 `lemma limits (i c) : Tendsto (fun k => (standard C).useAt (standard C) (Y.tested k i) (testFns (X := X) i c)) atTop (𝓝 ((X.row i).tests (standard C) X.basis (X.basis c)))`: the limit is for the free table at the rescaled configurations.
- B-II-5 (labelled INACCURACY). Status: CONFIRMED. `Lean/YM/Extra/SOURCE_HISTORIES/Play.lean` lines 44–45: `def blast (f : …) := ((H.S.block m).val:ℂ)^d • (H.levels.clock.op m p).push (H.β N p (m+1)) f`; `Lean/YM/Source/Insertion.lean` line 82: `def unitVec (F : Frame G d) (H : RG.History G) (m : ℕ) := ((H.S.a m : ℂ)^d) • F.e0`. The exponent is the grade `d` of the frame.
- B-II-6 (labelled INACCURACY). Status: CONFIRMED. `Lean/YM/MergeProof/Wallet.lean` lines 29–30, field `forced` of `Stampede`: `f≠0 → A (.gasKey j)→ SlotFit Old 0 j f→ 0≤x → (∀ U,‖f U‖≤x) → Coupon …` with budgets `w*(u / Real.sqrt (H.levels.clock.forcedAllowance (i+1)))` twice and `2*u`. The condition is on the insertion function `f`, there is no hypothesis `j ≠ 0`.
- B-II-7 (labelled INACCURACY), three items in `phase-quantitative-producer-evidence.md`. Status: CONFIRMED for two, partly for one. (i) Line 297: `YM.FullVolume.circulating` is in `Lean/YM/FullVolume/Tuned.lean` line 38, not `Region.lean`. (ii) Lines 234–235: `PaidAtom` does not occur in `Renaissance.lean` (`grep -c` gives 0); `repriseQ` derives the all-motion lead bound at line 100 by `(patch_cost _ _ _).trans (h₀ _).leadP`. (iii) Lines 6–8, "constructs `Jewel` through `jewelOf17`": the proof body of `july` (lines 156–164) builds the `Jewel` record directly and does not mention `jewelOf17`, which is declared in `Lean/YM/RG17/Joint.lean` line 102; I did not open `Campaign.operaShip`, so whether `jewelOf17` enters indirectly was not checked.
- A-II-5 (labelled INACCURACY), `fullmesh-fixedbounds-producer-evidence.md` lines 35–39 ("The row has bounded coefficient cost because the scalar is at most one and the projected row has norm at most one"). Carried over, partly checked: `YM.FullVolume.Coin` is a growth class (`Sluggish`, `Sluggish.lean` lines 146–147), and the evidence sentence does describe membership of the remainder row as "bounded coefficient cost"; the manuscript (lines 86–90) makes the correct distinction. `Moneys.lean` was not opened.
- Author's F3a and `QRead`. `Lean/YM/OS/Train.lean` lines 70–71: `def QRead (A : ℝ) (h : Slab a d w) := ∀ v : Future L a, ∃ B : ℝ, ∀ n : ℕ, ‖S.gram a (ride h v n).val (ride h v n).val‖ ≤ B*A^(4*n)`: for each exterior word one constant, uniform in the repetition count, as in `ex-train-input` and in the author's edit.

### Per-chapter table

| Chapter | Declarations compared in this synthesis | Result | Carried over from the agent reviewer, not re-verified |
| --- | --- | --- | --- |
| fullmesh-correlation-cauchy | `Campaign.sees`, `purchased`, `realUV` (`Filled.lean`), `Rising`, `Tenable`, statement of `Rising.cinema` | Consistent with the chapter's own statement (cutoff \(N\) itself, one history) | Reviewer A's matches for `Accent.Retain.waft`, `Sever.touch`, `Confluence.laven`, `Rising.grow`, `hail`, `creditP`, `arrives`, `absolute`; `Eves.price`, `positions` (author) |
| limits | `PositionsUV`, `positioned`, `printed`, `from_spec`, `july`, `Jewel.sampler`, `Order.refine`, `Order.late`, `Ordered` | L1; otherwise consistent | `Order.limits`, `localAscoli`, `first_surface`, `realPositive`, `assembles` (reviewer A); L2 concerns the evidence only |
| smooth-limits | none | not checked in synthesis | Reviewer A: valid abstract reorganisation of `FixedBounds.confines`, `localLip`, `taylor`, `established`, `reachable` |
| fullmesh-fixedbounds-producer | `FixedBounds`, `spaceout`, `cohort`, `staff` (statement), `Affords`, `mesh`, `pdist`, `separation`, `Tiling.extent` | Repaired statement matches (L9) | `cap`, `improved`, `funding`, `genuine`, `actuate`, `Coin` closure (reviewer A) |
| phase-quantitative-producer | `dine`, `opens`, `center`, `trueLength`, `stakes`, `backTo_bound`; `Voice`, `Heard`, `Ledger`, `repriseQ` (statement and uses of `hq`), `Stampede.forced`, `blast`, `unitVec`; `sees` | L5, L6, L8, L12 | Finite-grid producers, `cone_step`, the Cauchy chain `Sever`–`Seat`, `growFrom` (reviewer B) |
| reflection | none | not checked in synthesis | Reviewer C's matches in `RPPeak`, `Caps`, `Schwinger`, `Kolmogorov`, `Flow`, `Dynamics` |
| phases | `QRead` | consistent | Reviewer C's matches in `OS/Core`, `OS/Train`, `OS/Slabs`, `Ground/*` |
| actual-slab-copy-bounds | `mirror_ball`, `Register.bar`, `Register.adj`, `QRead` | wording (L12, M11) | `CellHyp.centered`, `rates`, `replicas`, `seats`, `Roots`, `Passage`, `Trains`, `Halves` (reviewer D) |
| slab-regularity | `DiffPlan.Derivatives` (statement), `MonitorOps.tilts` (statement) | open input identified (L11) | `B02.norm_remainder`, `smooth_place`, `B12` (reviewer D) |
| phase-selection | none | not checked in synthesis | Reviewer C: `Ground/Spectrum`, `Phase/Mixture`, `Phase/Unique` (quantifier order at `Unique.lean` 91–94) |
| phase-regularity | `Table.null`, `Field`, `respects`, `agrees` | consistent with `ex-phase-original-null` | `B03`, `B07`, `B08`, `B10`, `B11`, `B13` (reviewer D) |
| reflection-transport | `Register.adj`, `star_mirror`, `reflected`, `Table.adj`, `Works`, `Expects`, `Covering.square` (statement), `B04`, `B05` (statements) | L7 (name), L10 | `B05.answer`, `B06.answer` proofs (reviewer C) |
| phase-fields | `probe'`, `limits`, `lift_detect` (statement), `Trials.zoom`, `tested` | L12 (application wording); proposition matches `lift_detect` | `Detect.lean` (`Tall`, `bit`, `Funds`, `one_near`, `pair_near`), `result`, `converge` (reviewer D) |

## Required changes and remaining uncertainty

Required:

1. `limits.tex` lines 303–305 (L1, M1).
2. `phase-quantitative-producer.tex`: hypotheses of `prop:ex-selected-interpolation` (L8, M3); block index and transport in `prop:ex-public-origin` (L6, M5); specialisation in `ex-public-same-run-cauchy` (L5, M4).
3. `results/C03/correspondence.md` and `findings.md`: `YM.Table.adj`, `YM.Table.mirror_star`, `YM.Table.reflect_twice` with the hypothesis `S.RealSpin` (L7); add `from_spec` and `july` for the remark (L1), `Works`, `Expects`, `B04` (L10); record `f = id` and `ψ = R.t` for `sees` (L5).
4. Evidence files: `YM.Extraction.Around.size_done` (L2); `YM.FullVolume.Final.july` (L3); the six names of L4; the three items of B-II-7 and the wording of A-II-5 (L12). These files are shared, pre-existing records; whether the C03 author or their owner edits them is for the coordinator.
5. `results/C03/ledger.md`: E4, E3 and reflection-J as in L11 and M12.

Remaining uncertainty and what this review did not check:

- Nothing was elaborated. No Lean command, `#print axioms` or build was run; hidden instances, implicit arguments and coercions were not inspected. The local `Lean/` tree was compared with `Lean/SOURCES.sha256` for the forty-six files quoted or cited; the manifest was not authenticated against upstream.
- The synthesis compared the declarations listed in the table. All other declaration matches are those of the four agent reviewers, who list them in their reports and state that they did not check transitive dependencies, upstream production of the receipts, or elaborated types.
- The author's `correspondence.md` states that the declarations behind `phase-selection`, `phase-regularity`, `phase-fields`, `slab-regularity` and `phase-quantitative-producer` were not inspected in the author's pass beyond the evidence files. For these chapters the correspondence rests on the pre-existing evidence files and on reviewers B, C and D.
- The producer of the field inclusions (L11) was located by search and read at statement level only.

## Acceptance

No human acceptance is recorded. This file is an agent review submitted under the account `schmittj`; it is a textual comparison of prose with source text and is not a certification of correspondence. Under `docs/proof-standard.md` acceptance can be recorded only by a human reviewer after the required changes are resolved; a new content fingerprint requires renewed review.
