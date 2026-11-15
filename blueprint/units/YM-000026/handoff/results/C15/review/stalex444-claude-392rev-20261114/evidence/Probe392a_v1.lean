/-
Probe392a_v1.lean -- elaborated probe for the review of hairer/humanise-yang-mills #392
(subsec:ex-lattice-firesky-witness, manuscript/existence/trace-firesky-gallery.tex l.78-180 at 1e511906),
lane A: the definitions (middle level, root depth), the witness fields (F1)-(F5), the corrected
labels and lem:ex-lattice-firesky-solves.
Modelled on Probe395_v2.lean and Probe384_v3.lean. Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028
@ 3456e5e7; YM oleans from ~/ym-release/full/tree/lib/lean. Nothing here is added to the release;
the theorems below live only in this probe's environment and are restatements or direct
corollaries of release declarations.

Sections:
  A. statements: gainSky/middleSky/widthSky/leastL/wheelSky/AllowedSky; CorridorSky; AllocatedSky;
     ChargeSky; LaunchSky; LegacyCostSky; Calendar.{hatCoupling,monitor,coverSize,threshold};
     Perch.{y,M,walls,hot}; Novice; Ferm; Meets; Course.Uses; NylonSky; embroideredSky; ActumSky;
     PoisedSky; Charting; Tested; refUnit/unitVec/e0; StampDuty (T field); shrink; weightTag;
     Solves; solve; Tested.bijective; ladd; poured
  B. definitions: max of the empty set is 0; middleSky/widthSky thresholds written out
  C. (F3) numbers: budget radius = coverSize^2; threshold formula; hot <= monitor once loglog >= 1;
     Novice already carries threshold <= clock threshold (Meets.max_threshold)
  D. from a PoisedSky witness: (F2) plateau; (F3) lawful history for each N > k and p
  E. corrected labels: ladd solves and is the unique solution, from a PoisedSky witness
-/
import YM.TraceExtension.Prom.Orion.Plume
import YM.TraceExtension.Prom.Hill.Station
import YM.TraceExtension.Prom.Hill.ShapeS
import YM.TraceExtension.Prom.Hill.Allowance
import YM.TraceExtension.Prom.Hill.Incoming
import YM.TraceExtension.Prom.Hill.Ratchet
import YM.TraceExtension.Prom.Port.Soft.Coupons
import YM.TraceExtension.Prom.Front.West.Lys
import YM.TraceExtension.Prom.Front.West.Tael
import YM.MergeProof.East.Ladle
import YM.Next.RANK.Matrices
import YM.Next.RANK.Reign
import YM.Next.RANK.StationMeter

set_option pp.proofs false

/-! ## A. Statements -/
#print YM.Next.Rank.Station.gainSky
#print YM.Next.Rank.Station.middleSky
#print YM.Next.Rank.Station.widthSky
#print YM.Next.Rank.Station.mag
#print YM.Next.Rank.Station.leastL
#print YM.Next.Rank.Station.wheelSky
#print YM.Next.Rank.Station.AllowedSky
#print YM.Next.Rank.Tapes.CorridorSky
#print YM.Next.Rank.Ship.AllocatedSky
#print YM.Next.Rank.Ship.pot
#print YM.Next.Rank.Peak.ChargeSky
#print YM.Next.Rank.Tapes.LaunchSky
#print YM.PhysicalNext.InteractingRank.Soft.LegacyCostSky
#print YM.RG.Calendar.hatBeta
#print YM.RG.Calendar.hatCoupling
#print YM.RG.Calendar.monitor
#print YM.RG.Calendar.coverSize
#print YM.RG.Calendar.threshold
#print YM.Next.Rank.clim
#print YM.Next.Rank.Perch.y
#print YM.Next.Rank.Perch.M
#print YM.Next.Rank.Perch.walls
#print YM.Next.Rank.Perch.hot
#print YM.PhysicalNext.InteractingRank.Soft.Novice
#print YM.PhysicalNext.InteractingRank.Soft.Ferm
#print YM.Next.Rank.Station.Meets
#print YM.Next.Rank.Course.Uses
#print YM.PhysicalNext.InteractingRank.Soft.NylonSky
#check @YM.PhysicalNext.InteractingRank.Soft.embroideredSky
#print axioms YM.PhysicalNext.InteractingRank.Soft.embroideredSky
#print YM.MergeProof.ActumSky
#print YM.MergeProof.East.PoisedSky
#print YM.MergeProof.East.Charting
#print YM.Next.Rank.Price.Tested
#print YM.Family.refUnit
#print YM.Source.unitVec
#print YM.Labels.Frame.e0
#check @YM.Next.Rank.Ribbon.StampDuty.T
#print YM.Next.Rank.Price.awake
#print YM.Next.Rank.Price.shrink
#print YM.Next.Rank.Price.weightTag
#print YM.Next.Rank.Price.Solves
#check @YM.Next.Rank.Price.Tested.bijective
#print axioms YM.Next.Rank.Price.Tested.bijective
#check @YM.Next.Rank.Price.reference_size
#print axioms YM.Next.Rank.Price.reference_size
#check @YM.Next.Rank.Price.solve
#print axioms YM.Next.Rank.Price.solve
#check @YM.Next.Rank.Price.shrink_pos
#print YM.Next.Rank.East.ladd
#check @YM.Next.Rank.East.poured
#print axioms YM.Next.Rank.East.poured
#check @YM.Next.Rank.East.pure_start
#check @YM.Next.Rank.Station.gain_fee
#check @YM.Next.Rank.Station.gain_high

/-! ## B. The two levels -/
section B
open YM YM.Next.Rank YM.Next.Rank.Station

/-- max of the empty set is 0 -/
theorem probe_gain_empty (T : YM.RG.Schedule) (i : ℕ) (r : ℝ)
    (h : ∀ j ≤ i, ¬ r ≤ T.a j / T.a i) : gainSky T i r = 0 := by
  unfold gainSky
  rw [Finset.filter_false_of_mem (fun j hj => h j (Nat.le_of_lt_succ (Finset.mem_range.mp hj)))]
  rfl

/-- the middle level: threshold m * mu_k^2 with m = mu_k^b -/
theorem probe_middle_formula {G : Gauge} (A : YM.RG.Levels G) (b : ℝ) (k : ℕ) :
    middleSky A b k = gainSky A.S k (A.clock.monitor k ^ b * A.clock.monitor k ^ 2) := rfl

/-- the root depth: threshold c_k^10 relative to the middle level, c_k = ceil((log hatBeta_k)^2) -/
theorem probe_width_formula {G : Gauge} (A : YM.RG.Levels G) (b : ℝ) (k : ℕ) :
    widthSky A b k = gainSky A.S (middleSky A b k)
      ((Nat.ceil ((Real.log (A.clock.hatBeta k)) ^ 2) : ℕ) : ℝ) ^ 10 := rfl

theorem probe_wheel_formula {G : Gauge} (A : YM.RG.Levels G) (k : ℕ) :
    wheelSky A k = ((min (A.clock.factor (A.clock.J k)) (A.clock.factor (A.clock.J k - 1))).val : ℝ) := rfl
end B
#print axioms probe_gain_empty

/-! ## C. (F3) numbers -/
section C
open YM YM.Next.Rank YM.Next.Rank.Station

/-- budget radius walls(hatBeta_j) = ceil((log hatBeta_j)^2)^2 = coverSize_j^2 -/
theorem probe_walls_cover {G : Gauge} (A : YM.RG.Levels G) (j : ℕ) :
    Perch.walls (A.clock.hatBeta j) = (A.clock.coverSize j) ^ 2 := rfl

/-- threshold of a Novice representation, written out -/
theorem probe_novice_threshold {G : Gauge} {C : Family G} {N p k i : ℕ}
    {c : Course C N p k} {P : YM.RG.Rep G (C.side i p)} {h : i ≤ N}
    (hN : YM.PhysicalNext.InteractingRank.Soft.Novice c i P h) :
    P.p.threshold = (Real.sqrt (C.path.levels.clock.hatBeta i))⁻¹ *
      Real.exp ((Real.log (Real.log (C.path.levels.clock.hatBeta i))) ^ ((3:ℝ)/2)) :=
  hN.threshold

/-- once loglog s >= 1 the healthy allowance is at most the monitor -/
theorem probe_hot_le_monitor (s : ℝ) (hs : 1 ≤ Real.log (Real.log s)) :
    Perch.hot s ≤ Real.exp ((Real.log (Real.log s)) ^ 2) := by
  unfold Perch.hot Perch.y
  apply Real.exp_le_exp.mpr
  have h1 := Real.rpow_le_rpow_of_exponent_le hs (show ((3:ℝ)/2) ≤ 2 by norm_num)
  simpa [Real.rpow_two] using h1

/-- hence the representation threshold is at most the clock threshold once loglog >= 1 -/
theorem probe_rep_le_clock {G : Gauge} (A : YM.RG.Calendar G) (j : ℕ)
    (hs : 1 ≤ Real.log (Real.log (A.hatBeta j))) :
    A.hatCoupling j * Perch.hot (A.hatBeta j) ≤ A.threshold j := by
  unfold YM.RG.Calendar.threshold YM.RG.Calendar.monitor
  apply mul_le_mul_of_nonneg_left (probe_hot_le_monitor _ hs)
  unfold YM.RG.Calendar.hatCoupling; positivity

/-- a Novice already carries threshold <= clock threshold, clip, cap 4 hatBeta, delta <= 1, loop cap -/
theorem probe_novice_meets {G : Gauge} {C : Family G} {N p k i : ℕ}
    {c : Course C N p k} {P : YM.RG.Rep G (C.side i p)} {h : i ≤ N}
    (hN : YM.PhysicalNext.InteractingRank.Soft.Novice c i P h) :
    P.p.threshold ≤ C.path.levels.clock.threshold i ∧
    P.clip = (C.path.levels.params i).clip ∧ P.beta ≤ 4 * C.path.levels.clock.hatBeta i ∧
    ∃ Λ δ : ℝ, δ ≤ 1 ∧ Λ ≤ C.path.levels.clock.loopCap i := by
  obtain ⟨-, ⟨σ, g, Λ, δ, w, hM, -⟩⟩ := hN.chand
  exact ⟨hM.max_threshold, hM.same, hM.cap, Λ, δ, hM.cap_E, hM.loopCap⟩
end C
#print axioms probe_hot_le_monitor
#print axioms probe_rep_le_clock
#print axioms probe_novice_meets

/-! ## D. From a PoisedSky witness: (F1) (F2) (F4) and (F3) -/
section D
open YM YM.Next.Rank YM.Next.Rank.Station YM.MergeProof.East YM.PhysicalNext.InteractingRank.Soft

/-- (F2): plateau on [w,k] -/
theorem probe_plateau_of_poised {G : Gauge} {C : Family G} {D : ℕ} {ι : Type} [Fintype ι]
    {P : ι → Tapes.Panel D} {B : YM.PhysicalNext.RankCovariance.Binding C} {H : C.Makes}
    {O : HaarBudget G} {J : YM.Precision.ChartRatio G} {n : ℕ} {z : ℝ} {k : ℕ}
    {T : ℕ → ℕ → TableL C D} (h : PoisedSky P B H O J n z k T) (χ : ι) :
    ∀ i, widthSky C.path.levels (P χ).arc k ≤ i → i ≤ k →
      C.path.levels.clock.hatBeta k / 2 ≤ C.path.levels.clock.hatBeta i ∧
      C.path.levels.clock.hatBeta i ≤ C.path.levels.clock.hatBeta k := by
  obtain ⟨l, r, Q, -⟩ := h.supply χ
  have hc := Q.moves.coup
  rw [(P χ).factor (C.path.levels.clock.J k)] at hc
  intro i hi hk
  exact hc.court i hi hk

/-- (F3): for each N > k and p, representations on [w,k] along the course, each a Novice -/
theorem probe_history_of_poised {G : Gauge} {C : Family G} {D : ℕ} {ι : Type} [Fintype ι]
    {P : ι → Tapes.Panel D} {B : YM.PhysicalNext.RankCovariance.Binding C} {H : C.Makes}
    {O : HaarBudget G} {J : YM.Precision.ChartRatio G} {n : ℕ} {z : ℝ} {k : ℕ}
    {T : ℕ → ℕ → TableL C D} (h : PoisedSky P B H O J n z k T) (χ : ι) (N p : ℕ) (hk : k < N) :
    ∃ (c : Course C N p k) (R : (i : ℕ) → YM.RG.Rep G (C.side i p)),
      ∀ i (hw : widthSky C.path.levels (P χ).arc k ≤ i) (hi : i ≤ k), Novice c i (R i) (hi.trans c.allow) := by
  obtain ⟨l, r, L, hL⟩ := h.supply χ
  obtain ⟨V, hA, -⟩ := hL N p hk
  obtain ⟨R, -, hW⟩ := hA.acts
  have hb : 0 ≤ ((P χ).bag (C.path.levels.clock.J k)).band := by
    rw [(P χ).factor]; linarith only [(P χ).huge, Nat.cast_nonneg (α := ℝ) D]
  have hX := embroideredSky B J _ _ H L.hours L.token L.moves R hW hb
  refine ⟨_, R, fun i hw hi => hX.use_ i ?_ hi⟩
  rw [(P χ).factor]; exact hw
end D
#print axioms probe_plateau_of_poised
#print axioms probe_history_of_poised

/-! ## E. Corrected labels: from a PoisedSky witness, ladd solves and is the unique solution -/
section E
open YM YM.Next.Rank YM.Next.Rank.Station YM.MergeProof.East YM.Next.Rank.Price YM.Next.Rank.East

theorem probe_corrected_label_of_poised {G : Gauge} {C : Family G} {D : ℕ} {ι : Type} [Fintype ι]
    {P : ι → Tapes.Panel D} {B : YM.PhysicalNext.RankCovariance.Binding C} {H : C.Makes}
    {O : HaarBudget G} {J : YM.Precision.ChartRatio G} {n : ℕ} {z : ℝ} {k : ℕ}
    {T : ℕ → ℕ → TableL C D} (h : PoisedSky P B H O J n z k T) (b : ℝ)
    (N p : ℕ) (hk : k < N) (d : Fin (D+1)) (e : C.label d) :
    Function.Bijective (T N p d) ∧
    Solves C (mag C.path.levels b k) d k N p (T N p d) e
      (ladd C (mag C.path.levels b k) k N p d (T N p d) e) ∧
    ∀ u, Solves C (mag C.path.levels b k) d k N p (T N p d) e u →
      u = ladd C (mag C.path.levels b k) k N p d (T N p d) e := by
  have hr : C.ref d ≤ k := h.early d (Nat.le_of_lt_succ d.isLt)
  have ht := (h.charts N p hk d).1
  refine ⟨Tested.bijective C H hr hk.le _ ht, poured H hr hk.le _ _ ht e, fun u hu => ?_⟩
  obtain ⟨w, -, hw⟩ := solve C H hr hk.le ht e (mag C.path.levels b k)
  exact (hw u hu).trans (hw _ (poured H hr hk.le _ _ ht e)).symm
end E
#print axioms probe_corrected_label_of_poised
