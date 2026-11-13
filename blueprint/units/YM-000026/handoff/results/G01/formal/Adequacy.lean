import ChallengeSpec

/-!
# A witness of the public Yang–Mills specification with constant lattice insertions

Formalisation of the Proposition (Variant) of section (c) of the G01 adequacy note.
This file imports only the public specification (`ChallengeSpec`, which imports
`PublicWilson`, `PublicTheory` and Mathlib).
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.Adequacy
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical NNReal ContDiff ENNReal

/-! ## The two-point phase space -/

/-- The two phases. `plus` is the selected one. -/
inductive Phase
  | plus
  | minus
  deriving DecidableEq, Fintype

namespace Phase

/-- An embedding into the real line, used only to induce a metric. -/
def toReal : Phase → ℝ
  | plus => 0
  | minus => 1

theorem toReal_injective : Injective toReal := by
  intro a b h
  cases a <;> cases b <;> simp [toReal] at h ⊢

instance : MetricSpace Phase := MetricSpace.induced toReal toReal_injective inferInstance
instance : MeasurableSpace Phase := borel Phase
instance : BorelSpace Phase := ⟨rfl⟩
instance : DiscreteTopology Phase := inferInstance
instance : CompactSpace Phase := inferInstance

/-- Mass one half at each phase. -/
def measure : Measure Phase :=
  (2⁻¹ : ℝ≥0∞) • Measure.dirac plus + (2⁻¹ : ℝ≥0∞) • Measure.dirac minus

instance : IsProbabilityMeasure measure :=
  ⟨by simp [measure, ENNReal.inv_two_add_inv_two]⟩

theorem measure_isOpenPos : measure.IsOpenPosMeasure := by
  refine ⟨fun U hU hne => ?_⟩
  obtain ⟨c, hc⟩ := hne
  cases c
  · have : (2⁻¹ : ℝ≥0∞) ≤ measure U := by
      simp [measure, Measure.dirac_apply' _ hU.measurableSet, hc]
    intro h
    rw [h] at this
    simp at this
  · have : (2⁻¹ : ℝ≥0∞) ≤ measure U := by
      simp [measure, Measure.dirac_apply' _ hU.measurableSet, hc]
    intro h
    rw [h] at this
    simp at this

theorem integral_measure (f : Phase → ℂ) :
    ∫ c, f c ∂measure = (1 / 2 : ℂ) * f plus + (1 / 2 : ℂ) * f minus := by
  have h1 : Integrable f ((2⁻¹ : ℝ≥0∞) • Measure.dirac plus) :=
    (Integrable.of_finite : Integrable f (Measure.dirac plus)).smul_measure (by simp)
  have h2 : Integrable f ((2⁻¹ : ℝ≥0∞) • Measure.dirac minus) :=
    (Integrable.of_finite : Integrable f (Measure.dirac minus)).smul_measure (by simp)
  rw [measure, integral_add_measure h1 h2, integral_smul_measure, integral_smul_measure,
    integral_dirac, integral_dirac]
  simp [Complex.real_smul]

end Phase

/-! ## The data -/

variable {g : GaugeGroup} (C₀ : WilsonFamily g) (T₀ : Hierarchy C₀)

/-- The indicator of the tag `⟨0, 0⟩`. -/
def m (A : T₀.Tag) : ℂ := if A = ⟨0, 0⟩ then 1 else 0

theorem m_zero : m C₀ T₀ ⟨0, 0⟩ = 1 := if_pos rfl

theorem m_pos {j : ℕ} (hj : j ≠ 0) (e : T₀.Field j) : m C₀ T₀ ⟨j, e⟩ = 0 := by
  refine if_neg fun h => hj ?_
  exact congrArg Sigma.fst h

theorem norm_m_le (A : T₀.Tag) : ‖m C₀ T₀ A‖ ≤ 1 := by
  unfold m; split_ifs <;> simp

/-- The constant mixed correlation: a product over the slots. -/
def M {I : Type} [Fintype I] (a : I → T₀.Tag) : ℂ := ∏ i, m C₀ T₀ (a i)

theorem norm_M_le {I : Type} [Fintype I] (a : I → T₀.Tag) : ‖M C₀ T₀ a‖ ≤ 1 := by
  unfold M
  rw [norm_prod]
  exact Finset.prod_le_one (fun _ _ => norm_nonneg _) (fun i _ => norm_m_le C₀ T₀ _)

/-- The Wilson family with insertions that do not read the configuration. -/
def family : WilsonFamily g where
  period p := ⟨p + 1, Nat.succ_pos p⟩
  denominator N := ⟨N + 2, Nat.succ_pos (N + 1)⟩
  periodStrict := fun _ _ h => Nat.succ_lt_succ h
  denominatorStrict := fun _ _ h => Nat.add_lt_add_right h 2
  beta N _ := Real.log ((N : ℝ) + 2)
  haar := C₀.haar
  probability := C₀.probability
  invariantHaar := C₀.invariantHaar
  Token := T₀.Tag
  insertion _ _ A _ _ := m C₀ T₀ A

/-- The correlations of the new hierarchy. -/
def corr {n : ℕ} : Option Phase → (Fin n → T₀.Tag) → Points n → ℂ
  | none, a, _ => M C₀ T₀ a
  | some Phase.plus, a, x => T₀.correlation (some T₀.selected) a x
  | some Phase.minus, a, x => 2 * M C₀ T₀ a - T₀.correlation (some T₀.selected) a x

/-- The coefficient of the added grade-zero channel. -/
def hcoef {I : Type} [Fintype I] (a : I → T₀.Tag) (x : I → Spacetime) (o : Spacetime) : ℂ :=
  M C₀ T₀ a - ∑ i : T₀.Channel 0, T₀.coefficient a 0 i x o * m C₀ T₀ ⟨0, T₀.actor 0 i⟩

/-- The hierarchy over `family`. One extra channel in every grade, with actor `0`; its
coefficient is `hcoef` in grade zero and `0` in positive grades. -/
def hier : Hierarchy (family C₀ T₀) where
  H := T₀.H
  labels := T₀.labels
  theory := T₀.theory
  Field := T₀.Field
  toLabel := T₀.toLabel
  project := id
  Character := Phase
  phaseMeasure := Phase.measure
  selected := Phase.plus
  correlation := corr C₀ T₀
  continuation := T₀.continuation
  Channel d := T₀.Channel d ⊕ Unit
  actor d := Sum.elim (T₀.actor d) (fun _ => 0)
  coefficient a j := Sum.elim (T₀.coefficient a j)
    (fun _ x o => if j = 0 then hcoef C₀ T₀ a x o else 0)
  centeredTrace := T₀.centeredTrace

/-! ## `WilsonRegularity` -/

theorem family_regular : WilsonRegularity (family C₀ T₀) where
  running := by
    refine ⟨1, one_pos, fun ε hε => Eventually.of_forall fun N p => ?_⟩
    have hN : (1 : ℝ) < (N : ℝ) + 2 := by
      have : (0 : ℝ) ≤ N := Nat.cast_nonneg N
      linarith
    have hlog : Real.log ((N : ℝ) + 2) ≠ 0 := (Real.log_pos hN).ne'
    have hmesh : ((family C₀ T₀).mesh N)⁻¹ = (N : ℝ) + 2 := by
      simp [WilsonFamily.mesh, family]
    have hbeta : (family C₀ T₀).beta N p = Real.log ((N : ℝ) + 2) := rfl
    rw [hmesh, hbeta, div_self hlog]
    simpa using hε
  continuous N p v x := continuous_const
  invariant N p v x t U := rfl
  localSupport v := ⟨∅, fun N p x U V _ => rfl⟩

theorem family_insertion_const (N p : ℕ) (v : (family C₀ T₀).Token)
    (x : Site ((family C₀ T₀).period p * (family C₀ T₀).denominator N))
    (U V : Configuration g ((family C₀ T₀).period p * (family C₀ T₀).denominator N)) :
    (family C₀ T₀).insertion N p v x U = (family C₀ T₀).insertion N p v x V := rfl

/-! ## `Reconstructed` -/

theorem hier_reconstructed (hR : T₀.Reconstructed) : (hier C₀ T₀).Reconstructed where
  axioms := hR.axioms
  faithful := hR.faithful
  injective := hR.injective
  acts := hR.acts
  covers := hR.covers
  represents := fun a => ⟨a, rfl⟩
  normalized := inferInstanceAs (IsProbabilityMeasure Phase.measure)
  fullSupport := Phase.measure_isOpenPos
  permutation s {n} a x hx π := by
    have hM : M C₀ T₀ (a ∘ π) = M C₀ T₀ a := Equiv.prod_comp π fun i => m C₀ T₀ (a i)
    have hS := hR.permutation (some T₀.selected) a x hx π
    rcases s with _ | c
    · exact hM
    · cases c
      · exact hS
      · show 2 * M C₀ T₀ (a ∘ π) - T₀.correlation (some T₀.selected) (a ∘ π) _ = _
        rw [hM, hS]; rfl
  smooth s {n} a := by
    have hS := hR.smooth (some T₀.selected) a
    rcases s with _ | c
    · exact contDiffOn_const
    · cases c
      · exact hS
      · exact contDiffOn_const.sub hS
  characterContinuity {n} a x h := by
    show Continuous fun i : Phase => corr C₀ T₀ (some i) a x
    exact continuous_of_discreteTopology
  mixture {n} a x h := by
    show ∫ c, corr C₀ T₀ (some c) a x ∂Phase.measure = M C₀ T₀ a
    rw [Phase.integral_measure]
    show (1 / 2 : ℂ) * T₀.correlation (some T₀.selected) a x +
      (1 / 2 : ℂ) * (2 * M C₀ T₀ a - T₀.correlation (some T₀.selected) a x) = M C₀ T₀ a
    ring
  analytic := hR.analytic
  root := hR.root
  boundary := hR.boundary

/-! ## `TraceTest` -/

theorem hier_traceTest (hT : T₀.TraceTest) : (hier C₀ T₀).TraceTest where
  centered := hT.centered
  amplitudePositive := hT.amplitudePositive
  shortDistance := hT.shortDistance
  excludes := hT.excludes

/-! ## `OperatorProductExpansion` -/

theorem M_unit (A : T₀.Tag) : M C₀ T₀ (fun _ : Unit => A) = m C₀ T₀ A := by
  simp [M]

theorem grouped_none {I J : Type} [Fintype I] [Fintype J] (a : I → T₀.Tag) (x : I → Spacetime)
    (b : J → T₀.Tag) (y : J → Spacetime) :
    (hier C₀ T₀).grouped none a x b y = M C₀ T₀ a * M C₀ T₀ b := by
  show M C₀ T₀ ((Sum.elim a b) ∘ (Fintype.equivFin (I ⊕ J)).symm) = _
  unfold M
  exact (Equiv.prod_comp (Fintype.equivFin (I ⊕ J)).symm fun s => m C₀ T₀ (Sum.elim a b s)).trans
    (Fintype.prod_sum_type _)

theorem grouped_plus {I J : Type} [Fintype I] [Fintype J] (a : I → T₀.Tag) (x : I → Spacetime)
    (b : J → T₀.Tag) (y : J → Spacetime) :
    (hier C₀ T₀).grouped (some Phase.plus) a x b y = T₀.grouped (some T₀.selected) a x b y := rfl

theorem grouped_minus {I J : Type} [Fintype I] [Fintype J] (a : I → T₀.Tag) (x : I → Spacetime)
    (b : J → T₀.Tag) (y : J → Spacetime) :
    (hier C₀ T₀).grouped (some Phase.minus) a x b y =
      2 * (M C₀ T₀ a * M C₀ T₀ b) - T₀.grouped (some T₀.selected) a x b y := by
  rw [← grouped_none C₀ T₀ a x b y]; rfl

/-- The vanishing hypothesis: the selected correlation vanishes when a slot carries `⟨0, 0⟩`. -/
def VanishesAtZero : Prop :=
  ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
    T₀.correlation (some T₀.selected) a x = 0

theorem grouped_zero_tag (hH : VanishesAtZero C₀ T₀) {J : Type} [Fintype J] (o : Spacetime)
    (b : J → T₀.Tag) (y : J → Spacetime) :
    T₀.grouped (some T₀.selected) (fun _ : Unit => ⟨0, 0⟩) (fun _ => o) b y = 0 := by
  refine hH _ _ _ ⟨Fintype.equivFin (Unit ⊕ J) (Sum.inl ()), ?_⟩
  simp

theorem sum_fin_eq_zero_term (D : ℕ) (f : ℕ → ℂ) (hf : ∀ j, j ≠ 0 → f j = 0) :
    ∑ j : Fin (D + 1), f j.val = f 0 := by
  rw [Finset.sum_eq_single (0 : Fin (D + 1))]
  · rfl
  · intro j _ hj
    exact hf _ fun h => hj (Fin.ext h)
  · simp

theorem expansion_eq (D : ℕ) {I : Type} [Fintype I] (a : I → T₀.Tag) (x : I → Spacetime)
    (o : Spacetime) (G : T₀.Tag → ℂ) :
    ∑ j : Fin (D + 1), ∑ i : (hier C₀ T₀).Channel j.val,
        (hier C₀ T₀).coefficient a j.val i x o * G ⟨j.val, (hier C₀ T₀).actor j.val i⟩ =
      (∑ j : Fin (D + 1), ∑ i : T₀.Channel j.val,
        T₀.coefficient a j.val i x o * G ⟨j.val, T₀.actor j.val i⟩) +
        hcoef C₀ T₀ a x o * G ⟨0, 0⟩ := by
  have h1 : ∀ j : ℕ, ∑ i : (hier C₀ T₀).Channel j,
        (hier C₀ T₀).coefficient a j i x o * G ⟨j, (hier C₀ T₀).actor j i⟩ =
      (∑ i : T₀.Channel j, T₀.coefficient a j i x o * G ⟨j, T₀.actor j i⟩) +
        (if j = 0 then hcoef C₀ T₀ a x o else 0) * G ⟨j, 0⟩ := by
    intro j
    show ∑ i : T₀.Channel j ⊕ Unit, _ = _
    rw [Fintype.sum_sum_type]
    simp [hier]
  simp only [h1]
  rw [Finset.sum_add_distrib]
  congr 1
  rw [sum_fin_eq_zero_term D fun j => (if j = 0 then hcoef C₀ T₀ a x o else 0) * G ⟨j, 0⟩]
  · simp
  · intro j hj
    simp [hj]

theorem old_M_expansion (D : ℕ) {I : Type} [Fintype I] (a : I → T₀.Tag) (x : I → Spacetime)
    (o : Spacetime) (Mb : ℂ) :
    (∑ j : Fin (D + 1), ∑ i : T₀.Channel j.val,
        T₀.coefficient a j.val i x o * (m C₀ T₀ ⟨j.val, T₀.actor j.val i⟩ * Mb)) +
      hcoef C₀ T₀ a x o * Mb = M C₀ T₀ a * Mb := by
  rw [sum_fin_eq_zero_term D fun j => ∑ i : T₀.Channel j,
    T₀.coefficient a j i x o * (m C₀ T₀ ⟨j, T₀.actor j i⟩ * Mb)]
  · unfold hcoef
    simp_rw [← mul_assoc, ← Finset.sum_mul]
    ring
  · intro j hj
    simp [m_pos C₀ T₀ hj]

theorem hier_ope (hO : T₀.OperatorProductExpansion) (hH : VanishesAtZero C₀ T₀) :
    (hier C₀ T₀).OperatorProductExpansion where
  coefficients {I} _ (a : I → T₀.Tag) R η ε hM hη hε j i := by
    rcases i with i | u
    · exact hO.coefficients a R η ε hM hη hε j i
    · rcases j with _ | j
      · have hold : ∀ i : T₀.Channel 0, ∀ᶠ r : ℝ in 𝓝[>] 0, ∀ x o, Hierarchy.Within r R η x o →
            ‖T₀.coefficient a 0 i x o‖ ≤ r ^ (((0 : ℕ) : ℝ) - T₀.weight a - ε / 2) :=
          fun i => hO.coefficients a R η (ε / 2) hM hη (half_pos hε) 0 i
        have hbig : ∀ᶠ r : ℝ in 𝓝[>] 0,
            (1 + Fintype.card (T₀.Channel 0) : ℝ) ≤ r ^ (-(ε / 2)) :=
          (tendsto_rpow_neg_nhdsGT_zero (by linarith)).eventually_ge_atTop _
        have hlt1 : ∀ᶠ r : ℝ in 𝓝[>] 0, r < 1 :=
          (eventually_lt_nhds zero_lt_one).filter_mono nhdsWithin_le_nhds
        filter_upwards [eventually_all.2 hold, hbig, hlt1, self_mem_nhdsWithin]
          with r hr hK hr1 hr0 x o hW
        have hr0' : (0 : ℝ) < r := hr0
        have hw : 0 ≤ T₀.weight a := Finset.sum_nonneg fun i _ => Nat.cast_nonneg _
        set B : ℝ := r ^ (-T₀.weight a - ε / 2) with hB
        have hB1 : 1 ≤ B :=
          Real.one_le_rpow_of_pos_of_le_one_of_nonpos hr0' hr1.le (by linarith)
        have hc : ∀ i : T₀.Channel 0, ‖T₀.coefficient a 0 i x o‖ ≤ B := by
          intro i
          have := hr i x o hW
          simpa [hB, sub_eq_add_neg] using this
        have h1 : ‖hcoef C₀ T₀ a x o‖ ≤ 1 + Fintype.card (T₀.Channel 0) * B := by
          unfold hcoef
          refine (norm_sub_le _ _).trans (add_le_add (norm_M_le C₀ T₀ a) ?_)
          refine (norm_sum_le _ _).trans ?_
          have : ∀ i ∈ (Finset.univ : Finset (T₀.Channel 0)),
              ‖T₀.coefficient a 0 i x o * m C₀ T₀ ⟨0, T₀.actor 0 i⟩‖ ≤ B := by
            intro i _
            rw [norm_mul]
            calc ‖T₀.coefficient a 0 i x o‖ * ‖m C₀ T₀ ⟨0, T₀.actor 0 i⟩‖
                ≤ B * 1 := mul_le_mul (hc i) (norm_m_le C₀ T₀ _) (norm_nonneg _)
                  (zero_le_one.trans hB1)
              _ = B := mul_one B
          refine (Finset.sum_le_sum this).trans ?_
          simp
        have h2 : 1 + Fintype.card (T₀.Channel 0) * B ≤ r ^ (-(ε / 2)) * B := by
          have : 1 + Fintype.card (T₀.Channel 0) * B ≤ (1 + Fintype.card (T₀.Channel 0)) * B := by
            nlinarith
          exact this.trans (mul_le_mul_of_nonneg_right hK (zero_le_one.trans hB1))
        have h3 : r ^ (-(ε / 2)) * B = r ^ (((0 : ℕ) : ℝ) - T₀.weight a - ε) := by
          rw [hB, ← Real.rpow_add hr0']
          congr 1
          simp
          ring
        show ‖(if (0 : ℕ) = 0 then hcoef C₀ T₀ a x o else 0 : ℂ)‖ ≤ _
        rw [if_pos rfl]
        exact (h1.trans h2).trans h3.le
      · filter_upwards [self_mem_nhdsWithin] with r hr x o _
        show ‖(if j + 1 = 0 then hcoef C₀ T₀ a x o else 0 : ℂ)‖ ≤ _
        rw [if_neg (Nat.succ_ne_zero j), norm_zero]
        exact Real.rpow_nonneg (le_of_lt hr) _
  remainder {I J} _ _ (a : I → T₀.Tag) (b : J → T₀.Tag) R η c ε hM hη hc hε D := by
    filter_upwards [hO.remainder a b R η c ε hM hη hc hε D, self_mem_nhdsWithin]
      with r hr hr0 x o y hW hC s
    have hE := expansion_eq C₀ T₀ D a x o
      (fun A => (hier C₀ T₀).grouped s (fun _ : Unit => A) (fun _ => o) b y)
    have hold := hr x o y hW hC (some T₀.selected)
    refine le_of_eq_of_le (congrArg (fun z => ‖(hier C₀ T₀).grouped s a x b y - z‖) hE) ?_
    rcases s with _ | s
    · simp only [grouped_none, M_unit]
      have h1 := old_M_expansion C₀ T₀ D a x o (M C₀ T₀ b)
      refine le_of_eq_of_le ?_ (Real.rpow_nonneg (le_of_lt hr0) _)
      rw [norm_eq_zero, m_zero, one_mul]
      linear_combination -h1
    · cases s
      · simp only [grouped_plus]
        rw [grouped_zero_tag C₀ T₀ hH, mul_zero, add_zero]
        exact hold
      · simp only [grouped_minus, M_unit]
        rw [grouped_zero_tag C₀ T₀ hH, m_zero]
        have h1 := old_M_expansion C₀ T₀ D a x o (M C₀ T₀ b)
        have hsplit : (∑ j : Fin (D + 1), ∑ i : T₀.Channel j.val, T₀.coefficient a j.val i x o *
              (2 * (m C₀ T₀ ⟨j.val, T₀.actor j.val i⟩ * M C₀ T₀ b) -
                T₀.grouped (some T₀.selected) (fun _ : Unit => ⟨j.val, T₀.actor j.val i⟩)
                  (fun _ => o) b y)) =
            2 * (∑ j : Fin (D + 1), ∑ i : T₀.Channel j.val, T₀.coefficient a j.val i x o *
              (m C₀ T₀ ⟨j.val, T₀.actor j.val i⟩ * M C₀ T₀ b)) -
            ∑ j : Fin (D + 1), ∑ i : T₀.Channel j.val, T₀.coefficient a j.val i x o *
                T₀.grouped (some T₀.selected) (fun _ : Unit => ⟨j.val, T₀.actor j.val i⟩)
                  (fun _ => o) b y := by
          rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
          refine Finset.sum_congr rfl fun j _ => ?_
          rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
          exact Finset.sum_congr rfl fun i _ => by ring
        rw [hsplit]
        rw [← norm_neg] at hold
        refine le_of_eq_of_le (congrArg norm ?_) hold
        linear_combination (-2 : ℂ) * h1

/-! ## The milestone: everything except the lattice clause -/

theorem hier_properties_of_converges (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion)
    (hT : T₀.TraceTest) (hH : VanishesAtZero C₀ T₀) (p : ℕ → ℕ)
    (hW : (family C₀ T₀).Converges p
      (fun v => (hier C₀ T₀).correlation none ((hier C₀ T₀).project ∘ v))) :
    (hier C₀ T₀).Properties p where
  wilson := hW
  reconstruction := hier_reconstructed C₀ T₀ hR
  ope := hier_ope C₀ T₀ hO hH
  nonfree := hier_traceTest C₀ T₀ hT


/-! ## The lattice law has total mass one -/

theorem wilsonEnergy_continuous {g : GaugeGroup} {l : ℕ+} :
    Continuous (wilsonEnergy : Configuration g l → ℝ) := by
  unfold wilsonEnergy plaquette
  fun_prop

theorem wilsonEnergy_bound {g : GaugeGroup} {l : ℕ+} (U : Configuration g l) :
    |wilsonEnergy U| ≤ 2 * Fintype.card (Site l × Directions) := by
  unfold wilsonEnergy
  refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
  have : ∀ p ∈ (Finset.univ : Finset (Site l × Directions)),
      |1 - ((plaquette U p.1 p.2.val.1 p.2.val.2).val.val.trace).re / ((g.n+1 : ℕ) : ℝ)| ≤ 2 := by
    intro p _
    set P := plaquette U p.1 p.2.val.1 p.2.val.2
    have htr : ‖P.val.val.trace‖ ≤ ((g.n+1 : ℕ) : ℝ) := by
      unfold Matrix.trace
      refine (norm_sum_le _ _).trans ?_
      refine (Finset.sum_le_sum fun i _ => entry_norm_bound_of_unitary P.val.2 i i).trans ?_
      simp
    have hre : |(P.val.val.trace).re| ≤ ((g.n+1 : ℕ) : ℝ) :=
      (Complex.abs_re_le_norm _).trans htr
    have hpos : (0 : ℝ) < ((g.n+1 : ℕ) : ℝ) := by positivity
    have : |(P.val.val.trace).re / ((g.n+1 : ℕ) : ℝ)| ≤ 1 := by
      rw [abs_div, abs_of_pos hpos]
      exact (div_le_one hpos).2 hre
    have h2 := abs_le.1 this
    rw [abs_le]
    constructor <;> linarith [h2.1, h2.2]
  refine (Finset.sum_le_sum this).trans ?_
  simp [mul_comm]

instance matrix_secondCountable (k : ℕ) :
    SecondCountableTopology (Matrix (Fin k) (Fin k) ℂ) :=
  inferInstanceAs (SecondCountableTopology (Fin k → Fin k → ℂ))

instance unitary_secondCountable (k : ℕ) : SecondCountableTopology (UnitaryRepresentation k) :=
  Topology.IsEmbedding.subtypeVal.secondCountableTopology

instance image_secondCountable (g : GaugeGroup) : SecondCountableTopology g.image :=
  Topology.IsEmbedding.subtypeVal.secondCountableTopology

instance wilsonLaw_probability (g : GaugeGroup) (l : ℕ+) (β : ℝ) (haar : Measure g.image)
    [IsProbabilityMeasure haar] : IsProbabilityMeasure (wilsonLaw g l β haar) := by
  have hint : Integrable (fun U : Configuration g l => Real.exp (-β * wilsonEnergy U))
      (Measure.pi fun _ => haar) := by
    refine Integrable.of_bound
      ((Real.continuous_exp.comp (continuous_const.mul wilsonEnergy_continuous)).aestronglyMeasurable)
      (Real.exp (|β| * (2 * Fintype.card (Site l × Directions)))) (ae_of_all _ fun U => ?_)
    rw [Real.norm_eq_abs, Real.abs_exp, Real.exp_le_exp]
    refine (le_abs_self _).trans ?_
    rw [abs_mul, abs_neg]
    exact mul_le_mul_of_nonneg_left (wilsonEnergy_bound U) (abs_nonneg _)
  have hpos : 0 < ∫ U : Configuration g l, Real.exp (-β * wilsonEnergy U)
      ∂(Measure.pi fun _ => haar) := integral_exp_pos hint
  constructor
  unfold wilsonLaw
  simp only
  rw [withDensity_apply _ MeasurableSet.univ, Measure.restrict_univ,
    ← ofReal_integral_eq_lintegral_ofReal (hint.div_const _)
      (ae_of_all _ fun U => div_nonneg (Real.exp_pos _).le hpos.le),
    integral_div, div_self hpos.ne', ENNReal.ofReal_one]

/-! ## Riemann sums over the periodic lattice -/

section Riemann

open BoxIntegral.unitPartition
open scoped Pointwise

theorem mem_smul_lattice_iff {ι : Type} [Fintype ι] {c : ℕ} [NeZero c] {v : ι → ℝ} :
    v ∈ ((c : ℝ))⁻¹ • (Submodule.span ℤ (Set.range (Pi.basisFun ℝ ι)) : Set (ι → ℝ)) ↔
      ∀ i, (c : ℝ) * v i ∈ Set.range (algebraMap ℤ ℝ) := by
  rw [← Submodule.coe_pointwise_smul, SetLike.mem_coe]
  exact mem_smul_span_iff

/-- The denominators `N + 2` as positive naturals. -/
def den (N : ℕ) : ℕ+ := ⟨N + 2, Nat.succ_pos (N + 1)⟩

/-- A point of the periodic lattice, as a point of `ι → ℝ`. -/
def latticePoint {ι : Type} (c : ℕ) {l : ℕ} (x : ι → ZMod l) : ι → ℝ :=
  fun k => (c : ℝ)⁻¹ * (ZMod.valMinAbs (x k) : ℝ)

theorem riemann_real {ι : Type} [Fintype ι] [DecidableEq ι] (G : (ι → ℝ) → ℝ) (hG : Continuous G) (P : ℕ+)
    (hsupp : ∀ z, G z ≠ 0 → ∀ k, |z k| < (P : ℕ) / (2 : ℝ)) :
    Tendsto (fun N : ℕ => (∑ x : ι → ZMod ((P * den N : ℕ+) : ℕ), G (latticePoint (N + 2) x)) /
      ((N + 2 : ℕ) : ℝ) ^ Fintype.card ι) atTop (𝓝 (∫ z, G z)) := by
  set s : Set (ι → ℝ) := Metric.closedBall 0 ((P : ℕ) / (2 : ℝ)) with hs
  have hP : (0 : ℝ) < (P : ℕ) / (2 : ℝ) := by
    have : (0 : ℝ) < (P : ℕ) := Nat.cast_pos.2 P.pos
    positivity
  have hfr : volume (frontier s) = 0 := by
    rw [hs, frontier_closedBall _ hP.ne']
    exact Measure.addHaar_sphere_of_ne_zero volume 0 hP.ne'
  have base := (tendsto_tsum_div_pow_atTop_integral s G hG Metric.isBounded_closedBall
    measurableSet_closedBall hfr).comp (tendsto_add_atTop_nat 2)
  have hint : ∫ x in s, G x = ∫ x, G x := by
    refine setIntegral_eq_integral_of_forall_compl_eq_zero fun z hz => ?_
    by_contra h
    refine hz ?_
    rw [hs, mem_closedBall_zero_iff, pi_norm_le_iff_of_nonneg hP.le]
    exact fun k => (hsupp z h k).le
  rw [hint] at base
  refine base.congr fun N => ?_
  show (∑' x : ↑(s ∩ (((N + 2 : ℕ) : ℝ))⁻¹ • (Submodule.span ℤ (Set.range (Pi.basisFun ℝ ι)) :
      Set (ι → ℝ))), G x) / ((N + 2 : ℕ) : ℝ) ^ Fintype.card ι = _
  congr 1
  haveI : NeZero (N + 2) := ⟨by omega⟩
  have hc : (0 : ℝ) < ((N + 2 : ℕ) : ℝ) := Nat.cast_pos.2 (by omega)
  have hl : (((P * den N : ℕ+) : ℕ) : ℝ) = (P : ℕ) * ((N + 2 : ℕ) : ℝ) := by
    simp [den]
  have hmem : ∀ x : ι → ZMod ((P * den N : ℕ+) : ℕ), latticePoint (N + 2) x ∈
      s ∩ (((N + 2 : ℕ) : ℝ))⁻¹ • (Submodule.span ℤ (Set.range (Pi.basisFun ℝ ι)) :
        Set (ι → ℝ)) := by
    intro x
    constructor
    · rw [hs, mem_closedBall_zero_iff, pi_norm_le_iff_of_nonneg hP.le]
      intro k
      have h := ZMod.valMinAbs_mem_Ioc (x k)
      have h1 : ((ZMod.valMinAbs (x k) : ℤ) : ℝ) * 2 ≤ (((P * den N : ℕ+) : ℕ) : ℝ) := by
        exact_mod_cast h.2
      have h2 : -(((P * den N : ℕ+) : ℕ) : ℝ) < ((ZMod.valMinAbs (x k) : ℤ) : ℝ) * 2 := by
        exact_mod_cast h.1
      rw [hl] at h1 h2
      simp only [latticePoint, Real.norm_eq_abs, abs_mul, abs_inv, abs_of_pos hc]
      rw [inv_mul_le_iff₀ hc, abs_le]
      constructor <;> nlinarith
    · refine mem_smul_lattice_iff.mpr fun k => ⟨ZMod.valMinAbs (x k), ?_⟩
      simp only [latticePoint, eq_intCast]
      rw [← mul_assoc, mul_inv_cancel₀ hc.ne', one_mul]
  have hinj : Injective fun x : ι → ZMod ((P * den N : ℕ+) : ℕ) =>
      (⟨latticePoint (N + 2) x, hmem x⟩ : ↑(s ∩ (((N + 2 : ℕ) : ℝ))⁻¹ •
        (Submodule.span ℤ (Set.range (Pi.basisFun ℝ ι)) : Set (ι → ℝ)))) := by
    intro x y hxy
    have h := congrArg Subtype.val hxy
    funext k
    have hk := congrFun h k
    simp only [latticePoint] at hk
    have := mul_left_cancel₀ (inv_ne_zero hc.ne') hk
    exact ZMod.valMinAbs_inj.1 (Int.cast_injective this)
  have hrange : Function.support (fun b : ↑(s ∩ (((N + 2 : ℕ) : ℝ))⁻¹ •
        (Submodule.span ℤ (Set.range (Pi.basisFun ℝ ι)) : Set (ι → ℝ))) => G b) ⊆
      Set.range fun x : ι → ZMod ((P * den N : ℕ+) : ℕ) =>
      (⟨latticePoint (N + 2) x, hmem x⟩ : ↑(s ∩ (((N + 2 : ℕ) : ℝ))⁻¹ •
        (Submodule.span ℤ (Set.range (Pi.basisFun ℝ ι)) : Set (ι → ℝ)))) := by
    intro b hb
    have hb' : G b ≠ 0 := hb
    have hlt := hsupp _ hb'
    have hb2 := mem_smul_lattice_iff.mp b.2.2
    choose a ha using hb2
    refine ⟨fun k => ((a k : ℤ) : ZMod ((P * den N : ℕ+) : ℕ)), Subtype.ext ?_⟩
    funext k
    have hak : ((a k : ℤ) : ℝ) = ((N + 2 : ℕ) : ℝ) * (b : ι → ℝ) k := by
      simpa using ha k
    have habs := abs_lt.1 (hlt k)
    have hval : ZMod.valMinAbs ((a k : ℤ) : ZMod ((P * den N : ℕ+) : ℕ)) = a k := by
      rw [ZMod.valMinAbs_spec]
      refine ⟨rfl, ?_, ?_⟩
      · have : -(((P * den N : ℕ+) : ℕ) : ℝ) < ((a k : ℤ) : ℝ) * 2 := by
          rw [hl, hak]; nlinarith
        exact_mod_cast this
      · have : ((a k : ℤ) : ℝ) * 2 ≤ (((P * den N : ℕ+) : ℕ) : ℝ) := by
          rw [hl, hak]; nlinarith
        exact_mod_cast this
    show ((N + 2 : ℕ) : ℝ)⁻¹ * ((ZMod.valMinAbs ((a k : ℤ) : ZMod ((P * den N : ℕ+) : ℕ)) : ℤ) : ℝ) =
      (b : ι → ℝ) k
    rw [hval, hak, ← mul_assoc, inv_mul_cancel₀ hc.ne', one_mul]
  rw [← hinj.tsum_eq hrange, tsum_fintype]

end Riemann

/-! ## Riemann sums on `Points n` -/

/-- Coordinates on `Points n`. -/
def unflat (n : ℕ) (z : (Σ _ : Fin n, Fin 4) → ℝ) : Points n :=
  WithLp.toLp 2 fun i => WithLp.toLp 2 fun a => z ⟨i, a⟩

theorem unflat_eq (n : ℕ) : unflat n =
    (LinearIsometryEquiv.piLpCurry ℝ 2 (fun (_ : Fin n) (_ : Fin 4) => ℝ)) ∘
      (WithLp.toLp 2 : ((Σ _ : Fin n, Fin 4) → ℝ) → EuclideanSpace ℝ (Σ _ : Fin n, Fin 4)) := rfl

theorem unflat_continuous (n : ℕ) : Continuous (unflat n) := by
  rw [unflat_eq]
  exact (LinearIsometryEquiv.continuous _).comp (PiLp.continuous_toLp 2 _)

theorem integral_unflat (n : ℕ) (t : Points n → ℂ) : ∫ z, t (unflat n z) = ∫ x, t x := by
  have h1 := (LinearIsometryEquiv.piLpCurry ℝ 2
    (fun (_ : Fin n) (_ : Fin 4) => ℝ)).measurePreserving
  have h2 := PiLp.volume_preserving_toLp (Σ _ : Fin n, Fin 4)
  have e1 := (LinearIsometryEquiv.piLpCurry ℝ 2
    (fun (_ : Fin n) (_ : Fin 4) => ℝ)).toHomeomorph.measurableEmbedding
  have e2 := (MeasurableEquiv.toLp 2 ((Σ _ : Fin n, Fin 4) → ℝ)).measurableEmbedding
  exact MeasurePreserving.integral_comp (h1.comp h2) (e1.comp e2) t

theorem riemann_points {n : ℕ} (t : Points n → ℂ) (ht : Continuous t) (P : ℕ+)
    (hs : ∀ x, t x ≠ 0 → ∀ i a, |x i a| < (P : ℕ) / (2 : ℝ)) :
    Tendsto (fun N : ℕ => (((((N + 2 : ℕ) : ℝ))⁻¹ : ℝ) : ℂ) ^ (4 * n) *
      ∑ x : Fin n → Site (P * den N),
        t (WithLp.toLp 2 fun i => WithLp.toLp 2 fun a =>
          ((N + 2 : ℕ) : ℝ)⁻¹ * (ZMod.valMinAbs (x i a) : ℝ))) atTop (𝓝 (∫ x, t x)) := by
  set F : ((Σ _ : Fin n, Fin 4) → ℝ) → ℂ := fun z => t (unflat n z) with hFdef
  have hF : Continuous F := ht.comp (unflat_continuous n)
  have hP : (0 : ℝ) < (P : ℕ) / (2 : ℝ) := by
    have : (0 : ℝ) < (P : ℕ) := Nat.cast_pos.2 P.pos
    positivity
  have hFs : ∀ z, F z ≠ 0 → ∀ k, |z k| < (P : ℕ) / (2 : ℝ) := fun z hz k => hs _ hz k.1 k.2
  have hre := riemann_real (fun z => (F z).re) (Complex.continuous_re.comp hF) P
    (fun z hz => hFs z fun h => hz (by simp [h]))
  have him := riemann_real (fun z => (F z).im) (Complex.continuous_im.comp hF) P
    (fun z hz => hFs z fun h => hz (by simp [h]))
  have hInt : Integrable F := by
    refine hF.integrable_of_hasCompactSupport
      (HasCompactSupport.intro (isCompact_closedBall 0 ((P : ℕ) / (2 : ℝ))) fun z hz => ?_)
    by_contra h
    refine hz ?_
    rw [mem_closedBall_zero_iff, pi_norm_le_iff_of_nonneg hP.le]
    exact fun k => (hFs z h k).le
  have lim := ((Complex.continuous_ofReal.tendsto _).comp hre).add
    (((Complex.continuous_ofReal.tendsto _).comp him).mul_const Complex.I)
  rw [← integral_unflat n t]
  have hlimit : ((∫ z, (F z).re : ℝ) : ℂ) + ((∫ z, (F z).im : ℝ) : ℂ) * Complex.I = ∫ z, F z :=
    integral_re_add_im hInt
  rw [hlimit] at lim
  refine lim.congr fun N => ?_
  have hreindex : (∑ x : Fin n → Site (P * den N),
        t (WithLp.toLp 2 fun i => WithLp.toLp 2 fun a =>
          ((N + 2 : ℕ) : ℝ)⁻¹ * (ZMod.valMinAbs (x i a) : ℝ))) =
      ∑ x : (Σ _ : Fin n, Fin 4) → ZMod ((P * den N : ℕ+) : ℕ), F (latticePoint (N + 2) x) :=
    (Fintype.sum_equiv (Equiv.piCurry fun (_ : Fin n) (_ : Fin 4) => ZMod ((P * den N : ℕ+) : ℕ))
      _ _ fun x => rfl).symm
  have hsum : (∑ x : (Σ _ : Fin n, Fin 4) → ZMod ((P * den N : ℕ+) : ℕ),
        F (latticePoint (N + 2) x)) =
      ((∑ x : (Σ _ : Fin n, Fin 4) → ZMod ((P * den N : ℕ+) : ℕ),
        (F (latticePoint (N + 2) x)).re : ℝ) : ℂ) +
      ((∑ x : (Σ _ : Fin n, Fin 4) → ZMod ((P * den N : ℕ+) : ℕ),
        (F (latticePoint (N + 2) x)).im : ℝ) : ℂ) * Complex.I := by
    push_cast
    rw [Finset.sum_mul, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun x _ => (Complex.re_add_im _).symm
  have hcard : Fintype.card (Σ _ : Fin n, Fin 4) = 4 * n := by
    simp [mul_comm]
  have key : ∀ (c A B : ℝ) (S : ℂ), S = (A : ℂ) + (B : ℂ) * Complex.I →
      ((A / c ^ (4 * n) : ℝ) : ℂ) + ((B / c ^ (4 * n) : ℝ) : ℂ) * Complex.I =
        ((c⁻¹ : ℝ) : ℂ) ^ (4 * n) * S := by
    intro c A B S hS
    subst hS
    push_cast
    rw [inv_pow]
    ring
  rw [hreindex]
  simp only [Function.comp_apply, hcard]
  exact key _ _ _ _ hsum

/-! ## The lattice clause -/

section Lattice

variable {g : GaugeGroup} (C₀ : WilsonFamily g) (T₀ : Hierarchy C₀)

theorem family_finiteMoment (N p : ℕ) {n : ℕ} (v : Fin n → (family C₀ T₀).Token)
    (x : Fin n → Site ((family C₀ T₀).period p * (family C₀ T₀).denominator N)) :
    (family C₀ T₀).finiteMoment N p v x = M C₀ T₀ v := by
  haveI : IsProbabilityMeasure (family C₀ T₀).haar := C₀.probability
  show ∫ _U, M C₀ T₀ v ∂wilsonLaw g _ _ (family C₀ T₀).haar = _
  simp

theorem family_suitable_eventually (order : ℕ → ℕ) (hord : StrictMono order) {n : ℕ}
    (t : WilsonFamily.SeparatedTest n) :
    ∀ᶠ k : ℕ in atTop, (family C₀ T₀).suitable (order k) t := by
  obtain ⟨R, hR⟩ := isBounded_iff_forall_norm_le.1 t.hasCompactSupport.isBounded
  filter_upwards [eventually_gt_atTop ⌈2 * R⌉₊] with k hk x hx i a
  have h1 : |x i a| ≤ R :=
    ((PiLp.norm_apply_le (x i) a).trans (PiLp.norm_apply_le x i)).trans (hR x hx)
  have h2 : 2 * R < (((family C₀ T₀).period (order k)).val : ℝ) := by
    have hk' : (⌈2 * R⌉₊ : ℝ) < (k : ℝ) := Nat.cast_lt.2 hk
    have hk'' : (k : ℝ) ≤ (order k : ℝ) := Nat.cast_le.2 hord.le_apply
    have hper : (((family C₀ T₀).period (order k)).val : ℝ) = (order k : ℝ) + 1 := by
      simp [family]
    rw [hper]
    linarith [Nat.le_ceil (2 * R)]
  have h3 := abs_le.1 h1
  constructor <;> linarith [h3.1, h3.2]

theorem family_converges (order : ℕ → ℕ) (hord : StrictMono order) :
    (family C₀ T₀).Converges order
      (fun v => (hier C₀ T₀).correlation none ((hier C₀ T₀).project ∘ v)) := by
  intro n v t
  refine ⟨family_suitable_eventually C₀ T₀ order hord t,
    fun _ => (∫ x, t x) * M C₀ T₀ v, fun p hp => ?_, ?_⟩
  · have hsupp : ∀ x, t x ≠ 0 → ∀ i a,
        |x i a| < (((family C₀ T₀).period p : ℕ+) : ℕ) / (2 : ℝ) := by
      intro x hx i a
      have := hp (subset_tsupport _ hx) i a
      exact abs_lt.2 this
    have h := (riemann_points (fun x => t x) t.continuous ((family C₀ T₀).period p) hsupp).mul_const
      (M C₀ T₀ v)
    refine h.congr fun N => ?_
    unfold WilsonFamily.smear
    simp only [family_finiteMoment]
    rw [← Finset.sum_mul, mul_assoc]
    rfl
  · show Tendsto (fun _ : ℕ => (∫ x, t x) * M C₀ T₀ v) atTop (𝓝 (∫ x, t x * M C₀ T₀ v))
    rw [integral_mul_const]
    exact tendsto_const_nhds

/-! ## Main results -/

theorem hier_properties (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion)
    (hT : T₀.TraceTest) (hH : VanishesAtZero C₀ T₀) (p : ℕ → ℕ) (hp : StrictMono p) :
    (hier C₀ T₀).Properties p :=
  hier_properties_of_converges C₀ T₀ hR hO hT hH p (family_converges C₀ T₀ p hp)

end Lattice

end YangMills.Adequacy

namespace YangMills

/-- A hypothesis that is a special case of multilinearity of the selected correlation in the
field components (homogeneity in one grade-zero slot) implies the vanishing hypothesis used
below. -/
theorem Adequacy.vanishes_of_homogeneous {g : GaugeGroup} (C₀ : WilsonFamily g)
    (T₀ : Hierarchy C₀)
    (hom : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n) (k : Fin n) (c : ℂ) (u : T₀.Field 0),
      T₀.correlation (some T₀.selected) (Function.update a k ⟨0, c • u⟩) x =
        c * T₀.correlation (some T₀.selected) (Function.update a k ⟨0, u⟩) x) :
    ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0 := by
  rintro n a x ⟨k, hk⟩
  have h := hom n a x k 0 0
  rw [zero_smul, zero_mul, ← hk, Function.update_eq_self] at h
  exact h

/-- **Constant-insertion witness.** Given hierarchy data satisfying the three non-lattice
properties and whose selected correlation vanishes whenever a slot carries the zero field of
grade zero, there is a Wilson family with `WilsonRegularity` whose insertions do not depend on
the gauge configuration, and one hierarchy over it with all `Properties` along every strictly
increasing volume sequence. -/
theorem constant_insertion_witness {g : GaugeGroup} (C₀ : WilsonFamily g) (T₀ : Hierarchy C₀)
    (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion) (hT : T₀.TraceTest)
    (hH : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0) :
    ∃ C : WilsonFamily g, WilsonRegularity C ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V) ∧
      ∃ T : Hierarchy C, ∀ p : ℕ → ℕ, StrictMono p → T.Properties p :=
  ⟨Adequacy.family C₀ T₀, Adequacy.family_regular C₀ T₀, Adequacy.family_insertion_const C₀ T₀,
    Adequacy.hier C₀ T₀, fun p hp => Adequacy.hier_properties C₀ T₀ hR hO hT hH p hp⟩

/-- The body of `JointExistence` at the group `g`, with `q = id`, for a family with constant
insertions. -/
theorem jointExistence_body_constant_insertions {g : GaugeGroup} (C₀ : WilsonFamily g)
    (T₀ : Hierarchy C₀)
    (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion) (hT : T₀.TraceTest)
    (hH : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0) :
    ∃ C : WilsonFamily g,
      (WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
        ∃ T : Hierarchy C, T.Properties (p ∘ q)) ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V) := by
  obtain ⟨C, hreg, hconst, T, hprop⟩ := constant_insertion_witness C₀ T₀ hR hO hT hH
  exact ⟨C, ⟨hreg, fun p hp => ⟨id, strictMono_id, T, hprop p hp⟩⟩, hconst⟩

end YangMills

#print axioms YangMills.constant_insertion_witness
#print axioms YangMills.jointExistence_body_constant_insertions
#print axioms YangMills.Adequacy.vanishes_of_homogeneous
