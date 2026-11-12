# YM-000026 centered finite-cutoff estimates: evidence

Status: author draft; independent mathematical and Lean-correspondence review is
pending. Source revision inspected: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Scope and conclusion

The mathematical section is `manuscript/existence/centered-estimates.tex`.
It proves, under explicit finite-volume centered-budget, transfer, symmetry,
seam, and planted-cell hypotheses, (i) a fixed-period local modulus on compact
cyclic patches, (ii) a common expanding-period modulus on compact generic
patches, (iii) an expanding compact bound away from full collisions, and
(iv) a fixed-period compact bound on `NoHit`, which permits coordinate ties.
It does not prove that the RG trajectory supplies the centered budget. The
separate next obligation is the actual production of that budget from the
Wilson/RG estimates.

The quantifiers are kept in source order. Fixed-period estimates allow a
mesh tail depending on the period. Expanding estimates have an outer period
tail and then a mesh tail for each period. For a finite list of observables,
the common budget is the finite maximum at each chosen depth; no monotonicity
in depth and no uniformity over all labels or test functions is asserted.

## Exact source interfaces inspected

| Prose item | Pinned declarations and paths | Verified mathematical content |
|---|---|---|
| Centered budget | `YM.Extraction.centeredBudget`, `YM.Extraction.CenteredBook`; `Lean/YM/Extraction/Center.lean` | At volume `N`, the observable is represented, belongs at every site to the interior of the chamber-positive cone for the centered depth-`m` tiling, and its normalized copied-product root test is at most `A`. |
| Budget quantifiers and producer-facing projections | `YM.Extraction.CenteredBook.each`, `.expanding`, `.Wcmain`, `YM.Extraction.CenterPort.book`; same path | `each` is fixed-period then mesh eventuality; `expanding` is ordered outer-period then inner-mesh eventuality. `Wcmain` has constants uniform over all period indices and therefore can imply either by restriction/cofinal pullback; the stronger expanding `CellHyp` route is also available. |
| One-budget finite family | `YM.Extraction.lib`, `YM.Extraction.Difference.permits`; `Lean/YM/Extraction/Center.lean`, `Lean/YM/Extraction/Equicontinuity.lean` | For every common depth, take the finite max of the possibly depth-dependent bounds and intersect the finite set of tails. Reflected and conjugated observable variants are a finite list. |
| Centered transfer column | `YM.Extraction.Difference.reading`, `YM.Slice.Time.organized`, `YM.Slice.Time.powering`; `Lean/YM/Extraction/Difference.lean`, `Lean/YM/Slice/Ordered.lean`, `Lean/YM/Slice/Calendar.lean` | A centered local observable is read as a slab brick. Alternating translated original and reflected copies in the `2s` centered cells, followed by the planted inequality, bounds the replicated column root by `A`. The brick-tour displacement adjusts two free heat gaps oppositely and keeps total tour length fixed. |
| Continuous-kernel to sampled-matrix bridge | `YM.Analysis.Quad.approximation`, `YM.TimeKernel.learns`, `YM.TimeKernel.passage`, `YM.TimeKernel.totality`; `Lean/YM/Analysis/Quadrature.lean`, `Lean/YM/TimeKernel/Trace.lean`, `Lean/YM/TimeKernel/Unit.lean` | The physical transfer is a continuous kernel on a compact slice space. The source chooses common tagged quadratures, whose weighted sampled matrices have entries `sqrt(mu(C_u))*K(tag_u,tag_v)*sqrt(mu(C_v))`; cyclic traces are tagged sums and converge to cyclic kernel integrals. The section spells out the same bridge for arbitrary cyclic-list length `r`; physical tour length `L=qw+sum H_i` is kept separate from collapsed trace-list length `r=q+sum H_i`. It includes the denominator, shifted tour traces and replicated column norms. It does not represent the original physical transfer as finite-dimensional. |
| Finite trace interpolation | `YM.Holder.estimation`, `YM.Holder.finite_lip`; `Lean/YM/Complex/Gaps.lean`, with spectral helpers in `Lean/YM/Complex/Holder.lean` and `Lean/YM/Complex/Columns.lean` | For `L=2sw`, each brick insertion has Schatten exponent `2s`, hence norm equal to the `2s`-replica column quantity. The `2s` original/reflected slab copies occupy the even-numbered cells among `4s` centered cells, exactly the disjoint placement used by the source centered-column argument. A heat factor with exponent `h_i` uses Schatten exponent `L/Re(h_i)` (operator norm if `Re(h_i)=0`), and norm `Z^(Re(h_i)/L)`. Reciprocal exponents sum to `q/(2s)+sum Re(h_i)/L=1`. The finite-matrix Schatten-Hölder bound, the holomorphic gap transfer, Cauchy's derivative estimate and segment integration give `l/R` times the tour bound. Passing along the common quadrature sequence yields the continuous-kernel estimate. |
| Fixed-period and expanding moduli | `YM.Extraction.Difference.completed`, `YM.Extraction.TransferLip`; `Lean/YM/Extraction/Equicontinuity.lean`, `Lean/YM/Extraction/Lipschitz.lean` | Fixed compact cyclic sets have a compact thickening with positive minimum distance to all coordinate period hyperplanes. Compact generic sets retain uniform coordinate separation in all sufficiently large periods. Telescope over the `4q` scalar coordinates through an enlarged compact neighborhood. The expanding modulus is uniform in the outer period and has an inner mesh threshold per period. |
| Fixed `NoHit` separation and expanding collision-free separation | `YM.Extraction.Bound.cyclic`, `.volume`, `YM.Extraction.Gaps.allGrows`; `Lean/YM/Extraction/Integrate.lean`, `Lean/YM/Extraction/Gaps.lean` | For each pair use the maximum over four axes of distance to the period lattice; its compact minimum is positive on `NoHit`, even if individual coordinates tie. For expanding periods and compact `Conf`, the maximum absolute coordinate difference is bounded below and eventually equals torus distance for all coordinate differences. Taking the minimum over axes would be wrong. |
| Coarse/fine cell packing | `YM.Extraction.Around.image_`, `.fits_budget`, `.figure`, `.interior_from`, `YM.Extraction.Around.size_done`, `YM.Cells.Tiling.planted`; `Lean/YM/Extraction/Around.lean`, `Lean/YM/Extraction/Held.lean`, `Lean/YM/Cells/Embedded.lean` | A coarse depth-`m` tiling is translated so each point is in its fine-cell margin; a boundary count proves placement when `6q a_k<a_m`. Some-coordinate separation makes the coarse cells distinct. First `Around.swept` matches the entire coarse-copy orbit of a home observable injectively to fine centered cells and applies the fine planted inequality, giving the coarse root bound. For an arbitrary pointed site, `Around.interior_from` brackets each of four coordinates by fine-grid endpoints (16 corners), proves chamber interiority in the enlarged margin, and applies the discrete log-convex maximum principle. The latter follows by shifting the full replicated product one step, splitting copies into the two signed translates, and pairing opposite-parity cells; this gives `u_j^M <= u_{j-1}^{M/2}u_{j+1}^{M/2}`. The coarse planted inequality then bounds the tuple by `A^q`. The proof handles `q=0,1` separately before taking pair-separation minima. |

## Remaining upstream quantitative obligation

`YM.Extraction.Wcmain` is proved by `YM.Input.Metered.rootwise` in
`Lean/YM/Overlay/Assembly.lean`, itself constructed by `YM.Extra.Multi.centered`
in `Lean/YM/Extra/MULTISOURCE_BOUNDS/Application.lean`; another producer
candidate is `YM.MergeProof.Accent.gardena` in
`Lean/YM/MergeProof/Gardens.lean`. Its exact target is a centered bound, for
every grade `d`, radius `R>0` and exponent slack `epsilon>0`, with constants
`A,m_0` independent of period, for all depths `m>=C.ref d`, eventually in
volume index, all period indices, and all labels of grade `d` and norm at most
`R`, with root bound `A a_m^(-d-epsilon)`. The same volume tail works for all period indices, so this is directly strong enough to
imply the fixed and expanding `CenteredBook` clauses by restriction to a fixed
period or the cofinal period schedule.

The concrete producer has a substantial prerequisite bundle: `C.Makes`
(Wilson selected representation, sound sections, grade-stage bounds, stencil
placement, price bounds, calibrated transfer), plus the assembly hypotheses
including `Offer`, `Prepared`, `Thick`, gauge simplicity, and the relevant
multi-source centered estimates. These are not proved in this section. The
next unit must unpack the actual producer and prove the budget estimate from
its quantitative upstream assumptions, rather than cite `Wcmain` as an
unexplained theorem.

## Literature and checks

No relevant accepted literature note in `blueprint/background/` was found that
replaces the project-specific transfer, centered-cell, or packing estimates.
For the general Schatten Hölder inequality in the trace interpolation, the
manuscript now cites Tropp, *Matrix Analysis* (2022), Theorem 6.32, and states
how its unitarily invariant norm form specializes to the two-factor Schatten
inequality, including the operator-norm endpoint. The section proves the
specific exponent matching and continuous-kernel quadrature passage needed
here.

Commands actually run:

- Read `CONTRIBUTING.md`, `docs/coordination.md`, `docs/proof-standard.md`,
  `docs/notation.md`, `blueprint/background/README.md`, and
  `templates/proof-unit/README.md`.
- Inspected the declarations and immediate dependencies listed above with
  targeted `rg` and `sed` at the pinned revision. No Lean source was changed.
- `python3 scripts/check_blueprint.py` was attempted earlier and stopped
  because this checkout has no `blueprint/units/YM-000026/unit.json`. The task
  owns only this evidence file and the TeX section, so no metadata file was
  added.
- A temporary LaTeX wrapper compiled the current section successfully with
  `latexmk -pdf -interaction=nonstopmode -halt-on-error`; it produced a seven-page
  PDF. Rendered all seven pages with `pdftoppm` and visually inspected them.
- No Lean build has been run. Independent mathematical and
  Lean-correspondence reviews are pending.
