# Same-data annulus and recording binding

## Status

Draft, awaiting independent mathematical and source review. Source pin:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464` from `source/upstream.json`.

Owned prose: `manuscript/existence/annulus-same-data-binding.tex`.

## Exact selected source chain

The common-response construction is `YM.Stationary.pouring` in
`Lean/YM/Next/STATIONARY/FullPlanned.lean`:

1. `vintageWilson` chooses one fee-bounded grey Wilson jar `H`.
2. `saunter` chooses one correction jar `T` for the supplied same path,
   bed, clips, and full side sequence. It gives fees, soft order three, and
   `bindV` of the intended finite action minus the Wilson action at every
   side in that sequence.
3. `F := T.combine H` is the single response used thereafter. `Jar.fees.pay`
   supplies the common strip and summed fee. `Jar.sequelQ` adds the three
   response identities (zero-, one-, and two-mark layers); `Jar.cast_book`
   turns them into the exact `Ticket F.cast (fineFlare ...)` for each side.
4. The same `F` supplies `Play`, and the original same bed/path/side
   sequence supplies metric strip, floor, and sworn data. `massifTabs`
   assembles these into `HouseWord`. `HouseWord.done` produces a strip-bound
   analytic regulated response and `profit` produces `Awards` and the full
   mesh `Recorded` conclusion. In the `profit` error, the scale factor is
   `cents(m_i)` and its residual tends to zero along the original arbitrary
   sequence; no extraction is used.
5. The same Wilson baseline `H` is the one used by `astronomy`. The theorem
   is uniform over every `Orion` datum built from the correction jar, and
   `pouring` instantiates it with the exact `T`, bed, clip, regulator and
   combined jar already used in the `HouseWord`. Its radial bounds then feed
   `absoluteGeode` for the log drift. This is the same kernel/picture which
   `profit` records; the two arguments do not select separate response
   families.

For a fixed requested odd blocking side `L`, the regulated response uses
`mu=1/L`; hence its strip width and Fourier-tail constants may depend on
`L`. The logarithmic constants do not: `astronomy` chooses the two wave
constants before this `L` is fixed and is quantified over every eligible
`Orion`. The factor convention is `Y_ij(p)=1/2∫F_ij(p,q)dq`, with mixed
two-leg coefficient `2Y`; the finite recorded realization is therefore
`side^4 * 2Y`, consistent with `Recorded` in `Pathways.lean`.

The finite determinant identity comes from `gemF` (`OneLoop/Lattice.lean`),
with `Awards` and `PoleTest` from `Spectral/AuxReferences.lean`. The
quadratic log-determinant formula is expanded in
`annulus-recording-yield.tex`, and the all-mesh Fourier alias tail is proved
there. The local face inputs are supplied by `getReals`, `Rally.register`,
`Rally.shell`, and `astronomy` in
`Lean/YM/Next/STATIONARY/OneLoop/Bubbles.lean`. In `getReals`, one selected
frame sequence produces both interacting and ghost vectors (`Floe.vector`,
`Floe.ghost`) and their `Week`/`Tall` controls. The accepted Fleet-face
chapter derives the actual total-field and shell-separated prices from
these controls, the same-bed denominator identities, and the massive ghost
film. `astronomy` uses the all-centered population at `|x|+mu` and the
restricted shell population at `|x|` only for `mu<=|x|`.

The call from the public stationary route is
`YM.Stationary.pouring` to `YM.Stationary.Fluent`, then
`YM.Stationary.transition_cap` in
`Lean/YM/Next/STATIONARY/Level/Transition.lean`; the schedule consumer is
`YM.Stationary.claiming` in `Level/Recurse.lean`. The record/triplet and
local finite-volume details are expanded in the neighboring path
attachment, annulus recording, and Fleet-face prose units. This file only
joins those already-expanded arguments on the common response object.

## Review boundary and checks

- The Fleet-face TeX/evidence snapshot was independently reviewed at
  TeX SHA-256 `5d59da2c59faf01b6fcd9570ed00a173fd234e5ec92180a6b2ce4e1ed189fb9d`
  and evidence SHA-256
  `d1e6091e051988fb3db8b00e17cef95f2df1acc705c3c938ebf043b117364f17`.
  The accepted scope is the row prices and their use to derive the F6
  all-centered/shell inputs. This join does not modify that file.
- Inspected the source declarations listed above and their immediate
  dependencies; no Lean command or build was run.
- No TeX build was run.
- `git diff --no-index --check /dev/null` was run on the new TeX and evidence
  files; it printed no whitespace diagnostics (exit status 1 is expected for
  a differing file).
- `python3 scripts/check_blueprint.py` was not rerun because the
  parent-owned `blueprint/units/YM-000026/unit.json` remains absent in this
  clone.
