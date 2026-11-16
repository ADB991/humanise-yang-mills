import FreeField.Analytic
import FreeField.Reconstruction

/-!
# Free-field witness, module A2 (data): the Fock host

All data of the host are defined here by explicit formulas; see `FreeField/DESIGN.md` section 5.

* Host space: `⨁_k L²((ℝ⁴)^k, mu^{⊗k})` as the unweighted `lp` direct sum.
  **Normalisation:** the `k`-particle component of a word vector is its amplitude divided by
  `sqrt (k!)`, so that `‖Ψ‖² = ∑_k (1/k!) ‖amplitude_k‖²`.
* Word vectors: the amplitude with `k` open legs is a sum over *open matchings*: involutions of
  `Fin k ⊕ Leg m` without fixed points, never pairing two external slots or two legs of one
  vertex. External slot `j` carries the momentum `p j`, entering the vertex it is attached to.
* Operators on the host (translations, Lorentz transformations, spectral projections) all have
  the form `ψ_k ↦ c_k · (ψ_k ∘ T_k)`; they are defined through one totalised constructor `fockOp`.

Totalised definitions (`if h : … then … else 0`) are used wherever a definition would otherwise
need a proof of integrability or boundedness; the corresponding facts are lemmas of
`FreeField.Theory`.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-! ## The host space -/

/-- The `k`-particle sector (no symmetrisation). -/
abbrev Sector (k : ℕ) : Type := Lp ℂ 2 (Measure.pi fun _ : Fin k => mu)

/-- The carrier of the host: square-summable sequences of sector vectors. -/
abbrev FockCarrier : Type := lp (fun k : ℕ => Sector k) 2

/-- The host Hilbert space. -/
abbrev fockSpace : HilbertSpace := ⟨FockCarrier⟩

/-- Total momentum of `k` particles. -/
def totalMom {k : ℕ} (p : Fin k → Spacetime) : Spacetime := ∑ j, p j

/-! ## Open matchings and word amplitudes -/

variable {n : ℕ}

/-- External slots and legs. -/
abbrev OLeg (k : ℕ) (m : Fin n → Mon) : Type := Fin k ⊕ Leg m

/-- The vertex of an open leg; the external slots form the vertex `0`, earlier than all others. -/
def ovtx {k : ℕ} {m : Fin n → Mon} : OLeg k m → Fin (n + 1) :=
  Sum.elim (fun _ => 0) fun ℓ => ℓ.1.succ

/-- The multi-index of an open leg (`0` for an external slot; not used for those). -/
def oidx {k : ℕ} {m : Fin n → Mon} : OLeg k m → Idx :=
  Sum.elim (fun _ => 0) Leg.idx

/-- Open matchings: every external slot is paired with a leg, the remaining legs are paired among
themselves, without self-lines. -/
abbrev OMatching (k : ℕ) (m : Fin n → Mon) : Type :=
  {σ : Equiv.Perm (OLeg k m) // (∀ ℓ, σ (σ ℓ) = ℓ) ∧ ∀ ℓ, ovtx (σ ℓ) ≠ ovtx ℓ}

/-- The internal lines of an open matching, each represented by its earlier leg. -/
abbrev ILine {k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) : Type :=
  {ℓ : Leg m // ovtx (Sum.inr ℓ : OLeg k m) < ovtx (σ.1 (Sum.inr ℓ))}

/-- Momentum entering the vertex `v`: incoming internal lines minus outgoing internal lines plus
the external momenta attached to `v`. -/
def openMomentum {k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) (q : ILine σ → Spacetime)
    (p : Fin k → Spacetime) (v : Fin n) : Spacetime :=
  (∑ ℓ : ILine σ, if ovtx (σ.1 (Sum.inr ℓ.1)) = v.succ then q ℓ else 0) -
    (∑ ℓ : ILine σ, if ℓ.1.1 = v then q ℓ else 0) +
    ∑ j : Fin k, if ovtx (σ.1 (Sum.inl j)) = v.succ then p j else 0

/-- The amplitude of the word of monomials `m` with tests `f` to produce `k` particles of momenta
`p`. For one letter `{β}` and `k = 1` this is `Bmono β p * fourierE f p`. -/
def openAmp (m : Fin n → Mon) (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) : ℂ :=
  ∑ σ : OMatching k m, ∫ q : ILine σ → Spacetime,
    (∏ ℓ : ILine σ, Amono ℓ.1.idx (q ℓ) * Bmono (oidx (σ.1 (Sum.inr ℓ.1))) (q ℓ) *
        (weight (q ℓ) : ℂ)) *
      (∏ j : Fin k, Bmono (oidx (σ.1 (Sum.inl j))) (p j)) *
      ∏ v : Fin n, fourierE (f v) (openMomentum σ q p v)

/-- Multilinear extension of the amplitude to labels. -/
def openAmpL (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction) (k : ℕ)
    (p : Fin k → Spacetime) : ℂ :=
  ∑ μ ∈ Fintype.piFinset (fun i => (P i).support), (∏ i, P i (μ i)) * openAmp μ f k p

/-- Words in the letters (label, test); the head is the outermost field. -/
abbrev Word : Type := List ((Mon →₀ ℂ) × TestFunction)

/-- The labels of a word. -/
def Word.lab (w : Word) : Fin w.length → (Mon →₀ ℂ) := fun i => (w.get i).1

/-- The tests of a word. -/
def Word.test (w : Word) : Fin w.length → TestFunction := fun i => (w.get i).2

/-- The Wightman function of a word. -/
def wightW (w : Word) : ℂ := wightmanL w.lab w.test

/-- The amplitude of a word. -/
def openAmpW (w : Word) (k : ℕ) (p : Fin k → Spacetime) : ℂ := openAmpL w.lab w.test k p

/-- The `k`-particle component of the word vector: the amplitude divided by `sqrt (k!)`. -/
def psiComp (w : Word) (k : ℕ) : Sector k :=
  if h : MemLp (openAmpW w k) 2 (Measure.pi fun _ : Fin k => mu) then
    (((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ) • h.toLp (openAmpW w k)
  else 0

/-- The word vector `Φ(A₁,f₁) ⋯ Φ(A_n,f_n) Ω` in the host. -/
def Psi (w : Word) : FockCarrier :=
  if h : Memℓp (psiComp w) 2 then ⟨psiComp w, h⟩ else 0

/-! ## Operators of multiplication and composition type -/

/-- On the `k`-particle sector: `ψ ↦ c · (ψ ∘ T)`. -/
def sectorMap (k : ℕ) (c : (Fin k → Spacetime) → ℂ)
    (T : (Fin k → Spacetime) → (Fin k → Spacetime)) (ψ : Sector k) : Sector k :=
  if h : MemLp (fun p => c p * (ψ : (Fin k → Spacetime) → ℂ) (T p)) 2
      (Measure.pi fun _ : Fin k => mu) then h.toLp _ else 0

/-- The sectorwise map on the host. -/
def fockMap (c : ∀ k : ℕ, (Fin k → Spacetime) → ℂ)
    (T : ∀ k : ℕ, (Fin k → Spacetime) → (Fin k → Spacetime)) (ψ : FockCarrier) :
    FockCarrier :=
  if h : Memℓp (fun k => sectorMap k (c k) (T k) (ψ k)) 2 then ⟨_, h⟩ else 0

/-- The sectorwise map as a bounded operator (when it is one: `c` measurable and bounded, `T`
measure preserving; see `fockOp_apply`). -/
def fockOp (c : ∀ k : ℕ, (Fin k → Spacetime) → ℂ)
    (T : ∀ k : ℕ, (Fin k → Spacetime) → (Fin k → Spacetime)) : (FockCarrier →L[ℂ] FockCarrier) :=
  if h : ∃ L : (FockCarrier →L[ℂ] FockCarrier), ∀ ψ, L ψ = fockMap c T ψ then h.choose else 0

/-- The phase `exp (i ⟪a, p₁ + ⋯ + p_k⟫)`. -/
def phase (a : Spacetime) (k : ℕ) (p : Fin k → Spacetime) : ℂ :=
  Complex.exp (Complex.I * ((⟪a, totalMom p⟫_ℝ : ℝ) : ℂ))

/-- Translations on the host. -/
def transOp (a : Spacetime) : (FockCarrier →L[ℂ] FockCarrier) := fockOp (phase a) fun _ => id

/-- Spectral projections on the host: multiplication by the indicator of `p₁ + ⋯ + p_k ∈ B`,
and `0` for non-measurable `B`. -/
def projOp (B : Set Spacetime) : (FockCarrier →L[ℂ] FockCarrier) :=
  if MeasurableSet B then fockOp (fun _ p => if totalMom p ∈ B then 1 else 0) fun _ => id else 0

/-- The energy–momentum distribution of a host vector. -/
def diagMeasure (ψ : FockCarrier) : Measure Spacetime :=
  Measure.sum fun k : ℕ =>
    ((Measure.pi fun _ : Fin k => mu).withDensity fun p =>
      ENNReal.ofReal (‖(ψ k : (Fin k → Spacetime) → ℂ) p‖ ^ 2)).map
      totalMom

end YangMills.FreeField
