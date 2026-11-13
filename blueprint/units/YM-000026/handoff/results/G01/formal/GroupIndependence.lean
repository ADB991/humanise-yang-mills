import Adequacy

/-!
# The public specification does not distinguish gauge groups

Formalisation of finding M3 of the G01 review. This file imports only `Adequacy`, which imports
only the public specification (`ChallengeSpec`, `PublicWilson`, `PublicTheory`, Mathlib).

Given a hierarchy `T₀` over a Wilson family of a gauge group `g₀` with the three non-lattice
properties, the vanishing hypothesis of `YangMills.constant_insertion_witness`, and homogeneity
of degree two of the selected two-point correlation of the grade-four trace field under one
explicit real scalar, the body of `YangMills.JointExistence` holds at every gauge group `g`
whose Lie algebra has positive dimension, with constant insertions.

Steps: `rehome` copies the data of `T₀` to an arbitrary family over an arbitrary group, with a
new `project` and a new `centeredTrace`; `rehome_reconstructed`, `rehome_ope`,
`rehome_traceTest` transfer the three properties; `haarFamily` supplies a family over `g` (this
needs a Haar probability measure on the compact group `g.image`); then
`YangMills.constant_insertion_witness` is applied.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.GroupIndependence
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical NNReal ContDiff ENNReal

/-! ## Scaling of Wick profiles -/

/-- Multiplying every coefficient of a list of terms by `k` multiplies the profile by `k`.
Coefficients are arbitrary complex numbers, so no sign condition is involved. -/
theorem wickProfile_scale (k : ℂ) (terms : List (ℂ × Hierarchy.Track)) (r : ℝ) :
    Hierarchy.wickProfile (terms.map fun ct => (k * ct.1, ct.2)) r =
      k * Hierarchy.wickProfile terms r := by
  unfold Hierarchy.wickProfile
  rw [List.map_map, ← List.sum_map_mul_left]
  refine congrArg List.sum (List.map_congr_left ?_)
  rintro ⟨c, t⟩ _
  simp only [Function.comp_apply]
  ring

/-! ## Copying a hierarchy to another family, possibly over another group -/

variable {g₀ g : GaugeGroup} {C₀ : WilsonFamily g₀}

/-- All data of `T₀` except `project` and `centeredTrace`, over an arbitrary family `C` of an
arbitrary gauge group. The only field of `Hierarchy C` whose type mentions `C` is `project`. -/
def rehome (T₀ : Hierarchy C₀) (C : WilsonFamily g) (proj : C.Token → T₀.Tag)
    (θ : T₀.Field 4) : Hierarchy C where
  H := T₀.H
  labels := T₀.labels
  theory := T₀.theory
  Field := T₀.Field
  toLabel := T₀.toLabel
  project := proj
  Character := T₀.Character
  phaseMeasure := T₀.phaseMeasure
  selected := T₀.selected
  correlation := T₀.correlation
  continuation := T₀.continuation
  Channel := T₀.Channel
  actor := T₀.actor
  coefficient := T₀.coefficient
  centeredTrace := θ

variable (T₀ : Hierarchy C₀) (C : WilsonFamily g) (proj : C.Token → T₀.Tag)

/-- `Reconstructed` mentions neither the group nor `centeredTrace`; the family enters only
through surjectivity of `project`. -/
theorem rehome_reconstructed (θ : T₀.Field 4) (hproj : Surjective proj)
    (hR : T₀.Reconstructed) : (rehome T₀ C proj θ).Reconstructed where
  axioms := hR.axioms
  faithful := hR.faithful
  injective := hR.injective
  acts := hR.acts
  covers := hR.covers
  represents := hproj
  normalized := hR.normalized
  fullSupport := hR.fullSupport
  permutation := hR.permutation
  smooth := hR.smooth
  characterContinuity := hR.characterContinuity
  mixture := hR.mixture
  analytic := hR.analytic
  root := hR.root
  boundary := hR.boundary

/-- `OperatorProductExpansion` mentions neither the group, nor the family, nor
`centeredTrace`. -/
theorem rehome_ope (θ : T₀.Field 4) (hO : T₀.OperatorProductExpansion) :
    (rehome T₀ C proj θ).OperatorProductExpansion where
  coefficients := hO.coefficients
  remainder := hO.remainder

/-- The two-point function of the copied hierarchy, unfolded. -/
theorem rehome_traceTwo (θ : T₀.Field 4) (r : ℝ) :
    (rehome T₀ C proj θ).traceTwo r =
      T₀.correlation (some T₀.selected) (fun _ : Fin 2 => ⟨4, θ⟩) (Hierarchy.timePair r) :=
  rfl

/-! ## Rescaling the grade-four trace field -/

section Rescale
variable (lam : ℝ)

/-- The homogeneity hypothesis: for small `r > 0`, the selected two-point correlation of the
rescaled trace field at the pair of points `timePair r` is `lam ^ 2` times the original one.
It is implied by multilinearity of the selected correlation in the field components. -/
def HomogeneousTrace : Prop :=
  ∀ᶠ r : ℝ in 𝓝[>] 0,
    T₀.correlation (some T₀.selected)
        (fun _ : Fin 2 => ⟨4, (lam : ℂ) • T₀.centeredTrace⟩) (Hierarchy.timePair r) =
      (lam : ℂ) ^ 2 * T₀.traceTwo r

/-- `centered` for the rescaled field: no hypothesis on the correlation is needed, since
`toLabel 4` and the operator-valued field are linear in the label. -/
theorem rescale_centered (hT : T₀.TraceTest) (f : YangMills.TestFunction) :
    inner ℂ (rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).theory.fields.vacuum.1
      ((rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).theory.fields.field
        ((rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).toLabel 4
          (rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).centeredTrace) f
        (rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).theory.fields.vacuum).1 = 0 := by
  show inner ℂ T₀.theory.fields.vacuum.1
      (T₀.theory.fields.field (T₀.toLabel 4 ((lam : ℂ) • T₀.centeredTrace)) f
        T₀.theory.fields.vacuum).1 = 0
  rw [map_smul, map_smul, LinearMap.smul_apply, LinearMap.smul_apply, Submodule.coe_smul,
    inner_smul_right, hT.centered f, mul_zero]

/-- Rescaling lemma, limit form: the short-distance limit is multiplied by `lam ^ 2`. -/
theorem rescale_shortDistance (hT : T₀.TraceTest) (hom : HomogeneousTrace T₀ lam) :
    Tendsto (fun r : ℝ => (r^8 * (Real.log r⁻¹)^2) •
        (rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).traceTwo r) (𝓝[>] 0)
      (𝓝 ((lam ^ 2 * (3 * (Module.finrank ℝ g₀.lieAlgebra : ℝ) / Real.pi^4) : ℝ) : ℂ)) := by
  have h := hT.shortDistance.const_mul ((lam : ℂ) ^ 2)
  have hlim : ((lam ^ 2 * (3 * (Module.finrank ℝ g₀.lieAlgebra : ℝ) / Real.pi^4) : ℝ) : ℂ) =
      (lam : ℂ) ^ 2 * ((3 * (Module.finrank ℝ g₀.lieAlgebra : ℝ) / Real.pi^4 : ℝ) : ℂ) := by
    push_cast; ring
  rw [hlim]
  refine h.congr' ?_
  filter_upwards [hom] with r hr
  rw [rehome_traceTwo, hr, Complex.real_smul, Complex.real_smul]
  ring

/-- Rescaling lemma, exclusion form: a Wick profile for the rescaled two-point function gives
one for the original, with every coefficient divided by `lam ^ 2`. -/
theorem rescale_excludes (hT : T₀.TraceTest) (hlam : lam ≠ 0)
    (hom : HomogeneousTrace T₀ lam) (terms : List (ℂ × Hierarchy.Track)) :
    ¬ (rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).traceTwo =ᶠ[𝓝[>] 0]
      Hierarchy.wickProfile terms := by
  intro h
  refine hT.excludes (terms.map fun ct => (((lam : ℂ) ^ 2)⁻¹ * ct.1, ct.2)) ?_
  filter_upwards [h, hom] with r hr hr'
  have hl : ((lam : ℂ) ^ 2) ≠ 0 := pow_ne_zero 2 (Complex.ofReal_ne_zero.2 hlam)
  rw [wickProfile_scale, ← hr, rehome_traceTwo, hr', ← mul_assoc, inv_mul_cancel₀ hl, one_mul]

/-- Rescaling lemma, bundled: if `lam ^ 2 * dim g₀ = dim g > 0`, the copy of `T₀` over any
family of `g`, with the trace field multiplied by `lam`, satisfies the trace test of `g`. -/
theorem rehome_traceTest (hT : T₀.TraceTest) (hlam : 0 < lam)
    (hdim : lam ^ 2 * (Module.finrank ℝ g₀.lieAlgebra : ℝ) = (Module.finrank ℝ g.lieAlgebra : ℝ))
    (hg : 0 < Module.finrank ℝ g.lieAlgebra) (hom : HomogeneousTrace T₀ lam) :
    (rehome T₀ C proj ((lam : ℂ) • T₀.centeredTrace)).TraceTest where
  centered := rescale_centered T₀ C proj lam hT
  amplitudePositive := by
    have : (0 : ℝ) < (Module.finrank ℝ g.lieAlgebra : ℝ) := Nat.cast_pos.2 hg
    positivity
  shortDistance := by
    have h := rescale_shortDistance T₀ C proj lam hT hom
    have e : (lam ^ 2 * (3 * (Module.finrank ℝ g₀.lieAlgebra : ℝ) / Real.pi^4) : ℝ) =
        3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi^4 := by
      rw [← hdim]; ring
    rw [e] at h
    exact h
  excludes := rescale_excludes T₀ C proj lam hT hlam.ne' hom

end Rescale

/-! ## A Wilson family over an arbitrary gauge group -/

/-- The unitary group is compact (closed in the matrices, with entries of norm at most one). -/
instance unitary_compact (k : ℕ) : CompactSpace (UnitaryRepresentation k) := by
  have hK : IsCompact {M : Matrix (Fin (k + 1)) (Fin (k + 1)) ℂ |
      ∀ i, M i ∈ {v : Fin (k + 1) → ℂ | ∀ j, v j ∈ Metric.closedBall (0 : ℂ) 1}} :=
    isCompact_pi_infinite fun _ => isCompact_pi_infinite fun _ => isCompact_closedBall _ _
  have hU : IsCompact
      ((Matrix.unitaryGroup (Fin (k + 1)) ℂ : Submonoid (Matrix (Fin (k + 1)) (Fin (k + 1)) ℂ)) :
        Set (Matrix (Fin (k + 1)) (Fin (k + 1)) ℂ)) := by
    refine hK.of_isClosed_subset isClosed_unitary fun M hM i j => ?_
    simpa using entry_norm_bound_of_unitary hM i j
  exact isCompact_iff_compactSpace.1 hU

/-- The image of a gauge group is compact, being closed in the unitary group. -/
instance image_compact (g : GaugeGroup) : CompactSpace g.image :=
  isCompact_iff_compactSpace.1 g.imageClosed.isCompact

/-- The Haar probability measure on the compact group `g.image`. -/
def haarProb (g : GaugeGroup) : Measure g.image :=
  Measure.haarMeasure (⊤ : PositiveCompacts g.image)

theorem haarProb_probability (g : GaugeGroup) : IsProbabilityMeasure (haarProb g) :=
  ⟨by
    have h := Measure.haarMeasure_self (K₀ := (⊤ : PositiveCompacts g.image))
    simpa [haarProb] using h⟩

/-- A Wilson family over `g` with a prescribed token type. Its lattice data are irrelevant:
`YangMills.constant_insertion_witness` reads only `haar` and the token type of its input. -/
def haarFamily (g : GaugeGroup) (Token : Type) : WilsonFamily g where
  period p := ⟨p + 1, Nat.succ_pos p⟩
  denominator N := ⟨N + 2, Nat.succ_pos (N + 1)⟩
  periodStrict := fun _ _ h => Nat.succ_lt_succ h
  denominatorStrict := fun _ _ h => Nat.add_lt_add_right h 2
  beta _ _ := 0
  haar := haarProb g
  probability := haarProb_probability g
  invariantHaar := by unfold haarProb; infer_instance
  Token := Token
  insertion _ _ _ _ _ := 0

/-! ## Dimensions -/

/-- The scalar of M3: `sqrt (dim g / dim g₀)`. -/
abbrev scale (g₀ g : GaugeGroup) : ℝ :=
  Real.sqrt ((Module.finrank ℝ g.lieAlgebra : ℝ) / (Module.finrank ℝ g₀.lieAlgebra : ℝ))

/-- A simple gauge group, in the sense of the public definition, has a Lie algebra of positive
dimension: `IsSimple` contains two elements with non-zero commutator. -/
theorem finrank_pos_of_isSimple (g : GaugeGroup) (hg : g.IsSimple) :
    0 < Module.finrank ℝ g.lieAlgebra := by
  obtain ⟨⟨X, hX, Y, _, hXY⟩, _⟩ := hg
  refine Nat.pos_of_ne_zero fun h0 => hXY ?_
  have hbot : g.lieAlgebra = ⊥ := Submodule.finrank_eq_zero.1 h0
  have hX0 : X = 0 := by
    rw [hbot] at hX
    exact (Submodule.mem_bot ℝ).1 hX
  simp [hX0]

/-- The trace test of `g₀` forces `dim g₀ > 0` (clause `amplitudePositive`). -/
theorem finrank_pos_of_traceTest (T₀ : Hierarchy C₀) (hT : T₀.TraceTest) :
    (0 : ℝ) < (Module.finrank ℝ g₀.lieAlgebra : ℝ) := by
  have h := hT.amplitudePositive
  have hpi : (0 : ℝ) < Real.pi ^ 4 := by positivity
  have h3 : (0 : ℝ) < 3 * (Module.finrank ℝ g₀.lieAlgebra : ℝ) := by
    by_contra hn
    exact absurd h (not_lt.2 (div_nonpos_of_nonpos_of_nonneg (not_lt.1 hn) hpi.le))
  linarith

end YangMills.GroupIndependence

namespace YangMills
open Function Filter
open scoped Topology
open GroupIndependence

/-- **Transfer between gauge groups, over the public specification only.** A hierarchy over a
family of `g₀` with the three non-lattice properties, the vanishing hypothesis of
`constant_insertion_witness`, and homogeneity of the selected two-point function of the trace
field under the scalar `sqrt (dim g / dim g₀)`, yields for every gauge group `g` of positive
dimension a family over `g` with constant insertions and a hierarchy with all four properties
along every strictly increasing volume sequence. -/
theorem group_transfer_witness {g₀ g : GaugeGroup} (C₀ : WilsonFamily g₀) (T₀ : Hierarchy C₀)
    (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion) (hT : T₀.TraceTest)
    (hH : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0)
    (hom : ∀ᶠ r : ℝ in 𝓝[>] 0,
      T₀.correlation (some T₀.selected)
          (fun _ : Fin 2 => ⟨4, ((Real.sqrt ((Module.finrank ℝ g.lieAlgebra : ℝ) /
            (Module.finrank ℝ g₀.lieAlgebra : ℝ)) : ℝ) : ℂ) • T₀.centeredTrace⟩)
          (Hierarchy.timePair r) =
        ((Real.sqrt ((Module.finrank ℝ g.lieAlgebra : ℝ) /
          (Module.finrank ℝ g₀.lieAlgebra : ℝ)) : ℝ) : ℂ) ^ 2 * T₀.traceTwo r)
    (hg : 0 < Module.finrank ℝ g.lieAlgebra) :
    ∃ C : WilsonFamily g, WilsonRegularity C ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V) ∧
      ∃ T : Hierarchy C, ∀ p : ℕ → ℕ, StrictMono p → T.Properties p := by
  have hd₀ : (0 : ℝ) < (Module.finrank ℝ g₀.lieAlgebra : ℝ) := finrank_pos_of_traceTest T₀ hT
  have hd : (0 : ℝ) < (Module.finrank ℝ g.lieAlgebra : ℝ) := Nat.cast_pos.2 hg
  have hlam : 0 < scale g₀ g := Real.sqrt_pos.2 (div_pos hd hd₀)
  have hdim : scale g₀ g ^ 2 * (Module.finrank ℝ g₀.lieAlgebra : ℝ) =
      (Module.finrank ℝ g.lieAlgebra : ℝ) := by
    rw [Real.sq_sqrt (div_pos hd hd₀).le]
    field_simp
  exact constant_insertion_witness (haarFamily g T₀.Tag)
    (rehome T₀ (haarFamily g T₀.Tag) id (((scale g₀ g : ℝ) : ℂ) • T₀.centeredTrace))
    (rehome_reconstructed T₀ (haarFamily g T₀.Tag) id _ surjective_id hR)
    (rehome_ope T₀ (haarFamily g T₀.Tag) id _ hO)
    (rehome_traceTest T₀ (haarFamily g T₀.Tag) id (scale g₀ g) hT hlam hdim hg hom)
    hH

/-- The same in the form of the body of `JointExistence` at `g`, with `q = id`. -/
theorem group_transfer_jointExistence_body {g₀ g : GaugeGroup} (C₀ : WilsonFamily g₀)
    (T₀ : Hierarchy C₀)
    (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion) (hT : T₀.TraceTest)
    (hH : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0)
    (hom : ∀ᶠ r : ℝ in 𝓝[>] 0,
      T₀.correlation (some T₀.selected)
          (fun _ : Fin 2 => ⟨4, ((Real.sqrt ((Module.finrank ℝ g.lieAlgebra : ℝ) /
            (Module.finrank ℝ g₀.lieAlgebra : ℝ)) : ℝ) : ℂ) • T₀.centeredTrace⟩)
          (Hierarchy.timePair r) =
        ((Real.sqrt ((Module.finrank ℝ g.lieAlgebra : ℝ) /
          (Module.finrank ℝ g₀.lieAlgebra : ℝ)) : ℝ) : ℂ) ^ 2 * T₀.traceTwo r)
    (hg : 0 < Module.finrank ℝ g.lieAlgebra) :
    ∃ C : WilsonFamily g,
      (WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
        ∃ T : Hierarchy C, T.Properties (p ∘ q)) ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V) := by
  obtain ⟨C, hreg, hconst, T, hprop⟩ := group_transfer_witness C₀ T₀ hR hO hT hH hom hg
  exact ⟨C, ⟨hreg, fun p hp => ⟨id, strictMono_id, T, hprop p hp⟩⟩, hconst⟩

/-- Homogeneity of degree two of the selected two-point correlation in the grade-four slots,
for all complex scalars, all grade-four vectors and all pairs of points, implies the hypothesis
`hom` of the transfer theorems. -/
theorem GroupIndependence.homogeneousTrace_of_homogeneous {g₀ : GaugeGroup}
    {C₀ : WilsonFamily g₀} (T₀ : Hierarchy C₀)
    (h : ∀ (c : ℂ) (u : T₀.Field 4) (x : Points 2),
      T₀.correlation (some T₀.selected) (fun _ : Fin 2 => ⟨4, c • u⟩) x =
        c ^ 2 * T₀.correlation (some T₀.selected) (fun _ : Fin 2 => ⟨4, u⟩) x)
    (lam : ℝ) : HomogeneousTrace T₀ lam :=
  Eventually.of_forall fun r => h (lam : ℂ) T₀.centeredTrace (Hierarchy.timePair r)

end YangMills

#print axioms YangMills.GroupIndependence.rehome_traceTest
#print axioms YangMills.GroupIndependence.finrank_pos_of_isSimple
#print axioms YangMills.group_transfer_witness
#print axioms YangMills.group_transfer_jointExistence_body
