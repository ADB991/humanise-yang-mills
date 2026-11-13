# Independent review of the #323 phase-1 audit (PR #325)

- **Session:** `hairer-claude-323rev-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5), with no child agents.
  The account hairer did not author #325.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/323#issuecomment-6867848567>
- **Reviewed:** `results/C13/endpoints/ADB991-claude-20261113-fb6e/` at PR #325 head `b5741d9`, as merged
  into `codex/existence-monograph`.
- **Source pin:** `3456e5e`. All 13 Lean files read match `Lean/SOURCES.sha256` (`hashes.json`).

The Lean was read textually; nothing was elaborated. Human acceptance is unset.

## Verdict

**The audit's main conclusion is confirmed.** The `0` in
`Station.anew : Cash.Renewed 0 0 f.V f.V H` is not a derivative order. On the
C13 auxiliary route, the ordered derivative prices are supplied at the
station order `j` by the same `Station`'s `N`, `army` and `fleets`. The
caveat in `selected-history-limits.tex` (l.170–175) is resolved by its first
branch, and no value-order continuity theorem is needed. No required
correction. One untraced item is closed positively (R1), and one
precision is added (R2).

## Checks

1. **Index meanings.**
   - `Cash.Renewed j a δ δ' H` (`Fire.lean` l.26–33): `j` enters only through
     `thinPay j`, `broadPay j`, `overture … j` and `mergeScale … j`. Here
     `thinPay k = ours 0 k 0 0` and `broadPay k = ours 0 k 1 0`
     (`Threshold.lean` l.50–51), `ours … = reward k` and `reward k s = (∏ text)(1+shapeW s)^k`
     (`SalesRoot.lean` l.39–41), and `overture k = quantum 0 k 0 0` with `mergeScale = 20·overture`
     (`Threshold.lean` l.72–74). So `j` is the weight exponent paired with `reward`
     in `Cash.charged`.
   - Every field of `Renewed` is a value budget (`Ready`, `Ac.Hit`,
     `degreePrice`). In `anew` the second argument is the support exponent
     `a = 0`. Confirmed.
2. **Station.** `Station f χ H j` (`Gest.lean` l.50–54) has exactly the fields `N : Captain H j …`,
   `fleets : ProperPlot H j …`, `army : Armada … j f.k` and `anew`.
   `Brush k u d f x` (`Brush.lean` l.44–47) is `ContDiffAt ℝ k` together with
   `normJ i ≤ u·d^i` for `i ≤ k`. So `j` is the derivative order. Confirmed.
3. **`anew` unused.** `grep -rnw anew Lean/YM` finds only the field and its construction in
   `patrol` (l.68). On the route below, Station fields are accessed only as `.N`, `.army`
   and `.fleets`, with no `.4` projection. Anonymous destructuring was not excluded by
   elaboration, but none occurs in the files traced in R1.
4. **D5 (same input).** `swaths` (`Lands.lean` l.63–75) builds the Stations by
   `deposits` on `safeTrans` of the same chartlets, and identifies the barony via
   `bank`/`spirit`. It then calls `bannersL I X R' C' he rfl (Rain.jersey …).1.le …`.
   This confirms D4's discharge of `B.order ≤ j`, which is a hypothesis of `bannersL`
   (`Poesy/Rosette.lean`, variable `he`).
5. **Q1.** In `patrol` (`Gest.lean` l.55–63), the Captain weight `k` is the
   existential `l` of `Oboe.ell` (`Gio.lean` l.74–78). It is chosen after the order
   `i = j` is fixed, so it may depend on `j`. No hypothesis `k ≥ j` occurs in
   `Armada`, `salary` or `collars` (`Armada.lean` l.23–31). As the audit says,
   the manuscript pays `(1+s)^j` by its own reserve argument, so Q1 does not
   block anything.

## Additions to the audit

- **R1 (closes "not traced" in D3).** The import closure of `FullVolume/Poesy/Rosette.lean`
  (where `bannersL` lives) contains `E6/Coterie.lean`, `E6/Gest.lean` and `E6/Bandle.lean`.
  It does not contain `Umbra/Arcade.lean`, the projection the audit cited.
  On the `swaths → bannersL` route, the cluster criterion is consumed in
  `E6/Bandle.lean` (lemma `air`, l.28–40) as `(R n).army.applies (R n|>.N) 0 s x'`.
  `Armada.applies` (`Armada.lean` l.50) is proved from `T'.purchases N` via `log_hit_tail`.
  So D3's supplier is on the C13 route, through `applies`. The status "supplied" stands,
  with the consumer locator `E6/Bandle.lean` replacing `Umbra/Arcade.lean`. The same
  closure uses `.N` (Bandle, Bronze, Coterie, Lock, Triumph), `permitAverage` (Bandle, Coterie,
  Ques) and `.fleets` (Bourse, Lock, Paid, Rebuke, SheetP), which matches D1, D2 and the
  `fleets` row.
- **R2 (precision for phase 2).** The C13 author should cite the route
  `swaths → bannersL` with hypothesis `B.order ≤ j` and Station family `deposits`, and
  keep S1 as the one manuscript matching statement. The phrase "ordered prices at order
  `j ≥` the required order" is right. The required order is the budget point's
  `B.order`, which is not the activity profile order in general. The audit's D4
  wording "`j = (X.p.profile (J m)).order`" refers to `quarters`. Both are
  consistent, because the discharge is `(Rain.jersey …).1.le`.

## Not checked

- The bodies of `Utopia.stream`, `Captain.permitAverage` and `ProperPlot`.
  Only their statements, and their consumption on the route, were checked.
- `Mixed.Costs.ceiling`.
- The review status of `selected-nonlinear-offering.tex`.

Phase-1 acceptance under #323 is met by this independent check. Phase 2
(the C13 caveat and ledger update, including S1) remains for the C13 author.
