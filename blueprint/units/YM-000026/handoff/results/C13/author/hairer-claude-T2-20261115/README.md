# Input (T) restated as the calibrated insertion receipt (#415, step 2a)

- **Session:** `hairer-claude-T2-20261115` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/415#issuecomment-6886692978
- **Base:** #425's branch.

## Change

(T) in `subsec:rank-trace-chart-window` is now one receipt with four parts:

| Part | Content | Assumed until now in |
| --- | --- | --- |
| (T1) | low-grade reading: T is the low-grade reading of the actual polynomial map 𝓗 | "exact low-grade identity", `sec:allarity-cumulant-comparison` l. 66–81 |
| (T2) | tested estimate `eq:rank-common-tested` | `sec:allarity-coordinate-calibration` l. 216–223, `sec:actual-rank-purchases` |
| (T3) | primal bound \|𝓗u\| ≤ H\|Au\| and bounded degree | `sec:allarity-coordinate-calibration` l. 216–218 |
| (T4) | stamp: the terminal paid insertion bound | `sec:marked-healthy-cumulant-launch` l. 197–199; the (F5) stamp duty |

In the source all four belong to one structure, `StampDuty`. The source correspondence is corrected below, following the review of #428. See also the audit `results/C13/endpoints/hairer-claude-T-20261114/`.

## Why T is not A

T = A_{k,N,p} would satisfy (T2) trivially, but not (T1). The free cumulant comparison needs the readout to be the exact low-grade reading of the insertions that are actually integrated. The analytic content is therefore the pin: |A v − Λ(𝓗v)| ≤ ½|A v|, where Λ is the low-grade reading. In the source this is `MarkedStart` clause 4 together with `pins`.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.

## Follow-up to the review of #428 (2026-11-15)

The review (of acd330d) asked for the source correspondence to be stated correctly, and for the same insertion and readout to appear in all four clauses. The earlier text above put `forge` in the wrong namespace.

**Correspondence (read at pin `3456e5e`):**

| Clause | Source |
| --- | --- |
| structure | `YM.Next.Rank.Ribbon.StampDuty` (`Lean/YM/Next/RANK/Tilt.lean`, l. 23): one insertion `W`, its heater `heater`, one map `T` |
| (T1) | `StampDuty.head` (the heater is `milk` of the controlled, renamed `W`) and `Heating.test` (`Lean/YM/Next/RANK/ParticleGate.lean`, l. 31): a `Perch.Verdict` comparing the heater with `T v` after `scaled (Price.shrink C k N p)`. This is the reader substitution together with the coupling normalization. |
| (T2) | `Heating.span : Price.Tested C d k N p T` |
| (T3) | `Heating.primal`, `Heating.order`, `StampDuty.duration` |
| (T4) | `StampDuty.coupon`, a `Ticket` on `halo (q*Q.p.B) {0}` with price `bill (−D) · paid` |
| existence | `YM.Next.Rank.Ribbon.forge` (`Tilt.lean`, l. 36) gives `Nonempty (StampDuty …)` under `G.Simple`, `C.Makes`, `Q.p.threshold = tau`, `Q.p.B = walls`, `8 ≤ q` and `Hail`. |
| pin | `YM.Next.Rank.East.mintingSky` (`Lean/YM/TraceExtension/Prom/Orion/Eupho.lean`, l. 18). Under the further hypotheses `Binding C` and `ParadeX C`, it constructs a `StampDuty` whose `T` commutes with the signed motions `mir` and satisfies `InvoiceSky`, the relative pin with factor `bill (−1/2)`. |

**Manuscript changes:**
- (T1) now names the reader substitution at level k and the normalization: Tu is taken in the retained common normalization of `sec:allarity-coordinate-calibration`, rescaled by the coupling factor of the reader coordinates.
- A sentence after (T4) says that one map 𝓗 and one map T occur in all four clauses. The insertions are those integrated in the cumulant comparison, T is their reading, and the stamp is paid by the same insertions.
- The closing paragraph says that the pin estimate and the application of (T4) to the lifts are not proved in the book.
- The branch was merged with the updated #425 branch. The conflict was resolved by keeping both inputs, (V) and the four-part (T).

**Not settled.** The equivariance and the further hypotheses of `mintingSky` are not part of (T). Whether `Binding` and `ParadeX` hold on the endpoint used here is not checked.

Checks actually run: `latexmk -g -pdf existence.tex` (rc 0, 0 undefined references) and `python3 scripts/check_blueprint.py`. The source was read; no Lean was built.
