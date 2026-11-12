# Review of work package C06: Lean correspondence

- Unit: work package C06 "Local transfer, splitting and seed comparisons" of unit YM-000026 (`blueprint/units/YM-000026/`), author reports in `blueprint/units/YM-000026/handoff/results/C06/`.
- Role: Lean correspondence.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: four Codex `gpt-6-astra` read-only review passes by chapter group (A: local-sections, local-transfer, leaf-transfer, predictor-branch; B: local-splitting, cluster-expansion, mixed-activity-prices; C: gaussian-warnings, polynomial-moment-attenuation, seed-guides, seed-tree-patch; D: seed-geometry, seed-energy, seed-hit-comparison, seed-unhit-comparison, the ledger and the choice `c_F`), verified and synthesised by a Claude agent. Session `schmittj-codex-c06-review-20261112`.
- Content SHA-256: a package has no single unit fingerprint; the fifteen chapters and six author reports reviewed are listed with their SHA-256 in `mathematics.md` (same files, same hashes; recomputed unchanged at the end of the review, see `validation.md`). The canonical correspondence files were read at SHA-256 `f76d975405285f70773c26a65366c4e4fd9139509fa759d13b83cb1c0e1a66db` (`local-projection-evidence.md`) and `ae782547a4fa974e8cf59a3e23cff7f837918aa49dd4c5e59ba1610416cd55f1` (parent `correspondence.md`).
- Manuscript files and labels: the fifteen chapters `local-sections.tex`, `local-transfer.tex`, `leaf-transfer.tex`, `predictor-branch.tex`, `local-splitting.tex`, `cluster-expansion.tex`, `mixed-activity-prices.tex`, `gaussian-warnings.tex`, `polynomial-moment-attenuation.tex`, `seed-guides.tex`, `seed-tree-patch.tex`, `seed-geometry.tex`, `seed-energy.tex`, `seed-hit-comparison.tex`, `seed-unhit-comparison.tex` in `manuscript/existence/`; labels as listed in `mathematics.md`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All Lean text quoted below was read from `Lean/` in the worktree; the thirty-seven files quoted or cited from direct reading match `Lean/SOURCES.sha256` (see `validation.md`).
- Review task and PR: issue #47; author draft PR #73, reviewed at its head `5d91921` (`5d91921339150dfe35aed5caf239b777ea341021`).
- Outcome: changes requested for `predictor-branch.tex` (L1, L4), for the chapters named in L2, L6–L11 where the English states fewer hypotheses or less of a definition than the source declaration it follows, for the author's `correspondence.md` and `ledger.md` (L12–L14), and for the canonical `local-projection-evidence.md` and parent `correspondence.md` (reference errors, L5, L14). One displayed manuscript formula differs from the source definition (L1); no other manuscript statement contradicting the pinned source was confirmed, and the author's repair R2 agrees with the source (L3). The chapters are "accepted locally, conditional on stated dependencies" only in the sense of this agent review, which is a textual reading without elaboration. No human acceptance is recorded.

## Findings and evidence

Status vocabulary as in `mathematics.md`. Qualified names are read off the `namespace` blocks of the source files; nothing was elaborated, so implicit arguments, instances and universe levels were not inspected by Lean. Long source lines are abbreviated with `...`; the quoted parts are verbatim.

### L1. The displayed averaging map is not `YM.Precision.mean`; the intended one is (A-II-1 labelled ERROR). Status: CONFIRMED for the printed formula; manuscript, pre-existing. The repair of `mathematics.md` M1 restores the correspondence.

Location: `predictor-branch.tex` lines 165 and 181; parent `correspondence.md` (section on the predictor branch) and the author's `correspondence.md` line 26 (`YM.Push.derivative`, `YM.Precision.fixRoot`).

Lean text. `Lean/YM/PREC/FrameResponse.lean` (namespace `YM.Precision`), lines 40–41 and 57–68:

```lean
/-- offset of patch point in FINE units from actual root. -/
def atPoint (x : Site c) (a : S.patch.Points) := wrap f a.val+S.ratio.embed x
```

```lean
def tau (x : Site c) (a : S.patch.Points) : form 1 f →ₗ[ℝ] ℝ :=
    -((Fintype.card S.patch.Points:ℝ)⁻¹ • ∑ b : S.patch.Points,
      (Fintype.card Lattice.Order:ℝ)⁻¹ • ∑ i : Lattice.Order, integralLink (atPoint S x a) (route a.val b.val i))

def adjusted (x : Site c) (a : S.patch.Points) := tau S x a-∑ b, S.patch.weight b • tau S x b

def fixRoot : Matrix (Body 0 c) (Body 1 f) ℝ := LinearMap.toMatrix' (LinearMap.pi (fun i : Body 0 c => adjusted S i.1 S.patch.center))

def mean : Matrix (Body 1 c) (Body 1 f) ℝ := LinearMap.toMatrix' (LinearMap.pi (fun i : Body 1 c =>
    ∑ a, S.patch.weight a • integralLink (atPoint S i.1 a) (S.repath (axisEquiv.symm i.2))))

def probe : Matrix (Body 1 c) (Body 1 f) ℝ := mean S+d 0 c * fixRoot S
```

and lines 90–92:

```lean
def centered (v : form 0 f) : form 0 c := fun x => v (S.ratio.embed x.1, x.2)

lemma root_gradient (v : form 0 f) : probe S *ᵥ (d 0 f *ᵥ v)=d 0 c *ᵥ centered S v := by
```

Assessment. The source path of `mean` starts at `wrap f a.val + S.ratio.embed x`, the patch offset added to the embedded coarse site, that is \(Ly+i\); the manuscript prints \(y+i\). With the corrected endpoints, \(\tau_y\), \(\mathcal R\), \(\mathcal A\), \(\mathcal Q\) and the gradient identity are `tau`, `fixRoot`, `mean`, `probe` and `root_gradient` (signs included: `tau` is minus the averaged outgoing path sum; `adjusted ... center` is \(\tau_y(o)-\sum_iw_i\tau_y(i)\)). The lemma `psi_proj` in the same file is line 195 of the chapter. The identification of `probe` with the derivative of the actual predictor (`YM.Push.income_eq`, `YM.Push.prices`, `Lean/YM/PREC/Derivative.lean` lines 136 and 147) is carried over from report A; I confirmed only that the declarations exist in namespace `YM.Push`.

### L2. The nearest-point projection is proved in the source and is not a field of the group data (A-I-2, D-I-1). Status: CONFIRMED.

Lean text. `Lean/YM/Gauge/MatrixGroup.lean` lines 23–26:

```lean
structure Gauge where
  n : ℕ
  imageGroup : Subgroup (GaugeU n)
  closed_imageGroup : IsClosed (imageGroup : Set (GaugeU n))
```

`Lean/YM/Gauge/Nearest.lean` (namespace `YM.Gauge`), lines 26, 70, 95, 128, 141, 155:

```lean
def Nearest (u : G.El) (X : G.Mat) : Prop := ∀ v, ‖X-G.mat u‖ ≤ ‖X-G.mat v‖
def tubular (x : G.Color × G.Normal) : G.Mat := G.mat (G.lieExp x.1) * (1 + (x.2 : G.Mat))
theorem focus_diff : ContDiffAt ℝ ω (fun x => G.mat (G.focus x)) 1 := by
theorem nearest_is_focus : ∀ᶠ x : G.Mat in 𝓝 1, ∀ u, G.Nearest u x → u = G.focus x := by
theorem nearest_tube : ∃ δ : ℝ, 0 < δ ∧ ∀ X : G.Mat, ∀ v, ‖X-G.mat v‖ < δ → ∃! u, G.Nearest u X := by
theorem focus_deriv : HasStrictFDerivAt (fun x => G.mat (G.focus x)) G.lie.starProjection 1 := by
```

Assessment. These are the properties (a)–(c) of `mathematics.md` M2, as theorems for every closed subgroup. The phrase "tubular projection in the group data" (`seed-energy.tex` line 37) does not describe the source. The manuscript should carry the lemma; the correspondence record should list these declarations for `eq:branch-projection`, `eq:geometry-cluster` and `eq:seed-curvature-bound`. Whether the English reformulation of the synchronization proof through the projection (instead of `YM.Gauge.nearest_approximate`) follows the source proof step by step was not checked (report D says it is acknowledged in the parent correspondence).

### L3. Repair R2 against `YM.Work.E09.assemble`. Status: the author's claim is CONFIRMED.

Lean text. `Lean/YM/Work/E09.lean` (namespace `YM.Work.E09`), lines 69–87, abbreviated:

```lean
lemma assemble {S : StepData c f} (A : Stores S) (T : Tube G S)
    (U : Config G f) (Q V : Config G c) (x m t cF C W Z B δ d : ℝ) (K : ℕ)
    (hm : 0 ≤ m) (hf : m ≤ T.high.linear/8) (hd : m ≤ d)
    (hi : m ≤ S.kernel.penalty/32) (hc : m ≤ T.low.direct/64)
    (hF : cF ≤ T.high.linear/4) (hC : C ≤ S.kernel.penalty/16 * W)
    (hw : 1 ≤ W) ...
    (hspend : (4*m*K + Z*(radiusB x:ℝ)^4)*t^2 ≤ m*t*largeT G x S.patch.L)
    (herr : B*temp x^4*K*(radiusB x:ℝ)^4 ≤ m/4*t^2)
    ...
    (g : talll T x U Q V (A.hit U Q V x) + cF*t*(∑ i ∈ A.swell U t,toll U i) +
        C*t*(∑ i∈A.aisles, wire Q V i) + Z*t^2*(radiusB x:ℝ)^4*(A.spend U Q V x).shares ≥
          (T.low.linear*temp x)*(∑ i ∈ A.tides V x δ,toll V i))
    (g' : talll T x U Q V (A.outs x \ A.hit U Q V x) ≥ -(m/4*t^2*A.shares)) :
    m/2*t^2*A.shares ≤ A.assessed T x U Q V := by
```

The only call, in `theorem answer : Bid.E09`, line 145:

```lean
  refine assemble A T U (S.prediction U k) V x m (fiery G x L) (C/(L.val:ℝ)^2) C W Z B δ d K
```

with `hF` discharged at line 155 from `hn`, where (lines 121–124) `n` is chosen so that `C/(n:ℝ)^2 ≤ P.top.clip.linear/4` eventually. `Lean/YM/Work/E09/Budget.lean`, `fine_budget`, lines 21–29 and 48–49, has the hypothesis `(hF : cF ≤ T.high.linear/4)`, the conclusion `m*t^2*A.costs.card + m*t*largeT G x S.patch.L*(A.spend U Q V x).costs.card + cF*t*(∑ i ∈ A.swell U t, toll U i) ≤ A.tally T x U V` and the step `show 2*m + cF ≤ T.high.linear/2`.

Assessment. One parameter `cF` occurs in the reserve bound `hF` and as the coefficient of the fine linear expense in the hit hypothesis `g`, and it is instantiated as `C/L^2` with the same `C` that is the predictor expense coefficient and is bounded by `hC`. This is the manuscript's \(c_F=C_1/L^2\) with \(C_1/L^2\le\lambda_f/4\) and \(C_1\le pW/16\). The hypotheses `hf`, `hd`, `hi`, `hc`, `hspend`, `herr`, `g'` and the conclusion are \(m\le\lambda_f/8\), \(m\le d_f\), \(m\le p/32\), \(m\le a_c/64\), the two inequalities of `eq:seed-final-smallness`, \(\eta=m/4\) and \(\tfrac m2t^2n\); `fine_budget` is `eq:seed-fine-reserve` with its proof. The order of choices in `answer` (the bound on \(L\) from `C`, then \(W\), then `m` as a minimum, then the tail in `x` through the private lemma `bank`) is the order stated in `seed-energy.tex` lines 317–322. The author's `correspondence.md` lines 12–13 are accurate, including the line numbers. One difference of presentation, not an error: in the source `d` is obtained after \(L\) and \(W\) (line 134), while the manuscript has \(d_f=a_f/128\); the manuscript's order "\(\mu\) after \(W\)" accommodates both.

### L4. The frame branch predicate is universal over the axial order (A-II-2 labelled INACCURACY). Status: CONFIRMED; manuscript wording, pre-existing.

Lean text. `Lean/YM/RG/Patch.lean` (namespace `YM.RG.Patch`), lines 102–110 and 153–155:

```lean
def axial (U : CoverConfig G) (r : P.FrameTag) (x : P.Points) :=
  travel U r.1.val (route r.1.val x.val r.2)

def via (h : P.Frame G) (U : CoverConfig G) (x y : P.Points) (l : Lattice.Order) :=
  h x * travel U x.val (route x.val y.val l) * (h y)⁻¹

/-- open branch. -/
def usesMin (C : KernelChoices) (U : CoverConfig G) : Prop :=
  ∀ l k x y, G.chord (P.via (P.axial U (P.center,l)) U x y k) < C.frame_cut
```

```lean
def frame (C : KernelChoices) (U : CoverConfig G) (t : P.FrameTag) : P.Frame G := by
  classical
  exact if P.usesMin C U then P.selected U else fun x => (P.axial U t P.center)⁻¹ * P.axial U t x
```

Assessment. The test quantifies over all orders `l` of the centre-rooted axial gauge, all path orders `k` and all pairs `x y`. "after one of its rooted axial gauges" (`predictor-branch.tex` line 69) reads as a test in one gauge. The rest of the paragraph agrees with the source: `YM.RG.frame_unique` (`Lean/YM/Branch/Uniform.lean` lines 18–22) takes the threshold `d/G.colorScale` from `align` and fixes the gauge `P.axial U (P.center,1)`, which is "Take this cutoff at most \(\varepsilon/D\). Choose one of those axial gauges"; `YM.RG.predictor_unique` (lines 58–62) applies `weighted_unique` to `P.weight`, the manuscript's "uniformly over all finite weight distributions"; the predictor branch is `bondCost Y (best Y) < C.predictor_cut` (`usesBest`, line 171), a strict inequality as in `seed-geometry.tex` lines 212–214; and `eligible` (lines 143–146) is `axialCost U t ≤ C.axial_factor * (2*P.radius+1) * P.facesum U`, which is `eq:geometry-axial` with factor 16. These agree with the definitions and theorems recorded in `blueprint/background/balaban-gauge-averaging.md`.

### L5. Four insertion declarations are cited in the wrong namespace (B-II-1 labelled ERROR). Status: CONFIRMED as a reference error in the canonical evidence file; not a manuscript error and not introduced by PR #73.

Location: `blueprint/units/YM-000026/local-projection-evidence.md` line 167: "`Daisy.Charity.{dew,sustains,coco,premium_hit}` and `Daisy.sailsW`".

Lean text. `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Solvent.lean` has `namespace YM.PhysicalNext.Repeat.Daisy` at line 9, closed at line 121, with no inner `namespace Charity`, and declares `lemma dew` (line 68), `lemma sustains` (line 78) and `lemma coco` (line 107). `Daisy/Gnomon.lean` opens the same namespace at line 6 and declares `lemma premium_hit` at line 34. A namespace `Charity` exists in other files of the directory (`Tino.lean`, `Rhyme.lean`, `Berries.lean`), which is the likely origin of the slip.

Assessment. The correct names are `YM.PhysicalNext.Repeat.Daisy.dew`, `.sustains`, `.coco`, `.premium_hit`. The declarations exist and are the ones meant; the mathematical match claimed by the evidence file is not affected. The file is a canonical read-only input for C06, so the correction belongs in the author's `correspondence.md` (as a noted revision) or with the owner of the evidence file.

### L6. The sector conditions of the source use incidence with the dome (D-I-2). Status: CONFIRMED.

Lean text. `Lean/YM/Pressure/Seeds.lean`, lines 31–32 (namespace `YM.Pressure`) and 51–58 (namespace `YM.Pressure.Stores`):

```lean
def startPos (x : Cell f) := (touched x).image S.ratio.parent
def pinPos (x : Bond c) : Support c := {x.1,x.1 + step x.2}
```

```lean
structure Plot (U : Config G f) (k : S.Choices) (V : Config G c) (x w : ℝ) : Prop where
  consumes : ∀ p, ¬ Disjoint (A.dome (5*radiusB x)) (startPos S p) →
      ((p ∈ A.costs → fiery G x S.patch.L/4 ≤ toll U p) ∧ (p∉A.costs → toll U p ≤ fiery G x S.patch.L/2))
  drive b : ¬ Disjoint (A.dome (5*radiusB x)) (pinPos b) →
      ((b ∈ A.aisles → w*fiery G x S.patch.L ≤ wire (S.prediction U k) V b) ∧
      (b∉A.aisles → wire (S.prediction U k) V b ≤ 2*w*fiery G x S.patch.L))
  precise i : i∈A.dome (5*radiusB x) → (i∈A.flags ↔ i∈RG.flags (temp x) V)
  list i : i∈A.dome (5*radiusB x) → 0<S.patch.frameMass S.kernel (expandAt (S.ratio.embed i) U) (k.1 i)
```

Assessment. The four fields are the four parts of the sector conditions listed in `mathematics.md` M3, with the constants \(t/4\), \(t/2\), \(Wt\), \(2Wt\) of the chapters, and with "the parents of the touched corners (the two endpoints) meet the radius-\(5B\) dome" as the locality predicate. The manuscript's constants agree; its locality predicate is unspecified. The use of these predicates in the orientation step (`YM.ConnectedActivityE6.Tags.Wide.rotate`, quoted in report D) is carried over, not re-verified.

### L7. Leaf projection: source hypotheses and the two objects called \(f\) (A-II-3 labelled GAP, A-II-4 labelled INACCURACY). Status: CONFIRMED; manuscript, pre-existing.

Lean text. `Lean/YM/Push/LOCAL_SPLITTING/Merge.lean` (namespace `YM.Push.Local`), lines 59–63:

```lean
structure Slots (A : Activities G n) (X : ι → Support n) where
  label : Letters A X ↪ ℕ
  support (s) : patch A (label s) = s.total
  inventory (s) : flagsFor A (label s) = s.keeps
  allows (s) (U : Config G n) : (A.forced (label s)).extraTest U
```

`Lean/YM/Push/LOCAL_SPLITTING/Raw.lean` (namespace `YM.Push.Local.Raw`), lines 80–81:

```lean
theorem build_remBound (S : Slots R.activities (fun i => joint T o (X i))) (ha : R.activities.KBound R.p v) (h : Readable A T R.p n w)
    (hf : M.Format o X R) (hu : Income M o X A T R w v κ paid) (hκ : 0 < κ) : (M.build o X A T R S).remBound o R κ paid := by
```

`Lean/YM/RG/Activities.lean` lines 102–104:

```lean
def KBound (budget : ℝ) := ∃ b : ℕ → ℝ,
  (∀ i, (0 ≤ b i) ∧ ∀ U, ‖A.K i U‖ ≤ b i) ∧
  ∀ x : Site n, SumBudget (fun i => if x ∈ (A.forced i).support then p.mass (A.forced i).support (b i) else 0) budget
```

`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Lotus/Postcards.lean` (namespace `YM.PhysicalNext.Repeat.Lotus`), lines 52–61 and 70–74:

```lean
structure Leaf (R : Rep G f) where
  turn : Wing
  ingredient : Config G f→ℝ
  ...
  weight : ℝ
  earn : ∀ V, ‖ingredient V‖≤weight
  ...
```

```lean
def bill (k : Finset ℕ) (U : Config G f) := if M.turn.Occupied k then M.ingredient U * ∏ i∈M.turn.remaining k, R.activities.K i U else 0
def bun (k : Finset ℕ) (U : Config G f) := if R.activities.admissible R.p U k then M.bill k U else 0
def cicada (U: Config G f):ℝ := Real.exp (R.exponent U)*(∑' k,M.bun k U)
```

Assessment. `Slots` is the address hypothesis (i) and `KBound` the background bound (ii) of `mathematics.md` M4; `local-splitting.tex` states both, `leaf-transfer.tex` and ledger rows 29 and 77 do not carry them. The source bounds the `ingredient` by `weight` and transfers the density `cicada` (`YM.PhysicalNext.Repeat.Blush.account`, `Blush/Ribbon.lean` line 37, has hypotheses on `S.push R.beta r.live.cicada U`); the manuscript's \(f\) stands for both. The remaining statements of report A on this chapter (principal reserve, `bookbag`, `haze`, host-price conversion) are carried over.

### L8. The warning crosswalk omits the declaration that proves the support implication (C-II-4 labelled GAP). Status: CONFIRMED; evidence file and manuscript, pre-existing.

Location: `local-projection-evidence.md` lines 218–221, which assigns the "deterministic warning implication" to `YM.ConnectedActivityE6.Coat.alarm_bills`, `charge_area`, `ready`, `fires_at`; `gaussian-warnings.tex` lines 163–209.

Lean text. `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Guards.lean` (namespace `YM.ConnectedActivityE6.Coat`), lines 35–41:

```lean
lemma blowing {R : Rep G f} (hP : Intake P T X.x R) (θ : Rotator P L η r Q Y X) {W ξ a : ℝ} (hW : 0<W)
    (z : Air f G) (ht : ∀ i : Site c, ¬ Inside i X.seeds (30*X.B) → X.watch i ξ R.beta X.B z →
      let U:= X.input (X.liftA R.beta z)
      Tags.siteMass U X.k i=1 ∧ (∀ p : Cell f, S.ratio.parent p.1=i → toll U p < X.t/4) ∧
        ∀ j : Axis, Tags.pinMass U X.k (i,j)=1 ∧ wire (S.prediction U X.k) X.V (i,j) < W*X.t)
    (i : Panic c f) (hh : X.watch (focus_alarms S i) ξ R.beta (2*X.B) z) (l : Finset ℕ) :
    X.mayor (X.liftA R.beta z) W a R l i=0 := by
```

and its contraction branch, lines 66–73:

```lean
    change Contract.charges R l U p'=1
    suffices hr : p'∉ RG.flags R.p.threshold U by simp [Contract.charges,hr]
    rw [hP.received.temp]; intro hr
    obtain ⟨v,ht,he⟩ := (flags_spec ..).mp hr
    have hp : separation x (S.ratio.parent v.1)≤X.B := ...
    have hh : toll U v<X.t/4 := (hv _ hp).2.1 v rfl
    change X.t<toll U v at he; linarith
```

with `Eligibility.lean` lines 27–28 (namespace `YM.ConnectedActivityE6.Contract`) and `Lean/YM/Push/SECTOR_MEASURE/Presented.lean` line 61:

```lean
def charges (R : Rep G f) (l : Finset ℕ) (U : Config G f) (x : Site f) :=
    if x ∉ covered R l ∧ x ∈ RG.flags R.p.threshold U then (0:ℝ) else 1
```

```lean
  temp : R.p.threshold = fiery G x S.patch.L
```

`Alert.lean` line 95–96 (`fires_at`) concludes only `|X.detect u W a R l i| ≤ topStorm S.patch`.

Assessment. `blowing` is the statement "a radius-\(2B\) watch at the warning's site makes the warning vanish", from radius-\(B\) plateau conclusions at sites outside radius \(30B\) of the seeds; its last branch is the contraction, and it uses the threshold identification `temp` and a plaquette whose parent is within \(B\). This is the step missing from the manuscript (`mathematics.md` M5) and from the crosswalk. The source contains the argument; no defect of the Lean proof is alleged.

### L9. The \(A_0\) strip input is supplied by the source through order `P.j-2` (C-II-3 labelled GAP). Status: CONFIRMED.

Lean text. `Lean/YM/Pressure/Seeds.lean` (structure `YM.Pressure.Teller.Funds`), lines 102–105:

```lean
  knobs : S.kernel=P.bind
  atStep : S.patch.J=P.j
  kernel : S.patch.Branches P.bind G
  crosses : T.R.Deep P.η P.C (P.j-2)
```

`Lean/YM/PREC/Stacks.lean` (namespace `YM.Precision`), lines 111–114:

```lean
def Towers.Deep {L : Side} (K : Towers L) (α C : ℝ) (X : ℕ) : Prop :=
    K.mn.strip α C ∧ K.o.strip α C ∧ K.mf.strip α (C/(L.val:ℝ)^2) ∧ ∀ l : List Axis,
      l.length ≤ X → (advanceC L K.A0 l).strip α (C/(L.val:ℝ)^(1+l.length)) ∧
      (advanceC L K.T l).strip α (C/(L.val:ℝ)^(2+l.length))
```

`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Peak/Supple.lean` (namespace `YM.PhysicalNext.Repeat.Peak`), lines 15–16 and 56–57:

```lean
theorem homeAL (h : 0 < α) (A : ℝ) (k b : ℕ) : ∃ C : ℝ,1 ≤ C ∧ ∀ (c n : Side) (g : Ratio c n) (T : Towers g.count)
    (_T : ∀ s:List Axis,s.length ≤ k→Row.strip (advanceC g.count T.A0 s) α (A / (g.count.val:ℝ)^(1+s.length))) ...
```

```lean
lemma cradle (d b : ℕ)(M : ℝ)(A : ℝ)(hM : 0<M)(hb: d≤b) (hp : 0<α) : ∃ C:ℝ,1≤C ∧ ∀ {c f:Side} (S : StepData c f)(T: Pressure.Tube G S),
    (∀ l:List Axis,l.length ≤ d→ (advanceC S.patch.L T.R.A0 l).strip α (A/(S.patch.L.val:ℝ)^(1+l.length)))→ Peak.glider G T d b M C:=by
```

Assessment. The abstract statements (`homeAL`, `cradle`) take the strip differences through order \(d\) as a hypothesis, with \(0<\alpha\), \(d\le b\) and the constant chosen before the step data; this matches `eq:moment-drift`, `eq:moment-newton` and \(p\ge d\). The funded tower gives them through order `P.j-2`, `P.j` being the smoothing order `S.patch.J`. Instantiating needs \(d\le J-2\), which the chapter and edge I3 do not state. The other correspondences of report C for this chapter (`Mom.wiped`, `formal_null`, `covers`, `along`, `Newt.*`, `Mediator.attenuation`) are carried over.

### L10. The projected-footprint hypotheses in the source (B-I-1). Status: CONFIRMED.

Lean text. `Lean/YM/Push/ABSOLUTE_SUMS/Footprint.lean` (namespace `YM.Push.AbsoluteSums.Footprint`), lines 139–140 and 154–155:

```lean
def preCost := (ballCost (l+6):ℝ)
def conversion := 10*preCost l / p.count.val
```

```lean
lemma footprint (X : Support f) (hB : 0 < B) (hM : M ≤ 2*B) :
    (coverNumber B (enlargement p l B X):ℝ) ≤ preCost l + conversion p l * coverNumber M X := by
```

`Daisy/Solvent.lean` line 23 and `Daisy/Gnomon.lean` line 34:

```lean
def foam (L : Side) := Q.relative*(10*Footprint.preCost (Q.halo+5)/L.val) ≤ Q.ε
```

```lean
lemma premium_hit (he: ...) (ha:foam Q L) (hv:R.p.B≤2*radiusB x)(hp: ...
```

Assessment. `foam` is the manuscript's \(h(10P/L)\le\varepsilon\) with \(P=\) `preCost (halo+5)`, and `footprint` is \(c(X_*)\le P+(10P/L)c_f\) for the enlarged footprint. The "comparison of fine and coarse cover radii" is `hv`, \(B_f\le2B_c\), with \(0<B_c\). The chapter should state it.

### L11. Path length and transported kernels in `seed-guides.tex` (C-II-1, C-II-2 labelled INACCURACY). Status: CONFIRMED.

Lean text. `Lean/YM/RG/PathActions.lean` (namespace `YM.RG.Slot`), lines 38–50:

```lean
structure Slot where
  walk : Walk
  plaq : PlaqAxes
...
def length := a.walk.length + 4
```

`Lean/YM/Pressure/Rows.lean` (namespace `YM.Pressure`), lines 41–44 and 59:

```lean
def casted (R : ℕ) (V : Config G c) (x : Co f Layers2) (y : Co c Layers2) (i : Cover) : Pay G :=
    let r := S.ratio.residue x.1
    let w := route (lift r) (S.patch.L.val • i) 1
    if w.length ≤ R ∧ y.1=S.ratio.parent x.1+wrap c i then rated (replica S.ratio V) x.1 w (M.mf (r,x.2) y.2 i) else 0
```

```lean
def shortenTerm (R d : ℕ) (U : Config G n) (x : Cell n) (i : ℕ) := if (S.row x.2 i).2.length*d ≤ R then S.ellTerms x i U else 0
```

Assessment. The truncation of the path field tests `length*d ≤ R` with `length` the walk length plus four and `d` the stage factor (the manuscript's \(\kappa\), after R7); the manuscript does not define \(\ell_{a,i}\) (`mathematics.md` M7(c)). The wide kernel is transported in `replica S.ratio V` along the route from the residue to \(L\cdot i\) (the manuscript's "path from \(r\) to \(Lz\)", lines 56–58, agrees), with length cut `w.length ≤ R`; that the field is the replica of the same \(V\) is not said in the chapter (M7(e)). `YM.Laurent.size`, `Lean/YM/Laurent/Eval.lean` line 34, is `∑ i,(x i).natAbs` ("Unscaled one-norm"), and `route_size` in `Lean/YM/Next/FLUCTUATIONS/Kernel.lean` line 194 gives `(route x y 1).length = size (y-x)`, so the source's path lengths are \(\ell^1\) lengths (M7(d)); the torus separation `Lean/YM/Lattice/Site.lean` lines 78–81 is the maximum of the centred coordinates.

### L12. `eq:transfer-nonlinear-input` is the hypothesis `Volant` of the cited source lemmas (A-I-6). Status: CONFIRMED.

Lean text. `Lean/YM/MergeProof/Copse.lean` (namespace `YM.MergeProof.Menu`), lines 15–24:

```lean
structure Canopy (S: StepData c f) (H:GaugeDoor R E) (o:V→Site c)(r:V→ℝ)(z y s v:ℝ)(q:ι→Hat B R): Prop where
   buyer : ∃ (F:Support c→ Config G c→ Poly B)(K:Box c→ Config G c→Poly B), Towed r id F E.p.B z s ∧ (∀ i,Burns o i (F i) E.p.threshold) ∧ Towed r Prod.fst K E.p.B y v ∧ (∀ i,Flow o i (K i) E.p.threshold) ∧
      S.push R.beta (Expense q r S)=play E B K (fun U=>∑ i,F i U) ∧ (∀ i U,(K i U).part B.quiet=profile E.activities (fun j=> Complex.ofReal ∘ E.activities.K j) i U)∧
        ∀ i U j,(K i U).part (B.fire j)= ∑ l,owl (q l) H j i U
structure Volant (S:StepData c f)(D:GaugeDoor R E)(N:ℕ) (d c' v y w b:ℝ):Prop where
   reserves {V:Type} ... : ∀ q:ι→ Hat B R, (∀ i,0<r i)→Occupancy (S.ratio.parent ∘ o) N→ Offer o q r R.p.B d c'→ Canopy S D (S.ratio.parent ∘ o) r v y w b q
   ...
```

`Lean/YM/MergeProof/Temper.lean` (namespace `YM.MergeProof.Accent`), line 43:

```lean
lemma Duty.pre (h:A.Selected)(hm:m < N)(hu:Duty A C m d t u)(H:Volant Z D (C m) ((P1).supportExponent-4) t ((P0).supportExponent+1/2) ((P0).supportExponent+1) 1 u) ...
```

Assessment. `Canopy.buyer` is the push identity with ordinary and flagged arrays, the vacuum ("quiet") coefficient equal to the background profile and the singleton coefficient equal to the sum of the quoted insertions, for every offered finite list under an occupancy bound: this is `eq:transfer-nonlinear-input` with its three sentences (`local-transfer.tex` lines 163–178). `Duty.pre` uses it at the exponents `supportExponent-4`, `+1/2`, `+1` and prices `1`, `u`, which are those of `local-transfer.tex` lines 321–323. The manuscript treats it as an input, correctly. The ledger's X1 "no producer label found" should name the supplier `thm:ex-lattice-volant-supplier` (`mathematics.md` M8(b)). The other source matches of report A for this chapter are carried over.

### L13. Edge X5 omits the source's separate alignment hypothesis (D-II-1 labelled GAP). Status: CONFIRMED; audit record (ledger line 55), introduced by PR #73. The chapter is correct.

Lean text. `Lean/YM/PREC/Stacks.lean` (namespace `YM.Precision`), lines 44–46:

```lean
structure Attached (M : Bed) (R : PathData G) : Prop where
  layout (b p : PlaqAxes) (y : Cover) : HasSum (fun i => if (R.row b i).2.plaq=p ∧ (R.row b i).2.offset=y
        then (R.row b i).1 else 0) (M.roots (plaquette b) (plaquette p) y)
```

`Lean/YM/Next/FLUCTUATIONS/Linear.lean` (namespace `YM.Next.Fluctuations`), lines 89–95:

```lean
lemma roll_l (T : Tube G S) {H H' : Bed} (ht : Towers.Roll S H H' T.R T.high T.low)
    {σ C Λ η D Λ' : ℝ} -- only path alignment and bounds used for ell
    (hp : T.up.Bounds T.high σ C Λ) (hq : T.down.Bounds T.low η D Λ')
    (hf : Attached H T.up) (hc : Attached H' T.down)
    (a : LogField G f) (b : LogField G c) (j : Twin c) :
    unzip (flatF T) (xLin T.high T.up a) j + unzip (flatI T) (zLin S a b) j -
      xLin T.low T.down b j = 0 := by
```

and `Funds.tilts` in `Lean/YM/Pressure/Seeds.lean` line 109: `tilts : ∃ H H', Attached H T.up ∧ Attached H' T.down ∧ Towers.Roll S H H' T.R T.high T.low`.

Assessment. `roll_l` is `eq:unhit-linear-zero`; it needs the flat stack `Towers.Roll`, the path bounds and both `Attached` equalities. `seed-unhit-comparison.tex` lines 13–16 and 37–38 states alignment as part of the input; the incoming edge X5 lists only the three identities. That the three displayed identities are the fields `Roll.m`, `Roll.n` and a rearrangement of `Roll.orthogonal` is carried over from report D.

### L14. Reference errors in the correspondence records (A-II-5 labelled INACCURACY, D-II-2 labelled NIT). Status: CONFIRMED; audit records.

- `local-projection-evidence.md` lines 88–91 (pre-existing, canonical file): "`MergeProof/Blush/{Parcel,Wind,Confetti,Ribbon}.lean`", "`MergeProof/Mercury/Assure.lean`", "`MergeProof/Graces/Aspire.lean`". The directories `Blush`, `Mercury`, `Graces` do not exist under `Lean/YM/MergeProof/`; they are under `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/`. "`Partly.haze`" is `YM.PhysicalNext.Repeat.Mercury.haze` (`Lean/YM/MergeProof/North/Partly.lean`, namespace at line 7, lemma at line 26); "`Blush.bookbag`" is `YM.PhysicalNext.Repeat.Blush.bookbag` (`Blush/Parcel.lean` line 62).
- Author's `correspondence.md` line 17 (PR #73, quoting the parent): "`Temper.Duty.pre`, `Copse.stroke`" are file names used as namespaces; the declarations are `YM.MergeProof.Accent.Duty.pre` (`Temper.lean` line 43) and `YM.MergeProof.Menu.stroke` (`Copse.lean` line 51).
- Parent `correspondence.md` lines 174–175 (pre-existing): "`YM.Pressure.Road.strips`, `revenue`, `risks`, `fallback`, `synchronized`". In `Lean/YM/Pressure/Gauge.lean` the namespace `Road` runs from line 16 to line 70 and contains `strips` (34) and `revenue` (55); `risks` (75), `fallback` (95) and `synchronized` (135) are in `YM.Pressure`.
- Author's `correspondence.md` line 26: `YM.Push.derivative` exists (`Lean/YM/PREC/Derivative.lean` line 38, namespace `YM.Push`) and `YM.Precision.fixRoot` exists (L1); the row should add `YM.Precision.mean`, `probe`, `root_gradient`.

### L15. The prose budget of `local-splitting.tex` is wider than the source's `BudgetPoint` (B-II-2 labelled INACCURACY). Status: CONFIRMED; to be recorded in the correspondence, no manuscript error.

Lean text. `Lean/YM/RG/Masks.lean` lines 125–136:

```lean
structure BudgetPoint where
  power : ℕ
  order : ℕ
  supportExponent : ℝ
  B : ℕ
  threshold : ℝ
  power_ge : 2 ≤ power
  order_ge : 6 ≤ order
  exponent_pos : 0 < supportExponent
  B_pos : 0 < B
  threshold_pos : 0 < threshold
  threshold_le : threshold ≤ 1
```

`Lean/YM/Next/FOUNDATIONS/TestBounds.lean` (namespace `YM.Next.Foundations`), lines 271–275:

```lean
theorem price_of_readout {d : ℕ} (H : Hol G) (F : Labels.Frame G d) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (n : Side) (o : Site n) (X : Support n) (B : BudgetPoint)
      (f : Config G n → ℂ) (c : ℝ), d ≤ B.order → d ≤ B.power →
        B.Regular X f → B.supBounds o X f c → ∀ p : Label G d, Reads H o X p f →
          F.coeffSize (F.scaled B.threshold (F.coords p)) ≤ C*c := by
```

Assessment. `local-splitting.tex` lines 15–17 allows \(q\ge d\), \(p\ge d\); the source theorem has in addition \(q\ge6\), \(p\ge2\) through `BudgetPoint`. The other fields agree (\(0<t\le1\), \(u>0\), \(B\ge1\)). I checked that the English proof of `eq:local-read-price` uses only derivatives of order at most \(d\) and direction growth \((1+\operatorname{dist})^{\max(r-1,0)}\), \(r\le d\), so it is valid for the wider range; the correspondence record should say that the source statement is the special case \(q\ge\max(d,6)\), \(p\ge\max(d,2)\).

### Carried over without re-verification

The reviewers' positive statements "opened and matched" are carried over for all declarations not quoted above, in particular: `local-sections.tex` against `YM.Work.G03`–`G07` and `YM.Next.Foundations.priced`; `cluster-expansion.tex` against `YM.Push.AbsoluteSums.{Graph,Trees,Ursell,Coef,Gas}`; `mixed-activity-prices.tex` against `YM.Push.AbsoluteSums.{Animals,Packets,Reserves,Mixed}`; `gaussian-warnings.tex` against `Poll.rectangle`, `count_for`, `shattered`, `Cash.*`; `polynomial-moment-attenuation.tex` against `YM.MultiNext.SignedSource.*`; `seed-guides.tex` against `YM.Work.E03`, `E04`; `seed-tree-patch.tex` against `YM.Work.E02`, `E08`; `seed-geometry.tex` against `YM.Axial.*`, `YM.Pressure.*`, `YM.Work.E01.answer`; `seed-energy.tex` against `YM.Work.E05`, `E06` and the parts of `E09` other than `assemble`, `fine_budget` and `answer`; `seed-hit-comparison.tex` against `YM.Work.E07`; `seed-unhit-comparison.tex` against `YM.Next.Fluctuations.*` other than `roll_l`. Report B notes that the prose of `cluster-expansion.tex` replaces the source's inductive factorial count by the weak-composition count, a disclosed difference of route.

## Required changes and remaining uncertainty

Required changes.

1. `predictor-branch.tex`: the endpoints of L1; the universal branch test of L4.
2. Manuscript hypotheses and definitions that the source has and the chapters omit: L2 (projection lemma), L6 (sector conditions), L7 (leaf hypotheses, insertion against density), L8 (contraction and radius transfer), L9 (order restriction), L10 (radius comparison), L11 (path length, replica field, norm).
3. Author's `correspondence.md`: fully qualified names for line 17; add `YM.Precision.mean`, `probe`, `root_gradient`, the `YM.Gauge` declarations of L2, `YM.ConnectedActivityE6.Coat.blowing` (L8), `YM.Pressure.Stores.Plot` (L6); record the corrected names and paths of L5 and L14 as revisions to the canonical evidence, and the special case of L15.
4. Author's `ledger.md`: X1 (L12), X5 (L13), I3 (L9), rows 29 and 77 (L7).

Remaining uncertainty.

- Nothing was elaborated or built; no `#print axioms`. Every statement is from reading source text. The check against `Lean/SOURCES.sha256` compares the worktree with the local manifest and does not authenticate the manifest against upstream.
- Proof bodies were read only where quoted (`fine_budget`, the contraction branch of `blowing`, `psi_proj`). For all other declarations only the statement was compared.
- The transitive suppliers of `Volant`, `Funds`, `Towers.Roll`, `Attached` and of the sector `Plot`, and the downstream consumers in C07–C13, were not opened.
- The list under "Carried over without re-verification".

## Acceptance

Not recorded. This is an agent review submitted under the account `schmittj`; it is a textual comparison and does not certify the correspondence. A new content fingerprint of any chapter or record requires renewed review.
