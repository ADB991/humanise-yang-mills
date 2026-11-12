# Free-kernel component-estimate evidence

- Unit: YM-000026, lattice existence construction.
- Status: draft; independent mathematical/source review pending.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, as recorded in `source/upstream.json`.
- Prose: `manuscript/existence/free-kernel-components.tex`.
- Preceding conditional conversion: `manuscript/existence/free-kernel-estimates.tex`.

This chapter reorganizes the actual zero/nonzero branch supplier into
ordinary estimates. It identifies the component decay powers and explains
the quantitative closure. The history-indexed train induction is given as an explicit geometric side-ratio induction, including the coefficient-one principal-plank lower bound, the nozzle recursion, and the separate patch-mass and train-smooth factors.

## Exact source objects and bounds

`Moderate w f` in `YM.Next.Free.Moderate` (`Lean/YM/Next/FREE_KERNELS/Moderate.lean`)
means that one common positive complex-cube width and one common constant
bound every member of the family by `C*w i`; the members are holomorphic on
that cube. `Firm w f` supplies a lower bound `c*w i` on the corresponding
real enlarged cube. `Moderate.kept` proves the common-cube lower bound needed
to take reciprocals, with radius

`min (η/4) (min θ (c*η/(8*C)))`

and lower constant `c/2`. `Moderate.inv` then gives the reciprocal estimate.
The article's common-cube shrink argument is this quantitative operation,
not an unquantified pointwise continuity argument.

| Mathematical receipt | Exact declaration(s) | Path | Source proof mechanism |
| --- | --- | --- | --- |
| One-coordinate alias upper/lower geometry and box decay | `alias_rail`; `scaled_alias_upper`; `scaled_alias_lower` | `Lean/YM/Next/FREE_KERNELS/Lines.lean`; `Chip.lean` | `rail_chip` relates normalized geometric sum to the chip; the chip has upper/lower comparison to its argument on the fixed disk; a nonzero centered lift forces scaled alias size comparable to its lift. The centered phase in `plank` is uniformly bounded. |
| Cumulative mass upper bound | `Flight.bills`; `Train.smooth_upper`; `Train.area_diff` | `Buffer.lean`; `Train.lean` | Four coordinate box factors multiply; each costs `(1+|lift_a|)^-1`; raising to stage `j` yields `decay j`. `area_diff` gives holomorphy. |
| Cumulative mass lower bound at the root | `Flight.bills_firm`; `Train.area_at_root` | `Buffer.lean`; `Train.lean` | Principal box lower bound on the real disk, multiplied over the four axes and raised to `j`. |
| Rail upper at alias and lower at the zero root | `Train.rail_cost`; `Reserve.rail_cost`; `rail_root` | `Train.lean`; `Reserve.lean` | Alias rail upper is priced by `(up l a)^-1`; zero-root lower is `plankMin = min 1 (meter.low/meter.high)` on the disk, from `rail_lower`. |
| Flux receipt | `Flight.flux_budget`; `Flight.hinges_budget` | `Buffer.lean` | Mass receipt times the finite exterior mask of rail entries, followed by reverse and transpose. The extra rail factors are bounded by one in the alias price. |
| Signal receipt | `Flight.sig_budget`; `Flight.sigQ_budget`; `scaled_seed` | `Buffer.lean`; `Chip.lean` | The signal is exterior multiplication by the scaled-seed vector. Each nonzero matrix entry inserts one coordinate, so it costs one factor `grade(l)` for every input degree `r`; see `sig_budget`, `sigQ_budget`, and `scaled_seed`. |
| Train smooth upper/lower bounds | `Train.smooth_cost`; `Train.smooth_lower`; `Train.extra_cube`; `Train.extra_root` | `Train.lean` | Induction over histories. The bind identity factors one new cumulative box and the preceding smooth factor. Coarse dilation is at least three and stage increments are zero or one; upper bounds use `area_height`, lower bounds use `area_at_root`. |
| Directional drive and lid | `Train.drive_prop`; `Train.drive_yen`; `Train.lid_cost`; `Train.lid_root` | `Reserve.lean` | Smooth factor times a rail; lower bound multiplies smooth and zero-root rail lower bounds. The lid is the product of the drive at opposite momenta, so its positive lower bound squares. |
| Uniform noise drain | `Train.feed_budget`; `Train.tap_safe`; `Train.noise_budget`; `Train.drain_reserve` | `Reserve.lean` | Each feed is a normalized finite alias sum; drive products are summed with the uniform `decay 2` residue budget. History noise is priced by the sum of inverse squared cumulative side lengths; its nozzle cost is at most two by induction and side length at least three. |
| Bulb and bend | `Train.bulb_budget`; `Train.bulb_firm`; `Train.bend_budget`; `Train.bend_firm`; `Train.lift_bend`; `Train.bend_strength` | `Bend.lean` | Bulb is lid plus divisor times drain. The lid lower bound and nonnegative real drain give firmness; divisor and drain upper bounds give the complex-cube budget. The identity `divisor*bend = sum(jewel/bulb)` and seed-square lower/upper bounds yield a positive bend lower bound from a uniform bulb upper bound. `Moderate.kept` permits reciprocal use on a smaller cube. |
| Nonzero blow-up lower and inverse | `blow_control`; `blow_firm`; `divisor_real_bounds`; `scaled_seed` | `Chip.lean` | The divisor is the sum of four squared seed magnitudes. One nonzero lift coordinate has seed at least a constant times its lift; the selected square gives a lower bound proportional to `grade(l)^2`. The blow-up is side-length squared times the divisor. |
| Port vector and reciprocal port normalizer | `Flight.portD_budget`; `Flight.portR_budget`; `Train.bulb_budget`; `Train.bend_budget`; `blow_firm` | `Buffer.lean`; `Chip.lean`; `Bend.lean` | Bulb divided by blow-up has price `grade(l)^-2`; reciprocal port normalizer has price `grade(l)^-4`. The statements are on a common cube by `Moderate.inv`. |
| Tail and regular auxiliaries | `Flight.tail_budget`; `Flight.abide_budget`; `Flight.abide_firm`; `Flight.hills_budget`; `divisor_control` | `Buffer.lean`; `Chip.lean` | The nonzero alias terms are summed using `decay_cost`; tail factors include two mass weights and port weight, so the residual sum is bounded by the uniform exponent-two residue sum. Divisor is a finite sum of seed products. |
| Pulse and vault | `heart_budget`; `pulse_pays`; `vault_sources`; `pulse_sources`; `bend_budget`; `bulb_budget` | `Heart.lean` | Diagonal exterior mask of reciprocals/products of bulbs, scaled by reciprocal/product of bends; source reciprocals use the real firmness plus analytic-cube bound. |
| Zero branch | `Flight.copper_budget` | `Cable.lean` | `foot_budget` times order-two flux plus the brace/latch/mouth term minus pulse/latch/tail correction, multiplied by the fixed-scale dual exterior multiplier. Each factor has unit alias price. |
| Nonzero branch | `Flight.stake_budget`; `Flight.levy_budget` | `Cable.lean` | First summand multiplies wing pulse, scaled signal, port mask, order-one flux and fixed-scale multiplier. Second multiplies levy, order-two flux, and notch. Their prices are `grade(l) * grade(l)^-2 * decay j(l)` and `decay j(l)`, respectively; the former is weakened to `decay j(l)` using `grade(l)≥1`. |
| Full wire receipt | `Flight.wire_budget` | `Cable.lean` | Partition aliases into zero and nonzero; invoke copper or stake. `Pay.times` bounds each fixed entry by the finite intermediate type sum; `Moderate.add` handles sums/subtractions. |

Here `grade(l)=1+max_a |lift(l)_a|`, `decay j(l)=mix(l)^-j`, and
`mix(l)=∏_a(1+|lift(l)_a|)`. The nonzero branch's first term has total
weight `grade(l) * grade(l)^(-2) * mix(l)^(-j)`, which is at most
`mix(l)^(-j)` because `grade(l)≥1`. Its second term has weight
`grade(l)^(-4) * mix(l)^(-j)`, which is also at most `mix(l)^(-j)`.
The formal branch closure uses these inequalities (and in the Levy estimate
uses the two mass weights before raising its price to one).

## Source chain into the exported tower receipt

The thread `Flight.wire` is defined by its zero/nonzero branch in
`Lean/YM/Next/FREE_KERNELS/Wire.lean`. For arbitrary index type `ι`, flight
family `F : ι → Flight j t`, and selected alias `l : ∀ i, Site (F i).L`,
`Flight.wire_budget` assumes only `k>0`, `4≤j`, and `4≤t` and proves an
entrywise `Pay` receipt with alias weight `decay j (l i)`. The proof calls
`copper_budget` on zero aliases and `stake_budget` otherwise. `Pay` packages
the finite matrix-entrywise bounds uniformly over all such choices.

The proved overlap identity is `Secured.relay`, instantiated for the wire by
`secure_both`; it says that shifting momentum by a reciprocal vector is
compensated by adding the corresponding wrap residue to the alias. Reality is
the separate `Secured.pearl` law. `Secured.propels` converts the weighted
entry bound to a spread/alias-average cost. Its proof uses
`differential_bound` (each finite difference adds one scale inverse and one
alias-grade factor), `residue_cost` (the exponential phase is bounded
uniformly), and `decay_cost` plus `absorbs` for the alias sum. `enters` and
`traverse` identify Fourier coefficient differences with the true
cover-difference operators including centered carries. `bankCost` combines
the finite type labels, and `limited_lengths`/`honored` uniformize all word
lengths up to `j-2` by finite minima of widths and maxima of costs. The
order-two tower comes from `Flight.duo.T = meshBook (wire k) 2 [] P` in
`Lean/YM/Next/FREE_KERNELS/Primal.lean`; its base and first-difference costs
are the `L^-2` and `L^-3` receipts used by the atlas producer.

## Classification and remaining work

The article now gives the finite train recursion and its quantitative
history induction, including the coefficient-one principal-plank lower
bound, geometric side-ratio lower estimate, inverse-square nozzle
recursion, and successive reciprocal continuation for halo, lid, bulb, and
bend. It also records the actual zero and nonzero branch identities and
their exact matrix order in `free-kernel-estimates.tex`; these calculations
reorganize `Flight.copper_match`, `Flight.stake_match`, and
`Flight.wire_match`. The reciprocal overlap proof is written from the
residue exchange and the two-variable script shift, corresponding to
`Flight.knots_shift` and `Secured.relay`.

The remaining work is to check these prose calculations against the source
in independent review and integrate them with the actual selected-run chain.
This chapter does not claim to prove the finite-scale funding or horizon
response estimates used by the caller; those are separate construction
inputs recorded in the RG construction unit.

## Inspection record

Read-only commands in the isolated clone included:

- `sed -n '1,140p' Lean/YM/Next/FREE_KERNELS/MatrixPay.lean`
- `sed -n '1,140p' Lean/YM/Next/FREE_KERNELS/AliasWeights.lean`
- `sed -n '1,150p' Lean/YM/Next/FREE_KERNELS/Cable.lean`
- `sed -n '1,175p' Lean/YM/Next/FREE_KERNELS/Strands.lean`
- `sed -n '1,135p' Lean/YM/Next/FREE_KERNELS/Sprout.lean`
- `sed -n '1,230p' Lean/YM/Next/FREE_KERNELS/Glue.lean`
- `sed -n '1,120p' Lean/YM/Laurent/Art.lean`
- `sed -n '1,145p' Lean/YM/Work/F07/Read.lean`
- `sed -n '1,120p' Lean/YM/Next/FREE_KERNELS/Wire.lean`
- `sed -n '1,175p' Lean/YM/Next/FREE_KERNELS/Buffer.lean`
- `sed -n '1,220p' Lean/YM/Next/FREE_KERNELS/Train.lean`
- `sed -n '1,220p' Lean/YM/Next/FREE_KERNELS/Bend.lean`
- `sed -n '1,250p' Lean/YM/Next/FREE_KERNELS/Chip.lean`
- `sed -n '1,150p' Lean/YM/Next/FREE_KERNELS/Reserve.lean`
- `sed -n '1,150p' Lean/YM/Next/FREE_KERNELS/Heart.lean`
- `sed -n '1,140p' Lean/YM/Next/FREE_KERNELS/Docked.lean`
- `sed -n '1,240p' Lean/YM/Next/FREE_KERNELS/Moderate.lean`
- `sed -n '1,130p' Lean/YM/Next/FREE_KERNELS/Lines.lean`
- `sed -n '1,90p' Lean/YM/Next/FREE_KERNELS/Aliases.lean`
- `rg -n` over the above files for the named component supplier declarations.

The source pin was checked in `source/upstream.json`. The shared literature
notes were searched for the prior terms `Wilson`, `atlas`, `Schur`,
`kernel`, `strip`, `Laurent`, and `RG`; the relevant found note did not
cover these component estimates. No external result is substituted for the
local source argument, so no web or primary-literature search was needed.
No Lean or LaTeX build has been run for this unit. The required command
`python3 scripts/check_blueprint.py` was run and exited 1 because this
isolated output directory has no `blueprint/units/YM-000026/unit.json`;
adding shared unit metadata is outside the assigned outputs.
