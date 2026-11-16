# C02 M1 response: source correspondence

**Verdict: both requested clarifications match the immediate definitions; no correspondence correction required.** Target `65f1c8515da5eaac93383a5395499a3178246851`; upstream pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. This is textual inspection, not Lean elaboration, an axiom audit or a renewed full source review.

`YM.Extra.Histories.Ledger` in `Lean/YM/Extra/SOURCE_HISTORIES/Pencil.lean` (83ff) has the three fields asserting complex linearity of the coordinate, regular and forced maps, and `tags v : (P v).support = (P 0).support`. The equality is of the entire address-indexed support function. `YM.Source.Coefficient` in `Lean/YM/Source/Insertion.lean` (26ff) stores `support : Nat -> Support n` separately from its regular/forced function families. Thus the revised coefficient-independent assigned-support wording is exact.

The `Coefficient.Format`/`remBound` definitions in the same insertion file retain a distinction: the regular component is associated with `P.support i`, while forced components use the fixed representation's `(R.activities.forced i).support`. The new wording does not identify these families or replace either with a function's nonzero set. No other calibration, music or history field is discharged by expanding the Ledger hypothesis.

For M1 the immediate source of the claimed inequality is the manuscript formula `ex-centered-steer`, inspected directly together with its lawfulness step. The site-count specialization is unchanged; only the conflicting dummy-variable identification is removed. The earlier PR #209 reports were read to verify that the response answers their precise concern, not to refresh their wider review status.

No source, manuscript, author record or previous review file was edited. Frozen old/new versions and immediate inputs are recorded in `inputs.json`; human acceptance remains unset.
