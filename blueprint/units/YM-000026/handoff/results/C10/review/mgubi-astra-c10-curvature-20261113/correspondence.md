# Independent Lean correspondence review

Outcome: **locally consistent, conditional on the named hypotheses**. This is a
source inspection, not a fresh kernel replay or whole-unit correspondence approval.
Imported source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Paths below are relative to `Lean/`; source-file hashes and their comparison with
`Lean/SOURCES.sha256` are recorded separately. Declaration names in the first
three tables are in namespace `YM.Stationary` unless explicitly qualified.
The targets are the full chapters in `hashes.json`, not only the named endpoints.

## Soft curvature correspondence

| Manuscript content | Inspected source anchors and meaning |
| --- | --- |
| All-order atom pictures, orientation average, row prices | `YM/Next/STATIONARY/Shape/ClassicalMatch.lean`: `aTerm`, `slot_weight`, `aTerm_at`, `ambientInk`, `term_vault`, `all_ages`, `orbit_cost`, `gramWeight`, `gramCost`, `gram_budget`, `Wilson_stream`, `quadratic_write`, `column_price`, `intended`, `intent`, `low_columns`. The factorial and color/length factors come from the actual coefficient definitions. `Shape/LocalOracle.lean`: `circleTax` and its recursive Cauchy estimate. |
| Gauge Ward partition and ray orders | `Shape/GaugeJets.lean`: `gauge_message`, `interpolate`, `dragged_one`, `litPoint`, `rmsg`, `tally`, `element`, `flare_area`, `tested_area`, `crux`, `elem_top`, `priceEl`, `LawfulSum`, `priced_below`, `full_ring`, `sym_one`, `ring_ray`, `rayDark`, `rayBlack`, `according`. The checked proofs use the actual common lower pictures and volume normalization. The metric safety premise of `according` is retained. |
| Soft difference decomposition and scaling | `Shape/SoftTransfers.lean`: `pure_white`, `pure_grey`, `whites_on_K`, `extra_curves`, `sustain`, `layers`, `transfers`, `twister`; `Shape/Scaled.lean`: `veneer`, `greyson`, `whiteWilson`. The prose half-width division variant has a direct proof; the source quarter-width statement alone would not imply it. |
| Flat Hessian identification | `YM.Work.F03.main_limit` in `YM/Work/F03/Flat.lean`; `price_limit`, `curvature_of_hasDerivAt`, `face_deriv`, `slot_deriv`, `slot_limit`, `slots_bound`, `row_abs_summable`, `ellLine`, `ell_limit` in `Transport.lean`; `layout_physical`, `ellLine_root`, `left_stack`, `metric_pair` in `Metric.lean`; `hessian_of_limit` in `Calculus.lean`. These use actual path bounds and attachment, not a bare formal sum. `YM.Work.F05.pull_gauge_zero` in `YM/Work/F05/Actions.lean` supplies genuine gauge invariance. |
| Bed meaning and global-contract limits | `YM.Precision` definitions in `YM/PREC/Stacks.lean`: `Bed`, `Attached`, `Bed.full`, `Numeric`, `Floor`, `Towers.Diagonal`; `YM.Bid` definitions in `YM/Bid/Station.lean`: `gaugeFiscal`, `pulled`, `Sworn`, and the F02/F03/F04 contracts. `YM/RG/PathActions.lean`: `Clip`, `PathData`, `Bounds`, `ell`. `YM/CellFourier/Circulant.lean`: weighted strip, safety, Fourier evaluation and finite-period action. The flat identity does not itself fill the global contracts. |
| Wilson Hessian and cubic remainder | `Loops/Fourier.lean`: `bedCharge`, `bed_price`, `slots_cost`, `bed_gain`, `outright`, `slots_gain`. The separate bare-energy picture is consistent with the retained Wilson supplier statement. |
| Mixed response jets and factorization | `Shape/Vertex.lean`: `dough`, `acorn`, `locality`, `dough_signal`, `calls`, `Drinkable`, `DrinkIt`, `cuddles`, `pintCost`, `wedlock`, `Bitter`, `nectar`. The actual coefficient product and ordered partition conventions explain the derivative factorials and orders. |
| Three levels and selected mockups | `Shape/Shim.lean`: `Needle`, `Dai`, `Spool`, `spooling`, `Cargo`, `pinRing`, `Ports`, `tabsZ`, `roller`, `winglet`; `Shape/Rank.lean`: `Mockup`, `Fruit`, `Syrupy`, `loanChar`, `blenderBar`, `cooking`; `OneLoop/Lattice.lean`: `garden`, `tideMark`. These bind the same selected inputs rather than choosing unrelated existential producers for the three levels. |

## Multileg correspondence

| Manuscript content | Inspected source anchors |
| --- | --- |
| Laurent division, constraints, Cartan homotopy | `Lift/Koszul.lean`: `divZ`, `seriesLeg`, `seriesLeg_exact`, `priceDivision`, `div_var`, `rays_div`, `Cycles`, `projected`, `Uniforms`, `wall`, `JetWall`, `CostWall`, `cartan_remove`, `cartan_0`, `comb`, `cob_step`, `allcombs`, `purge`, `wall_lift`. Negative Laurent modes, auxiliary constraints and the accumulated four-term price were checked. |
| Dimension shift, independent legs, jet orders | `Lift/ManyLegs.lean`: `missing`, `bypass`, `slim`, `firm_shear`, `open_end`, `dimensionShift`, `allleg`, `Contractible`, `bothleg`, `press_jet`. The dimension inequality and separate two-leg proof match the prose. |
| Realification, finite-dimensional reserve, Fourier moments | `Lift/Pathways.lean`: `curl_real`, `re_cast`, `real_rescue`, `paints`, `fixedInks`, `picker`, `reserve`, `reserve_cost`, `reserve_read`, `Features`, `Shades`, private `insertPaint`, `strokes`, `veins`, `vertical_moment`, `jet_moment`, `artery`, `inkCost`, `funded`, `issue_normal`. The retraction is paid for by its actual norm bound. The source's final Fourier width is already one-half, as in the prose. |

## Thermal correspondence

| Manuscript content | Inspected source anchors |
| --- | --- |
| Actual tree determinant and Haar factors | `Joint/Completion.lean`: `commandment`, `chargeRoot`, `root_determines`; `Joint/HaarJac.lean`: `treasury`, `certified`, `bounty`, `tribute`. `YM/PCalc/Loop.lean`: `ChartRatio`, `LocalRatio`, thermal definition. The density ratio and retained chart constant are part of the full identity. |
| Same stationary branch and contact Hessian | `Joint/OnShell.lean`: `color_fixed_at`, `color_fixed`, `bonanza`, `moment_track`, `elect`; `Joint/Drift.lean`: `payee`, `priceless`, `value_drops`, `pay_jet`, `lapel`, `smear`, `rind`, `earn_ad`, `wear_smear`, `lapel_shift`, `rind_carry`, `unit_ud`, `armor_rotation`, `armor_zero`, `remit`, `bountyY`, `guard_y`, `coreBoon`, `majorBoon`, `memo_dross`, `chevron`, `levy`, `got_leg`, `pace`, `stem_pay`, `stem_second`, `y_stems`, `lean_drift`. The inverse derivative is retained and nonabelian simplicity is used to kill the invariant contact vector. |
| Film realization and exact finite-period matching | `Films/Contact.lean`: `seamUp`, `seamLeft`, `commandY`, `carrierY`, `carrier_live`, `backRepacked`, `seams`, `smearedX`, `rondo`, `carry_root`, `clears`, `clouds`, `volley_pay`, `narrative`, `double_c`, `choir_ward`, `audited`, `signing_here`, `stamp_here`. The common analytic matrices encode the actual derivatives, and the quadratic trace term has the required factor two. |
| Leading coefficient cancellation | `Films/LeadingRay.lean`: `stock_sway`, `tax_cont`, `tax_ray`, `star_analytic`, `alpha_night`, `star_low`, `TicketPost`, `drift_tip`. In particular `drift_tip` consumes `T.metric.strip theta A`, positive theta, actual `TicketPost`, branch, simplicity, path and film bounds, and growing periods. It concludes `alphaPay i (profitable (changeCue ...)) = 0`, not vanishing of a finite-volume Hessian. |
| Meaning of the compared coefficients | `Films/RankColor.lean`: `medalCue`, `rankCue`, `coreCue`, `changeCue`, `stageCue`; `Joint/Symmetry.lean`: `honorarium`, `burnished`; `Loops/HessianMatch.lean`: `quoting`. In particular `changeCue = medalCue - coreCue`, while the later rank comparison has an additional remainder estimate. These are not interchangeable claims. |

`YM.Gauge.Simple` in `YM/Gauge/Lie.lean` was checked: it includes nonabelianity
and the real Lie-ideal condition. `YM/Gauge/Colors.lean` defines the represented
color scale and curvature used in the flat Hessian argument.

## Interfaces and limits

Relevant interfaces were read in the row quadratic-price and Wilson-price
chapters, horizon geometry/curvature producer, selected linear and kinetic
response, weighted inverse and determinant prices, Haar chart, and inherited
transport chapters. In particular the last thermal conclusion needs the inherited
transport theorem's stronger hypotheses on the same data. Those chapters are not
being independently approved by this review.

No axiom is introduced or removed. Existing source/audit and C10 evidence were
read for provenance; their recorded prebuilt-artifact checks are not described as
a clean source rebuild here. The Lean sources and pinned toolchain are untouched.
The stronger half-width soft-difference statement was checked mathematically,
not mechanically formalized. N1/N2 in the mathematical report are nonblocking
clarifications, separate from unresolved global suppliers. Human acceptance is
unset.
