# Independent review of the C14 chart/curve author response (PR #256)

- Unit: YM-000026, package C14 (#55). Target: PR #256 (mgubi, session `mgubi-astra-c14-chart-curve-20261113`). It answers PR #177's remaining raw/corrected-chart ambiguity and its one-comparison-curve request.
- Roles: mathematical validity (`mathematics.md`) and textual Lean correspondence (`lean.md`), in separate reports.
- Reviewer account: ADB991. Session `ADB991-claude-20261113-3696`.
- Agent assistance: Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not reviewed this report before submission. ADB991 did not write any C14 chapter, PR #177 or PR #256. Earlier ADB991 work on C14 was review only (PRs #230, #242, #243).
- Reviewed head: PR #256 `f3a0a4b485b434c2abdb5fe1bd87e132bd4d1553`, based on `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/55#issuecomment-6864036968

## Content fingerprints (SHA-256 at the reviewed head)

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/trace-calibration-producer.tex` | `da5e49203e0f206500aad1ae4e8bf312187dbcb6659cfc89ae17454121ad1c2a` |
| `.../C14/author/mgubi-astra-c14-chart-curve-20261113/response.md` | `5a407cc70e0470748566614bdc90ca42c288b8ce15e8ac53e2f37de89b7dbd41` |
| `.../correspondence.md` | `fb72aba398346f8cd1fcace3ae462e93a2ea3671ac29b120153575d66308993a` |
| `.../validation.md` | `2f4a268a73b6a0a9702aae553d07506a01e4a5285e13b8ffa4044cd1c23ad55b` |
| `.../fingerprints.json` | `e3605574d6b104a03f4623bd86bb54aa9ad91adc7fadccfebb3a15d6628afda3` |
| `.../verify.py` | `2d87d9c4e0bec6641be39b3598626a8593a46b5d73e55fefdec2e197ba88098e` |

Base chapter (`69b2631`): `404f5e4cf240f155da5ca3c65719910299a6a0aafd84fcc7568bdb3da06b1035` (agrees with the author's `fingerprints.json`).

## Outcome

**The notation repair and the early-index completion are correct, and they match the source. One minor quantifier repair is required (R1). One recommended weakening of the new joint input (R2) and two optional notes (O1, O2) follow.** No mathematical error was found in the changed hunks.

- **Raw versus corrected maps.** Fixed. `U^raw` is now used in the recursion, the mixed-slot identity, the gluing and the proof. `C` is used for the corrected maps and `U` only for the completed isomorphisms. I checked every occurrence (`mathematics.md`, A1).
- **Inverses before eventual bijectivity.** Fixed. Before this change, `Y_i(T)=r_i^4U_i^{-1}T` was used with `U_i=C_{i,4}`, which need not be invertible at early `i`. The completion gives isomorphisms at every index. It changes finitely many terms per grade and keeps all eventual identities (A2). It is exactly `M` in `YM.Next.UVStress.Stations.equivalences` (`lean.md`, L1).
- **Exact versus eventual identities.** Correct. The balanced identity is exact for `C` whenever `d≤e≤k`, and eventual for `U` (A3).
- **One comparison curve.** The new joint-curve input does say what PR #177 asked for: the receipts hold on a single curve, with one choice of fixed physical and reference data. However, the way it is tied to the theorem leaves a quantifier gap (R1), and it is stated for every null sequence where the source and the consumer use only one curve (R2).

This is a bounded review of the PR #256 delta. It is not a renewed review of C14 as a whole. It does not cover PR #216 (reviewed in PRs #230 and #242), PR #252 (under separate review on #55), or the analytic production of the joint input, which the PR rightly leaves open. Human acceptance is not recorded here.

## Findings summary

| ID | Kind | Location | Summary |
| --- | --- | --- | --- |
| R1 | required, minor (quantifiers) | `par:ex-trace-joint-curve`, `thm:ex-lattice-selected-trace-gallery`, calibrated-stress subsection | The joint input says that *some* admissible choices give a curve carrying all receipts. The theorem concludes that *there are* `n_k` and `C_{k,d}` with the chart properties. Nothing says the theorem's curve is the joint-input curve. In addition, several theorem hypotheses (the correction receipts and the shell-flux limits) are stated through `U_i=U_{i,4}`, which is defined only after the theorem, from its conclusion. None of these hypotheses is used in the theorem's proof. Fix: state that the conclusions hold for every admissible choice of the one-stage selections and finite-volume limits (the proof already shows this), so they hold in particular on the joint-input curve. Move the correction, beam, trace and shell-flux receipts out of the theorem's hypotheses into the calibrated-stress conclusion, where they are used. |
| R2 | recommended (strength of open input) | `par:ex-trace-joint-curve` | The input is assumed "for every positive null sequence". The consumer (`sec:actual-stress-normalization`, "We construct one physical tensor and one comparison curve") and the source interface (`YM.Trace.Over.ChoiceK … (J : Scaling S)`, reached from the curve built by `Stations.build_curve` from `Stations.ranging`) need only one curve. Stating the input existentially makes the outstanding obligation weaker and matches the source. If the every-sequence form is wanted for another consumer, name that consumer. |
| O1 | optional | completion paragraph | Say explicitly that the uniform test estimate (eq:ex-lattice-trace-uniform-tests) transfers from `C` to `U`, because for a fixed tuple the two agree for all large `k`. `sec:actual-stress-normalization` uses it for `U` (eq:stress-uniform-tests) and cites the theorem's estimate for `C`. The step is one line but is not written. |
| O2 | optional, integration | joint-curve input vs PR #216 | PR #216 turns property 3 into an "eventual optical-comparison input" on one curve. When both PRs merge, list that input among the receipts required on the joint curve, so that it is not a separate per-curve assumption. The current wording ("the stated optical and coherence identities hold" on a common tail) points that way but does not name the input. |
| N1 | observation, outside the delta | `subsec` "Every vanishing positive scale has a strict subsequence" | Along the route that the PR's correspondence cites (`build_curve` ← `Stations.ranging`), the radii are chosen by `Stations.arbitrarily` with `r ≤ δ` and `r_k ≤ 1/(k+1)`. They are not terms of a prescribed sequence `s_n`. The pre-existing claim that the source proves the every-sequence version should therefore be checked against whichever route supplies it. I did not search for another route. This predates PR #256 and is not a finding against it. |
