# Evidence: selected path attachment and cutoff producer

Status: draft; bounded mathematical/source pass requested, not completed.

## Source and scope

- Imported Lean source pin from `source/upstream.json` and `source/README.md`:
  `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. The enclosing prose repository
  checkout at inspection was `ecc06d13de67e479666203061918e537316994e3`.
  The source pin is a manifest value; it is not expected to exist as an object
  in the prose repository's Git database. The inspected Lean files are the
  imported `Lean/` tree at that manifest pin.
- This unit follows the public selected route from `YM.Stationary.geared`
  through `under_contract`, `pouring`, `flux_cap`, `Weather.mastering`,
  `Weather.florentine`, `MailBox.settled`, and `Train.Miracles.relayT`.
- Manuscript output: `manuscript/existence/path-attachment-producer.tex`.
- Scope: expand the exact annulus interface and its selected `pouring`
  producer, the radial logarithmic coefficient estimate, the one-step flux
  interface/provenance, finite adjacent-scale unification, finite-horizon
  descent, and positive-root cutoff convergence.
- This does not claim to reproduce the full proof of `flux_cap` from every
  internal response/curvature receipt. The `Scud` input itself is stated
  exactly; its `PriceGap`, `Critical`, `Guessed`, and `HeatG` parts are
  produced by the fixed-volume stationary-scene chain expanded below. The
  funded trial, armada/bed bounds, and selected local response tickets remain
  separate inputs.

## Inspected declarations

1. `YM.Stationary.HorizCalc`,
   `Lean/YM/Next/STATIONARY/Level/Transition.lean`:
   quantifies first over all sufficiently large odd annulus sides, then over
   every cofinal mesh sequence, bed, clip, path, and budget. Inputs are
   `PathData.Bounds`, `Attached`, the metric strip, direct clip bound, all
   floors, and all sworn conditions. Outputs are one analytic/firm picture,
   one error sequence tending to zero, the recorded `PoleTest` identity at
   each mesh, and a uniform colorwise logarithmic coefficient estimate.
2. `YM.Stationary.pouring`,
   `Lean/YM/Next/STATIONARY/FullPlanned.lean`: applies
   `OneLoop.Lattice.vintageWilson`, `OneLoop.Lattice.saunter`,
   `OneLoop.Bubbles.astronomy`, `HouseWord.done`, `profit`, and
   `OneLoop.MomentumIntegral.absoluteGeode` in that order.
3. `vintageWilson` and `saunter`,
   `Lean/YM/Next/STATIONARY/OneLoop/Lattice.lean`: Wilson orders one through
   three are fee-controlled by `Wilson_stream` and `jig`; the second Jar binds
   `intended p R - WilsonQ` under the row, floor, attachment, and strip
   assumptions. The combined Jar binds the intended action. The source then
   applies `Jar.cast_book`, `gemF`, `massifTabs`, and the HouseWord/profit
   construction.
4. `astronomy`, `Waves1`, and `Waves2`,
   `Lean/YM/Next/STATIONARY/OneLoop/Bubbles.lean`: for each admissible
   local perturbation and scale `mu`, the productive momentum density has
   bounds `A/(|k|+mu)^4` and, on `mu≤|k|≤1`, pole error
   `D/|k|^3 + D*mu^2/|k|^6`.
5. `YM.Stationary.absoluteGeode`,
   `Lean/YM/Next/STATIONARY/OneLoop/MomentumIntegral.lean`: proves the
   logarithmic coefficient estimate by polar integration and splitting the
   integration region into the ball of radius `mu`, the annulus, and the
   exterior of the unit ball. `polar_clock`, `poleSpin`, `polar_m`, and
   `peel_p` provide the angular pole identity, exact logarithmic integral,
   and two annular integrals.
6. `YM.Stationary.Scud`, `YM.Precision.Critical`,
   `YM.Precision.Guessed`, `YM.Precision.PriceGap`, and
   `YM.Precision.ClassicalMatch`, in
   `Lean/YM/Next/STATIONARY/Level/Transition.lean` and
   `Lean/YM/PCalc/Chart.lean`: `Scud` takes the price gap, critical chart,
   guessed chart, heat, and trial receipts as inputs. They are not produced
   by `flux_cap`. `Critical` contains a vanishing smooth chart and local
   stationarity of the tested action; `Guessed` specifies the derivative at
   zero from the installed linear chart; `PriceGap` is the uniform positive
   Hessian lower bound. `ClassicalMatch` is the equality of all Taylor jets
   of orders at most four between the tested action along the critical chart
   and the new path's main term.
7. `YM.Stationary.flux_cap`,
   `Lean/YM/FullVolume/Canvas/Flux.lean`: consumes `HorizCalc` and a `Scud`
   package, then constructs a path with the exact `Fluxed` conclusion. Its
   proof uses `honored`, `setWest`, `pierce`, `tideMark`, `bequest`,
   `color_pipe`, `quoting`, `pole_reduced`, `age_control`, and a final
   `rampInvoice`/`winter_exp` comparison. The scalar normalization is
   selected as a local `alphaPay` value; the residual from the annulus
   coefficient is bounded by the response ticket and added to the
   `HorizCalc` bound by the triangle inequality.
8. `YM.Stationary.scene_gate`, `Lean/YM/FullVolume/Canvas/SliceGate.lean`,
   obtains the `PriceGap`, `Critical`, and `Guessed` receipts from
   `Integrated.stationary_scene`, which is the exact upstream source
   `Bid.cospons Work.E02.answer Work.F01.answer ... Work.F04.answer` in
   `Lean/YM/Integrated.lean`. The manuscript now expands this local producer.
   `Work.E02.answer` chooses the planted constants and proves the edge bound
   by a root walk, the two endpoint frame costs on a crossing edge, and the
   predictor wire. The double finite Cauchy--Schwarz sum and the bed floor
   yield the Hessian gap. `Work.F01.answer` sets
   `eta=min(a,penalty)/(1+curlFactor+probeFactor)` so both costs fit the
   finite-volume Hessian. `Work.F02.answer` obtains smoothness of the uncut
   main action from the complex analytic row/atom series and their weighted
   absolute convergence. `Work.F03.answer` identifies the forest-chart
   action germ with the flat action, then differentiates to transfer its
   Hessian. `Work.F04.answer` proves vertical Hessian invertibility from the
   price gap, applies the finite-dimensional implicit-function theorem,
   differentiates stationarity to obtain the installed linear chart, and
   uses the two-scale diagonal identity for the heat/Hessian equality.
9. `YM.Stationary.mastering`, `Lean/YM/FullVolume/Canvas/Weather.lean`,
   applies `flux_cap` at both adjacent schedule indices. It takes the minimum
   width and maximum path budget across the current and next index.
   `Weather.florentine` builds each bubble/wing using the corresponding
   `Fluxed` object and `transfer_bound`. `MailBox.settled`,
   `Lean/YM/FullVolume/Canvas/Mails.lean`, performs finite descending
   induction separately at each terminal cutoff; there is no compactness
   extraction at this step.
10. `Train.Miracles.relayT`, `Lean/YM/FullVolume/Train/Miracles.lean`,
    obtains retained tower limits from `Bid.pinsT`; the positive-root
    uniqueness argument is finite-dimensional. For symmetric positive
    semidefinite matrices, the positive square root of a fixed positive
    semidefinite limit is unique. Uniform entry bounds give subsequential
    compactness, and uniqueness of cluster points gives convergence.

## Mathematical steps expanded

- The radial lemma is stated with the necessary region, integrability, and
  coefficient hypotheses: a finite measurable region `E_4` containing the unit
  ball, real integrable `g`, integrable pole `h_G`, positive `c_wt`,
  `alphaPay=c_wt∫g`, and `c_wt∫h_G=-slopeConstant*log(mu^-1)`. The last
  identity is proved by `poleSpin` from `polar_m` and `joy_two/joy_heights`;
  the coefficient identity is `polar_clock`. The proof then follows from
  the exact
  `Waves1/Waves2` inequalities. `vol(B_r)=pi^2*r^4/2` gives the inner-ball
  contribution `A*pi^2/2`. On the exterior, `|k|>=1` gives the contribution
  at most `A*vol(E_4)`. On the annulus,
  `int |k|^-3 = 2*pi^2*(1-mu)` and
  `int |k|^-6 = pi^2*(mu^-2-1)`; after multiplying the latter by `mu^2`,
  their total is at most `3*pi^2*D`. The exact pole integral is
  `-slopeConstant*log(mu^-1)`. This proves the displayed constant
  `costZone(A,D)` without suppressing the inner or outer regions.
- The final ramp budget is the source inequality with its exact assumptions
  `Lambda/128≤Lambda'` and `B*gamma≤1/256`:
  `(C + |x| V + B Lambda)*gamma <= Lambda'`. From
  `|x+y|+1<=d`, derive `|x|<=d+|y|`; charge the first terms using
  `2*(C+(d+|y|)V)*gamma<=Lambda'`, and the annulus width term using
  `B*gamma<=1/256` and `Lambda/128<=Lambda'`.
- The finite history proof is ordinary downward induction for each fixed
  cutoff, then stores each finite column in one horizon. No diagonal limit
  or unproved compatibility between independently chosen cutoffs is used.
- For the positive-root step, any convergent subsequence of bounded
  positive-root matrices has a positive semidefinite limit whose square is
  the prescribed limit matrix. Uniqueness of that positive square root
  forces all cluster points to coincide; finite-dimensional boundedness
  then implies convergence of the complete sequence.

## Remaining producer obligations

- Expand or cite a separately reviewed proof for the internal quantitative
  receipts in `flux_cap` (`honored`, `setWest`, `pierce`, `tideMark`,
  `bequest`, `color_pipe`, `quoting`, `pole_reduced`, and the local response
  tickets). Their names alone are not a proof of the complete one-step
  theorem.
- The manuscript's finite-cutoff passage now states the exact retained-horizon
  output and proves cover-row recovery from convergence of every physical
  period action using `bank_injective`. Remaining tower components are
  obtained from committed finite matrix product formulas; reviewer should
  confirm this gives enough detail for each component of `deliver`.
- `MailBox.settled` assembles finite-cutoff `FullPaths`; the common selected
  coefficientwise path limit and larger-width `Cadre.evolution` step are
  outside this unit and must be supplied by the parent unit before any
  continuum path conclusion.
- Check the source-declared `Odd` convention and the dependence of
  `HorizCalc` constants on `sigma,epsilon,C,Z,tau,A` when integrating with
  adjacent chapters.

## Checks actually run

- `git diff --check`: passed on tracked files; passed whitespace checks for
  the untracked TeX/evidence files using `git diff --no-index --check` (that
  command exits 1 because each file is untracked, with no whitespace output).
- `python3 scripts/check_blueprint.py`: run; failed because the clone does
  not contain `blueprint/units/YM-000026/unit.json`.
- Lean build: not run.

## Current snapshot checks

- TeX snapshot SHA-256: `502029a23391645e6b04911c92ba2839e959386d009a3176433622148cad08a3`.
- `git diff --check --no-index /dev/null` was rerun on both new files; the TeX
  file emitted no whitespace diagnostics. The evidence file was trimmed at EOF
  after an initial blank-line warning; the check was rerun after this update.
- `python3 scripts/check_blueprint.py` was rerun and failed because this clone
  lacks `blueprint/units/YM-000026/unit.json`, shared metadata outside this
  contribution.
- No Lean or TeX build was run.
- Final local review clarifications: the planted comparison consistently uses the blocking cardinality $\ell=L.\mathrm{val}$; the shifted feed recurrence is stated for all real momenta, hence aliases; and each high-halo summand is nonnegative on the real axis.
