# C02 source-leakage revision: textual Lean-correspondence review

Session, contributor/agent disclosure, exact target and claim are as in `mathematics.md`. Target PR 206 is frozen at `b8b9de0e7554cf0ed2478b13581a7bde633b1c28`; source revision is `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. File hashes and blob IDs are in `inputs.json`. Human acceptance is unset.

**Outcome: no blocking source-correspondence defect found in the bounded revision.** M1 in the mathematical report is a minor notation clarification. This is textual inspection of the changed claims and their immediate definitions, not Lean elaboration, an axiom audit, or acceptance of the source's construction.

## Exact Ledger meaning (rows 41–42)

At the pinned source:

- `YM.Source.Coefficient` in `Lean/YM/Source/Insertion.lean:26` consists of `x : F.Coeff`, `support : ℕ → Support n`, and `regular, forced : ℕ → Config G n → ℂ`.
- `YM.Extra.Histories.Ledger` in `Lean/YM/Extra/SOURCE_HISTORIES/Pencil.lean:83` asserts that the maps v↦(P v).x, v↦(P v).regular, and v↦(P v).forced are complex-linear; its `tags v` asserts equality of the entire address-indexed support function `(P v).support = (P 0).support`.
- `YM.Extra.Histories.Voice` and `YM.Extra.Histories.Heard` in `Replay.lean:26–43` attach this ledger through `Heard.book` to `V.plays` on the same history, period and scale. `Heard` additionally requires format/remainder bounds, the current coordinate/index identity, the cone and subadditivity estimates, motion/unit compatibility, density linearity and covariance. Replacing “source ledgers” by the three maps plus fixed supports does not replace or discharge those other calibrated-voice fields.
- `YM.Extra.Histories.Music` and `YM.Extra.Histories.Sung` in `Song.lean` supply voices and `Heard` on the active interval r≤m≤N, including the reference scale. Thus “finite music” is read on that interval, not as imposing new conditions on irrelevant levels outside it.

The manuscript's parenthesis is a faithful expansion if “marked support” means this **assigned support family**. It is not the actual nonzero support of regular or forced functions: a linear family is zero at v=0, while its assigned support addresses remain. Moreover `P.support i` is the address used for the regular part; the forced fields use the fixed representation's `(R.activities.forced i).support` (see `Coefficient.Format` and `Coefficient.remBound`). An optional clearer wording is “its assigned support at each address is independent of the coefficient”. The author's new source-ledger entry records the exact `P v`/`P 0` equality correctly, so this is a precision note, not a finding that the intended hypothesis is false.

## Gas payment and the ordinary/raised distinction (rows 21–22)

Inspected `YM.PhysicalNext.Repeat.Mallow.Many.corps` and `.crowd` in `Lean/YM/MergeProof/Signed.lean`, and the corresponding `.corps2` and `.crowd2` in `Paprika.lean`. The ordinary `crowd` uses `Arrives`, the same budget/profile identity, the within-step bound on α, a nonnegative soft request, and calls `YM.Merge.Motion.harvest` after widening the paid precursor. The raised route instead consumes `Pungent` and its raised vapor receipt. These are not interchangeable.

`YM.Merge.Motion.Pays`, `.wallets`, `.harvest`, `.widening` and `.winter` in `Lean/YM/MergeProof/Motion.lean` were inspected at their statements and relevant proof steps. `Pays.bought` requires actual finite-switch payment majorants and a rooted hit bound. `wallets` inflates hard prices by exp(κ) and soft prices by 2; `harvest` uses `Paid.prod`, fixed eligibility gates and the connected-set bound, retaining one exp(-κ) factor because every new label has a hard constituent. Widening extends the paid family by zero through the fixed injection; `winter` records the gas/exponential identity. This is the immediate formal route corresponding to the newly cited subsection's finite-product harvesting/fusion argument. The passage does not claim that the fragrance ledger alone supplies those hypotheses.

The numerical `e+2` footprint arguments in row 22 were checked directly in the displayed manuscript definitions. No fresh audit of their entire analytic producer was performed.

## One-column assembly and retained analytic assumptions (rows 33–37)

`YM.Extra.Histories.InputColumn.individual` and `.main` in `Lean/YM/Extra/SOURCE_HISTORIES/ColumnStep.lean` assume a selected history, m<N, `AtomStep`, nonnegative η, a specified coefficient coordinate, `Format`, and `remBound` at the fine forced allowance. The proof constructs separate principal, regular and forced terms; `Coefficient.envelope`, `Rep.envelope`, `Rep.exponentEnv`, `rem_dominated`, `regular_series` and `dress_abs` provide the absolute majorants used at that step. The row-34 prose is therefore read relative to these lawful representation and remainder/envelope assumptions, not as claiming Tonelli alone produces a bound.

`YM.Extra.Histories.reprise` in `Replay.lean` sets c=C+ηs and ε=η(1+s), uses `InputColumn.main` and the incoming cone, then constructs the common pencil. This checks the replacement of the source-normalization phrase in row 35 by the preceding conditional assembly. The unchanged crossing allowance is not newly kernel-verified here.

The new names do not certify field interpolation, mode slots, shipment or bounded-ball uniformity. `RESULTS.md` and the changed prose expressly leave these inputs outstanding. The C09 handoff's same transition/point/slots and coarse-clock-grade interface was inspected as a candidate only; no cross-package match is accepted.

## Other replacements and limits

Rows 18–20, 38–40, 43–45 preserve their displayed statements and explicit caveats; the mathematics report records each check. The exact service price is obtained from the manuscript's `ex-centered-steer` and lawfulness, with reserve f=1 and the original inverse-square-root cutoff in the vacuum denominator. The new reference does not alter that source correspondence.

No `Lean/`, toolchain, dependency, author-record or manuscript modification was made by this reviewer. All source evidence here is read-only and keyed to the frozen target; no successful build, fresh `#print axioms`, elaborated-type dump, kernel replay, Comparator run, transitive audit, or source correctness claim is implied. Historical review records remain historical. Acceptance requires responsible human review and any renewed assessment of later edits.
