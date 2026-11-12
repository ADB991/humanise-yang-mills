# YM-000026 ordered limits and Euclidean passage: evidence

Status: author draft; neither Lean correspondence nor mathematical review has
been performed. Source revision inspected: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Scope and local notation

The LaTeX section `manuscript/existence/limits.tex` drafts the mesh-then-volume
extraction and the transfer of exact Euclidean identities and positivity under
an ordered limit. It uses internal family notation `C` as `\mathcal C`, table
`S` as the Euclidean correlation table, and `f.mesh`, `f.per` as the two
strictly increasing index sequences. No public Wilson family `\mathcal W` or
public volume request `\varrho` is identified with these internal data here.

## Correspondence inspected

| Manuscript content | Source declaration | Inspected meaning |
|---|---|---|
| Iterated mesh-then-period limit; refinement stability | `YM.Extraction.Order.limits`, `YM.Extraction.Order.retained`, `Lean/YM/Extraction/Orders.lean` | Eventual eligibility along `f.per`; for every eligible fixed period the mesh row converges along `f.mesh`; the row limits converge along `f.per`. `retained` transports the supplied limits along a further pair of strict subsequences. It proves no compactness. |
| Mesh uniform approximation and volume compact-uniform convergence | `YM.Extraction.Order.Meshes`, `YM.Extraction.Order.VolumePoints`, `YM.Extraction.Order.PointLimits`, `YM.Extraction.Order.evaluated`, `Lean/YM/Extraction/Limits.lean` | `Meshes.onK` is a compact-patch lattice-point approximation with a mesh-tail threshold. `VolumePoints` is compact-uniform convergence of the intermediate tables along the volume sequence. `PointLimits` packages both. `evaluated` passes the mesh approximation through a convergent sequence of grid points. |
| Explicit finite-cutoff inputs to equicontinuity | `YM.Extraction.TransferLip`, `Lean/YM/Extraction/Lipschitz.lean` | `grid`: for each fixed period and compact subset of its cyclic patch, an eventual lattice modulus. `expanding`: for compact generic sets, a modulus in the `f.late` ordered filter; its mesh threshold may depend on the outer period index. |
| Explicit finite-cutoff size inputs | `YM.Extraction.Bound`, `YM.Extraction.Bound.further`, `Lean/YM/Extraction/Integrate.lean` | `cyclic`: an eventual mesh bound at each fixed period and compact `NoHit` set. `volume`: a bound eventually in the ordered mesh/period filter on compact subsets of `conf`. |
| Common compactness extraction | `YM.Extraction.localAscoli`, `Lean/YM/Extraction/Tame.lean`; `YM.Extraction.setMeshes` and `YM.Extraction.first_surface`, `Lean/YM/Extraction/Lipschitz.lean` | `localAscoli` uses a countable index, a countable dense subset per locally compact second-countable metric space, compact scalar disks, and oscillation to produce one subsequence and compact-uniform continuous limits. `setMeshes` first extracts intermediate mesh limits for all countable signatures. `first_surface` then selects one common period subsequence and returns `RawLimits`: generic continuity, `Meshes`, `VolumePoints`, and `Ordered`. |
| Smearing limit from extracted fields | `YM.Extraction.Order.intraperiod`, `YM.Extraction.Order.ordinary`, `YM.Extraction.Order.poses`, `Lean/YM/Extraction/Integrate.lean` | Compact cutoffs and `Bound` give an integrable dominating function; pointwise convergence of cell densities gives the fixed-period integral limit. Outer volume dominated convergence uses the ordered volume bounds. `poses` turns `PointLimits` and `Bound` into `Ordered`. |
| Exact lattice identities used in Euclidean transfer | `YM.Family.oriented`, `YM.Family.anchored`, `YM.Family.real_eval`, `Lean/YM/Extraction/LatticeFamily.lean`; `YM.Extraction.Order.limits_basic`, `Lean/YM/Extraction/Inherited.lean` | Under `C.Makes` and eventual token depth, these give finite-level signed symmetry, lattice translation anchoring, and conjugation identities. The generic point limits and continuity are what extend them; finite lattice translations alone do not give arbitrary continuum translations. |
| Exact bound/modulus producer requirements | `YM.Extraction.CenteredBook`, `YM.Extraction.CenterPort.book`, `Lean/YM/Extraction/Center.lean`; `YM.Extraction.Difference.completed`, `Lean/YM/Extraction/Equicontinuity.lean`; `YM.Extraction.Held.size_done`, `Lean/YM/Extraction/Held.lean` | `CenteredBook.each` is quantified token, fixed period, eventually depth, an explicit nonnegative budget, then eventually mesh; `expanding` is token, eventually depth, budget, then ordered eventuality in mesh and period. `CenterPort.book` additionally uses its `cells` hypothesis. Under `C.Makes`, `Difference.completed` derives `TransferLip`; `Held.size_done` derives `Bound`. These are proof obligations about the actual finite trajectory, not consequences of `Order.limits`. |
| Euclidean passage | `YM.Extraction.Order.limits_basic`, `YM.Extraction.Order.realPositive`, `YM.Extraction.Order.assembles`, `Lean/YM/Extraction/Inherited.lean`, `Lean/YM/Extraction/Harvest.lean` | With `C.Makes`, `S.Smooth`, `PointLimits`, and `Ordered`, source proves symmetry/basic identities, homogeneity, real-spin identities, and reflection-positive smeared form; `assembles` additionally needs `S.Capped` and packages a `Hierarchy`. Smoothness through ties is an explicit prerequisite here. |
| Joint endpoint, which is not just compactness | `YM.RG17.supplies`, `Lean/YM/RG17/Joint.lean`; `YM.Spec.Final`, `Lean/YM/Spec/Closed.lean`; `YM.FullVolume.Final.from_spec`, `Lean/YM/FullVolume/Finale/Program.lean` | `supplies` returns a large bundle and obtains `F : Spec.Final` through `Running.extraction`, `extractible17`, phase reconstruction and a final assembly. `Spec.Final` already contains a `Seed` with `Ordered`, `PointLimits`, hierarchy, cell hypotheses and corrected estimates, plus algebra, selected phase and relativistic reconstruction. `from_spec` merely projects an ordered result from that package using separate UV-position data and uniqueness. It is not an Ascoli or Prokhorov theorem. |

## Exact estimate boundary and remaining obligations

The first local extraction theorem, `YM.Extraction.first_surface`, does not
establish its own estimates. It gives limits only along a mesh subsequence;
the full-mesh upgrade at the public endpoint is a separate input, not an
output of this compactness argument. Its exact inputs are `TransferLip C f` and
`Bound C f`. The inspected producers reduce those to `CenteredBook C f` and
`C.Makes`. Thus the first finite-cutoff estimate to independently establish
for an application is either the displayed `CenteredBook` budget (including
the fixed-period and expanding quantifiers) together with `C.Makes`, or a
direct alternative yielding both clauses of `TransferLip` and both clauses of
`Bound`. In `CenterPort.book`, the `cells` component is also required; no
weaker “eventually in one diagonal” estimate suffices. The manuscript keeps
this boundary explicit and does not claim that the abstract compactness step
proves these inputs.

`first_surface` only returns generic-continuous `RawLimits`. It does not prove
smoothness at coincident configurations. The hierarchy passage `Harvest.assembles`
requires `S.Smooth` and `S.Capped`, so these remain separate dependencies. A
second caveat is quantifier scope: the source selects a common subsequence over
the countable signature index, then uses compact equicontinuity to extend from
dense sets. This establishes limits for every signature in that countable
index; it is not a raw diagonal choice over uncountably many arbitrary test
functions.

No literature note in `blueprint/background/README.md` supplies this exact
Wilson-lattice estimate package or the source-specific limit passage. The
compactness and positivity arguments in the draft are given directly; the
standard countable-product compactness and dominated-convergence facts should
be checked by reviewers against the stated spaces and hypotheses. No external
source is cited as replacing the model-specific estimate obligations.

## Commands and checks actually run

- Read `AGENTS.md`, `CONTRIBUTING.md`, `docs/coordination.md`,
  `docs/proof-standard.md`, `docs/notation.md`, `source/README.md`,
  `blueprint/background/README.md`, and `templates/proof-unit/`.
- Inspected the declarations and immediate proof paths listed above with
  `sed` and `rg` in the pinned `Lean/` checkout. No Lean files were changed.
- No Lean build, blueprint checker, LaTeX build, rendering, or independent
  review was run. The LaTeX has not been compiled or visually checked.
