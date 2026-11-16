import FreeField.Analytic.Base
import FreeField.Analytic.WeightLe
import FreeField.Analytic.MeasurableWeight

import Mathlib.MeasureTheory.Constructions.HaarToSphere
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral

/-! Proofs consolidated from `FreeField/Work/integrable_pow_exp_weight.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_IntegrablePowExpWeight
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private theorem spacetime_norm_sq_work (p : Spacetime) :
    ‖p‖ ^ 2 = ‖spatial p‖ ^ 2 + time p ^ 2 := by
  rw [EuclideanSpace.real_norm_sq_eq, EuclideanSpace.real_norm_sq_eq,
    Fin.sum_univ_castSucc]
  rfl

private theorem cone_norm_le_work {p : Spacetime} (hp : p ∈ forwardCone) :
    ‖p‖ ≤ 2 * time p := by
  have hs : ‖spatial p‖ ≤ time p := hp
  have ht := (norm_nonneg (spatial p)).trans hs
  have hn := spacetime_norm_sq_work p
  nlinarith [norm_nonneg p, norm_nonneg (spatial p)]

private theorem integrable_radial_work {a : ℝ} (ha : 0 < a) (n : ℕ) :
    Integrable (fun p : Spacetime => ‖p‖ ^ n * Real.exp (-a * ‖p‖)) := by
  apply (integrable_fun_norm_addHaar (volume : Measure Spacetime)
    (f := fun t => t ^ n * Real.exp (-a * t))).2
  have h := integrableOn_rpow_mul_exp_neg_mul_rpow
    (s := (3 + n : ℕ)) (p := 1) (by exact lt_of_lt_of_le (by norm_num) (Nat.cast_nonneg _)) le_rfl ha
  convert h using 1
  ext t
  simp only [finrank_euclideanSpace, Fintype.card_fin, Nat.reduceSub,
    smul_eq_mul, Real.rpow_natCast, Real.rpow_one, ← mul_assoc, ← pow_add]

theorem integrable_pow_exp_weight' {r : ℝ} (hr : 0 < r) (k : ℕ) :
    Integrable fun p : Spacetime => ‖p‖ ^ k * Real.exp (-r * time p) * weight p := by
  have htime : Continuous time := by unfold time; fun_prop
  have hmeas : AEStronglyMeasurable
      (fun p : Spacetime => ‖p‖ ^ k * Real.exp (-r * time p) * weight p) volume :=
    ((continuous_norm.pow k).mul ((continuous_const.mul htime).rexp)).measurable.mul
      measurable_weight |>.aestronglyMeasurable
  refine (integrable_radial_work (show 0 < r / 2 by positivity) (k + 4)).mono' hmeas ?_
  apply ae_of_all
  intro p
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity [weight_nonneg p])]
  by_cases hp : p ∈ forwardCone
  · have ht : 0 ≤ time p := (norm_nonneg (spatial p)).trans hp
    have htn : time p ≤ ‖p‖ :=
      (le_abs_self (time p)).trans (PiLp.norm_apply_le p timeAxis)
    have hexp : Real.exp (-r * time p) ≤ Real.exp (-(r / 2) * ‖p‖) := by
      apply Real.exp_le_exp.mpr
      have := mul_le_mul_of_nonneg_left (cone_norm_le_work hp) hr.le
      nlinarith
    calc
      ‖p‖ ^ k * Real.exp (-r * time p) * weight p
          ≤ ‖p‖ ^ k * Real.exp (-(r / 2) * ‖p‖) * ‖p‖ ^ 4 := by
        exact mul_le_mul (mul_le_mul_of_nonneg_left hexp (by positivity))
          ((weight_le p).trans (pow_le_pow_left₀ ht htn 4)) (weight_nonneg p) (by positivity)
      _ = ‖p‖ ^ (k + 4) * Real.exp (-(r / 2) * ‖p‖) := by rw [pow_add]; ring
  · rw [weight_eq_zero hp, mul_zero]
    positivity

end YangMills.FreeField.Consolidated.Analytic_IntegrablePowExpWeight

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [MEDIUM, 120 lines] Laplace integrability with polynomial weights: on the cone
`‖p‖ ≤ √2 p_t` and `weight p ≤ p_t^4`, so the integrand is at most
`(√2 p_t)^k p_t^4 exp (-r p_t)` on the cone, whose integral over `{‖𝐩‖ ≤ p_t}` is a Gamma
integral. -/
theorem integrable_pow_exp_weight {r : ℝ} (hr : 0 < r) (k : ℕ) :
    Integrable fun p : Spacetime => ‖p‖ ^ k * Real.exp (-r * time p) * weight p := by
  exact Consolidated.Analytic_IntegrablePowExpWeight.integrable_pow_exp_weight' hr k

end YangMills.FreeField
