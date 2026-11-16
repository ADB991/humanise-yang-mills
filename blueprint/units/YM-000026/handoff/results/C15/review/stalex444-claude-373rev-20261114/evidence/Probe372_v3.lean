/-
Probe372_v3.lean -- third (v2 with two syntax/tactic fixes:
  run_cmd argument lists on one line; h16 by positivity). Was: second elaborated probe for hairer/humanise-yang-mills #372.
Complements Probe372_v1.lean (= the text-level lane's Probe372.lean, run unchanged).
Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7; oleans from ~/ym-release/full/tree/lib/lean.

Sections:
  A. remaining signatures / axioms (AllowedSky.dilation, Ship.fixed axioms, mag_rate, Axis, bank, ticket, Ferm, estimateSky)
  B. R4: proof-term scan of open_readSky (is the exponent-1 hypothesis used?)
  C. R4: control copy of the open_readSky proof (with both filters) and a variant with the exponent-1 filter dropped
  D. which release constants the proof terms of await / open_readSky / boatsSky actually reference
  E. the note's explicit cost step (lem:trace-receipt-cost) against Ship.budget, as a checked example
Nothing here is added to the release; the theorems below live only in this probe's environment.
-/
import YM.TraceExtension.Prom.Zoom.Boats
import YM.TraceExtension.Prom.Orion.Suds
import YM.TraceExtension.Prom.Orion.Reach
import YM.TraceExtension.Prom.Hill.Station
import YM.TraceExtension.Prom.Hill.Tuning
import YM.TraceExtension.Prom.Hill.Allowance
import YM.TraceExtension.Prom.Port.Soft.Denarii
import YM.Next.RANK.Allowance
import YM.MergeProof.East.Gran
import YM.MergeProof.East.Suds

set_option pp.proofs false

open Lean Meta Elab Command

/-! ## A. Remaining signatures and axioms -/
#check @YM.Next.Rank.Station.AllowedSky.dilation
#print axioms YM.Next.Rank.Station.AllowedSky.dilation
#print axioms YM.Next.Rank.Ship.fixed
#print axioms YM.Next.Rank.Ship.budget
#print axioms YM.Next.Rank.Station.mag_rate
#print axioms YM.Next.Rank.Station.anchored
#print YM.Axis
#check @YM.Next.Rank.Ship.bank
#check @YM.Next.Rank.Station.ticket
#check @YM.PhysicalNext.InteractingRank.Soft.Ferm
#check @YM.Next.Rank.Ship.estimateSky
#check @YM.Next.Rank.Ship.AllocatedSky.charge
#check @YM.Next.Rank.Ship.Allocated.charge

/-! ## B. Proof-term scan of open_readSky.
Walk the elaborated proof term; at every lambda binder whose (macro-scope-erased) name
starts with `hv` or `hp`, report its type and whether the body refers to it
(`hasLooseBVar 0` on the body = the bound hypothesis occurs in the term). -/
partial def probeScan (e : Expr) : MetaM Unit := do
  match e with
  | .lam n t b bi =>
      let s := n.eraseMacroScopes.toString
      if s.startsWith "hv" || s.startsWith "hp" then
        let used := b.hasLooseBVar 0
        let tp ← ppExpr t
        logInfo m!"BINDER {n.eraseMacroScopes} : {tp}\n  occurs in body: {used}"
      withLocalDecl n bi t fun x => probeScan (b.instantiate1 x)
  | .letE n t v b _ =>
      probeScan v
      withLetDecl n t v fun x => probeScan (b.instantiate1 x)
  | .app f a => do probeScan f; probeScan a
  | .mdata _ e => probeScan e
  | .proj _ _ e => probeScan e
  | _ => pure ()

run_cmd liftTermElabM do
  let env ← getEnv
  match env.find? `YM.MergeProof.East.open_readSky with
  | some (.thmInfo ti) =>
      logInfo m!"open_readSky: theorem value found; scanning"
      probeScan ti.value
  | some _ => logInfo m!"open_readSky: not a theorem"
  | none => logInfo m!"open_readSky: NOT FOUND"

/-! ## D. Release constants referenced by the proof terms (filtered to the objects of the note). -/
def probeUses (n : Name) (keys : List String) : CommandElabM Unit := do
  let env ← getEnv
  match env.find? n with
  | none => logInfo m!"NOT FOUND {n}"
  | some ci =>
    match ci.value? with
    | none => logInfo m!"{n}: no value"
    | some v =>
      let cs := v.getUsedConstants
      let hits := cs.filter fun c => keys.any fun k => (c.toString.splitOn k).length > 1
      let hits := hits.toList.eraseDups
      logInfo m!"USES of {n} (filtered): {hits}"

def awaitName : Name :=
  ((((Name.mkNum `_private.YM.TraceExtension.Prom.Zoom.Boats 0).str "YM").str "MergeProof").str "East").str "await"

run_cmd (probeUses awaitName ["lava_vSky", "open_readSky", "diminishes", "AllowedSky", "permitted", "allot", "Panel.factor", "trays", "budget", "SeqPair", "eventually_all", "ge_mem_nhds", "costHint"])
run_cmd (probeUses `YM.MergeProof.East.open_readSky ["AllowedSky", "mag_rate", "authentic", "anchored", "gap_pos", "scales_wild", "rpow_two", "norm_apply_le"])
run_cmd (probeUses `YM.MergeProof.East.boatsSky ["await", "supply_wheel", "fliesSky", "LeapSky", "TimberSky", "Eventually.exists", "trays"])

/-! ## C. R4 by re-elaboration: a control copy of open_readSky's proof (both filters),
and a variant that drops the exponent-1 filter. Context copied from
YM/TraceExtension/Prom/Orion/Suds.lean:14-23 at 3456e5e7. -/
set_option autoImplicit false
noncomputable section
namespace YM.MergeProof.East
open Function Filter Set MeasureTheory Lattice Wilson RG Marker Source Extra.Histories
open Extraction Bid Push Next.Extract Dash Cells Next.Rank Next.Rank.Tapes PhysicalNext.RankCovariance
   PhysicalNext.InteractingRank PhysicalNext.InteractingRank.Soft Next.Rank.Price Precision
open Org Spec PhysicalNext.Repeat.Legato.Bandage
open Next.Rank Next.Rank.Tapes.West Perch Atlas Station Cells Edition Glyph Rise Alarm Paint Vac.Numbers
open Next.Rank.East Further.CorrectedLift
open scoped Topology Matrix.Norms.Frobenius BigOperators Classical ContDiff
open Analysis Next.UVStress Climb Ward

-- C1. control: verbatim proof body of open_readSky (Suds.lean:38-48), under a probe name
theorem probe_open_readSky_control {G : Gauge} (h : G.Simple) (R:ℝ)(V:Levels G)(m:ℕ):
    ∀ᶠ k:ℕ in atTop, ∀ b, AllowedSky V b k → ∀ x:Fin m→ Cover,
    let y:= tag (mag V b k)⁻¹ x
    y ∈ generic m→ ‖y‖ ≤ R→ FitSky V b k y:=by
   filter_upwards [(mag_rate V h (show (0:ℝ)<1 from zero_lt_one)).eventually_ge_atTop 1,(mag_rate V h (show (0:ℝ)<2 by norm_num)).eventually_ge_atTop (8*R)] with k hv hp b hx x y hg ht
   have he:= (authentic (V:=V) (k:=k) (b:=b) x).2
   have hq : Next.Rank.Station.key V b k y=gap V b k • y := by rw [Next.Rank.Station.anchored,show Next.Rank.Station.tested V b k y=y from he]
   have hv : 0<gap V b k:=gap_pos ..
   constructor
   · rw [hq]; exact scales_wild hv _ hg
   intro i j; rw [hq]; change |gap V b k * y i j| ≤ _; rw [abs_mul,abs_of_pos hv]
   have he: |y i j| ≤ R:= (PiLp.norm_apply_le (y i) j).trans ((PiLp.norm_apply_le y i).trans ht)
   have hB : 8*R ≤ V.clock.monitor k^2:=by apply le_trans hp; exact (Real.rpow_two _).le
   have hP:=hx.dilation; rw [le_div_iff₀ (V.S.a_pos _)] at hP; unfold gap at *
   linarith only [hP,mul_le_mul_of_nonneg_left ((show 8* _ ≤ V.clock.monitor k ^ 2 from (mul_le_mul_of_nonneg_left he (by norm_num : (0:ℝ)≤8)).trans hB)) hv.le]

-- C2. variant: the exponent-1 filter (μ_k ≥ 1) is removed; everything else verbatim
theorem probe_open_readSky_no_exp1 {G : Gauge} (h : G.Simple) (R:ℝ)(V:Levels G)(m:ℕ):
    ∀ᶠ k:ℕ in atTop, ∀ b, AllowedSky V b k → ∀ x:Fin m→ Cover,
    let y:= tag (mag V b k)⁻¹ x
    y ∈ generic m→ ‖y‖ ≤ R→ FitSky V b k y:=by
   filter_upwards [(mag_rate V h (show (0:ℝ)<2 by norm_num)).eventually_ge_atTop (8*R)] with k hp b hx x y hg ht
   have he:= (authentic (V:=V) (k:=k) (b:=b) x).2
   have hq : Next.Rank.Station.key V b k y=gap V b k • y := by rw [Next.Rank.Station.anchored,show Next.Rank.Station.tested V b k y=y from he]
   have hv : 0<gap V b k:=gap_pos ..
   constructor
   · rw [hq]; exact scales_wild hv _ hg
   intro i j; rw [hq]; change |gap V b k * y i j| ≤ _; rw [abs_mul,abs_of_pos hv]
   have he: |y i j| ≤ R:= (PiLp.norm_apply_le (y i) j).trans ((PiLp.norm_apply_le y i).trans ht)
   have hB : 8*R ≤ V.clock.monitor k^2:=by apply le_trans hp; exact (Real.rpow_two _).le
   have hP:=hx.dilation; rw [le_div_iff₀ (V.S.a_pos _)] at hP; unfold gap at *
   linarith only [hP,mul_le_mul_of_nonneg_left ((show 8* _ ≤ V.clock.monitor k ^ 2 from (mul_le_mul_of_nonneg_left he (by norm_num : (0:ℝ)≤8)).trans hB)) hv.le]

-- C3. the note's width lemma in its explicit (non-eventual) form, from the dilation field alone:
-- (A) + μ_k^2 ≥ 8R at a fixed level k ⇒ fit.  No R>0, no μ_k ≥ 1, no other AllowedSky field.
theorem probe_width_explicit {G : Gauge} (V:Levels G) (R b:ℝ) (k m:ℕ)
    (hA : mag V b k * V.clock.monitor k ^ 2 ≤ V.S.a (middleSky V b k) / V.S.a k)
    (hB : 8*R ≤ V.clock.monitor k^2) (x:Fin m→ Cover) :
    let y:= tag (mag V b k)⁻¹ x
    y ∈ generic m→ ‖y‖ ≤ R→ FitSky V b k y:=by
   intro y hg ht
   have he:= (authentic (V:=V) (k:=k) (b:=b) x).2
   have hq : Next.Rank.Station.key V b k y=gap V b k • y := by rw [Next.Rank.Station.anchored,show Next.Rank.Station.tested V b k y=y from he]
   have hv : 0<gap V b k:=gap_pos ..
   constructor
   · rw [hq]; exact scales_wild hv _ hg
   intro i j; rw [hq]; change |gap V b k * y i j| ≤ _; rw [abs_mul,abs_of_pos hv]
   have he: |y i j| ≤ R:= (PiLp.norm_apply_le (y i) j).trans ((PiLp.norm_apply_le y i).trans ht)
   have hP:=hA; rw [le_div_iff₀ (V.S.a_pos _)] at hP; unfold gap at *
   linarith only [hP,mul_le_mul_of_nonneg_left ((show 8* _ ≤ V.clock.monitor k ^ 2 from (mul_le_mul_of_nonneg_left he (by norm_num : (0:ℝ)≤8)).trans hB)) hv.le]

end YM.MergeProof.East
end

#print axioms YM.MergeProof.East.probe_open_readSky_control
#print axioms YM.MergeProof.East.probe_open_readSky_no_exp1
#print axioms YM.MergeProof.East.probe_width_explicit

/-! ## E. lem:trace-receipt-cost, explicit form, against the release's Ship.budget.
For ε > 0 and μ_k ≥ ε^(-16M): budget A M k ≤ ε. (The note also assumes ε ≤ 1; not needed.) -/
theorem probe_cost_explicit {G : YM.Gauge} (A : YM.RG.Levels G) (M k : ℕ) (hM : 0 < M)
    (ε : ℝ) (hε : 0 < ε) (hμ : ε ^ (-(16 * (M:ℝ))) ≤ A.clock.monitor k) :
    YM.Next.Rank.Ship.budget A M k ≤ ε := by
  have hpos : 0 < ε ^ (-(16 * (M:ℝ))) := Real.rpow_pos_of_pos hε _
  have hlog : Real.log (ε ^ (-(16 * (M:ℝ)))) ≤ Real.log (A.clock.monitor k) :=
    Real.log_le_log hpos hμ
  rw [Real.log_rpow hε] at hlog
  have h16 : (0:ℝ) < 16 * (M:ℝ) := by positivity
  have key : -(Real.log (A.clock.monitor k) / (16 * (M:ℝ))) ≤ Real.log ε := by
    rw [neg_le, le_div_iff₀ h16]
    nlinarith [hlog]
  unfold YM.Next.Rank.Ship.budget YM.Next.Rank.Ship.pot
  calc Real.exp (-(Real.log (A.clock.monitor k) / (16 * (M:ℝ))))
      ≤ Real.exp (Real.log ε) := Real.exp_le_exp.mpr key
    _ = ε := Real.exp_log hε

#print axioms probe_cost_explicit
