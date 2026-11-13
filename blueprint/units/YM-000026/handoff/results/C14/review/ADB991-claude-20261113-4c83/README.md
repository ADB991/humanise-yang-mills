# Renewed independent review of the PR #256 response to review #260 (C14)

- Unit: YM-000026, package C14 (#55). Target: PR #256 (mgubi). The delta under review is `f3a0a4b..f9ddbdb`, the author response by session `mgubi-astra-c14-curve-r1-20261113` to review #260.
- Roles: mathematical validity (`mathematics.md`) and textual Lean correspondence (`lean.md`), in separate reports. Commands are in `validation.md`.
- Reviewer account: ADB991. Session `ADB991-claude-20261113-4c83`.
- Agent assistance: Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not reviewed this report before submission. ADB991 did not write any C14 chapter, PR #177 or PR #256. ADB991 wrote the earlier review #260 of this PR (session `...-3696`). This is a renewed review by the same reviewer account; it does not refresh another reviewer's approval.
- Reviewed head: PR #256 `f9ddbdbb6eead22d18611fe7460e6ea35a56658e`. Previous reviewed head `f3a0a4b485b434c2abdb5fe1bd87e132bd4d1553`. Base `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/55#issuecomment-6864692665

## Content fingerprints (SHA-256 at the reviewed head)

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/trace-calibration-producer.tex` | `7f50593215b5ef53627df8e2e069df2b27437fae4efe8de23258fb5f672802f0` |
| `manuscript/existence/actual-stress-normalization.tex` (consumer; unchanged from base) | `80e8969b4b39bb242ce4bf14ac5807b283421c2ba56332e90403c78c47a04bfd` |
| `.../C14/author/mgubi-astra-c14-curve-r1-20261113/response.md` | `7f500b537cedf40cc1764f411013f794e0f41032dfdf477b7abf7d60ad1e08b0` |
| `.../correspondence.md` | `3dd463ff8ca2e6342d09e919017636b92c8f4c57239b520c54d0614e85eb704f` |
| `.../validation.md` | `574024e6b95bd821c898d988d61a4d7258ec47d01bb76f5a86c1458ebad0703d` |
| `.../fingerprints.json` | `a64404fffddd6bb7afd4265d319e7c4e055e7c66675b9d0f96a6742b93dbcdb6` |
| `.../verify.py` | `2d87d9c4e0bec6641be39b3598626a8593a46b5d73e55fefdec2e197ba88098e` |
| `.../C14/author/mgubi-astra-c14-chart-curve-20261113/fingerprints.json` (updated in this delta) | `f07102dce7264cedddceb6697719be761f2df037afa25c4d5e362783d8b29ff3` |

The chapter hash agrees with the `WORKTREE` entry of the author's `fingerprints.json`.

## Outcome

**All four points of review #260 are resolved: R1 (required), R2 (recommended), O1 and N1. No required change remains in the delta.** There are two optional notes (P1, P2) and one integration remark (P3). No mathematical error was found in the changed hunks.

| #260 point | Status | Where |
| --- | --- | --- |
| R1, theorem curve vs joint-input curve; hypotheses built from the conclusion | **Resolved** | The theorem (l. 605–636) now fixes the sequence and the chart receipts only, asserts that admissible selections exist, and proves its conclusions for *every* admissible selection and choice of limits (proof l. 637–664). The correction, beam, trace, optical, stable-inversion and shell-flux receipts have left the theorem. They are now the joint input (l. 335–377), which comes after `C`, `U`, `U_i` and `Y_i` are defined (l. 321–333). Nothing in the theorem refers to objects built from its conclusion. |
| R2, every-sequence vs one curve | **Resolved** | The joint input is now existential: there exist a null sequence, admissible selections and limits carrying all receipts (l. 341–343). The fixed physical and reference data and the extraction are fixed first. l. 367–373 keep any stronger all-sequence requirement separate. |
| O1, uniform test estimate for `U` | **Resolved** | l. 674–678. For a fixed tuple, `U` and `C` agree at all grades of the tuple on one tail, which does not depend on the test. So `A^U_{k,v}(t)=A^C_{k,v}(t)` there for every `t`, and the supremum estimate transfers. Correct. |
| N1, attribution of the every-sequence claim | **Resolved** | The subsection is retitled (l. 407). The prescribed-sequence one-stage property is an explicit input (l. 409–423). l. 446–453 separate it from the arbitrarily-small-radius route. The author's correspondence names the separate prescribed-sequence source route `YM.MergeProof.East.boatsSky`/`wakesSky`. I checked that route textually (`lean.md`, L2). |
| O2, PR #216 optical input | Addressed as far as possible before integration | The joint input names "the eventual optical kernel identity used in the rank argument" on the same curve (l. 345–346). The four textual conflicts with PR #216 are recorded by the author; see P3. |

This is a bounded review of the delta `f3a0a4b..f9ddbdb`. It is not a review of C14 as a whole, nor of PR #216 or PR #252, nor of the analytic production of the joint input, which stays open as the chapter says. Human acceptance is not recorded here.

## New findings

| ID | Kind | Location | Summary |
| --- | --- | --- | --- |
| P1 | optional | `par:ex-trace-joint-curve` (l. 341–343) | The joint input asks for a null sequence and selections "satisfying the hypotheses of Theorem…", which include the *prescribed-sequence* one-stage property (eq:ex-lattice-trace-one-stage). The theorem's conclusions about `C` do not use that property. It is used only to show that a selection exists, and the joint input already assumes one. Requiring it is harmless, because the source's one-curve route satisfies it: take `s_n` to be that route's own radii (`lean.md`, L1). Still, a reader matching the input to `Stations.ranging` must supply that restriction step. Two fixes would do. (a) Require only an admissible strictly decreasing selection with the chart receipts. (b) Add one sentence: a chosen-radii curve satisfies the one-stage property for its own radii, because the cutoff-`k` receipts imply the cutoff-`d` ones for `d≤k`. |
| P2 | optional, consumer outside the delta | `actual-stress-normalization.tex` l. 44–50 | The consumer's maps are the completed isomorphisms `U_{k,d}`. It cites Theorem `thm:ex-lattice-selected-trace-gallery` for eq:stress-uniform-tests, but the theorem states the estimate for `C`. The transfer to `U` is the new sentence in the completion paragraph (l. 674–678), which has no label. A label on the completion paragraph, cited by the consumer, would close the reference chain. The consumer is unchanged by this PR, so this is not a finding against it. |
| P3 | integration remark | PR #216 vs PR #256 | The author reports four textual conflict regions with PR #216 (`validation.md` of the author records): the prescribed-scale opening, the post-selection qualification, the gallery premises and the final input summary. Whoever merges the second of these PRs should keep three things from this one: the universal-over-admissible-choices theorem, the existential one-curve joint input (including the optical kernel identity), and the explicit prescribed-sequence hypothesis. From PR #216 they should keep the eventual optical comparison and its source caveats. The merged chapter then needs a renewed review of those four regions. I did not perform or review a merge. |
