# Issue 375: cutoff-weighted chart law and two transport routes

Session: hairer-codex-375-chart-20261115, Codex assistance for Martin Hairer.
Claim: https://github.com/hairer/humanise-yang-mills/issues/375#issuecomment-6893358512
Base: PR #435, f89f34d78d530132287e54943749f1effaa72bb7.
Source pin: 3456e5e75cf8d4cd558955a5c7638fba2d68f464.
Status: author continuation; independent mathematics and correspondence review needed. No closure of #375 or #435 approval.

## Changes and established results

1. `lem:allarity-cutoff-marginal` proves the exact pushforward law: projecting chi dgamma_C gives E[chi | retained coordinates, Haar variables] dgamma_CI, not the unweighted Gaussian marginal. It includes a conditional Gaussian formula and the unit insertion. This repairs the concrete error found in the independent review of #435.
2. `lem:allarity-measure-identification` now uses one domain containing both insertion and cutoff reads, with the quantitative principal-comparison assumptions on that enlarged domain. It proves the common raw integral identity and cancellation in the full parameter-jet algebra using the same unit law. If loading varies across forest/tag atoms, the text retains those weights inside numerator and denominator instead of cancelling them.
3. `lem:allarity-two-route-budget` proves an exact telescoping bound for two finite moment-transport histories and the finite logarithm Lipschitz bound. It explicitly requires invariant domains, appropriate operator norms and all intermediate insertions. This is an additional elementary argument proposed by this author, not a direct formal declaration translation.
4. Corrects the claim that recursive reference transport is free: cutoff transport may leave the controlled polynomial class. Gives an explicit error allocation at the middle level instead of spending H^(-3/2) twice.
5. `eq:allarity-uniform-primitive-supplier` links the EXISTING C08 producer `sec:principal-comparison-jets` to (CI)(c), with explicit J0 and V0 independent of healthy base points. Its local fixed-gauge proof already supports this uniformity. The outstanding obligation is to check its allocated seed-free halo, fixed-window, path and positive-precision hypotheses on the actual enlarged domain. We do not relabel that application as established.

No new one-rung estimate is claimed for the actual chart until these conditions are checked. The changed text keeps the source-following small upper marker weight and one-shot middle launch introduced by #411, and leaves the e*=e+1+sigma compiler application of #431 open.

## Source and dependency crosswalk

- `YM.PhysicalNext.InteractingRank.Soft.y_readySky`, `Lean/YM/TraceExtension/Prom/Front/West/Lys.lean`: inspected statement and proof. This assembles `LegacyCostSky`, actual `WhipSky`, StampDuty, solved lifts, coefficient prices, and a same-course StakeXSky. It is not an unconditional supplier for (CI).
- `YM.PhysicalNext.InteractingRank.Soft.billing_XSky`, `.../PayW.lean`: inspected statement and proof. Upper `galaFtSky`/`tapsFtSky` and lower `shutters_Sky`/`tappedSky` use actual heat data, TimeBand, Caff and tickets. Their applicability is not implied by the new measure lemma.
- `YM.PhysicalNext.RankCovariance.y_supplySky`, `.../Eark.lean`: inspected statement and proof. `EarkSky` buys common optics/hinge/train bounds for the same-stage and adjacent-stage pairs. It yields Seal and Folded; it is not the physical sector mean/covariance jet comparison by itself.
- `YM.Next.Rank.Tapes.West.attireSky`, `.../Delft.lean`: inspected statement and proof. `admitsXSky` consumes each actual StampDuty.coupon, the same solved labels, the common course and StakeXSky; this retains the dependency on #415.
- `YM.PhysicalNext.Repeat.Malachite.treasure`, `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Grain.lean`: inspected. For fixed n>=2, patch branching, Works and shrinking logarithmic radius, selects common rate-zero derivative bounds and arbitrarily small flat discrepancy. Actual Coat and reference bareStores constructions remain distinct.
- `YM.PhysicalNext.Repeat.Malachite.saleD`, `.../Malachite/Searchlight.lean`: inspected. Rate -1 mean and -1/2 covariance bounds are selected BEFORE quantifying over physical W, with `Healthy`, seed disjointness, Museum/read allocation, Bulletin, Wire and direction conditions. This supports the explicit uniformity specialization; it does not prove these conditions for an enlarged cutoff domain.

Canonical manuscript inputs opened: `allarity-planted-compiler` (the coefficientwise integral with its actual measures), `gaussian-reassembly` (completed square, original loading and forest dependence), `gaussian-differentiation` (uncut marginal/compensated identity), `principal-gaussian-comparison` (four data hypotheses and payment), `principal-comparison-jets` (complete proof, including physical gauge and uniformity), and the C08 outputs/ledger/edges. Existing C08 records explicitly leave exact same-history/window joins open.

## Remaining obligations, separated by source and consumer

| Obligation | Producer to inspect / use | Consumer and precise unresolved match |
| --- | --- | --- |
| Cutoff-weighted joint law (M) | Sector reassembly and actual planted component measures | (CI)(a): verify the chosen full cell law, unit denominator, forest/tag weights and common loading; prove a suitable cutoff-complete finite domain or its weighted pushforward bounds. |
| Reference vs polynomial history | Actual normalized reference kernels and Wick history | (CI)(b): preserve an admissible insertion class and pay the telescoping/log budget at all leading rungs; a bounded-insertion jet estimate alone cannot be iterated on arbitrary unbounded polynomials. |
| Primitive jet comparison | C08 `principal-comparison-jets`, Malachite.saleD | (CI)(c): verify every retained coordinate's healthy seed-free halo, nonwrapping, physical/local identification, fixed distinct window rules, path derivatives through n+1 and common periods on this chart. The supremum over healthy bases adds no new factor once these hypotheses hold. |
| Stronger compiler purchase | `billing_XSky` actual TimeBand / Caff / heat data | The upper calculation at e*=e+1+sigma, rather than only e. The new measure arguments do not buy these inequalities. |
| Terminal source | #415 and same StampDuty | Same raw insertion/ticket, heater and solved lifts; not implied by the present norm or measure estimates. |

## Literature and integrity

Checked shared background inventory and canonical Gaussian/jet chapters before writing. The cutoff projection is an elementary Radon--Nikodym / finite-dimensional Gaussian calculation, proved explicitly; the transport telescoping and nilpotent logarithm estimates are also proved explicitly. No external analytic theorem is invoked to identify a source-specific sector law. New mathematical text is solely in the existing authoritative chapter, not duplicated here. Historical author/review records remain untouched.

## Validation

- Isolated clone at the exact #435 commit; no Lean or shared metadata changes.
- `python3 scripts/check_blueprint.py`: passes, 4 units; not mathematical verification.
- `git diff --check`: passes.
- Full `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` in manuscript: run; final results and visual inspection appended below.
- No Lean elaboration, full rebuild, or axiom replay. Source inspection is textual; frozen hashes are supplied.

Final validation: the full LaTeX build completed successfully (1075 pages). Rendered pages 796–802 with PDFKit and visually inspected the changed proofs and adjacent text; no clipping or layout defect was found there. The full monograph retains existing box warnings. All six inspected Lean file hashes matched the pinned SOURCES manifest.
