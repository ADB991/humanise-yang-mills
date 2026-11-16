import FreeField.Theory.Base
import FreeField.Analytic.MatchingIntegrable
import FreeField.Theory.PsiApply
import FreeField.Theory.CutIdentity
import FreeField.Theory.WightWOfFn
import FreeField.Theory.WightWAddTest
import FreeField.Theory.WightWLocal


/-! Proofs consolidated from `FreeField/Work/inner_Psi.lean`. -/

/-! Word-vector identities, grouped so later proofs use the primed inner-product theorem
without importing an uncompiled Work module. -/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_InnerPsi
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

private theorem inv_sqrt_factorial_inner (k : ℕ) :
    (starRingEnd ℂ) ((((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ)) *
      ((((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ)) = (Nat.factorial k : ℂ)⁻¹ := by
  rw [Complex.conj_ofReal, ← Complex.ofReal_mul, ← mul_inv,
    Real.mul_self_sqrt (Nat.cast_nonneg _), Complex.ofReal_inv]
  simp

private theorem amplitude_inner (k : ℕ) (f g : (Fin k → Spacetime) → ℂ)
    (hf : MemLp f 2 (Measure.pi fun _ : Fin k => mu))
    (hg : MemLp g 2 (Measure.pi fun _ : Fin k => mu)) :
    inner ℂ (hf.toLp f) (hg.toLp g) =
      ∫ p : Fin k → Spacetime, (starRingEnd ℂ) (f p) * g p
        ∂(Measure.pi fun _ : Fin k => mu) := by
  rw [L2.inner_def]
  apply integral_congr_ae
  filter_upwards [hf.coeFn_toLp, hg.coeFn_toLp] with p hu hv
  rw [hu, hv, RCLike.inner_apply']

theorem inner_Psi' (u v : Word) : inner ℂ (Psi u) (Psi v) = wightW (dagger u ++ v) := by
  rw [lp.inner_eq_tsum, ← cut_identity u v]
  apply tsum_congr
  intro k
  rw [Psi_apply, Psi_apply, inner_smul_left, inner_smul_right, ← mul_assoc,
    inv_sqrt_factorial_inner, amplitude_inner]

private theorem wightmanMono_nil (m : Fin 0 → Mon) (f : Fin 0 → TestFunction) :
    wightmanMono m f = 1 := by
  letI : Unique (Matching m) :=
    { default := ⟨Equiv.refl _, by simp⟩
      uniq := fun σ => Subtype.ext (Subsingleton.elim _ _) }
  simp [wightmanMono, Measure.real, volume_pi]

private theorem wightW_nil : wightW [] = 1 := by
  simp [wightW, wightmanL, Fintype.piFinset_of_isEmpty, wightmanMono_nil]

theorem Psi_nil_norm' : ‖Psi []‖ = 1 := by
  have h := congrArg Complex.re (inner_Psi' [] [])
  simp only [dagger, List.reverse_nil, List.map_nil,
    List.nil_append, wightW_nil, Complex.one_re] at h
  change RCLike.re (inner ℂ (Psi []) (Psi [])) = 1 at h
  rw [inner_self_eq_norm_sq] at h
  nlinarith [norm_nonneg (Psi [])]

private theorem word_eq_add_of_inner (u v w : Word)
    (h : ∀ t : Word, inner ℂ (Psi t) (Psi u) =
      inner ℂ (Psi t) (Psi v) + inner ℂ (Psi t) (Psi w)) :
    Psi u = Psi v + Psi w := by
  have hz (t : Word) : inner ℂ (Psi t) (Psi u - (Psi v + Psi w)) = 0 := by
    rw [inner_sub_right, inner_add_right, h, sub_self]
  apply sub_eq_zero.mp
  apply (inner_self_eq_zero (𝕜 := ℂ)).mp
  rw [inner_sub_left, inner_add_left, hz, hz, hz]
  simp

private theorem word_eq_smul_of_inner (u v : Word) (c : ℂ)
    (h : ∀ t : Word, inner ℂ (Psi t) (Psi u) = c * inner ℂ (Psi t) (Psi v)) :
    Psi u = c • Psi v := by
  have hz (t : Word) : inner ℂ (Psi t) (Psi u - c • Psi v) = 0 := by
    rw [inner_sub_right, inner_smul_right, h, sub_self]
  apply sub_eq_zero.mp
  apply (inner_self_eq_zero (𝕜 := ℂ)).mp
  rw [inner_sub_left, inner_smul_left, hz, hz]
  simp

theorem Psi_add_label' (A A' : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((A + A', f) :: u) = Psi ((A, f) :: u) + Psi ((A', f) :: u) := by
  apply word_eq_add_of_inner
  intro t
  simp only [inner_Psi']
  exact wightW_add_label (dagger t) u A A' f

theorem Psi_smul_label' (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((c • A, f) :: u) = c • Psi ((A, f) :: u) := by
  apply word_eq_smul_of_inner
  intro t
  simp only [inner_Psi']
  exact wightW_smul_label (dagger t) u c A f

theorem Psi_add_test' (A : Mon →₀ ℂ) (f f' : TestFunction) (u : Word) :
    Psi ((A, f + f') :: u) = Psi ((A, f) :: u) + Psi ((A, f') :: u) := by
  apply word_eq_add_of_inner
  intro t
  simp only [inner_Psi']
  exact wightW_add_test (dagger t) u A f f'

theorem Psi_smul_test' (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((A, c • f) :: u) = c • Psi ((A, f) :: u) := by
  apply word_eq_smul_of_inner
  intro t
  simp only [inner_Psi']
  exact wightW_smul_test (dagger t) u c A f

theorem Psi_adjoint' (A : Mon →₀ ℂ) (f : TestFunction) (u v : Word) :
    inner ℂ (Psi ((A, f) :: u)) (Psi v) =
      inner ℂ (Psi u) (Psi ((adjL A, conjugateTest f) :: v)) := by
  simp only [inner_Psi', dagger, List.reverse_cons, List.map_append, List.map_cons,
    List.map_nil, List.append_assoc, List.singleton_append]

private theorem wightW_two_insertions (u v : Word) (A B : Mon →₀ ℂ)
    (f g : TestFunction) :
    wightW (u ++ (A, f) :: (B, g) :: v) =
      wightmanL (Fin.append u.lab (Fin.cons A (Fin.cons B v.lab)))
        (Fin.append u.test (Fin.cons f (Fin.cons g v.test))) := by
  let P := Fin.append u.lab (Fin.cons A (Fin.cons B v.lab))
  let F := Fin.append u.test (Fin.cons f (Fin.cons g v.test))
  have hw : wightW (List.ofFn fun i => (P i, F i)) = wightmanL P F :=
    congrArg (fun s : Σ n, Fin n → ((Mon →₀ ℂ) × TestFunction) =>
      wightmanL (fun i => (s.2 i).1) (fun i => (s.2 i).2))
      (List.equivSigmaTuple.apply_symm_apply ⟨_, fun i => (P i, F i)⟩)
  have hp : (fun i => (P i, F i)) =
      Fin.append u.get (Fin.cons (A, f) (Fin.cons (B, g) v.get)) := by
    funext i
    refine Fin.addCases (fun j => ?_) (fun j => ?_) i
    · simp [P, F, Word.lab, Word.test]
    · refine Fin.cases ?_ (fun j => ?_) j
      · simp [P, F]
      · refine Fin.cases ?_ (fun j => ?_) j <;> simp [P, F, Word.lab, Word.test]
  rw [hp, List.ofFn_fin_append, List.ofFn_cons, List.ofFn_cons,
    List.ofFn_get, List.ofFn_get] at hw
  exact hw

private theorem continuous_Psi_norm_sq (A : Mon →₀ ℂ) (u : Word) :
    Continuous fun f : TestFunction => ‖Psi ((A, f) :: u)‖ ^ 2 := by
  let P := Fin.append (dagger u).lab (Fin.cons (adjL A) (Fin.cons A u.lab))
  let F := fun f : TestFunction =>
    Fin.append (dagger u).test (Fin.cons (conjugateTest f) (Fin.cons f u.test))
  have hF : Continuous F := by
    apply continuous_pi
    intro i
    refine Fin.addCases (fun j => ?_) (fun j => ?_) i
    · simpa [F] using (continuous_const : Continuous fun _ : TestFunction => (dagger u).test j)
    · refine Fin.cases ?_ (fun j => ?_) j
      · simpa [F] using conjugateTest.continuous
      · refine Fin.cases ?_ (fun j => ?_) j
        · convert (continuous_id : Continuous (id : TestFunction → TestFunction)) using 1
          ext f
          simp [F]
        · simpa [F] using (continuous_const : Continuous fun _ : TestFunction => u.test j)
  have heq (f : TestFunction) : ‖Psi ((A, f) :: u)‖ ^ 2 = (wightmanL P (F f)).re := by
    rw [← inner_self_eq_norm_sq (𝕜 := ℂ), inner_Psi']
    simp only [dagger, List.reverse_cons, List.map_append, List.map_cons,
      List.map_nil, List.append_assoc, List.singleton_append]
    exact congrArg Complex.re (wightW_two_insertions (dagger u) u (adjL A) A
      (conjugateTest f) f)
  simp_rw [heq]
  exact Complex.continuous_re.comp ((wightmanL_continuous P).comp hF)

theorem Psi_tempered' (A : Mon →₀ ℂ) (u : Word) :
    Continuous fun f : TestFunction => Psi ((A, f) :: u) := by
  let T : TestFunction →+ FockCarrier :=
    AddMonoidHom.mk' (fun f => Psi ((A, f) :: u)) (fun f g => Psi_add_test' A f g u)
  have hnorm : Continuous fun f => ‖T f‖ := by
    change Continuous fun f : TestFunction => ‖Psi ((A, f) :: u)‖
    simpa only [Real.sqrt_sq_eq_abs, abs_norm] using (continuous_Psi_norm_sq A u).sqrt
  apply continuous_of_tendsto_nhds_zero T
  apply tendsto_zero_iff_norm_tendsto_zero.mpr
  simpa only [map_zero, norm_zero] using hnorm.tendsto 0

theorem Psi_local' (A B : Mon →₀ ℂ) (f g : TestFunction) (u : Word)
    (h : FieldSystem.SpacelikeSeparated f g) :
    Psi ((A, f) :: (B, g) :: u) = Psi ((B, g) :: (A, f) :: u) := by
  have hz (t : Word) : inner ℂ (Psi t)
      (Psi ((A, f) :: (B, g) :: u) - Psi ((B, g) :: (A, f) :: u)) = 0 := by
    rw [inner_sub_right, inner_Psi', inner_Psi',
      wightW_local (dagger t) u A B f g h, sub_self]
  apply sub_eq_zero.mp
  apply (inner_self_eq_zero (𝕜 := ℂ)).mp
  rw [inner_sub_left, hz, hz, sub_self]

end YangMills.FreeField.Consolidated.Theory_InnerPsi

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 150 lines] **Inner products of word vectors.** `lp` and `L²` inner products
(`lp.inner_eq_tsum`, `MeasureTheory.L2.inner_def`) and `(sqrt (k!))⁻² = 1/k!`.
Depends on `Psi_apply`, `cut_identity`. -/
theorem inner_Psi (u v : Word) : inner ℂ (Psi u) (Psi v) = wightW (dagger u ++ v) := by
  exact Consolidated.Theory_InnerPsi.inner_Psi' u v

/-- [EASY, 40 lines] `wightW [] = 1`. Depends on `inner_Psi`. -/
theorem Psi_nil_norm : ‖Psi []‖ = 1 := by
  exact Consolidated.Theory_InnerPsi.Psi_nil_norm'

/-- [EASY, 60 lines] Orthogonality trick: `x = Ψ((A+A',f)::u) - Ψ((A,f)::u) - Ψ((A',f)::u)` has
`⟪Ψ w, x⟫ = 0` for every word `w` by `inner_Psi` and `wightW_add_label`, and `⟪x, x⟫` is a
combination of three such inner products. Depends on `inner_Psi`, `wightW_add_label`. -/
theorem Psi_add_label (A A' : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((A + A', f) :: u) = Psi ((A, f) :: u) + Psi ((A', f) :: u) := by
  exact Consolidated.Theory_InnerPsi.Psi_add_label' A A' f u

/-- [EASY, 60 lines] As `Psi_add_label`. Depends on `inner_Psi`, `wightW_smul_label`. -/
theorem Psi_smul_label (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((c • A, f) :: u) = c • Psi ((A, f) :: u) := by
  exact Consolidated.Theory_InnerPsi.Psi_smul_label' c A f u

/-- [EASY, 60 lines] As `Psi_add_label`. Depends on `inner_Psi`, `wightW_add_test`. -/
theorem Psi_add_test (A : Mon →₀ ℂ) (f f' : TestFunction) (u : Word) :
    Psi ((A, f + f') :: u) = Psi ((A, f) :: u) + Psi ((A, f') :: u) := by
  exact Consolidated.Theory_InnerPsi.Psi_add_test' A f f' u

/-- [EASY, 60 lines] As `Psi_add_label`. Depends on `inner_Psi`, `wightW_smul_test`. -/
theorem Psi_smul_test (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((A, c • f) :: u) = c • Psi ((A, f) :: u) := by
  exact Consolidated.Theory_InnerPsi.Psi_smul_test' c A f u

/-- [EASY, 30 lines] `dagger ((A,f) :: u) ++ v = dagger u ++ (adjL A, conjugateTest f) :: v`.
Depends on `inner_Psi`. -/
theorem Psi_adjoint (A : Mon →₀ ℂ) (f : TestFunction) (u v : Word) :
    inner ℂ (Psi ((A, f) :: u)) (Psi v) =
      inner ℂ (Psi u) (Psi ((adjL A, conjugateTest f) :: v)) := by
  exact Consolidated.Theory_InnerPsi.Psi_adjoint' A f u v

/-- [MEDIUM, 150 lines] `f ↦ Ψ((A,f)::u)` is additive (`Psi_add_test`), so continuity at `0`
suffices (`continuous_of_continuousAt_zero`); and
`‖Ψ((A,g)::u)‖² = wightW (dagger u ++ (adjL A, conjugateTest g) :: (A, g) :: u)` tends to `0` as
`g → 0` by `wightmanL_continuous` and continuity of `conjugateTest`.
Depends on `inner_Psi`, `Psi_add_test`, `wightmanL_continuous`. -/
theorem Psi_tempered (A : Mon →₀ ℂ) (u : Word) :
    Continuous fun f : TestFunction => Psi ((A, f) :: u) := by
  exact Consolidated.Theory_InnerPsi.Psi_tempered' A u

/-- [EASY, 60 lines] Orthogonality trick with `wightW_local`. Depends on `inner_Psi`,
`wightW_local`. -/
theorem Psi_local (A B : Mon →₀ ℂ) (f g : TestFunction) (u : Word)
    (h : FieldSystem.SpacelikeSeparated f g) :
    Psi ((A, f) :: (B, g) :: u) = Psi ((B, g) :: (A, f) :: u) := by
  exact Consolidated.Theory_InnerPsi.Psi_local' A B f g u h

end YangMills.FreeField
