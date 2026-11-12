# Local stationary face estimates

## Status and scope

Draft, awaiting independent mathematical and source review. Source pin:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464` from `source/upstream.json`.
Owned prose: `manuscript/existence/annulus-fleet-face-estimates.tex`.

The prose proves the price-to-face calculation, the all-centered and shell
scale substitutions, and the selected-bed row identities (F14)--(F16). It
derives the scale-weighted input prices (F6a)--(F6d) from the selected path
packages: tab budget (L), one-leg budget (L/T), and two-leg budget
(L/T^2), with (L=T^2) for the interacting row and (L=\mu^2) for the
regulated reference. The shell difference prices follow from the cubic tab
contact, the common linear coefficient of the interacting and free marked
rows, and the regulator contribution. It also derives metric normalization
by cancelling the regulator tab in the same House identity, derives the free
symbol identity from the degree-zero exterior Cartan identity, computes the
vacuum marked row's first radial coefficient from the three plaquette
placements and the fixed free film, and proves the total denominator's
zeroth inverse bound from the bed floor and cold lower bound. The halo prices
are shell-only because the unregulated reference inverse is undefined at the
center.

## Source correspondence

All paths below are in the pinned `Lean/` source.

- `YM.Stationary.Jam`, `Fiesta`, `Fiesta.pair`, `Fiesta.plus`,
  `Fiesta.inv`, `Fiesta.invDiff`, `Jam.rebounds`, `Jam.sweet`:
  `YM/Next/STATIONARY/OneLoop/Weights.lean`. These implement the derivative
  price calculus (F1)--(F3); in this application `vflux` is the Euclidean
  operator norm, and the trace estimate is `flux_trace` with the finite matrix
  dimension factor.
- `YM.Stationary.Fleet`, `Fleet.basic`, `Fleet.bubbleHV`, `Fleet.focus_bill`,
  `Fleet.tadControl`, `Fleet.bubbleControl`, `Fleet.cool0`, `Fleet.brass`,
  `Fleet.haloControl`:
  `YM/Next/STATIONARY/OneLoop/Propagators.lean`.
  `Fleet.basic` merges the interacting Week at scale `T^2` with the
  reference Week at scale `mu^2`, using `mu≤T`. `bubbleHV` prices the full
  upper and lower four-factor expressions. `focus_bill` takes the order-two
  price and applies `|tr M|≤dim(E) vflux(M)`. `tadControl` splits the upper
  arch into the reference term (price `mu^2/T^2` at derivative scale `T`)
  and the interacting term (unit-scale arch price plus the total inverse at
  its zeroth-order price `T^-2`). `bubbleControl` follows from
  `bubbleHV` and `focus_bill`.
- For the halo difference, `cool0` gives the inverse-denominator
  difference price `rimEdge/T^2`; `sepJ` gives the displaced-leg
  difference price `T^2`, which is enlarged to `rimEdge*T` because
  `T≤rimEdge`; `brass` combines these four receipts by the ordered
  product-difference identity. `haloControl` takes its trace price.
  These are exactly the four summands of (F9), in the order of the
  noncommuting factors, not an estimate for an unordered scalar product.
- `YM.Stationary.Rally.coin`, `Rally.register`, `Rally.shell`,
  `Rally.bait`, `haloRate`, `poleVec`:
  `YM/Next/STATIONARY/OneLoop/Bubbles.lean` and
  `YM/Next/STATIONARY/OneLoop/Propagators.lean`. `Rally.coin` is the
  fixed color coefficient `1/2*(1/2*rod_interacting-rod_reference)`;
  `rod_plucked` writes each rod as upper minus lower. `Rally.register`
  combines two full-face bounds. `Rally.shell` uses the halo identity and
  the two upper/lower estimates. The continuum halo-to-pole calculation is
  the preceding manuscript proposition `prop:ex-two-wave`.
- `YM.Stationary.Hstar`, `Orion`, `BundleS`, `Looming`, `Bundled`,
  `Looms`, `getReals`, `astronomy`, `Waves1`, `Waves2`:
  `YM/Next/STATIONARY/OneLoop/Bubbles.lean`. `Looms` proves the all-centered
  ColdR conditions with scale `flay(x)+mu` and cap `1+2*pi`. For the shell,
  `astronomy` restricts to `mu≤flay(x)` and changes the scale to `flay(x)`.
- `YM.Stationary.bedLum`, `howlin`, `inflamed`, `jarBurst`, `barePost`,
  `granite_tab`, `rockEdge`, `vectorPing`:
  `YM/Next/STATIONARY/OneLoop/Leading.lean`. `barePost` follows by expanding
  the same-bed House equality and cancelling the regulator tab. The proof of
  `bedLum` then subtracts the leader identity: the metric difference is
  first-order at zero by `Floor.starts`, the two edge symbols add two powers,
  and `rockEdge` supplies the cubic difference between the exact lattice
  scalar and its quadratic part. For marked rows, `granary` is the local film
  plus the fixed free film; `inflamed` splits the two-leg coefficient into
  its local soft part (`jarBurst`, order two) and the grey vacuum-minus-vector
  part (`howlin`, order two). `vectorPing` proves the vacuum first radial
  coefficient: `coronet` sums the three Wilson plaquette placements and
  `axePing` gives the fixed free-film coefficient; their sum is exactly the
  displayed vector insertion. It is therefore derived in the prose, not
  retained as an independent identity assumption.
- `YM.Stationary.dais_floor`, `throne_floor`, `granaryTall`, `grainTall`,
  `solidT`, `getReals`, `glaze`:
  `YM/Next/STATIONARY/Spectral/AuxReferences.lean`,
  `OneLoop/Propagators.lean`, and `OneLoop/Bubbles.lean`. Combining
  `dais_floor` with `cold_safe` gives `min(epsilon,1)/2^16` times the square
  of the scale as a lower eigenvalue bound for the interacting denominator;
  `throne_floor` gives `2^-16` for the ghost denominator. `solidT` turns these
  stable lower bounds into the required total inverse control. `getReals`
  assembles both Floe/Week/Tall packages from the same `Hstar` sequence,
  `Orion` House/floor/fee/soft fields, common grey reference and centered
  ColdR data. The separate shell comparisons `cool0`, `sepJ`, `brass`, and
  `haloControl` require positive unregulated scale and are only applied on
  `mu <= |x|`.
- `YM.Stationary.price_step_metric`, `bed_gain`:
  `YM/Next/STATIONARY/Loops/Fourier.lean`. The latter adds the two
  first-order edge-symbol factors to an order-one metric difference.
- `YM.Stationary.patrol_president`, `patrol_house`, `Patrol.marries`,
  `sipPatrol`, `sipLight`, `ashCost1/2/3`, `limo_cast`:
  `YM/Next/STATIONARY/OneLoop/Propagators.lean` and `Weights.lean`.
  Fee bounds and Cauchy estimates give uniform compact derivative caps.
  `Patrol` records these caps through the required derivative order;
  `sipPatrol` restricts them to the selected line (x+t e), using
  “Rays” vanishing and “dawn”'s Taylor remainder estimate, while
  `sipLight` supplies the bounded-radius arch price. Radial vanishing
  forces lower homogeneous Taylor tensors to vanish because each is a
  polynomial zero on every real direction. This yields the (T^3) tab
  remainder, (T^2) insertion remainder, and unit-scale arch bound used
  in the manuscript.
- `YM.Stationary.Week`, `Week.pays`, `Week.spot`, `Week.basic`,
  `Fleet.basic`, `Fleet.bubbleHV`, `Fleet.tadControl`, `Fleet.bubbleControl`,
  `Tall.storms`, `Tall.beats`, `Floe.vector`, `Floe.ghost`, `sepJ`,
  `bloomJ`, and `Fleet.cool0`: `YM/Next/STATIONARY/OneLoop/Propagators.lean`.
  In `Week X T L`, the tab has budget (L), each spot has budget
  (T^{-1}L), and each arch has budget (T^{-2}L). `getReals` supplies
  the interacting-plus-reference path with interacting tab budget (T^2),
  regulated reference budget (mu^2), and a `Tall` bound at (T^2).
  Hence the total denominator path has tab budget (O(T^2)), its inverse
  paths have budget (O(T^{-2})), the local and reference arches have
  budgets (O(1)) and (O(\mu^2/T^2)), and total legs have budget
  (O(T+\mu^2/T)=O(T)). On the shell, the free scalar denominator has
  inverse norm (T^{-2}); the local-minus-free tab costs (T^3), the
  regulator costs (mu^2), and the inverse identity gives
  (O((T^3+\mu^2)/T^4)=O(\delta/T^2)). For legs, the local row minus
  the free Wilson leg has Ray order two, while the reference leg costs
  (O(\mu^2/T)); together these give (O(\delta T)). These are the
  quantitative derivations of the stated F6 prices, rather than additional
  price assumptions.
- The regulated reference's component prices are traced through
  `cinderWeek`, `cinderTall`, `chertWeek`, `cannonWeek`, `stoneWeek`, and
  `glaze` in `Propagators.lean`. The massive free film has tab budget
  (T^2) and scalar floor (T^2/64); the inverse-reference film's
  tab/spot/arch costs are (mu^2/T^2,mu^2/T^3,mu^2/T^4). Enlarging
  its tab budget to (1), taking the nine-factor product, weighting by
  (mu^2), and adding four constant directional sandwiches gives the
  actual reference path with costs (mu^2,mu^2/T,mu^2/T^2).
- The exact inverse-film component identities and product slot formulas
  used in that calculation are `Film.vSpot`, `Film.back`, and `Film.pay`
  in `YM/Next/STATIONARY/Loops/Syntax.lean`. A back spot has two inverse
  tabs and one original spot; a back arch has the two ordered
  spot-insertion terms and the original arch term, each flanked by
  inverse tabs. A product spot has two summands and a product arch four.
  The manuscript expands these formulas and the inverse-reference costs
  before iterating the nine factors.
- `Jar.soft` in `OneLoop/Lattice.lean` is the exact soft-3 convention:
  the unmarked layer has radial order three, the one-mark layer order
  two, and the two-mark layer order one. `jarBurst` composes the one-mark
  layer with a linear two-momentum map; `inflamed` adds the grey-vacuum/free
  second-order contact. This is the source of the marked-row contact, not
  a claim that every component of the action vanishes to degree three.

## Checks

- Inspected only the declarations and immediate helper proofs listed above;
  no Lean command or full build was run.
- No TeX build was run.
- `git diff --no-index --check /dev/null FILE` was run on the TeX and
  evidence files after the latest edits; it printed no whitespace diagnostics
  (status 1 is due to comparison against `/dev/null`).
- `python3 scripts/check_blueprint.py` was run and failed only because the
  parent-owned `blueprint/units/YM-000026/unit.json` is absent in this clone.
- No files under `Lean/` were changed.
