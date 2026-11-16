/-
Probe377_v2.lean -- v1 plus section E (identity of the bound variables by FVarId, not by name; Scribe field types). Was: elaborated probe for hairer/humanise-yang-mills #377
(lem:ex-lattice-scribe-normalization-ratio, trace-scribe-producer.tex; #337 F1).
Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7 (sources read only);
oleans from ~/ym-release/full/tree/lib/lean (+ packages per ~/ym-release/full/checks/LEAN_PATH.txt).
Modeled on review_372_2026-11-14/probe/Probe372_v5.lean.

Question: does the source use ONE coupling / ONE scaling for the scribe's crown normalization
(q_i, BQ) and for the branch unit's crown (omega_i = beta_Z(k_i) r_i^4, `crown`)?

Sections:
  A. elaborated statements (#check @) and axioms of the declarations matched in the text lane
  B. constants mentioned in each statement's TYPE (filtered to the scale objects)
  C. definitional checks: crown = BQ * r^4, Hero = (BQ * r^4) • U⁻¹, ZoomValue (BQ) = U⁻¹ (crown • _),
     and lambda_i := Z.β (Stern V i) / BQ Z V i = 1 (the source's lambda)
  D. proof-term scan: inside blossoms / yields / Store_l / gang, which scale-carrying constants are
     applied, and to which bound variables (is it the same J, Z, V as the statement's?)
Nothing here is added to the release; the examples/theorems below live only in this probe's environment.
-/
import YM.TraceExtension.Chart.Line
import YM.TraceExtension.Chart.Time

set_option pp.proofs false

open Lean Meta Elab Command

/-! ## A. Statements and axioms -/
-- the one arch and its coupling
#check @YM.Trace.Terrace.Arch.β
#print YM.Trace.Terrace.Arch
#print YM.Trace.Terrace.steep
#print YM.Climb.Scaling
-- scribe side
#print YM.Trace.Over.BQ
#print YM.Trace.Over.ZoomValue
#print YM.Trace.Over.LogZoom
#print YM.Trace.Over.Year
#print YM.Trace.Over.Scribe
#check @YM.Trace.Over.YearP
#check @YM.Trace.Over.tweak
#check @YM.Trace.Over.zoom_BQ
#check @YM.Trace.Over.band_cost
#check @YM.Trace.Over.sum_delta
#check @YM.Trace.Over.yields
#check @YM.Trace.Over.blossoms
#check @YM.Trace.Over.Store_l
#print YM.Trace.Over.Gallery
-- branch side
#print YM.Trace.Terrace.Stern
#print YM.Trace.Terrace.crown
#print YM.Trace.Shelves.Hero
#print YM.Trace.Shelves.Phase4
#print YM.Trace.Terrace.Moment4
#check @YM.Trace.Terrace.unveil
#check @YM.Trace.Shelves.chartB
#check @YM.Trace.Shelves.nearing_h
#check @YM.Trace.Shelves.muteP
-- clock inputs
#check @YM.Trace.Terrace.gamut
#check @YM.Trace.Terrace.Barry
#check @YM.Trace.Terrace.holds
#check @YM.Trace.Terrace.dex
#check @YM.Trace.Terrace.measured

#print axioms YM.Trace.Over.YearP
#print axioms YM.Trace.Over.tweak
#print axioms YM.Trace.Over.zoom_BQ
#print axioms YM.Trace.Over.sum_delta
#print axioms YM.Trace.Over.yields
#print axioms YM.Trace.Over.blossoms
#print axioms YM.Trace.Over.Store_l
#print axioms YM.Trace.Over.gang
#print axioms YM.Trace.Shelves.nearing_h
#print axioms YM.Trace.Shelves.muteP
#print axioms YM.Trace.Terrace.unveil
#print axioms YM.Trace.Terrace.gamut
#print axioms YM.Trace.Terrace.Barry

/-! ## B. Constants mentioned in each statement's type (filtered) -/
def scaleKeys : List String :=
  ["Arch.β", "Terrace.crown", "Over.BQ", "Shelves.Hero", "Shelves.Phase4", "Scaling.r", "Scaling.U",
   "hatBeta", "Terrace.Stern", "Over.ZoomValue", "Over.Year", "Terrace.Moment4", "Over.LogZoom"]

def probeTypeConsts (n : Name) : CommandElabM Unit := do
  let env ← getEnv
  match env.find? n with
  | none => logInfo m!"NOT FOUND {n}"
  | some ci =>
    let cs := ci.type.getUsedConstants
    let hits := (cs.filter fun c => scaleKeys.any fun k => (c.toString.splitOn k).length > 1).toList.eraseDups
    logInfo m!"TYPE CONSTS of {n}: {hits}"

run_cmd (probeTypeConsts `YM.Trace.Over.YearP)
run_cmd (probeTypeConsts `YM.Trace.Over.tweak)
run_cmd (probeTypeConsts `YM.Trace.Over.zoom_BQ)
run_cmd (probeTypeConsts `YM.Trace.Over.yields)
run_cmd (probeTypeConsts `YM.Trace.Over.blossoms)
run_cmd (probeTypeConsts `YM.Trace.Over.Store_l)
run_cmd (probeTypeConsts `YM.Trace.Over.Scribe)
run_cmd (probeTypeConsts `YM.Trace.Over.Gallery)
run_cmd (probeTypeConsts `YM.Trace.Shelves.nearing_h)
run_cmd (probeTypeConsts `YM.Trace.Shelves.muteP)
run_cmd (probeTypeConsts `YM.Trace.Shelves.chartB)
run_cmd (probeTypeConsts `YM.Trace.Terrace.unveil)
run_cmd (probeTypeConsts `YM.Trace.Terrace.gamut)
run_cmd (probeTypeConsts `YM.Trace.Terrace.Barry)

/-! ## C. Definitional checks. Context opens copied from YM/TraceExtension/Chart/Stage.lean:5-10,35 at 3456e5e7. -/
set_option autoImplicit false
noncomputable section
namespace YM.Trace.Over
open Function Filter Lattice RG Wilson Labels Source Extra.Histories Bid MergeProof.Accent MergeProof
open Extraction Next.Rank.Price Next.Rank.East MergeProof.East Further.CorrectedLift Climb Analysis Work
open MeasureTheory
open Further.PhysicalPeriodLimitF933 Shunt Weir PhysicalNext.Repeat.Legato.Bandage Push.GridApprox Cells
open Relay Pull Terrace Terrace.Glade Perfect Turret Margin Slate Shelves
open scoped BigOperators Topology Matrix.Norms.Frobenius ContDiff Classical

-- C1. the branch unit's crown omega_i is the scribe's B_i = BQ Z V i times r_i^4, by definition
theorem probe_crown_eq_BQ {G:Gauge}{C:Family G}{S:Table C.book}
    (Z:Arch C)(J:Scaling S)(V:∀ i,Vane C i)(i:ℕ) :
    YM.Trace.Terrace.crown Z J (YM.Trace.Terrace.Stern V) 4 i = YM.Trace.Over.BQ Z V i * (J.r i)^4 := rfl

-- C2. the branch unit's pullback map Hero (P_i = omega_i U_i^{-1}) with BQ in place of beta_Z(k_i)
theorem probe_Hero_eq_BQ {G:Gauge}{C:Family G}{S:Table C.book}
    (Z:Arch C)(J:Scaling S)(V:∀ i,Vane C i)(i:ℕ) :
    YM.Trace.Shelves.Hero J V Z 4 i
      = (YM.Trace.Over.BQ Z V i * (J.r i)^4) • (J.U i 4).symm.toLinearMap := rfl

-- C3. the scribe's moving label ZoomValue J (BQ Z V) is U_i^{-1} applied after the branch crown
theorem probe_ZoomValue_eq_crown {G:Gauge}{C:Family G}{S:Table C.book}
    (Z:Arch C)(J:Scaling S)(V:∀ i,Vane C i)(v:S.Field 4)(i:ℕ) :
    YM.Trace.Over.ZoomValue J (YM.Trace.Over.BQ Z V) v i
      = (J.U i 4).symm (YM.Trace.Terrace.crown Z J (YM.Trace.Terrace.Stern V) 4 i • v) := rfl

-- C4. the source's lambda_i = beta_Z(k_i)/q_i is Z.β (Stern V i) / BQ Z V i, which is 1
theorem probe_lambda_one {G:Gauge}{C:Family G}
    (Z:Arch C)(V:∀ i,Vane C i)(i:ℕ)(hpos : 0 < Z.β (YM.Trace.Terrace.Stern V i)) :
    Z.β (YM.Trace.Terrace.Stern V i) / YM.Trace.Over.BQ Z V i = 1 := div_self hpos.ne'

end YM.Trace.Over
end

#print axioms YM.Trace.Over.probe_crown_eq_BQ
#print axioms YM.Trace.Over.probe_Hero_eq_BQ
#print axioms YM.Trace.Over.probe_ZoomValue_eq_crown
#print axioms YM.Trace.Over.probe_lambda_one

/-! ## D. Proof-term scan: applications of scale-carrying lemmas/defs and the bound variables they get. -/
def appTargets : List String :=
  ["Shelves.nearing_h", "Shelves.muteP", "Over.YearP", "Over.tweak", "Terrace.dex", "Terrace.measured",
   "Over.zoom_BQ", "Over.Store_l", "Over.leaderB", "Terrace.styling", "Terrace.gamut", "Terrace.Barry",
   "Over.sum_delta", "Shelves.Phase4", "Over.BQ", "Terrace.crown"]

partial def appScan (seen : IO.Ref (Array String)) (e : Expr) : MetaM Unit := do
  match e with
  | .lam n t b bi =>
      withLocalDecl n bi t fun x => appScan seen (b.instantiate1 x)
  | .forallE n t b bi =>
      withLocalDecl n bi t fun x => appScan seen (b.instantiate1 x)
  | .letE n t v b _ => do
      appScan seen v
      withLetDecl n t v fun x => appScan seen (b.instantiate1 x)
  | .mdata _ e => appScan seen e
  | .proj _ _ e => appScan seen e
  | .app .. =>
      e.withApp fun f args => do
        if let .const c _ := f then
          if appTargets.any (fun k => (c.toString.splitOn k).length > 1) then
            let mut fvs : Array String := #[]
            for a in args do
              if a.isFVar then
                let d ← a.fvarId!.getDecl
                let ty ← ppExpr d.type
                let tys := toString ty
                if (tys.splitOn "Scaling").length > 1 || (tys.splitOn "Arch").length > 1 ||
                   (tys.splitOn "Vane").length > 1 then
                  fvs := fvs.push s!"{d.userName.eraseMacroScopes} : {tys}"
            let line := s!"{c} <- {fvs}"
            let s ← seen.get
            unless s.contains line do
              seen.set (s.push line)
        appScan seen f
        for a in args do appScan seen a
  | _ => pure ()

def probeApps (n : Name) : CommandElabM Unit := liftTermElabM do
  let env ← getEnv
  match env.find? n with
  | none => logInfo m!"NOT FOUND {n}"
  | some ci =>
    match ci.value? (allowOpaque := true) with
    | none => logInfo m!"{n}: no value"
    | some v =>
      let seen ← IO.mkRef (#[] : Array String)
      -- also scan the statement so the statement's own binders are listed
      appScan seen ci.type
      appScan seen v
      let s ← seen.get
      logInfo m!"APPS in {n} ({s.size}):\n{String.intercalate "\n" s.toList}"

run_cmd (probeApps `YM.Trace.Over.blossoms)
run_cmd (probeApps `YM.Trace.Over.yields)
run_cmd (probeApps `YM.Trace.Over.Store_l)
run_cmd (probeApps `YM.Trace.Over.gang)

/-! ## E. Same check by FVarId: open the statement's forall telescope, instantiate the proof's lambda
telescope with the SAME free variables, and for each targeted application report whether each
Arch/Scaling/Vane argument is one of the statement's own binders (by FVarId) or something else. -/
partial def appScanId (outer : Array Expr) (seen : IO.Ref (Array String)) (e : Expr) : MetaM Unit := do
  match e with
  | .lam n t b bi =>
      withLocalDecl n bi t fun x => appScanId outer seen (b.instantiate1 x)
  | .forallE n t b bi =>
      withLocalDecl n bi t fun x => appScanId outer seen (b.instantiate1 x)
  | .letE n t v b _ => do
      appScanId outer seen v
      withLetDecl n t v fun x => appScanId outer seen (b.instantiate1 x)
  | .mdata _ e => appScanId outer seen e
  | .proj _ _ e => appScanId outer seen e
  | .app .. =>
      e.withApp fun f args => do
        if let .const c _ := f then
          if appTargets.any (fun k => (c.toString.splitOn k).length > 1) then
            let mut fvs : Array String := #[]
            for a in args do
              let ty ← inferType a
              let tys := toString (← ppExpr ty)
              if (tys.splitOn "Scaling").length > 1 || (tys.splitOn "Arch").length > 1 ||
                 (tys.splitOn "Vane").length > 1 then
                if a.isFVar then
                  match outer.findIdx? (· == a) with
                  | some k =>
                      let d ← a.fvarId!.getDecl
                      fvs := fvs.push s!"statement binder #{k} ({d.userName.eraseMacroScopes})"
                  | none =>
                      let d ← a.fvarId!.getDecl
                      fvs := fvs.push s!"INNER fvar {d.userName.eraseMacroScopes}"
                else
                  fvs := fvs.push s!"NON-FVAR term {← ppExpr a}"
            let line := s!"{c} <- {fvs}"
            let s ← seen.get
            unless s.contains line do
              seen.set (s.push line)
        appScanId outer seen f
        for a in args do appScanId outer seen a
  | _ => pure ()

def probeAppsId (n : Name) : CommandElabM Unit := liftTermElabM do
  let env ← getEnv
  match env.find? n with
  | none => logInfo m!"NOT FOUND {n}"
  | some ci =>
    match ci.value? (allowOpaque := true) with
    | none => logInfo m!"{n}: no value"
    | some v =>
      forallTelescope ci.type fun xs body => do
        let v' := v.beta xs
        let seen ← IO.mkRef (#[] : Array String)
        appScanId xs seen body
        appScanId xs seen v'
        let s ← seen.get
        logInfo m!"APPS-BY-ID in {n} (statement binders: {xs.size}; entries {s.size}):\n{String.intercalate "\n" s.toList}"

run_cmd (probeAppsId `YM.Trace.Over.blossoms)
run_cmd (probeAppsId `YM.Trace.Over.yields)
run_cmd (probeAppsId `YM.Trace.Over.Store_l)

-- Scribe's fields, by type
#check @YM.Trace.Over.Scribe.goal
#check @YM.Trace.Over.Scribe.clock
#check @YM.Trace.Over.Scribe.meters

/-! ## F (added for the #399 renewal, 2026-11-14; #print/#check only). The clock coupling:
the hatted coupling used by `gamut`, `holds`, `dex`, `muteP` and (in its proof) `zoom_BQ` is
`C.path.levels.clock.hatBeta`; print its definition and the structures that carry it. -/
#print YM.RG.Calendar.hatBeta
#print YM.RG.Levels
#check @YM.Trace.Over.zoom_BQ
