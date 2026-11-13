import FreeField.Fock
import FreeField.Analytic.IntegrablePowExpWeight
import FreeField.Analytic.LineCDifferentiableOn
import FreeField.Analytic.LineCEuclid
import FreeField.Analytic.LineSSymm
import FreeField.Analytic.MatchingIntegrable
import FreeField.Analytic.MeasurableWeight
import FreeField.Analytic.PartialDerivSBound
import FreeField.Analytic.SrEuclid
import FreeField.Analytic.WeightLe
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Fourier.Convolution

/-! Completed locality proof consolidated from `FreeField/Work/wightW_local.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_WightWLocal
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal ContDiff

namespace WightLocal

variable {n : ℕ}

/-- Relabelling vertices also relabels their legs, without changing multi-indices. -/
def legEquiv (π : Equiv.Perm (Fin n)) (m : Fin n → Mon) :
    Leg (m ∘ π) ≃ Leg m := Equiv.sigmaCongrLeft (β := fun v => (m v).ToType) π

@[simp] lemma legEquiv_vertex (π : Equiv.Perm (Fin n)) (m : Fin n → Mon)
    (a : Leg (m ∘ π)) : (legEquiv π m a).1 = π a.1 := rfl

@[simp] lemma legEquiv_symm_vertex (π : Equiv.Perm (Fin n)) (m : Fin n → Mon)
    (a : Leg m) : ((legEquiv π m).symm a).1 = π.symm a.1 := rfl

@[simp] lemma legEquiv_idx (π : Equiv.Perm (Fin n)) (m : Fin n → Mon)
    (a : Leg (m ∘ π)) : (legEquiv π m a).idx = a.idx := rfl

@[simp] lemma legEquiv_symm_idx (π : Equiv.Perm (Fin n)) (m : Fin n → Mon)
    (a : Leg m) : ((legEquiv π m).symm a).idx = a.idx := by
  simpa using (legEquiv_idx π m ((legEquiv π m).symm a)).symm

/-- The conditions defining a matching are invariant under vertex relabelling. -/
lemma matching_property (π : Equiv.Perm (Fin n)) (m : Fin n → Mon)
    (σ : Equiv.Perm (Leg m)) :
    ((∀ a, σ (σ a) = a) ∧ ∀ a, (σ a).1 ≠ a.1) ↔
      ((∀ a, ((legEquiv π m).symm.permCongr σ)
          (((legEquiv π m).symm.permCongr σ) a) = a) ∧
        ∀ a, (((legEquiv π m).symm.permCongr σ) a).1 ≠ a.1) := by
  constructor
  · rintro ⟨hi, hn⟩
    constructor
    · intro a
      simp only [Equiv.permCongr_apply, Equiv.symm_symm, Equiv.apply_symm_apply, hi,
        Equiv.symm_apply_apply]
    · intro a ha
      apply hn (legEquiv π m a)
      have hb := congrArg π ha
      simpa only [Equiv.permCongr_apply, Equiv.symm_symm, legEquiv_symm_vertex,
        Equiv.apply_symm_apply, legEquiv_vertex] using hb
  · rintro ⟨hi, hn⟩
    constructor
    · intro a
      have ha := congrArg (legEquiv π m) (hi ((legEquiv π m).symm a))
      simpa only [Equiv.permCongr_apply, Equiv.symm_symm, Equiv.apply_symm_apply] using ha
    · intro a ha
      apply hn ((legEquiv π m).symm a)
      simpa only [Equiv.permCongr_apply, Equiv.symm_symm, Equiv.apply_symm_apply,
        legEquiv_symm_vertex] using congrArg π.symm ha

/-- Explicit bijection between the matchings before and after relabelling. -/
def matchingEquiv (π : Equiv.Perm (Fin n)) (m : Fin n → Mon) :
    Matching m ≃ Matching (m ∘ π) :=
  Equiv.subtypeEquiv ((legEquiv π m).symm.permCongr) (matching_property π m)

@[simp] lemma matchingEquiv_apply (π : Equiv.Perm (Fin n)) (m : Fin n → Mon)
    (σ : Matching m) (a : Leg (m ∘ π)) :
    (matchingEquiv π m σ).1 a =
      (legEquiv π m).symm (σ.1 (legEquiv π m a)) := rfl

/-- For an adjacent exchange, precisely the edge between the exchanged vertices reverses. -/
lemma swap_preserves_lt (i j x y : Fin n) (hij : j.val = i.val + 1) (hxy : x < y) :
    Equiv.swap i j x < Equiv.swap i j y ↔ ¬ (x = i ∧ y = j) := by
  change x.val < y.val at hxy
  have hv (z : Fin n) : (Equiv.swap i j z).val =
      if z.val = i.val then j.val else if z.val = j.val then i.val else z.val := by
    by_cases hi : z = i
    · subst z
      simp
    · by_cases hj : z = j
      · subst z
        simp [show j.val ≠ i.val from fun he => hi (Fin.ext he)]
      · rw [Equiv.swap_apply_of_ne_of_ne hi hj]
        simp [show z.val ≠ i.val from fun he => hi (Fin.ext he),
          show z.val ≠ j.val from fun he => hj (Fin.ext he)]
  change (Equiv.swap i j x).val < (Equiv.swap i j y).val ↔ _
  rw [hv x, hv y]
  simp only [Fin.ext_iff]
  split_ifs <;> omega

/-- Precomposition on the finite family of monomial choices. -/
def tupleEquiv {α : Type*} (π : Equiv.Perm (Fin n)) :
    (Fin n → α) ≃ (Fin n → α) where
  toFun m := m ∘ π
  invFun m := m ∘ π.symm
  left_inv m := by funext i; simp
  right_inv m := by funext i; simp

/-- Relabelling the finite supports lifts any monomial exchange identity to labels. -/
lemma labels_of_monomials (π : Equiv.Perm (Fin n))
    (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction)
    (hm : ∀ m : Fin n → Mon,
      wightmanMono m f = wightmanMono (m ∘ π) (f ∘ π)) :
    wightmanL P f = wightmanL (P ∘ π) (f ∘ π) := by
  unfold wightmanL
  apply Finset.sum_equiv (tupleEquiv π)
  · intro m
    simp only [Fintype.mem_piFinset, tupleEquiv, Equiv.coe_fn_mk, comp_apply]
    constructor
    · intro h i
      exact h (π i)
    · intro h i
      simpa using h (π.symm i)
  · intro m _
    change (∏ i, P i (m i)) * wightmanMono m f =
      (∏ i, P (π i) (m (π i))) * wightmanMono (m ∘ π) (f ∘ π)
    rw [Equiv.prod_comp π (fun i => P i (m i)), hm m]

/-- One summand of the Wightman function, with the original oriented-line convention. -/
def matchingValue {m : Fin n → Mon} (σ : Matching m) (f : Fin n → TestFunction) : ℂ :=
  ∫ q : Line σ → Spacetime,
    (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) *
      (weight (q ℓ) : ℂ)) * ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v)

/-- A vertex relabelling preserving all edge orientations induces a line bijection. -/
def lineEquiv (π : Equiv.Perm (Fin n)) {m : Fin n → Mon} (σ : Matching m)
    (ho : ∀ a : Leg m, a.1 < (σ.1 a).1 ↔ π.symm a.1 < π.symm (σ.1 a).1) :
    Line σ ≃ Line (matchingEquiv π m σ) :=
  Equiv.subtypeEquiv (legEquiv π m).symm fun a => by
    simpa using ho a

@[simp] lemma lineEquiv_coe (π : Equiv.Perm (Fin n)) {m : Fin n → Mon}
    (σ : Matching m) (ho) (a : Line σ) :
    (lineEquiv π σ ho a).1 = (legEquiv π m).symm a.1 := rfl

/-- Vertex momenta are transported by an orientation-preserving matching bijection. -/
lemma vertexMomentum_relabel (π : Equiv.Perm (Fin n)) {m : Fin n → Mon}
    (σ : Matching m) (ho) (q : Line (matchingEquiv π m σ) → Spacetime) (v : Fin n) :
    vertexMomentum σ (q ∘ lineEquiv π σ ho) v =
      vertexMomentum (matchingEquiv π m σ) q (π.symm v) := by
  unfold vertexMomentum
  congr 1
  · apply Fintype.sum_equiv (lineEquiv π σ ho)
    intro a
    simp
  · apply Fintype.sum_equiv (lineEquiv π σ ho)
    intro a
    simp

/-- Matchings whose line orientations are unchanged need only a change of variables.
This remains valid for the totalised Bochner integral; integrability is not assumed. -/
lemma matchingValue_relabel (π : Equiv.Perm (Fin n)) {m : Fin n → Mon}
    (σ : Matching m) (f : Fin n → TestFunction)
    (ho : ∀ a : Leg m, a.1 < (σ.1 a).1 ↔ π.symm a.1 < π.symm (σ.1 a).1) :
    matchingValue σ f = matchingValue (matchingEquiv π m σ) (f ∘ π) := by
  unfold matchingValue
  rw [← (volume_measurePreserving_piCongrLeft (fun _ : Line σ => Spacetime)
    (lineEquiv π σ ho).symm).integral_comp']
  apply integral_congr_ae
  filter_upwards [] with q
  have hq : Equiv.piCongrLeft (fun _ : Line σ => Spacetime)
      (lineEquiv π σ ho).symm q = q ∘ lineEquiv π σ ho := by
    funext a
    simp [Equiv.piCongrLeft_apply]
  simp only [MeasurableEquiv.coe_piCongrLeft, hq]
  apply congrArg₂ (fun a b : ℂ => a * b)
  · apply Fintype.prod_equiv (lineEquiv π σ ho)
    intro a
    simp
  · apply Fintype.prod_equiv π.symm
    intro v
    simp only [comp_apply, Equiv.apply_symm_apply]
    congr 1
    exact vertexMomentum_relabel π σ ho q v

/-- Without a line joining the exchanged vertices, no analytic locality argument is needed. -/
lemma matchingValue_swap_of_no_line {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : j.val = i.val + 1)
    (hn : ¬ ∃ a : Leg m, a.1 = i ∧ (σ.1 a).1 = j) :
    matchingValue σ f =
      matchingValue (matchingEquiv (Equiv.swap i j) m σ) (f ∘ Equiv.swap i j) := by
  apply matchingValue_relabel
  intro a
  simp only [Equiv.symm_swap]
  have hn₁ : ¬ (a.1 = i ∧ (σ.1 a).1 = j) := fun h => hn ⟨a, h⟩
  have hn₂ : ¬ ((σ.1 a).1 = i ∧ a.1 = j) := by
    rintro ⟨hi, hj⟩
    exact hn ⟨σ.1 a, hi, by simpa only [σ.2.1] using hj⟩
  rcases lt_trichotomy a.1 (σ.1 a).1 with ha | ha | ha
  · exact iff_of_true ha ((swap_preserves_lt i j _ _ hij ha).2 hn₁)
  · exact (σ.2.2 a ha.symm).elim
  · have hb := (swap_preserves_lt i j _ _ hij ha).2 hn₂
    exact iff_of_false (not_lt_of_gt ha) (not_lt_of_gt hb)

/-- Summing the matching bijection lifts a matching-level identity to monomials. -/
lemma monomials_of_matchings (π : Equiv.Perm (Fin n))
    (m : Fin n → Mon) (f : Fin n → TestFunction)
    (hm : ∀ σ : Matching m,
      matchingValue σ f = matchingValue (matchingEquiv π m σ) (f ∘ π)) :
    wightmanMono m f = wightmanMono (m ∘ π) (f ∘ π) := by
  exact Fintype.sum_equiv (matchingEquiv π m) _ _ hm

/-- Insert two adjacent entries between fixed prefix and suffix tuples. -/
def splice {α : Type*} {a b : ℕ} (u : Fin a → α) (x y : α) (v : Fin b → α) :
    Fin (a + (b + 2)) → α := Fin.append u (Fin.cons x (Fin.cons y v))

lemma splice_swap {α : Type*} {a b : ℕ} (u : Fin a → α) (x y : α) (v : Fin b → α) :
    splice u x y v ∘ Equiv.swap (Fin.natAdd a (0 : Fin (b + 2)))
        (Fin.natAdd a (1 : Fin (b + 2))) = splice u y x v := by
  funext k
  refine Fin.addCases (fun l => ?_) (fun l => ?_) k
  · have h0 : Fin.castAdd (b + 2) l ≠ Fin.natAdd a (0 : Fin (b + 2)) := by
      simp only [ne_eq, Fin.ext_iff, Fin.val_castAdd, Fin.val_natAdd, Fin.val_zero]
      omega
    have h1 : Fin.castAdd (b + 2) l ≠ Fin.natAdd a (1 : Fin (b + 2)) := by
      simp only [ne_eq, Fin.ext_iff, Fin.val_castAdd, Fin.val_natAdd, Fin.val_one]
      omega
    simp [comp_apply, Equiv.swap_apply_of_ne_of_ne h0 h1, splice]
  · refine Fin.cases ?_ (fun l => ?_) l
    · simp [splice]
    · refine Fin.cases ?_ (fun l => ?_) l
      · simp [splice, show (0 : Fin (b + 1)).succ = (1 : Fin (b + 2)) from rfl]
      · have h0 : Fin.natAdd a l.succ.succ ≠ Fin.natAdd a (0 : Fin (b + 2)) := by
          simp [Fin.ext_iff]
        have h1 : Fin.natAdd a l.succ.succ ≠ Fin.natAdd a (1 : Fin (b + 2)) := by
          simp [Fin.ext_iff]
        simp [comp_apply, Equiv.swap_apply_of_ne_of_ne h0 h1, splice]

lemma wightW_tuple (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction) :
    wightW (List.ofFn fun i => (P i, f i)) = wightmanL P f := by
  exact congrArg (fun s : Σ n, Fin n → ((Mon →₀ ℂ) × TestFunction) =>
    wightmanL (fun i => (s.2 i).1) (fun i => (s.2 i).2))
    (List.equivSigmaTuple.apply_symm_apply ⟨n, fun i => (P i, f i)⟩)

/-- The list-based Wightman function expressed using tuples of fixed length. -/
lemma wightW_splice (u v : Word) (A B : Mon →₀ ℂ) (f g : TestFunction) :
    wightW (u ++ (A, f) :: (B, g) :: v) =
      wightmanL (splice u.lab A B v.lab) (splice u.test f g v.test) := by
  have h : (fun i => (splice u.lab A B v.lab i, splice u.test f g v.test i)) =
      Fin.append u.get (Fin.cons (A, f) (Fin.cons (B, g) v.get)) := by
    funext i
    refine Fin.addCases (fun j => ?_) (fun j => ?_) i
    · simp [splice, Word.lab, Word.test]
    · refine Fin.cases ?_ (fun j => ?_) j
      · simp [splice]
      · refine Fin.cases ?_ (fun j => ?_) j <;> simp [splice, Word.lab, Word.test]
  have hw := wightW_tuple (splice u.lab A B v.lab) (splice u.test f g v.test)
  rw [h, List.ofFn_fin_append, List.ofFn_cons, List.ofFn_cons,
    List.ofFn_get, List.ofFn_get] at hw
  exact hw

/-- The two variable word functional is continuous in the Schwartz topology. -/
lemma wightW_splice_continuous (u v : Word) (A B : Mon →₀ ℂ) :
    Continuous fun fg : TestFunction × TestFunction =>
      wightW (u ++ (A, fg.1) :: (B, fg.2) :: v) := by
  simp only [wightW_splice]
  apply (wightmanL_continuous (splice u.lab A B v.lab)).comp
  apply continuous_pi
  intro i
  refine Fin.addCases (fun j => ?_) (fun j => ?_) i
  · simpa [splice] using (continuous_const : Continuous fun _ : TestFunction × TestFunction =>
      u.test j)
  · refine Fin.cases ?_ (fun j => ?_) j
    · simpa [splice] using (continuous_fst : Continuous fun fg : TestFunction × TestFunction =>
        fg.1)
    · refine Fin.cases ?_ (fun j => ?_) j
      · simpa [splice] using (continuous_snd : Continuous fun fg : TestFunction × TestFunction =>
          fg.2)
      · simpa [splice] using
          (continuous_const : Continuous fun _ : TestFunction × TestFunction => v.test j)

/-- Locality passes to Schwartz limits. This is the final step of a cutoff argument. -/
lemma local_of_tendsto (u v : Word) (A B : Mon →₀ ℂ)
    (f g : TestFunction) (fs gs : ℕ → TestFunction)
    (hf : Tendsto fs atTop (𝓝 f)) (hg : Tendsto gs atTop (𝓝 g))
    (he : ∀ k, wightW (u ++ (A, fs k) :: (B, gs k) :: v) =
      wightW (u ++ (B, gs k) :: (A, fs k) :: v)) :
    wightW (u ++ (A, f) :: (B, g) :: v) =
      wightW (u ++ (B, g) :: (A, f) :: v) := by
  have hl := ((wightW_splice_continuous u v A B).tendsto (f, g)).comp (hf.prodMk_nhds hg)
  have hr := ((wightW_splice_continuous u v B A).tendsto (g, f)).comp (hg.prodMk_nhds hf)
  exact tendsto_nhds_unique hl (hr.congr' (Filter.Eventually.of_forall fun k => (he k).symm))

/-- Shrinking either closed support preserves exactly the public locality hypothesis. -/
lemma separated_of_tsupport_subset {f g f' g' : TestFunction}
    (h : FieldSystem.SpacelikeSeparated f g)
    (hf : tsupport f' ⊆ tsupport f) (hg : tsupport g' ⊆ tsupport g) :
    FieldSystem.SpacelikeSeparated f' g' :=
  fun x hx y hy => h x (hf hx) y (hg hy)

/-- Multiplication by cutoffs cannot destroy spacelike separation. -/
lemma separated_cutoff {f g : TestFunction} (h : FieldSystem.SpacelikeSeparated f g)
    (χ ψ : Spacetime → ℝ) :
    FieldSystem.SpacelikeSeparated (SchwartzMap.smulLeftCLM ℂ χ f)
      (SchwartzMap.smulLeftCLM ℂ ψ g) :=
  separated_of_tsupport_subset h
    (fun _ hx => (SchwartzMap.tsupport_smulLeftCLM_subset χ f hx).1)
    (fun _ hx => (SchwartzMap.tsupport_smulLeftCLM_subset ψ g hx).1)

/-- Compact spacelike supports have a strictly positive uniform Minkowski margin.
Empty supports are included, as they are in the public axiom. -/
lemma compact_spacelike_margin (f g : TestFunction)
    (hf : HasCompactSupport f) (hg : HasCompactSupport g)
    (h : FieldSystem.SpacelikeSeparated f g) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ x ∈ tsupport f, ∀ y ∈ tsupport g,
      minkowskiSquare (x - y) ≤ -ε := by
  have ht : Continuous time := (EuclideanSpace.proj timeAxis).continuous
  have hs : Continuous spatial := by
    exact (EuclideanSpace.equiv (Fin 3) ℝ).symm.continuous.comp
      (continuous_pi fun i => (EuclideanSpace.proj i.castSucc).continuous)
  have hm : Continuous minkowskiSquare := (ht.pow 2).sub (hs.norm.pow 2)
  obtain ⟨ε, hε, hb⟩ := (hf.prod hg).exists_forall_le'
    (hm.comp (continuous_fst.sub continuous_snd)).neg.continuousOn
    (a := (0 : ℝ)) (fun xy hxy => neg_pos.mpr (h xy.1 hxy.1 xy.2 hxy.2))
  refine ⟨ε, hε, fun x hx y hy => ?_⟩
  have hb' := hb (x, y) ⟨hx, hy⟩
  change ε ≤ -minkowskiSquare (x - y) at hb'
  linarith

/-- Vanishing on a regular closed set forces every jet to vanish there. -/
lemma iteratedFDeriv_eq_zero_on_regularClosed
    {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    {c : E → F} (hc : ContDiff ℝ ∞ c) {V : Set E}
    (hV : closure (interior V) = V) (hz : EqOn c 0 V) (j : ℕ) :
    EqOn (iteratedFDeriv ℝ j c) 0 V := by
  have hi : EqOn (iteratedFDeriv ℝ j c) 0 (interior V) := by
    intro x hx
    have he : c =ᶠ[𝓝 x] 0 :=
      Filter.eventually_of_mem (isOpen_interior.mem_nhds hx)
        (fun y hy => hz (interior_subset hy))
    simpa only [iteratedFDeriv_zero, Pi.zero_apply] using
      (he.iteratedFDeriv ℝ j).eq_of_nhds
  rw [← hV]
  exact hi.closure (hc.continuous_iteratedFDeriv
    (ENat.natCast_le_of_coe_top_le_withTop le_rfl j)) continuous_const

/-- A Taylor bound at a flat point, with a deliberately nonoptimal constant.
Repeated mean-value estimates suffice and work for arbitrary normed targets. -/
lemma norm_iteratedFDeriv_le_of_flat
    {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    {c : E → F} (hc : ContDiff ℝ ∞ c) {y : E}
    (hz : ∀ j, iteratedFDeriv ℝ j c y = 0) {C : ℝ} (hC : 0 ≤ C)
    (N j : ℕ) (hb : ∀ x, ‖iteratedFDeriv ℝ (j + N) c x‖ ≤ C) (x : E) :
    ‖iteratedFDeriv ℝ j c x‖ ≤ C * ‖x - y‖ ^ N := by
  induction N generalizing j x with
  | zero => simpa using hb x
  | succ N ih =>
    have hd : ∀ z ∈ segment ℝ y x,
        ‖fderiv ℝ (iteratedFDeriv ℝ j c) z‖ ≤ C * ‖x - y‖ ^ N := by
      intro z hz'
      rw [norm_fderiv_iteratedFDeriv]
      exact (ih (j + 1) (fun z => by
        rw [show j + 1 + N = j + (N + 1) by omega]; exact hb z)
        z).trans (mul_le_mul_of_nonneg_left
          (pow_le_pow_left₀ (norm_nonneg _) (norm_sub_le_of_mem_segment hz') _) hC)
    have he := (convex_segment y x).norm_image_sub_le_of_norm_fderiv_le
      (fun z _ => (hc.differentiable_iteratedFDeriv
        (ENat.natCast_lt_of_coe_top_le_withTop le_rfl j)).differentiableAt)
      hd (left_mem_segment ℝ y x) (right_mem_segment ℝ y x)
    simpa only [hz j, sub_zero, pow_succ, mul_assoc] using he

/-- Flat Schwartz functions vanish to arbitrary order in the distance to a regular closed
set, while retaining arbitrary decay at infinity. No geometry of the set is needed. -/
lemma schwartz_flat_regularClosed
    {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [ProperSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    (c : SchwartzMap E F) {V : Set E} (hV : IsClosed V) (hne : V.Nonempty)
    (hreg : closure (interior V) = V) (hz : EqOn c 0 V) (N M : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x,
      ‖c x‖ * (1 + ‖x‖) ^ M ≤ C * Metric.infDist x V ^ N := by
  obtain ⟨A, hA, hb⟩ := c.decay 0 (2 * N)
  let B : ℝ := 2 ^ (2 * M) * (Finset.Iic (2 * M, 0)).sup
    (fun m => SchwartzMap.seminorm ℝ m.1 m.2) c
  have hB : 0 ≤ B := by positivity
  refine ⟨max A B, le_trans hA.le (le_max_left _ _), fun x => ?_⟩
  obtain ⟨y, hy, hxy⟩ := hV.exists_infDist_eq_dist hne x
  have hflat : ‖c x‖ ≤ A * Metric.infDist x V ^ (2 * N) := by
    have he := norm_iteratedFDeriv_le_of_flat (c.smooth (⊤ : ℕ∞))
      (fun j => iteratedFDeriv_eq_zero_on_regularClosed (c.smooth (⊤ : ℕ∞)) hreg hz j hy)
      hA.le (2 * N) 0 (fun z => by
        rw [Nat.zero_add]; simpa only [pow_zero, one_mul] using hb z) x
    simpa only [norm_iteratedFDeriv_zero, hxy, dist_eq_norm] using he
  have hdec : (1 + ‖x‖) ^ (2 * M) * ‖c x‖ ≤ B := by
    simpa only [norm_iteratedFDeriv_zero] using
      c.one_add_le_sup_seminorm_apply (𝕜 := ℝ) (m := (2 * M, 0)) le_rfl le_rfl x
  rw [mul_comm 2 N, pow_mul] at hflat
  rw [mul_comm 2 M, pow_mul] at hdec
  have hd : 0 ≤ Metric.infDist x V ^ N := pow_nonneg Metric.infDist_nonneg _
  have hmax : 0 ≤ max A B := hA.le.trans (le_max_left _ _)
  have hprod := mul_le_mul hflat hdec (by positivity) (mul_nonneg hA.le (sq_nonneg _))
  have hAB : A * B ≤ max A B * max A B :=
    mul_le_mul (le_max_left _ _) (le_max_right _ _) hB (by positivity)
  have hs : (‖c x‖ * (1 + ‖x‖) ^ M) ^ 2 ≤
      (max A B * Metric.infDist x V ^ N) ^ 2 := by
    nlinarith only [hprod, mul_le_mul_of_nonneg_right hAB
      (sq_nonneg (Metric.infDist x V ^ N))]
  exact (sq_le_sq₀ (by positivity) (mul_nonneg hmax hd)).mp hs

/-- The two closed causal cones, including their common vertex. -/
def causalCone : Set Spacetime := {x | ‖spatial x‖ ≤ |time x|}

lemma continuous_spatial : Continuous spatial :=
  (EuclideanSpace.equiv (Fin 3) ℝ).symm.continuous.comp
    (continuous_pi fun i => (EuclideanSpace.proj i.castSucc).continuous)

lemma isClosed_causalCone : IsClosed causalCone :=
  isClosed_le continuous_spatial.norm (EuclideanSpace.proj timeAxis).continuous.abs

lemma zero_mem_causalCone : (0 : Spacetime) ∈ causalCone := by
  have hs : spatial (0 : Spacetime) = 0 := by ext i; rfl
  simp [causalCone, hs, time]

lemma mem_causalCone_iff (x : Spacetime) : x ∈ causalCone ↔ ¬ x ∈ spacelike := by
  change ‖spatial x‖ ≤ |time x| ↔ ¬ time x ^ 2 - ‖spatial x‖ ^ 2 < 0
  have hn := norm_nonneg (spatial x)
  have ht := abs_nonneg (time x)
  have hs := sq_abs (time x)
  constructor <;> intro h <;> nlinarith

lemma causalCone_neg (x : Spacetime) : -x ∈ causalCone ↔ x ∈ causalCone := by
  have hs : spatial (-x) = -spatial x := by ext i; rfl
  simp only [causalCone, mem_setOf_eq, hs, norm_neg, time, PiLp.neg_apply, abs_neg]

/-- The light cone has no isolated boundary pieces: it is the closure of its interior. -/
lemma causalCone_regularClosed : closure (interior causalCone) = causalCone := by
  apply Subset.antisymm (closure_minimal interior_subset isClosed_causalCone)
  intro x hx
  rw [Metric.mem_closure_iff]
  intro ε hε
  let a : ℝ := if 0 ≤ time x then ε / 2 else -(ε / 2)
  let y : Spacetime := x + EuclideanSpace.single timeAxis a
  have ha : |a| = ε / 2 := by
    dsimp [a]
    split_ifs <;> simp [abs_of_pos (half_pos hε)]
  have hys : spatial y = spatial x := by
    ext i
    simp [y, spatial, Fin.castSucc_ne_last]
  have hyt : time y = time x + a := by simp [y, time]
  have hstrict : ‖spatial y‖ < |time y| := by
    rw [hys, hyt]
    change ‖spatial x‖ ≤ |time x| at hx
    dsimp [a]
    split_ifs with ht
    · rw [abs_of_nonneg ht] at hx
      rw [abs_of_nonneg (by positivity)]
      linarith
    · have ht' : time x < 0 := lt_of_not_ge ht
      rw [abs_of_neg ht'] at hx
      rw [abs_of_neg (by linarith)]
      linarith
  refine ⟨y, ?_, ?_⟩
  · rw [mem_interior_iff_mem_nhds]
    exact Filter.mem_of_superset
      ((isOpen_lt continuous_spatial.norm
        (EuclideanSpace.proj timeAxis).continuous.abs).mem_nhds hstrict)
      (fun z hz => show ‖spatial z‖ ≤ |time z| from hz.le)
  · have hdist : dist x y = |a| := by
      rw [dist_comm, dist_eq_norm]
      simp [y, Real.norm_eq_abs]
    rw [hdist, ha]
    exact half_lt_self hε

lemma infDist_causalCone_neg (ξ : Spacetime) :
    Metric.infDist (-ξ) causalCone = Metric.infDist ξ causalCone := by
  have hb (x : Spacetime) : Metric.infDist (-x) causalCone ≤ Metric.infDist x causalCone := by
    obtain ⟨y, hy, hxy⟩ := isClosed_causalCone.exists_infDist_eq_dist ⟨0, zero_mem_causalCone⟩ x
    calc
      _ ≤ dist (-x) (-y) := Metric.infDist_le_dist_of_mem ((causalCone_neg y).mpr hy)
      _ = Metric.infDist x causalCone := by rw [dist_neg_neg, ← hxy]
  exact le_antisymm (hb ξ) (by simpa only [neg_neg] using hb (-ξ))

/-- Moving only the time coordinate reaches the cone within the spacelike margin. -/
lemma infDist_causalCone_le_margin (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    Metric.infDist ξ causalCone ≤ ‖spatial ξ‖ - |time ξ| := by
  have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
  let a : ℝ := if 0 ≤ time ξ then ‖spatial ξ‖ - time ξ else -‖spatial ξ‖ - time ξ
  let y : Spacetime := ξ + EuclideanSpace.single timeAxis a
  have hys : spatial y = spatial ξ := by ext i; simp [y, spatial, Fin.castSucc_ne_last]
  have hyt : time y = if 0 ≤ time ξ then ‖spatial ξ‖ else -‖spatial ξ‖ := by
    simp only [y, time, PiLp.add_apply, PiLp.single_apply, ite_true]
    dsimp [a, time]
    split_ifs <;> ring
  have hy : y ∈ causalCone := by
    change ‖spatial y‖ ≤ |time y|
    rw [hys, hyt]
    split_ifs <;> simp [abs_of_nonneg (norm_nonneg (spatial ξ))]
  have ha : |a| = ‖spatial ξ‖ - |time ξ| := by
    dsimp [a]
    split_ifs with ht0
    · rw [abs_of_nonneg ht0] at ht ⊢
      exact abs_of_nonneg (sub_nonneg.mpr ht.le)
    · have ht0' := lt_of_not_ge ht0
      rw [abs_of_neg ht0'] at ht ⊢
      rw [abs_of_neg (by linarith)]
      ring
  calc
    _ ≤ dist ξ y := Metric.infDist_le_dist_of_mem hy
    _ = ‖spatial ξ‖ - |time ξ| := by
      rw [dist_comm, dist_eq_norm]
      simpa only [y, add_sub_cancel_left, PiLp.norm_single, Real.norm_eq_abs] using ha

lemma infDist_causalCone_sq_le (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    Metric.infDist ξ causalCone ^ 2 ≤ ‖spatial ξ‖ ^ 2 - time ξ ^ 2 := by
  have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
  have hd := pow_le_pow_left₀ Metric.infDist_nonneg (infDist_causalCone_le_margin ξ hξ) 2
  nlinarith [sq_abs (time ξ), mul_nonneg (abs_nonneg (time ξ)) (sub_nonneg.mpr ht.le)]

/-- The flatness estimate used to dominate the spacelike boundary products. -/
lemma schwartz_flat_causalCone (c : TestFunction) (hz : EqOn c 0 causalCone) (N M : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x,
      ‖c x‖ * (1 + ‖x‖) ^ M ≤ C * Metric.infDist x causalCone ^ N :=
  schwartz_flat_regularClosed c isClosed_causalCone ⟨0, zero_mem_causalCone⟩
    causalCone_regularClosed hz N M

/-- Reflection in position space, as a continuous operator on Schwartz space. -/
def reflectTest (f : TestFunction) : TestFunction :=
  SchwartzMap.compCLMOfContinuousLinearEquiv ℂ (ContinuousLinearEquiv.neg ℝ) f

@[simp] lemma reflectTest_apply (f : TestFunction) (x : Spacetime) :
    reflectTest f x = f (-x) := rfl

/-- The Schwartz function of the difference variable for the two exchanged tests. -/
def differenceTest (f g : TestFunction) : TestFunction :=
  SchwartzMap.convolution (ContinuousLinearMap.mul ℂ ℂ) (reflectTest f) g

lemma differenceTest_apply (f g : TestFunction) (ξ : Spacetime) :
    differenceTest f g ξ = ∫ x : Spacetime, f x * g (x + ξ) := by
  rw [differenceTest, SchwartzMap.convolution_apply, convolution]
  rw [← integral_neg_eq_self]
  apply integral_congr_ae
  filter_upwards [] with x
  simp [sub_eq_add_neg, add_comm]

lemma differenceTest_zero_on_causalCone (f g : TestFunction)
    (h : FieldSystem.SpacelikeSeparated f g) : EqOn (differenceTest f g) 0 causalCone := by
  intro ξ hξ
  rw [differenceTest_apply]
  apply integral_eq_zero_of_ae
  filter_upwards [] with x
  by_cases hf : f x = 0
  · simp [hf]
  by_cases hg : g (x + ξ) = 0
  · simp [hg]
  have hs := h x (subset_tsupport f hf) (x + ξ) (subset_tsupport g hg)
  rw [show x - (x + ξ) = -ξ by abel] at hs
  exact ((mem_causalCone_iff (-ξ)).mp ((causalCone_neg ξ).mpr hξ) hs).elim

lemma differenceTest_flat (f g : TestFunction) (h : FieldSystem.SpacelikeSeparated f g)
    (N M : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ ξ,
      ‖differenceTest f g ξ‖ * (1 + ‖ξ‖) ^ M ≤
        C * Metric.infDist ξ causalCone ^ N :=
  schwartz_flat_causalCone _ (differenceTest_zero_on_causalCone f g h) N M

lemma fourierE_eq_fourier (f : TestFunction) (p : Spacetime) :
    fourierE f p = FourierTransform.fourier f (-((2 * Real.pi)⁻¹) • p) := by
  rw [SchwartzMap.fourier_coe, Real.fourier_eq']
  unfold fourierE
  apply integral_congr_ae
  filter_upwards [] with x
  rw [inner_smul_right]
  have he : -2 * Real.pi * (-((2 * Real.pi)⁻¹) * ⟪x, p⟫_ℝ) = ⟪x, p⟫_ℝ := by
    field_simp
  rw [he]
  simp only [smul_eq_mul, mul_comm]

lemma fourierE_reflectTest (f : TestFunction) (p : Spacetime) :
    fourierE (reflectTest f) p = fourierE f (-p) := by
  unfold fourierE
  rw [← integral_neg_eq_self]
  apply integral_congr_ae
  filter_upwards [] with x
  simp only [reflectTest_apply, neg_neg, inner_neg_left, inner_neg_right]

lemma fourierE_differenceTest (f g : TestFunction) (p : Spacetime) :
    fourierE (differenceTest f g) p = fourierE f (-p) * fourierE g p := by
  rw [← fourierE_reflectTest f p]
  simp only [fourierE_eq_fourier, differenceTest, SchwartzMap.fourier_convolution,
    SchwartzMap.pairing_apply_apply, ContinuousLinearMap.mul_apply']

/-- Interchanging the tests reflects their difference variable. -/
lemma differenceTest_swap (f g : TestFunction) (ξ : Spacetime) :
    differenceTest g f (-ξ) = differenceTest f g ξ := by
  rw [differenceTest_apply, differenceTest_apply,
    ← integral_add_right_eq_self (fun x => g x * f (x + -ξ)) ξ]
  apply integral_congr_ae
  filter_upwards [] with x
  simp [mul_comm]

/-- A common integrable majorant for any family with fixed polynomial growth and
finite-order singularities along the causal cone. -/
lemma flat_polynomial_majorant (c : TestFunction) (hc : EqOn c 0 causalCone)
    (C : ℝ) (hC : 0 ≤ C) (N : ℕ) :
    ∃ b : Spacetime → ℝ, Integrable b ∧ ∀ K : Spacetime → ℂ,
      (∀ ξ, ξ ∉ causalCone →
        ‖K ξ‖ ≤ C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N) →
      ∀ ξ, ‖K ξ * c ξ‖ ≤ b ξ := by
  obtain ⟨A, hA, ha⟩ := schwartz_flat_causalCone c hc N (N + 5)
  have hi : Integrable (fun ξ : Spacetime => C * A / (1 + ‖ξ‖) ^ 5) := by
    have hi := (integrable_one_add_norm (E := Spacetime) (μ := volume) (r := 5)
      (by norm_num)).const_mul (C * A)
    convert hi using 1
    ext ξ
    rw [Real.rpow_neg (by positivity), show (5 : ℝ) = (5 : ℕ) from rfl,
      Real.rpow_natCast, div_eq_mul_inv]
  refine ⟨_, hi, ?_⟩
  intro K hK ξ
  by_cases hξ : ξ ∈ causalCone
  · rw [hc hξ, Pi.zero_apply, mul_zero, norm_zero]
    positivity
  have hd : 0 < Metric.infDist ξ causalCone ^ N := pow_pos
    ((isClosed_causalCone.notMem_iff_infDist_pos ⟨0, zero_mem_causalCone⟩).mp hξ) N
  rw [norm_mul, le_div_iff₀ (by positivity)]
  calc
    ‖K ξ‖ * ‖c ξ‖ * (1 + ‖ξ‖) ^ 5
        ≤ (C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N) *
          ‖c ξ‖ * (1 + ‖ξ‖) ^ 5 := by gcongr; exact hK ξ hξ
    _ = (C / Metric.infDist ξ causalCone ^ N) *
          (‖c ξ‖ * (1 + ‖ξ‖) ^ (N + 5)) := by rw [pow_add]; ring
    _ ≤ (C / Metric.infDist ξ causalCone ^ N) *
          (A * Metric.infDist ξ causalCone ^ N) :=
      mul_le_mul_of_nonneg_left (ha ξ) (div_nonneg hC hd.le)
    _ = C * A := by field_simp

lemma integrable_mul_flat (c : TestFunction) (hc : EqOn c 0 causalCone)
    (K : Spacetime → ℂ) (hm : AEStronglyMeasurable K)
    (C : ℝ) (hC : 0 ≤ C) (N : ℕ)
    (hb : ∀ ξ, ξ ∉ causalCone →
      ‖K ξ‖ ≤ C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N) :
    Integrable (fun ξ => K ξ * c ξ) := by
  obtain ⟨b, hi, hb'⟩ := flat_polynomial_majorant c hc C hC N
  exact hi.mono' (hm.mul c.continuous.aestronglyMeasurable)
    (Filter.Eventually.of_forall (hb' K hb))

/-- Dominated convergence for a flat Schwartz function times a singular kernel. -/
lemma tendsto_integral_mul_flat_zero (c : TestFunction) (hc : EqOn c 0 causalCone)
    (K : ℝ → Spacetime → ℂ) (C : ℝ) (hC : 0 ≤ C) (N : ℕ)
    (hm : ∀ᶠ ε in 𝓝[>] (0 : ℝ), AEStronglyMeasurable (K ε))
    (hb : ∀ᶠ ε in 𝓝[>] (0 : ℝ), ∀ ξ, ξ ∉ causalCone →
      ‖K ε ξ‖ ≤ C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N)
    (hl : ∀ ξ, ξ ∉ causalCone →
      Tendsto (fun ε => K ε ξ) (𝓝[>] (0 : ℝ)) (𝓝 0)) :
    Tendsto (fun ε => ∫ ξ, K ε ξ * c ξ) (𝓝[>] (0 : ℝ)) (𝓝 0) := by
  obtain ⟨b, hi, hb'⟩ := flat_polynomial_majorant c hc C hC N
  have hbound : ∀ᶠ ε in 𝓝[>] (0 : ℝ), ∀ᵐ ξ, ‖K ε ξ * c ξ‖ ≤ b ξ :=
    hb.mono fun ε hε => Filter.Eventually.of_forall (hb' (K ε) hε)
  have hl' : ∀ᵐ ξ, Tendsto (fun ε => K ε ξ * c ξ) (𝓝[>] (0 : ℝ)) (𝓝 (0 : ℂ)) := by
    filter_upwards [] with ξ
    by_cases hξ : ξ ∈ causalCone
    · simpa only [hc hξ, Pi.zero_apply, mul_zero] using tendsto_const_nhds (x := (0 : ℂ))
    · simpa only [zero_mul] using (hl ξ hξ).mul_const (c ξ)
  have hm' : ∀ᶠ ε in 𝓝[>] (0 : ℝ), AEStronglyMeasurable (fun ξ => K ε ξ * c ξ) :=
    hm.mono fun ε hε => hε.mul c.continuous.aestronglyMeasurable
  simpa only [integral_zero] using
    tendsto_integral_filter_of_dominated_convergence _ hm' hbound hi hl'

/-- The permitted Euclidean identity determines the scalar kernel on the imaginary-time axis. -/
lemma lineC_zero_euclid {τ : ℝ} (hτ : 0 < τ) (u : Space) :
    lineC 0 0 ((τ : ℂ) * Complex.I) u =
      (Sr (Real.sqrt (τ ^ 2 + ‖u‖ ^ 2)) : ℂ) := by
  rw [lineC]
  have he (p : Spacetime) :
      Complex.I * ((τ : ℂ) * Complex.I * (time p : ℂ) + (⟪u, spatial p⟫_ℝ : ℂ)) =
        -((τ * time p : ℝ) : ℂ) + Complex.I * (⟪u, spatial p⟫_ℝ : ℂ) := by
    push_cast
    linear_combination (τ : ℂ) * (time p : ℂ) * Complex.I_sq
  simpa only [Amono, Bmono, Pi.zero_apply, pow_zero, Finset.prod_const_one,
    one_mul, he] using Sr_euclid hτ u

/-- The norm of a scalar Fourier--Laplace integral is bounded by its radial Laplace integral. -/
lemma norm_lineC_zero_le (z : ℂ) (u : Space) : ‖lineC 0 0 z u‖ ≤ Sr z.im := by
  unfold lineC Sr
  refine (norm_integral_le_integral_norm _).trans_eq ?_
  apply integral_congr_ae
  filter_upwards [] with p
  simp only [Amono, Bmono, Pi.zero_apply, pow_zero, Finset.prod_const_one, one_mul]
  rw [norm_mul, Complex.norm_exp, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (weight_nonneg p)]
  simp [Complex.mul_re, Complex.mul_im]

/-- The permitted Euclidean derivative estimate includes the scalar radial bound. -/
lemma Sr_abs_bound : ∃ C : ℝ, 0 ≤ C ∧ ∀ r : ℝ, 0 < r → |Sr r| ≤ C / r ^ 8 := by
  obtain ⟨C, hb⟩ := partialDeriv_S_bound (0 : Idx)
  refine ⟨max C 0, le_max_right _ _, fun r hr => ?_⟩
  have h := hb (EuclideanSpace.single timeAxis r) (by simpa using hr.ne')
  have h' : |Sr r| ≤ C / r ^ 8 := by
    simpa [partialDeriv_zero, S, abs_of_pos hr, idxOrder] using h
  exact h'.trans (div_le_div_of_nonneg_right (le_max_left _ _) (by positivity))

/-- The scalar kernel is constant on the Euclidean semicircle used in the locality argument.
This only evaluates points strictly inside the tube; it asserts no boundary limit. -/
lemma lineC_zero_semicircle (r : ℝ) (hr : 0 < r) (e : Space) (he : ‖e‖ = 1)
    (θ : ℝ) (hθ : 0 < θ) (hθπ : θ < Real.pi) :
    lineC 0 0 (((r * Real.sin θ : ℝ) : ℂ) * Complex.I)
      ((r * Real.cos θ) • e) = (Sr r : ℂ) := by
  rw [lineC_zero_euclid (mul_pos hr (Real.sin_pos_of_pos_of_lt_pi hθ hθπ))]
  rw [norm_smul, he, mul_one, Real.norm_eq_abs, sq_abs, mul_pow, mul_pow,
    ← mul_add, Real.sin_sq_add_cos_sq, mul_one, Real.sqrt_sq hr.le]

/-- The positive-real-part radial coordinate on the spacelike time strip. -/
def radialRoot (r : ℝ) (z : ℂ) : ℂ := Complex.sqrt ((r : ℂ) ^ 2 - z ^ 2)

lemma radialRoot_radicand_pos {r : ℝ} {z : ℂ} (hz : |z.re| < r) :
    0 < ((r : ℂ) ^ 2 - z ^ 2).re := by
  have h := abs_lt.mp hz
  simp only [pow_two, Complex.sub_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
    mul_zero, sub_zero]
  nlinarith [sq_nonneg z.im, sq_abs z.re]

lemma radialRoot_re_pos {r : ℝ} {z : ℂ} (hz : |z.re| < r) :
    0 < (radialRoot r z).re := by
  rw [radialRoot, Complex.sqrt, Complex.cpow_inv_two_re]
  apply Real.sqrt_pos.2
  have h := radialRoot_radicand_pos hz
  positivity

lemma radialRoot_sq (r : ℝ) (z : ℂ) :
    radialRoot r z ^ 2 = (r : ℂ) ^ 2 - z ^ 2 :=
  Complex.cpow_nat_inv_pow _ (by norm_num : (2 : ℕ) ≠ 0)

lemma radialRoot_unique {r : ℝ} {z w : ℂ} (hz : |z.re| < r) (hw : 0 < w.re)
    (hsq : w ^ 2 = (r : ℂ) ^ 2 - z ^ 2) : radialRoot r z = w := by
  rcases eq_or_eq_neg_of_sq_eq_sq _ _ ((radialRoot_sq r z).trans hsq.symm) with he | he
  · exact he
  · have hp := radialRoot_re_pos hz
    rw [he, Complex.neg_re] at hp
    linarith

lemma radialRoot_real {r t : ℝ} (ht : |t| < r) :
    radialRoot r t = (Real.sqrt (r ^ 2 - t ^ 2) : ℂ) := by
  have hp : 0 < r ^ 2 - t ^ 2 := by nlinarith [abs_lt.mp ht, sq_abs t]
  apply radialRoot_unique (by simpa using ht) (Real.sqrt_pos.2 hp)
  rw [← Complex.ofReal_pow, Real.sq_sqrt hp.le]
  push_cast
  rfl

lemma radialRoot_imag {r : ℝ} (hr : 0 < r) (t : ℝ) :
    radialRoot r ((t : ℂ) * Complex.I) = (Real.sqrt (r ^ 2 + t ^ 2) : ℂ) := by
  apply radialRoot_unique (by simpa using hr) (Real.sqrt_pos.2 (by positivity))
  rw [← Complex.ofReal_pow, Real.sq_sqrt (by positivity), mul_pow, Complex.I_sq]
  push_cast
  ring

lemma radialRoot_differentiableAt {r : ℝ} {z : ℂ} (hz : |z.re| < r) :
    DifferentiableAt ℂ (radialRoot r) z :=
  (Complex.differentiableAt_sqrt (Or.inl (radialRoot_radicand_pos hz))).comp z
    ((differentiableAt_const _).sub (differentiableAt_id.pow 2))

/-- A holomorphic extension across every real spacelike time difference. -/
def scalarExtension (u : Space) (z : ℂ) : ℂ :=
  lineC 0 0 (radialRoot ‖u‖ z * Complex.I) 0

lemma scalarExtension_differentiableAt (u : Space) {z : ℂ} (hz : |z.re| < ‖u‖) :
    DifferentiableAt ℂ (scalarExtension u) z := by
  have hr : 0 < (radialRoot ‖u‖ z * Complex.I).im := by
    simpa using radialRoot_re_pos hz
  have hc := (lineC_differentiableOn 0 0 0).differentiableAt
    ((isOpen_lt continuous_const Complex.continuous_im).mem_nhds hr)
  have he := hc.comp z ((radialRoot_differentiableAt hz).mul_const Complex.I)
  convert! he using 1

lemma scalarExtension_imag (u : Space) (hu : 0 < ‖u‖) {t : ℝ} (ht : 0 < t) :
    scalarExtension u ((t : ℂ) * Complex.I) = lineC 0 0 ((t : ℂ) * Complex.I) u := by
  rw [scalarExtension, radialRoot_imag hu, lineC_zero_euclid (Real.sqrt_pos.2 (by positivity)),
    lineC_zero_euclid ht]
  simp only [norm_zero, sq, zero_mul, add_zero]
  rw [Real.mul_self_sqrt (by positivity), add_comm (‖u‖ * ‖u‖)]

/-- The Euclidean identity fixes the scalar line throughout the upper spacelike strip. -/
lemma lineC_zero_eq_scalarExtension (u : Space) {z : ℂ}
    (hz : |z.re| < ‖u‖) (him : 0 < z.im) :
    lineC 0 0 z u = scalarExtension u z := by
  let U : Set ℂ := {w | |w.re| < ‖u‖} ∩ {w | 0 < w.im}
  have hopen : IsOpen U := (isOpen_lt Complex.continuous_re.abs continuous_const).inter
    (isOpen_lt continuous_const Complex.continuous_im)
  have hu : 0 < ‖u‖ := lt_of_le_of_lt (abs_nonneg _) hz
  have hc : Convex ℝ U := by
    have hr := (convex_Ioo (-‖u‖) ‖u‖).linear_preimage Complex.reLm
    have hi := (convex_Ioi (0 : ℝ)).linear_preimage Complex.imLm
    change Convex ℝ {w : ℂ | -‖u‖ < w.re ∧ w.re < ‖u‖} at hr
    change Convex ℝ {w : ℂ | 0 < w.im} at hi
    simpa only [← abs_lt] using hr.inter hi
  have hf : AnalyticOnNhd ℂ (fun w => lineC 0 0 w u) U :=
    ((lineC_differentiableOn 0 0 u).mono Set.inter_subset_right).analyticOnNhd hopen
  have hg : AnalyticOnNhd ℂ (scalarExtension u) U :=
    (show DifferentiableOn ℂ (scalarExtension u) U from
      fun w hw => (scalarExtension_differentiableAt u hw.1).differentiableWithinAt).analyticOnNhd
        hopen
  apply hf.eqOn_of_preconnected_of_mem_closure hg hc.isPreconnected
    (show Complex.I ∈ U by simp [U, hu]) ?_ ⟨hz, him⟩
  rw [Metric.mem_closure_iff]
  intro ε hε
  let t : ℝ := 1 + ε / 2
  have ht : 0 < t := by dsimp [t]; positivity
  refine ⟨(t : ℂ) * Complex.I, ⟨(scalarExtension_imag u hu ht).symm, ?_⟩, ?_⟩
  · simp only [Set.mem_singleton_iff]
    intro he
    have he' := congrArg Complex.im he
    simp only [Complex.mul_im, Complex.ofReal_re, Complex.I_im, mul_one,
      Complex.ofReal_im, Complex.I_re, mul_zero, add_zero] at he'
    dsimp [t] at he'
    linarith
  · have he : Complex.I - (t : ℂ) * Complex.I = -(ε / 2 : ℝ) * Complex.I := by
      dsimp [t]
      push_cast
      ring
    rw [dist_eq_norm, he, norm_mul, Complex.norm_I, mul_one, norm_neg,
      Complex.norm_real, Real.norm_eq_abs, abs_of_pos (half_pos hε)]
    exact half_lt_self hε

lemma scalarExtension_real (u : Space) {t : ℝ} (ht : |t| < ‖u‖) :
    scalarExtension u t = (Sr (Real.sqrt (‖u‖ ^ 2 - t ^ 2)) : ℂ) := by
  have hp : 0 < ‖u‖ ^ 2 - t ^ 2 := by nlinarith [abs_lt.mp ht, sq_abs t]
  rw [scalarExtension, radialRoot_real ht, lineC_zero_euclid (Real.sqrt_pos.2 hp)]
  simp only [norm_zero, sq, zero_mul, add_zero]
  rw [Real.sqrt_mul_self (Real.sqrt_nonneg _)]

/-- The scalar line has the expected boundary value at every spacelike difference.
This is a genuine limit from positive heights, not the totalised integral at height zero. -/
lemma lineC_zero_spacelike_boundary (t : ℝ) (u : Space) (ht : |t| < ‖u‖) :
    Tendsto (fun ε : ℝ => lineC 0 0 ((t : ℂ) + (ε : ℂ) * Complex.I) u)
      (𝓝[>] 0) (𝓝 (Sr (Real.sqrt (‖u‖ ^ 2 - t ^ 2)) : ℂ)) := by
  have he : Tendsto (fun ε : ℝ => (t : ℂ) + (ε : ℂ) * Complex.I) (𝓝[>] 0) (𝓝 (t : ℂ)) := by
    have hc : Continuous (fun ε : ℝ => (t : ℂ) + (ε : ℂ) * Complex.I) := by fun_prop
    simpa using (hc.tendsto (0 : ℝ)).mono_left (nhdsWithin_le_nhds (s := Set.Ioi 0))
  have hc := (scalarExtension_differentiableAt u (by simpa using ht)).continuousAt.tendsto.comp he
  rw [scalarExtension_real u ht] at hc
  apply hc.congr'
  filter_upwards [self_mem_nhdsWithin] with ε hε
  exact (lineC_zero_eq_scalarExtension u (by simpa using ht) (by simpa using hε)).symm

/-- Reversing a spacelike difference gives the same scalar boundary value. -/
lemma lineC_zero_spacelike_boundary_reverse (t : ℝ) (u : Space) (ht : |t| < ‖u‖) :
    Tendsto (fun ε : ℝ => lineC 0 0 ((-t : ℂ) + (ε : ℂ) * Complex.I) (-u))
      (𝓝[>] 0) (𝓝 (Sr (Real.sqrt (‖u‖ ^ 2 - t ^ 2)) : ℂ)) := by
  simpa only [Complex.ofReal_neg, norm_neg, neg_sq] using
    lineC_zero_spacelike_boundary (-t) (-u) (by simpa only [abs_neg, norm_neg] using ht)

/-- The radial square root stays uniformly away from zero above a spacelike point. -/
lemma radialRoot_re_ge_infDist (ξ : Spacetime) (hξ : ξ ∉ causalCone) (ε : ℝ) :
    Metric.infDist ξ causalCone ≤
      (radialRoot ‖spatial ξ‖ ((time ξ : ℂ) + (ε : ℂ) * Complex.I)).re := by
  have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
  have hp := radialRoot_re_pos (r := ‖spatial ξ‖)
    (z := (time ξ : ℂ) + (ε : ℂ) * Complex.I) (by simpa using ht)
  have he := congrArg Complex.re
    (radialRoot_sq ‖spatial ξ‖ ((time ξ : ℂ) + (ε : ℂ) * Complex.I))
  simp only [pow_two, Complex.sub_re, Complex.mul_re, Complex.add_re, Complex.add_im,
    Complex.ofReal_re, Complex.ofReal_im, Complex.I_re, Complex.I_im,
    mul_zero, mul_one, add_zero, zero_add, sub_zero] at he
  have hd := infDist_causalCone_sq_le ξ hξ
  have hd0 : 0 ≤ Metric.infDist ξ causalCone := Metric.infDist_nonneg
  nlinarith [sq_nonneg ε,
    sq_nonneg (radialRoot ‖spatial ξ‖ ((time ξ : ℂ) + (ε : ℂ) * Complex.I)).im]

/-- A uniform order-eight cone bound for the scalar line, at every positive height. -/
lemma lineC_zero_uniform_bound :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ ε : ℝ, 0 < ε → ∀ ξ : Spacetime, ξ ∉ causalCone →
      ‖lineC 0 0 ((time ξ : ℂ) + (ε : ℂ) * Complex.I) (spatial ξ)‖ ≤
        C / Metric.infDist ξ causalCone ^ 8 := by
  obtain ⟨C, hC, hb⟩ := Sr_abs_bound
  refine ⟨C, hC, fun ε hε ξ hξ => ?_⟩
  have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
  have hp := radialRoot_re_pos (r := ‖spatial ξ‖)
    (z := (time ξ : ℂ) + (ε : ℂ) * Complex.I) (by simpa using ht)
  have hd : 0 < Metric.infDist ξ causalCone :=
    (isClosed_causalCone.notMem_iff_infDist_pos ⟨0, zero_mem_causalCone⟩).mp hξ
  rw [lineC_zero_eq_scalarExtension _ (by simpa using ht) (by simpa using hε)]
  calc
    _ ≤ Sr (radialRoot ‖spatial ξ‖ ((time ξ : ℂ) + (ε : ℂ) * Complex.I)).re := by
      simpa only [scalarExtension, Complex.mul_I_im] using
        norm_lineC_zero_le (radialRoot ‖spatial ξ‖
          ((time ξ : ℂ) + (ε : ℂ) * Complex.I) * Complex.I) 0
    _ ≤ |Sr (radialRoot ‖spatial ξ‖ ((time ξ : ℂ) + (ε : ℂ) * Complex.I)).re| := le_abs_self _
    _ ≤ C / (radialRoot ‖spatial ξ‖ ((time ξ : ℂ) + (ε : ℂ) * Complex.I)).re ^ 8 := hb _ hp
    _ ≤ C / Metric.infDist ξ causalCone ^ 8 :=
      div_le_div_of_nonneg_left hC (pow_pos hd 8)
        (pow_le_pow_left₀ hd.le (radialRoot_re_ge_infDist ξ hξ ε) 8)

/-- Change the chosen representative of every orbit of a fixed-point-free involution. -/
def orientEquiv {L : Type*} (σ : Equiv.Perm L) (hσ : ∀ a, σ (σ a) = a)
    (p q : L → Prop) (hp : ∀ a, p (σ a) ↔ ¬ p a) (hq : ∀ a, q (σ a) ↔ ¬ q a) :
    {a // p a} ≃ {a // q a} where
  toFun a := ⟨if q a.1 then a.1 else σ a.1, by
    split_ifs with h
    · exact h
    · exact (hq a.1).2 h⟩
  invFun a := ⟨if p a.1 then a.1 else σ a.1, by
    split_ifs with h
    · exact h
    · exact (hp a.1).2 h⟩
  left_inv a := by
    apply Subtype.ext
    dsimp
    by_cases h : q a.1
    · simp [h, a.2]
    · simp [h, hp, a.2, hσ]
  right_inv a := by
    apply Subtype.ext
    dsimp
    by_cases h : p a.1
    · simp [h, a.2]
    · simp [h, hq, a.2, hσ]

/-- Relabel all lines, reversing their representatives when required by the new order. -/
def allLineEquiv (π : Equiv.Perm (Fin n)) {m : Fin n → Mon} (σ : Matching m) :
    Line σ ≃ Line (matchingEquiv π m σ) :=
  (orientEquiv σ.1 σ.2.1 (fun a => a.1 < (σ.1 a).1)
    (fun a => π.symm a.1 < π.symm (σ.1 a).1)
    (fun a => by rw [σ.2.1]; exact ⟨not_lt_of_gt,
      fun h => lt_of_le_of_ne (le_of_not_gt h) (σ.2.2 a)⟩)
    (fun a => by rw [σ.2.1]; exact ⟨not_lt_of_gt,
      fun h => lt_of_le_of_ne (le_of_not_gt h) (π.symm.injective.ne (σ.2.2 a))⟩)).trans
    (Equiv.subtypeEquiv (legEquiv π m).symm (fun a => by simp))

/-- Exactly the joining lines reverse under an adjacent exchange. -/
def Joins {m : Fin n → Mon} (σ : Matching m) (i j : Fin n) (a : Line σ) : Prop :=
  a.1.1 = i ∧ (σ.1 a.1).1 = j

lemma allLineEquiv_swap_coe {m : Fin n → Mon} (σ : Matching m)
    (i j : Fin n) (hij : j.val = i.val + 1) (a : Line σ) :
    (allLineEquiv (Equiv.swap i j) σ a).1 =
      (legEquiv (Equiv.swap i j) m).symm
        (if Joins σ i j a then σ.1 a.1 else a.1) := by
  simp only [allLineEquiv, Equiv.trans_apply, Equiv.subtypeEquiv_apply, orientEquiv,
    Equiv.coe_fn_mk]
  change (legEquiv (Equiv.swap i j) m).symm
    (if (Equiv.swap i j).symm a.1.1 < (Equiv.swap i j).symm (σ.1 a.1).1
      then a.1 else σ.1 a.1) = _
  simp only [Equiv.symm_swap, swap_preserves_lt i j _ _ hij a.2, Joins, ite_not]
  split_ifs <;> rfl

/-- Reversing a line changes its sign in every vertex momentum. -/
lemma vertexMomentum_swap {m : Fin n → Mon} (σ : Matching m)
    (i j : Fin n) (hij : j.val = i.val + 1)
    (q : Line (matchingEquiv (Equiv.swap i j) m σ) → Spacetime) (v : Fin n) :
    vertexMomentum σ
      (fun a => if Joins σ i j a then -q (allLineEquiv (Equiv.swap i j) σ a)
        else q (allLineEquiv (Equiv.swap i j) σ a)) v =
      vertexMomentum (matchingEquiv (Equiv.swap i j) m σ) q (Equiv.swap i j v) := by
  unfold vertexMomentum
  rw [← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib]
  apply Fintype.sum_equiv (allLineEquiv (Equiv.swap i j) σ)
  intro a
  rw [allLineEquiv_swap_coe σ i j hij a, matchingEquiv_apply]
  simp only [Equiv.apply_symm_apply]
  by_cases ha : Joins σ i j a
  · simp only [if_pos ha, σ.2.1, legEquiv_symm_vertex, Equiv.symm_swap,
      Equiv.apply_eq_iff_eq]
    split_ifs <;> abel
  · simp [ha, Equiv.symm_swap]

/-- The integrand with the joining lines reversed, expressed in the original line variables. -/
def reversedIntegrand {m : Fin n → Mon} (σ : Matching m) (f : Fin n → TestFunction)
    (i j : Fin n) (q : Line σ → Spacetime) : ℂ :=
  (∏ a : Line σ,
    (if Joins σ i j a then Amono (σ.1 a.1).idx (q a) * Bmono a.1.idx (q a)
      else Amono a.1.idx (q a) * Bmono (σ.1 a.1).idx (q a)) * (weight (q a) : ℂ)) *
    ∏ v : Fin n, fourierE (f v)
      (vertexMomentum σ (fun a => if Joins σ i j a then -q a else q a) v)

lemma reversedIntegrand_relabel {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : j.val = i.val + 1)
    (q : Line (matchingEquiv (Equiv.swap i j) m σ) → Spacetime) :
    reversedIntegrand σ f i j (q ∘ allLineEquiv (Equiv.swap i j) σ) =
      (∏ a : Line (matchingEquiv (Equiv.swap i j) m σ),
        Amono a.1.idx (q a) * Bmono ((matchingEquiv (Equiv.swap i j) m σ).1 a.1).idx
          (q a) * (weight (q a) : ℂ)) *
        ∏ v : Fin n, fourierE ((f ∘ Equiv.swap i j) v)
          (vertexMomentum (matchingEquiv (Equiv.swap i j) m σ) q v) := by
  unfold reversedIntegrand
  apply congrArg₂ (fun a b : ℂ => a * b)
  · apply Fintype.prod_equiv (allLineEquiv (Equiv.swap i j) σ)
    intro a
    rw [allLineEquiv_swap_coe σ i j hij a, matchingEquiv_apply]
    simp only [Equiv.apply_symm_apply]
    by_cases ha : Joins σ i j a <;> simp [ha, σ.2.1]
  · apply Fintype.prod_equiv (Equiv.swap i j)
    intro v
    simp only [comp_apply, Equiv.swap_apply_self, vertexMomentum_swap σ i j hij]

set_option maxHeartbeats 1000000 in
lemma reversedIntegrand_integrable {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : j.val = i.val + 1) :
    Integrable (reversedIntegrand σ f i j) := by
  let e := MeasurableEquiv.piCongrLeft (fun _ : Line σ => Spacetime)
    (allLineEquiv (Equiv.swap i j) σ).symm
  have he := volume_measurePreserving_piCongrLeft (fun _ : Line σ => Spacetime)
    (allLineEquiv (Equiv.swap i j) σ).symm
  rw [← he.integrable_comp_emb e.measurableEmbedding]
  convert matching_integrable (m ∘ Equiv.swap i j)
    (matchingEquiv (Equiv.swap i j) m σ) (f ∘ Equiv.swap i j) using 1
  funext q
  have hq : e q = q ∘ allLineEquiv (Equiv.swap i j) σ := by
    funext a
    simp [e, MeasurableEquiv.coe_piCongrLeft, Equiv.piCongrLeft_apply]
  change reversedIntegrand σ f i j (e q) = _
  rw [hq]
  exact reversedIntegrand_relabel σ f i j hij q

set_option maxHeartbeats 1000000 in
lemma matchingValue_swapped {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : j.val = i.val + 1) :
    matchingValue (matchingEquiv (Equiv.swap i j) m σ) (f ∘ Equiv.swap i j) =
      ∫ q, reversedIntegrand σ f i j q := by
  rw [← (volume_measurePreserving_piCongrLeft (fun _ : Line σ => Spacetime)
    (allLineEquiv (Equiv.swap i j) σ).symm).integral_comp']
  apply integral_congr_ae
  filter_upwards [] with q
  have hq : MeasurableEquiv.piCongrLeft (fun _ : Line σ => Spacetime)
      (allLineEquiv (Equiv.swap i j) σ).symm q = q ∘ allLineEquiv (Equiv.swap i j) σ := by
    funext a
    simp [MeasurableEquiv.coe_piCongrLeft, Equiv.piCongrLeft_apply]
  rw [hq]
  exact (reversedIntegrand_relabel σ f i j hij q).symm

/-- Momenta contributed by all lines other than those joining the exchanged vertices. -/
def spectatorMomentum {m : Fin n → Mon} (σ : Matching m) (i j : Fin n)
    (r : {a : Line σ // ¬ Joins σ i j a} → Spacetime) (v : Fin n) : Spacetime :=
  (∑ a, if (σ.1 a.1.1).1 = v then r a else 0) -
    ∑ a, if a.1.1.1 = v then r a else 0

lemma vertexMomentum_split {m : Fin n → Mon} (σ : Matching m)
    (i j : Fin n) (q : Line σ → Spacetime) (v : Fin n) :
    vertexMomentum σ q v = spectatorMomentum σ i j (fun a => q a.1) v +
      (if j = v then ∑ a : {a : Line σ // Joins σ i j a}, q a.1 else 0) -
      (if i = v then ∑ a : {a : Line σ // Joins σ i j a}, q a.1 else 0) := by
  have hi : (∑ a : {a : Line σ // Joins σ i j a},
      if a.1.1.1 = v then q a.1 else 0) =
      if i = v then ∑ a : {a : Line σ // Joins σ i j a}, q a.1 else 0 := by
    simp_rw [show ∀ a : {a : Line σ // Joins σ i j a}, a.1.1.1 = i from fun a => a.2.1]
    split_ifs <;> simp
  have hj : (∑ a : {a : Line σ // Joins σ i j a},
      if (σ.1 a.1.1).1 = v then q a.1 else 0) =
      if j = v then ∑ a : {a : Line σ // Joins σ i j a}, q a.1 else 0 := by
    simp_rw [show ∀ a : {a : Line σ // Joins σ i j a}, (σ.1 a.1.1).1 = j from fun a => a.2.2]
    split_ifs <;> simp
  unfold vertexMomentum spectatorMomentum
  rw [← Fintype.sum_subtype_add_sum_subtype (Joins σ i j)
    (fun a : Line σ => if (σ.1 a.1).1 = v then q a else 0),
    ← Fintype.sum_subtype_add_sum_subtype (Joins σ i j)
    (fun a : Line σ => if a.1.1 = v then q a else 0), hi, hj]
  abel

/-- Split off two entries of a finite product. -/
lemma prod_two (F : Fin n → ℂ) (i j : Fin n) (hij : i ≠ j) :
    (∏ v, F v) = (∏ v ∈ (Finset.univ.erase i).erase j, F v) * F i * F j := by
  rw [← Finset.prod_erase_mul _ F (Finset.mem_univ i),
    ← Finset.prod_erase_mul _ F (Finset.mem_erase.mpr ⟨hij.symm, Finset.mem_univ j⟩)]
  ring

/-- A bundle of joining lines, with arbitrary fixed momenta entering the two vertices. -/
def bundleIntegrand {L : Type*} [Fintype L] (α β : L → Idx) (f g : TestFunction)
    (k l : Spacetime) (q : L → Spacetime) : ℂ :=
  (∏ a, Amono (α a) (q a) * Bmono (β a) (q a) * (weight (q a) : ℂ)) *
    fourierE f (k - ∑ a, q a) * fourierE g (l + ∑ a, q a)

/-- The factor independent of the momenta of the joining lines. -/
def spectatorFactor {m : Fin n → Mon} (σ : Matching m) (f : Fin n → TestFunction)
    (i j : Fin n) (r : {a : Line σ // ¬ Joins σ i j a} → Spacetime) : ℂ :=
  (∏ a, Amono a.1.1.idx (r a) * Bmono (σ.1 a.1.1).idx (r a) * (weight (r a) : ℂ)) *
    ∏ v ∈ (Finset.univ.erase i).erase j, fourierE (f v) (spectatorMomentum σ i j r v)

lemma matchingIntegrand_split {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : i ≠ j) (q : Line σ → Spacetime) :
    (∏ a : Line σ, Amono a.1.idx (q a) * Bmono (σ.1 a.1).idx (q a) *
      (weight (q a) : ℂ)) * ∏ v, fourierE (f v) (vertexMomentum σ q v) =
    spectatorFactor σ f i j (fun a => q a.1) *
      bundleIntegrand (fun a : {a : Line σ // Joins σ i j a} => a.1.1.idx)
        (fun a => (σ.1 a.1.1).idx) (f i) (f j)
        (spectatorMomentum σ i j (fun a => q a.1) i)
        (spectatorMomentum σ i j (fun a => q a.1) j) (fun a => q a.1) := by
  rw [← Fintype.prod_subtype_mul_prod_subtype (Joins σ i j),
    prod_two (fun v => fourierE (f v) (vertexMomentum σ q v)) i j hij]
  have hrest : (∏ v ∈ (Finset.univ.erase i).erase j,
      fourierE (f v) (vertexMomentum σ q v)) =
      ∏ v ∈ (Finset.univ.erase i).erase j,
        fourierE (f v) (spectatorMomentum σ i j (fun a => q a.1) v) := by
    apply Finset.prod_congr rfl
    intro v hv
    have hi : i ≠ v := (Finset.mem_erase.mp (Finset.mem_erase.mp hv).2).1.symm
    have hj : j ≠ v := (Finset.mem_erase.mp hv).1.symm
    rw [vertexMomentum_split σ i j q v, if_neg hi, if_neg hj, add_zero, sub_zero]
  rw [hrest, vertexMomentum_split σ i j q i, vertexMomentum_split σ i j q j]
  simp only [ite_true, if_neg hij, if_neg hij.symm, add_zero, sub_zero]
  unfold spectatorFactor bundleIntegrand
  ring

lemma vertexMomentum_reverse_split {m : Fin n → Mon} (σ : Matching m)
    (i j : Fin n) (q : Line σ → Spacetime) (v : Fin n) :
    vertexMomentum σ (fun a => if Joins σ i j a then -q a else q a) v =
      spectatorMomentum σ i j (fun a => q a.1) v +
      (if i = v then ∑ a : {a : Line σ // Joins σ i j a}, q a.1 else 0) -
      (if j = v then ∑ a : {a : Line σ // Joins σ i j a}, q a.1 else 0) := by
  rw [vertexMomentum_split σ i j]
  have hr : (fun a : {a : Line σ // ¬ Joins σ i j a} =>
      if Joins σ i j a.1 then -q a.1 else q a.1) = fun a => q a.1 := by
    funext a
    rw [if_neg a.2]
  have hq : (∑ a : {a : Line σ // Joins σ i j a},
      if Joins σ i j a.1 then -q a.1 else q a.1) =
      -(∑ a : {a : Line σ // Joins σ i j a}, q a.1) := by
    simp only [if_pos (Subtype.property _), Finset.sum_neg_distrib]
  rw [hr, hq]
  split_ifs <;> abel

lemma reversedIntegrand_split {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : i ≠ j) (q : Line σ → Spacetime) :
    reversedIntegrand σ f i j q = spectatorFactor σ f i j (fun a => q a.1) *
      bundleIntegrand (fun a : {a : Line σ // Joins σ i j a} => (σ.1 a.1.1).idx)
        (fun a => a.1.1.idx) (f j) (f i)
        (spectatorMomentum σ i j (fun a => q a.1) j)
        (spectatorMomentum σ i j (fun a => q a.1) i) (fun a => q a.1) := by
  unfold reversedIntegrand
  rw [← Fintype.prod_subtype_mul_prod_subtype (Joins σ i j)]
  have hneg (a : {a : Line σ // ¬ Joins σ i j a}) : ¬ Joins σ i j a.1 := a.2
  simp only [if_pos (Subtype.property _), if_neg (hneg _)]
  rw [prod_two _ i j hij]
  have hrest : (∏ v ∈ (Finset.univ.erase i).erase j,
      fourierE (f v) (vertexMomentum σ (fun a => if Joins σ i j a then -q a else q a) v)) =
      ∏ v ∈ (Finset.univ.erase i).erase j,
        fourierE (f v) (spectatorMomentum σ i j (fun a => q a.1) v) := by
    apply Finset.prod_congr rfl
    intro v hv
    have hi : i ≠ v := (Finset.mem_erase.mp (Finset.mem_erase.mp hv).2).1.symm
    have hj : j ≠ v := (Finset.mem_erase.mp hv).1.symm
    rw [vertexMomentum_reverse_split σ i j q v, if_neg hi, if_neg hj, add_zero, sub_zero]
  rw [hrest, vertexMomentum_reverse_split σ i j q i, vertexMomentum_reverse_split σ i j q j]
  simp only [ite_true, if_neg hij, if_neg hij.symm, add_zero, sub_zero]
  unfold spectatorFactor bundleIntegrand
  ring

/-- Fubini for a finite family of momenta split by an arbitrary predicate. -/
lemma integral_split {L : Type*} [Fintype L] (p : L → Prop)
    (F : (L → Spacetime) → ℂ) (hF : Integrable F) :
    (∫ q, F q) = ∫ r : {a // ¬ p a} → Spacetime, ∫ q : {a // p a} → Spacetime,
      F ((MeasurableEquiv.piEquivPiSubtypeProd (fun _ : L => Spacetime) p).symm (q, r)) := by
  have he := (volume_preserving_piEquivPiSubtypeProd (fun _ : L => Spacetime) p).symm
  rw [← he.integral_comp' F]
  exact integral_prod_symm _ (he.integrable_comp_of_integrable hF)

lemma matchingValue_split {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : i ≠ j) :
    matchingValue σ f = ∫ r : {a : Line σ // ¬ Joins σ i j a} → Spacetime,
      spectatorFactor σ f i j r * ∫ q : {a : Line σ // Joins σ i j a} → Spacetime,
        bundleIntegrand (fun a => a.1.1.idx) (fun a => (σ.1 a.1.1).idx)
          (f i) (f j) (spectatorMomentum σ i j r i) (spectatorMomentum σ i j r j) q := by
  unfold matchingValue
  rw [integral_split (Joins σ i j) _ (matching_integrable m σ f)]
  apply integral_congr_ae
  filter_upwards [] with r
  rw [← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with q
  let e := MeasurableEquiv.piEquivPiSubtypeProd (fun _ : Line σ => Spacetime) (Joins σ i j)
  have hq : (fun a : {a : Line σ // Joins σ i j a} => e.symm (q, r) a.1) = q :=
    congrArg Prod.fst (e.apply_symm_apply (q, r))
  have hr : (fun a : {a : Line σ // ¬ Joins σ i j a} => e.symm (q, r) a.1) = r :=
    congrArg Prod.snd (e.apply_symm_apply (q, r))
  rw [matchingIntegrand_split σ f i j hij]
  change spectatorFactor σ f i j _ * bundleIntegrand _ _ (f i) (f j)
    (spectatorMomentum σ i j _ i) (spectatorMomentum σ i j _ j) _ = _
  rw [hq, hr]

lemma matchingValue_swapped_split {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : j.val = i.val + 1) :
    matchingValue (matchingEquiv (Equiv.swap i j) m σ) (f ∘ Equiv.swap i j) =
      ∫ r : {a : Line σ // ¬ Joins σ i j a} → Spacetime,
        spectatorFactor σ f i j r * ∫ q : {a : Line σ // Joins σ i j a} → Spacetime,
          bundleIntegrand (fun a => (σ.1 a.1.1).idx) (fun a => a.1.1.idx)
            (f j) (f i) (spectatorMomentum σ i j r j) (spectatorMomentum σ i j r i) q := by
  have hne : i ≠ j := by intro he; have := congrArg Fin.val he; omega
  rw [matchingValue_swapped σ f i j hij,
    integral_split (Joins σ i j) _ (reversedIntegrand_integrable σ f i j hij)]
  apply integral_congr_ae
  filter_upwards [] with r
  rw [← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with q
  let e := MeasurableEquiv.piEquivPiSubtypeProd (fun _ : Line σ => Spacetime) (Joins σ i j)
  have hq : (fun a : {a : Line σ // Joins σ i j a} => e.symm (q, r) a.1) = q :=
    congrArg Prod.fst (e.apply_symm_apply (q, r))
  have hr : (fun a : {a : Line σ // ¬ Joins σ i j a} => e.symm (q, r) a.1) = r :=
    congrArg Prod.snd (e.apply_symm_apply (q, r))
  rw [reversedIntegrand_split σ f i j hne]
  change spectatorFactor σ f i j _ * bundleIntegrand _ _ (f j) (f i)
    (spectatorMomentum σ i j _ j) (spectatorMomentum σ i j _ i) _ = _
  rw [hq, hr]

/-- Plane waves are valid multipliers of Schwartz space. -/
lemma planeWave_hasTemperateGrowth (k : Spacetime) :
    (fun x : Spacetime => Complex.exp (Complex.I * (⟪x, k⟫_ℝ : ℂ))).HasTemperateGrowth := by
  have hs : Real.sin.HasTemperateGrowth := by
    refine ⟨Real.contDiff_sin, fun r => ⟨0, 1, fun x => ?_⟩⟩
    simpa only [pow_zero, mul_one, norm_iteratedFDeriv_eq_norm_iteratedDeriv,
      Real.norm_eq_abs] using Real.abs_iteratedDeriv_sin_le_one r x
  have hc : Real.cos.HasTemperateGrowth := by
    refine ⟨Real.contDiff_cos, fun r => ⟨0, 1, fun x => ?_⟩⟩
    simpa only [pow_zero, mul_one, norm_iteratedFDeriv_eq_norm_iteratedDeriv,
      Real.norm_eq_abs] using Real.abs_iteratedDeriv_cos_le_one r x
  have he : (fun t : ℝ => Complex.exp (Complex.I * (t : ℂ))).HasTemperateGrowth := by
    have heq : (fun t : ℝ => Complex.exp (Complex.I * (t : ℂ))) =
        fun t => (Real.cos t : ℂ) + (Real.sin t : ℂ) * Complex.I := by
      funext t
      rw [mul_comm, Complex.exp_mul_I]
      simp
    rw [heq]
    exact (Complex.hasTemperateGrowth_ofReal.comp hc).add
      ((Complex.hasTemperateGrowth_ofReal.comp hs).mul (HasTemperateGrowth.const Complex.I))
  exact he.comp (hasTemperateGrowth_inner_left k)

/-- Momentum translation is multiplication by a plane wave in position space. -/
def modulateTest (k : Spacetime) (f : TestFunction) : TestFunction :=
  SchwartzMap.smulLeftCLM ℂ (fun x => Complex.exp (Complex.I * (⟪x, k⟫_ℝ : ℂ))) f

lemma modulateTest_apply (k : Spacetime) (f : TestFunction) (x : Spacetime) :
    modulateTest k f x = Complex.exp (Complex.I * (⟪x, k⟫_ℝ : ℂ)) * f x :=
  SchwartzMap.smulLeftCLM_apply_apply (planeWave_hasTemperateGrowth k) f x

lemma fourierE_modulateTest (k p : Spacetime) (f : TestFunction) :
    fourierE (modulateTest k f) p = fourierE f (k + p) := by
  unfold fourierE
  apply integral_congr_ae
  filter_upwards [] with x
  rw [modulateTest_apply, inner_add_right, Complex.ofReal_add, mul_add, Complex.exp_add]
  ring

lemma separated_modulateTest (k l : Spacetime) {f g : TestFunction}
    (h : FieldSystem.SpacelikeSeparated f g) :
    FieldSystem.SpacelikeSeparated (modulateTest k f) (modulateTest l g) :=
  separated_of_tsupport_subset h
    (fun _ hx => (SchwartzMap.tsupport_smulLeftCLM_subset _ f hx).1)
    (fun _ hx => (SchwartzMap.tsupport_smulLeftCLM_subset _ g hx).1)

lemma bundleIntegrand_modulateTest {L : Type*} [Fintype L] (α β : L → Idx)
    (f g : TestFunction) (k l : Spacetime) (q : L → Spacetime) :
    bundleIntegrand α β (modulateTest k f) (modulateTest l g) 0 0 q =
      bundleIntegrand α β f g k l q := by
  simp only [bundleIntegrand, fourierE_modulateTest, zero_add, sub_eq_add_neg]

/-- One line evaluated at a positive imaginary-time displacement. -/
def lineAtHeight (α β : Idx) (ε : ℝ) (ξ : Spacetime) : ℂ :=
  lineC α β ((time ξ : ℂ) + (ε : ℂ) * Complex.I) (spatial ξ)

lemma stronglyMeasurable_lineAtHeight (α β : Idx) (ε : ℝ) :
    StronglyMeasurable (lineAtHeight α β ε) := by
  unfold lineAtHeight lineC
  apply StronglyMeasurable.integral_prod_right
  have hs := continuous_spatial
  have ht : Continuous time := (EuclideanSpace.proj timeAxis).continuous
  have hA : Continuous (Amono α) := by unfold Amono time; fun_prop
  have hB : Continuous (Bmono β) := by unfold Bmono time; fun_prop
  have he : Continuous (fun xp : Spacetime × Spacetime =>
      Amono α xp.2 * Bmono β xp.2 * Complex.exp
        (Complex.I * (((time xp.1 : ℂ) + (ε : ℂ) * Complex.I) * (time xp.2 : ℂ) +
          (⟪spatial xp.1, spatial xp.2⟫_ℝ : ℂ)))) := by fun_prop
  exact he.stronglyMeasurable.mul
    (Complex.continuous_ofReal.measurable.comp
      (measurable_weight.comp measurable_snd)).stronglyMeasurable

/-- The position-space product for a finite bundle. -/
def bundleKernel {L : Type*} [Fintype L] (α β : L → Idx) (ε : ℝ) (ξ : Spacetime) : ℂ :=
  ∏ a, lineAtHeight (α a) (β a) ε ξ

lemma stronglyMeasurable_bundleKernel {L : Type*} [Fintype L]
    (α β : L → Idx) (ε : ℝ) : StronglyMeasurable (bundleKernel α β ε) := by
  convert Finset.stronglyMeasurable_prod Finset.univ
    (fun a _ => stronglyMeasurable_lineAtHeight (α a) (β a) ε) using 1
  ext ξ
  simp only [bundleKernel, Finset.prod_apply]

/-- The bundle in momentum space paired with one test of its total momentum. -/
def bundleFourierIntegrand {L : Type*} [Fintype L] (α β : L → Idx)
    (c : TestFunction) (q : L → Spacetime) : ℂ :=
  (∏ a, Amono (α a) (q a) * Bmono (β a) (q a) * (weight (q a) : ℂ)) *
    fourierE c (∑ a, q a)

lemma bundleIntegrand_differenceTest {L : Type*} [Fintype L] (α β : L → Idx)
    (f g : TestFunction) (q : L → Spacetime) :
    bundleIntegrand α β f g 0 0 q = bundleFourierIntegrand α β (differenceTest f g) q := by
  simp only [bundleIntegrand, bundleFourierIntegrand, fourierE_differenceTest,
    zero_sub, zero_add, mul_assoc]

/-- Off the product of forward cones the momentum integrand vanishes. -/
lemma bundleFourierIntegrand_zero_off_cones {L : Type*} [Fintype L]
    (α β : L → Idx) (c : TestFunction) (q : L → Spacetime)
    (hq : ¬ ∀ a, q a ∈ forwardCone) : bundleFourierIntegrand α β c q = 0 := by
  obtain ⟨a, ha⟩ := not_forall.mp hq
  unfold bundleFourierIntegrand
  have hz : Amono (α a) (q a) * Bmono (β a) (q a) * (weight (q a) : ℂ) = 0 := by
    rw [weight_eq_zero ha, Complex.ofReal_zero, mul_zero]
  rw [Finset.prod_eq_zero (Finset.mem_univ a) hz, zero_mul]

/-- The positive-energy support makes the damping a contraction, so it can be removed
by dominated convergence as soon as the undamped Fourier integrand is integrable. -/
lemma bundleFourierIntegrand_damping_limit {L : Type*} [Fintype L]
    (α β : L → Idx) (c : TestFunction) (hi : Integrable (bundleFourierIntegrand α β c)) :
    Tendsto (fun ε : ℝ => ∫ q : L → Spacetime,
      (Real.exp (-ε * ∑ a, time (q a)) : ℂ) * bundleFourierIntegrand α β c q)
      (𝓝[>] 0) (𝓝 (∫ q : L → Spacetime, bundleFourierIntegrand α β c q)) := by
  have ht : Continuous time := (EuclideanSpace.proj timeAxis).continuous
  have hm (ε : ℝ) : Continuous (fun q : L → Spacetime =>
      (Real.exp (-ε * ∑ a, time (q a)) : ℂ)) := by fun_prop
  apply tendsto_integral_filter_of_dominated_convergence
    (fun q => ‖bundleFourierIntegrand α β c q‖)
  · exact Filter.Eventually.of_forall fun ε =>
      (hm ε).aestronglyMeasurable.mul hi.aestronglyMeasurable
  · filter_upwards [self_mem_nhdsWithin] with ε hε
    filter_upwards [] with q
    by_cases hq : ∀ a, q a ∈ forwardCone
    · have hs : 0 ≤ ∑ a, time (q a) :=
        Finset.sum_nonneg fun a _ => (norm_nonneg (spatial (q a))).trans (hq a)
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
      exact mul_le_of_le_one_left (norm_nonneg _)
        (Real.exp_le_one_iff.mpr (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hε.le) hs))
    · rw [bundleFourierIntegrand_zero_off_cones α β c q hq, mul_zero, norm_zero]
  · exact hi.norm
  · filter_upwards [] with q
    have hc : Continuous (fun ε : ℝ =>
        (Real.exp (-ε * ∑ a, time (q a)) : ℂ) * bundleFourierIntegrand α β c q) := by fun_prop
    simpa using (hc.tendsto 0).mono_left nhdsWithin_le_nhds

-- BEGIN bundleKernel_fourier_damped

namespace BundleDamped

open scoped FourierTransform

theorem norm_le_twice_time {p : Spacetime} (hp : p ∈ forwardCone) :
    ‖p‖ ≤ 2 * time p := by
  have hs : ‖spatial p‖ ≤ time p := hp
  have ht := (norm_nonneg (spatial p)).trans hs
  have hn : ‖p‖ ^ 2 = ‖spatial p‖ ^ 2 + time p ^ 2 := by
    rw [EuclideanSpace.real_norm_sq_eq, EuclideanSpace.real_norm_sq_eq,
      Fin.sum_univ_castSucc]
    rfl
  nlinarith [norm_nonneg p, norm_nonneg (spatial p)]

/-- The unnormalised positive-sign Fourier transform, bundled as a Schwartz map. -/
def fourierSchwartz (f : TestFunction) : TestFunction :=
  SchwartzMap.compCLMOfContinuousLinearEquiv ℂ
    (LinearEquiv.smulOfNeZero ℝ Spacetime ((2 * Real.pi)⁻¹)
      (inv_ne_zero (mul_ne_zero (by norm_num) Real.pi_ne_zero))).toContinuousLinearEquiv
    (𝓕⁻ f)

theorem fourierSchwartz_apply (f : TestFunction) (k : Spacetime) :
    fourierSchwartz f k = fourierE f k := by
  change (𝓕⁻ f) (((2 * Real.pi)⁻¹) • k) = _
  rw [SchwartzMap.fourierInv_coe, Real.fourierInv_eq']
  unfold fourierE
  apply integral_congr_ae
  apply ae_of_all
  intro x
  dsimp only
  have h : 2 * Real.pi * ⟪x, ((2 * Real.pi)⁻¹) • k⟫_ℝ = ⟪x, k⟫_ℝ := by
    rw [inner_smul_right, ← mul_assoc, mul_inv_cancel₀ (by positivity), one_mul]
  rw [h, smul_eq_mul]
  simp only [mul_comm]

theorem norm_Amono_le (α : Idx) (p : Spacetime) {R : ℝ} (hR : ‖p‖ ≤ R) :
    ‖Amono α p‖ ≤ R ^ idxOrder α := by
  have hR0 : 0 ≤ R := (norm_nonneg p).trans hR
  have hc (i : Fin 4) : |p i| ≤ R := by
    have h : |p i| ≤ ‖p‖ := by
      simpa only [Real.norm_eq_abs] using PiLp.norm_apply_le p i
    exact h.trans hR
  simp only [Amono, norm_mul, norm_prod, norm_pow, norm_neg, Complex.norm_I,
    Complex.norm_real, Real.norm_eq_abs, one_mul]
  calc
    _ ≤ (∏ i : Fin 3, R ^ α i.castSucc) * R ^ α timeAxis := by
      apply mul_le_mul _ _ (by positivity) (by positivity)
      · exact Finset.prod_le_prod (fun i _ => by positivity) fun i _ =>
          pow_le_pow_left₀ (abs_nonneg _) (hc _) _
      · exact pow_le_pow_left₀ (abs_nonneg _) (hc timeAxis) _
    _ = R ^ idxOrder α := by
      rw [Finset.prod_pow_eq_pow_sum, ← pow_add]
      exact congrArg (R ^ ·) (Fin.sum_univ_castSucc α).symm

theorem norm_Bmono_le (α : Idx) (p : Spacetime) {R : ℝ} (hR : ‖p‖ ≤ R) :
    ‖Bmono α p‖ ≤ R ^ idxOrder α := by
  have h : ‖Bmono α p‖ = ‖Amono α p‖ := by
    simp only [Amono, Bmono, norm_mul, norm_prod, norm_pow, norm_neg]
  rw [h]
  exact norm_Amono_le α p hR

/-- The cone prevents cancellation in the energy of a finite bundle. -/
lemma norm_le_total {L : Type*} [Fintype L] (q : L → Spacetime)
    (hq : ∀ a, q a ∈ forwardCone) : ‖q‖ ≤ 2 * ‖∑ a, q a‖ := by
  have ht (a : L) : 0 ≤ time (q a) := (norm_nonneg _).trans (hq a)
  have hs : (∑ a, time (q a)) ≤ ‖∑ a, q a‖ := by
    have he : time (∑ a, q a) = ∑ a, time (q a) := by simp [time]
    rw [← he]
    exact (le_abs_self _).trans (by
      simpa only [time, Real.norm_eq_abs] using PiLp.norm_apply_le (∑ a, q a) timeAxis)
  apply (pi_norm_le_iff_of_nonneg (by positivity)).2
  intro a
  exact (norm_le_twice_time (hq a)).trans (mul_le_mul_of_nonneg_left
    ((Finset.single_le_sum (fun a _ => ht a) (Finset.mem_univ a)).trans hs) (by norm_num))

def degree {L : Type*} [Fintype L] (α β : L → Idx) : ℕ :=
  ∑ a, (idxOrder (α a) + idxOrder (β a) + 4)

def kernel {L : Type*} [Fintype L] (α β : L → Idx) (q : L → Spacetime) : ℂ :=
  ∏ a, Amono (α a) (q a) * Bmono (β a) (q a) * (weight (q a) : ℂ)

lemma norm_kernel_le {L : Type*} [Fintype L] (α β : L → Idx) (q : L → Spacetime) :
    ‖kernel α β q‖ ≤ (1 + ‖q‖) ^ degree α β := by
  unfold kernel degree
  rw [norm_prod, ← Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_le_prod (fun _ _ => norm_nonneg _)
  intro a _
  have hR : ‖q a‖ ≤ 1 + ‖q‖ := (norm_le_pi_norm q a).trans (by linarith)
  have hw : ‖(weight (q a) : ℂ)‖ ≤ (1 + ‖q‖) ^ 4 := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (weight_nonneg _)]
    apply (weight_le _).trans
    have ht : |time (q a)| ≤ 1 + ‖q‖ := by
      exact (show |time (q a)| ≤ ‖q a‖ by
        simpa only [time, Real.norm_eq_abs] using PiLp.norm_apply_le (q a) timeAxis).trans hR
    calc
      time (q a) ^ 4 = |time (q a)| ^ 4 := by rw [pow_abs, abs_of_nonneg (by positivity)]
      _ ≤ _ := pow_le_pow_left₀ (abs_nonneg _) ht _
  rw [norm_mul, norm_mul, pow_add, pow_add]
  exact mul_le_mul (mul_le_mul (norm_Amono_le _ _ hR) (norm_Bmono_le _ _ hR)
    (norm_nonneg _) (by positivity)) hw (norm_nonneg _) (by positivity)

lemma continuous_Amono (α : Idx) : Continuous (Amono α) := by
  unfold Amono time
  fun_prop

lemma continuous_Bmono (α : Idx) : Continuous (Bmono α) := by
  unfold Bmono time
  fun_prop

lemma measurable_kernel {L : Type*} [Fintype L] (α β : L → Idx) :
    Measurable (kernel α β) := by
  unfold kernel
  apply Finset.measurable_prod
  intro a _
  exact (((continuous_Amono _).comp (continuous_apply a)).measurable.mul
    ((continuous_Bmono _).comp (continuous_apply a)).measurable).mul
      (Complex.measurable_ofReal.comp (measurable_weight.comp (measurable_pi_apply a)))

lemma continuous_fourierE (c : TestFunction) : Continuous (fourierE c) := by
  have he : (fourierSchwartz c : Spacetime → ℂ) = fourierE c :=
    funext (fourierSchwartz_apply c)
  rw [← he]
  exact (fourierSchwartz c).continuous

lemma measurable_bundleFourierIntegrand {L : Type*} [Fintype L]
    (α β : L → Idx) (c : TestFunction) : Measurable (bundleFourierIntegrand α β c) := by
  apply (measurable_kernel α β).mul
  exact ((continuous_fourierE c).comp
    (continuous_finsetSum _ fun a _ => continuous_apply a)).measurable

/-- Arbitrary polynomial decay of the bundle pairing, in all line variables. -/
lemma weighted_bundle_bound {L : Type*} [Fintype L]
    (α β : L → Idx) (c : TestFunction) (s : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ q, (1 + ‖q‖) ^ s * ‖bundleFourierIntegrand α β c q‖ ≤ C := by
  let N := degree α β + s
  let A : ℝ := 2 ^ N * (Finset.Iic (N, 0)).sup
    (fun a => SchwartzMap.seminorm ℝ a.1 a.2) (fourierSchwartz c)
  have hA : 0 ≤ A := by positivity
  have hdec (p : Spacetime) : (1 + ‖p‖) ^ N * ‖fourierE c p‖ ≤ A := by
    simpa only [A, norm_iteratedFDeriv_zero, fourierSchwartz_apply] using
      (fourierSchwartz c).one_add_le_sup_seminorm_apply (𝕜 := ℝ)
        (m := (N, 0)) le_rfl le_rfl p
  refine ⟨2 ^ N * A, by positivity, fun q => ?_⟩
  by_cases hq : ∀ a, q a ∈ forwardCone
  · have hnorm : 1 + ‖q‖ ≤ 2 * (1 + ‖∑ a, q a‖) := by
      have := norm_le_total q hq
      linarith
    calc
      _ = (1 + ‖q‖) ^ s * (‖kernel α β q‖ * ‖fourierE c (∑ a, q a)‖) := by
        rw [bundleFourierIntegrand, norm_mul]; rfl
      _ ≤ (1 + ‖q‖) ^ s * ((1 + ‖q‖) ^ degree α β *
          ‖fourierE c (∑ a, q a)‖) := by
        gcongr
        exact norm_kernel_le α β q
      _ = (1 + ‖q‖) ^ N * ‖fourierE c (∑ a, q a)‖ := by
        dsimp [N]; rw [pow_add]; ring
      _ ≤ (2 * (1 + ‖∑ a, q a‖)) ^ N * ‖fourierE c (∑ a, q a)‖ := by
        gcongr
      _ = 2 ^ N * ((1 + ‖∑ a, q a‖) ^ N * ‖fourierE c (∑ a, q a)‖) := by
        rw [mul_pow, mul_assoc]
      _ ≤ 2 ^ N * A := mul_le_mul_of_nonneg_left (hdec _) (by positivity)
  · rw [bundleFourierIntegrand_zero_off_cones α β c q hq, norm_zero, mul_zero]
    positivity

lemma integrable_bundleFourierIntegrand {L : Type*} [Fintype L]
    (α β : L → Idx) (c : TestFunction) : Integrable (bundleFourierIntegrand α β c) := by
  let s := Module.finrank ℝ (L → Spacetime) + 1
  obtain ⟨C, _, hb⟩ := weighted_bundle_bound α β c s
  have hdim : (Module.finrank ℝ (L → Spacetime) : ℝ) < (s : ℝ) := by
    dsimp [s]
    exact_mod_cast Nat.lt_succ_self _
  have hi : Integrable (fun q : L → Spacetime => ((1 + ‖q‖) ^ s)⁻¹) := by
    convert integrable_one_add_norm (μ := (volume : Measure (L → Spacetime))) hdim using 1
    ext q
    rw [Real.rpow_neg (by positivity), Real.rpow_natCast]
  apply (hi.const_mul C).mono' (measurable_bundleFourierIntegrand α β c).aestronglyMeasurable
  filter_upwards [] with q
  rw [← div_eq_mul_inv, le_div_iff₀ (by positivity)]
  simpa only [mul_comm] using hb q

/-- The integrable momentum density of one line at positive height. -/
def mass (α β : Idx) (ε : ℝ) (p : Spacetime) : ℂ :=
  Amono α p * Bmono β p * (weight p : ℂ) * (Real.exp (-ε * time p) : ℂ)

lemma measurable_mass (α β : Idx) (ε : ℝ) : Measurable (mass α β ε) := by
  have ht : Continuous time := (EuclideanSpace.proj timeAxis).continuous
  exact (((continuous_Amono α).measurable.mul (continuous_Bmono β).measurable).mul
    (Complex.measurable_ofReal.comp measurable_weight)).mul
    (by fun_prop)

lemma mass_integrable (α β : Idx) {ε : ℝ} (hε : 0 < ε) :
    Integrable (mass α β ε) := by
  apply (integrable_pow_exp_weight hε (idxOrder α + idxOrder β)).mono'
    (measurable_mass α β ε).aestronglyMeasurable
  filter_upwards [] with p
  simp only [mass, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (weight_nonneg p), abs_of_pos (Real.exp_pos _)]
  calc
    _ ≤ (‖p‖ ^ idxOrder α * ‖p‖ ^ idxOrder β) * weight p * Real.exp (-ε * time p) := by
      apply mul_le_mul_of_nonneg_right _ (Real.exp_pos _).le
      apply mul_le_mul_of_nonneg_right _ (weight_nonneg p)
      exact mul_le_mul (norm_Amono_le α p le_rfl) (norm_Bmono_le β p le_rfl)
        (norm_nonneg _) (by positivity)
    _ = _ := by rw [pow_add]; ring

def oscillation (p ξ : Spacetime) : ℂ :=
  Complex.exp (Complex.I * (⟪ξ, p⟫_ℝ : ℂ))

lemma norm_oscillation (p ξ : Spacetime) : ‖oscillation p ξ‖ = 1 := by
  simp [oscillation, Complex.norm_exp]

lemma inner_split (ξ p : Spacetime) :
    ⟪ξ, p⟫_ℝ = time ξ * time p + ⟪spatial ξ, spatial p⟫_ℝ := by
  simp only [PiLp.inner_apply, RCLike.inner_apply, conj_trivial]
  rw [Fin.sum_univ_castSucc]
  simp only [spatial, PiLp.toLp_apply, time]
  ring

lemma lineAtHeight_eq (α β : Idx) (ε : ℝ) (ξ : Spacetime) :
    lineAtHeight α β ε ξ = ∫ p, mass α β ε p * oscillation p ξ := by
  unfold lineAtHeight lineC
  apply integral_congr_ae
  filter_upwards [] with p
  have he : Complex.I * (((time ξ : ℂ) + (ε : ℂ) * Complex.I) * (time p : ℂ) +
      (⟪spatial ξ, spatial p⟫_ℝ : ℂ)) =
      ((-ε * time p : ℝ) : ℂ) + Complex.I * (⟪ξ, p⟫_ℝ : ℂ) := by
    rw [inner_split]
    push_cast
    linear_combination (ε * time p : ℂ) * Complex.I_sq
  rw [he, Complex.exp_add]
  simp only [mass, oscillation, Complex.ofReal_exp]
  ring

def masses {L : Type*} [Fintype L] (α β : L → Idx) (ε : ℝ)
    (q : L → Spacetime) : ℂ := ∏ a, mass (α a) (β a) ε (q a)

lemma masses_integrable {L : Type*} [Fintype L] (α β : L → Idx)
    {ε : ℝ} (hε : 0 < ε) : Integrable (masses α β ε) :=
  Integrable.fintype_prod (fun a => mass_integrable (α a) (β a) hε)

lemma masses_eq {L : Type*} [Fintype L] (α β : L → Idx)
    (ε : ℝ) (q : L → Spacetime) :
    masses α β ε q = kernel α β q * (Real.exp (-ε * ∑ a, time (q a)) : ℂ) := by
  simp only [masses, mass, kernel, Finset.prod_mul_distrib]
  congr 1
  simp only [Complex.ofReal_exp, ← Complex.exp_sum, ← Complex.ofReal_sum, Finset.mul_sum]

/-- The phase has norm one, so the joint integrand has a product majorant. -/
def joint {L : Type*} [Fintype L] (α β : L → Idx) (ε : ℝ)
    (c : TestFunction) (q : L → Spacetime) (ξ : Spacetime) : ℂ :=
  masses α β ε q * (c ξ * oscillation (∑ a, q a) ξ)

lemma joint_integrable {L : Type*} [Fintype L] (α β : L → Idx)
    {ε : ℝ} (hε : 0 < ε) (c : TestFunction) :
    Integrable (uncurry (joint α β ε c)) (volume.prod volume) := by
  have hm := masses_integrable α β hε
  apply (hm.norm.mul_prod c.integrable.norm).mono'
  · apply hm.aestronglyMeasurable.comp_fst.mul
    apply Continuous.aestronglyMeasurable
    unfold oscillation
    fun_prop
  · filter_upwards [] with z
    simp [uncurry, joint, norm_oscillation]

lemma joint_integral_position {L : Type*} [Fintype L] (α β : L → Idx)
    (ε : ℝ) (c : TestFunction) (q : L → Spacetime) :
    (∫ ξ, joint α β ε c q ξ) =
      (Real.exp (-ε * ∑ a, time (q a)) : ℂ) * bundleFourierIntegrand α β c q := by
  simp only [joint, integral_const_mul, masses_eq]
  change kernel α β q * (Real.exp (-ε * ∑ a, time (q a)) : ℂ) *
    fourierE c (∑ a, q a) = _
  change _ = (Real.exp (-ε * ∑ a, time (q a)) : ℂ) *
    (kernel α β q * fourierE c (∑ a, q a))
  ring

lemma oscillation_sum {L : Type*} [Fintype L] (q : L → Spacetime) (ξ : Spacetime) :
    (∏ a, oscillation (q a) ξ) = oscillation (∑ a, q a) ξ := by
  simp only [oscillation, ← Complex.exp_sum, inner_sum, Complex.ofReal_sum, Finset.mul_sum]

lemma joint_integral_momentum {L : Type*} [Fintype L] (α β : L → Idx)
    (ε : ℝ) (c : TestFunction) (ξ : Spacetime) :
    (∫ q, joint α β ε c q ξ) = bundleKernel α β ε ξ * c ξ := by
  have he (q : L → Spacetime) : joint α β ε c q ξ =
      (∏ a, mass (α a) (β a) ε (q a) * oscillation (q a) ξ) * c ξ := by
    rw [Finset.prod_mul_distrib, oscillation_sum]
    unfold joint masses
    ring
  simp_rw [he]
  rw [integral_mul_const, integral_fintype_prod_volume_eq_prod
    (fun a p => mass (α a) (β a) ε p * oscillation p ξ)]
  simp only [bundleKernel, lineAtHeight_eq]

end BundleDamped

/-- Absolute integrability of the Fourier pairing and Fubini at positive height.
All limits and removal of the damping are proved separately. -/
lemma bundleKernel_fourier_damped {L : Type*} [Fintype L] [Nonempty L]
    (α β : L → Idx) (c : TestFunction) :
    Integrable (bundleFourierIntegrand α β c) ∧
      ∀ ε : ℝ, 0 < ε →
        (∫ ξ, bundleKernel α β ε ξ * c ξ) =
          ∫ q : L → Spacetime, (Real.exp (-ε * ∑ a, time (q a)) : ℂ) *
            bundleFourierIntegrand α β c q := by
  refine ⟨BundleDamped.integrable_bundleFourierIntegrand α β c, fun ε hε => ?_⟩
  simp_rw [← BundleDamped.joint_integral_momentum α β ε c]
  rw [← integral_integral_swap (BundleDamped.joint_integrable α β hε c)]
  simp_rw [BundleDamped.joint_integral_position]

-- END bundleKernel_fourier_damped

/-- The boundary value is the undamped Fourier pairing. -/
lemma bundleKernel_boundary {L : Type*} [Fintype L] [Nonempty L]
    (α β : L → Idx) (c : TestFunction) :
    Tendsto (fun ε : ℝ => ∫ ξ, bundleKernel α β ε ξ * c ξ) (𝓝[>] 0)
      (𝓝 (∫ q : L → Spacetime, bundleFourierIntegrand α β c q)) := by
  obtain ⟨hi, he⟩ := bundleKernel_fourier_damped α β c
  apply (bundleFourierIntegrand_damping_limit α β c hi).congr'
  filter_upwards [self_mem_nhdsWithin] with ε hε
  exact (he ε hε).symm

-- BEGIN lineAtHeight_exchange_boundary_of_nonzero

/-- The real slice of the complexified Euclidean coordinates. -/
def exchangeEmbed : Spacetime →L[ℝ] (Fin 4 → ℂ) :=
  ContinuousLinearMap.pi fun i => Complex.ofRealCLM.comp (EuclideanSpace.proj i)

@[simp] lemma exchangeEmbed_apply (x : Spacetime) (i : Fin 4) :
    exchangeEmbed x i = (x i : ℂ) := rfl

/-- The radial Euclidean kernel, extended to complex coordinates. -/
def exchangeRadial (q : Fin 4 → ℂ) : ℂ :=
  lineC 0 0 (Complex.sqrt (∑ i, q i ^ 2) * Complex.I) 0

lemma exchangeRadial_analyticAt (q : Fin 4 → ℂ)
    (hq : 0 < (∑ i, q i ^ 2).re) : AnalyticAt ℂ exchangeRadial q := by
  have hs : AnalyticAt ℂ Complex.sqrt (∑ i, q i ^ 2) :=
    (Complex.differentiableOn_sqrt.analyticOnNhd Complex.isOpen_slitPlane) _ (Or.inl hq)
  have hp : 0 < (Complex.sqrt (∑ i, q i ^ 2) * Complex.I).im := by
    rw [Complex.mul_I_im, Complex.sqrt, Complex.cpow_inv_two_re]
    apply Real.sqrt_pos.2
    positivity
  have hl := (lineC_differentiableOn 0 0 0).analyticOnNhd
    (isOpen_lt continuous_const Complex.continuous_im) _ hp
  have hq' : AnalyticAt ℂ (fun q : Fin 4 → ℂ => ∑ i, q i ^ 2) q := by
    apply Finset.analyticAt_fun_sum
    intro i _
    exact ((ContinuousLinearMap.proj (R := ℂ) i).analyticAt q).pow 2
  have hr : AnalyticAt ℂ (fun q : Fin 4 → ℂ => Complex.sqrt (∑ i, q i ^ 2)) q :=
    hs.comp (f := fun q : Fin 4 → ℂ => ∑ i, q i ^ 2) hq'
  exact hl.comp (f := fun q : Fin 4 → ℂ => Complex.sqrt (∑ i, q i ^ 2) * Complex.I)
    (hr.mul analyticAt_const)

/-- Iterated complex directional derivatives, in exactly the order used by `partialDeriv`. -/
def exchangeJet (vs : List Spacetime) : (Fin 4 → ℂ) → ℂ :=
  vs.foldr (fun v f q => fderiv ℂ f q (exchangeEmbed v)) exchangeRadial

lemma exchangeJet_analyticAt (vs : List Spacetime) (q : Fin 4 → ℂ)
    (hq : 0 < (∑ i, q i ^ 2).re) : AnalyticAt ℂ (exchangeJet vs) q := by
  induction vs with
  | nil => exact exchangeRadial_analyticAt q hq
  | cons v vs ih =>
    exact (ContinuousLinearMap.apply ℂ ℂ (exchangeEmbed v)).analyticAt _ |>.comp ih.fderiv

lemma exchangeEmbed_sum_sq (x : Spacetime) :
    (∑ i, exchangeEmbed x i ^ 2) = (‖x‖ : ℂ) ^ 2 := by
  simp only [exchangeEmbed_apply, ← Complex.ofReal_pow, ← Complex.ofReal_sum,
    ← EuclideanSpace.real_norm_sq_eq]

lemma exchangeEmbed_pos {x : Spacetime} (hx : x ≠ 0) :
    0 < (∑ i, exchangeEmbed x i ^ 2).re := by
  rw [exchangeEmbed_sum_sq, ← Complex.ofReal_pow, Complex.ofReal_re]
  exact sq_pos_of_pos (norm_pos_iff.mpr hx)

lemma exchangeRadial_real {x : Spacetime} (hx : x ≠ 0) :
    exchangeRadial (exchangeEmbed x) = S x := by
  have hn := norm_pos_iff.mpr hx
  have hs : Complex.sqrt ((‖x‖ : ℂ) ^ 2) = (‖x‖ : ℂ) := by
    simpa [radialRoot, Real.sqrt_sq (norm_nonneg x)] using
      (radialRoot_real (r := ‖x‖) (t := 0) (by simpa using hn))
  rw [exchangeRadial, exchangeEmbed_sum_sq, hs, lineC_zero_euclid hn]
  simp [S, Real.sqrt_sq (norm_nonneg x)]

lemma exchangeJet_real (vs : List Spacetime) {x : Spacetime} (hx : x ≠ 0) :
    exchangeJet vs (exchangeEmbed x) = vs.foldr dirDeriv S x := by
  induction vs generalizing x with
  | nil => exact exchangeRadial_real hx
  | cons v vs ih =>
    have he : (fun y => exchangeJet vs (exchangeEmbed y)) =ᶠ[𝓝 x]
        vs.foldr dirDeriv S := by
      filter_upwards [isOpen_ne.mem_nhds hx] with y hy
      exact ih hy
    have hdf := (exchangeJet_analyticAt vs _ (exchangeEmbed_pos hx)).differentiableAt.hasFDerivAt
    have hd := ((hdf.restrictScalars ℝ).comp x exchangeEmbed.hasFDerivAt).fderiv
    change fderiv ℂ (exchangeJet vs) (exchangeEmbed x) (exchangeEmbed v) =
      fderiv ℝ (vs.foldr dirDeriv S) x v
    rw [← he.fderiv_eq]
    exact congrArg (fun L : Spacetime →L[ℝ] ℂ => L v) hd.symm

/-- Wick rotation in the time coordinate. -/
def exchangePoint (u : Space) (z : ℂ) : Fin 4 → ℂ :=
  Fin.lastCases (-Complex.I * z) (fun i => (u i : ℂ))

def exchangeEuclid (u : Space) (t : ℝ) : Spacetime :=
  WithLp.toLp 2 (Fin.lastCases t (fun i => u i))

@[simp] lemma exchangeEuclid_time (u : Space) (t : ℝ) :
    time (exchangeEuclid u t) = t := by simp [exchangeEuclid, time]

@[simp] lemma exchangeEuclid_spatial (u : Space) (t : ℝ) :
    spatial (exchangeEuclid u t) = u := by ext i; simp [exchangeEuclid, spatial]

lemma exchangeEuclid_ne_zero {u : Space} (hu : 0 < ‖u‖) (t : ℝ) :
    exchangeEuclid u t ≠ 0 := by
  intro h
  have hs := congrArg spatial h
  have hz : spatial (0 : Spacetime) = 0 := by ext i; rfl
  rw [exchangeEuclid_spatial, hz] at hs
  simp [hs] at hu

lemma exchangeEuclid_neg (u : Space) (t : ℝ) :
    exchangeEuclid (-u) (-t) = -exchangeEuclid u t := by
  ext i
  refine Fin.lastCases ?_ (fun j => ?_) i
  · rfl
  · simp [exchangeEuclid]

lemma exchangePoint_imag (u : Space) (t : ℝ) :
    exchangePoint u ((t : ℂ) * Complex.I) = exchangeEmbed (exchangeEuclid u t) := by
  ext i
  refine Fin.lastCases ?_ (fun j => ?_) i
  · change -Complex.I * ((t : ℂ) * Complex.I) = (t : ℂ)
    linear_combination -(t : ℂ) * Complex.I_sq
  · simp [exchangePoint, exchangeEuclid]

lemma exchangePoint_sum_sq (u : Space) (z : ℂ) :
    (∑ i, exchangePoint u z i ^ 2) = (‖u‖ : ℂ) ^ 2 - z ^ 2 := by
  rw [Fin.sum_univ_castSucc]
  simp only [exchangePoint, Fin.lastCases_castSucc, Fin.lastCases_last,
    ← Complex.ofReal_pow, ← Complex.ofReal_sum, ← EuclideanSpace.real_norm_sq_eq]
  rw [mul_pow, neg_sq, Complex.I_sq]
  ring

lemma exchangePoint_analyticAt (u : Space) (z : ℂ) :
    AnalyticAt ℂ (exchangePoint u) z := by
  apply AnalyticAt.pi
  intro i
  refine Fin.lastCases ?_ (fun j => ?_) i
  · change AnalyticAt ℂ (fun z : ℂ => -Complex.I * z) z
    exact analyticAt_const.mul analyticAt_id
  · simpa [exchangePoint] using (analyticAt_const : AnalyticAt ℂ (fun _ : ℂ => (u j : ℂ)) z)

/-- Analytic continuation of the labelled Euclidean kernel. -/
def exchangeExtension (α β : Idx) (u : Space) (z : ℂ) : ℂ :=
  (-1) ^ idxOrder α * exchangeJet (dirList (α + β)) (exchangePoint u z)

lemma exchangeExtension_analyticAt (α β : Idx) (u : Space) {z : ℂ}
    (hz : |z.re| < ‖u‖) : AnalyticAt ℂ (exchangeExtension α β u) z := by
  have hp : 0 < (∑ i, exchangePoint u z i ^ 2).re := by
    rw [exchangePoint_sum_sq]
    exact radialRoot_radicand_pos hz
  exact analyticAt_const.mul ((exchangeJet_analyticAt (dirList (α + β)) _ hp).comp
    (exchangePoint_analyticAt u z))

lemma exchangeExtension_imag (α β : Idx) (u : Space) (hu : 0 < ‖u‖) (t : ℝ) :
    exchangeExtension α β u ((t : ℂ) * Complex.I) = lineS α β (exchangeEuclid u t) := by
  rw [exchangeExtension, exchangePoint_imag,
    exchangeJet_real _ (exchangeEuclid_ne_zero hu t)]
  rfl

/-- The identity theorem with the positive imaginary axis as the uniqueness set. -/
lemma exchange_identity {f g : ℂ → ℂ} {U : Set ℂ}
    (hf : AnalyticOnNhd ℂ f U) (hg : AnalyticOnNhd ℂ g U)
    (hU : IsPreconnected U) (hI : Complex.I ∈ U)
    (he : ∀ t : ℝ, 0 < t → f ((t : ℂ) * Complex.I) = g ((t : ℂ) * Complex.I)) :
    EqOn f g U := by
  apply hf.eqOn_of_preconnected_of_mem_closure hg hU hI
  rw [Metric.mem_closure_iff]
  intro ε hε
  let t : ℝ := 1 + ε / 2
  have ht : 0 < t := by dsimp [t]; positivity
  refine ⟨(t : ℂ) * Complex.I, ⟨he t ht, ?_⟩, ?_⟩
  · simp only [Set.mem_singleton_iff]
    intro heq
    have hi := congrArg Complex.im heq
    simp only [Complex.mul_im, Complex.ofReal_re, Complex.I_im, mul_one,
      Complex.ofReal_im, Complex.I_re, mul_zero, add_zero] at hi
    dsimp [t] at hi
    linarith
  · have heq : Complex.I - (t : ℂ) * Complex.I = -(ε / 2 : ℝ) * Complex.I := by
      dsimp [t]
      push_cast
      ring
    rw [dist_eq_norm, heq, norm_mul, Complex.norm_I, mul_one, norm_neg,
      Complex.norm_real, Real.norm_eq_abs, abs_of_pos (half_pos hε)]
    exact half_lt_self hε

lemma exchangeStrip_convex (u : Space) : Convex ℝ {z : ℂ | |z.re| < ‖u‖} := by
  have h := (convex_Ioo (-‖u‖) ‖u‖).linear_preimage Complex.reLm
  change Convex ℝ {z : ℂ | -‖u‖ < z.re ∧ z.re < ‖u‖} at h
  simpa only [← abs_lt] using h

/-- The Euclidean derivative identity determines every labelled line in the upper strip. -/
lemma lineC_eq_exchangeExtension (α β : Idx) (u : Space) {z : ℂ}
    (hz : |z.re| < ‖u‖) (him : 0 < z.im) :
    lineC α β z u = exchangeExtension α β u z := by
  let U : Set ℂ := {w | |w.re| < ‖u‖} ∩ {w | 0 < w.im}
  have hopen : IsOpen U := (isOpen_lt Complex.continuous_re.abs continuous_const).inter
    (isOpen_lt continuous_const Complex.continuous_im)
  have hu : 0 < ‖u‖ := lt_of_le_of_lt (abs_nonneg _) hz
  have hc : Convex ℝ U := (exchangeStrip_convex u).inter
    ((convex_Ioi (0 : ℝ)).linear_preimage Complex.imLm)
  have hf : AnalyticOnNhd ℂ (fun w => lineC α β w u) U :=
    ((lineC_differentiableOn α β u).mono Set.inter_subset_right).analyticOnNhd hopen
  have hg : AnalyticOnNhd ℂ (exchangeExtension α β u) U :=
    fun w hw => exchangeExtension_analyticAt α β u hw.1
  apply exchange_identity hf hg hc.isPreconnected (by simp [U, hu]) ?_ ⟨hz, him⟩
  intro t ht
  rw [exchangeExtension_imag α β u hu t]
  simpa only [exchangeEuclid_time, exchangeEuclid_spatial] using
    (lineC_euclid α β (ξ := exchangeEuclid u t) (by simpa using ht))

/-- Euclidean exchange symmetry continues across the whole spacelike strip. -/
lemma exchangeExtension_symm (α β : Idx) (u : Space) {z : ℂ}
    (hz : |z.re| < ‖u‖) :
    exchangeExtension α β u z = exchangeExtension β α (-u) (-z) := by
  have hu : 0 < ‖u‖ := lt_of_le_of_lt (abs_nonneg _) hz
  have hf : AnalyticOnNhd ℂ (exchangeExtension α β u) {w : ℂ | |w.re| < ‖u‖} :=
    fun w hw => exchangeExtension_analyticAt α β u hw
  have hg : AnalyticOnNhd ℂ (fun w => exchangeExtension β α (-u) (-w))
      {w : ℂ | |w.re| < ‖u‖} := by
    intro w hw
    exact (exchangeExtension_analyticAt β α (-u) (z := -w) (by simpa using hw)).comp
      (f := fun w : ℂ => -w) analyticAt_id.neg
  apply exchange_identity hf hg (exchangeStrip_convex u).isPreconnected
    (by simpa using hu) ?_ hz
  intro t _
  rw [show -((t : ℂ) * Complex.I) = ((-t : ℝ) : ℂ) * Complex.I by push_cast; ring,
    exchangeExtension_imag α β u hu t,
    exchangeExtension_imag β α (-u) (by simpa using hu) (-t), exchangeEuclid_neg]
  exact lineS_symm α β (exchangeEuclid u t)

/-- Positive-height limits are values of the analytic extension at real spacelike points. -/
lemma lineC_exchange_boundary (α β : Idx) (t : ℝ) (u : Space) (ht : |t| < ‖u‖) :
    Tendsto (fun ε : ℝ => lineC α β ((t : ℂ) + (ε : ℂ) * Complex.I) u)
      (𝓝[>] 0) (𝓝 (exchangeExtension α β u t)) := by
  have he : Tendsto (fun ε : ℝ => (t : ℂ) + (ε : ℂ) * Complex.I)
      (𝓝[>] 0) (𝓝 (t : ℂ)) := by
    have hc : Continuous (fun ε : ℝ => (t : ℂ) + (ε : ℂ) * Complex.I) := by fun_prop
    simpa using (hc.tendsto (0 : ℝ)).mono_left (nhdsWithin_le_nhds (s := Set.Ioi 0))
  have hc := (exchangeExtension_analyticAt α β u (z := t) (by simpa using ht)).continuousAt
  apply (hc.tendsto.comp he).congr'
  filter_upwards [self_mem_nhdsWithin] with ε hε
  exact (lineC_eq_exchangeExtension α β u (by simpa using ht) (by simpa using hε)).symm

/-- Derivative-labelled boundary values at a single spacelike point. -/
lemma lineAtHeight_exchange_boundary_of_nonzero (α β : Idx) (hαβ : α ≠ 0 ∨ β ≠ 0)
    (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    ∃ w : ℂ,
      Tendsto (fun ε => lineAtHeight α β ε ξ) (𝓝[>] (0 : ℝ)) (𝓝 w) ∧
      Tendsto (fun ε => lineAtHeight β α ε (-ξ)) (𝓝[>] (0 : ℝ)) (𝓝 w) := by
  have _ := hαβ
  have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
  have hs : spatial (-ξ) = -spatial ξ := by ext i; rfl
  refine ⟨exchangeExtension α β (spatial ξ) (time ξ),
    lineC_exchange_boundary α β _ _ ht, ?_⟩
  have hr := lineC_exchange_boundary β α (-time ξ) (-spatial ξ)
    (by simpa only [abs_neg, norm_neg] using ht)
  have he := exchangeExtension_symm α β (spatial ξ) (z := (time ξ : ℂ))
    (by simpa using ht)
  rw [Complex.ofReal_neg, ← he] at hr
  simpa only [lineAtHeight, hs, time, PiLp.neg_apply, Complex.ofReal_neg] using hr

-- END lineAtHeight_exchange_boundary_of_nonzero

lemma lineAtHeight_exchange_boundary (α β : Idx) (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    ∃ w : ℂ,
      Tendsto (fun ε => lineAtHeight α β ε ξ) (𝓝[>] (0 : ℝ)) (𝓝 w) ∧
      Tendsto (fun ε => lineAtHeight β α ε (-ξ)) (𝓝[>] (0 : ℝ)) (𝓝 w) := by
  by_cases hαβ : α = 0 ∧ β = 0
  · obtain ⟨rfl, rfl⟩ := hαβ
    have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
    have hs : spatial (-ξ) = -spatial ξ := by ext i; rfl
    refine ⟨(Sr (Real.sqrt (‖spatial ξ‖ ^ 2 - time ξ ^ 2)) : ℂ),
      lineC_zero_spacelike_boundary _ _ ht, ?_⟩
    simpa only [lineAtHeight, hs, time, PiLp.neg_apply, Complex.ofReal_neg] using
      lineC_zero_spacelike_boundary_reverse (time ξ) (spatial ξ) ht
  · exact lineAtHeight_exchange_boundary_of_nonzero α β (not_and_or.mp hαβ) ξ hξ

-- BEGIN lineAtHeight_spacelike_bound_of_nonzero

lemma infDist_causalCone_le_norm (ξ : Spacetime) :
    Metric.infDist ξ causalCone ≤ ‖ξ‖ := by
  simpa using Metric.infDist_le_dist_of_mem (x := ξ) zero_mem_causalCone

/-- Complex coordinates at positive imaginary time; the coordinate space has the sup norm. -/
def complexSpacetimePoint (ξ : Spacetime) (ε : ℝ) : Fin 4 → ℂ :=
  fun i => (ξ i : ℂ) + if i = timeAxis then (ε : ℂ) * Complex.I else 0

/-- The complexified negative Minkowski square. -/
def spacelikeQuadratic (w : Fin 4 → ℂ) : ℂ :=
  (∑ i : Fin 3, w i.castSucc ^ 2) - w timeAxis ^ 2

lemma differentiable_spacelikeQuadratic : Differentiable ℂ spacelikeQuadratic := by
  unfold spacelikeQuadratic
  fun_prop

lemma norm_complexSpacetimePoint_coord (ξ : Spacetime) {ε : ℝ}
    (hε : 0 ≤ ε) (hε1 : ε ≤ 1) (i : Fin 4) :
    ‖complexSpacetimePoint ξ ε i‖ ≤ 1 + ‖ξ‖ := by
  have hi : ‖ξ i‖ ≤ ‖ξ‖ := PiLp.norm_apply_le ξ i
  unfold complexSpacetimePoint
  split_ifs
  · calc
      _ ≤ ‖(ξ i : ℂ)‖ + ‖(ε : ℂ) * Complex.I‖ := norm_add_le _ _
      _ ≤ ‖ξ‖ + 1 := by simpa [norm_mul, abs_of_nonneg hε] using add_le_add hi hε1
      _ = _ := add_comm _ _
  · simpa using hi.trans (le_add_of_nonneg_left zero_le_one)

lemma spacelikeQuadratic_point_re (ξ : Spacetime) (ε : ℝ) :
    (spacelikeQuadratic (complexSpacetimePoint ξ ε)).re =
      ‖spatial ξ‖ ^ 2 - time ξ ^ 2 + ε ^ 2 := by
  rw [EuclideanSpace.norm_sq_eq]
  simp only [spacelikeQuadratic, complexSpacetimePoint, Fin.castSucc_ne_last,
    if_false, add_zero, if_true, Complex.sub_re, Complex.re_sum]
  simp only [pow_two, Complex.mul_re, Complex.add_re, Complex.add_im,
    Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, Complex.I_re, Complex.I_im,
    mul_zero, mul_one, add_zero, zero_add, sub_zero]
  simp only [← pow_two, Real.norm_eq_abs, sq_abs, spatial, time]
  ring

lemma norm_spacelikeQuadratic_sub_le {c w : Fin 4 → ℂ} {r R : ℝ}
    (hr : 0 ≤ r) (hrR : r ≤ R) (hc : ∀ i, ‖c i‖ ≤ R) (hw : ‖w - c‖ ≤ r) :
    ‖spacelikeQuadratic w - spacelikeQuadratic c‖ ≤ 12 * r * R := by
  have hcoord (i : Fin 4) : ‖w i ^ 2 - c i ^ 2‖ ≤ 3 * r * R := by
    have hi : ‖w i - c i‖ ≤ r := (norm_le_pi_norm (w - c) i).trans hw
    calc
      _ = ‖w i - c i‖ * ‖w i + c i‖ := by rw [sq_sub_sq, norm_mul, mul_comm]
      _ ≤ r * (r + 2 * R) := by
        apply mul_le_mul hi _ (norm_nonneg _) hr
        calc
          ‖w i + c i‖ = ‖(w i - c i) + 2 * c i‖ := by congr 1; ring
          _ ≤ ‖w i - c i‖ + ‖2 * c i‖ := norm_add_le _ _
          _ ≤ r + 2 * R := by simpa [norm_mul] using add_le_add hi (mul_le_mul_of_nonneg_left (hc i) (by norm_num : (0 : ℝ) ≤ 2))
      _ ≤ 3 * r * R := by nlinarith [mul_le_mul_of_nonneg_left hrR hr]
  have he : spacelikeQuadratic w - spacelikeQuadratic c =
      (∑ i : Fin 3, (w i.castSucc ^ 2 - c i.castSucc ^ 2)) -
        (w timeAxis ^ 2 - c timeAxis ^ 2) := by
    simp only [spacelikeQuadratic, Finset.sum_sub_distrib]
    ring
  rw [he]
  calc
    _ ≤ ‖∑ i : Fin 3, (w i.castSucc ^ 2 - c i.castSucc ^ 2)‖ +
        ‖w timeAxis ^ 2 - c timeAxis ^ 2‖ := norm_sub_le _ _
    _ ≤ (∑ i : Fin 3, ‖w i.castSucc ^ 2 - c i.castSucc ^ 2‖) + 3 * r * R :=
      add_le_add (norm_sum_le _ _) (hcoord _)
    _ ≤ (∑ _i : Fin 3, 3 * r * R) + 3 * r * R := by
      gcongr with i
      exact hcoord _
    _ = 12 * r * R := by simp; ring

/-- A radius on which complexifying all four coordinates preserves a spacelike margin. -/
def spacelikeRadius (ξ : Spacetime) : ℝ :=
  Metric.infDist ξ causalCone ^ 2 / (64 * (1 + ‖ξ‖))

lemma spacelikeRadius_pos (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    0 < spacelikeRadius ξ := by
  have hd := (isClosed_causalCone.notMem_iff_infDist_pos ⟨0, zero_mem_causalCone⟩).mp hξ
  unfold spacelikeRadius
  positivity

lemma spacelikeRadius_le (ξ : Spacetime) : spacelikeRadius ξ ≤ 1 + ‖ξ‖ := by
  have hd := infDist_causalCone_le_norm ξ
  have hd0 : 0 ≤ Metric.infDist ξ causalCone := Metric.infDist_nonneg
  rw [spacelikeRadius, div_le_iff₀ (by positivity)]
  nlinarith [sq_nonneg (1 + ‖ξ‖)]

lemma spacelikeQuadratic_re_lower (ξ : Spacetime) (hξ : ξ ∉ causalCone)
    {ε : ℝ} (hε : 0 ≤ ε) (hε1 : ε ≤ 1) {w : Fin 4 → ℂ}
    (hw : w ∈ Metric.closedBall (complexSpacetimePoint ξ ε) (spacelikeRadius ξ)) :
    Metric.infDist ξ causalCone ^ 2 / 2 ≤ (spacelikeQuadratic w).re := by
  have hb := norm_spacelikeQuadratic_sub_le (spacelikeRadius_pos ξ hξ).le
    (spacelikeRadius_le ξ) (norm_complexSpacetimePoint_coord ξ hε hε1)
    (show ‖w - complexSpacetimePoint ξ ε‖ ≤ spacelikeRadius ξ from
      by simpa only [Metric.mem_closedBall, dist_eq_norm] using hw)
  have he : 12 * spacelikeRadius ξ * (1 + ‖ξ‖) =
      (3 / 16 : ℝ) * Metric.infDist ξ causalCone ^ 2 := by
    unfold spacelikeRadius
    field_simp
    ring
  rw [he] at hb
  have hre := (Complex.abs_re_le_norm (spacelikeQuadratic w -
    spacelikeQuadratic (complexSpacetimePoint ξ ε))).trans hb
  rw [Complex.sub_re, spacelikeQuadratic_point_re] at hre
  have hd := infDist_causalCone_sq_le ξ hξ
  nlinarith [(abs_le.mp hre).1, sq_nonneg ε, sq_nonneg (Metric.infDist ξ causalCone)]

/-- Cauchy's estimate in the sup norm, with an inessential order-dependent constant.
The proof repeatedly applies the first-derivative Schwarz estimate on half-sized balls. -/
lemma spacelike_cauchy_estimate (k : ℕ) :
    ∃ A : ℝ, 0 ≤ A ∧ ∀ (f : (Fin 4 → ℂ) → ℂ) (c : Fin 4 → ℂ) (r C : ℝ),
      0 < r → 0 ≤ C → AnalyticOnNhd ℂ f (Metric.ball c r) →
      (∀ y ∈ Metric.ball c r, ‖f y‖ ≤ C) →
      ‖iteratedFDeriv ℂ k f c‖ ≤ A * C / r ^ k := by
  induction k with
  | zero =>
    refine ⟨1, zero_le_one, fun f c r C hr _ _ hb => ?_⟩
    simpa only [norm_iteratedFDeriv_zero, pow_zero, div_one, one_mul] using
      hb c (Metric.mem_ball_self hr)
  | succ k ih =>
    obtain ⟨A, hA, ih⟩ := ih
    refine ⟨4 * 2 ^ k * A, by positivity, fun f c r C hr hC hf hb => ?_⟩
    have hsmall : Metric.ball c (r / 2) ⊆ Metric.ball c r :=
      Metric.ball_subset_ball (by linarith)
    have hsub (y : Fin 4 → ℂ) (hy : y ∈ Metric.ball c (r / 2)) :
        Metric.ball y (r / 2) ⊆ Metric.ball c r := by
      intro z hz
      have hdist := dist_triangle z y c
      rw [Metric.mem_ball] at hy hz ⊢
      linarith
    have hbound (y : Fin 4 → ℂ) (hy : y ∈ Metric.ball c (r / 2)) :
        ‖iteratedFDeriv ℂ k f y‖ ≤ A * C / (r / 2) ^ k :=
      ih f y (r / 2) C (half_pos hr) hC (hf.mono (hsub y hy))
        (fun z hz => hb z (hsub y hy hz))
    have hg : DifferentiableOn ℂ (iteratedFDeriv ℂ k f) (Metric.ball c (r / 2)) := by
      intro y hy
      have hs : ContDiffAt ℂ ∞ f y :=
        (hf y (hsmall hy)).contDiffAt
      exact (hs.differentiableAt_iteratedFDeriv
        (ENat.natCast_lt_of_coe_top_le_withTop le_rfl k)).differentiableWithinAt
    have hmaps : MapsTo (iteratedFDeriv ℂ k f) (Metric.ball c (r / 2))
        (Metric.closedBall (iteratedFDeriv ℂ k f c) (2 * (A * C / (r / 2) ^ k))) := by
      intro y hy
      rw [Metric.mem_closedBall, dist_eq_norm]
      exact (norm_sub_le _ _).trans (by
        linarith [hbound y hy, hbound c (Metric.mem_ball_self (half_pos hr))])
    have he := Complex.norm_fderiv_le_div_of_mapsTo_ball hg hmaps (half_pos hr)
    rw [norm_fderiv_iteratedFDeriv] at he
    calc
      _ ≤ 2 * (A * C / (r / 2) ^ k) / (r / 2) := he
      _ = (4 * 2 ^ k * A) * C / r ^ (k + 1) := by
        rw [div_pow, pow_succ]
        field_simp
        ring

/-- The scalar continuation with all four coordinates complexified. -/
def spacelikeScalar (w : Fin 4 → ℂ) : ℂ :=
  lineC 0 0 (Complex.sqrt (spacelikeQuadratic w) * Complex.I) 0

lemma sqrt_re_pos_of_re_pos {q : ℂ} (hq : 0 < q.re) : 0 < (Complex.sqrt q).re := by
  rw [Complex.sqrt, Complex.cpow_inv_two_re]
  apply Real.sqrt_pos.2
  positivity

lemma spacelikeScalar_analyticAt {w : Fin 4 → ℂ} (hw : 0 < (spacelikeQuadratic w).re) :
    AnalyticAt ℂ spacelikeScalar w := by
  have hq : AnalyticAt ℂ spacelikeQuadratic w := by
    have hp (i : Fin 4) : AnalyticAt ℂ (fun w : Fin 4 → ℂ => w i) w :=
      (ContinuousLinearMap.proj i : (Fin 4 → ℂ) →L[ℂ] ℂ).analyticAt w
    exact (Finset.univ.analyticAt_fun_sum (fun i _ => (hp i.castSucc).pow 2)).sub
      ((hp timeAxis).pow 2)
  have hs : AnalyticAt ℂ Complex.sqrt (spacelikeQuadratic w) :=
    Complex.differentiableOn_sqrt.analyticAt (Complex.isOpen_slitPlane.mem_nhds (Or.inl hw))
  have hr : 0 < (Complex.sqrt (spacelikeQuadratic w) * Complex.I).im := by
    simpa using sqrt_re_pos_of_re_pos hw
  have hl : AnalyticAt ℂ (fun z => lineC 0 0 z 0)
      (Complex.sqrt (spacelikeQuadratic w) * Complex.I) :=
    (lineC_differentiableOn 0 0 0).analyticAt
    ((isOpen_lt continuous_const Complex.continuous_im).mem_nhds hr)
  have hi : AnalyticAt ℂ (fun v => Complex.sqrt (spacelikeQuadratic v) * Complex.I) w :=
    (hs.comp hq).mul analyticAt_const
  exact AnalyticAt.comp (f := fun v : Fin 4 → ℂ =>
    Complex.sqrt (spacelikeQuadratic v) * Complex.I) hl hi

lemma sqrt_spacelikeQuadratic_re_lower (ξ : Spacetime) (hξ : ξ ∉ causalCone)
    {ε : ℝ} (hε : 0 ≤ ε) (hε1 : ε ≤ 1) {w : Fin 4 → ℂ}
    (hw : w ∈ Metric.closedBall (complexSpacetimePoint ξ ε) (spacelikeRadius ξ)) :
    Metric.infDist ξ causalCone / 2 ≤ (Complex.sqrt (spacelikeQuadratic w)).re := by
  have hd : 0 < Metric.infDist ξ causalCone :=
    (isClosed_causalCone.notMem_iff_infDist_pos ⟨0, zero_mem_causalCone⟩).mp hξ
  have hq := spacelikeQuadratic_re_lower ξ hξ hε hε1 hw
  have hp := sqrt_re_pos_of_re_pos (lt_of_lt_of_le (by positivity) hq)
  have he := congrArg Complex.re (Complex.cpow_nat_inv_pow (spacelikeQuadratic w)
    (by norm_num : (2 : ℕ) ≠ 0))
  change ((Complex.sqrt (spacelikeQuadratic w)) ^ 2).re = _ at he
  simp only [pow_two, Complex.mul_re] at he
  nlinarith [sq_nonneg (Complex.sqrt (spacelikeQuadratic w)).im]

lemma spacelikeScalar_ball_bound :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ ξ : Spacetime, ξ ∉ causalCone →
      ∀ ε : ℝ, 0 ≤ ε → ε ≤ 1 →
      (AnalyticOnNhd ℂ spacelikeScalar
        (Metric.closedBall (complexSpacetimePoint ξ ε) (spacelikeRadius ξ))) ∧
      ∀ w ∈ Metric.closedBall (complexSpacetimePoint ξ ε) (spacelikeRadius ξ),
        ‖spacelikeScalar w‖ ≤ C / Metric.infDist ξ causalCone ^ 8 := by
  obtain ⟨C, hC, hb⟩ := Sr_abs_bound
  refine ⟨256 * C, by positivity, fun ξ hξ ε hε hε1 => ?_⟩
  have hd : 0 < Metric.infDist ξ causalCone :=
    (isClosed_causalCone.notMem_iff_infDist_pos ⟨0, zero_mem_causalCone⟩).mp hξ
  constructor
  · intro w hw
    exact spacelikeScalar_analyticAt (lt_of_lt_of_le (by positivity)
      (spacelikeQuadratic_re_lower ξ hξ hε hε1 hw))
  · intro w hw
    have hr := sqrt_spacelikeQuadratic_re_lower ξ hξ hε hε1 hw
    have hp : 0 < (Complex.sqrt (spacelikeQuadratic w)).re := (half_pos hd).trans_le hr
    calc
      ‖spacelikeScalar w‖ ≤ Sr (Complex.sqrt (spacelikeQuadratic w)).re := by
        simpa only [spacelikeScalar, Complex.mul_I_im] using
          norm_lineC_zero_le (Complex.sqrt (spacelikeQuadratic w) * Complex.I) 0
      _ ≤ |Sr (Complex.sqrt (spacelikeQuadratic w)).re| := le_abs_self _
      _ ≤ C / (Complex.sqrt (spacelikeQuadratic w)).re ^ 8 := hb _ hp
      _ ≤ C / (Metric.infDist ξ causalCone / 2) ^ 8 :=
        div_le_div_of_nonneg_left hC (pow_pos (half_pos hd) 8)
          (pow_le_pow_left₀ (half_pos hd).le hr 8)
      _ = 256 * C / Metric.infDist ξ causalCone ^ 8 := by ring

/-- All complex derivatives satisfy a uniform polynomial bound at spacelike points. -/
lemma spacelikeScalar_jet_bound (k : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ ε : ℝ, 0 ≤ ε → ε ≤ 1 →
      ∀ ξ : Spacetime, ξ ∉ causalCone →
        ‖iteratedFDeriv ℂ k spacelikeScalar (complexSpacetimePoint ξ ε)‖ ≤
          C * (1 + ‖ξ‖) ^ (8 + 2 * k) / Metric.infDist ξ causalCone ^ (8 + 2 * k) := by
  obtain ⟨A, hA, ha⟩ := spacelike_cauchy_estimate k
  obtain ⟨B, hB, hb⟩ := spacelikeScalar_ball_bound
  refine ⟨A * B * 64 ^ k, by positivity, fun ε hε hε1 ξ hξ => ?_⟩
  obtain ⟨hf, hbound⟩ := hb ξ hξ ε hε hε1
  have hd : 0 < Metric.infDist ξ causalCone :=
    (isClosed_causalCone.notMem_iff_infDist_pos ⟨0, zero_mem_causalCone⟩).mp hξ
  have he := ha spacelikeScalar (complexSpacetimePoint ξ ε) (spacelikeRadius ξ)
    (B / Metric.infDist ξ causalCone ^ 8) (spacelikeRadius_pos ξ hξ) (by positivity)
    (hf.mono Metric.ball_subset_closedBall)
    (fun w hw => hbound w (Metric.ball_subset_closedBall hw))
  calc
    _ ≤ A * (B / Metric.infDist ξ causalCone ^ 8) / spacelikeRadius ξ ^ k := he
    _ = (A * B * 64 ^ k) * (1 + ‖ξ‖) ^ k /
        Metric.infDist ξ causalCone ^ (8 + 2 * k) := by
      simp only [spacelikeRadius, div_pow, mul_pow, pow_add, pow_mul]
      field_simp
    _ ≤ (A * B * 64 ^ k) * (1 + ‖ξ‖) ^ (8 + 2 * k) /
        Metric.infDist ξ causalCone ^ (8 + 2 * k) := by
      apply div_le_div_of_nonneg_right _ (by positivity)
      apply mul_le_mul_of_nonneg_left _ (by positivity)
      exact pow_le_pow_right₀ (by linarith [norm_nonneg ξ]) (show k ≤ 8 + 2 * k by omega)

/-- The momentum damping has integrable moments of every order. -/
def spacelikeDampedWeight (ε : ℝ) (p : Spacetime) : ℂ :=
  (Real.exp (-ε * time p) * weight p : ℝ)

lemma norm_spacelikeDampedWeight (ε : ℝ) (p : Spacetime) :
    ‖spacelikeDampedWeight ε p‖ = Real.exp (-ε * time p) * weight p := by
  simp only [spacelikeDampedWeight, Complex.norm_real, Real.norm_eq_abs]
  exact abs_of_nonneg (mul_nonneg (Real.exp_pos _).le (weight_nonneg p))

lemma integrable_spacelikeDampedWeight_moment {ε : ℝ} (hε : 0 < ε) (k : ℕ) :
    Integrable (fun p : Spacetime => ‖p‖ ^ k * ‖spacelikeDampedWeight ε p‖) := by
  simpa only [norm_spacelikeDampedWeight, mul_assoc] using integrable_pow_exp_weight hε k

def spacelikeFourierPairing : Spacetime →L[ℝ] Spacetime →L[ℝ] ℝ :=
  (-(2 * Real.pi)⁻¹) • innerSL ℝ

lemma spacelikeFourierPairing_apply (p ξ : Spacetime) :
    spacelikeFourierPairing p ξ = -(2 * Real.pi)⁻¹ * ⟪p, ξ⟫_ℝ := rfl

lemma spacetime_inner_split (p ξ : Spacetime) :
    ⟪p, ξ⟫_ℝ = ⟪spatial ξ, spatial p⟫_ℝ + time ξ * time p := by
  rw [real_inner_comm]
  simp only [EuclideanSpace.inner_eq_star_dotProduct, dotProduct, star_trivial,
    Fin.sum_univ_castSucc, spatial, time, timeAxis, mul_comm]

lemma lineAtHeight_eq_fourier (α β : Idx) (ε : ℝ) :
    lineAtHeight α β ε = VectorFourier.fourierIntegral Real.fourierChar volume
      spacelikeFourierPairing.toLinearMap₁₂
      (fun p => Amono α p * Bmono β p * spacelikeDampedWeight ε p) := by
  funext ξ
  rw [Real.vector_fourierIntegral_eq_integral_exp_smul]
  unfold lineAtHeight lineC
  apply integral_congr_ae
  filter_upwards [] with p
  have hpair : -2 * Real.pi * spacelikeFourierPairing p ξ = ⟪p, ξ⟫_ℝ := by
    rw [spacelikeFourierPairing_apply]
    field_simp
  simp only [ContinuousLinearMap.toLinearMap₁₂_apply, hpair, smul_eq_mul]
  have he : Complex.I * (((time ξ : ℂ) + (ε : ℂ) * Complex.I) * (time p : ℂ) +
      (⟪spatial ξ, spatial p⟫_ℝ : ℂ)) =
      (⟪p, ξ⟫_ℝ : ℂ) * Complex.I + ((-ε * time p : ℝ) : ℂ) := by
    rw [spacetime_inner_split]
    push_cast
    linear_combination (ε : ℂ) * (time p : ℂ) * Complex.I_sq
  rw [he, Complex.exp_add]
  simp only [spacelikeDampedWeight, Complex.ofReal_mul, Complex.ofReal_exp]
  ring

lemma lineAtHeight_zero_jet_fourier {ε : ℝ} (hε : 0 < ε) (k : ℕ)
    (ξ : Spacetime) (m : Fin k → Spacetime) :
    iteratedFDeriv ℝ k (lineAtHeight 0 0 ε) ξ m =
      VectorFourier.fourierIntegral Real.fourierChar volume spacelikeFourierPairing.toLinearMap₁₂
        (fun p => (∏ i, Complex.I * (⟪p, m i⟫_ℝ : ℂ)) * spacelikeDampedWeight ε p) ξ := by
  have hm : AEStronglyMeasurable (spacelikeDampedWeight ε) := by
    unfold spacelikeDampedWeight
    exact Complex.continuous_ofReal.measurable.comp
      ((Real.continuous_exp.measurable.comp ((measurable_const.mul
        (EuclideanSpace.proj timeAxis).continuous.measurable))).mul measurable_weight)
      |>.stronglyMeasurable.aestronglyMeasurable
  have hzero : lineAtHeight 0 0 ε = VectorFourier.fourierIntegral Real.fourierChar volume
      spacelikeFourierPairing.toLinearMap₁₂ (spacelikeDampedWeight ε) := by
    simpa only [Amono, Bmono, Pi.zero_apply, pow_zero, Finset.prod_const_one, one_mul] using
      lineAtHeight_eq_fourier 0 0 ε
  rw [hzero, VectorFourier.iteratedFDeriv_fourierIntegral spacelikeFourierPairing
    (N := ⊤) (fun n _ => integrable_spacelikeDampedWeight_moment hε n) hm (by simp),
    Real.fourierIntegral_continuousMultilinearMap_apply'
      (VectorFourier.integrable_fourierPowSMulRight spacelikeFourierPairing
        (integrable_spacelikeDampedWeight_moment hε k) hm)]
  congr 1
  funext p
  rw [VectorFourier.fourierPowSMulRight_apply]
  simp only [smul_eq_mul, Complex.real_smul, Complex.ofReal_prod]
  rw [← mul_assoc]
  congr 1
  have hc : (-(2 * (Real.pi : ℂ) * Complex.I)) ^ k =
      ∏ _i : Fin k, -(2 * (Real.pi : ℂ) * Complex.I) := by simp
  rw [hc, ← Finset.prod_mul_distrib]
  apply Finset.prod_congr rfl
  intro i _
  rw [spacelikeFourierPairing_apply]
  push_cast
  field_simp

lemma length_dirList (γ : Idx) : (dirList γ).length = idxOrder γ := by
  simp [dirList, List.length_flatMap, idxOrder, Fin.sum_univ_def]

lemma norm_get_dirList (γ : Idx) (i : Fin (dirList γ).length) :
    ‖(dirList γ).get i‖ = 1 := by
  have hi := List.get_mem (dirList γ) i
  simp only [dirList, List.mem_flatMap, List.mem_replicate] at hi
  obtain ⟨j, _, _, hj⟩ := hi
  change (dirList γ).get i = EuclideanSpace.single j 1 at hj
  rw [hj]
  simp

lemma prod_inner_dirList (γ : Idx) (p : Spacetime) :
    (∏ i : Fin (dirList γ).length, Complex.I * (⟪p, (dirList γ).get i⟫_ℝ : ℂ)) =
      ∏ j : Fin 4, (Complex.I * (p j : ℂ)) ^ γ j := by
  rw [← List.prod_ofFn]
  change (List.ofFn ((fun v : Spacetime => Complex.I * (⟪p, v⟫_ℝ : ℂ)) ∘
    (dirList γ).get)).prod = _
  rw [← List.map_ofFn, List.ofFn_get]
  simp [dirList, List.flatMap_def, List.prod_flatten, Function.comp_def,
    EuclideanSpace.inner_single_right,
    Fin.prod_univ_def]

def lineLabelPhase (α β : Idx) : ℂ :=
  (-1) ^ idxOrder α * Complex.I ^ ((α + β) timeAxis)

lemma norm_lineLabelPhase (α β : Idx) : ‖lineLabelPhase α β‖ = 1 := by
  simp [lineLabelPhase, norm_pow]

lemma Amono_mul_Bmono_eq_phase (α β : Idx) (p : Spacetime) :
    Amono α p * Bmono β p = lineLabelPhase α β *
      ∏ j : Fin 4, (Complex.I * (p j : ℂ)) ^ (α + β) j := by
  have he : Complex.I * (Complex.I * (time p : ℂ)) = -(time p : ℂ) := by
    rw [← mul_assoc, Complex.I_mul_I, neg_one_mul]
  rw [lineLabelPhase, Fin.prod_univ_castSucc]
  change Amono α p * Bmono β p = (-1) ^ idxOrder α * Complex.I ^ ((α + β) timeAxis) *
    ((∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ (α + β) i.castSucc) *
      (Complex.I * (time p : ℂ)) ^ (α + β) timeAxis)
  rw [mul_assoc, mul_left_comm (Complex.I ^ _), ← mul_pow, he]
  have ho : idxOrder α = (∑ i : Fin 3, α i.castSucc) + α timeAxis :=
    Fin.sum_univ_castSucc α
  rw [ho, pow_add, ← Finset.prod_pow_eq_pow_sum]
  have ht : (-1 : ℂ) ^ α timeAxis * (-(time p : ℂ)) ^ (α timeAxis + β timeAxis) =
      (time p : ℂ) ^ α timeAxis * (-(time p : ℂ)) ^ β timeAxis := by
    rw [pow_add, ← mul_assoc, ← mul_pow, neg_mul, one_mul, neg_neg]
  have hn (i : Fin 3) : (-(Complex.I * (p i.castSucc : ℂ))) ^ α i.castSucc =
      (-1 : ℂ) ^ α i.castSucc * (Complex.I * (p i.castSucc : ℂ)) ^ α i.castSucc := by
    rw [← mul_pow, neg_one_mul]
  simp only [Pi.add_apply]
  calc
    Amono α p * Bmono β p =
        ((∏ i : Fin 3, (-1 : ℂ) ^ α i.castSucc) *
          (∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ (α i.castSucc + β i.castSucc))) *
          ((time p : ℂ) ^ α timeAxis * (-(time p : ℂ)) ^ β timeAxis) := by
      simp only [Amono, Bmono, hn, pow_add, Finset.prod_mul_distrib]
      ring
    _ = _ := by rw [← ht]; ring

lemma spacelikeQuadratic_point (ξ : Spacetime) (ε : ℝ) :
    spacelikeQuadratic (complexSpacetimePoint ξ ε) =
      (‖spatial ξ‖ : ℂ) ^ 2 - ((time ξ : ℂ) + (ε : ℂ) * Complex.I) ^ 2 := by
  have hs : (∑ i : Fin 3, (ξ i.castSucc : ℂ) ^ 2) = (‖spatial ξ‖ : ℂ) ^ 2 := by
    rw [← Complex.ofReal_pow, EuclideanSpace.real_norm_sq_eq]
    simp [spatial]
  simpa only [spacelikeQuadratic, complexSpacetimePoint, Fin.castSucc_ne_last,
    if_false, add_zero, if_true, time] using congrArg
      (fun z : ℂ => z - ((time ξ : ℂ) + (ε : ℂ) * Complex.I) ^ 2) hs

lemma lineAtHeight_zero_eq_spacelikeScalar {ε : ℝ} (hε : 0 < ε)
    (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    lineAtHeight 0 0 ε ξ = spacelikeScalar (complexSpacetimePoint ξ ε) := by
  have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
  rw [lineAtHeight, lineC_zero_eq_scalarExtension _ (by simpa using ht) (by simpa using hε)]
  simp only [scalarExtension, radialRoot, spacelikeScalar, spacelikeQuadratic_point]

def complexSpacetimeEmbedding : Spacetime →L[ℝ] (Fin 4 → ℂ) :=
  ContinuousLinearMap.pi fun i => Complex.ofRealCLM.comp (EuclideanSpace.proj i)

lemma norm_complexSpacetimeEmbedding_le : ‖complexSpacetimeEmbedding‖ ≤ 1 := by
  apply complexSpacetimeEmbedding.opNorm_le_bound zero_le_one
  intro ξ
  rw [one_mul, pi_norm_le_iff_of_nonneg (norm_nonneg ξ)]
  intro i
  simpa [complexSpacetimeEmbedding] using PiLp.norm_apply_le ξ i

lemma complexSpacetimePoint_eq (ξ : Spacetime) (ε : ℝ) :
    complexSpacetimePoint ξ ε = complexSpacetimeEmbedding ξ + complexSpacetimePoint 0 ε := by
  ext i
  simp [complexSpacetimePoint, complexSpacetimeEmbedding]

lemma norm_lineAtHeight_zero_jet_le_complex {ε : ℝ} (hε : 0 < ε)
    (ξ : Spacetime) (hξ : ξ ∉ causalCone) (k : ℕ) :
    ‖iteratedFDeriv ℝ k (lineAtHeight 0 0 ε) ξ‖ ≤
      ‖iteratedFDeriv ℂ k spacelikeScalar (complexSpacetimePoint ξ ε)‖ := by
  let a := complexSpacetimePoint 0 ε
  let F := fun w : Fin 4 → ℂ => spacelikeScalar (w + a)
  let U : Set (Fin 4 → ℂ) := {w | 0 < (spacelikeQuadratic (w + a)).re}
  have ho : IsOpen U := isOpen_lt continuous_const
    (Complex.continuous_re.comp (differentiable_spacelikeQuadratic.continuous.comp
      (continuous_id.add_const a)))
  have hx : complexSpacetimeEmbedding ξ ∈ U := by
    change 0 < (spacelikeQuadratic (complexSpacetimeEmbedding ξ + a)).re
    rw [← complexSpacetimePoint_eq, spacelikeQuadratic_point_re]
    have ht : |time ξ| < ‖spatial ξ‖ := lt_of_not_ge hξ
    nlinarith [abs_lt.mp ht, sq_abs (time ξ), sq_nonneg ε]
  have hf : ContDiffOn ℝ ∞ F U := by
    intro w hw
    have ha : AnalyticAt ℂ F w := AnalyticAt.comp (f := fun v : Fin 4 → ℂ => v + a)
      (spacelikeScalar_analyticAt hw) (analyticAt_id.add analyticAt_const)
    have hc : ContDiffAt ℂ ∞ F w := ha.contDiffAt
    exact (hc.restrict_scalars ℝ).contDiffWithinAt
  have hpre : IsOpen (complexSpacetimeEmbedding ⁻¹' U) :=
    ho.preimage complexSpacetimeEmbedding.continuous
  have he := complexSpacetimeEmbedding.iteratedFDerivWithin_comp_right hf
    ho.uniqueDiffOn hpre.uniqueDiffOn hx (i := k)
      (ENat.natCast_le_of_coe_top_le_withTop le_rfl k)
  rw [iteratedFDerivWithin_of_isOpen k hpre hx,
    iteratedFDerivWithin_of_isOpen k ho hx] at he
  have heq : lineAtHeight 0 0 ε =ᶠ[𝓝 ξ] F ∘ complexSpacetimeEmbedding := by
    filter_upwards [isClosed_causalCone.isOpen_compl.mem_nhds hξ] with y hy
    simpa only [F, a, comp_apply, ← complexSpacetimePoint_eq] using
      lineAtHeight_zero_eq_spacelikeScalar hε y hy
  rw [(heq.iteratedFDeriv ℝ k).eq_of_nhds, he]
  have hnorm := (iteratedFDeriv ℝ k F (complexSpacetimeEmbedding ξ)).norm_compContinuousLinearMap_le
    (fun _ => complexSpacetimeEmbedding)
  have hbound : ‖(iteratedFDeriv ℝ k F (complexSpacetimeEmbedding ξ)).compContinuousLinearMap
      (fun _ => complexSpacetimeEmbedding)‖ ≤ ‖iteratedFDeriv ℝ k F (complexSpacetimeEmbedding ξ)‖ := by
    apply hnorm.trans
    simp only [Finset.prod_const, Finset.card_univ, Fintype.card_fin]
    exact mul_le_of_le_one_right (norm_nonneg _)
      (pow_le_one₀ (norm_nonneg _) norm_complexSpacetimeEmbedding_le)
  apply hbound.trans_eq
  dsimp only [F]
  rw [iteratedFDeriv_comp_add_right, ← complexSpacetimePoint_eq]
  have hs : ContDiffAt ℂ k spacelikeScalar (complexSpacetimePoint ξ ε) :=
    (spacelikeScalar_analyticAt (by simpa only [U, a, mem_setOf_eq,
      ← complexSpacetimePoint_eq] using hx)).contDiffAt
  rw [← hs.restrictScalars_iteratedFDeriv (𝕜 := ℝ), comp_apply,
    ContinuousMultilinearMap.norm_restrictScalars]

/-- Differentiation of the scalar Fourier--Laplace integral, followed by restriction
of the complex derivatives to real coordinate directions. The leg conventions only add
a factor of norm one. No boundary-value or exchange assertion is needed here. -/
lemma norm_lineAtHeight_le_scalar_jet (α β : Idx) (ε : ℝ) (hε : 0 < ε)
    (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    ‖lineAtHeight α β ε ξ‖ ≤
      ‖iteratedFDeriv ℂ (idxOrder α + idxOrder β) spacelikeScalar
        (complexSpacetimePoint ξ ε)‖ := by
  let γ := α + β
  let m : Fin (dirList γ).length → Spacetime := (dirList γ).get
  have hlen : (dirList γ).length = idxOrder α + idxOrder β := by
    rw [length_dirList]
    simp [γ, idxOrder, Finset.sum_add_distrib]
  have he : lineAtHeight α β ε ξ = lineLabelPhase α β *
      iteratedFDeriv ℝ (dirList γ).length (lineAtHeight 0 0 ε) ξ m := by
    rw [lineAtHeight_zero_jet_fourier hε, lineAtHeight_eq_fourier]
    have hfun : (fun p => Amono α p * Bmono β p * spacelikeDampedWeight ε p) =
        lineLabelPhase α β • (fun p =>
          (∏ i, Complex.I * (⟪p, m i⟫_ℝ : ℂ)) * spacelikeDampedWeight ε p) := by
      funext p
      simp only [Pi.smul_apply, smul_eq_mul, m, prod_inner_dirList, Amono_mul_Bmono_eq_phase, γ]
      ring
    rw [hfun, VectorFourier.fourierIntegral_const_smul]
    rfl
  rw [he, norm_mul, norm_lineLabelPhase, one_mul]
  have hb := (iteratedFDeriv ℝ (dirList γ).length (lineAtHeight 0 0 ε) ξ).le_opNorm m
  simp only [m, norm_get_dirList, Finset.prod_const_one, mul_one] at hb
  apply hb.trans
  rw [← hlen]
  exact norm_lineAtHeight_zero_jet_le_complex hε ξ hξ (dirList γ).length

set_option linter.unusedVariables false in
/-- A polynomial bound uniform in the damping height.
The exponents may be increased so one exponent controls both growth and cone singularities. -/
lemma lineAtHeight_spacelike_bound_of_nonzero (α β : Idx) (hαβ : α ≠ 0 ∨ β ≠ 0) :
    ∃ C : ℝ, 0 ≤ C ∧ ∃ N : ℕ, ∀ ε : ℝ, 0 < ε → ε ≤ 1 →
      ∀ ξ : Spacetime, ξ ∉ causalCone →
        max ‖lineAtHeight α β ε ξ‖ ‖lineAtHeight β α ε (-ξ)‖ ≤
          C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N := by
  obtain ⟨C, hC, hb⟩ := spacelikeScalar_jet_bound (idxOrder α + idxOrder β)
  refine ⟨C, hC, 8 + 2 * (idxOrder α + idxOrder β), fun ε hε hε1 ξ hξ => ?_⟩
  apply max_le
  · exact (norm_lineAtHeight_le_scalar_jet α β ε hε ξ hξ).trans (hb ε hε.le hε1 ξ hξ)
  · have hn : -ξ ∉ causalCone := fun h => hξ ((causalCone_neg ξ).mp h)
    have he := norm_lineAtHeight_le_scalar_jet β α ε hε (-ξ) hn
    rw [Nat.add_comm (idxOrder β)] at he
    have hb' := hb ε hε.le hε1 (-ξ) hn
    rw [norm_neg, infDist_causalCone_neg] at hb'
    exact he.trans hb'

-- END lineAtHeight_spacelike_bound_of_nonzero

lemma lineAtHeight_spacelike_bound (α β : Idx) :
    ∃ C : ℝ, 0 ≤ C ∧ ∃ N : ℕ, ∀ ε : ℝ, 0 < ε → ε ≤ 1 →
      ∀ ξ : Spacetime, ξ ∉ causalCone →
        max ‖lineAtHeight α β ε ξ‖ ‖lineAtHeight β α ε (-ξ)‖ ≤
          C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N := by
  by_cases hαβ : α = 0 ∧ β = 0
  · obtain ⟨rfl, rfl⟩ := hαβ
    obtain ⟨C, hC, hb⟩ := lineC_zero_uniform_bound
    refine ⟨C, hC, 8, fun ε hε _ ξ hξ => ?_⟩
    have hfac : (1 : ℝ) ≤ (1 + ‖ξ‖) ^ 8 :=
      one_le_pow₀ (le_add_of_nonneg_right (norm_nonneg _))
    have hc : C / Metric.infDist ξ causalCone ^ 8 ≤
        C * (1 + ‖ξ‖) ^ 8 / Metric.infDist ξ causalCone ^ 8 :=
      div_le_div_of_nonneg_right (by nlinarith [mul_le_mul_of_nonneg_left hfac hC])
        (pow_nonneg Metric.infDist_nonneg _)
    apply max_le
    · exact (hb ε hε ξ hξ).trans hc
    · have hr := hb ε hε (-ξ) (fun h => hξ ((causalCone_neg ξ).mp h))
      rw [infDist_causalCone_neg] at hr
      exact hr.trans hc
  · exact lineAtHeight_spacelike_bound_of_nonzero α β (not_and_or.mp hαβ)

/-- Taking finite products preserves the common pointwise boundary value. -/
lemma bundleKernel_exchange_boundary {L : Type*} [Fintype L]
    (α β : L → Idx) (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    Tendsto (fun ε => bundleKernel α β ε ξ - bundleKernel β α ε (-ξ))
      (𝓝[>] (0 : ℝ)) (𝓝 0) := by
  choose w hw hw' using fun a => lineAtHeight_exchange_boundary (α a) (β a) ξ hξ
  have hl := tendsto_finsetProd Finset.univ (fun a _ => hw a)
  have hr := tendsto_finsetProd Finset.univ (fun a _ => hw' a)
  simpa only [bundleKernel, sub_self] using hl.sub hr

/-- The finite product has the same form of polynomial cone bound. -/
lemma bundleKernel_spacelike_bound {L : Type*} [Fintype L] (α β : L → Idx) :
    ∃ C : ℝ, 0 ≤ C ∧ ∃ N : ℕ, ∀ ε : ℝ, 0 < ε → ε ≤ 1 →
      ∀ ξ : Spacetime, ξ ∉ causalCone →
        ‖bundleKernel α β ε ξ‖ ≤ C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N ∧
        ‖bundleKernel β α ε (-ξ)‖ ≤ C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N := by
  choose C hC N hb using fun a => lineAtHeight_spacelike_bound (α a) (β a)
  refine ⟨∏ a, C a, Finset.prod_nonneg (fun a _ => hC a), ∑ a, N a, ?_⟩
  intro ε hε hε1 ξ hξ
  have hp (F : L → ℂ)
      (hF : ∀ a, ‖F a‖ ≤ C a * (1 + ‖ξ‖) ^ N a / Metric.infDist ξ causalCone ^ N a) :
      ‖∏ a, F a‖ ≤ (∏ a, C a) * (1 + ‖ξ‖) ^ (∑ a, N a) /
        Metric.infDist ξ causalCone ^ (∑ a, N a) := by
    rw [norm_prod]
    have he := Finset.prod_le_prod (fun a (_ : a ∈ (Finset.univ : Finset L)) => norm_nonneg (F a))
      (fun a _ => hF a)
    simpa only [Finset.prod_div_distrib, Finset.prod_mul_distrib,
      Finset.prod_pow_eq_pow_sum] using he
  exact ⟨hp _ (fun a => (le_max_left _ _).trans (hb a ε hε hε1 ξ hξ)),
    hp _ (fun a => (le_max_right _ _).trans (hb a ε hε hε1 ξ hξ))⟩

/-- Smearing the finite products commutes with taking their common spacelike boundary.
The tests need not have compact support or a uniform positive distance from the cone. -/
lemma smeared_bundleKernel_exchange {L : Type*} [Fintype L] (α β : L → Idx)
    (c : TestFunction) (hc : EqOn c 0 causalCone) :
    Tendsto (fun ε : ℝ => (∫ ξ, bundleKernel α β ε ξ * c ξ) -
      ∫ ξ, bundleKernel β α ε (-ξ) * c ξ) (𝓝[>] 0) (𝓝 0) := by
  obtain ⟨C, hC, N, hb⟩ := bundleKernel_spacelike_bound α β
  have hm (ε : ℝ) : AEStronglyMeasurable (bundleKernel α β ε) :=
    (stronglyMeasurable_bundleKernel α β ε).aestronglyMeasurable
  have hm' (ε : ℝ) : AEStronglyMeasurable (fun ξ => bundleKernel β α ε (-ξ)) :=
    ((stronglyMeasurable_bundleKernel β α ε).comp_measurable measurable_neg).aestronglyMeasurable
  have heps : ∀ᶠ ε : ℝ in 𝓝[>] 0, 0 < ε ∧ ε ≤ 1 := by
    filter_upwards [Ioo_mem_nhdsGT (show (0 : ℝ) < 1 by norm_num)] with ε hε
    exact ⟨hε.1, hε.2.le⟩
  have hd := tendsto_integral_mul_flat_zero c hc
    (fun ε ξ => bundleKernel α β ε ξ - bundleKernel β α ε (-ξ))
    (2 * C) (by positivity) N
    (Filter.Eventually.of_forall fun ε => (hm ε).sub (hm' ε))
    (heps.mono fun ε hε ξ hξ => by
      obtain ⟨hl, hr⟩ := hb ε hε.1 hε.2 ξ hξ
      calc
        _ ≤ ‖bundleKernel α β ε ξ‖ + ‖bundleKernel β α ε (-ξ)‖ := norm_sub_le _ _
        _ ≤ (C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N) +
          (C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N) := add_le_add hl hr
        _ = _ := by ring)
    (bundleKernel_exchange_boundary α β)
  apply hd.congr'
  filter_upwards [heps] with ε hε
  have hi := integrable_mul_flat c hc _ (hm ε) C hC N
    (fun ξ hξ => (hb ε hε.1 hε.2 ξ hξ).1)
  have hi' := integrable_mul_flat c hc _ (hm' ε) C hC N
    (fun ξ hξ => (hb ε hε.1 hε.2 ξ hξ).2)
  simpa only [sub_mul] using integral_sub hi hi'

/-- The two-test exchange, assembled from flatness and the three explicit analytic inputs. -/
lemma bundle_spacelike_exchange_zero {L : Type*} [Fintype L] [Nonempty L]
    (α β : L → Idx) (f g : TestFunction)
    (h : FieldSystem.SpacelikeSeparated f g) :
    (∫ q : L → Spacetime, bundleIntegrand α β f g 0 0 q) =
      ∫ q : L → Spacetime, bundleIntegrand β α g f 0 0 q := by
  have hl := bundleKernel_boundary α β (differenceTest f g)
  have hr := bundleKernel_boundary β α (differenceTest g f)
  have hr' : Tendsto (fun ε : ℝ =>
      ∫ ξ, bundleKernel β α ε (-ξ) * differenceTest f g ξ) (𝓝[>] 0)
      (𝓝 (∫ q : L → Spacetime, bundleFourierIntegrand β α (differenceTest g f) q)) := by
    apply hr.congr'
    filter_upwards [] with ε
    rw [← integral_neg_eq_self (fun ξ => bundleKernel β α ε ξ * differenceTest g f ξ)]
    simp only [differenceTest_swap]
  have hd := smeared_bundleKernel_exchange α β (differenceTest f g)
    (differenceTest_zero_on_causalCone f g h)
  have he := sub_eq_zero.mp (tendsto_nhds_unique (hl.sub hr') hd)
  simpa only [← bundleIntegrand_differenceTest] using he

/-- Fixed spectator momenta are absorbed by support-preserving modulation. -/
lemma bundle_spacelike_exchange {L : Type*} [Fintype L] [Nonempty L]
    (α β : L → Idx) (f g : TestFunction)
    (h : FieldSystem.SpacelikeSeparated f g) (k l : Spacetime) :
    (∫ q : L → Spacetime, bundleIntegrand α β f g k l q) =
      ∫ q : L → Spacetime, bundleIntegrand β α g f l k q := by
  simpa only [bundleIntegrand_modulateTest] using
    bundle_spacelike_exchange_zero α β (modulateTest k f) (modulateTest l g)
      (separated_modulateTest k l h)

/-- Exchange for a matching with joining lines, by Fubini and the two-test identity. -/
lemma matchingValue_swap_spacelike_with_line {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : j.val = i.val + 1)
    (h : FieldSystem.SpacelikeSeparated (f i) (f j))
    (hc : ∃ a : Leg m, a.1 = i ∧ (σ.1 a).1 = j) :
    matchingValue σ f =
      matchingValue (matchingEquiv (Equiv.swap i j) m σ) (f ∘ Equiv.swap i j) := by
  have hne : i ≠ j := by intro he; have := congrArg Fin.val he; omega
  obtain ⟨a, hai, haj⟩ := hc
  have ha : a.1 < (σ.1 a).1 := by
    rw [hai, haj]
    exact Fin.lt_def.mpr (by omega)
  letI : Nonempty {a : Line σ // Joins σ i j a} := ⟨⟨⟨a, ha⟩, hai, haj⟩⟩
  rw [matchingValue_split σ f i j hne, matchingValue_swapped_split σ f i j hij]
  apply integral_congr_ae
  filter_upwards [] with r
  rw [bundle_spacelike_exchange _ _ (f i) (f j) h]

/-- Assemble the analytic exchange and the proved case without a joining line. -/
lemma matchingValue_swap_spacelike {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (i j : Fin n) (hij : j.val = i.val + 1)
    (h : FieldSystem.SpacelikeSeparated (f i) (f j)) :
    matchingValue σ f =
      matchingValue (matchingEquiv (Equiv.swap i j) m σ) (f ∘ Equiv.swap i j) := by
  by_cases hc : ∃ a : Leg m, a.1 = i ∧ (σ.1 a).1 = j
  · exact matchingValue_swap_spacelike_with_line σ f i j hij h hc
  · exact matchingValue_swap_of_no_line σ f i j hij hc

/-- Locality for finitely indexed labels, reduced to individual matching integrals. -/
lemma wightmanL_swap_spacelike (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction)
    (i j : Fin n) (hij : j.val = i.val + 1)
    (h : FieldSystem.SpacelikeSeparated (f i) (f j)) :
    wightmanL P f = wightmanL (P ∘ Equiv.swap i j) (f ∘ Equiv.swap i j) := by
  apply labels_of_monomials
  intro m
  apply monomials_of_matchings
  intro σ
  exact matchingValue_swap_spacelike σ f i j hij h

end WightLocal

theorem wightW_local' (u v : Word) (A B : Mon →₀ ℂ) (f g : TestFunction)
    (h : FieldSystem.SpacelikeSeparated f g) :
    wightW (u ++ (A, f) :: (B, g) :: v) = wightW (u ++ (B, g) :: (A, f) :: v) := by
  rw [WightLocal.wightW_splice, WightLocal.wightW_splice]
  have he := WightLocal.wightmanL_swap_spacelike
    (WightLocal.splice u.lab A B v.lab) (WightLocal.splice u.test f g v.test)
    (Fin.natAdd u.length (0 : Fin (v.length + 2)))
    (Fin.natAdd u.length (1 : Fin (v.length + 2)))
    (by simp) (by simpa [WightLocal.splice] using h)
  simpa only [WightLocal.splice_swap] using he

end YangMills.FreeField.Consolidated.Theory_WightWLocal

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [HARD, 2000 lines] **Locality of the Wightman functions.** Exchanging two adjacent letters
with spacelike separated tests changes only the lines between the two vertices, which reverse.
For a matching with `c` such lines the two integrals differ by replacing
`∫ ∏ dμ(q_e) (leg factors) F̂(K - ∑ q_e) Ĝ(K' + ∑ q_e)` by the same with `q_e ↦ -q_e` in the
exponentials; in position space this is `∏_e W_e (y - x)` against `∏_e W_e (x - y)`, where each
`W_e` is a derivative of the boundary value of `F(ζ) = ∫ exp (i ⟪ζ, p⟫) dμ`. For spacelike
`ξ = a e₁` (after a rotation), `F` is constant `= Sr a` along the points
`(a cos θ, 0, 0, i a sin θ)`, `0 < θ < π`, of the tube (by `Sr_euclid`), so the boundary values at
`ξ` and `-ξ` agree, locally uniformly; first for compactly supported tests (the support of
`f ⊗ g` is then a compact subset of the open spacelike region), then for all tests by cut-offs
`f χ_R → f` in the Schwartz topology and `wightmanL_continuous`.
Depends on `Sr_euclid`, `partialDeriv_S_integral`, `matching_integrable`, `wightmanL_continuous`. -/
theorem wightW_local (u v : Word) (A B : Mon →₀ ℂ) (f g : TestFunction)
    (h : FieldSystem.SpacelikeSeparated f g) :
    wightW (u ++ (A, f) :: (B, g) :: v) = wightW (u ++ (B, g) :: (A, f) :: v) := by
  exact Consolidated.Theory_WightWLocal.wightW_local' u v A B f g h

end YangMills.FreeField
