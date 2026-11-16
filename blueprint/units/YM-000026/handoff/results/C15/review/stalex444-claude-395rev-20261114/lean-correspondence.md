# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded review of PR #395 for #394.
- Role: Lean correspondence
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): a text-level read of the source counterpart named by the author record and of the declarations it is built from, and an elaboration probe (two runs); for each finding, one independent re-derivation and one author's-advocate refutation. Where the two checks of a finding disagreed, the point was settled at the source lines, and the item says how. Agreement between agents is not offered as evidence.
- Content SHA-256: per-file SHA-256 in `hashes.json`; the 15 source files hashed equal `Lean/SOURCES.sha256` at `29f27cdb` and the release checkout at `3456e5e7`.
- Manuscript files and labels: `manuscript/existence/trace-firesky-gallery.tex` (`lem:ex-lattice-firesky-chamber` and its proof, l.188–234); the Correspondence section of the author record `results/C15/author/hairer-claude-394-20261114/README.md` (l.17–24).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: #394; reviewed PR #395 (commit `29f27cdb`); this report is added by its own pull request.
- Outcome: changes requested, by the one change of mathematics.md M1: the source counterpart `FitSky.stencils` states k ≤ N, and the lemma omits it (L5). No other mismatch was found. The lemma's chamber-local conclusion matches the source; with the explicit mesh condition (weaker than the source's when Z_d is the largest coordinate of a nonempty stencil), the uniformity in the fit point and "strictly inside", the lemma says more than the source (L6, L8, L10). The record's pairing is correct; L13 (Minor) concerns the author record only.

The reviewed files are those of commit `29f27cdb` (they entered the base branch unchanged with the merge `394f7ea4`); line numbers of the gallery are those at `29f27cdb`, and its definitions from #393 are read as the lemma's interface, not reviewed.

## What was elaborated and what was not

- **Elaborated.** Probe files `evidence/Probe395_v1.lean` and `Probe395_v2.lean` were elaborated with Lean 4.32.0 (toolchain `leanprover/lean4:v4.32.0`), with the YM `.olean` files of `3456e5e7` from the compiled release archive used by #383 and review #384 (`ym-build-3456e5e.tgz`, SHA-256 `07c145c3…`, equal to `source/build.md` l.37, as recorded in #383's validation) and the Mathlib and other dependency `.olean` files from a local Lake package cache, using `lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>` (command and resources in `evidence/RUNLOG.txt` and validation.md). The release sources were read and hashed, not placed on `LEAN_PATH`. v1 exited 1 with four errors (three uses of `Lattice.Axis` for the release name `YM.Axis`, and one depth proof not synthesized); `sorryAx` appears in its output only in the axioms of the four probe theorems that failed. v2 corrects both and exited 0 with 0 errors and 0 warnings; `sorryAx` does not occur in its output. `evidence/Probe395_v2.out` (cited below as "v2 l.N") contains the elaborated statements of the declarations in the table, `#print axioms` for `FitSky.margin`, `FitSky.stencils`, `interiorsSky`, `Around.figure`, `fits_stencil` and `Trace.Verse.seat`, and eight probe theorems (`probe_key_scale`, `probe_fit_middle`, `probe_side_scale`, `probe_side_odd`, `probe_kind_link`, `probe_chamber_closed`, `probe_stencil_step`, `probe_stencils_uniform`); each printed axiom list is `[propext, Classical.choice, Quot.sound]` (v2 l.42, 54, 76–78, 85, 90, 170–178). The probe's own theorems were checked by Lean's kernel as they were elaborated. They restate release declarations or assemble them; the private lemmas are reached with Batteries `open private`.
- **What the probe shows.** The probe elaborates the statements of `FitSky.stencils` and the declarations it is built from, and kernel-checks eight probe theorems restating or directly assembling release declarations; it does not formalise the lemma's explicit mesh condition.
- **Hidden instances and coercions.** The printed elaborated types in `Probe395_v2.out` fix implicit arguments, instances and name resolution for the listed declarations (v1 failed on one name, `Lattice.Axis` for `YM.Axis`). This is inspection of printed types for the listed declarations, not an exhaustive instance audit.
- **Not done.** The release's proofs were loaded from compiled files and not replayed by an independent kernel checker (no `leanchecker`); nothing was built from source (no `lake`); Mathlib was not rebuilt. The extracted files were not re-verified one by one against the archive, and the dependency `.olean` files were not independently verified (N6).
- **Already in review #384.** The identification of the depth of the chamber condition with the root depth is in review #384: `results/C15/review/stalex444-claude-384rev-20261114/lean-correspondence.md`, L16, with `probe_yard_depth` and `probe_chamber_depth` (`evidence/Probe384_v3.out` l.90–112 there; `probe_chamber_depth` restates `FitSky.stencils` at depth `widthSky`). v2 l.43–54 repeats the statement of `FitSky.stencils`.

The record names the counterpart and its pieces; the pairings below follow it. Paths are relative to `Lean/YM/`; `Hill/` abbreviates `TraceExtension/Prom/Hill/`, and "Coordinates" is `Hill/Coordinates.lean`.

## Findings and evidence

| # | Declaration (file:line) | Manuscript counterpart | Verdict | Evidence |
|---|---|---|---|---|
| L1 | `FitSky.deep` (`Hill/Tuning.lean:17`; the structure `FitSky` at :15), `key`, `choose` (`Next/RANK/Tuning.lean:20–22`) | fitness, l.191–193 | Matches: \|a_k·choose\| ≤ a_(middleSky)/8, with `choose` = ⌈x·m⌉ and `key` = a_k·`choose`. ℓ = `middleSky` and w = `widthSky` rest on the #393 definitions (gallery l.95–97, of the shape of `gainSky`) and on the #374 endpoint record §2 | Elaborated, v2 l.1–35; `probe_key_scale`, `probe_fit_middle` (v2 l.171–172) |
| L2 | `Cells.center` (`Cells/Packing.lean:34`), `Cells.trueLength`, `toDepth_odd` | q = a_w/a_N odd, l.209–211 | Matches: a_N·side = a_(widthSky); side odd | Elaborated, v2 l.109–113, 140–141; `probe_side_scale`, `probe_side_odd` (v2 l.173–174) |
| L3 | `Tiling.chamber` (`Cells/Tiling.lean:36`), `Kind.Strict` (`Cells/Cut.lean:31–33`) | home cell \|u_α\| ≤ (q−1)/2, l.211–213 | Matches: link kind; chamber 0 is the set of sites whose offset from the base is < q on every axis, with base 0 − ⌊q/2⌋ | Elaborated, v2 l.94–95, 99–113; `probe_kind_link`, `probe_chamber_closed` (v2 l.175–176) |
| L4 | `lifted_costSky` (Coordinates:28), `spread_costSky` (:85), `FitSky.margin` (:101) | \|u_α\| ≤ q/8 with w ≤ ℓ, l.214–218 | Matches: 8\|offset\| ≤ q at level N, using a_(middleSky) ≤ a_(widthSky); the source states it as membership of `T.margin 0 (side/8)` | Elaborated, v2 l.36–42, 55–66 |
| L5 | `FitSky.stencils` (Coordinates:150), `interiorsSky` (:132; `eventually_ge_atTop k` at :142), `Cells.location` (`Cells/Packing.lean:65`) | range of N, l.195–198; l.213 | Mismatch: the source has `∃ hN : k≤N`, and `location` is 0 unless k ≤ N; the lemma omits N ≥ k (mathematics.md M1) | Elaborated, v2 l.43–54, 67–78, 114–115 |
| L6 | `interiorsSky` (:132–148) | a_N(Z_d+2) < 3a_w/8, l.196–198 | No counterpart; manuscript stronger. The source states only "eventually in N"; its internal sufficient condition (:138) implies the manuscript's when Z_d is the largest coordinate of a nonempty stencil | Elaborated, v2 l.67–78; `probe_stencil_step` (v2 l.177) |
| L7 | `SectionData.stencil`, `footprint` (`Source/Local.lean:104, :114`), `Agrees`, `LocalOn` (`Lattice/Path.lean:192–197`) | stencil links u+s, u+s+e, l.219–221 | Consistent: locality concerns links with both endpoints in the set; the source also pays the +1 (`8*(\|z\|+1)`, :138) | Elaborated, v2 l.128–139 |
| L8 | `Around.figure` (`Extraction/Held.lean:21–23`), `fits_stencil` (`Cells/Proximity.lean:86`), `Cells.Interior` | chamber-local domain, l.199–202, l.227–229 | Matches: `Interior (T.chamber 0)` = gauge invariant, measurable, local on the chamber, bounded. "Strictly inside": manuscript stronger | Elaborated, v2 l.79–90, 116–127 |
| L9 | `FitSky.stencils` (:150) | every p, every grade-d label, c = 0, 1 | Matches for p and labels; source stronger for sites (∀ i : Fin n; the consumer uses n = 2) | Elaborated, v2 l.43–53 |
| L10 | `FitSky.stencils` (:150), `interiorsSky` (`omit h in`, :131) | uniformity in the fit point, l.232–233 | Manuscript stronger than `stencils` as stated; follows from `interiorsSky` | Elaborated; `probe_stencils_uniform` (v2 l.178) |
| L11 | consumer `TraceExtension/Verse/Pears.lean:41` (`h.stencils w.cutoff d`, with `eventually_gt_atTop k`) | (G4) and its consumer, comparison l.234–238 | Matches: per fit point, N > k | Elaborated, `Trace.Verse.seat` v2 l.142–170 |
| L12 | — | record l.17–24 | The record's pairing is correct | L1–L11 |
| L13 | `FitSky.margin` (:107, :113) | record l.20 | Minor (author record): "8\|w_j\| ≤ q" uses w for a Lean local, not the root depth | Text |

### L5. k ≤ N (the change of M1)

`FitSky.stencils` concludes `∀ᶠ (N : ℕ) in Filter.atTop, ∃ (hN : k ≤ N), …` (v2 l.47–48); the bound comes from `interiorsSky`, which filters with `eventually_ge_atTop k` (Coordinates:142), and `Cells.location S k N p x` is defined as 0 when k ≤ N fails (v2 l.114–115). The lemma's only condition on N is the mesh inequality, which does not involve k. The repair is the one of mathematics.md M1. The (G4) form is unaffected: (G4) and the consumer take N large and N > k.

### L6. The explicit mesh condition

The source has no statement of an explicit threshold: `interiorsSky` is private and concludes "eventually in N" (v2 l.67–75). Inside its proof the condition is a_N·8(|z_i|+1) ≤ a_l with l := `widthSky` (Coordinates:137–138), per stencil point and axis, giving |z_i| < side/8 (:146–148; restated as `probe_stencil_step`). With l read as the root depth w (#393 interface; #384 L16), this is a_N(Z_d+1) ≤ a_w/8 when the stencil is nonempty and Z_d is its largest coordinate, which implies a_N ≤ a_w/8 and so a_N(Z_d+2) ≤ a_w/4 < 3a_w/8. The converse fails (q = 27, Z_d = 5 satisfies 7 < 81/8 but not 48 ≤ 27). The difference is the split of the half-cell: the source keeps the site q/8 from the walls (`FitSky.margin`) and gives the stencil q/8; the manuscript keeps the site within q/8 of the centre and gives the stencil the rest. The explicit condition rests on the manuscript's proof alone, whose arithmetic checks (mathematics.md C6). No change required.

### L7, L8. Stencil, endpoints and "strictly inside"

In the release a stencil is a finite set of offset sites (`Source/Local.lean:104`), and locality is agreement on links with both endpoints in the set (`Lattice/Path.lean:192–197`). The manuscript writes a stencil link as u+s to u+s+e with s ∈ S_d (l.219–220), following `centered-construction.tex` l.192–196; on that reading the +1 is needed, and the source's stencil step pays the same +1 (Coordinates:138). The two checks disagreed on calling the +1 conservative; settled at the source as stated here, so no remark is made about it. The conclusion of `Around.figure` is `Interior (T.chamber 0)`, membership of the chamber; the release describes the chamber as having "strict (relative) seam margins" (`Cells/Tiling.lean:35`). The lemma's "strictly inside" (l.201), copied from `centered-construction.tex` l.196, is more than either the source or chamber-admissibility (`centered-estimates.tex` l.12) asks. No change required.

### L10. Uniformity in the fit point

`FitSky.stencils` binds the fit point x and `h : FitSky … x` before `∀ᶠ N` (v2 l.43–47), so as stated its threshold may depend on x; that suffices for (G4), which fixes x before N, and for the consumer. The private `interiorsSky` is declared under `omit h in` (Coordinates:131) and does not depend on x, and `FitSky.margin` holds for every N ≥ k. `probe_stencils_uniform` (`evidence/Probe395_v2.lean` l.135–145) puts `∀ x, FitSky … x →` inside `∃ hN` under `∀ᶠ N`, using `interiorsSky`, `FitSky.margin` and `Around.figure` as the release's proof of `stencils` does (Coordinates:155–159). The lemma's uniformity claim (l.232–233) is therefore backed by the release.

### L13. A letter in the author record (Minor; author record)

Record l.20 writes "8|w_j| ≤ q". The w there is the Lean local `let w : Cover := r.count.val • (choose a b k x i)` (Coordinates:107, used at :113), the site's offset in level-N steps, while the same record (l.11, l.14) and the lemma use w for the root depth. The record does not claim that the source's constants equal the manuscript's (l.21 says "the same a_N → 0 argument"). Suggested repair: write the offset with another letter (for example u_j, as in the lemma's proof).

## Required changes and remaining uncertainty

Required: the change of mathematics.md M1 (L5). Minor: L13 (author record). Remarks: L6, L8, L10 (manuscript stronger; no change).

Not checked:

- N6. The release's proofs were loaded from compiled `.olean` files and not replayed by an independent kernel checker (the probe's own theorems were kernel-checked as elaborated); neither the release nor Mathlib was rebuilt; no `lake`. That the extracted YM `.olean` files are byte-for-byte those of the archive whose digest matches `source/build.md` l.37, and that the dependency `.olean` files from the local Lake package cache are those of the lock file.
- N7. The correspondence of Lean objects to manuscript symbols (`middleSky` = ℓ, `widthSky` = w, `localSection d` stencil = S_d, `F.O N p v` = the insertion) rests on names, the definitions read, the #374 endpoint record and #384 L16, not on a formal link.
- N8. Only the 15 source files in `hashes.json` were compared with the release. `FitSky.stencils` has one further use, at `TraceExtension/Prom/Orion/Suds.lean:82` (with `eventually_gt_atTop k` at :83), which was not read beyond those lines and is not among the hashed files.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
