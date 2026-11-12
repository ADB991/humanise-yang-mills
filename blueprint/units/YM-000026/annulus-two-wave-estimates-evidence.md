# Annulus logarithm and finite-volume two-wave estimate

## Status

Draft, awaiting independent mathematical and source review. No Lean files were
changed. Source revision is
`3456e5e75cf8d4cd558955a5c7638fba2d68f464` from `source/upstream.json`.

Owned prose: `manuscript/existence/annulus-two-wave-estimates.tex`.

## Source declarations inspected

- `YM.Stationary.polar_clock`, `poleSpin`, `absoluteGeode`, `poleVec`,
  `costZone`, `polar_m`, `peel_p`, `joy_two`, `joy_heights`:
  `Lean/YM/Next/STATIONARY/OneLoop/MomentumIntegral.lean`.
- `YM.Stationary.Waves1`, `Waves2`, `Rally`, `Rally.coin`,
  `Rally.register`, `Rally.shell`, `astronomy`:
  `Lean/YM/Next/STATIONARY/OneLoop/Bubbles.lean`.
- `YM.Stationary.Fleet.bubbleHV`, `bubbleControl`, `tadControl`,
  `haloControl`, `rimEdge`, `focus_bill`, `ColdR`, `Floe.vector`,
  `Floe.ghost`, `getReals`, `haloRate`:
  `Lean/YM/Next/STATIONARY/OneLoop/Propagators.lean` and
  `Lean/YM/Next/STATIONARY/OneLoop/Bubbles.lean`.
- `YM.Stationary.HorizCalc`, `YM.Stationary.pouring`:
  `Lean/YM/Next/STATIONARY/Level/Transition.lean` and
  `Lean/YM/Next/STATIONARY/FullPlanned.lean`.

## Expanded argument

1. `polar_clock` identifies the coefficient functional `alphaPay` of the
   analytically assembled response picture with the normalized integral of
   its continued second response kernel on the fundamental four-dimensional
   momentum region. This is not the finite sampled `PoleTest` coefficient;
   the latter is the separate recording conclusion in `HouseWord.done` and
   `profit`. Differentiation under the integral is justified by the common
   analytic bound. `poleSpin` then
   evaluates the continuum term: rotational invariance gives the angular
   moments `1/4` and `1/24`; the bracket has mean `-11/12`; the radial
   integral of `r^-4` over `mu<r≤1` is `2*pi^2 log(mu^-1)`. With
   `cartWeight=(2*pi)^-4`, this is exactly
   `-11 Casimir/(24*pi^2) log(mu^-1)`, the source slope constant.
2. The finite two-channel identity is `Rally.coin` together with `haloRate`.
   The manuscript expands the free halo calculation, including
   `tr(ad(e_b)^2)=-Casimir`: with `rho=|p|^2`, `C=-Casimir`, `L=-4 p_1^2`,
   and `Delta(t)=rho+2p_0 t+t^2`, the orbital and vector numerators are
   respectively `LC/rho` and `rho^{-1}(4L-8t^2)C`. The second numerator
   follows by multiplying the displayed 2-by-2 block matrices. Quotient
   differentiation gives their second derivatives, and orbital minus one
   half vector is `2 poleVec`. The remaining interacting/reference split is
   exactly `Rally.coin`; the factors `1/2` arise from `amena` and `keelRay`.
   Subtracting the free halo identity yields the displayed
   response-minus-pole decomposition.
3. `Fleet.tadControl` gives the upper-channel bounds
   `u/T^2+v*mu^2/T^6` (for each of the interacting and reference upper
   channels). `Fleet.bubbleControl` bounds each whole lower face by `A/T^4`;
   `Fleet.haloControl` gives the lower-face errors after subtracting the
   corresponding free halos, `A*(T+mu^2/T^2)/T^4` and
   `B*(T+mu^2/T^2)/T^4`. Their proofs use
   `Fiesta` product estimates and `focus_bill`, whose trace step is
   `||trace M|| <= dim * vflux(M)`. In the astronomy application these are
   applied at two different scales: `Rally.register` uses
   `T1=|x|+mu` on all centered records, while `Rally.shell` uses
   `T2=|x|` only on the subfamily `mu<=|x|`. The manuscript keeps these
   receipts separate. The local stationary-family proof that constructs
   their inputs is still an open prose-production obligation.
4. With `T1=|x|+mu`, the full-frame identity gives the first wave
   `|g|<=A1/T1^4`. At `T2=|x|`, (AT5b) and the shell receipts give
   `|K-Pi| <= (u+x0)/r^2+(v+y0)*mu^2/r^6
   +(A+B)*(r^-3+mu^2*r^-6)`. Since `r<=1`, this implies the second wave.
   Passing to real parts preserves the bound.
5. Lemma `lem:path-radial-log` in `path-attachment-producer.tex` integrates
   these two waves over the inner ball, annulus, and exterior of the unit
   ball. This unit proves the missing normalized pole identity and the
   finite-volume two-wave conversion; it does not claim a new bound on the
   local stationary chart's input price.

## Exact scope and remaining dependencies

The explicit finite-volume local receipts (all-centered whole-frame bound,
shell upper/tadpole bounds, lower-face halo errors, and marked
direction/color identities) are hypotheses of Proposition `prop:ex-two-wave`.
Their exact source conclusions are `Rally.register`, `Fleet.tadControl`,
`Fleet.haloControl`, and `Rally.shell`; this unit proves the conversion of
those conclusions to the radial bounds but does not reprove the local
`Hstar`/`Orion`-to-`Fleet` producer. `astronomy` supplies the common
quantifiers by applying the first estimate to all centered records and the
second only to `mu<=|x|`. `pouring` additionally consumes the
`HouseWord.done`/`massifTabs`/`profit` finite recording chain and the
`absoluteGeode` invoice; the next owned unit traces those steps. This is not
a proof of all upstream invoices or the public path recursion.

## Checks actually run

- Targeted source declarations at the pinned revision were inspected; no
  Lean command was run.
- No TeX build was run.
- `python3 scripts/check_blueprint.py` was run and could not complete because
  the parent-owned `blueprint/units/YM-000026/unit.json` is absent in this
  clone; no shared metadata file was created.
- `git diff --no-index --check /dev/null FILE` was run for both owned files;
  it printed no whitespace diagnostics and returns status 1 because each
  file is new relative to `/dev/null`.
