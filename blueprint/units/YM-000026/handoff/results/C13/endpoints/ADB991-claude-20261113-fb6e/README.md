# C13 join: `Station.anew` and the ordered derivative prices of the comparison supplier (phase 1 audit)

Issue #323 (parent #54, #26). Session `ADB991-claude-20261113-fb6e`. Claim:
https://github.com/hairer/humanise-yang-mills/issues/323#issuecomment-6867078177.

This report only records findings. It edits no manuscript, ledger, existing record, shared file or `Lean/` file.
ADB991 did not write `selected-history-limits.tex`, the C09 comparison chapters,
`completion-20261113.md` or review #213. Independent review by a different account is required
(acceptance criterion of #323).

## Inputs

| Object | Version |
| --- | --- |
| Canonical text | `codex/existence-monograph` @ `9c921842f25479533e00235452c8ce6b1aa49aac` |
| Lean | pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (tree `328ad19b`, identical on `main` and on the base above). Read textually; nothing elaborated. |
| File hashes | [`hashes.json`](hashes.json): SHA-256 of the 9 manuscript/record files and 31 Lean files read |

## The join as recorded

`selected-history-limits.tex` l.161–175 applies the C09 fixed-volume continuity to every auxiliary
history with a prescribed coupling script and zero terminal activity. It says that "renewed value
prices alone do not supply the ordered derivative prices of the cited comparison argument".
`completion-20261113.md` (join 1) and mgubi's review #213 (`mathematics.md` item 1;
`source-correspondence.md` l.38–39) base this on the following reading.
`YM.ConnectedActivityE6.Blaze.March.Station` (`FullVolume/E6/Gest.lean` l.50–54) has the field
`anew : Cash.Renewed 0 0 f.V f.V H`. That is read as a renewal **at derivative order zero**, while
the comparison needs positive-order prices.

## Verdict

**The index set to 0 is not a derivative order.** On the source route, the ordered derivative
prices are supplied at the station's own derivative order `j`. They live on the same auxiliary
`Cash` dictionary, through the fields `N` (Captain), `army` (Armada) and `fleets` (ProperPlot) of
that same `Station`. The source route needs no value-order continuity theorem. `Station.anew` is
never projected by any declaration I could find.

No **missing** item was found in the source. What remains is one manuscript statement, S1 below,
plus open question Q1. Both are phase-2 work for the C13 author.

## 1. Meaning of the indices (from the definitions)

| Declaration | Index | Meaning, with evidence |
| --- | --- | --- |
| `Cash.Renewed j a δ δ' H` (`AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Fire.lean` l.26–33) | `j` | **Polynomial size-weight exponent.** It enters only through `H.thinPay j`, `H.broadPay j`, `Q.overture L μ α j` and `Q.mergeScale L μ α j`. `thinPay k = H.ours 0 k 0 0` (`Threshold.lean` l.50). `ours m k r u s = if ticketsP m r u s then reward k s` and `reward k s = (∏ text)·(1+shapeW s)^k` (`SalesRoot.lean` l.39–41). `Cash.coinPay` (`Threshold.lean` l.54) bounds `‖entries‖·(1+shapeW)^k` by `thinPay k`. Every field of `Renewed` bounds **values** (`Ready`, `Ac.Hit`, `degreePrice`); none bounds derivatives. |
| same | `a, δ, δ'` | Support exponent (`full : 0 ≤ a`), reserve and tree margin, with `a+δ'+δ ≤ Q.exp` (`sits`). |
| `Cash.ours m k r u` / `Mixed.Costs.ceiling m k r u` | `m, r, u` | Ticket thresholds. By `Cash.pick` (`Expenses.lean` l.80), the ticket requires `m ≤ card p − 1`, `r ≤ numP p` and `u ≤ shapeW p`. `ceiling m k r u` is the price paired with `ours m k r u` in `Cash.charged` (`SalesRoot.lean` l.47). I did **not** read `Mixed.Allowed` or `Mixed.Costs.ceiling` themselves; the reading of `m, r, u` comes from `pick` and `charged`. |
| `Station f χ H j` (`Gest.lean` l.50) | `j` | **Derivative order.** It is passed to `Captain H j …`, `ProperPlot H j …` and `Armada … j k`. These use `Mode U y j v`, `Brush j`, `Ore … j`. `Brush k u d f x` (`Brush.lean` l.44) is `ContDiffAt ℝ k f x` together with `normJ i f x ≤ u·d^i` for `i ≤ k`. `Mode` (`Tint.lean` l.21) and `Ore` (`Marchers.lean` l.53) are the same jet bounds for fields and observables. |
| `Station.anew : Cash.Renewed 0 0 f.V f.V H` | — | Value renewal with weight exponent 0, support exponent 0 and margins `V`. Produced in `patrol` (`Gest.lean` l.68) by `Cash.anew … 0`. |

On the actual (non-auxiliary) inputs, the value renewal is made at weight `X.degrees`
(`Target.Expense`, `IssuePlan.lean` l.34–35 and l.65). The auxiliary chartlets carry the same kind
of renewal: `Rain.Zeal.renewed : SeekR …` is `Cash.Renewed k.degrees k.earn k.one k.two` on that
chartlet (`Boulevard/Blue.lean` l.35; `Rain/Room.lean` l.30–32).

## 2. The ordered derivative prices used by the comparison, matched against the source

Manuscript hypotheses:
- `parameter-comparison-suppliers.tex` l.19–29: elementary factors, derivative scale, weights;
- `local-parameter-comparison.tex` l.10–40: the order-`j` jet norm and the elementary prices `u_i`;
- `finite-volume-parameter-continuity.tex` l.129–133: component jet prices `u_P` and the cluster
  criterion for `2^j u_P`.

Source route used for the auxiliary histories: `Repeat.Lark.Pith.shall` (`Auvi/Cadence.lean` l.59) →
`tours` → `rises` (`Raise.lean` l.41) → `ballad` (`Orleans.lean` l.55) and `swaths` (`Lands.lean` l.63).
Both consume `hZ : Jams.Wild R.shape A.delay`.

| # | Needed (manuscript) | Source supplier on the same input | Status |
| --- | --- | --- | --- |
| D1 | Order-`j` jets of the elementary compensated factors, with support-dependent derivative scale (suppliers l.19–29; local comparison l.24–30) | `Station.N.conduit : Utopia H j …`, field `stream` (`Das.lean` l.39). For every coat `X` of `H` and every chart with `Mode A y j v`, it gives `Brush j (stout …) (r·spanW …)` for each packet on a healthy mask. | **supplied conditionally**: the healthy-mask, `X.x = s`, width, cutoff `χ`, `manifest` and `Clutch` premises are retained |
| D2 | Component/cluster jet prices `u_P` at order `j` (continuity l.129–131) | `Captain.permitAverage` (`Cadre/Tassel.lean` l.67): the masked stream of each cluster is local, measurable and gauge-invariant, with `Ore V L v (N.design p) j` on healthy `V`. Used on the continuity route in `Lim.concordance` (`E6/Coterie.lean` l.58), via `(R n).N.permitAverage`. | **supplied conditionally**: healthy mask |
| D3 | Ordinary cluster criterion for `2^j u_P` with reserve, root price and ratio 1/2 (continuity l.131–133) | `Armada.purchases` (`Armada.lean` l.36) from `Station.army : Armada Q L μ 0 s V B j k` and `Station.N`. It gives `Trees.Ready H.smallAt (radiusB s) N.stone (a+i) (salary …) i (1/2)`, where `stone = 2^j·(B·meant k)` (`Embroidery.lean` l.29) and `salary = (1+2^j C)·overture k` (`Armada.lean` l.23). The factor `2^j` is the manuscript's. | **supplied** on the same `H`. I did not trace whether `Pith.shall` itself consumes `army.purchases`; it is projected in `FullVolume/Umbra/Arcade.lean` l.35–37. |
| D4 | Jet order needed ≤ order supplied | `Lim.bannersL` / `Accout.pallor` assume `he : B.order ≤ j` for the station order `j` (`Poesy/Rosette.lean` l.23; `Poesy/Song.lean` l.23). `quarters` (`Auvi/Rails.lean` l.56) takes `j = (X.p.profile (J m)).order`. In `swaths` the inequality is discharged by `(Rain.jersey …).1.le` (read at the call site only). | **supplied** |
| D5 | Same auxiliary input, path and dictionaries; no re-selection (selected-history-limits l.161–169) | `swaths` (`Lands.lean` l.63–75). The auxiliary input `Racks … s (U n).val` (zero regular occurrence, `Pane.pale`) gets its dictionary `(H n).tiers s (U n) : Chartlet …`, a `Cash` at coupling `hatBeta m` on `Pane.orchestra A N P` (`Blue.lean` l.32). `deposits` (l.56) builds `Station M Chi.canonical U Z'` on `safeTrans` of that chartlet. `bank` (l.47, `HEq`) and `spirit` (l.58) identify the barony with `(H n).offers`. | **supplied** |
| D6 | Renewed value prices of the auxiliary input | `Rain.Zeal.renewed` (`Rain/Room.lean` l.32) on the same chartlet, produced by `Rain.learns` (l.37) / `Pane.affords` (`Pane/Rooms.lean` l.64). The manuscript producer is `selected-nonlinear-offering.tex` (its evidence file names `Pane/Rooms.lean … affords` and `Rain/Room.lean learns`). | **supplied** by an existing producer; I did not check its review status |
| D7 | The station itself exists for every dictionary at the stage coupling, with the threshold chosen before the representation (suppliers l.186–192) | `Jams.Wild` (`Auvi/Entries.lean` l.31) ← `supplies` (l.32) ← `herds`/`safari` (l.23–34) ← `Blaze.March.patrol` (`Gest.lean` l.55). Its quantifier order is `∀ᶠ x, ∃ Bank, ∀ … (H : Cash …), Nonempty (Station …)`, the same as the manuscript's. The run-level `Wild` is in the conclusion of `Gables.vendee` (`Gables/Vendee.lean` l.44). | **supplied conditionally**: I inspected `vendee`'s statement only. `herds` keeps the hypothesis `supportExponent + 3 < exp`. |
| — | `Station.anew` | No `.anew` projection or `Station.anew` reference occurs in `Lean/YM` (`grep -rnw anew`). Its only occurrences are the field declaration and the construction in `patrol`. Anonymous destructuring of a `Station` was not excluded by an elaborated check. | not consumed |

## 3. Consequences for the manuscript (phase 2, C13 author)

1. **Correct the caveat.** In `selected-history-limits.tex` l.170–175 the alternative "establish the
   ordered derivative prices or prove a value-order continuity theorem" is resolved by the first
   branch. The ordered prices at order `j ≥` the required order are part of the same station
   supply as the value renewal. The C13 ledger and `completion-20261113.md` join 1 should cite
   D1–D5 rather than `Station.anew`.
2. **S1, the smallest remaining manuscript statement.** The auxiliary dictionary of
   `selected-nonlinear-offering.tex` (the chartlet with zero regular activity) must satisfy the
   incoming hypotheses of `sec:activity-jet-assembly` and `sec:parameter-comparison-suppliers` at
   the stage coupling. The C09 sections are stated for "the" representation satisfying their local
   hypotheses (`activity-jet-assembly.tex` l.1–12), so this is a matching statement, not a new
   estimate. In the source it is automatic, because `Station` is quantified over every `Cash` and
   the chartlet is a `Cash`. Proposed owner: C13 author, citing the C09 sections and
   `selected-nonlinear-offering.tex`.
3. **Q1 (open).** The manuscript pays the derivative-scale factor `(1+s)^j` with a reserve,
   `(1+s)^j ≤ C_{j,δ}e^{δs}` (suppliers l.23–29). The source pays it through the Captain weight
   exponent `k` in `meant p k = (∏ fare)(1+shapeW p)^k` (`Lambent.lean` l.28). Here `k` is
   existential, from `Oboe.ell` (`Gio.lean` l.74), and is chosen in `patrol` (`Gest.lean` l.63). I did not check how `k` relates to `j`. The
   manuscript's mechanism is its own complete argument, so this does not block S1. A reviewer
   should still confirm that no step silently assumes `k ≥ j`.

## 4. What was not done

- No Lean elaboration (Mathlib hosts are blocked here). All source statements were read textually.
- Not read: `Mixed.Allowed`, `Mixed.Costs.ceiling`, the bodies of `Oboe.ell`, `Empire.prom`,
  `Utopia.whittle`, `Gables.vendee`, `Rain.jersey`, `Pane.affords`.
- Not traced: consumption of `Station.army` and `Station.fleets` on the `Pith.shall` chain (D3);
  the review status of `selected-nonlinear-offering.tex`.

## Commands run

- `git show <base>:manuscript/existence/{selected-history-limits,parameter-comparison-suppliers,finite-volume-parameter-continuity,local-parameter-comparison,activity-jet-assembly}.tex` (the line ranges quoted above)
- `sed -n`/`grep -n` reads of the 31 Lean files in `hashes.json`; `grep -rnw anew Lean/YM`; `grep -rn 'Renewed' Lean/YM`
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified."; `python3 -m unittest discover -s tests`: 22 tests OK; `git diff --check`: clean
- `hashes.json` produced with `hashlib.sha256` over the listed files at the base commit
