# Physical Ward propagation: source and evidence

Status: draft.  Local mathematical argument is source-guided; all uses of
the stress packet decay and the finite selected-scale bridge are explicitly
conditional on the stated inputs.  No Lean source was changed.

## Source pin and owned output

- Upstream Lean source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
  (`source/upstream.json`).
- Owned files: `manuscript/existence/physical-ward-propagation.tex` and this
  evidence file.
- Scope endpoint: global separated-configuration Ward identity (`Still`),
  its stress-derived line identities, and the all-grade Lie brackets
  (`Brackets`) after transfer of the internal erasure property.  The later
  A09--A17 / integrated Lorentz-action argument is outside this unit.

## Source correspondence

| Mathematical item | Exact source | Correspondence and scope |
|---|---|---|
| Angular expression, commutation and collinear identity | `YM.Ward.angular`, `YM.Ward.commutes`, `YM.Ward.Collinear`, `YM.Ward.Still`; `Lean/YM/Ward/Sum.lean`, `Lean/YM/Ward/Walk.lean` | Equations (1) and (2) use the same positional-derivative plus spin-substitution convention. `Still` is imposed only on `conf`; no collision extension is assumed. |
| Ordered configurations dense | `YM.Ward.fills`, `Lean/YM/Ward/Axis.lean` | Perturb each point by a distinct scalar multiple of one fixed basis vector; each pair excludes at most one perturbation parameter. |
| Connect ordered configuration to a line by collision-free coordinate walks | `YM.Ward.line`, `YM.Ward.pushes`, `YM.Ward.park1`, `YM.Ward.Walk`, `Lean/YM/Ward/Axis.lean`, `Lean/YM/Ward/Walk.lean` | Select a minimum point in the remaining finite set, make it successively extreme in two projections, then zero its non-line coordinates while preserving line order. Each segment is an extreme-point bridge and remains in `conf`. |
| Analyticity and identity transfer along each bridge | `YM.Ward.first_adv`, `YM.Ward.last_adv`, `YM.Ward.channel`, `YM.Ward.stood`, `YM.Ward.along`; `Lean/YM/Ward/Extreme.lean`, `Lean/YM/Ward/Walk.lean`; prose `sec:physical-ward-analytic-continuation` | The global theorem now takes the segment-analyticity result as an explicit hypothesis/cross-reference. The separate unit proves it from the full hierarchy, positive-time representation, endpoint jets and the OS/heat translation formula. Smoothness on `conf` is not treated as sufficient. |
| Global propagation theorem | `YM.Ward.global`, `Lean/YM/Ward/Axis.lean:130` | Exact conclusion: if `x∈conf n`, then `Still W T x` for every finite `n`, under `W.Derivatives`, `Collinear`, and `commutes`. The proof is ordered density, finite walk, then continuity on `conf`. |
| A01 local response symmetries | `YM.Work.A01.translation_color`, `YM.Work.A01.angular_hyper`, `YM.Work.A01.answer`; `Lean/YM/Work/A01.lean` | Derives color/inclusion/reality/unit/mirror properties from compact-window flux identities, translation/reflection/conjugation covariance, and conservation. The unit identity explicitly applies conservation after deleting the unit insertion. |
| A02 derivative-shell compatibility | `YM.Work.A02.deriv_integral`, `YM.Work.A02.answer`; `Lean/YM/Work/A02.lean` | Differentiates under a fixed compact shell integral. Uniform domination comes from compact support of the cutoff derivative and smoothness on `conf`; the two derivative terms are the coefficient derivative and the raised insertion slot. |
| A03 all positional jets of line response | `YM.Work.A03.all_line`, `YM.Work.A03.row_D`, `YM.Work.A03.full_jet`, `YM.Work.A03.line_native`, `YM.Work.A03.answer`; `Lean/YM/Work/A03.lean` | Mixed-cap rows are first proved equal to the once-raised row on all of `conf` by differentiating the moments there. Only the order-zero raised row is evaluated on the line, after padding caps and applying `LineSum`; induction evaluates each further raised row on the line. No line-only identity is transversely differentiated. |
| A04 finite test-row recovery | `YM.Work.A04.finite_faithful`, `YM.Work.A04.tendsto_of_fitted`, `YM.Work.A04.jetsAt`, `YM.Work.A04.answer`; `Lean/YM/Work/A04.lean` | Finite-dimensional faithful free evaluations reduce to finitely many tests. Fixed-window jet convergence gives convergence of each approximating row. A left inverse of the limiting injective map makes the fitted moving vector converge. |
| A05 stress and spin readout limits | `YM.Work.A05.Observer.gets_translation`, `YM.Work.A05.Observer.gets_rotation`, `YM.Work.A05.answer`; `Lean/YM/Work/A05.lean` | A finite union of observers is chosen before one Track threshold. Compact cutoff identities identify their limits with stress-gradient and spin readouts; fixed-window jets and stress-meter convergence give the two claimed limits. |
| A06 finite collinear test transport | `YM.Work.A06.test_aisle`, `YM.Work.A06.test_limit`, `YM.Work.A06.moves_limit`, `YM.Work.A06.transverse_zero`, `YM.Work.A06.answer`; `Lean/YM/Work/A06.lean` | Exact identity: `test_k(s, aisle_k(q)) = r_k^{m_s} lens_{scaled(k,s)}(q)`. A common finite maximum gives convergence on each fixed free vector, then operator convergence for the finite-dimensional row maps. The moved tests annihilate both the actual derivative and response exactly at each scale. No injectivity of the free test family is asserted or used in A06. |
| A07 transfer of erasure | `YM.Work.A07.finite_rows`, `YM.Work.A07.eventually_injective`, `YM.Work.A07.transfer`, `YM.Work.A07.answer`; `Lean/YM/Work/A07.lean` | The free internal covariance subspace is finite-dimensional. Free erasure yields finitely many separating rows; their actual rows converge on a fixed basis, hence remain injective. Pullback by the aligned grade isomorphism transfers zero row-sum to zero defect. |
| A08 differentiated Ward brackets | `YM.Work.A08.orbital_ward`, `YM.Work.A08.orbit_twice`, `YM.Work.A08.double_spin_sub`, `YM.Work.A08.defect_winds`, `YM.Work.A08.defect_ward`, `YM.Work.A08.answer`; `Lean/YM/Work/A08.lean` | Sign check: `[X_u,X_v]=-X_[u,v]`, while `X_u S=-S(Y_u)`, so the orbital commutator contributes `+S(Y_[u,v])`. The two spin substitutions contribute `+S([Y_u,Y_v])`; subtracting gives the stated defect. Distinct-slot terms cancel in pairs. The defect is an internal `Winds` map with zero Ward rows, so erasure kills it at large grade; inclusion injectivity descends the identity to every grade. |
| Free collinear classifier input | `YM.Maxwell.Free.Hidden.exposed`, `YM.Maxwell.Free.Magnitude.charges_quiet`, `YM.Maxwell.Free.Scenes.scanner`; `Lean/YM/Next/MAXWELL/{Hidden,Magnitude,Scenes}.lean` | The detector grade kills every shell-weighted ghost; the quiet-charge calculation reduces the scalar derivative response to collinear charges; `scanner` supplies finite collinear rows. This is a separate free-theory producer, not supplied by finite-dimensional detection alone. |
| Free internal-map erasure input | `YM.Maxwell.Free.AwayTeam.erasing`; `Lean/YM/Next/MAXWELL/AwayTeam.lean` | For an alternating two-skew-parameter internal map with zero separated Ward rows, this supplies the finite grade frame used by A07. Its prerequisites include low-motion, stress annihilation and the commuting Ends/statistics data. |
| Outer stress supplier | `YM.Outer.blows`, `YM.Outer.pick_price`, `YM.Outer.off_label`, `YM.Outer.collimated`, `YM.Outer.exterior_size`, `YM.Outer.track_sale`, `YM.Outer.ice`, `YM.Outer.line_cost`, `YM.Outer.point_cost`, `YM.Outer.mass`, `YM.Outer.normal`, `YM.Outer.balanced_mul`, `YM.Outer.track_pose`; `Lean/YM/Next/ROTATIONS/{Yard,Vanishing,Cove,Thaw,Tunnel,Mass,Patch}.lean` | `exterior_size` combines cove pieces with exponents at most `-119.5`, `-972`, `-146` or `-221.5`, and a damped exterior estimate, to obtain `Budget(-101)` for the unamplified readout. `track_pose` contributes exactly `exp(100n)`, so `pick_price` gives `Budget(-1)`. `blows` identifies this readout with the actual insertion packet away from a finite null set. The manuscript displays the exponent arithmetic, uses the normalized transverse dilation, and distinguishes the panel Fourier gap from the compact spatial petal. The positive line/point/exterior estimates are supplied by `sec:physical-ward-packet-prices`; the fixed-band cone estimate is supplied by `sec:physical-ward-stress-cone`. |
| Actual consumer | `YM.Climb.descends`, `Lean/YM/Climb/Beams.lean:86--100` | Calls `YM.Ward.global` on the scaled row `c⁻¹ • Y` using the `Crystal.ready` commutation and collinearity fields, then proceeds to the separate Spin tilt construction. |

## Exact analytic boundary

The manuscript proves the finite-configuration propagation, the collinear
stress-packet estimate, and the finite-level A01--A08 bridges from the stated
mathematical inputs. The packet calculation uses the already reviewed
positive line/point/exterior estimates in
`sec:physical-ward-packet-prices` and the fixed-band cone estimate in
`sec:physical-ward-stress-cone`; it derives the remaining packet rate by the
weighted Cauchy decomposition displayed in the TeX. In particular, the
four cove exponents are at most `-119.5`, `-972`, `-146`, and `-221.5`, and
the complement costs `-101`. The exact profile factor `exp(100 n)` leaves an
integrable shell bound `C exp(-n)`. The exterior term uses positive-time
damped spectral control, not an undamped zeroth moment. The cove lies where each normalized transverse coordinate is in `[-1,1]`;
the transverse cutoff is one there and supported in `[-2,2]`. Its normalized
dilations are
included in both price weights.

The same-slice identity is applied only after the weighted Cauchy and damped
exterior bounds establish spectral integrability, and the strict temporal-gap
plus Schwartz bounds establish position-side integrability and Fubini. The
finite-volume stress response then tends to zero, giving the collinear angular
identity. This argument uses
the actual finite signed cluster expansion and coordinate-reflection
cancellation, rather than identifying an individual cluster with the stress
insertion.

The remaining free-theory inputs are distinct and explicit: the collinear
classifier `YM.Maxwell.Free.Scenes.scanner` and the internal-map erasure
`YM.Maxwell.Free.AwayTeam.erasing`, with its low-motion, stress-annihilation,
and commuting Ends/statistics hypotheses. The source chain producing them is
recorded in the following unit, `physical-ward-free-classification`. The
finite-dimensional detector `FD.scanner_inj` only detects field polynomials;
it does not prove either free input. The actual-stress-normalization unit
supplies the common selected curve, all finite Track/ActLaw tail requests,
finite-window jet convergence, stress-meter convergence, and the spin-side
normalization. The manuscript adds the finite algebraic rank step: augment
the finite selected collinear row map by one functional nonzero on the free
derivative, pass injectivity from the free map by basiswise convergence, and
compare the positional response with the derivative. Grade inclusion makes
the resulting nonzero scalar independent of grade. No downstream
rotation-action argument is used to obtain that scalar.

The source theorem `YM.Outer.miles` specializes `YM.Outer.outer` to `V`, the
seed kernel, stress `I.J`, positional response `I.p`, and spin response `I.Y`.
The orientation premise is `H.aligned` and the stress-law package is
`H.planet`. The manuscript supplies the packet composition and rate
arithmetic, and cites the separately proved price units for the estimates
used in that composition. No rank or continuous-rotation bootstrap is used.

## Literature and checks

- Read `blueprint/background/README.md`; it contains no accepted external
  result for this finite-configuration Ward propagation or compact flux
  packet argument.  No external literature theorem is invoked here.
- Inspected targeted source only: `Ward/{Axis,Walk,Extreme,Sum}.lean`,
  `Work/A01.lean` through `Work/A08.lean`, `Next/ROTATIONS/{Route,River,
  Stones,Yard,Vanishing,Cove,Tunnel,Mass,Thaw,Frost,Patch,Budget}.lean`,
  `Bid/{Angular,Town}.lean`, `Climb/Beams.lean`, and targeted free
  declarations in `Next/MAXWELL/{Hidden,Magnitude,Scenes,AwayTeam}.lean`.
- No Lean source edits and no Lean build were run.
- `git diff --no-index --check /dev/null <file>` was run for both owned files;
  each returned the expected difference status for an untracked file and
  emitted no whitespace diagnostics.
- `python3 scripts/check_blueprint.py` was run. It stops because the shared
  `blueprint/units/YM-000026/unit.json` is absent in this draft clone; this
  task does not own that shared metadata file.
- No LaTeX build was run; this is a standalone draft fragment pending parent
  integration and its shared macros/environments.
