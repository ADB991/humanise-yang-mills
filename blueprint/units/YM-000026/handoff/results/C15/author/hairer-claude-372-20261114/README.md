# #372: producer of (G3) for the rounded trace comparison (author note)

- Session: `hairer-claude-372-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/372#issuecomment-6874384102
- Base: `codex/existence-monograph` @ `43f8694`.
- Lean pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Status: **draft, unreviewed.** The account `hairer` must not review this note; an independent account is needed.

## Outputs

- New file `manuscript/existence/trace-rounded-receipt.tex`, containing `subsec:trace-rounded-receipt`:
  - `lem:trace-receipt-width`
  - `lem:trace-receipt-cost`
  - `prop:trace-rounded-receipt`
  - the paragraphs "Supply of the level budget" and "Status"
- `manuscript/existence/trace-rounded-comparison.tex`: the closing Status paragraph now points to the new subsection, and an `\input` line for it was added. No other change.

## Correspondence (textual reading at the pin; no Lean elaborated)

| Manuscript | Source (`Lean/YM/…`) |
|---|---|
| (G3) = width clause + root bounds at cost ε | `MergeProof.East.SeqPair` (`width`, `boot`), `TraceExtension/Prom/Zoom/Boats.lean` |
| `prop:trace-rounded-receipt`, first part | private `MergeProof.East.await` (same file): `filter_upwards` of `lava_vSky`, `open_readSky` and `Ship.diminishes ∘ i` |
| `prop:trace-rounded-receipt`, selection part | `MergeProof.East.boatsSky`: `hχ := await …` is intersected with the other eventual conditions, and `.exists` picks the point; the result feeds `TimberSky.plate` |
| (A) allowance `m μ_k² ≤ a_ℓ/a_k` | `Next.Rank.Station.AllowedSky.dilation`, with `middleSky` (`Prom/Hill/Station.lean`). Obtained in `await` from `(hv j).supply 0 … Q.age.allot.permitted` |
| fit for the chart | `Next.Rank.Station.FitSky` (`usable`, `deep`: `|key| ≤ a(middleSky)/8`), `Prom/Hill/Tuning.lean` |
| `lem:trace-receipt-width` | `MergeProof.East.open_readSky` (`Prom/Orion/Suds.lean`), using `mag_rate` with exponent 1 (μ_k ≥ 1) and exponent 2 (μ_k² ≥ 8R) |
| (B) level budget `μ_k^{-1/(16n)}` | `lava_vSky` (`Prom/Orion/Reach.lean`) → `MergeProof.earningsSky` (`Prom/Front/West/Tael.lean`) → `PhysicalNext.InteractingRank.Soft.y_readySky` (`Lys.lean`) → `Next.Rank.Tapes.West.tenderlySky` (`Equity.lean`) → `Soft.couponSky`. `Ship.budget A M k = exp(-log(monitor k)/(16M))`, with `M = trays d` (`Next/RANK/Allowance.lean`) |
| `lem:trace-receipt-cost` | `Ship.diminishes` plus `ge_mem_nhds`; the explicit threshold `μ_k ≥ ε^{-16n}` replaces the filter statement |
| "Supply of the level budget" | non-trace analogue `Next.Rank.Ship.rebate`: the hypothesis `Allocated.charge` (ticket ≤ `pot` = I_k) is the purchase T_M ≤ I_k, and `allowance = e^{2I}` is a. The manuscript has `eq:rank-root` (`sec:rank-root-normalization`) together with the coefficient price of `sec:allarity-marked-propagation` (`eq:allarity-density-envelope`, `eq:allarity-marker-weight`) |

## What is proved and what is open

**Proved in the new subsection:**
- the width clause from (A) and μ_k² ≥ 800;
- the cost-ε bounds from (B) and μ_k ≥ ε^{-16n};
- that the gallery selection can take k_i past these thresholds (late points of a level curve tending to ∞);
- the arithmetic e^{I_k}/a^{|I|} ≤ μ_k^{-1/(16n)}.

**Open:** the first unsupported implication runs from the funded chart witness at level k (chart, invoice, legacy-cost, actuation and stamp data) to the one-step purchases `eq:allarity-step-purchases`–`eq:allarity-step-small` on that witness's history. The coefficient price of `sec:allarity-marked-propagation` and the ticket T_n ≤ I_k depend on those purchases. In the source this is the body of `earningsSky` / `y_readySky` (`mural_castSky`, `prospectSky`, `caughtXSky`, `billing_XSky`, `tenderlySky`). It was not translated here.

Allowance (A) is part of the source witness (`AllowedSky` inside `LegacyCostSky.age.allot`). The gallery section does not display it.

## Uncertainties

- The steps from `y_readySky` to `couponSky` were matched to the `rebate`-type estimate by reading `tenderlySky` and `couponSky`'s call site, not their full proofs.
- `M = trays d`, with `abbrev trays (d) := d+2` (`MergeProof.East.Gran`, `Lean/YM/MergeProof/East/Gran.lean:25`, in the namespace of `await`). The manuscript therefore uses n = d+2 ≥ 2. Unrelated declarations of the same name exist in `Next/MULTISOURCE` and `Next/UV_STRESS`.

## Checks actually run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex` in `manuscript/`: exit 0, 1034 pages, 0 undefined references. Rendered pp. 1006–1008 were inspected.
- `python3 scripts/check_blueprint.py`: see the PR body.
- No Lean was elaborated, because the network blocks Mathlib.

## Addendum: revision after review #383 (session `hairer-claude-372rev1-20261114`)

- Claim: https://github.com/hairer/humanise-yang-mills/issues/372#issuecomment-6878353810
- Base: `codex/existence-monograph` @ `bdd348c`.
- Review: `results/C15/review/stalex444-claude-373rev-20261114/` (stalex444). That record is not edited.

| Finding | Response |
|---|---|
| M1 (required) | The "Moreover" proof now uses only stated gallery facts. The producer is called with θ' = min(θ, min_{j<K} a_j); the radius g_b(k) = a_k μ_k^b ≥ a_k forces k ≥ K. `lem:ex-lattice-firesky-selection` applies verbatim with the reduced thresholds. The Status sentence was adjusted. |
| M2 (required) | `prop:trace-rounded-receipt` now identifies w_i of (G4) with the selected chart's root depth w and requires (G4) at that depth. The root depth is glossed as the depth of both the receipt and the chamber condition. "Root depth" was added as item 3 of the open list. |
| M3 | (A) is now open item 1. The missing definition of the middle cell is noted. The parent Status now says "the inputs". |
| M4 | The supply paragraph states the premise P_R(X) − 4D log g/q_0 ≤ T_M and all clock conditions of `sec:rank-root-normalization`. Open item 2(b) asks for the eventual harmonic threshold as a level threshold in K_B. |
| M5 | The supply paragraph lists every allarity input: step purchases, compiler outputs, terminal-source purchase, step-count purchase, and propagation to the q_0-site output torus. |
| M6 | n is renamed to the marker allowance M = M_d = d+2, explicitly distinguished from the gallery's arity cap l. The gallery is not edited. |
| M7 | K(d,ε) is now the least K such that the conditions hold for every k ≥ K. The proposition's hypothesis is stated for every i. |
| M8 | q_0 is used for the replica cell count throughout; q appears only through ρ_m(x). |
| M9 | n no longer appears in the note. |
| L1 | The quantifier of (B) is made explicit: thresholds are fixed before the chart is chosen. The note says the chart-uniform form is used by the M1 argument, and that a per-curve form would suffice for the first assertion only. |
| C12 | (A) is now stated for k ≥ K_A(d), and K_A is added to K(d,ε). |
| L15 | Recorded: the μ_k ≥ 1 filter of `open_readSky` is not needed by the argument. |

Checks run: `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex` → exit 0, 1039 pages, 0 undefined references; rendered pp. 1011–1013 inspected. `python3 scripts/check_blueprint.py` → OK.
