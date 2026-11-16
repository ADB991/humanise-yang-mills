import FreeField.Analytic.Base
import FreeField.Analytic.MeasurableWeight
import FreeField.Analytic.IntegrablePowExpWeight

import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Calculus.ContDiff.Deriv
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Calculus.FDeriv.Symmetric

/-! Proofs consolidated from `FreeField/Work/S_contDiffOn.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_SContDiffOn
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private def laplaceMoment (k : ℕ) (r : ℝ) : ℝ :=
  ∫ p : Spacetime, (-time p) ^ k * Real.exp (-r * time p) * weight p

private theorem laplace_integrand_bound (k : ℕ) {a r : ℝ} (har : a ≤ r)
    (p : Spacetime) :
    ‖(-time p) ^ k * Real.exp (-r * time p) * weight p‖ ≤
      ‖p‖ ^ k * Real.exp (-a * time p) * weight p := by
  by_cases hp : p ∈ forwardCone
  · have ht : 0 ≤ time p := (norm_nonneg (spatial p)).trans hp
    have htn : |time p| ≤ ‖p‖ := PiLp.norm_apply_le p timeAxis
    simp only [norm_mul, norm_pow, norm_neg, Real.norm_eq_abs,
      abs_of_pos (Real.exp_pos _), abs_of_nonneg (weight_nonneg p)]
    apply mul_le_mul_of_nonneg_right _ (weight_nonneg p)
    apply mul_le_mul (pow_le_pow_left₀ (abs_nonneg _) htn k)
    · exact Real.exp_le_exp.mpr (by nlinarith)
    · positivity
    · positivity
  · simp only [weight_eq_zero hp, mul_zero, norm_zero, le_refl]

private theorem laplace_integrand_measurable (k : ℕ) (r : ℝ) :
    AEStronglyMeasurable
      (fun p : Spacetime => (-time p) ^ k * Real.exp (-r * time p) * weight p) volume := by
  have ht : Continuous time := by unfold time; fun_prop
  exact (((ht.neg.pow k).mul (continuous_const.mul ht).rexp).measurable.mul
    measurable_weight).aestronglyMeasurable

private theorem laplace_integrand_integrable (k : ℕ) {r : ℝ} (hr : 0 < r) :
    Integrable (fun p : Spacetime => (-time p) ^ k * Real.exp (-r * time p) * weight p) := by
  exact (integrable_pow_exp_weight hr k).mono' (laplace_integrand_measurable k r)
    (ae_of_all _ (laplace_integrand_bound k le_rfl))

private theorem laplaceMoment_hasDerivAt (k : ℕ) {r : ℝ} (hr : 0 < r) :
    HasDerivAt (laplaceMoment k) (laplaceMoment (k + 1) r) r := by
  have hhalf : 0 < r / 2 := by positivity
  refine (hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (F := fun s p => (-time p) ^ k * Real.exp (-s * time p) * weight p)
    (F' := fun s p => (-time p) ^ (k + 1) * Real.exp (-s * time p) * weight p)
    (s := Ioi (r / 2)) (bound := fun p : Spacetime =>
      ‖p‖ ^ (k + 1) * Real.exp (-(r / 2) * time p) * weight p)
    (Ioi_mem_nhds (by linarith))
    (Eventually.of_forall (laplace_integrand_measurable k))
    (laplace_integrand_integrable k hr)
    (laplace_integrand_measurable (k + 1) r)
    (ae_of_all _ (fun p s hs => laplace_integrand_bound (k + 1) hs.le p))
    (integrable_pow_exp_weight hhalf (k + 1)) ?_).2
  apply ae_of_all
  intro p s _
  convert (((hasDerivAt_id s).neg.mul_const (time p)).exp.const_mul
    ((-time p) ^ k)).mul_const (weight p) using 1 <;> try rfl
  simp only [Pi.neg_apply, id_eq, pow_succ]
  ring

private theorem laplaceMoment_contDiffOn (k : ℕ) :
    ContDiffOn ℝ ∞ (laplaceMoment k) (Ioi 0) := by
  apply contDiffOn_infty.mpr
  intro n
  induction n generalizing k with
  | zero =>
      apply contDiffOn_zero.mpr
      intro r hr
      exact (laplaceMoment_hasDerivAt k hr).continuousAt.continuousWithinAt
  | succ n ih =>
      rw [Nat.cast_add, Nat.cast_one, contDiffOn_succ_iff_deriv_of_isOpen isOpen_Ioi]
      refine ⟨fun r hr => (laplaceMoment_hasDerivAt k hr).differentiableAt.differentiableWithinAt,
        ?_, ?_⟩
      · simp
      · exact (ih (k + 1)).congr (fun r hr => (laplaceMoment_hasDerivAt k hr).deriv)

theorem S_contDiffOn' : ContDiffOn ℝ ∞ S {(0 : Spacetime)}ᶜ := by
  have hSr : ContDiffOn ℝ ∞ Sr (Ioi 0) := by
    have h := laplaceMoment_contDiffOn 0
    change ContDiffOn ℝ ∞ (fun r => ∫ p : Spacetime,
      (-time p) ^ 0 * Real.exp (-r * time p) * weight p) (Ioi 0) at h
    convert h using 1
    funext r
    simp [Sr]
  have hn : ContDiffOn ℝ ∞ (fun x : Spacetime => ‖x‖) {(0 : Spacetime)}ᶜ :=
    contDiffOn_id.norm ℝ (fun x hx => hx)
  exact Complex.ofRealCLM.contDiff.comp_contDiffOn
    (hSr.comp hn (fun x hx => norm_pos_iff.mpr hx))

private theorem foldr_dirDeriv_contDiffOn (vs : List Spacetime)
    {f : Spacetime → ℂ} {U : Set Spacetime} (hU : IsOpen U)
    (hf : ContDiffOn ℝ ∞ f U) : ContDiffOn ℝ ∞ (vs.foldr dirDeriv f) U := by
  induction vs with
  | nil => exact hf
  | cons v vs ih =>
      exact (ih.fderiv_of_isOpen hU (by simp)).clm_apply contDiffOn_const

theorem partialDeriv_S_contDiffOn' (γ : Idx) :
    ContDiffOn ℝ ∞ (partialDeriv γ S) {(0 : Spacetime)}ᶜ := by
  exact foldr_dirDeriv_contDiffOn (dirList γ) isOpen_compl_singleton S_contDiffOn'

private theorem dirDeriv_comm_on {f : Spacetime → ℂ} {U : Set Spacetime}
    (hU : IsOpen U) (hf : ContDiffOn ℝ ∞ f U) (v w : Spacetime) :
    EqOn (dirDeriv v (dirDeriv w f)) (dirDeriv w (dirDeriv v f)) U := by
  intro x hx
  have hd : DifferentiableAt ℝ (fderiv ℝ f) x :=
    ((hf.fderiv_of_isOpen (m := ∞) hU (by simp)) x hx).contDiffAt
      (hU.mem_nhds hx) |>.differentiableAt (by simp)
  have hc := (hf x hx).contDiffAt (hU.mem_nhds hx)
  have he (a b : Spacetime) : dirDeriv a (dirDeriv b f) x =
      fderiv ℝ (fderiv ℝ f) x a b := by
    change (fderiv ℝ (fun y => fderiv ℝ f y b) x) a = _
    rw [fderiv_clm_apply hd (differentiableAt_const b)]
    simp
  rw [he v w, he w v]
  exact hc.isSymmSndFDerivAt (by
    simp only [minSmoothness_of_isRCLikeNormedField]
    exact WithTop.coe_le_coe.mpr (le_top : (2 : ℕ∞) ≤ ⊤)) v w

private theorem foldr_dirDeriv_perm {vs ws : List Spacetime} (h : vs.Perm ws)
    {f : Spacetime → ℂ} {U : Set Spacetime} (hU : IsOpen U)
    (hf : ContDiffOn ℝ ∞ f U) :
    EqOn (vs.foldr dirDeriv f) (ws.foldr dirDeriv f) U := by
  induction h with
  | nil => intro x _; rfl
  | cons v h ih =>
      intro x hx
      exact congrArg (fun L : Spacetime →L[ℝ] ℂ => L v)
        ((ih.eventuallyEq_of_mem (hU.mem_nhds hx)).fderiv_eq)
  | swap v w vs =>
      exact dirDeriv_comm_on hU (foldr_dirDeriv_contDiffOn vs hU hf) w v
  | trans h₁ h₂ ih₁ ih₂ => exact ih₁.trans ih₂

private theorem dirList_add_perm (α β : Idx) :
    (dirList α ++ dirList β).Perm (dirList (α + β)) := by
  simpa only [dirList, Pi.add_apply, List.replicate_add] using
    List.flatMap_append_perm (List.finRange 4)
      (fun i => List.replicate (α i) (EuclideanSpace.single i (1 : ℝ)))
      (fun i => List.replicate (β i) (EuclideanSpace.single i (1 : ℝ)))

private theorem dirList_single (i : Fin 4) :
    dirList (Pi.single i 1) = [EuclideanSpace.single i (1 : ℝ)] := by
  fin_cases i <;> simp [dirList, List.finRange_succ, Pi.single_apply]

theorem partialDeriv_S_succ' (γ : Idx) (i : Fin 4) {ξ : Spacetime} (hξ : ξ ≠ 0) :
    fderiv ℝ (partialDeriv γ S) ξ (EuclideanSpace.single i (1 : ℝ)) =
      partialDeriv (γ + Pi.single i 1) S ξ := by
  have hp := (List.perm_append_comm.trans (dirList_add_perm γ (Pi.single i 1)))
  rw [dirList_single, List.singleton_append] at hp
  exact foldr_dirDeriv_perm hp isOpen_compl_singleton S_contDiffOn' hξ

end YangMills.FreeField.Consolidated.Analytic_SContDiffOn

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [MEDIUM, 250 lines] `S = Sr ∘ ‖·‖` is smooth away from the origin: `Sr` is smooth on `(0,∞)`
by repeated differentiation under the integral (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`
with `integrable_pow_exp_weight`), and the norm is smooth off `0`. -/
theorem S_contDiffOn : ContDiffOn ℝ ∞ S {(0 : Spacetime)}ᶜ := by
  exact Consolidated.Analytic_SContDiffOn.S_contDiffOn'

/-- [EASY, 60 lines] Induction on `dirList γ`: `fderiv` of a smooth function on an open set,
applied to a fixed vector, is smooth there. Depends on `S_contDiffOn`. -/
theorem partialDeriv_S_contDiffOn (γ : Idx) :
    ContDiffOn ℝ ∞ (partialDeriv γ S) {(0 : Spacetime)}ᶜ := by
  exact Consolidated.Analytic_SContDiffOn.partialDeriv_S_contDiffOn' γ

/-- [MEDIUM, 150 lines] One more derivative raises the multi-index (partial derivatives of a
smooth function commute; `ContDiffAt.isSymmSndFDerivAt`). Depends on `S_contDiffOn`. -/
theorem partialDeriv_S_succ (γ : Idx) (i : Fin 4) {ξ : Spacetime} (hξ : ξ ≠ 0) :
    fderiv ℝ (partialDeriv γ S) ξ (EuclideanSpace.single i (1 : ℝ)) =
      partialDeriv (γ + Pi.single i 1) S ξ := by
  exact Consolidated.Analytic_SContDiffOn.partialDeriv_S_succ' γ i hξ

end YangMills.FreeField
