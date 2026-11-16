# Renewed check of #360 (answer to M1 of review #327)

- **Session:** `hairer-claude-360rev-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/50#issuecomment-6882345159
- **Reviewed:** PR #360 by ADB991, head `f5de7b3`, merged as `57f71b1`. The paragraph is unchanged on `codex/existence-monograph` at `7edd9c2`.
- **Independence:** hairer did not author #360 or `heading-history-handoff.tex`. hairer wrote review #327, and this is that reviewer's renewed check of M1.
- **Status:** report-only. The mathematics was checked against the manuscript. The Lean correspondence is textual only, at pin `3456e5e`: `Lean/YM/MergeProof/Renaissance.lean` matches `Lean/SOURCES.sha256`. Nothing was elaborated.

## Verdict

**M1 is resolved.** No change is required, and there is one optional wording note.

The paragraph now lists every hypothesis of `prop:ex-selected-interpolation` (`phase-quantitative-producer.tex`) and says which ones the section supplies. I checked each item against the proposition and its preamble.

| Hypothesis of the proposition | #360 | Check |
| --- | --- | --- |
| Heading T(L) = B∘vowel_L, B commutes with core deletion, ‖B‖, ‖B⁻¹‖ ≤ D₀ = K_{J(m+1)} | (a) supplied | Correct. `eq:heading-both-prices` gives both norms ≤ C_B. Here C ≥ C_B by the definition of C (l. 223–225), and C_orb ≥ 1. The second purchase inequality then gives C_B ≤ K_f. K_f is "the next coefficient budget", i.e. K_{J(m+1)}. |
| Purchase inequalities `eq:ex-interpolation-buy` (four clauses) | (b) supplied | Correct, with R_F = C_orb, s = s_f and barunit(L) = L^{-3/8}. C ≥ 1 follows from C ≥ C_B and C_B ≥ 1 (since 1 = ‖BB⁻¹‖ ≤ C_B²), and η = L^{-2/5} ≥ 0 (l. 216). t = t_f ≥ 0 comes from `eq:history-common-waybill`. |
| Common gauge door, soundness | (c) supplied | Correct. The door is fixed before d (l. 345–356). |
| Basis coupons with exact density/profile identities | (d) supplied for the component coupons | Correct. The passage to basis coupons is correctly deferred to (iii). |
| Wings are the motion images of the common funded wing | (e) supplied | Correct reading. In the proof of the proposition, the reoriented coupon Z_{g,j} carries "the finite wing … to its image under the move". The common wing is the finite set constructed at the start of the subsection, and it is chosen before the coefficient vector. This settles ADB991's second uncertainty. |
| (H1)–(H6) | (i) input | All six are listed, and the paraphrases are faithful. |
| Profile hypotheses (sound under reorientation, covariant forced profiles, nonzero evaluation) | (ii) input | Faithful. |
| Outstanding merger and summable lead-price receipt | (iii) input | Faithful to the preamble. |
| Bank and room bounds | (iv) input, pointed to `prop:ex-stored-service-budget` | Correct pointer. See note N1. |

**Source (textual).** `YM.MergeProof.repriseQ` (`MergeProof/Renaissance.lean`) takes the following as hypotheses:
- `Heard` (i);
- `roomCost H.levels W` and `Bank W H.levels` (iv);
- `GaugeDoor`/`SoundDoor` (c);
- `Stampede … T Xk` with `0 ≤ t` (d), (b);
- the finite wing `Xk` with `Keeper` coverage (e);
- `Buys` (b);
- `Chorus` (ii), `B.Sound A` (ii) and `eval ≠ 0` (ii).

Each hypothesis has a counterpart in the split. The supplied/input division matches the source: the transition-side data are produced by the heading construction, and the voice-side data (`Heard`, `Chorus`, `B.Sound`, nonzero evaluation) are hypotheses.

## Note (non-blocking)

- **N1.** Item (iv) says the bank and room bounds "are to be taken from" `prop:ex-stored-service-budget`. That proposition states them with the worth W(J(i)+1) and the column counts C_i, not with D₀ and c_±. The application needs D₀ = K_{J(m+1)} ≤ W(J(m+1)+1), and c_± to be those column counts. Neither identification is spelled out in the paragraph, which is ADB991's first uncertainty. The source uses the same W in `roomCost`/`Bank`, so the pointer is right. Adding a half-sentence naming the identification would remove the gap. Since (iv) is listed as an input, this does not affect the resolution of M1.

## Remaining from #327 (unchanged by this check)

- The review status of `wilson-vacuum-price.tex`.
- The stale C09 `chapter-hashes.json` entry for this file.

## Checks actually run

- Read the #360 diff, the surrounding section of `heading-history-handoff.tex`, and `sec:ex-selected-linear-interpolation`, `prop:ex-selected-interpolation` and its proof in `phase-quantitative-producer.tex`.
- Read `prop:ex-stored-service-budget` in `original-history-portfolio-attachment.tex`.
- Read the statement of `YM.MergeProof.repriseQ`, and checked its file hash against `Lean/SOURCES.sha256`.
- `python3 scripts/check_blueprint.py`; the result is recorded in the PR.
- No LaTeX changes and no Lean build.
