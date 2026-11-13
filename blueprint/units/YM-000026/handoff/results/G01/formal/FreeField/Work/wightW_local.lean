import FreeField.Theory
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Fourier.Convolution

/-!
Locality: reindexing the Wick expansion and isolating the analytic exchange step.
All auxiliary declarations are confined to `WightLocal`.

Status: PARTIAL. Three analytic inputs remain admitted:
* `bundleKernel_fourier_damped`: absolute integrability and positive-height Fubini (step 2);
* `lineAtHeight_exchange_boundary_of_nonzero`: derivative boundary values (steps 3--4);
* `lineAtHeight_spacelike_bound_of_nonzero`: uniform derivative bounds (step 5).

The difference-variable Schwartz function, its Fourier transform and causal-cone vanishing,
all-order weighted flatness, scalar continuation and uniform bounds, removal of momentum
damping, and the position-space dominated-convergence argument are proved. Finite-product
exchange and `bundle_spacelike_exchange_zero` are assembled from these three inputs.
All matching relabelling, spectator-momentum removal, and the final theorem are retained.
No existing work file is imported.
-/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
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

/-- GAP (plan step 2): absolute integrability of the Fourier pairing and Fubini at
positive height. All limits and removal of the damping are proved separately. -/
lemma bundleKernel_fourier_damped {L : Type*} [Fintype L] [Nonempty L]
    (α β : L → Idx) (c : TestFunction) :
    Integrable (bundleFourierIntegrand α β c) ∧
      ∀ ε : ℝ, 0 < ε →
        (∫ ξ, bundleKernel α β ε ξ * c ξ) =
          ∫ q : L → Spacetime, (Real.exp (-ε * ∑ a, time (q a)) : ℂ) *
            bundleFourierIntegrand α β c q := by
  sorry

/-- The boundary value is the undamped Fourier pairing. -/
lemma bundleKernel_boundary {L : Type*} [Fintype L] [Nonempty L]
    (α β : L → Idx) (c : TestFunction) :
    Tendsto (fun ε : ℝ => ∫ ξ, bundleKernel α β ε ξ * c ξ) (𝓝[>] 0)
      (𝓝 (∫ q : L → Spacetime, bundleFourierIntegrand α β c q)) := by
  obtain ⟨hi, he⟩ := bundleKernel_fourier_damped α β c
  apply (bundleFourierIntegrand_damping_limit α β c hi).congr'
  filter_upwards [self_mem_nhdsWithin] with ε hε
  exact (he ε hε).symm

/-- GAP (plan steps 3--4): derivative-labelled boundary values at a single spacelike point.
The scalar case is `lineC_zero_spacelike_boundary` and its reverse. -/
lemma lineAtHeight_exchange_boundary_of_nonzero (α β : Idx) (hαβ : α ≠ 0 ∨ β ≠ 0)
    (ξ : Spacetime) (hξ : ξ ∉ causalCone) :
    ∃ w : ℂ,
      Tendsto (fun ε => lineAtHeight α β ε ξ) (𝓝[>] (0 : ℝ)) (𝓝 w) ∧
      Tendsto (fun ε => lineAtHeight β α ε (-ξ)) (𝓝[>] (0 : ℝ)) (𝓝 w) := by
  sorry

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

/-- GAP (plan step 5): a polynomial bound uniform in the damping height.
The exponents may be increased so one exponent controls both growth and cone singularities. -/
lemma lineAtHeight_spacelike_bound_of_nonzero (α β : Idx) (hαβ : α ≠ 0 ∨ β ≠ 0) :
    ∃ C : ℝ, 0 ≤ C ∧ ∃ N : ℕ, ∀ ε : ℝ, 0 < ε → ε ≤ 1 →
      ∀ ξ : Spacetime, ξ ∉ causalCone →
        max ‖lineAtHeight α β ε ξ‖ ‖lineAtHeight β α ε (-ξ)‖ ≤
          C * (1 + ‖ξ‖) ^ N / Metric.infDist ξ causalCone ^ N := by
  sorry

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

end YangMills.FreeField

#print axioms YangMills.FreeField.WightLocal.matchingValue_swap_of_no_line
#print axioms YangMills.FreeField.WightLocal.schwartz_flat_causalCone
#print axioms YangMills.FreeField.WightLocal.fourierE_differenceTest
#print axioms YangMills.FreeField.WightLocal.tendsto_integral_mul_flat_zero
#print axioms YangMills.FreeField.WightLocal.local_of_tendsto
#print axioms YangMills.FreeField.WightLocal.lineC_zero_semicircle
#print axioms YangMills.FreeField.WightLocal.lineC_zero_spacelike_boundary
#print axioms YangMills.FreeField.wightW_local'
