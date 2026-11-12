# Review of work package C05: Lean correspondence

- Unit: work package C05 "OPE prescription and grouping" of unit YM-000026 (`blueprint/units/YM-000026/`), author reports in `blueprint/units/YM-000026/handoff/results/C05/`.
- Role: Lean correspondence.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: four Codex `gpt-6-astra` read-only review passes by chapter group (A: ope-prescription, ope-grouping, ope-grouping-algebra, ope-singletons; B: ope-cutoff, ope-estimates, ope-homogeneous; C: ope-filtration, ope-grid, ope-local-projection; D: ope-phase-prices, reference-cone, reference-difference, reference-match, the ledger and `prop:ope-match-assembly`), verified and synthesised by a Claude agent. Session `schmittj-codex-c05-review-20261112`.
- Content SHA-256: a package has no single unit fingerprint; the fourteen chapters and six author reports reviewed are listed with their SHA-256 in `mathematics.md` (same files, same hashes; recomputed unchanged at the end of the review, see `validation.md`). The canonical correspondence files were read at SHA-256 `5f805ebe17b1a1cb41fbaa5179cd193f89b6962da81fc293f2ff66b1b83b1da8` (`ope-evidence.md`), `f76d975405285f70773c26a65366c4e4fd9139509fa759d13b83cb1c0e1a66db` (`local-projection-evidence.md`) and `a9d143151c1245ab60686edfee9481f1adbfa1d30b4a0df7dd5dc5284da6e32f` (`ope-history-service-evidence.md`).
- Manuscript files and labels: the fourteen chapters `ope-prescription.tex`, `ope-grouping.tex`, `ope-grouping-algebra.tex`, `ope-singletons.tex`, `ope-cutoff.tex`, `ope-estimates.tex`, `ope-homogeneous.tex`, `ope-filtration.tex`, `ope-grid.tex`, `ope-local-projection.tex`, `ope-phase-prices.tex`, `reference-cone.tex`, `reference-difference.tex`, `reference-match.tex` in `manuscript/existence/`; labels as listed in `mathematics.md`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All Lean text quoted below was read from `Lean/` in the worktree; the thirty-six files quoted or cited from direct reading match `Lean/SOURCES.sha256` (see `validation.md`).
- Review task and PR: issue #46; author draft PR #72, reviewed at its head `8b15d44` (`8b15d44410a2784d25e765b5b7b9ca2b05e5582c`).
- Outcome: changes requested for the author's `correspondence.md`, `handoff.md` and `ledger.md`, for the canonical `ope-evidence.md` and `local-projection-evidence.md` (reference errors), and for the chapters named in L1, L2, L5, L7, L8, L9 and L10, where the English states fewer hypotheses than the source declaration it follows. No manuscript statement contradicting the pinned source was confirmed; the final theorem matches the public OPE clause as far as a textual comparison can show (L13). The chapters are "accepted locally, conditional on stated dependencies" only in the sense of this agent review, which is a textual reading without elaboration. No human acceptance is recorded.

## Findings and evidence

Status vocabulary as in `mathematics.md`. Qualified names are read off the `namespace` blocks of the source files; nothing was elaborated, so implicit arguments, instances and universe levels were not inspected by Lean. Long source lines are abbreviated with `...`; the quoted parts are verbatim.

### L1. The estimate transfer in the source has quotient covariance as an explicit hypothesis; the chapter does not state it (B-II-1 labelled ERROR). Status: CONFIRMED as a hypothesis missing from the manuscript and from the canonical correspondence record; pre-existing. The label ERROR is accepted in the sense that the printed implication is stronger than the source theorem; the repair is one added hypothesis (see `mathematics.md`, M1).

Location: `ope-estimates.tex` lines 94–99 and 173–175; `ope-evidence.md` lines 38–46.

Lean text. `Lean/YM/OPE/Orbits/Quotes.lean` (namespace `YM.OPE.Orbits`), line 80:

```lean
lemma discrepancy_spin (P:Prescription Q)(hLaw:X.Laws Q ρ)(hS:S.Hierarchy)(hX:X.Oriented S){x:I→E4}{k:Ortho}{o:E4}{m n:ℕ}(v:Labels S d) (c:S.Field m)
    (h:orbitMargin P n x o):
    spinning P X n x o k v - spinning P X n (sole o) o k (sole c : Labels S (fun _:Unit=>m)) =
    ∑ i∈bands Q n, (∑ e∈(P.sheet i).support,(P.sheet i) e * discrepancy S m x o v c (swung e k o) (turnsPort X k e)) • X.act n k (P.loaded i n):=by
```

`Lean/YM/Euclid/Stress.lean`, lines 44–48:

```lean
/-- Quotient covariance, with `T.respects S`. Heterogeneous and any positions
in Conf. Implies transported-plane RP with the Euclidean Basic/RP laws. -/
def Oriented (T : Table L) :=
  ∀ n (v : Fin n → S.Tag), ∀ x ∈ conf n, ∀ K : Ortho,
    S.useAt T (Points.move K x) (R.label K ∘ v) = S.useAt T x v
```

The structure `Laws` in the same file (lines 31–41) lists the action laws (`spin`, `fixes`, `group`, `real`, `filtered`, ...) and does not contain covariance of correlations. In `Lean/YM/OPE/Orbits/Receipts.lean`, `fit_old` and `fit_tint` supply the hypothesis as `U.phase.transport.motion` (`rw [discrepancy_spin P R.law R.continuum U.phase.transport.motion _ _ hs]`). The conjugated comparison uses `whole_bar` (same file, line 33), with hypotheses `(v':S.RealSpin)(h:S.Hierarchy)(hx:Injective (beside x y))`, and `RealSpin.real` in `Lean/YM/Euclid/Table.lean` lines 83–84 is the correlation law `S.read x (L.conjugate ∘ v) = star (S.read x v)`.

Assessment. `eq:ope-rotated-error` is the English form of `discrepancy_spin`; the source proves it from `hX : X.Oriented S`, and the chapter proves it by "rotate the entire correlation" without listing that law among its assumptions. The canonical evidence ("follows the fixed-exterior specialization a=1, b=c=0") is accurate about the scales and silent about the hypothesis. Apart from this, the main steps match as reported by reviewer B (carried over for `fresh_bridge`, `fresh_price`, `upon_field_cost`, `balance_rate`, `coefficient_separated`, `quantitative_separated`).

Requested change: as in M1; add to `ope-evidence.md` that `discrepancy_spin` uses `Oriented` and that the conjugated comparison uses `RealSpin.real`.

### L2. The author's correspondence calls the centred level and the opening level one index; the source keeps three levels (D-II-1 labelled ERROR; B-II-2 labelled INACCURACY). Status: REFINED. The facts about the source are CONFIRMED; the defect is an imprecise compression in the audit record and in one row of the new manuscript dictionary, both introduced by PR #72, without effect on any exponent. It is not a contradiction between a manuscript formula and the source.

Location: `results/C05/correspondence.md` line 16 ("This confirms the dictionary (J = centered/opening, m = matching, j = insertion)"); `results/C05/findings.md` lines 57–59; `ope-cutoff.tex` lines 221–227 ("Here the opening scale is the centered level \(k\), or its opened level \(K(k)\)" and the table row "\(k\) (or \(K(k)\)), and \(m\)").

Lean text. `Lean/YM/OPE/Prices/Circuit.lean`, structure `YM.OPE.PriceAt` (lines 52–59): the root test is `V.rootTest (C.beta N p) g' ≤ o` with `let V:= Cells.center C.S p hm 0` for `hm:J ≤ N`, the quota is `Next.UVStress.quota C n m N p z ≤ g`, and the fields are `live : J≤ m`, `step : C.ref n ≤ m`, `goes : m+1 ≤ j`. There is no opening level in `PriceAt`. In `funding` (lines 64–68, 75):

```lean
    let P:= Stock.Tabs.chosen C.path.levels 1 L.tabs ∘ k; have hP:Height C.S l T P b:= hk.stock L.tabs
    have ha:∀ i,Stock.Tabs.opens C.path.levels 1 (k i) (P i):=fun i=>Stock.Tabs.opened ..
    ...
    ... have hp:= terminalAfford hG L hP hm hT he hx t hg hZ (by linarith only [he]); let o i:=2*(stakes C (k i) (P i) / z i)
```

so the payment conditions are evaluated at the opened level `P i`, the price is `2*(stakes C (k i) (P i)/z i)`, and the conclusion is `PriceAt C (g i) (o i) t d s (k i) (m i) (j i)`. `Lean/YM/Overlay/Prior.lean` line 23: `def opens (i j : ℕ) := i≤j ∧ s*(a.clock.coverSize j:ℝ)^ (2:ℕ) ≤ a.S.a i/a.S.a j`. `Lean/YM/MergeProof/Strudel.lean` line 21: `def stakes (m k:ℕ):=Real.exp ((C.S.a m/C.S.a k)^ (4:ℕ)*Vac.treasury C.path.levels k+5)`. The matched construction `YM.MergeProof.bequeathed` (`Lean/YM/MergeProof/South/Merman.lean`, lines 32–46) has `variable (J:ℕ) (hV : Stock.Tabs.opens C.path.levels 1 J m) {hk:m≤k}{hN:k<N}`, the hypothesis `(hR:GridApprox.room C.path.levels J k (lensScope C d))`, and the conclusion `∃ b:C.label d,Next.UVStress.quota C d k N p b ≤ 2*E∧ (center C.S p ...).rootTest (C.beta N p) (f-C.O N p b 0) ≤ 2*(stakes C J m / w)`.

Assessment. The source has a centred depth \(J\), an opening depth \(m\) with `opens J m`, and a matching depth \(k\); in the cutoff letters these are \(k\), \(K(k)\) and \(m\). The reviewer is right that `PriceAt`'s `J` is the centred level only and that equal logarithmic rates do not identify \(k\) with \(K(k)\) (if the cover size at \(k\) exceeds one, `opens k k` fails). The manuscript itself does keep the two apart where it matters: line 210 says to use the opened level in the payment formulas, and \(\mathcal S(k)=\exp(u^4t_{K(k)}+5)\) with \(u=a_k/a_{K(k)}\) is exactly `stakes C k (K k)`. So the label ERROR overstates the defect; what needs correcting is the phrase "centered/opening" in the two records and the table row, which should read: centred depth \(k\) (root test, cells), opening depth \(K(k)\) (weight evolution, gain, single-source allowance, treasury), matching depth \(m\). The author's other statements in that correspondence row were checked and are correct: `Z' = (Σd)c + 4|I|(c−a)`, `X' = (t+1/16)(a−b) − Z'`, `RateIs l T g ((Z')-t*a)`, `RateLE l T o (-(X'))`, `z i = Real.exp ((X')*T i)`, `g i = 2*e i` with `e i = terminalCost C t (m i) (x i)`.

### L3. The handoff's rate for the whole label is not what the cited bounds give (B-II-3 labelled ERROR). Status: CONFIRMED; audit record (`handoff.md` line 15), introduced by PR #72; the manuscript and the author's own correspondence row are correct.

Lean text. `Lean/YM/OPE/Columns/SectorCost.lean` (namespace `YM.OPE.Columns`), lines 67–68:

```lean
lemma whole_origin (x : C.label d) (hk : C.ref d ≤ k) (hN : k ≤ N) : ‖x‖ ≤
    juice C.path.levels k * (C.S.a (C.ref d) / C.S.a k)^d * quota C d k N p x := by
```

and `funding` gives the quota budget `g` with `RateIs l T g ((Z')-t*a)`, that is rate \(\tau-qa\). The product has rate \(\tau\). `Lean/YM/Next/UV_STRESS/Least.lean` lines 18–21 defines `quota` with the comment "Use only at **fixed** birth time. Product here not claimed uniform/subexponential as birth approaches UV", which is the source form of "no subpower claim for \(Q_m\)". See M2.

### L4. The C16 sentence on singleton coefficients against `reap` and `Unites` (A-II-3 labelled ERROR). Status: REFINED; no contradiction with the source is established. Cross-package, owner C16; pre-existing.

Location: `ope-history-service.tex` lines 150–155 (quoted in M10).

Lean text. `Lean/YM/OPE/Grouping/Fibers.lean` (namespace `YM.MergeProof.Ribbons.Fibers`), lines 26 and 42–45:

```lean
def plena (b:(Bud V).Mode) : (Bud S₀).Mode:= ⟨b.val.biUnion L.contents,mem_univ _⟩
...
def reap : Poly (Bud S₀)→L[ℂ] Poly (Bud V):= LinearMap.toContinuousLinearMap ({
    toFun:=fun p=>Poly.inject fun s=> p.part (L.plena s)
```

This confirms the reviewer's reading of the regrouping: a grouped singleton reads the old coefficient at the full fibre, and `ope-grouping-algebra.tex` lines 25–35 represents it correctly. The declaration that the C16 paragraph follows (per `ope-history-service-evidence.md`: `Mallow.Many.vastN`, whose conclusion is `YM.MergeProof.Ribbons.ManyCopies.Unites`, `Lean/YM/OPE/Replicas/Price.lean` line 18) works on the ungrouped marker set, `abbrev Names (V : Type*) (Z : Type*) ... := Stock.census (V×Z)` (`Lean/YM/OPE/Replicas/Fermi.lean` line 16), and contains the conjuncts

```lean
(∀ i U,(K i U).part (Names V slotsZ).quiet=profile A.activities (fun j=>Complex.ofReal ∘ A.activities.K j) i U) ∧ (∀ i U j,(K i U).part ((Names V slotsZ).fire j)=∑ l,owl (q l) D j i U)
```

with `fire (v : V) : R.Mode := ⟨{v},R.solo v⟩` (`Lean/YM/Marker/Console.lean` line 32) and `owl` nonzero only when the insertion sits at marker `j` (`Lean/YM/MergeProof/Zing.lean` line 15). So the source statement is: for each individual marker (cell, slot), the singleton coefficient is the sum over the offered insertions of their derivatives; the quiet coefficient is the background profile. That is what the C16 sentence says if "singleton" means one marker before grouping. The reviewer's contradiction arises only under the other reading. What would settle the wording is the C16 author's statement of which coefficient is meant; the source supports the individual-marker reading.

### L5. Covariance of the regrouping: source hypotheses not named in the chapter or the crosswalk (A-II-1 labelled GAP). Status: CONFIRMED as hypotheses left implicit; manuscript, pre-existing.

Lean text. `Lean/YM/OPE/Grouping/Family.lean` (namespace `YM.MergeProof.Ribbons.Fibers`), lines 20–22 and 42–48:

```lean
structure Permutes (Δ:Fibers X₀ V)(a:Equiv.Perm X₀) (b:Equiv.Perm V) : Prop where
  run (x) : Δ.bunch (a x)= b (Δ.bunch x)
  pin (x) : Δ.twig (b x)=a (Δ.twig x)
...
structure CopyFamily (z : ℝ) (m:Motion)(x:Site n)(v u:Set V) (a:Equiv.Perm X₀)(b:Equiv.Perm V) : Prop where
   groups : Permutes Δ a b
   who (i) : b i ∈ u ↔ i∈v
   ways i : Δ.bunch i∈v → Z.grain (a i) = affine m.1 x (Z.grain i)
   debut i: Δ.bunch i∈v → Z.pepper (a i)= scalar m (Z.pepper i)
   kin p (hp:Focus Δ v p) i U: ...
   jets p (hp:Focus Δ v p) i U: ...
```

and `CopyFamily.twines` (`Lean/YM/OPE/Grouping/Care.lean` lines 57–60) assumes `(hr:CopyFamily Z t m x v u a₀ b)` and concludes only for `(p:(Bud V).Mode)(hq:(p.val:Set V)⊆ v)`. The chapter's "whenever they preserve the original coefficient data" covers `kin` and `jets` but not `groups`, `who`, `ways`. Requested change as in M7; record `Permutes`, `CopyFamily` and `CopyFamily.twines` in the crosswalk.

### L6. The returned cutoff label is the terminal image of the internal bare label (D-II-3 labelled INACCURACY). Status: CONFIRMED; the dictionary added by PR #72 and `reference-match.tex` lines 210–224 suppress the identification; no step is wrong.

Lean text. `Lean/YM/MergeProof/South/Merman.lean`, proof of `bequeathed`: `let B:= (s!).terminal b`, `refine ⟨B,?_,?_⟩`, and `unfold Next.UVStress.quota; have ha : (s!).terminal.symm B=b :=LinearEquiv.symm_apply_apply ..`; with `quota (d k N p : ℕ) (x : C.book.Ref d) := (C.labels.level d).coeffSize ((C.factory d N p).entries k ((C.factory d N p).terminal.symm x)).x` (`Least.lean` lines 20–21). The label extracted in `ope-cutoff.tex` lines 328–333 is the reference label \(Q_{N,p}=T_{N,p}b\), whose quota at level \(k\) is \(\mu(I_kb)\); the dictionary row "label \(b\); quota \(2E\)" \(\leftrightarrow\) "\(Q_{N,p}\); \(V\)" should say so, since the terminal map depends on the cutoff and the compactness argument is applied to \(Q_{N,p}\), not to \(b\).

### L7. Phase edge: reflection and regularity premises of the source (D-II-2 labelled GAP). Status: CONFIRMED; ledger line 49 (PR #72) and `ope-phase-prices.tex` (pre-existing).

Lean text. `Lean/YM/Work/B17.lean` (namespace `YM.Work.B17`), lines 22–23:

```lean
lemma conj_M (ht : Theme V A) (hp : Phase.reflects (C:=C) V A) (w : C.book.Word) (h : distinct w) :
    M A (Word.conjugate w) (distinct_conjugate h) = star (M A w h) := by
```

whose proof reverses the word by `ht.changes`, applies `hp`, then `ht.opposite`. `Lean/YM/OPE/Eye/Civic.lean` line 42 uses `smooth_observe (spectator U v') (spectate U v').smooth ...` and lines 76–77 use `(spectate U u).smooth` for the discrepancy. So the unreflected conjugation identity and the smoothness of every spectator state are explicit premises in the source; see M4 and M5.

### L8. `YM.MergeProof.onions` has hypotheses that the English local-trial condition does not state (C-II-1 labelled INACCURACY). Status: CONFIRMED; manuscript and ledger line 57; pre-existing.

Lean text. `Lean/YM/MergeProof/Portions.lean` line 36:

```lean
lemma onions (Z:Trial C) (hp:RawProtected C f Z d)(hZ:Stencilled f Z)(hz:∀ᶠ i in f.fuse,Continuous (Z i.1 i.2 0)) : vet C f d Z:=by
```

with `RawProtected` (`Lean/YM/Push/RELAY_DIFFERENCE/RawTop.lean` lines 34–36) requiring, on the late tail and for every origin, `clothed ... (c (N,p)) (b (N,p))` with two slow prices, where `clothed B X o u c b := B.Regular X u ∧ B.supBounds o X u c ∧ 0 ≤ b ∧ ∀ U,‖u U‖ ≤ b`; `supBounds` (`Lean/YM/RG/Masks.lean` lines 164–166) bounds `leftDerivs F l U` only for `Healthy p.threshold P U`; and `Stencilled f F := ∃ X : Finset Cover, ∀ᶠ i in f.fuse, Local X (F i.1 i.2)` with `Local` containing `translates : literal F` and `fits x : Interior (stamp X x) (F x)` (`Stencils.lean` lines 20–22, 53). See M8.

### L9. Interpolation and selected-history projection: source hypotheses (C-II-2 labelled INACCURACY; C-I-3). Status: CONFIRMED.

Lean text. `Lean/YM/OPE/Interpolate/Chart.lean` line 15, `def deriveLabel : R.Token:= ⟨(p i).1+1, S.representative _ (P.deriv (p i).1 a (S.project _ (p i).2))⟩`, and line 34, `lemma observeBump (h:A.Hierarchy)(hx:P.Derivatives A)(hr:A.respects S)(hs:Injective x): fderiv ℝ (fun x:I→E4=> observe A x p) x (kindle i a)= observe A x (touched p i a P)`. The derivative plan `P.Derivatives A` and the compatibility `A.respects S` of the phase table with the original quotient are separate hypotheses; see M9 (the use in `Education.lean` lines 42–53 is carried over from reviewer C). For the projection, `Lean/YM/MergeProof/North/Freckles.lean` line 57: `lemma thaw (h : Nest X Y) {D:GaugeDoor ...} (hi:Climbs X Y n m j D)(d:ℕ)(hd:d+3≤ iY) ...` with `local notation "iY"=> (P!).J m` and `variable {j n m:ℕ}(hm:m<n)`; see M12.

### L10. Three definitions whose meaning the chapters leave implicit (A-II-2, A-II-4, C-I-4). Status: CONFIRMED.

`Lean/YM/Lattice/Support.lean` lines 52–55 and 70–71: `def covers (M : ℕ) (X D : Support n) := let A := halo M D; X ⊆ A ∧ ∀ x ∈ A, ∀ y ∈ A, Relation.ReflTransGen (fun u v : Site n => u ∈ A ∧ v ∈ A ∧ separation u v ≤ 1) x y` and "Minimum number of native `M`-balls with connected union covering X" for `coverNumber`; `YM.Ac.forest_price` (`Lean/YM/MergeProof/Twigs.lean` line 40) assumes `(ha : 0≤ a)` (M14). `Lean/YM/OPE/Grouping/Shift.lean` line 19: `def tow (w:S₀→ℝ)(α η:ℝ)(k:ℕ)(i:S₀):= η*w i/ Real.exp (α*k)` is the weight of one old mark, and `Lean/YM/OPE/Grouping/Birth.lean` line 46 requires the group weights separately, `(hu:∀ i,w i= ∏ j∈L.contents i,W₁ j)` with `W₁` the notation of line 30 for `Salt.tow J (R.p.supportExponent+c) (η/k) l` (M3). `Lean/YM/Source/Insertion.lean` lines 63–68: `def remBound (o : Site n) (R : Rep G n) (varkappa budget : ℝ) : Prop := ∃ a b : ℝ, 0 ≤ a ∧ 0 ≤ b ∧ a+b ≤ budget ∧ 0 < varkappa ∧ (... SumBudget (...) a ...) ∧ (... SumBudget (...) (varkappa*b) ...)` (M13).

### L11. Reference errors in the correspondence records (B-II-4, C-II-3, C-II-4, D-II-4, labelled NIT or INACCURACY). Status: CONFIRMED; audit records only.

- `results/C05/correspondence.md` lines 6–7 cite `../../ope-evidence.md` and `../../local-projection-evidence.md`; from `handoff/results/C05/` these resolve into `handoff/`, where the files do not exist. The files are at `../../../`. Introduced by PR #72. The same relative path occurs in the author's `validation.md`.
- `local-projection-evidence.md` lines 88–90 cite `MergeProof/Blush/{Parcel,Wind,Confetti,Ribbon}.lean`, `MergeProof/Mercury/Assure.lean`, `MergeProof/Graces/Aspire.lean`. These directories do not exist under `Lean/YM/MergeProof/`; the files are under `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/{Blush,Mercury,Graces}/`. Pre-existing canonical record, not the author's.
- `ope-evidence.md` line 23 lists `Reader.liftOne_affinity`; it is `private lemma liftOne_affinity` (`Lean/YM/OPE/Orbits/Cuts.lean` line 37). The public statement next to it is `cut_rise` (line 80). Line 112 abbreviates `YM.MergeProof.Ribbons.ManyCopies.Live.winter`/`ripe`; `ripe` is `YM.MergeProof.Ribbons.ManyCopies.ripe` (`Lean/YM/OPE/Sweep/Winter.lean` line 30), not `Live.ripe`. Pre-existing.
- `results/C05/correspondence.md` line 19 gives `YM.Work.G09` as the declaration; that is the namespace (`Lean/YM/Work/G09.lean` line 18). The declarations are `YM.Work.G09.answer` (line 224), `cone_cost` (line 183) and `cost_finest` (line 210). Introduced by PR #72.

### L12. Author's correspondence rows that were checked and are correct

- `eq:ope-whole-distance` ↔ `YM.OPE.Columns.whole_origin`: quoted in L3; `juice` is \(\prod_{i<k}\zeta_{i+1}\) (`Lean/YM/OPE/Columns/Plane.lean` line 47), so \(J_k(a_U/a_k)^dq_k\) with `ref d` as \(U\).
- `eq:ope-physical-distance` ↔ `YM.OPE.Columns.limit_cap` (`SectorCost.lean` lines 46–49): hypotheses `(hp : b ≤ f.fuse) (hk:C.ref d ≤ k) (hz : ∀ᶠ i in b, quota C d k i.1 i.2 (v i) ≤ z) (hx : Tendsto v b (𝓝 x))`, conclusion `∃ y : C.label d, S.project d y ∈ LinearMap.range (X.rise he.le) ∧ ‖x-y‖ ≤ fare C k d e*z`, with `fare C k d e = gel C.path.levels k * (1+(C.path.levels.params k).columns)*(C.S.a (C.ref d) / C.S.a k)^(d-(e+1))` (lines 26–27). The proof extracts once, for `y` only (`finite_extract`), and the limit `x` is unchanged; this is the statement used in the third step of `prop:ope-match-assembly`, with the same `quota` at the fixed level `k` as in `PriceAt.quote` and `whole_origin`.
- `eq:ope-match-pay-one`, `eq:ope-match-pay-two` ↔ `YM.OPE.terminalAfford` (`Circuit.lean` lines 40–42): conclusion `march (fun _:Unit=>w i) η (k i) (m i) () ≤ δ (m i)*(x i/(16*X (m i))) ∧ 32*(1+(C.path.levels.params (m i)).columns)*w i*‖alto C.path (k i) d‖*(e i/gainChart C.path (m i) (k i)) ≤ τ d (k i)/2`, under `(h:z<(d+1/8)*(a-b)+y)`; with `z = X'` and `y = -Z'` the margin is the manuscript's \(\tfrac1{16}(a-b)\). In `funding` it is applied at the opened level (L2).
- `eq:ope-terminal-price` ↔ `YM.OPE.terminalCost` (line 32): `4*(1+(C.path.levels.params i).columns)*(2*(C.S.a (i+1)^d*(bling C.path.levels i*(4*(1/y)))))`, that is \(E=4(1+\zeta_m)(2P)\).
- The rows for `step_expand`, `step_transverse` and `YM.Work.G09` constants were not re-read (carried over from the author and reviewers C and D).

### L13. Final theorem against the public OPE clause

`Lean/ChallengeSpec.lean` lines 65–80:

```lean
def Within {I : Type} (r M η : ℝ) (x : I → Spacetime) (o : Spacetime) : Prop :=
  (∀ i, ‖x i - o‖ ≤ M*r) ∧ (∀ i j, i ≠ j → η*r ≤ ‖x i - x j‖)
def Clear {J : Type} (o : Spacetime) (y : J → Spacetime) (c : ℝ) : Prop :=
  (∀ i, c ≤ ‖o - y i‖) ∧ (∀ i j, i ≠ j → c ≤ ‖y i - y j‖)

structure OperatorProductExpansion : Prop where
  coefficients {I : Type} [Fintype I] (a : I → T.Tag) (M η ε : ℝ) :
    0 ≤ M → 0 < η → 0 < ε → ∀ j (i : T.Channel j), ∀ᶠ r : ℝ in 𝓝[>] 0,
    ∀ x o, Within r M η x o → ‖T.coefficient a j i x o‖ ≤ r ^ ((j:ℝ) - T.weight a - ε)
  remainder {I J : Type} [Fintype I] [Fintype J] (a : I → T.Tag) (b : J → T.Tag)
      (M η c ε : ℝ) : 0 ≤ M → 0 < η → 0 < c → 0 < ε → ∀ D : ℕ,
      ∀ᶠ r : ℝ in 𝓝[>] 0, ∀ x o y, Within r M η x o → Clear o y c → ∀ s,
      ‖T.grouped s a x b y -
        ∑ j : Fin (D+1), ∑ i : T.Channel j.val, T.coefficient a j.val i x o *
          T.grouped s (fun _ : Unit => ⟨j.val,T.actor j.val i⟩) (fun _ => o) b y‖
        ≤ r ^ ((D:ℝ) + 1 - T.weight a - ε)
```

`thm:ope-quantitative` (`ope-estimates.tex` lines 173–193) has the same two bounds, \(r^{m-w-\epsilon}\) and \(r^{D+1-w-\epsilon}\), the same cluster and spectator conditions, and the same order of quantifiers: the threshold in \(r\) is chosen after the labels, \(M,\eta,\epsilon\), the channel (first clause) and after the labels, \(M,\eta,c,\epsilon,D\) (second clause), and before the positions and the state `s : Option Character` (a character or the mixed state). The coefficients do not depend on \(D\) or on the state, as the clause requires of `T.coefficient`. Three points were not settled by this textual comparison: the clause quantifies over every finite index type, including the empty cluster and empty spectator list (the chapters treat these at `ope-grid.tex` lines 283–286 and `ope-estimates.tex` line 57; not re-derived here); the identification of `T.actor j i` with the basis fields \(e_{j,\alpha}\) and of `T.coefficient` with `eq:ope-final-coefficients` is made in C16, not in C05; and no elaboration was run. The sentence at lines 209–211 conflicts with the clause's uniformity in `s` (M11).

## Required changes and remaining uncertainty

Required before a positive correspondence review can be recorded:

1. State the covariance, translation and reality laws in the chapters and in `ope-evidence.md` (L1).
2. `correspondence.md` line 16, `findings.md` R1, `ope-cutoff.tex` lines 221–227 and table: three levels, centred \(k\), opened \(K(k)\), matching \(m\); state \(Q_{N,p}=T_{N,p}b\) (L2, L6).
3. `handoff.md` line 15 (L3).
4. Ledger line 49 and `ope-phase-prices.tex`: reflection and regularity premises (L7).
5. Name the source hypotheses in `ope-grouping-algebra.tex` (L5), `ope-filtration.tex` (L8), `ope-grid.tex` and `ope-local-projection.tex` (L9), and the definitions of L10.
6. Correct the references of L11 (the two canonical evidence files belong to their owners; the author's `correspondence.md` to the author).

For the C16 owner: disambiguate the singleton sentence (L4).

Remaining uncertainty and what this review did not check:

- Everything here is a reading of source text. No Lean command was run: no build, no elaboration, no `#print axioms`. Fully qualified names are inferred from `namespace` lines; private declarations have generated names that were not determined.
- Declarations matched by the agent reviewers and not re-opened in synthesis (carried over): the prescription group (`YM.OPE.Prescription.*`, `YM.OPE.reachReads`), the orbit-averaging group (`YM.OPE.Orbits.compact_dock`, `averageV`, `Reader.*`, `packet_read`), the grouping proofs (`YM.Ac.forest_price` beyond its statement, `Salt.attends`, `Deck.*`, `Salt.yields`), the singleton group (`YM.MergeProof.Accent.*`, `Float.*`, `Ribbons.plume`), the grid group (`YM.OPE.found`, `Cloud.screened`, `grid_coeff`, `grid_remainder`, `interpolated`), the local-projection group (`YM.MergeProof.tossing`, `Gig.*`, `coupons`, `fuseNext`, `crescent`, `ripe`, `Live.winter` beyond their names), the phase group (`YM.OPE.Cards.*`, `YM.Work.B15.cutoff_bound`, `YM.Work.B17.answer`, `phase_budget`), the reference group (`YM.Work.G09.*` proofs, `YM.Extra.Histories.Relay.*`), and the column steps (`step_expand`, `step_transverse`, `limit_lower`).
- From the reviewers' "not checked" lists: production of `Services`, `Spec.Final`, `Package`, `Base`, `Tones`, `Carol`, `HasSlots` at every history level, `CopyFamily` on the selected history, and the suppliers of the `Reader` and of the marked transitions; transitive axioms of any declaration.
- The comparison in L13 covers the statement of the clause, not the construction of the `Hierarchy` fields.

## Acceptance

No human acceptance is recorded. This file is an agent review submitted under the account `schmittj`; it is not a certification of the correspondence, and the responsible human reviewer has not checked the declarations. Under `docs/proof-standard.md` acceptance can be recorded only by a human reviewer after the required changes are resolved, and any material edit of a chapter changes its SHA-256 and requires renewed review of that chapter.
