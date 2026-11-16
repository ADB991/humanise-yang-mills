/-
Probe395_v2.lean -- second run (v1 with YM.Axis for Lattice.Axis and the depth proof of probe_side_odd written out). Was: elaborated probe for the review of hairer/humanise-yang-mills #395
(lem:ex-lattice-firesky-chamber, trace-firesky-gallery.tex l.188-233 at 29f27cdb), Lean side.
Modelled on Probe384_v3.lean (review of #384). Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028
@ 3456e5e7; YM oleans from ~/ym-release/full/tree/lib/lean. Nothing here is added to the release;
the theorems below live only in this probe's environment and are restatements or direct
corollaries of release declarations.

Sections:
  A. statements: FitSky (fields), middleSky/widthSky/gainSky, choose/key, FitSky.margin,
     FitSky.stencils, the private lemmas lifted_costSky/spread_costSky/interiorsSky,
     Extraction.Around.figure, Tiling.fits_stencil, margin/chamber/Kind, center, Interior,
     footprint, LocalOn/Agrees, trueLength, the consumer Trace.Verse.seat
  B. the fitness bound is a_k * choose against a_(middleSky)/8 (the lemma's a_l/8)
  C. the depth-w centered tiling: side q with a_N * q = a_w, q odd, link kind, chamber = closed
     home cell (coordinate from base < q)
  D. the stencil step of interiorsSky: a_N * 8(|z|+1) <= a_w gives |z| < q/8
  E. FitSky.stencils with the eventual set taken before the fit point (uniform in x), assembled
     from interiorsSky, FitSky.margin and Around.figure exactly as the release's proof does
-/
import YM.TraceExtension.Prom.Hill.Station
import YM.TraceExtension.Prom.Hill.Tuning
import YM.TraceExtension.Prom.Hill.Coordinates
import YM.TraceExtension.Verse.Pears
import YM.Extraction.Held
import Batteries.Tactic.OpenPrivate

set_option pp.proofs false

/-! ## A. Statements -/
#print YM.Next.Rank.Station.FitSky
#check @YM.Next.Rank.Station.FitSky.usable
#check @YM.Next.Rank.Station.FitSky.deep
#print YM.Next.Rank.Station.gainSky
#print YM.Next.Rank.Station.middleSky
#print YM.Next.Rank.Station.widthSky
#print YM.Next.Rank.Station.choose
#print YM.Next.Rank.Station.key
#print YM.Extraction.address
#print YM.Extraction.tag
#check @YM.Next.Rank.Station.FitSky.margin
#print axioms YM.Next.Rank.Station.FitSky.margin
#check @YM.Next.Rank.Station.FitSky.stencils
#print axioms YM.Next.Rank.Station.FitSky.stencils

open private lifted_costSky spread_costSky interiorsSky from YM.TraceExtension.Prom.Hill.Coordinates
#check @lifted_costSky
#check @spread_costSky
#check @interiorsSky
#print axioms interiorsSky

#check @YM.Extraction.Around.figure
#print axioms YM.Extraction.Around.figure
#check @YM.Cells.Tiling.fits_stencil
#print axioms YM.Cells.Tiling.fits_stencil
#print YM.Cells.Tiling.margin
#print YM.Cells.Tiling.chamber
#print YM.Cells.Tiling.coordinated
#print YM.Cells.Kind.Strict
#print YM.Cells.Kind.shift
#print YM.Cells.center
#print YM.Cells.location
#print YM.Cells.Interior
#print YM.Source.SectionData.footprint
#print YM.Lattice.LocalOn
#print YM.Lattice.Agrees
#check @YM.Cells.trueLength
#check @YM.Trace.Verse.seat
#print axioms YM.Trace.Verse.seat

/-! ## B. Fitness: a_k * choose against a_(middleSky)/8 -/
section B
open YM YM.Next.Rank YM.Next.Rank.Station
theorem probe_key_scale {G : Gauge} (a : YM.RG.Levels G) (b : ℝ) (k : ℕ) {n : ℕ} (x : Points n)
    (i : Fin n) (j : YM.Axis) :
    key a b k x i j = a.S.a k * (choose a b k x i j : ℝ) := rfl

theorem probe_fit_middle {G : Gauge} {a : YM.RG.Levels G} {b : ℝ} {k n : ℕ} {x : Points n}
    (h : FitSky a b k x) (i : Fin n) (j : YM.Axis) :
    |a.S.a k * (choose a b k x i j : ℝ)| ≤ a.S.a (middleSky a b k) / 8 :=
  h.deep i j
end B
#print axioms probe_key_scale
#print axioms probe_fit_middle

/-! ## C. The centered tiling at depth widthSky -/
section C
open YM YM.Next.Rank YM.Next.Rank.Station
variable {G : Gauge} (F : Family G) (b : ℝ) {k N : ℕ} (hN : k ≤ N) (p : ℕ)

theorem probe_side_scale :
    F.S.a N * ((Cells.center F.S (m := widthSky F.path.levels b k) p
      (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) 0).side.val : ℝ)
      = F.S.a (widthSky F.path.levels b k) :=
  Cells.trueLength F.S _ 0

theorem probe_side_odd :
    Odd (Cells.center F.S (m := widthSky F.path.levels b k) p
      (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) 0).side.val :=
  F.S.toDepth_odd (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) p

theorem probe_kind_link :
    (Cells.center F.S (m := widthSky F.path.levels b k) p
      (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) 0).kind
      = Cells.Kind.link := rfl

theorem probe_chamber_closed (y : Lattice.Site (F.side N p)) :
    let T := Cells.center F.S (m := widthSky F.path.levels b k) p
      (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) 0
    y ∈ T.chamber 0 ↔ ∀ i : YM.Axis, (y i - T.starts 0 i).val < T.side.val := Iff.rfl
end C
#print axioms probe_side_scale
#print axioms probe_side_odd
#print axioms probe_kind_link
#print axioms probe_chamber_closed

/-! ## D. The stencil step of interiorsSky (Coordinates.lean:146-148), restated -/
section D
open YM YM.Next.Rank YM.Next.Rank.Station
theorem probe_stencil_step {G : Gauge} (F : Family G) (b : ℝ) {k N : ℕ} (hN : k ≤ N) (p z : ℕ)
    (hh : F.S.a N * ((8 * (z + 1) : ℕ) : ℝ) ≤ F.S.a (widthSky F.path.levels b k)) :
    z < (Cells.center F.S (m := widthSky F.path.levels b k) p
      (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) 0).side.val / 8 := by
  have ht := hh.trans_eq (probe_side_scale F b hN p).symm
  have hv : 8 * (z + 1) ≤ (Cells.center F.S (m := widthSky F.path.levels b k) p
      (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) 0).side.val := by
    exact_mod_cast (le_of_mul_le_mul_left ht (F.S.a_pos N))
  omega
end D
#print axioms probe_stencil_step

/-! ## E. FitSky.stencils with the eventual set chosen before the fit point -/
section E
open YM YM.Next.Rank YM.Next.Rank.Station Filter
theorem probe_stencils_uniform {G : Gauge} {F : Family G} {k n : ℕ} {b : ℝ}
    (hp : F.Makes) (d : ℕ) :
    ∀ᶠ N : ℕ in atTop, ∃ hN : k ≤ N, ∀ (x : Points n), FitSky F.path.levels b k x →
      ∀ (p : ℕ) (i : Fin n) (v : F.label d),
        Cells.Interior
          ((Cells.center F.S (m := widthSky F.path.levels b k) p
              (((widerSky F.path.levels b k).trans (beforeSky F.path.levels b k)).trans hN) 0).chamber 0)
          (F.O N p v (Cells.location F.S k N p (choose F.path.levels b k x i))) := by
  filter_upwards [interiorsSky (F := F) (k := k) (b := b) d] with N H
  obtain ⟨hn, hv⟩ := H
  exact ⟨hn, fun x h p i v => Extraction.Around.figure hp _ ⟨_, v⟩ _ _ (h.margin p hn i) (hv p)⟩
end E
#print axioms probe_stencils_uniform
