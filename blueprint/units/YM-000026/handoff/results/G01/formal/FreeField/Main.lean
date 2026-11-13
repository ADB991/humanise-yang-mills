import FreeField.Theory
import FreeField.Continuation
import FreeField.OPE
import FreeField.Trace

/-!
# `YangMills.JointExistence` from a generalized free field

This file contains no `sorry`. It derives the public statement from
* `exists_wightmanTheory` (module A: `Host.reconstruct` and `exists_fockHost`),
* `corrL_perm`, `corrL_contDiffOn`, `contL_differentiableOn`, `contL_root`, `contL_boundary`
  (module E),
* `exists_ope_coefficient` (module D),
* `Sr_asymptotic`, `wickProfile_excluded` (module C; `traceTwo_eq` is proved),
* the already proved `YangMills.jointExistence_body_constant_insertions` (`Adequacy`) and
  `GroupIndependence.haarFamily`, `finrank_pos_of_isSimple`.
Nothing from the construction of the Yang–Mills theory is imported.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

variable (g : GaugeGroup) (H : HilbertSpace) (th : WightmanTheory H labels) (coef : Coef)
  (lam : ℂ)

theorem hier_reconstructed (hax : th.Axioms) (hfaith : th.fields.Faithful)
    (hvev : ∀ (n : ℕ) (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction),
      th.fields.vacuumExpectation P f = wightmanL P f) :
    (hier g H th coef lam).Reconstructed where
  axioms := hax
  faithful := hfaith
  injective := toLabel_injective
  acts := by
    obtain ⟨f, hf⟩ := hfaith (toLabel 4 theta) theta_label_ne_zero
    exact ⟨⟨4, theta⟩, f, hf⟩
  covers := toLabel_covers
  represents := fun a => ⟨a, rfl⟩
  normalized := inferInstanceAs (IsProbabilityMeasure Adequacy.Phase.measure)
  fullSupport := Adequacy.Phase.measure_isOpenPos
  permutation _ {_} a x hx π := corrL_perm (fun i => tagLabel (a i)) x hx π
  smooth _ {_} a := corrL_contDiffOn fun i => tagLabel (a i)
  characterContinuity {_} _ _ _ := continuous_const
  mixture {_} a x _ := by
    show ∫ _c, corrL (fun i => tagLabel (a i)) x ∂Adequacy.Phase.measure = _
    rw [Adequacy.Phase.integral_measure]
    show _ = corrL (fun i => tagLabel (a i)) x
    ring
  analytic {_} v space := contL_differentiableOn (fun i => tagLabel (v i)) space
  root {_} v x h := contL_root (fun i => tagLabel (v i)) x h
  boundary {_} v height h tests := by
    show Tendsto _ _ (𝓝 (th.fields.vacuumExpectation (fun i => tagLabel (v i)) tests))
    rw [hvev]
    exact contL_boundary (fun i => tagLabel (v i)) height h tests

/-- The real scale of the trace field. -/
def traceScale (g : GaugeGroup) : ℝ :=
  Real.sqrt (3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi ^ 4 / (384 * Real.pi))

theorem traceScale_sq (g : GaugeGroup) :
    traceScale g ^ 2 * (384 * Real.pi) = 3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi ^ 4 := by
  have hpi : (0 : ℝ) < Real.pi := Real.pi_pos
  have h0 : (0 : ℝ) ≤ 3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi ^ 4 / (384 * Real.pi) := by
    positivity
  rw [traceScale, Real.sq_sqrt h0]
  field_simp

theorem hier_shortDistance :
    Tendsto (fun r : ℝ => (r ^ 8 * (Real.log r⁻¹) ^ 2) •
        (hier g H th coef (traceScale g : ℂ)).traceTwo r) (𝓝[>] 0)
      (𝓝 ((3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi ^ 4 : ℝ) : ℂ)) := by
  have h1 := (Sr_asymptotic.const_mul (traceScale g ^ 2))
  have h2 : traceScale g ^ 2 * (384 * Real.pi) =
      3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi ^ 4 := traceScale_sq g
  rw [h2] at h1
  have h3 := (Complex.continuous_ofReal.tendsto _).comp h1
  refine h3.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with r hr
  rw [traceTwo_eq g H th coef _ hr, Complex.real_smul]
  simp only [Function.comp_apply]
  push_cast
  ring

theorem hier_traceTest (hpos : 0 < Module.finrank ℝ g.lieAlgebra)
    (hvev : ∀ (n : ℕ) (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction),
      th.fields.vacuumExpectation P f = wightmanL P f) :
    (hier g H th coef (traceScale g : ℂ)).TraceTest where
  centered f := by
    have h := hvev 1 (fun _ => toLabel 4 ((traceScale g : ℂ) • theta)) (fun _ => f)
    rw [toLabel_theta, wightmanL_single_leg] at h
    show inner ℂ th.fields.vacuum.1
      (th.fields.field (toLabel 4 ((traceScale g : ℂ) • theta)) f th.fields.vacuum).1 = 0
    rw [toLabel_theta, ← h]
    simp [FieldSystem.vacuumExpectation, FieldSystem.vector]
  amplitudePositive := by
    have : (0 : ℝ) < (Module.finrank ℝ g.lieAlgebra : ℝ) := Nat.cast_pos.2 hpos
    positivity
  shortDistance := hier_shortDistance g H th coef
  excludes terms := by
    have : (0 : ℝ) < (Module.finrank ℝ g.lieAlgebra : ℝ) := Nat.cast_pos.2 hpos
    exact wickProfile_excluded _ _ (by positivity) (hier_shortDistance g H th coef) terms

end YangMills.FreeField

namespace YangMills
open FreeField

/-- **The public statement holds for a generalized free field.** For every simple gauge group
the witness is the Wick algebra of one scalar generalized free field, with lattice insertions
that do not read the gauge configuration. -/
theorem jointExistence_of_freeField : JointExistence := by
  intro g hg
  obtain ⟨H, th, hax, hfaith, hvev⟩ := exists_wightmanTheory
  obtain ⟨coef, hope⟩ := exists_ope_coefficient
  have hpos := GroupIndependence.finrank_pos_of_isSimple g hg
  obtain ⟨C, hC, _⟩ := jointExistence_body_constant_insertions
    (GroupIndependence.haarFamily g Tag) (hier g H th coef (traceScale g : ℂ))
    (hier_reconstructed g H th coef _ hax hfaith hvev)
    (hope g H th _)
    (hier_traceTest g H th coef hpos hvev)
    (hier_vanishes g H th coef _)
  exact ⟨C, hC⟩

end YangMills

#print axioms YangMills.jointExistence_of_freeField
