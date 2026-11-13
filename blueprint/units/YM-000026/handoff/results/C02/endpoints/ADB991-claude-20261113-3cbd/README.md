# Consumer acknowledgement: `C09-to-C02-heading-and-tickets`, and a check of endpoint report PR #313

Issue #43. Session `ADB991-claude-20261113-3cbd`. Claim:
https://github.com/hairer/humanise-yang-mills/issues/43#issuecomment-6866881170.

**Role, and why it is not an independent review.** ADB991 (session `ADB991-claude-20261113-b6b4`, #182,
commit `b8b9de0`) wrote the wording of the C02 input **I-C02-finite-interpolation** in
`manuscript/existence/centered-freight-producer.tex` and its row in C02 `RESULTS.md`. ADB991 wrote
neither C09 (`heading-history-handoff.tex`, Trishen Gunaratnam, #50) nor hairer's endpoint report.
`COMMON-CONTRACT.md` (l.40) asks both producer and consumer to acknowledge each edge's exact statement and
common-data match. This file is the **consumer-side acknowledgement** of that input's wording, plus a
second check of hairer's report. It does not replace the independent check of #313 by an account
that authored neither side, and it accepts nothing.

## Inputs inspected

| Object | Version |
| --- | --- |
| Endpoint report | PR #313 head `5c497f70efc2f0f295088ff9c2b5271bdb88d576`, `results/C02/endpoints/hairer-claude-20261113-c02-interp/README.md` |
| Canonical text | `codex/existence-monograph` @ `ec7ed5db86f34c374b9e07451831d49fe4ce388e` |
| `centered-freight-producer.tex` (consumer) | SHA-256 `9f1b699151775d7a0d833b179a21f5cc7e4880d1107674c88b5df6e487d71bac` (same bytes as in the report) |
| `heading-history-handoff.tex` (producer) | SHA-256 `4f6b5107a96bfb33116c62a6cf7859f830772c7cac54e5ada260caf976abfc1a` (same bytes as in the report) |
| Lean | pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read textually; no elaboration |

## Verdict

**Consumer acknowledged, conditionally.** The edge matches the input as ADB991 meant it. Every clause
of I-C02-finite-interpolation (`centered-freight-producer.tex` l.33, with the data and prices fixed at l.23–31)
is supplied by C09 `sec:three-port-history` together with `eq:heading-both-prices` of
`sec:heading-history-handoff`. The supply is conditional on C09's upstream inputs, which are exactly
the hypotheses the input already places on the selected history. I re-derived each row of the
report's §1 table independently from the two texts and the pinned source, and I agree with all of
them. One refinement (R1) and three wording points (N1–N3) follow. None changes the verdict.

## Clause-by-clause recheck (consumer wording → producer → source)

1. **Same transition, same fields.** The consumer says: "the two selected fields are the fine
   representation `K(z)` and the coarse result of that same spring at `z`"; `[x,y]` closed, with no
   strict inequality needed. C09 l.205–213 fixes one funded interpolating transition, its point and
   `R_f,R_c`, and l.353–355 substitutes `R_{N,m+1},R_{N,m}`. In the source, `clocksHere` takes
   `z : Icc x t` with `he : rep N n m = H.result z`, `ht : rep N n (m+1) = K z`
   (`Lean/YM/MergeProof/Crowding.lean` l.53, 57, 67). ✔
2. **Grade condition.** In the source, `clocksHere (hd : d+3 ≤ T)` with `T = clock.J m`
   (Crowding.lean l.34, 67). This is `J_m^c = J(m)`. C09 l.347 says "`d+3` at most the coarse kernel
   level". ✔
3. **Heading, two-sided bound.** `Stampede.map_norm` (`Wallet.lean` l.31) gives
   `‖T v‖ ≤ C‖v‖` and `‖T^{-1}v‖ ≤ C‖v‖` with the coupon's `C = E J`. In C09,
   `eq:heading-both-prices` has `C_B = n(a+na^2)^{d+1}`. I checked that this is literally
   `Local.triangularPrice F a = (n)(a+n a^2)^{d+1}` with `n = F.extra+1`
   (`Lean/YM/Push/LOCAL_SPLITTING/Leading.lean` l.17). The source proves
   `triangularPrice F cap ≤ E J` (Crowding.lean l.98), so `C_m = E(J_m^f) ≥ C_B` as the report's
   §2(a) says. I also re-derived the inverse induction of C09 l.175–201: the off-diagonal entries of
   row `i` have grade `< g_i ≤ r`, and `a + na^2K^r ≤ K^{r+1}` because `K ≥ 1`. ✔
4. **The heading does not depend on the wing.** The source quantifier order is
   `∃ Vj, ∀ Xk, (principal keys ∈ Xk) → Stampede … Vj Xk` (Crowding.lean l.68). So the heading is
   chosen before the wing, which is stronger than the consumer's "common to that whole wing". C09
   l.347–351 allows it to depend on `d` only, and the consumer fixes `d`. ✔
5. **Axis coupon.** `jewelCard` (`Rosin.lean` l.91) has lead `Zx.leads L x`, lead price
   `rate L·‖core x‖`, residual price `E J·‖vowel(core x)‖` and allowance
   `2·exp(supportExponent(K z))·title G vT`. These are the consumer's `η_m`, `C_m`, `t_m`.
   `Doors.rate L = L^{-2/5}` (`Lean/YM/Extra/SOURCE_HISTORIES/Reserve.lean` l.30) is C09's `η`. In
   the source, `J = clock.J (m+1)` (Crowding.lean l.33), so `C_m = E(J_m^f)` as the consumer writes. ✔
6. **Regular coupon.** `Stampede.regular` (Wallet.lean l.26–27) has `u = (Old).p.mass b x`, prices
   `w·u, w·u` and bill `2u`, for complex `f : Config → ℂ`. `RegFit` contains `anchor : o ∈ b`
   (`LocalDebt.lean` l.61–65), so the support contains the origin, as in C09 l.296 (`X ∋ 0`). The
   source states the price `ηu` for the complex insertion itself. The factor 2 comes only from the
   bill, as in C09 l.254–255 and the consumer's `2u`. ✔
7. **Forced coupon.** `Stampede.forced` (Wallet.lean l.28–30) has price
   `w·(u/√forcedAllowance(i+1))`, with `i = m` (`Rout = rep … i`, `Old = rep … (i+1)`), and bill
   `2u`. It requires `A (.gasKey j)`, i.e. the tag lies in the wing. This matches the consumer's
   fine-level `κ`, its "marked wing site" and its undivided bill, and C09 `eq:history-forced-price`
   with `κ_f`. ✔
8. **Crossing allowance.** This is the report's §2(b). `hz₀` (Crowding.lean l.84) identifies
   `title G (M.p.profile j)` with the fine local section's readability bound, which is C09's `τ_f`.
   The exponent is `(rep N n (m+1)).p.supportExponent`, i.e. `E_{m+1} = b_f`. ✔ (see N1)
9. **Purchases.** In the source, `Doors.Budget.fits` (Reserve.lean l.71–72) supplies
   `Buys H F W m (C (J(m+1))) (rate (block m))`. The four fields of `Buys`
   (`Lean/YM/Extra/SOURCE_HISTORIES/Replay.lean` l.47–51) are `1 ≤ C`, `0 ≤ η`,
   `η(1+s)·orbitCost ≤ barunit(block m)` and `(C+ηs)·orbitCost ≤ W.K(J(m+1))`. Here
   `barunit L = (L^{1/8})^{-3} = L^{-3/8}` (`Lean/YM/Bid/Loan.lean` l.34–35). These are the
   consumer's displayed purchases (l.35–48), `eq:ex-interpolation-buy`
   (`phase-quantitative-producer.tex` l.446) and C09 l.360–366. ✔ (see N2)

## R1 (refinement of report §2(a)): both lower bounds on `C` come from the one schedule hypothesis

C09 requires `C` to be at least **two** prices (l.223–226):
- `C_B`;
- "the graded remainder price in the primary estimate".

The report says the second is "built into the source's primary coupon" `jewelCard`. More precisely,
both are the two clauses of the consumer's schedule-price hypothesis. In the source this is
`Chop s C r` (`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Circlet/Cheviot.lean`
l.34–36), a hypothesis `h'` of `clocksHere` and `jewelCard`. For `d+3 ≤ i`:
- clause 1: for every nonzero axis `x` there is a charge with `billG … ≤ C j`. This is the graded
  remainder price.
- clause 2: `Seal.limit … ≤ C j`. This is the cap's triangular-price bound, used as `(h' …).2` at
  Crowding.lean l.98.

So the consumer's phrase "schedule-price bound" has to be read as **both** clauses. The consumer
sentence at l.31 ("the selected schedule-price bound supplies the cap's triangular-price estimate")
names only the second. This is an incompleteness in the wording that ADB991 introduced, not a
mismatch: the hypothesis list at l.33 already includes "schedule-price bound" without restriction.
When the "not yet accepted" sentence is replaced (report §4), the replacement should say that the
schedule-price bound also covers the graded remainder price of the primary estimate.

## N1–N3 (wording, for whoever updates the consumer after acceptance)

- **N1. Symbol clash across the edge.** In C02, `b_m` is the block side (l.25; l.7 calls the same
  side `ℓ_m`). In C09, `b_f` is the fine support exponent (`m_f(X,h)=e^{b_f C_{B_f}(X)}h`, l.221).
  The identification `t_m = t_f` needs `E_{m+1} = b_f`, not `b_m`. The citation sentence should state
  `E_{m+1}=b_f`, `ϑ_{m+1}=τ_f`, `ℓ_m=b_m=L` explicitly.
- **N2. The purchases are not produced by C09.** C09 l.360–366 relays them from "the common scale
  payments", and in the source they come from `Doors.Budget.fits`, not from `clocksHere`. They are
  also not part of the input's wording at l.33. The consumer introduces them separately at l.35–48
  as the "selected clock purchase". The report's table includes them as a matched clause, which is
  harmless. But the accepted status should not read as if C09 produced them: they remain a
  hypothesis on the selected history (`Budget`), and the report's §3 bullet "the common scale
  payments" already lists them.
- **N3. Section to cite.** The C02 `RESULTS.md` row and l.33 name `sec:heading-history-handoff` as
  the candidate producer. The ticket comes from `sec:three-port-history`, and only the heading bound
  `eq:heading-both-prices` comes from `sec:heading-history-handoff`. The replacement sentence and the
  status row should cite both, as the report's §4 suggests.

## Observation outside the edge (no action needed for this edge)

`RegFit.proj` (`LocalDebt.lean` l.65) requires the holonomy vanishing only for **nonwrapping**
supports, and `RegFit.unit_null` requires `f 1 = 0`. C09 l.296–297 says "vanishing holonomy tests
through degree `d`" without the nonwrapping qualifier. This is a C09-internal precision point about
the regular insertion's hypotheses. The consumer quantifies over "supported regular fields" as the
selected history supplies them, so the edge is unaffected.

## What remains conditional (agreeing with the report's §3)

- the funded interpolating transition (held spring) and its slot realization;
- C09's upstream analytic producers: the primary calibration, the regular principal producer, the
  projection payment and the local splitting;
- the schedule-price bound (`Chop`, both clauses, R1);
- the selected budget (`Doors.Budget`, including `fits`, N2);
- C09's coupling threshold, which C09 l.375–379 takes at a fixed stage as the maximum over finitely
  many stages and grades.

I-C02-funded-record is a separate input and is not addressed.

## Consumer position on the report's proposed follow-up (§4)

ADB991, as author of the input's wording, agrees with both proposed edits, amended by R1 and N1–N3.
Neither edit is made here. `centered-freight-producer.tex` and `RESULTS.md` are left to the C02
author claim (Trishen, https://github.com/hairer/humanise-yang-mills/issues/43#issuecomment-6858423295),
or to a later claim after it is released, and to come after the independent check of #313.

## Checks actually run

- SHA-256 of both chapters at `ec7ed5db`: they equal the report's hashes (`sha256sum`).
- Source read at the pin, textually: `Crowding.lean` (l.20–99), `Wallet.lean` (l.17–31), `Rosin.lean`
  (l.80–103), `Cheviot.lean` (l.34–36), `Leading.lean` (l.17), `Reserve.lean` (l.30, 65–72),
  `Replay.lean` (l.47–51), `Loan.lean` (l.34–35), `LocalDebt.lean` (l.61–65).
- `python3 scripts/check_blueprint.py` and `python3 -m unittest discover -s tests`: see the PR body.
- Not run: Lean elaboration (Mathlib hosts are blocked here) and a LaTeX build (no manuscript change).
