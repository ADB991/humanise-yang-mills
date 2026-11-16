/-
Probe427_v1.lean -- elaborated probe for the renewed review of hairer/humanise-yang-mills draft PR #427
(commit dae5af1f, answering review #426 of #392; manuscript/existence/trace-firesky-gallery.tex,
subsec:ex-lattice-firesky-witness, l.78-365 at dae5af1f), Lean-correspondence side.
Modelled on Probe392a_v3.lean (record stalex444-claude-392rev-20261114). Release:
~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7. Nothing here is added to the release; this
file only prints release declarations (no probe theorems).

Prints:
  M1: FitSky.stencils (the existential k <= N and the eventual form)
  M2: PoisedSky (field early), TimberSky (field early), Tested.bijective (hk, hn)
  stamp duty: StampDuty (the structure)
  wheel: AllowedSky.large, leastL, wheelSky
  axioms: FitSky.stencils, Tested.bijective
-/
import YM.TraceExtension.Prom.Orion.Plume
import YM.TraceExtension.Prom.Zoom.Boats
import YM.TraceExtension.Prom.Hill.Station
import YM.TraceExtension.Prom.Hill.Coordinates
import YM.Next.RANK.Matrices
import YM.Next.RANK.Tilt

set_option pp.proofs false

/-! ## M1 -/
#check @YM.Next.Rank.Station.FitSky.stencils
#print axioms YM.Next.Rank.Station.FitSky.stencils

/-! ## M2 -/
#print YM.MergeProof.East.PoisedSky
#check @YM.MergeProof.East.PoisedSky.early
#print YM.MergeProof.East.TimberSky
#check @YM.MergeProof.East.TimberSky.early
#check @YM.Next.Rank.Price.Tested.bijective
#print axioms YM.Next.Rank.Price.Tested.bijective

/-! ## Stamp duty -/
#print YM.Next.Rank.Ribbon.StampDuty

/-! ## Wheel -/
#check @YM.Next.Rank.Station.AllowedSky.large
#print YM.Next.Rank.Station.leastL
#print YM.Next.Rank.Station.wheelSky
