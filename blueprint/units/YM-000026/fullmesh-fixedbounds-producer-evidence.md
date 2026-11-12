# Full-mesh fixed-bound producer: evidence and scope

## Source provenance

- Imported revision recorded by `source/upstream.json` and `source/README.md`:
  `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Relevant declarations inspected in the imported `Lean/` tree:
  - `YM.FullVolume.cap` and `YM.FullVolume.improved`,
    `Lean/YM/FullVolume/Moneys.lean`.
  - `YM.PhysicalNext.Repeat.Legato.Run.financed`,
    `Lean/YM/FullVolume/Literal.lean`.
  - `YM.FullVolume.funding` and `YM.FullVolume.genuine`,
    `Lean/YM/FullVolume/Literal.lean`.
  - `YM.FullVolume.cohort` and `YM.FullVolume.financed`,
    `Lean/YM/FullVolume/Cohort.lean`.
  - `YM.FullVolume.FixedBounds`, `YM.FullVolume.gKernel`,
    `YM.FullVolume.actuate`, `Lean/YM/FullVolume/Discrete.lean`.
  - `YM.Cells.Tiling.fits_together` and `YM.Cells.Tiling.planted`,
    `Lean/YM/Cells/Proximity.lean` and `Lean/YM/Cells/Embedded.lean`.
  - `YM.FullVolume.Purchased`, `YM.FullVolume.positioned`,
    `Lean/YM/FullVolume/Tuned.lean` and
    `Lean/YM/FullVolume/Profiles.lean`.
- The importing theorem `YM.FullVolume.Final.Jewel.july` supplies the public
  route via `YM.FullVolume.genuine` and a separate `Purchased` record. This
  manuscript unit explains the fixed-bound branch only; it does not identify
  `Purchased` with fixed bounds.

## Correspondence and mathematical organization

- `eq:ex-cap-rank` is the finite-dimensional rank/readout estimate furnished
  by the selected detector ticket in `YM.FullVolume.cap`.
- `eq:ex-cap-tested` is the bounded tested coefficient obtained there by
  subtracting the detector value of the funded difference trial and using the
  owed residual whose budget tends to zero.
- `eq:ex-cap-remainder` is the scaled remainder estimate. In the source it is
  obtained by setting
  `z=(1+||display(x)||)^{-1}(x-display(x))`. The row has bounded coefficient
  cost because the scalar is at most one and the projected row has norm at
  most one. The sweep estimate applies since its projected component vanishes.
  The detector limit is then made at most `1/(2Z)`.
- The abstract cap proposition now states the source `Coin`-type membership for the original row, closure under bounded scalar multiplication/subtraction, and inclusion of uniformly bounded row families. The paid trial contributes assay values in the detector codomain; the separate equation residual compares the detector of the source row with those assays. The sweep premise is stated for normalized-cost rows with zero projected component. This avoids applying a detector defined on coefficient rows to a trial object.
- The proof of `lem:ex-fullmesh-cap` uses the exact absorption calculation:
  if `X=||display(x)||`, then `X <= Zc + Z||L(x-display(x))||` and the
  scaled remainder estimate gives `Z||L(x-display(x))|| <= (1+X)/2`;
  rearrangement yields `X <= 2Zc+1`.
- The paragraph after `prop:ex-fullmesh-cap-source` records the decomposition
  in `YM.FullVolume.improved`: write `x=display(x)+(x-display(x))`, sweep the
  kernel term to a vanishing owed budget, use the original equation residual
  as a second vanishing owed budget, and close the paid root-test bound under
  addition/subtraction. This is the source's argument turning the finite
  projected-row bound into a paid difference trial.
- The finite-list induction corresponds to `YM.FullVolume.funding`: its
  helper list starts with single-slot insertion trials; the exact update
  identity is `YM.FullVolume.actuate`, and each slot's successive differences
  are paid by `YM.PhysicalNext.Repeat.Legato.Run.financed`.
- The two-scale tiling argument corresponds to `YM.FullVolume.cohort`:
  choose a fixed tiling span below the requested physical separation, then a
  finer cell span with `6n a_k<a_ell`; `fits_together` places all points with
  three-cell-span margin; `extent` bounds same-cell periodic separation by the
  tiling side `T.side` (not the smaller recentering margin `t`), so strict
  physical separation makes cell assignment injective. Pairwise separation is
  required for distinct slot indices even when insertions coincide; `YM.Cells.Tiling.planted` gives the product
  root-test estimate under the single common Wilson law. The cutoffs are
  eventually deep enough for the fixed scales for every period, which is the
  full-mesh quantifier in `FixedBounds`.
- The final estimate `eq:ex-fullmesh-bound` is the mathematical content of
  `YM.FullVolume.FixedBounds`. The positional construction is downstream:
  `YM.FullVolume.positioned` requires both this bound and the independently
  produced same-history Cauchy input `YM.FullVolume.Purchased`.

## Assumptions and remaining inputs

The cap proof uses the actual source's finite selected detector/rank ticket,
primary paid trial, normalized coefficient-cost stability, and uniform
same-run sweep estimate. This unit proves the nonlinear absorption step and
the finite-volume assembly from those receipts; it does not reprove their RG
production. The public route still depends on the separate `Purchased` producer
for full-mesh Cauchy convergence. No claim is made here that `FixedBounds`
alone implies convergence, or that the finite volume threshold is uniform
over unbounded field/test families.

## Checks performed

- Read the declarations listed above and their immediate definitions, plus
  the project proof standard and coordination instructions.
- Inspected source provenance in `source/README.md` and `source/upstream.json`.
- No Lean source was changed, and no Lean build was run.
- Ran `latexmk -pdf -interaction=nonstopmode -halt-on-error
  -outdir=/tmp/ym-fullmesh-build /tmp/ym-fullmesh-fragment.tex` with the shared
  preamble and theorem environments added in the temporary wrapper. It
  compiled the new section to a three-page PDF. The only unresolved reference
  is `sec:ex-limits`, because that target section is deliberately omitted from
  this fragment. No Lean check was run.
- Ran `python3 scripts/check_blueprint.py`; it cannot complete because the
  shared parent-owned `blueprint/units/YM-000026/unit.json` is absent in this
  clone. No shared metadata file was created.
- No whole-manuscript build or final mathematical/source review is claimed. The revised abstract cap now uses one global row-family class, and the Moneys.improved paid-remainder decomposition has been restored. The reviewer is rereading this snapshot; it remains draft status pending that pass.
