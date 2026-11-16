/-
Probe384_v1.lean -- elaborated probe for the renewed review of hairer/humanise-yang-mills #384
(revision of manuscript/existence/trace-rounded-receipt.tex after review #383), Lean side.
Modelled on Probe372_v5.lean (review #383). Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7;
YM oleans from ~/ym-release/full/tree/lib/lean. Nothing here is added to the release; the theorems
below live only in this probe's environment.

Sections:
  A. definitions behind the revised supply paragraph (bank, protection, ticket, exCost, loopsPrice,
     baseBudget, ent, strength, HaarBudget, Meets, affordable, banking, uniform_loop, Calendar.monitor)
  B. depth: yardSky unfolds to the centered tiling at widthSky; FitSky.stencils statement
  C. (A)/C12: every PoisedSky witness, at its own level and with no level threshold, carries
     AllowedSky (hence dilation) and the ticket bound at slot n and root depth widthSky
  D. M1 (new route): mu_k >= 1 at every level; a_k <= gap; reduced threshold forces the level
  E. M4/(b): the trace witness's bracket field turns the eventual bank into a level threshold
     in k that does not depend on the chart (as in earningsSky, Tael.lean:69-84)
  F. M6: the slot of await / PoisedSky / AllocatedSky / budget is trays d; l <= trays d in boatsSky
-/
import YM.TraceExtension.Prom.Zoom.Boats
import YM.TraceExtension.Prom.Orion.Suds
import YM.TraceExtension.Prom.Orion.Reach
import YM.TraceExtension.Prom.Hill.Station
import YM.TraceExtension.Prom.Hill.Tuning
import YM.TraceExtension.Prom.Hill.Allowance
import YM.TraceExtension.Prom.Hill.Coordinates
import YM.TraceExtension.Prom.Port.Soft.Denarii
import YM.TraceExtension.Prom.Front.West.Tael
import YM.Next.RANK.Allowance
import YM.Next.RANK.StationMeter
import YM.Vac.Treasury
import YM.MergeProof.East.Gran

set_option pp.proofs false

/-! ## A. Definitions behind the supply paragraph -/
#print YM.Next.Rank.Ship.bank
#print YM.Next.Rank.protection
#print YM.Next.Rank.Station.ticket
#print YM.RG.Rep.exCost
#print YM.RG.PathData.loopsPrice
#print YM.RG.baseBudget
#print YM.Next.Rank.ent
#print YM.Next.Rank.strength
#print YM.Next.Rank.HaarBudget
#print YM.Next.Rank.Station.Meets
#check @YM.Next.Rank.Station.affordable
#print axioms YM.Next.Rank.Station.affordable
#check @YM.Next.Rank.Ship.banking
#print axioms YM.Next.Rank.Ship.banking
#check @YM.Vac.Numbers.uniform_loop
#print YM.RG.Calendar.monitor
#print YM.RG.Calendar.loopCap
#print YM.RG.Calendar.threshold

/-! ## B. Depth -/
#print YM.Next.Rank.Ship.yardSky
#check @YM.Next.Rank.Station.FitSky.stencils
#print axioms YM.Next.Rank.Station.FitSky.stencils
#check @YM.Next.Rank.Station.widerSky
#check @YM.Next.Rank.Station.beforeSky

section B
open YM YM.Next.Rank YM.Next.Rank.Station
theorem probe_yard_depth {G : Gauge} (C : Family G) {k N : ℕ} (b : ℝ) (hN : k ≤ N) (p : ℕ) :
    Ship.yardSky C b hN p =
      Cells.center C.S (m := widthSky C.path.levels b k) p
        (((widerSky C.path.levels b k).trans (beforeSky C.path.levels b k)).trans hN) 0 := rfl
end B
#print axioms probe_yard_depth

/-! ## C. (A) at every level of a witness; ticket at slot n and root depth -/
section C
open YM YM.Next.Rank YM.Next.Rank.Station YM.MergeProof.East
theorem probe_allowance_of_poised {G : Gauge} {C : Family G} {D : ℕ} {ι : Type}
    {P : ι → Tapes.Panel D} {B : YM.PhysicalNext.RankCovariance.Binding C} {H : C.Makes}
    {O : HaarBudget G} {J : YM.Precision.ChartRatio G} {n : ℕ} {z : ℝ} {k : ℕ}
    {T : ℕ → ℕ → TableL C D} (h : PoisedSky P B H O J n z k T) (χ : ι) :
    AllowedSky C.path.levels (P χ).arc k ∧
      mag C.path.levels (P χ).arc k * C.path.levels.clock.monitor k ^ 2
        ≤ C.path.levels.S.a (middleSky C.path.levels (P χ).arc k) / C.path.levels.S.a k ∧
      ticket O (C.path.levels.params (widthSky C.path.levels (P χ).arc k)) n
        ≤ Ship.pot C.path.levels n k := by
  obtain ⟨l, r, Q, -⟩ := h.supply χ
  have hA := Q.age.allot
  rw [(P χ).factor (C.path.levels.clock.J k)] at hA
  exact ⟨hA.permitted, hA.permitted.dilation, hA.charge⟩
end C
#print axioms probe_allowance_of_poised

/-! ## D. The new level-arrangement route (M1) over the release definitions -/
section D
open YM YM.Next.Rank YM.Next.Rank.Station
theorem probe_monitor_ge_one {G : Gauge} (A : YM.RG.Levels G) (k : ℕ) : 1 ≤ A.clock.monitor k :=
  Real.one_le_exp (sq_nonneg _)

theorem probe_a_le_gap {G : Gauge} (A : YM.RG.Levels G) (b : ℝ) (hb : 0 ≤ b) (k : ℕ) :
    A.S.a k ≤ gap A b k := by
  unfold gap mag
  exact le_mul_of_one_le_right (A.S.a_pos k).le (Real.one_le_rpow (probe_monitor_ge_one A k) hb)

theorem probe_lower_spacing {G : Gauge} (A : YM.RG.Levels G) :
    ∀ K : ℕ, ∃ c : ℝ, 0 < c ∧ ∀ j < K, c ≤ A.S.a j := by
  intro K
  induction K with
  | zero => exact ⟨1, one_pos, fun j hj => absurd hj (Nat.not_lt_zero j)⟩
  | succ K ih =>
    obtain ⟨c, hc, hj⟩ := ih
    refine ⟨min c (A.S.a K), lt_min hc (A.S.a_pos K), fun j hjK => ?_⟩
    rcases Nat.lt_succ_iff_lt_or_eq.mp hjK with h | h
    · exact (min_le_left _ _).trans (hj j h)
    · subst h; exact min_le_right _ _

/-- The note's reduced threshold: for every K and theta > 0 there is 0 < theta' <= theta such that
any chart whose radius gap A b k (b >= 0) is below theta' has level k >= K. -/
theorem probe_reduced_threshold {G : Gauge} (A : YM.RG.Levels G) (K : ℕ) (θ : ℝ) (hθ : 0 < θ) :
    ∃ θ' : ℝ, 0 < θ' ∧ θ' ≤ θ ∧ ∀ (b : ℝ) (k : ℕ), 0 ≤ b → gap A b k < θ' → K ≤ k := by
  obtain ⟨c, hc, hj⟩ := probe_lower_spacing A K
  refine ⟨min θ c, lt_min hθ hc, min_le_left _ _, fun b k hb hg => ?_⟩
  by_contra hk
  push_neg at hk
  have h1 := probe_a_le_gap A b hb k
  have h2 := hj k hk
  have h3 := min_le_right θ c
  linarith
end D
#print axioms probe_monitor_ge_one
#print axioms probe_a_le_gap
#print axioms probe_reduced_threshold

/-! ## E. bank at the root depth, chart-uniformly, from the bracket field (as in earningsSky) -/
#check @YM.RG.Calendar.Fits.deep
#check @YM.RG.Calendar.Fits.mono
section E
open YM YM.Next.Rank YM.Next.Rank.Station Filter
theorem probe_bank_at_root_depth {G : Gauge} (A : YM.RG.Levels G) (O : HaarBudget G) (h : G.Simple) :
    ∃ K : ℕ, ∀ k ≥ K, ∀ b : ℝ, AllowedSky A b k → Ship.bank O A (widthSky A b k) := by
  obtain ⟨u, hU⟩ := eventually_atTop.mp (Ship.banking A O h)
  obtain ⟨K, hK⟩ := eventually_atTop.mp (A.fits.deep.eventually_gt_atTop (A.clock.J u + 1))
  refine ⟨K, fun k hk b hb => hU _ ?_⟩
  by_contra! he
  have hh := hb.bracket (widthSky A b k) (le_refl _) ((widerSky ..).trans (beforeSky ..))
  have hv := A.fits.mono he.le
  have hk' := hK k hk
  omega
end E
#print axioms probe_bank_at_root_depth

/-! ## F. The slot M = trays d -/
#print YM.MergeProof.East.trays
#check @YM.Next.Rank.Ship.AllocatedSky
#check @YM.Next.Rank.Peak.ChargeSky.allot
#check @YM.PhysicalNext.InteractingRank.Soft.LegacyCostSky.age
example (d : ℕ) : 2 ≤ YM.MergeProof.East.trays d := by unfold YM.MergeProof.East.trays; omega
example (d : ℕ) : d ≤ YM.MergeProof.East.trays d := by unfold YM.MergeProof.East.trays; omega
