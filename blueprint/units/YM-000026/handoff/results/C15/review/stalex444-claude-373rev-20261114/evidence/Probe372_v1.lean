/-
Probe372.lean -- Lean-correspondence probe for hairer/humanise-yang-mills #372
(`manuscript/existence/trace-rounded-receipt.tex`, subsec:trace-rounded-receipt,
prop:trace-rounded-receipt), against the Lean release at 3456e5e7.

NOT RUN by its author. Intended invocation (from any directory):
  LEAN_PATH="<out>:$(cat ~/ym-release/full/checks/LEAN_PATH.txt)" \
    ~/.elan/toolchains/leanprover--lean4---v4.32.0/bin/lean -R . \
    -DmaxHeartbeats=0 -DmaxRecDepth=4096 Probe372.lean

Imports are release modules only (paths = YM/<...>.lean in the release tree).
Every command below only PRINTS; the three `example`s are definitional
unfoldings (`rfl`). A failure of one of them is a fact about the definitions,
to be read, not a probe-writing guarantee.

The private-name lookup scans only the constant list of ONE module
(the module that declares the private lemma). A whole-environment scan was
tried earlier on this machine and was killed after >10 min
(~/ym-release/full/checks/open_issues_probe/attack/A2.lean, header comment).
-/
import YM.TraceExtension.Prom.Zoom.Boats
import YM.TraceExtension.Prom.Order.State
import YM.TraceExtension.Prom.Orion.Suds
import YM.TraceExtension.Prom.Orion.Reach
import YM.TraceExtension.Prom.Orion.Plume
import YM.TraceExtension.Prom.Hill.Station
import YM.TraceExtension.Prom.Hill.Tuning
import YM.TraceExtension.Prom.Hill.Allowance
import YM.TraceExtension.Prom.Hill.Incoming
import YM.TraceExtension.Prom.Front.West.Lys
import YM.TraceExtension.Prom.Front.West.Tael
import YM.TraceExtension.Prom.Front.West.Equity
import YM.TraceExtension.Prom.Port.Soft.Denarii
import YM.Next.RANK.Allowance
import YM.Next.RANK.Station
import YM.Next.RANK.Tuning
import YM.Next.RANK.Prepaid
import YM.Next.UV_STRESS.Rates
import YM.MergeProof.East.Gran
import YM.MergeProof.East.Suds
import YM.Extraction.Round
import YM.Space.Configurations
import YM.Climb.Cells
import YM.Lattice.Site

set_option pp.proofs false

open Lean Meta Elab Command

/-- `n` ends with the components `suf` (compared as strings). -/
def probeSuffixMatch (n : Name) (suf : List String) : Bool :=
  let cs := n.components.map toString
  decide (suf.length ≤ cs.length) && cs.drop (cs.length - suf.length) == suf

/-- Log the type (and, if `withAxioms`, the axioms) of every constant of module
`mod` whose name ends with `suf`. Private names print as
`_private.<module>.0.<name>`. -/
def probeFindInModule (mod : Name) (suf : List String) (withAxioms : Bool := true) :
    CommandElabM Unit := do
  let env ← getEnv
  match env.getModuleIdx? mod with
  | none => logInfo m!"MODULE NOT LOADED: {mod}"
  | some idx =>
    let data := env.header.moduleData[idx.toNat]!
    let hits := data.constNames.filter (probeSuffixMatch · suf)
    if hits.isEmpty then logInfo m!"NO MATCH for {suf} in {mod}"
    for n in hits do
      match env.find? n with
      | none => logInfo m!"LISTED BUT NOT FOUND: {n}"
      | some ci =>
        let t ← liftTermElabM (ppExpr ci.type)
        logInfo m!"FOUND {n}\n  private: {isPrivateName n}\n  type:\n{t}"
        if withAxioms then
          let axs ← collectAxioms n
          logInfo m!"AXIOMS of {n}: {axs}"

/-! ## 1. The producer: private `await` (Boats.lean:31) -- prop:trace-rounded-receipt, first part -/
run_cmd probeFindInModule `YM.TraceExtension.Prom.Zoom.Boats ["MergeProof", "East", "await"]

/-! ## 2. (G3) itself and the selection (Boats.lean:21-88) -/
#print YM.MergeProof.East.SeqPair
#print YM.MergeProof.East.TimberSky
#check @YM.MergeProof.East.boatsSky
#print axioms YM.MergeProof.East.boatsSky
#check @YM.MergeProof.East.wakesSky
#print axioms YM.MergeProof.East.wakesSky
#print YM.MergeProof.East.Vane.checked
#check @YM.MergeProof.East.fliesSky
#print YM.MergeProof.East.LeapSky

/-! ## 3. Width clause: lem:trace-receipt-width (Prom/Orion/Suds.lean:35) and its definitions -/
#check @YM.MergeProof.East.open_readSky
#print axioms YM.MergeProof.East.open_readSky
#check @YM.MergeProof.East.authentic
#print axioms YM.MergeProof.East.authentic
#print YM.Next.Rank.Station.FitSky
#print YM.Next.Rank.Station.AllowedSky
#print YM.Next.Rank.Station.middleSky
#print YM.Next.Rank.Station.widthSky
#print YM.Next.Rank.Station.gainSky
#print YM.Next.Rank.Station.mag
#print YM.Next.Rank.Station.gap
#print YM.Next.Rank.Station.choose
#print YM.Next.Rank.Station.key
#print YM.Next.Rank.Station.tested
#check @YM.Next.Rank.Station.anchored
#check @YM.Next.Rank.Station.mag_rate
#print YM.Extraction.address
#print YM.Extraction.tag
#print YM.generic
#print YM.Points
#print YM.E4
#print YM.Lattice.Cover
#print YM.Climb.Scaling.window

/-! ## 4. Level budget (B): lava_vSky (Prom/Orion/Reach.lean:34) and its chain -/
#check @YM.MergeProof.East.lava_vSky
#print axioms YM.MergeProof.East.lava_vSky
#print YM.MergeProof.East.ArcSky
#print YM.MergeProof.East.PoisedSky
#check @YM.MergeProof.earningsSky
#print axioms YM.MergeProof.earningsSky
#check @YM.PhysicalNext.InteractingRank.Soft.y_readySky
#print axioms YM.PhysicalNext.InteractingRank.Soft.y_readySky
#check @YM.Next.Rank.Tapes.West.tenderlySky
#print axioms YM.Next.Rank.Tapes.West.tenderlySky
#print YM.PhysicalNext.InteractingRank.Soft.LegacyCostSky
#print YM.Next.Rank.Peak.ChargeSky
#print YM.Next.Rank.Ship.AllocatedSky
#print YM.Next.Rank.Ship.yardSky
#print YM.Next.Rank.Ship.invoiceSky
#print YM.Next.Rank.Ship.targetsSky
#print YM.Next.Rank.Tapes.Panel

/-! ## 5. lem:trace-receipt-cost: budget, its limit, the arity n = trays d, the cost 1/(i+1) -/
#print YM.Next.Rank.Ship.pot
#print YM.Next.Rank.Ship.allowance
#print YM.Next.Rank.Ship.budget
#check @YM.Next.Rank.Ship.diminishes
#print axioms YM.Next.Rank.Ship.diminishes
#check @YM.Next.Rank.Ship.fixed
#print YM.MergeProof.East.trays
#print YM.Next.UVStress.sizeHint
#print YM.Next.UVStress.costHint

example {G : YM.Gauge} (A : YM.RG.Levels G) (M k : ℕ) :
    YM.Next.Rank.Ship.budget A M k = Real.exp (-(Real.log (A.clock.monitor k) / (16 * (M : ℝ)))) := rfl
example (d : ℕ) : YM.MergeProof.East.trays d = d + 2 := rfl
example (k : ℕ) : YM.Next.UVStress.costHint k = ((k : ℝ) + 1)⁻¹ := rfl

/-! ## 6. "Supply of the level budget": couponSky (Port/Soft/Denarii.lean:31) and the non-trace rebate -/
#check @YM.PhysicalNext.InteractingRank.Soft.couponSky
#print axioms YM.PhysicalNext.InteractingRank.Soft.couponSky
#check @YM.Next.Rank.Ship.rebate
#print axioms YM.Next.Rank.Ship.rebate
#print YM.Next.Rank.Ship.Allocated

/-! ## 7. Name-resolution controls (unrelated declarations of the same short name exist) -/
run_cmd probeFindInModule `YM.MergeProof.East.Gran ["trays"] (withAxioms := false)
-- (logs MODULE NOT LOADED if Birth is not in the transitive imports; that is informative, not an error)
run_cmd probeFindInModule `YM.Next.UV_STRESS.Birth ["trays"] (withAxioms := false)
