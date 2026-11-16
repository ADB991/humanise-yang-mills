# Findings and repairs

## F1: public boundary clause and integrability

Confirmed G01 P4 directly in `YangMills.Hierarchy.Reconstructed.boundary`:
the target states a limit of totalised integrals, without a separate
integrability field. The previous prose presupposed ordinary integrals.
`eq:public-selected-boundary` now spells out the product tests, positive
imaginary shifts and operator order, and defines the zero value for a
nonintegrable integrand. This is the public target convention, not an assertion
that the constructed contour lacks integrability. The latter requires the
estimates in `sec:analytic-boundary`, particularly `lem:tested-cr` and
`thm:joint-boundary`; their entire analytic dependency chain was not reviewed here.

G01 P1/P3 were also applied: regularity now explicitly uses links with BOTH
endpoints in the translated stencil. P5 and the core qualification of P6 were
incorporated: the public predicate does not require reconstruction for every
phase, multilinearity of all phase correlations, a prescribed insertion
formula, or a stress-tensor identification. These statements were checked
against the definitions, without relying on G01's constant-insertion proof.
That proof and PR #74 still need their separate independent review. No new
counterexample or criticism of `YangMills.constructed` is asserted here.

## F2: first-stage payments and choice order

`common-scale-selection` previously said to meet the first-stage entrance,
then described enlargements of the entrance delays later in the chapter.
The intended order is now explicit: `d_j` is the FINAL threshold, and the
initial coupling is chosen above `d_{j_*}` only after all numerical maxima.
On the first plateau beta_hat_m >= beta_* >= d_{j_*}; after it the stage-entry
argument applies. Thus the all-stage payment, including m=0, is justified
without treating an already chosen clock as paying a new bill. This matches
`Bar.exists_above`, `Wait.ready` and `NativePostLengthPayment.eventuallyPaid`.
It is a clarification of the intended construction, not a counterexample to
the previous conditional numerical proof.

## F3: profile order

`public-run-binding` now retains order >= 6+j and spatial power >= 2+j,
consistent with the choice in `ope-scale-purchases`. The earlier lower bounds
>= j were true but weaker and did not explicitly retain the chosen profile.
The source's starting Orders has these values; enlarged orders may be larger.
Support exponent exactly 100 for parameters is kept separate from budget
support exponent >= 100. No claim of exact final derivative order was added.

## F4: OPE endpoint pointer

As requested by the C05 author handoff (#46), assembly now names
`thm:ope-quantitative` and requires its matched-field and phase hypotheses on
the SAME hierarchy/prescription. This connects the displayed endpoint bounds
to their canonical conditional supplier; it does not discharge that supplier.

## F5: local arguments retained

The two scalar forced payments have exponents mu/8 and mu/16 and use the same
coupling. The comparison-window floor uses integer-valued windows; from
w(s) <= k/2 one obtains w(s) <= floor(k/2). The period divisibility formula
has p >= z even for divisor 1. O1--O9 have fixed-stage constants and do not
take an infinite maximum over stages. The 6L elementary transport retains the
forced PROFILE, not merely its integrated density. No local algebraic error
was identified in these inspected arguments. Their analytic hypotheses remain
those in the ledger; this is not a new independent approval of inherited text.

## F6: outstanding joins

The numerical selector cannot supply the estimates it schedules. C12/C13 must
still validate the actual exported local-course and compiler data on the fixed
run; C14 must supply the physical/free Ward inputs with one nonzero stress
normalization; C03 must supply full-mesh convergence and the appropriate field
quotient; C05 must supply the matched-field OPE; C15 must supply the trace
comparison inputs, including external #33/#34. Canonical YM-000022 requires its
review response and exact running-estimate application. The seven C16 chapters
do not own these producers. No missing producer has been replaced by a newly
invented assumption. `ex-joint-input` remains visibly outstanding.

The C04 time-first coordinates versus statement.tex's time-last public
coordinates require an explicit permutation at the reconstruction interface.
This author retains the public time-last convention. C04 review #76 also
requests a nonzero-label producer: neither the numerical schedule nor mere
naming of the trace field supplies it. This remains part of the C14/C04 join.

## F7: individual-marker versus grouped-cell singleton

The pre-submission live recheck found C05 review #79 M10/L4, relayed on #57.
Confirmed directly in `Fibers.reap` and `plena`: the coefficient at a grouped
cell is the old coefficient on the FULL fiber of slots. The old sentence in
ope-history-service could be read as preserving a sum of first derivatives
after grouping, which is false. It now explicitly restricts that identity to
individual markers before grouping, states the full-fiber rule, and gives the
two-slot exponential calculation. The zero-mark background identity remains
unchanged. This repairs an ambiguity with mathematical consequences, not just
notation. C05 independently owns the regrouping proof.

## Revision 1 (session ADB991-claude-20261113-33ce): answers to review PR #97 and the G01 handoff

See `revision-1.md` for the item-by-item table. R4: G01 P2 is now adopted in `statement.tex` (compactness, no connectedness, no irreducibility, normalization by r_G, checked against `lattice.tex` 35); P6's remaining sentences are adopted; P7 is adopted as one sentence pointing to `ex-conditional-existence`; P5's withdrawn sentence stays out. G01 Finding 1 is added as `rem:ex-target-adequacy`; G01 M3 (group transfer) is not mentioned in the manuscript, so its hypotheses are not needed there.
