# C15-to-C16 TraceTest: endpoint matching on the same hierarchy (#337, phase 1)

Session `ADB991-claude-20261114-bf13`. Claim: https://github.com/hairer/humanise-yang-mills/issues/337#issuecomment-6868990178.
Base `codex/existence-monograph` @ `97f806c7`; Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. This is a report only: no manuscript, ledger, unit record or `Lean/` file is changed. Inspected byte hashes are in `inspected-sha256.txt`.

Method. One parent session read the consumer (`trace-asymptotic.tex`, `assembly.tex`), the scribe producer, the firesky gallery and the #356 rounded comparison, and read the source textually. Two read-only subagents of the same session each matched one strand: the YM-000033/34 suppliers, and the C14 shell calibration with chart selection and the clock. The parent re-read the cited lines behind every definite finding below (F1–F4). Everything else from the subagents is marked *(subagent, not re-read)*.

Independence. This account authored #356 (draft, `trace-rounded-comparison.tex`) and earlier C15 reviews (#332, #341, #333). #356 is counted here only as an **unreviewed conditional supplier**. This report is not a review of it.

## Verdict

**The endpoint is not closed.** The C15 implication still matches the C16 target on the consumer side. The C16 target is `ex-trace-limit` with `3 dim_R g / pi^4` at `T(r)` on `chi_*`, and the finite mass-shell exclusion. The suppliers of `input:trace-scales`, however, do not yet attach on one hierarchy for every null sequence. One dictionary mismatch (F1) is repairable with a short ratio argument. The main gaps are the every-sequence joint receipt (F2) and the C14 shell calibration for the actual stress `R` (F3). Another gap is one clock bound (F4).

## Consumer side: unchanged since #245, so carried over

`trace-asymptotic.tex` is byte-identical to the C15 freeze `2719f797` used by #245. `git diff 2719f797 97f806c7` is empty for this file. `assembly.tex`, `statement.tex`, `trace-profiles.tex` and `trace-spectrum.tex` are byte-identical to the C16 freeze `69b2631f` of #245. The #245 matches therefore carry over unchanged:
- the centered field;
- `T(r)` at time-axis points;
- the full-radius limit from an arbitrary null sequence;
- the exact finite profile class, including empty products.

They were not re-derived here, except for the following two checks:
- **Coefficient, recomputed by hand.** The expansion of `C_abij` as `(H_ai H_bj - H_aj H_bi)/(pi^2 r^4)` holds; the quartic terms cancel. The sum over ordered pairs `(a,b)` of `2 - 2 delta_ab` is 24. This gives `<O O> = (2N/16) * 24 / (pi^4 r^8) = 3N/(pi^4 r^8)`, and `(4 d_2)^2/(2 b_0)^2 = 1` when `d_2 = -b_0/2`.
- **`kappa = 2 b_0` is definitional in the source.** `Gauge.slopeConstant := 11 * casimir / (24 pi^2)` (`YM/Gauge/Colors.lean:184`), and `Running.slope : slopeConstant = 2*b0` (`YM/PertExtension/Running.lean:22`). The value of `b_0` in `input:trace-scales` is therefore consistent with the scribe's `kappa`.

**Order of choices (source).** `Gallery.lead` (`YM/TraceExtension/Chart/Line.lean`) has the form "exists ultrafilter `L`, arch `Z`, hierarchy `a`", then "for all `s` tending to 0 with `s > 0`", then "exists strictly monotone `f`, a scaling `J` with `J.r = s o f`, and `V` with `Scribe F J V Z T L X.kernel a`". `Scribe` (`Chart/Time.lean`) contains `meters : exists Y, Gondola Q H J L V Y` on the **same** `J`. In the source, the chart readings and the moving-label and clock data therefore share one scaling, with the filter and hierarchy fixed before the sequence. The manuscript states this order only in prose: scribe lines 708–717 and firesky lines 33–37 and 110–111.

## Clause-by-clause status of `input:trace-scales` and `thm:trace-asymptotic`

| Clause | Supplier (file:label) | Status |
| --- | --- | --- |
| Strict subsequence with radii exactly `r_i = s_{n_i}`, for every null sequence | `trace-firesky-gallery.tex`, `lem:ex-lattice-firesky-selection` | **conditional on a missing producer** (F2). The lemma assumes the one-step output with exact radius `s_n < theta` after every index. The three-panel result chooses its own radii (`trace-calibration-producer.tex` 466–471 says so). Source: `pays_sky` under `FiresSky` *(subagent, not re-read)*. |
| Moving label `U_i^{-1}(B_i r_i^4 Theta) -> 4 d_2 O` with `B_i = q_i` | scribe `eq:ex-lattice-scribe-physical-transfer` with `eq:ex-lattice-scribe-band-cost` and the `U_i 1 = 1_S` paragraph | supplied conditionally on: rank one (`lem:ex-lattice-trace-rank-one`; coherent-center and eventual-optical inputs open); sensor (S); branch (B) with F1; shell calibration inputs 1–4 (F3); clock (F4) |
| `log(r_i^{-1})/B_i -> 1/(2 b_0)` | scribe `eq:ex-lattice-scribe-clock` | supplied conditionally on `eq:ex-lattice-scribe-clock-inputs` (F4) |
| Rounded configurations, `eq:trace-basis-error`, window, continuity | #356 `cor:trace-rounded-input` (draft, unreviewed) | conditional on (G1)–(G4) and (Ph1)–(Ph3). (G3), the pairwise root-test receipt with its width clause, has no producer. Same-chart issue: see F2 and N1. |
| Hyp. 1, positive Laplace representation | `trace-spectrum.tex` | conditional on its reconstruction and stress hypotheses; unchanged since #245 |
| Hyp. 2, Euclidean invariance and scalar law | `trace-spectrum.tex` / C04 | conditional; C04 review #76 corrections are pending (C16 ledger) |
| Hyp. 3, reference normalization `eq:trace-reference-normalization` | stated as a requirement (`trace-asymptotic.tex` 72–76) | **missing as a producer**. The text needs the comparison reference table to be the free hierarchy and its `O` to be YM-000034's `mathcal O`. The contraction itself is correct (recomputed). |

### Supplier inputs to the scribe (YM-000033, YM-000034)

Both units are `draft` with `reviews: {lean: null, mathematics: null}`. Their current fingerprints have drifted from the reviewed ones because `trace-free-rank` changed, and for YM-000033 also `trace-weighted-estimates` and `trace-small-means` *(subagent, not re-read)*.

| Item | Supplier | Status |
| --- | --- | --- |
| (S) `‖mu_i‖ <= C`; for every delta, eventually, uniformly in `y`: `t_i |mu_i(s_i y) - Lambda(y)| <= delta ‖y‖` | `prop:trace-prosper-sensor`, `eq:trace-sensor-conclusion` | supplied conditionally on (S1)–(S7) and the marked sequence. The weight `a_i = A_{1/5}` at the postselected level `n_i` equals the scribe's `k_i` (summit). The quantifier order matches. |
| (B1) three field limits | `prop:ex-branch-moments` | supplied conditionally; **see F1** |
| (B2, B3) `hat-beta_{k_i}^p tr P_i t^b -> 0` for `b in {0, -}`, `p = 1` | `prop:ex-branch-washout` | supplied conditionally. The weight is exactly `z_i` at the summit. Nothing is claimed for `b = +`, and the scribe uses nothing there. |
| (B4) `tr M(w^+) = 4 O` | `eq:ex-branch-three-traces` | supplied (algebra) |
| Scale relations "outstanding" at scribe 364–366 | — | `rho_i <= t_i` holds trivially (`A_{1/6} <= A_{1/5}`). `t_i <= z_i` is proved eventually (`trace-weighted-estimates.tex` near line 205). `q_i <= 2 z_i`, `rho_i/q_i -> 0` and `t_i -> infinity` follow from YM-000033's clock input (S1), which is already a premise of (S). They are therefore not additional open inputs (editorial; see N2). |

## Definite findings

**F1 (dictionary mismatch, repairable).** The scribe identifies its pullback `P_i` with YM-000034's `𝖯_i = omega_i U_i^{-1}` "with `omega_i = q_i r_i^4`" (scribe 296–301). It also states that `q_i` is the arch scale at level `k_i` (scribe 164–165, 597). YM-000034, however, defines `omega_i = beta_Z(k_i) r_i^4`. Here `beta_Z(j)` is the ultrafilter limit of the finite-volume effective couplings (`trace-branch-moments.tex` 124–126, 495–503). Neither unit states `beta_Z(k_i) = zeta(k_i)`. What is available is:
- `beta_Z(j)/hat-beta_j -> 1` (YM-000034 497–503, from its running and fixed-scale inputs);
- `zeta(j)/hat-beta_j -> 1` (scribe clock input; YM-000033 139–140 under (S1)).

Proposed repair (parent's argument, for the scribe author to adopt or reject). Put `lambda_i = beta_Z(k_i)/q_i`. The two ratio inputs give `lambda_i -> 1`. The scribe's `P_i` is then `lambda_i^{-1} 𝖯_i`, entrywise. The field limits (B1) survive multiplication by `lambda_i^{-1} -> 1`. The washout limits (B2, B3) survive multiplication by the eventually bounded `lambda_i^{-1}`. `tr P_i(Delta_i) -> 4 O` also survives. The exact identity for `Y_i(T_i)` uses only the definition `P_i = q_i Y_i` and linearity, so it is unaffected. All scribe conclusions therefore hold under the additional input `lambda_i -> 1`. The exact equality `P_i = 𝖯_i` should not be asserted.

**F2 (every-sequence joint receipt: missing).** `input:trace-scales` needs, for **every** null sequence, the moving label, the clock limit and `eq:trace-basis-error` with the same `U_i`, `r_i` on the subsequence selected for that sequence. `trace-calibration-producer.tex` 383–392 states that "no normalization receipt on every prescribed sequence is asserted" and that the all-sequence joint input "is outstanding". The scribe's sentence at 717–720 ("the physical transfer above applies without another extraction") therefore rests on that outstanding input, not on a supplier. Smallest missing statement: a one-step producer that returns, after any index and below any threshold, a chart of exact radius `s_n` carrying all receipts used here on that chart. Those receipts are:
- optical identity;
- sensor and branch data;
- shell inputs 1–4;
- clock bounds;
- the pairwise receipt (G3).

Source: `Gallery.lead` as above, via `gang` / `pays_sky`.

**F3 (C14 shell calibration for the actual stress: missing).** Scribe inputs 1–4 (lines 403–456) concern `R = reCenter_S(A.energy)` with Ward coefficient exactly 1. The C14 Ward package (`cor:selected-ward-package`, `physical-ward-propagation.tex` 1008–1022) is stated for raw responses `p = c V` with some unknown `c != 0`, and for the C14-normalized stress. `reCenter` appears in no chapter outside the scribe. The following are missing:
1. the identification of `R` with the C14 stress, at Ward coefficient 1;
2. "`M_0` is centered and conserved and obeys the reference Ward identity";
3. the detecting derivative `o.test_5(D_a v) != 0`, which should be a short deduction from `trace-free-rank` and faithfulness of the free detector *(subagent, not re-read)*;
4. (4c) for the selected table.

(4a), (4b) and (4d) are supplied conditionally on the C14 chart curve but are not instantiated on the scribe's charts *(subagent, not re-read)*.

**F4 (clock bound: missing).** Of `eq:ex-lattice-scribe-clock-inputs`, the two ratio limits are supplied conditionally by YM-000034 (488–541). The third, `0 <= log b_i <= (log hat-beta_{j_i})^48`, has no producer. The part-B ledger row E-clock also says "producer unidentified" *(subagent pointer: it would follow from a tilt-cap chart bound and the zero-rate tilt-cap ticket, which is itself outstanding)*.

## Notes (non-blocking)

- **N1.** In #356, (G1) writes `r_i = a_{k_i} m_i` with "chart level `k_i`". This `k_i` is the scribe's **frame** level `j_i`, with `r_i = a_{j_i} b_i`; it is not the scribe's summit `k_i`. When #356 is reviewed, the notation should be aligned. Its (G2) `U_i` is the same chart extraction as the firesky gallery. That matches the source (`Scribe.meters` on the same `J`), but the manuscript states the match only through F2's missing producer.
- **N2.** The scribe's list of outstanding scale bounds (364–366) could cite YM-000033 (S1) and `trace-weighted-estimates` instead of calling them open.
- **N3.** The scribe uses `kappa` both for the slope (`kappa = 2 b_0 > 0`) and in the flux `-kappa O`. C14 uses a Ward constant written `kappa = -1` (free Maxwell). These are different meanings, and integration should rename one of them.

## Next steps (proposed owners)

1. Scribe author (C15): adopt the F1 ratio repair; fix the N2 wording.
2. New author task (C15/C14 boundary): the F3 shell-calibration producer for `R`. The detecting derivative is a small first piece.
3. New task (C15): the F2 every-sequence one-step producer together with (G3), the open input of #356.
4. Owner of the clock schedule: the F4 bound.
5. Independent review of #356 and of this report.

Phase 2 of #337 (the `input:trace-scales` handoff paragraph) should wait until F2 and F3 have producers.

## Checks actually run

See `validation.md`.
