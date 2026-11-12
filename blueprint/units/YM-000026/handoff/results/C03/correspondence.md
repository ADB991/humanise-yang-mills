# C03 source correspondence for this pass

Pinned source `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. This file covers only the declarations read in this
pass to support the edits and checks in `findings.md`. Read the existing evidence files (canonical, read-only)
for the rest of each chapter: `fullmesh-correlation-cauchy-evidence.md`, `limits-evidence.md`,
`fullmesh-fixedbounds-producer-evidence.md`, `phase-quantitative-producer-evidence.md`,
`actual-slab-copy-bounds-evidence.md`, `phase-null-inheritance-evidence.md` (all in `blueprint/units/YM-000026/`).

| English (label) | Declaration (path) | What was read | Match |
| --- | --- | --- | --- |
| `thm:ex-fullmesh-fixedbounds-producer`, separation hypothesis | `YM.FullVolume.FixedBounds` (`Lean/YM/FullVolume/Discrete.lean` 50–54) | full structure | ∃B≥0, ∀ᶠN, ∀p, ∀x, `spaceout C r (N,p) (wrap ∘ x)` → ‖gKernel‖≤B: threshold independent of p, bound independent of N,p. Matches the statement as repaired |
| periodic ℓ∞ distance sep_{N,p} | `YM.FullVolume.spaceout` (`Lean/YM/FullVolume/Cohort.lean` 36); `YM.Lattice.pdist`, `YM.Lattice.separation` (`Lean/YM/Lattice/Site.lean` 78–81) | definitions | `r ≤ a_N * separation (x u) (x v)` for u≠v; `separation x y = pdist (x-y)`, `pdist x = sup_i (lift x i).natAbs`, i.e. max over axes of the periodic (min-abs) coordinate distance |
| injectivity of cell assignment | `YM.Cells.Tiling.extent` (`Lean/YM/Cells/Proximity.lean` 69–80); its use in `YM.FullVolume.cohort` (`Cohort.lean` 38–60) | statement, proof start, call site | `separation x y ≤ T.side` for x,y in one chamber; cohort derives injectivity from `a_N*T.side = a_ℓ < r` |
| `rem:ex-limits-fullmesh` | `YM.FullVolume.PositionsUV`, `YM.FullVolume.positioned` (`Lean/YM/FullVolume/Profiles.lean` 25–47) | definition + proof | for every p, n, v there is f, `ContDiffOn` on `NoHit`, with `Tendsto (fun j => smears C (e j) p v t)` for every suitable test, from `FixedBounds C` and `Purchased C e`; with `e` the full sequence this is the full-mesh limit. G01 statement ledger records that the public `wilson` clause demands the full mesh limit at every suitable period, with the volume limit along `p∘q` |
| `rem:ex-limits-fullmesh` (contrast) | `YM.FullVolume.printed` (same file 49–56) | docstring + statement | subsequential version along `f.mesh`; "Not full-sequence until Purchased on .full" — confirms the two routes are distinct |
| ancestral points, a_mB_m²→0, separation | `YM.FullVolume.Eves.ancestor`, `dense`, `lateAnch`, `price`, `positions` (`Lean/YM/FullVolume/Fields/Eves.lean`) | full file | `price` (requires `G.Simple`): ratio 2/3 from `Push.Corrected.Grows.walls A h 2` (B_{m+1}²≤2B_m² eventually) and `block_large` (L≥3); `positions`: eventually B_m² ≤ separation of distinct ancestral sites |
| Cauchy at ancestral points | `YM.PhysicalNext.Repeat.Legato.Bandage.Rising.cinema`, `absolute` (`Lean/YM/FullVolume/Fields/Seat.lean`) | full file | CauchySeq of `numeric (f i) p … (o (f i))` along the run index; `absolute` identifies the all-label census mode of the pilot with the numeric observable (the "exact finite identity" of `ex-public-same-run-cauchy`) |
| reflected conjugate J v = R_ρ v̄; conj commutes with signed actions | `YM.Register.adj`, `YM.Register.star_mirror`, `YM.Register.reflected` (`Lean/YM/Euclid/Register.lean` 67–83); descended `YM.Table.RealSpin.adj`, `mirror_star`, `reflect_twice` (`Lean/YM/Euclid/Null.lean` 155–172) | definitions and lemmas | `adj d a = mirrorGroup d (Signed.mirror a) ∘ bar d`; `star (mirror s v) = mirror s (star v)`. Matches the stated relation with ρ the time-axis mirror |
| J used at the boundary | `YM.Boundary.starRead` (`Lean/YM/Fields/Star.lean` 42) | definition | J(pin d v) = pin d (adj h d timeAxis v): the same J as above, supporting edge C03-to-C04-reflection-J |

Not inspected in this pass: the declarations behind `phase-selection`, `phase-regularity`, `phase-fields`,
`slab-regularity` and `phase-quantitative-producer` beyond the evidence files. Their correspondence remains as
recorded there.
