# YM-000026 centered budget production: evidence

Status: author draft. This unit has not yet had independent mathematical or
Lean-correspondence review. Source revision inspected:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Scope

The prose is `manuscript/existence/centered-budget.tex`. It proves the exact
finite-volume conversion from a radial transfer lane and its stopping-depth
bill to a centered copied-product root estimate, including the all-site
translation step. It states the lane price estimate as a local input; its
proof is now in `manuscript/existence/centered-production.tex`. The upstream
production of ready/covering schedules and service certificates remains open.

The output matches the `centeredBudget` target: for a grade `g` label, one
centered tiling at depth `m`, all sites, chamber interiority, and root test
bounded by the specified right-hand side. In the source `YM.Extraction.Wcmain`
has one eventual volume tail that works for every period, so the same source
estimate supplies both fixed-period and expanding-period budgets by
restriction. The prose keeps this quantifier order explicit.

## Exact source correspondence

| Prose component | Pinned declarations and paths | Checked correspondence |
|---|---|---|
| Finite-volume lane and transfer conditions | `YM.Overlay.Lane`, `.Works`, `.signal`, `.from_`; `Lean/YM/Overlay/Engine.lean` | A lane has a slab family at each level, marker loads and actual configuration functions. `Works` asserts admissibility, active radial data at every level from its stop to terminal scale, parent compatibility of origins, integrability, the terminal identity, and the recursive transfer equation. Induction down the finite sequence identifies the full-mode normalized moment with the terminal lane product; there is no limiting step. |
| Exact radial budget | `YM.Overlay.Bands.Radial`; `Lean/YM/Overlay/Table.lean` | `pure`: every marker weight is positive. `localU`: weight times local coefficient norm is at most `u`. `factor`: `b>0`. `bulk`: nonnegative `t_i` bound each positive-ray coefficient on its healthy support; the weighted toll times support-mass charges have per-origin `SumBudget c`. `hits`: nonnegative `t_{ij}` bound each marked interaction coefficient pointwise; their weighted toll and forced-support charges have per-origin `SumBudget (d*b)`. The prose renames the hit coefficient `d` as `gamma` to avoid confusing it with observable grade. |
| Radial data controls the lane moment | `YM.Overlay.Lane.pays`; `Lean/YM/Overlay/Engine.lean`; `Bands.bulkBound`, `.baseBound`, `.population`, `.physical`, `.material`, `.total` in `Lean/YM/Overlay/Pays.lean`, `Bill.lean`; detailed proof in `centered-production.tex` | The source first sums the per-origin budgets using nonempty ray/forced supports, obtains absolute summability and total price bounds, bounds the full subset expansion by `exp(sum of prices)`, integrates the density, and divides by the positive vacuum denominator. `Lane.pays` yields the product of the scalar blocking monomial, the norm of the normalized full-mode moment, and the full-mode polynomial toll, bounded by the exponential of `Bands.finalBill`. The production unit proves the absolute-price and denominator estimates; this unit applies the resulting lane price estimate. |
| Extensive cost conversion | `YM.Vac.suffices_bill`, `YM.Vac.treasury`; `Lean/YM/Vac/Treasury.lean`; `Bands.finalBill` in `Lean/YM/Overlay/Bill.lean` | The final bill is bounded by the number of fine sites times the per-site treasury plus `q(u+c+gamma*b)`, where `q` is marker count. For markers filling the depth-`m` torus, `q=|Lambda_m|`. The exact four-dimensional site-count identity is `|Lambda_r|=|Lambda_m|(a_m/a_r)^4`. |
| Root extraction | `YM.Stock.est`; `YM.Cells.Tiling.rootTest`, `.powering`; `Lean/YM/Overlay/Terminal.lean`, `Lean/YM/Cells/Tiling.lean` | The full centered mode has one copy per cell. Its moment is `M`; the root test is `||M||^(1/|Lambda_m|)`. The lane scalar is `(a_r^g)^|Lambda_m|`, and the constant weight toll is `W^|Lambda_m|`. Taking the positive root gives exactly `exp((a_m/a_r)^4*tau_r+u+c+gamma*b-g log(a_r)-log W)`. Since `a_r=exp(-scale(r))`, the grade term is `g scale(r)`. |
| All-site chamber interiority and translations | `YM.Stock.clear_interior`, `YM.Stock.translate_s`; `Lean/YM/Overlay/Supplier.lean`, `Lean/YM/Overlay/Terminal.lean` | A fixed finite stencil fits inside the centered chamber for every period and site once volume is sufficiently large. The centered moment/root is translation invariant under the specified positive-chamber interiority condition, so an origin estimate gives all-site centered budgets. |
| Finite-prefix absorption | `YM.Stock.Stops.centering`; `Lean/YM/Overlay/Supplier.lean` | From an eventual bill bound `bill_m <= (g+eta) scale(m)`, take `A` to be one plus the finite sum of early-depth ratios `exp(bill_m)/exp((g+eta)scale(m))`. Later depths have ratio at most one. The same `A` is independent of period and volume if the stop data is. |
| Upstream actual stop and lane producer | `YM.Stock.Fuel.record`, `YM.Stock.Stops.works`, `YM.Input.Metered.rootwise`, `YM.Extra.Multi.metered`; `Lean/YM/Overlay/Prior.lean`, `Supplier.lean`, `Assembly.lean`, `Lean/YM/Extra/MULTISOURCE_BOUNDS/Application.lean` | `Fuel.record` turns `Fuel.covers` and the schedule's pay estimate into the eventual bill inequality; `Stops.works` requires a stop-indexed sequence of service certificates. The production unit spells out the scale arithmetic in `Fuel.record` but does not prove `Fuel.ready`/`Fuel.covers` or construct their lanes. The producer chain is `Extra.Multi.metered` → `Input.Metered.rootwise` → `Stops.centering` → `Wcmain`. `Extra.Multi.metered` requires `C.Makes`, `Prepared` (including factorial/tabs), eventual `Thick`, and `Offer` (plus gauge simplicity); these remain upstream obligations. |

## Exact conclusion and limits

The conversion proves a finite-volume estimate for a given transfer lane. Its
important numerical factors are all explicit: `a_r^g` once per copied marker,
`W` once per marker, the site-count ratio `(a_m/a_r)^4`, and the additive radial
cost `u+c+gamma*b`. No factor depending on the number of transfer-matrix
states is inserted. The lane needs to fill the entire centered cell set so the
root exponent agrees with the full-mode marker count.

The remaining substantive task is to prove the actual stop package from its
RG prerequisites: a lane service certificate for all bounded labels and all
periods, plus an eventual stopping-depth bill bound of `(g+eta) scale(m)`.
The section records that requirement but does not infer it from the existence
of a lane or from `C.Makes` alone.

## Checks

- Inspected the declarations above and their immediate dependencies with
  targeted `rg` and `sed`; no Lean source was changed.
- No Lean build was run.
- Earlier compilation covered the pre-production version. Recompile all
  centered sections after the current edits; no check is claimed for this
  fingerprint yet.
- The blueprint checker cannot complete in this checkout because
  `blueprint/units/YM-000026/unit.json` is absent; no metadata file is in this
  unit's owned outputs.
- The earlier centered-estimates review is complete. The current centered-budget
  evidence and centered-production section await review.

## Integrated local review

The independent stronger-agent conditional pass is recorded in
`reviews/draft-review.md`; all machine review fields remain null. The earlier
pending-review entries above record the author checkout stage. Actual lane,
terminal birth, raw-step and service producers remain obligations.
