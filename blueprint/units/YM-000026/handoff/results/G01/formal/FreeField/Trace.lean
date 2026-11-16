import FreeField.Hierarchy
import FreeField.Proofs.SrAsymptotic
import FreeField.Proofs.WickExcluded

/-!
# Free-field witness, module C: the trace test

See `FreeField/DESIGN.md`, section (c).
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

/-- **Short-distance asymptotics of the two-point function.**
`r⁸ log²(1/r) · Sr r → 384 π` as `r → 0⁺`.

Proof idea: substitute `p = v / r` in `Sr r = ∫ exp (-r p_t) weight p dp`:
`r⁸ L² Sr r = ∫_{cone} exp (-v_t) (v²)² · L² / log² (e + v²/r²) dv`, with `L = log (1/r)` and
`v² = minkowskiSquare v`. Since `log (e + v²/r²) = 2 L + log (e r² + v²)`, the last factor tends
to `1/4` for `v² > 0`; it is at most `max 1 (log (1/v²))²` for `0 < r < 1` (if `r ≤ v²` then
`e + v²/r² ≥ 1/r`; otherwise `L < log (1/v²)` and the logarithm is at least `1`). Dominated
convergence gives the limit `(1/4) ∫_{cone} exp (-v_t) (v_t² - |𝐯|²)² dv`, and
`∫_{cone} … = ∫_0^∞ exp (-E) · 4π ∫_0^E (E² - k²)² k² dk dE = 4π · (8/105) · 7! = 1536 π`.
Mathlib: `integral_comp_smul` (scaling), `integral_fun_norm_addHaar` and
`EuclideanSpace.volume_ball` (radial integral in `ℝ³`), `Real.Gamma` integral for `7!`,
`tendsto_integral_filter_of_dominated_convergence`. About 500 lines. The value `384 π` was
checked numerically. -/
theorem Sr_asymptotic :
    Tendsto (fun r : ℝ => r ^ 8 * (Real.log r⁻¹) ^ 2 * Sr r) (𝓝[>] 0) (𝓝 (384 * Real.pi)) := by
  exact Sr_asymptotic'

/-- **No finite Wick profile has a `r⁻⁸ log⁻²` singularity.** Stated for an arbitrary function;
it does not involve the model.

Proof idea: for each `Mode`, `r ↦ ∫ kernel r p dp` is, for `0 < r < 1`, a finite sum of terms
`r^a (log r)^b` with `a ∈ ℤ`, `b ∈ {0, 1}` up to `O(r^N)` for every `N` (for mass `0` it is a
multiple of `r^{-(2 + spatialOrder + timeOrder)}`; for positive mass, expand
`∫_m^∞ (E² - m²)^{(1+σ)/2} E^{k} exp (-r E) dE`). Finite products and sums stay in the span of
`r^a (log r)^b`, `b ∈ ℕ`, modulo `O(1)`, and no function in that span satisfies
`r⁸ log²(1/r) f(r) → A ≠ 0` (compare along `r = 2^{-n}`). The upstream development proves exactly
this (`YM.TraceExtension.Wick.real_profile`, `no_powerlog`, about 600 lines in
`Wick/{Expansion,Gain,Log,Massive,PolynomialField}.lean`), but its import closure is the whole
construction, so it has to be re-proved or extracted; see DESIGN.md (C). -/
theorem wickProfile_excluded (F : ℝ → ℂ) (A : ℝ) (hA : 0 < A)
    (h : Tendsto (fun r : ℝ => (r ^ 8 * (Real.log r⁻¹) ^ 2) • F r) (𝓝[>] 0) (𝓝 (A : ℂ)))
    (terms : List (ℂ × Hierarchy.Track)) :
    ¬ F =ᶠ[𝓝[>] 0] Hierarchy.wickProfile terms := by
  exact wickProfile_excluded' F A hA h terms

/-- The two points of `timePair r` differ by `r` in the time direction. -/
theorem timePair_diff (r : ℝ) :
    (Hierarchy.timePair r).ofLp 1 - (Hierarchy.timePair r).ofLp 0 =
      EuclideanSpace.single (Fin.last 3) r := by
  ext i
  refine Fin.lastCases ?_ (fun j => ?_) i
  · have h0 : Fin.append (fun _ : Fin 1 => -(r / 2)) (fun _ : Fin 1 => r / 2) 0 = -(r / 2) :=
      Fin.append_left _ _ 0
    have h1 : Fin.append (fun _ : Fin 1 => -(r / 2)) (fun _ : Fin 1 => r / 2) 1 = r / 2 :=
      Fin.append_right _ _ 0
    have h2 : r / 2 - -(r / 2) = r := by ring
    have e1 : (Hierarchy.timePair r).ofLp 1 (Fin.last 3) = r / 2 := by
      show Fin.snoc (α := fun _ => ℝ) (fun _ : Fin 3 => (0 : ℝ)) _ (Fin.last 3) = _
      rw [Fin.snoc_last]; exact h1
    have e0 : (Hierarchy.timePair r).ofLp 0 (Fin.last 3) = -(r / 2) := by
      show Fin.snoc (α := fun _ => ℝ) (fun _ : Fin 3 => (0 : ℝ)) _ (Fin.last 3) = _
      rw [Fin.snoc_last]; exact h0
    show (Hierarchy.timePair r).ofLp 1 (Fin.last 3) - (Hierarchy.timePair r).ofLp 0 (Fin.last 3) = _
    rw [e1, e0, h2]
    simp
  · simp [Hierarchy.timePair]
    intro h
    exact absurd h (Fin.castSucc_lt_last j).ne

/-- Two vertices carrying `φ`: the only matching is the single line between them. -/
theorem wickSum_pair (K : Fin 2 → Fin 2 → Idx → Idx → ℂ) :
    wickSum K (fun _ : Fin 2 => ({(0 : Idx)} : Mon)) = K 0 1 0 0 := by
  have hcard : Fintype.card (({(0 : Idx)} : Mon).ToType) = 1 := by
    rw [Multiset.card_coe]; rfl
  haveI : Unique (({(0 : Idx)} : Mon).ToType) := (Fintype.card_eq_one_iff_nonempty_unique.1 hcard).some
  have hidx : ∀ e : (({(0 : Idx)} : Mon).ToType), e.1 = 0 := fun e =>
    Multiset.mem_singleton.1 (Multiset.coe_mem (x := e))
  have hσ : ∀ (σ : Matching (fun _ : Fin 2 => ({(0 : Idx)} : Mon))) ℓ, (σ.1 ℓ).1 = 1 - ℓ.1 := by
    intro σ ℓ
    have := σ.2.2 ℓ
    revert this
    generalize (σ.1 ℓ).1 = a
    generalize ℓ.1 = b
    fin_cases a <;> fin_cases b <;> simp
  let σ₀ : Matching (fun _ : Fin 2 => ({(0 : Idx)} : Mon)) :=
    ⟨⟨fun ℓ => ⟨1 - ℓ.1, ℓ.2⟩, fun ℓ => ⟨1 - ℓ.1, ℓ.2⟩,
        fun ℓ => by rcases ℓ with ⟨v, e⟩; fin_cases v <;> rfl,
        fun ℓ => by rcases ℓ with ⟨v, e⟩; fin_cases v <;> rfl⟩,
      fun ℓ => by rcases ℓ with ⟨v, e⟩; fin_cases v <;> rfl,
      fun ℓ => by rcases ℓ with ⟨v, e⟩; fin_cases v <;> simp⟩
  haveI : Subsingleton (Matching (fun _ : Fin 2 => ({(0 : Idx)} : Mon))) := by
    refine ⟨fun σ τ => Subtype.ext (Equiv.ext fun ℓ => ?_)⟩
    refine Sigma.ext ((hσ σ ℓ).trans (hσ τ ℓ).symm) ?_
    exact heq_of_eq (Subsingleton.elim _ _)
  unfold wickSum
  rw [Fintype.sum_subsingleton _ σ₀, Fintype.prod_sigma, Fin.prod_univ_two]
  simp [σ₀, Leg.idx, hidx]

/-- **Evaluation of the trace two-point function**: with trace field `lam • φ`, at time
separation `r > 0` it is `lam² · Sr r`. -/
theorem traceTwo_eq (g : GaugeGroup) (H : HilbertSpace) (th : WightmanTheory H labels)
    (coef : Coef) (lam : ℂ) {r : ℝ} (hr : 0 < r) :
    (hier g H th coef lam).traceTwo r = lam ^ 2 * (Sr r : ℂ) := by
  have hd := timePair_diff r
  have hsep : Hierarchy.timePair r ∈ WilsonFamily.separated 2 := by
    show Function.Injective (Hierarchy.timePair r).ofLp
    have hne : (Hierarchy.timePair r).ofLp 1 ≠ (Hierarchy.timePair r).ofLp 0 := by
      intro h
      rw [h, sub_self] at hd
      have := congrArg (fun v : Spacetime => v (Fin.last 3)) hd
      simp at this
      exact hr.ne this
    intro a b hab
    fin_cases a <;> fin_cases b <;> first | rfl | exact absurd hab hne | exact absurd hab.symm hne
  show corrL (fun _ : Fin 2 => toLabel 4 (lam • theta)) (Hierarchy.timePair r) = _
  rw [corrL, if_pos hsep, toLabel_theta]
  by_cases hl : lam = 0
  · subst hl
    rw [wickL_eq_zero_of_zero _ _ 0 (by simp)]
    simp
  · unfold wickL
    have hs : (fun _ : Fin 2 => (Finsupp.single ({(0 : Idx)} : Mon) lam).support) =
        fun _ => {({(0 : Idx)} : Mon)} := by
      funext i; exact Finsupp.support_single _ hl
    rw [hs, Fintype.piFinset_singleton, Finset.sum_singleton, wickSum_pair]
    simp only [kernelS, lineS, add_zero, partialDeriv_zero, hd, S, Finsupp.single_eq_same,
      Finset.prod_const, Finset.card_univ, Fintype.card_fin, idxOrder_zero, pow_zero, one_mul]
    have hn : ‖(EuclideanSpace.single (Fin.last 3) r : Spacetime)‖ = r := by
      simp [abs_of_nonneg hr.le]
    rw [hn]

end YangMills.FreeField
