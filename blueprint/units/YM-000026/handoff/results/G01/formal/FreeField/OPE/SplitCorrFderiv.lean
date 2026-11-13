import FreeField.OPE.Base


/-! Proofs consolidated from `FreeField/Work/splitCorr_fderiv.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.OPE_SplitCorrFderiv
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

namespace SplitJetProof

variable {U J : Type} [Fintype U] [Fintype J]

private def leftFactor (K : Idx → Idx → Spacetime → ℂ) (α : U → Idx)
    (z : U → Spacetime) (mb : J → Mon) (y : J → Spacetime) (τ : SMatching U mb) (u : U) : ℂ :=
  Sum.elim (fun _ => (1 : ℂ))
    (fun l : PLeg mb => K (α u) l.2.1 (y l.1 - z u)) (τ.1 (Sum.inl u))

private def rightFactor (K : Idx → Idx → Spacetime → ℂ)
    (mb : J → Mon) (y : J → Spacetime) (τ : SMatching U mb) : ℂ :=
  ∏ l : PLeg mb, Sum.elim (fun _ => (1 : ℂ))
    (fun l' : PLeg mb => if Fintype.equivFin J l.1 < Fintype.equivFin J l'.1 then
      K l.2.1 l'.2.1 (y l'.1 - y l.1) else 1) (τ.1 (Sum.inr l))

private theorem moving_line {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (a b : Idx) (y z : Spacetime) (hz : y ≠ z) (i : Fin 4) :
    DifferentiableAt ℝ (fun t : Spacetime => K a b (y - t)) z ∧
      fderiv ℝ (fun t : Spacetime => K a b (y - t)) z
        (EuclideanSpace.single i (1 : ℝ)) = K (a + Pi.single i 1) b (y - z) := by
  have hn : y - z ≠ 0 := sub_ne_zero.mpr hz
  have hd : DifferentiableAt ℝ (K a b) (y - z) :=
    ((hK.smooth a b).contDiffAt (isOpen_compl_singleton.mem_nhds hn)).differentiableAt (by simp)
  have hc := hd.hasFDerivAt.comp z ((hasFDerivAt_id z).const_sub y)
  refine ⟨hc.differentiableAt, ?_⟩
  change fderiv ℝ (K a b ∘ HSub.hSub y) z _ = _
  rw [hc.fderiv]
  simpa using congrArg Neg.neg (hK.deriv_left a b i (y - z) hn)

/-- All factors except the line attached to the moving leg are constant. -/
private theorem term_jet {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α : U → Idx) (z : U → Spacetime) (mb : J → Mon) (y : J → Spacetime)
    (u₀ : U) (i : Fin 4) (hz : ∀ j, y j ≠ z u₀) (τ : SMatching U mb) :
    DifferentiableAt ℝ (fun t => (∏ u, leftFactor K α (update z u₀ t) mb y τ u) *
      rightFactor K mb y τ) (z u₀) ∧
    fderiv ℝ (fun t => (∏ u, leftFactor K α (update z u₀ t) mb y τ u) *
      rightFactor K mb y τ) (z u₀) (EuclideanSpace.single i (1 : ℝ)) =
        (∏ u, leftFactor K (update α u₀ (α u₀ + Pi.single i 1)) z mb y τ u) *
          rightFactor K mb y τ := by
  obtain ⟨l, hl⟩ := τ.2.2.1 u₀
  let C := (∏ u ∈ Finset.univ.erase u₀, leftFactor K α z mb y τ u) * rightFactor K mb y τ
  have heq : (fun t => (∏ u, leftFactor K α (update z u₀ t) mb y τ u) *
      rightFactor K mb y τ) = fun t => K (α u₀) l.2.1 (y l.1 - t) * C := by
    funext t
    rw [← Finset.mul_prod_erase _ _ (Finset.mem_univ u₀), mul_assoc]
    congr 1
    · simp [leftFactor, hl]
    · congr 1
      apply Finset.prod_congr rfl
      intro u hu
      simp only [Finset.mem_erase, Finset.mem_univ, and_true] at hu
      simp [leftFactor, Function.update_of_ne hu]
  have hrhs : (∏ u, leftFactor K (update α u₀ (α u₀ + Pi.single i 1)) z mb y τ u) *
      rightFactor K mb y τ = K (α u₀ + Pi.single i 1) l.2.1 (y l.1 - z u₀) * C := by
    rw [← Finset.mul_prod_erase _ _ (Finset.mem_univ u₀), mul_assoc]
    congr 1
    · simp [leftFactor, hl]
    · congr 1
      apply Finset.prod_congr rfl
      intro u hu
      simp only [Finset.mem_erase, Finset.mem_univ, and_true] at hu
      simp [leftFactor, Function.update_of_ne hu]
  rw [heq, hrhs]
  obtain ⟨hd, hder⟩ := moving_line hK (α u₀) l.2.1 (y l.1) (z u₀) (hz l.1) i
  refine ⟨hd.mul_const C, ?_⟩
  rw [fderiv_mul_const hd]
  simp [hder, mul_comm]

end SplitJetProof
variable {I J : Type}

theorem splitCorr_fderiv' {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) {U : Type}
    [Fintype U] [Fintype J] (α : U → Idx) (z : U → Spacetime) (mb : J → Mon)
    (y : J → Spacetime) (u₀ : U) (i : Fin 4) (hz : ∀ j, y j ≠ z u₀) :
    fderiv ℝ (fun t : Spacetime => splitCorr K α (Function.update z u₀ t) mb y) (z u₀)
        (EuclideanSpace.single i (1 : ℝ)) =
      splitCorr K (Function.update α u₀ (α u₀ + Pi.single i 1)) z mb y := by
  change fderiv ℝ (fun t => ∑ τ : SMatching U mb,
    (∏ u, SplitJetProof.leftFactor K α (update z u₀ t) mb y τ u) *
      SplitJetProof.rightFactor K mb y τ) (z u₀) _ = _
  rw [fderiv_fun_sum (fun τ _ => (SplitJetProof.term_jet hK α z mb y u₀ i hz τ).1)]
  simp only [sum_apply]
  apply Finset.sum_congr rfl
  intro τ _
  exact (SplitJetProof.term_jet hK α z mb y u₀ i hz τ).2

end YangMills.FreeField.Consolidated.OPE_SplitCorrFderiv

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {I J : Type}

/-- [MEDIUM, 200 lines] **Jets.** Moving one split leg: a derivative in its position raises its
multi-index. Each matching has exactly one line at `u₀`, `K (α u₀) β (y j - z u₀)`, and
`d/dz` of it in direction `e_i` is `-fderiv … = K (α u₀ + e_i) β …` by `deriv_left`. -/
theorem splitCorr_fderiv {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) {U : Type}
    [Fintype U] [Fintype J] (α : U → Idx) (z : U → Spacetime) (mb : J → Mon)
    (y : J → Spacetime) (u₀ : U) (i : Fin 4) (hz : ∀ j, y j ≠ z u₀) :
    fderiv ℝ (fun t : Spacetime => splitCorr K α (Function.update z u₀ t) mb y) (z u₀)
        (EuclideanSpace.single i (1 : ℝ)) =
      splitCorr K (Function.update α u₀ (α u₀ + Pi.single i 1)) z mb y := by
  exact Consolidated.OPE_SplitCorrFderiv.splitCorr_fderiv' hK α z mb y u₀ i hz

end YangMills.FreeField
