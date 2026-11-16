# Independent review of two C14 author responses (PR #227 and PR #234)

- Unit: YM-000026, package C14 (#55). Targets: PR #227 (answers PR #177 requests 2–4) and PR #234 (answers PR #117 Part 1 F1/F2, retained by PR #177).
- Roles: mathematical validity (`mathematics.md`) and textual Lean correspondence (`lean.md`), kept in separate reports.
- Reviewer account: ADB991. Session `ADB991-claude-20261113-b066`.
- Agent assistance: Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not reviewed this report before submission. ADB991 did not author any C14 chapter, either response, PR #117 or PR #177.
- Reviewed heads: PR #227 `84948b6a09300a5d397cb742b2c6e87341bfc7b9`; PR #234 `e845ac344d33772a21d6f8702ee5858d4e1ea651`. Both are based on `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/55#issuecomment-6863337087

## Content fingerprints (SHA-256 at the reviewed heads)

| File | Head | SHA-256 |
| --- | --- | --- |
| `manuscript/existence/actual-stress-annulus.tex` | PR #227 | `f84e7bc9927dc2f7a0e486201096b35f695ee93eeff472433d4bb7ea6b544d55` |
| `manuscript/existence/actual-stress-shell-nodes.tex` | PR #227 | `2be9d9c11201134d9a48d0ec30596ffc3f7dc39401e95f0f4c12d2097f92c47c` |
| `manuscript/existence/physical-ward-propagation.tex` | PR #227 | `166904fd4c8b5cb373a56d9db5a70055c36878dff985ebeda13a1fd77766dd19` |
| `manuscript/existence/trace-firesky-gallery.tex` | PR #227 | `6f212ada6bbe40e6b0698d9a65cf1f6b9a6515228c28accde3f6c17e59996225` |
| `manuscript/existence/trace-free-rank.tex` | PR #234 | `2a6837d7707542ea8b191a0408bf6f31ca127711de7c0017ca261db181312851` |

Both author manifests (`final-files.sha256`, 12 entries each) also verify at their heads; see `validation.md`.

## Outcome

**Both responses are correct in this scope. No blocking defect; no change required.** I suggest two minor wording points for PR #234 (M1, M2) and one for PR #227 (M3), plus three optional notes (O1–O3).

- **PR #227, request 2 (chamber threshold).** Fixed. The proposition now assumes one birth-level threshold `m_ch` for each opened pair, label pair and extraction order. It holds for every m ≥ m_ch and every anchor in the level-m collar. The proof chooses `m_ch` among the thresholds fixed before the anchor. The late event in (N,q) is still allowed to depend on m and x, and it is common to all grade-D correction labels, which the proof needs because z is chosen after (N,q). This is exactly the order of quantifiers that the conclusion and `def:ex-lattice-shell-receipt` require. The hypothesis is a strengthening, and the text says so. The source supplies it in an even stronger form (`lean.md`, L1). The only other consumer, the annulus input sentence, is updated to match.
- **PR #227, request 3 (centered scalar trace).** Fixed. The decomposed object is now Θ_T, the trace of the stress centred by its one-point value in T. This matches `YM.TraceExtension.theta` and the `gallery` and `goal` fields of `YM.Trace.Over.Scribe`. The two-coordinate representation e_i·1 + d_i·(4O) matches `ScalarP`.
- **PR #227, request 4 (Ward translation).** Fixed. I checked the displayed calculation term by term (`mathematics.md`, B3). The rotation-row terms and the derivative rows are unchanged under a common shift, because every moment is translation invariant. The coefficient (K(x_i+h))_b changes by (Kh)_b, so only Σ_b (Kh)_b Σ_i ∂_{x_{i,b}} S(q;x) remains, and this vanishes. The parallel-line consequence follows.
- **PR #234, F2 (radial reconstruction).** Fixed. I checked the proof in full: differentiate the radial identity, apply Euler's identity, subtract, and the factor 1/(r+2) follows. Both leg-sum expansions (factors 1/2 and 1/3) and the Bianchi relation for j are correct. The conventions match `YM.StressFlux.curl0`, `curl1`, `leg0_value` and `leg1_value` exactly (`lean.md`, L4).
- **PR #234, F1 (derivative plan).** Fixed. The rank proposition is now explicitly conditional on reality, signed vector covariance and the all-spectator compatibility identity (eq:ex-trace-derivative-compatibility). These are exactly `DiffPlan.Orientation.realDer`/`.mirrorDer` and `DiffPlan.Derivatives.kernels`. The probe equality φ_k(D_0T_w) = Σ_u ∂_u S_w(·;u0;e_0) is the content of `tested_div`, with the same insertion order.

This is a bounded review of the two deltas. It is not a renewed review of C14 as a whole. It does not cover PR #216 (reviewed separately in PR #230) or the remaining smaller PR #177 findings. It does not discharge the inputs that both PRs keep explicit: the uniform same-history chamber receipt, the gallery receipts and the derivative-plan compatibility. Human acceptance is not recorded here.

## Findings summary

| ID | Kind | PR | Location | Summary |
| --- | --- | --- | --- | --- |
| M1 | minor, notation | #234 | `trace-free-rank.tex`, spanning identities and the new paragraph after them | The displayed spanning identities use `curl_0^{ij}A_0` and `curl_1^{rkl}A_1`. The new paragraph defines `f_ij` and `j_rkl` but never says that these are those curl coordinates. Add "so that curl_0^{ij}A_0 = f_ij and curl_1^{rkl}A_1 = j_rkl". The source agrees (`curl0 a b A = F_ab`, `curl1 k a b A = F_ab(e_k) = ∂_k F_ab`). |
| M2 | minor, terminology | #234 | same passage | The surrounding text speaks of "radial degree-zero and degree-one potentials" and "jet order r". The new text defines "a radial jet of index r" as having polynomial degree r+1. So a "degree-zero potential" has polynomial degree one, which is easy to misread. Use one name: e.g. "radial jet of order r (weight r+2, polynomial degree r+1)", and call A_0 and A_1 jets of order 0 and 1. |
| M3 | minor, wording | #227 | `trace-firesky-gallery.tex`, new definition of U_{i,4} | "the grade-four chart … on its eventual isomorphism tail". In the source, U_{i,4} is an invertible chart at every index: `YM.Climb.Scaling.U i d` is a `Spin.change`, and its inverse is applied at every i in `ZoomValue` and in `Scribe.gallery`. Only coherence and unit preservation (`units`) are eventual. Suggest "the grade-four chart (invertible at every i)". The displayed identity is asserted eventually anyway, so nothing mathematical changes. |
| O1 | optional, reference | #234 | radial reconstruction | The identity A_a = (r+2)^{-1} Σ_i z_i F_{ia} is the homogeneous case of the Fock–Schwinger (coordinate) gauge reconstruction A_μ(x) = ∫_0^1 t x^ν F_{νμ}(tx) dt. Naming the gauge would help physics readers. The proof given is complete, so no citation is needed. I did not verify a specific published locator, so none is proposed. |
| O2 | optional, ledger | #234 | input C14-free-derivative-compatibility | The source supplies this input as the field `pales : T.W.Derivatives (Bel L)` of `YM.Climb.Lighthouse.Goes` (`Lean/YM/Climb/Beams.lean:34–36`), reached through `FreeInput.lit` in `YM.Further.PhysicalPeriodLimitF933.bills_free`. Reality and covariance come from the `hers` field. Recording this in the ledger entry would show where the input is discharged. |
| O3 | optional, index convention | #227/#234 | `physical-ward-propagation.tex` vs `trace-free-rank.tex` | Coordinate indices run over 1–4 in the Ward chapter (Σ_{b=1}^4) and over 0–3 in the free-rank chapter (Σ_{a=0}^3, e_0). This predates both PRs and is internally consistent in each chapter. A global integration pass (G05/F01) could unify the convention. |

None of M1–M3 changes a mathematical statement.
