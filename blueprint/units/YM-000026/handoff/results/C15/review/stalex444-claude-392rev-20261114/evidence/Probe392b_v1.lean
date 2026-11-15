/-
Probe392b_v1.lean -- elaborated probe for the review of hairer/humanise-yang-mills #392 (lane B):
lem:ex-lattice-firesky-clock-fields and the wheel-bound remark of
manuscript/existence/trace-firesky-gallery.tex at 1e511906 (l.245-341), plus one re-check of the
chamber lemma's key pairing (FitSky.stencils; merged record stalex444-claude-395rev-20261114).
Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7; YM oleans from
~/ym-release/full/tree/lib/lean. Modelled on Probe395_v2.lean / Probe384_v3.lean. Nothing here is
added to the release; the theorems below live only in this probe's environment and are
restatements or direct corollaries of release declarations.

Sections:
  A. the clock: Calendar.hatBeta/monitor/coverSize, Schedule.a/scale, Fits.sameFactor,
     Schedule.block_large, Supply.Large/Rolls/Wait/Paid
  B. the witness fields: AllowedSky, leastL/wheelSky, gainSky/middleSky/widthSky, mag,
     Tapes.CorridorSky, Soft.ShelterSky
  C. the producer: Soft.slackSky (private), Soft.atlasSky, Soft.forwardSky; want/bump/more/stretch
  D. probe theorems: the lemma's three items from a ShelterSky witness (plateau 1/2 from warm 3/4);
     the clock restated (a = exp(-s), s_(m+1) = s_m + log L_(J(m+1)), hatBeta);
     the source's depth count `more` is the comparison L^t >= c_k^10;
     the wheel bound from Paid.lengths and Large.size (>= 3)
  E. the chamber lemma's key pairing: FitSky.stencils (re-check only)
-/
import YM.TraceExtension.Prom.Order.Road
import YM.TraceExtension.Prom.Hill.ShapeS
import YM.TraceExtension.Prom.Hill.Coordinates
import Batteries.Tactic.OpenPrivate

set_option pp.proofs false

/-! ## A. The clock -/
#print YM.RG.Calendar.hatBeta
#print YM.RG.Calendar.monitor
#print YM.RG.Calendar.coverSize
#print YM.Schedule.a
#print YM.Schedule.scale
#check @YM.Schedule.scale_succ
#check @YM.Schedule.a_step
#check @YM.Schedule.block_large
#check @YM.RG.Calendar.Fits.sameFactor
#check @YM.RG.Calendar.Fits.delayed
#check @YM.RG.Calendar.Fits.mono
#check @YM.RG.Calendar.Fits.stepSlow
#print YM.RG.Supply.Large
#print YM.RG.Supply.Rolls
#print YM.RG.Supply.Wait
#print YM.RG.Supply.Paid

/-! ## B. The witness fields -/
#print YM.Next.Rank.Station.AllowedSky
#print YM.Next.Rank.Station.leastL
#print YM.Next.Rank.Station.wheelSky
#print YM.Next.Rank.Station.gainSky
#print YM.Next.Rank.Station.middleSky
#print YM.Next.Rank.Station.widthSky
#print YM.Next.Rank.Station.mag
#print YM.Next.Rank.Atlas.clim
#check @YM.Next.Rank.Station.gain_high
#check @YM.Next.Rank.Station.gain_fee
#print YM.Next.Rank.Tapes.CorridorSky
#print YM.PhysicalNext.InteractingRank.Soft.ShelterSky

/-! ## C. The producer -/
open private slackSky from YM.TraceExtension.Prom.Order.Graph
#check @slackSky
#print axioms slackSky
#check @YM.PhysicalNext.InteractingRank.Soft.atlasSky
#print axioms YM.PhysicalNext.InteractingRank.Soft.atlasSky
#check @YM.PhysicalNext.InteractingRank.Soft.forwardSky
#print axioms YM.PhysicalNext.InteractingRank.Soft.forwardSky
#print YM.PhysicalNext.InteractingRank.Soft.runTicket
#print YM.PhysicalNext.InteractingRank.Soft.stretch
#print YM.Next.Rank.Station.want
#print YM.Next.Rank.Station.bump
#print YM.Next.Rank.Station.more
#check @YM.Next.Rank.Station.wanted
#check @YM.PhysicalNext.InteractingRank.Soft.office

/-! ## D. Probe theorems -/
section D
open YM YM.RG YM.Next.Rank YM.Next.Rank.Station YM.PhysicalNext.InteractingRank.Soft

/-- The lemma's items 1-3 (dilation, depth, bracket, plateau with constant 1/2) from a
`ShelterSky` witness; the 1/2 plateau follows from the source's 3/4 `warm`. -/
theorem probe_items_of_shelter {G : Gauge} {A : Levels G} {k : ℕ} {u : ℝ}
    (h : ShelterSky A k u) :
    (mag A u k * A.clock.monitor k ^ 2 ≤ A.S.a (middleSky A u k) / A.S.a k) ∧
    ((A.clock.coverSize k : ℝ) ^ (10:ℕ) ≤ A.S.a (widthSky A u k) / A.S.a (middleSky A u k)) ∧
    (∀ j, widthSky A u k ≤ j → j ≤ k → A.clock.J k - 1 ≤ A.clock.J j) ∧
    (∀ j, widthSky A u k ≤ j → j ≤ k →
      A.clock.hatBeta k / 2 ≤ A.clock.hatBeta j ∧ A.clock.hatBeta j ≤ A.clock.hatBeta k) := by
  refine ⟨h.covers.dilation, h.covers.depth, h.covers.bracket, fun j hw hk => ?_⟩
  have hh := h.warm j hw hk
  have h1 : 3/4 * A.clock.hatBeta k ≤ A.clock.hatBeta j := hh.1
  have h2 : A.clock.hatBeta j ≤ A.clock.hatBeta k := hh.2
  have hpos : 0 < A.clock.hatBeta k := lt_trans zero_lt_one (A.fits.delayed k)
  exact ⟨by linarith, h2⟩

/-- The clock as the lemma restates it: a_m = exp(-s_m). -/
theorem probe_a_exp {G : Gauge} (A : Levels G) (m : ℕ) :
    A.S.a m = Real.exp (-(A.S.scale m)) := by
  rw [Schedule.scale, Real.exp_neg, Real.exp_log (inv_pos.2 (A.S.a_pos m)), inv_inv]

/-- s_(m+1) = s_m + log L_(J(m+1)). -/
theorem probe_scale_step {G : Gauge} (A : Levels G) (m : ℕ) :
    A.S.scale (m+1) = A.S.scale m + Real.log ((A.clock.factor (A.clock.J (m+1))).val : ℝ) := by
  rw [A.S.scale_succ, A.fits.sameFactor m]

/-- hatBeta_m = bar + s_G * s_m. -/
theorem probe_hat {G : Gauge} (A : Levels G) (m : ℕ) :
    A.clock.hatBeta m = A.clock.bar + G.slopeConstant * A.S.scale m := rfl

/-- The source's depth count: `more L s` at s = hatBeta_k is the least t with c_k^10 <= L^t. -/
theorem probe_more_cover {G : Gauge} (A : Levels G) (L : ℝ) (k : ℕ) :
    more L (A.clock.hatBeta k) = want L ((A.clock.coverSize k : ℝ) ^ (10:ℕ)) := rfl

theorem probe_more_spec {G : Gauge} (A : Levels G) {L : ℝ} (hL : 1 < L) (k : ℕ) :
    (A.clock.coverSize k : ℝ) ^ (10:ℕ) ≤ L ^ (more L (A.clock.hatBeta k)) := by
  have hc : (0:ℝ) < (A.clock.coverSize k : ℝ) := by exact_mod_cast (A.budget k).B_pos
  exact (wanted hL (pow_pos hc 10) _).2 le_rfl

/-- The wheel bound: under `Paid`, every clock factor is at least 3 (`Large.size`), so the
smaller of the factors of stages J(k) and J(k)-1 is at least 3. -/
theorem probe_wheel_three {G : Gauge} {X : Supply.Sheet G} {D : Supply.Rolls X}
    {R : Supply.Protection D} {E : Supply.Delays R} {Z : Supply.Bar E} {W : Supply.Wait Z}
    {A : Levels G} (h : Supply.Paid W A) (k : ℕ) : (3:ℝ) ≤ wheelSky A k := by
  unfold wheelSky leastL
  rw [h.lengths]
  rcases min_choice (D.L (A.clock.J k)) (D.L (A.clock.J k - 1)) with hm | hm <;> rw [hm] <;>
    exact_mod_cast (D.large _).size
end D
#print axioms probe_items_of_shelter
#print axioms probe_a_exp
#print axioms probe_scale_step
#print axioms probe_hat
#print axioms probe_more_cover
#print axioms probe_more_spec
#print axioms probe_wheel_three

/-! ## E. Chamber lemma: re-check of the key pairing of the merged record 395rev -/
#check @YM.Next.Rank.Station.FitSky.stencils
#print axioms YM.Next.Rank.Station.FitSky.stencils
