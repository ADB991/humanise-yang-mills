# #378: the determinant ticket and the harmonic premise at the output level (author note)

- Session: `hairer-claude-378-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/378#issuecomment-6878463682
- Base: `codex/existence-monograph` @ `bdd348c`.
- Pin: `3456e5e`.
- Status: **draft, unreviewed**. An independent review is needed from an account other than `hairer`.

## Output

New `subsec:rank-root-output-ticket`, appended at the end of `manuscript/existence/rank-root-normalization.tex`. The earlier text is not changed. It contains:
- `eq:rank-root-premise`;
- `prop:rank-root-output-ticket`, with the requests `eq:rank-root-ticket-requests`;
- a closing paragraph applying the proposition at a funded chart's root depth.

## Mathematics

- **Ticket.** Add the countable requests F_{M,i} = 1 + √(16M max{T_M(π_i),0}) to `eq:common-countable-payment`. For each M, eventually in k, this gives (log log β̂_k)² ≥ 16M·T_M(π_i) for all i ≤ J(k+1). The output profile π_{J(w(k))} has J(w(k)) ≤ J(k). Hence T_M(π_{J(w)}) ≤ I_k = log 𝓜_k/(16M), with 𝓜_k = exp((log log β̂_k)²) as in `sec:ex-lattice-trace-clock-cap`.
- **Premise.** P_R(X) − 4D log g/q ≤ T_M is the preceding subsection's own argument at output level m: β ≤ 4β̂_m, then 8Dβ̂_m/q ≤ 1 and the late-scale purchases, all eventually in m and uniform in the period. It applies at m = w(k) once w(k) → ∞.
- **w(k) → ∞ for a funded chart.** This follows from the bracket property J(k) − 1 ≤ J(j) for w ≤ j ≤ k, which is the field `AllowedSky.bracket` (#374 §2), together with J → ∞. The bracket is not displayed in the gallery section and is flagged as an input there.

## Correspondence (textual, at the pin)

| Manuscript | Source |
|---|---|
| T_M(π) | `YM.Next.Rank.Station.ticket O (A.params m) M` (`Next/RANK/StationMeter.lean:41`). It depends on the stage parameters (paths, clip) and O only. `A.params i = S (A.clock.J i)` (`Order/Sofa.lean`, `hl`) |
| I_k, 𝓜_k | `Ship.pot A M k = log(monitor k)/(16M)`. Monitor = `Calendar.monitor` = `Vac.Treasury.P (hatBeta k)` = exp((log log β̂_k)²) (`Sofa.lean`, `unfold Ship.pot Calendar.monitor`) |
| item 1 (ticket) | witness field `AllocatedSky.charge` (`Hill/Allowance.lean:20`). It is produced in `Order/Sofa.lean` (`office`) by buying `ticket O (S i) u ≤ log P(s)/(16u)` eventually in s for i ∈ `farSky j` = {j, j−1}, and uses `bracket` to place J(w) there. **The manuscript proof differs:** it uses the countable payment over all i ≤ J(k+1) and needs only J(w) ≤ J(k), not the bracket |
| item 2 (premise), `eq:rank-root-premise` | `Ship.bank O A m` (`Next/RANK/Allowance.lean:40`) via `Ship.banking` = `Station.affordable` (`StationMeter.lean:119`), eventual in m. The hypothesis `Station.Meets` (`StationMeter.lean:28`) is: same clip, β ≤ 4β̂_m, βg² = 1, 0 < g ≤ θ ≤ θ_clock, δ ≤ 1, Λ ≤ Λ_clock. This matches the subsection's suppositions |
| w(k) → ∞ | `earningsSky` `hΩ` (`Front/West/Tael.lean`): `AllowedSky.bracket` plus `fits.deep` gives u ≤ widthSky |
| consequence | `Soft.couponSky (hc : AllocatedSky …) (hb : bank O A (widthSky …))` (`Port/Soft/Denarii.lean:31`) |

## Relation to #384 (open item 2 of `subsec:trace-rounded-receipt`)

- Item 2(b) (clock-side conditions, including the harmonic premise, with a level threshold in k) is item 2 of the proposition, given w(k) → ∞.
- Item 2(c) (the ticket) is item 1.
- Both hold with K_M depending only on M and the clock.
- What still enters as input is the bracket property (from the chart allowance, #374) and the lawful-output contract and coefficient price (#375/#376).

## Uncertainties

- I assume, as stated in `sec:public-run-binding`, that the clip constants, row bound and path constants at level m are those of the stage profile π_{J(m)}. I did not check this item by item against every constant in T_M (in particular h = ent(O, clip) and c_− = `O.small`, which are fixed by G and the clip).
- Enlarging the countable family in `sec:common-scale-selection` is legitimate by its own remark that the payments use only lower bounds on the thresholds. Whether the final selection in `public-run-binding.tex` must list these requests explicitly is left to that chapter's owner.

## Checks actually run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex`: exit 0, 1039 pages, 0 undefined references. pp. 794–795 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
- No Lean elaboration.

## Errata after review #409 (session hairer-claude-409resp-20261114)

- The monitor is `YM.Vac.Numbers.P` (`Lean/YM/Vac/Treasury.lean:72`); `Treasury` is the module file, not a namespace.
- The loop exponent of `subsec:rank-root-clock-threshold` is now identified with the clock's protection exponent θ_j (`Calendar.theta`). It is not a field of the stage profile.
