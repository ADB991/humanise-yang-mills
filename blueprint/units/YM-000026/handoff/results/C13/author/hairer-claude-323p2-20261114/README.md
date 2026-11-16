# #323 phase 2: C13 caveat amended from the reviewed audit

- **Session:** `hairer-claude-323p2-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5).
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/323#issuecomment-6873884353>
- **Inputs:** audit #325 (ADB991) and its independent check #342 (hairer, with R1/R2).

## Changes

- **`manuscript/existence/selected-history-limits.tex`.** The dichotomy "establish the ordered derivative prices on these inputs, or prove a value-order continuity theorem" is replaced by the reviewed finding:
  - The ordered prices at order j ≥ the required order are produced by the same supplier construction as the value prices (`sec:parameter-comparison-suppliers` at fixed order j, on representations satisfying the hypotheses of `sec:activity-jet-assembly`).
  - So no value-order continuity theorem is needed.
  - The remaining input is the matching statement S1 for the auxiliary chartlet of `sec:selected-nonlinear-offering`.
- **`results/C13/ledger.md`.** An "Update (#323)" paragraph after the `Station.anew` paragraph; the historical text is preserved.
- **`results/C13/completion-20261113.md`.** An update line under join 1.
- **Follow-up #368** opened for S1.

## Source correspondence

| Item | Source (pin `3456e5e`) |
| --- | --- |
| D1 | `Station.N.conduit`/`Utopia.stream` |
| D2 | `Captain.permitAverage` |
| D3 | `Armada.applies` ← `purchases`, consumed in `E6/Bandle.lean` lemma `air` |
| D4 | `he : B.order ≤ j` in `bannersL`, discharged in `swaths` |
| D5 | `swaths`/`deposits` on `safeTrans` of the same chartlet |
| `anew` | weight exponent 0, never projected |

## Checks

- `latexmk … existence.tex`: exit 0, 1030 pages, no undefined references. Page 798 inspected.
- `python3 scripts/check_blueprint.py`: see PR.

Needs an independent check by an account other than hairer.
