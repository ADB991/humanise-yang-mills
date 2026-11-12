# Bounded refresh of the OPE closure interfaces

Parent audit, 12 November 2026. Source pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
This records current manuscript interfaces and existing correspondence leads.
It is not a new proof, a source absence finding, or an independent OPE review.

## Why another OPE derivation is not the next task

The current text already contains the finite prescription, homogeneous averaging,
local grouping/transfer, cutoff matching accounting, physical filtration,
all-character price transfer, grid interpolation and final raw-to-homogeneous
estimate arguments. Several older paragraphs still describe downstream inputs
as unproved. Do not infer a new missing theorem merely from that wording; check
the newer canonical producers. Conversely, the presence of both chapters does
not establish that their hypotheses agree on one selected history.

## Exact interfaces to reconcile in C05

1. `ope-grid.tex`, `input:ope-match`, needs ONE sequence of original degree-q
   labels Q_n with discrepancy price rate
   tau(p;a,d)-(q+1/16)(a-b), quota-price rate tau(p;a,d)-qa,
   whole-label norm multiplier of rate qa, and low-filtration approximants at
   every 1<=m<=q with relative norm rate (q-m)a. This is for every fixed
   differentiated cluster list and 0<b<a<x<d; positions and phases may vary.
   It is not sufficient to choose a different Q_n for each phase or low degree.
2. `ope-cutoff.tex` constructs the rates, intermediate geometry and a same-match
   sublimit. Its displayed affordability conditions
   `eq:ope-match-pay-one` and `eq:ope-match-pay-two` precede the centered
   discrepancy bound `eq:ope-cutoff-discrepancy`. The latter's finite-cutoff
   comparison is supplied mathematically by `reference-match.tex` at its
   explicit signed-path, marked-transfer, chamber and terminal-reference
   inputs. Match the opening/matching index conventions explicitly: the
   reference chapter uses m for the opening and k for the match, whereas the
   OPE accounting uses k for the centered test and its opened K(k) for the
   opening, and m for the match. Check the actual
   one-step coefficient location and constants instead of substituting symbols
   by eye. The +5 complete-replicated-moment price is essential here.
3. `leaf-transfer.tex`, `eq:leaf-projection-allowance`, gives the elementary
   coefficient/remainder and exact marked-profile identity needed by
   `ope-local-projection.tex`, `eq:ope-leaf-projection`. Its numerical conclusion
   is not a substitute for the stated raw derivative and profile hypotheses.
   `ope-history-service.tex` supplies the selected-history compatibility and
   exact compression prices; C06/C08/C12/C16 must acknowledge the analytic supplier
   and the same adjacent transition at the exact parameters.
4. `ope-phase-prices.tex` proves the all-character transfer of the COMPLETE
   discrepancy on the same label sublimit, using centered prices and even
   moments. It also gives the rough cluster rate x*w(p) and the rate-zero
   fixed-clearance spectator insertions needed by the grid argument. It does
   not produce the finite-cutoff match, and it must use the same Q_n as item1.
5. `ope-filtration.tex`, `eq:ope-physical-distance`, is the physical, not merely
   bare-coordinate, low-degree conclusion. Its normalized-test argument retains
   actual triangular transport, local protected-trial comparison and projections
   p_c->p with vanishing tests on ker(p_c). `finite-rank-kernel-transport.tex`
   explicitly points to this consumer, conditionally on its common projections.
   C14 owns the finite-rank transport and equation/insertion relays; C13 owns
   the local-trial/selected-history estimates. Both packages must match them to these exact projections, cutoff-dependent derivative orders and
   thresholds. Fixed-order bounds or separate choices of sublimits do not suffice.
6. With items1–5 established, `ope-grid.tex` already proves the grid-to-all-point
   and derivative interpolation, and the intermediate-scale slack argument gives
   `input:ope-raw-estimates`. `ope-estimates.tex` then proves the homogeneous
   coefficient and full remainder bounds, including uniformity in varying
   geometry/phases by a violating-sequence argument. Preserve the finite
   truncation quantifiers and identity/empty-cluster cases.

The matching and all-character discrepancy arguments use different refinements
only where explicitly justified; the final matched label must retain all required
bounds simultaneously. Cross-package acknowledgement should identify the exact
producer labels, normalization, common family/filter and status, not just cite
an entire section. The retained conditional statements must not be deleted until
this ledger is actually discharged.

## Canonical source leads (from existing correspondence)

Consult `ope-evidence.md`, `ope-history-service-evidence.md`,
`ope-scale-purchases-evidence.md`, and the reference/local-projection evidence.
These supply qualified declarations and inspected source records; their older
status paragraphs may be superseded by current exact-hash reviews.

- `YM.OPE.funding`, `YM.OPE.price_plot`, `YM.OPE.height_room`:
  `Lean/YM/OPE/Prices/{Circuit,Space}.lean` and the adjacent recorded sources.
- `YM.OPE.Columns.limit_cap`, `whole_origin`, `fare_rate`, `limit_lower`:
  `Lean/YM/OPE/Columns/{Limit,Reannounce,ExtensionCost}.lean`.
- `YM.OPE.found`, `cloud_jump`, `grid_coeff`, `grid_remainder`, `interpolated`,
  `common_rate`, `early_rate`: the exact Schemes/Interpolate/Eye paths recorded
  in `ope-evidence.md`; resolve each declaration before making a fresh claim.
- The selected service uses `Campaign.opePackage17` and
  `YM.PhysicalNext.Repeat.Legato.exodusN` with the same purchased run; retain
  the final constant100 support profile rather than an illustrative alternative.

This refresh did not independently reread those Lean declarations. It read the
current TeX statements/proofs and the existing source correspondence, and used
scoped `rg` to locate the exact cross-references. No Lean build or axiom replay,
no prose changes, and no new literature substitution. No claim that the list is
an exhaustive OPE dependency graph.
