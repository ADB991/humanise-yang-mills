# Endpoint check: `C09-to-C02-heading-and-tickets` supplies I-C02-finite-interpolation

Issue #43; session `hairer-claude-20261113-c02-interp`. Reviewer account
`hairer` (coordinator), which authored neither `centered-freight-producer.tex`
(C02) nor `heading-history-handoff.tex` (C09). Canonical
`codex/existence-monograph` at `7a1a7480`:
- `centered-freight-producer.tex` SHA-256 `9f1b699151775d7a0d833b179a21f5cc7e4880d1107674c88b5df6e487d71bac`;
- `heading-history-handoff.tex` SHA-256 `4f6b5107a96bfb33116c62a6cf7859f830772c7cac54e5ada260caf976abfc1a`.

Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Textual mathematics and
source check; no Lean elaboration.

**Verdict: the edge matches.** C09 `sec:three-port-history`, with the
inverse bound `eq:heading-both-prices`, supplies I-C02-finite-interpolation
*conditionally*. The conditions are C09's own inputs, which are exactly the
hypotheses I-C02-finite-interpolation already places on the selected history
(held spring and fields, slot table, keeper, schedule-price bound, scale
payments). The two identifications the texts leave implicit are settled by
the source (§2). The analytic field estimates themselves remain conditional
on C09's upstream producers, as both chapters say.

## 1. Clause-by-clause match

| I-C02-finite-interpolation (consumer) | C09 producer | Check |
| --- | --- | --- |
| Two fields at the selected spring parameter: held spring `[x,y]`, `z`, fine `K(z)` and its coarse result | "one funded interpolating transition, its point on the interpolation interval, and its fine and coarse representations `R_f,R_c`", later identified with `R_{N,m+1},R_{N,m}` by substitution | ✔ |
| Grade condition `d+3 ≤ J_m^c=J(m)` | "for each `d` with `d+3` at most the coarse kernel level"; source `clocksHere (hd : d+3 ≤ T)` with `T = clock.J m` (`hδ`) | ✔ |
| One heading `T_m` with `μ(T_mv)≤C_mμ(v)` and `μ(T_m^{-1}v)≤C_mμ(v)` | `eq:heading-both-prices`: `‖Bv‖₁,‖B^{-1}v‖₁ ≤ C_B‖v‖₁`, with `C ≥ C_B` | ✔ given §2(a) |
| Axis `e_a`: density = pushed fine density; orbit-weighted lead error `≤ η_m‖core e_a‖`; residual `C_m‖vowel_m(core e_a)‖`; crossing `t_m` | `dens(Q)=L^d𝒯F`; `C_orb‖Q.x−BL^{d−g}e_i‖ ≤ η‖core e_i‖`; `r=C‖L^{d−g}core e_i‖`; allowance `t_f=2e^{b_f}τ_f`. `vowel_m` is coordinatewise `L^{d−g}`, and `P_m` includes `ℓ_m^d` | ✔ given §2(a), (b) |
| `η_m=rate(b_m)` | `η=L^{-2/5}`, the rate of the block side | ✔ |
| Regular support of mass `u`: both prices `η_mu`, bill `2u` | `C_orb‖Q.x‖≤ηm`, `r=ηm`, input allowance `2m`, `m=m_f(X,h)` | ✔ (`u` is the fine mass; source `(Old).p.mass b x`) |
| Forced support of mass `u` on a marked wing site: both prices `η_mu/κ`, bill `2u`, `κ=√forcedAllowance_{m+1}` (fine); output remainder uses the coarse allowance | `eq:history-forced-price`: `ηm/κ_f`, allowance `2m` (not divided by `κ_f`); the output remainder uses `κ_c` | ✔ |
| A ticket for **every** wing containing the principal tags (supports containing the origin), with the keeper's marked tags adjoined | Estimates are per insertion and independent of the wing; a forced coupon needs its tag in the wing. Source: `∀ Xk`, given all origin principal keys, gives `Stampede … Xk`; `forced` assumes `A (.gasKey j)` | ✔ |
| Heading and prices common to the whole wing | One heading per grade/frame; one transition and marked derivative for all grades (C09 last subsection). The consumer fixes `d` | ✔ |
| Purchase inequalities `η_m(1+s)orbitCost ≤ barunit(b_m)`, `(C_m+η_ms)orbitCost ≤ W_{m+1}` | "`η(1+s_f)C_orb ≤ L^{-3/8}`, `(C+ηs_f)C_orb ≤ K_f`", with `barunit=L^{-3/8}` | ✔ (`W_{m+1}=K_f`) |

## 2. The two identifications left implicit in the prose

**(a) `C_m=E(J_m^f)` is C09's "selected coefficient allowance `C`".**
`YM.PhysicalNext.Repeat.Cub.clocksHere` (`Lean/YM/MergeProof/Crowding.lean`,
lines 67–99) returns `MergeProof.Stampede … (E J) (Doors.rate (block m)) (2*exp(supportExponent)*title G vT) Vj Xk`.
The residual price and the heading constant are therefore the selected
schedule value. The proof shows `Local.triangularPrice F cap ≤ E J` (line 98)
and obtains the heading from `Cub.leading`'s forecast. The field `map_norm` of
`YM.MergeProof.Stampede` (`Lean/YM/MergeProof/Wallet.lean`, lines 23–31) is
the two-sided heading bound with the same `C`. The manuscript statement "the
selected schedule-price bound supplies the cap's triangular-price estimate"
is exactly `E(J_m^f) ≥ C_B`. Instantiating C09's `C` by `E(J_m^f)` is
therefore legitimate under the consumer's schedule-price hypothesis. The
second lower bound C09 needs from `C`, the graded remainder price, is
built into the source's primary coupon:
`YM.PhysicalNext.Repeat.Cub.jewelCard` (`Lean/YM/MergeProof/Rosin.lean`,
lines 87–91) is stated with residual price `E J·‖vowel(core x)‖` and lead price
`rate L·‖core x‖`, the very prices of the consumer's axis coupon.

**(b) `t_m=2e^{E_{m+1}}ϑ_{m+1}` equals C09's `t_f=2e^{b_f}τ_f`.**
The source crossing allowance is `2*exp((rep N n (m+1)).p.supportExponent) * Cub.title G vT`,
so `E_{m+1}=b_f` is the fine support exponent. The term `hz₀` in
`clocksHere` (line 84) states `Local.Readable … (localSection G d) … (title G (M.p.profile j))`:
the profile title is precisely the readability (derivative) bound of the fine
local section, which is C09's `τ_f`. The consumer's "profile title" and
C09's "common fine local-section derivative bound" are the same number.

## 3. What remains conditional

These are unchanged by this check, and both chapters already state them:
- the funded interpolating transition (the held spring) and its slot
  realization;
- C09's upstream analytic producers for the three estimates, i.e. the
  primary calibration, the regular principal producer, the projection
  payment and the local splitting;
- the hypotheses of `prop:ex-selected-interpolation` recorded in the C09
  ledger (review #77 M3);
- the common scale payments.

I-C02-funded-record is a separate input and is not addressed here.

## 4. Proposed follow-up (after independent review of this report)

- C02 `RESULTS.md`: change the status of I-C02-finite-interpolation from
  "outstanding; candidate producer … not accepted" to "supplied conditionally
  by C09 `sec:three-port-history` (edge accepted in this report), retaining
  C09's upstream inputs".
- `centered-freight-producer.tex`, end of the interpolation paragraph:
  replace "that match is not yet accepted" with a citation of
  `sec:three-port-history` and the two identifications of §2.

Neither is done here, so as not to overlap the live C02 author claim and so
as not to self-accept.

## Checks run

- Statements read at the canonical commit, with the hashes above; source read
  at the pin (`Crowding.lean`, `Wallet.lean`).
- `python3 scripts/check_blueprint.py`: OK. No manuscript change.
