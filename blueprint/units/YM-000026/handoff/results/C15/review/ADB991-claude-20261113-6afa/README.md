# Independent review: C15 `trace-bill-prices`, `trace-probe-assembly`, `trace-mission-price`

- Session: `ADB991-claude-20261113-6afa`. Role: independent reviewer (mathematics and textual Lean correspondence). Prepared by Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not read it before submission.
- Task: #334 (parent #56, umbrella #26). Claim: https://github.com/hairer/humanise-yang-mills/issues/334#issuecomment-6867597757 (until 2026-11-14 19:00 UTC).
- Target: the three chapters as they stand on `codex/existence-monograph` at `7475e65d78b55053cc4328ad4aef5957e934ae9f`. They are byte-identical to the claimed base `dcbdcc82`, as `git diff --quiet` confirmed. Their content is schmittj's author pass #105 (`f8022ce0`) plus the #194 source-leakage wording of commit `a4a73dc9`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. SHA-256 values are in `inspected-sha256.txt`.
- Independence: ADB991 did not write #105, the part-A/part-B author records, the evidence files, or any earlier version of these chapters. ADB991 did write commit `a4a73dc9` (#194 / PR #207). It changed these files by bill-prices +10/−11, probe-assembly +4/−3 and mission-price +3/−3, all wording that replaced "proved in the source" with "outstanding input, not proved in this monograph". mgubi's review `review/mgubi-astra-c15-leakage-review-20261113/` covers those hunks, and this report does not certify them. S1 below bears on one of them. Every other line was checked independently.

## Verdict

Every displayed identity and inequality in the three chapters was recomputed, including all exponents of τ. Under their stated inputs the proofs are correct. The statements match `YM.Trace.Terrace.{nativeC, Bill, majesty, tends_price}`, `YM.Trace.Terrace.Glade.tide` / `YM.Trace.Terrace.Probe`, and `YM.Trace.Terrace.{Mission, ear_price, mileage}` in hypotheses, constants and quantifier order. There is one exception, M1.

**One required change, M1, in `trace-probe-assembly.tex`.** The buffered chamber estimate `eq:ex-trace-probe-buffered`, and through it conclusion (3) of `prop:ex-trace-probe-assembly`, quantifies over tests interior to "the same locality window" as the components `x_d, y_d` (radius `l`). Three other places use the fixed grade-four window of radius `l_4` = grade-four stencil radius + 4, with room for `l_4`:

- the source (`Probe.toll` and `stageCrown` use `window 0 (lensScope C 4)`; `tide` lets `l` be arbitrary and independent of it);
- the producer `prop:ex-trace-crown-buffer` (`trace-crown-buffer.tex` l.95–98, 246);
- the consumer `trace-mission-price.tex` (l.37–40).

As written, the proposition's conclusion (3) does not give the probe property that the mission consumes, unless `l = l_4`. The fix is local: restate the test class in `eq:ex-trace-probe-buffered` as in crown-buffer.

**One should-fix item, S1, in `trace-probe-assembly.tex` l.30–35 and l.210–212.** Two of the four scale bounds in `eq:ex-trace-probe-scales` are called "inputs … not proved in this monograph", yet each follows in two lines from facts the monograph already uses:

- `1+2t ≤ τ_j(230)` follows from the rate-zero ticket for `t = β̂_{K_j}`. That ticket is the scale-at-summit receipt already listed in `trace-bill-prices.tex`; the sum and product rules stated there apply.
- `6c ≤ t` follows from `β̂_k → ∞` with `c` a fixed constant.

The source proves both this way (`tide` l.43–44: `sapTree`, `stickK`, `Ticket.sum`, `toll_small`; `hrate ∘ Sstar`). The other two bounds, `t ≥ 1` and `0 < β ≤ 2t`, are clock and Wilson-representation facts (`fits.delayed`, `represents … band`, `beta_positive`), so citing them as inputs is reasonable.

The other findings are wording or bookkeeping.

| ID | File | Kind | Summary |
|---|---|---|---|
| M1 | probe-assembly l.116–128, l.148–150 | required | The test window in the buffered estimate and in conclusion (3) must be the fixed radius-`l_4` window with room for `l_4`, not "the same locality window" |
| S1 | probe-assembly l.30–35, l.210–212 | should | `1+2t ≤ τ_j(230)` and `6c ≤ t` are derivable from the summit-scale ticket and `β̂_k → ∞`; prove them instead of listing them as unproved inputs |
| N1 | probe-assembly l.106–107, l.174–176 | wording | Additivity of the pullback `𝓑` is used; in the source `backTo` is additive only on the window-interior (Envelope) class (`stroll`, `cylinder_env`). The text should say so; homogeneity (`linC`) is unconditional |
| N2 | probe-assembly l.58–61 | wording | The covariance `ρ_g Z_d = sign(g,d) Z_{g.perm d}` rests on the cocycle `sign(gμ,e)=sign(μ,e)·sign(g,μ.perm e)` and `prev(gμ, g.perm d)=prev(μ,d)`. One displayed line would let a reader check it (recomputed in `mathematics.md` §2.2) |
| N3 | probe-assembly l.88, l.137 | wording | `X_d, Y_d` are called "paid coefficients"; in `Bill` and in `trace-bill-prices.tex` they are the public labels `x` (the paid coefficient is the other argument `y`). Align the terminology |
| N4 | probe-assembly l.142–145 | wording | The probe needs oddness of `a^5 Z_d`; the text proves it for `Z_d`. Add "and hence of `a^5Z_d`, by real-linearity" |
| N5 | bill-prices l.46–52 | wording | `G_i` is used (l.47) before it is defined (l.52); tickets of nonzero rate `α` are used in the product rule but only rate zero is defined |
| N6 | mission-price l.14, 26, 110 | notation | `a_i` must be the field scale at the frame level `j_i` (source `C.S.a (V i).k`; `kamago`: `X.r i = C.S.a (V i).k · b_i`). `trace-small-means.tex` l.41 says so; mission-price says only "the field scale" |
| N7 | mission-price l.36–40 | wording | The probe's separated-site bound in the source (`Probe.toll`) does not require the test's pullback to be chamber-interior. Adding that hypothesis weakens the probe statement harmlessly, since the localization receipt supplies it, but it is not the source statement |
| N8 | mission-price l.25 | wording | "complexity at most `m`": the source fixes `m`. Since `β̂ ≥ 1` the two agree, but say "complexity `m`" |
| N9 | probe-assembly evidence file | record | `trace-probe-assembly-evidence.md` scale-arithmetic row writes `β̂(k)^2 ≤ a^5 β̂(k)^4`, which is false for `a<1`. The manuscript (and `tide` l.80–86) correctly bound `a^5·coeffSize(Col Z) ≤ a^5 t^2 ≤ a^5 t^4` |
| T1 | all three | tracking | `C14-to-C15-chart-pairing-convergence` (`spots`) is **not consumed** by any of the three chapters. Mission-price's table limit `eq:ex-trace-mission-table-limit` is the distinct finite-volume-to-table limit `proxi` (part-B ledger row `unlocated-to-C15-mission-chart-limits`). The C14 edge enters only in `trace-small-means.tex`, where the mission price at `r_i z_i = a_i(ξ_i,0)` is combined with chart convergence at `ζ_i^{pt} → (e_0,0)`. That join (same point, `b_i → ∞`) matches |

Details: `mathematics.md` (proof checks) and `lean-correspondence.md` (source checks). `validation.md` lists the commands actually run.

No approval is given or implied. A human reviewer takes responsibility for acceptance.
