# Independent review of PR #282: payment for the derivative shift (C14)

- Unit: YM-000026, package C14 (#55), task #276. Target: PR #282 (mgubi), session `mgubi-astra-c14-shift-purchase-20261113`. It adds `lem:actual-derivative-shift-payment` to `manuscript/existence/actual-insertion-derivative-relay.tex`.
- Roles: mathematical validity (`mathematics.md`) and textual Lean correspondence (`lean.md`), in separate reports. Commands are in `validation.md`.
- Reviewer account: ADB991. Session `ADB991-claude-20261113-e8e7`.
- Agent assistance: Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not reviewed this report before submission. ADB991 did not author PR #282, task #276 or the relay chapter.
- Reviewed head: PR #282 `5f664eb08a5fe2bcce10526ad80e025431b7a4b7`. Base `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/276#issuecomment-6865436232

## Content fingerprints (SHA-256 at the reviewed head)

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/actual-insertion-derivative-relay.tex` (changed) | `996393d5d5a908ded0b9e7d1c8856f648bc731e7bb3d939effa737f45435a477` |
| `manuscript/existence/marked-portfolio-calibration.tex` (cited, unchanged) | `97869cb5f5b5b402281362734be9159e8ab6d4c5f6f9e8b9d7958979042dfc9b` |
| `manuscript/existence/common-observable-purchases.tex` (cited, unchanged) | `256ff60ad0b31cfb1116686f4e98629ab268da40f39f2b6d4633899c647d541c` |
| `manuscript/existence/common-scale-selection.tex` (cited, unchanged) | `54ce4f6d3d79a5b392e7472c6451e0062c7956da4621c742acbd0fb8ca560faf` |
| `.../C14/author/mgubi-astra-c14-shift-purchase-20261113/correspondence.md` | `2118826c7d668342a28430a745b09815f149a1e375ab5dfc718e56436a398acb` |
| `.../response.md` | `cf1d9e3aeb1e3b3ee3a847c11a6f1f96a07b7be766b2dcd60e4aff4c333f9e63` |
| `.../validation.md` | `c7b1323a6c60730e2fce885bd018c987c003474f5025a967a061591c82f3fa4c` |
| `.../fingerprints.json` | `5313a70c8f327aa81ef89bd6351798a35e29b07faf736073b010b5bac2edd606` |
| `.../verify.py` | `14adbddc1b468e6b7261ed9ce48412fabe0d4723b6b8c0b08ec20fa95d35145b` |

The chapter hash agrees with the `WORKTREE` entry of the author's `fingerprints.json`.

## Outcome

**No required change. No mathematical error found.** The lemma's inequality `1 ≤ J_N = 2^{w_N q_N} ≤ β̂_N` follows, for every level `N ≥ 0` and every period, from three facts already in the manuscript: the profile-cost clause of the marked-portfolio entrance delay, its inclusion in the final entry threshold `d_j`, and the payment `d_{J(m+1)} ≤ β̂_m` at every step. The subpower consequences are correct. The source caller `chaletrail` makes the same substitution (`lean.md`).

| ID | Kind | Location (PR head) | Summary |
| --- | --- | --- | --- |
| M1 | minor, recommended | relay l. 119–123; calibration l. 244 | The proof says the profile-cost clause "says precisely" `E_i ≤ x ⇒ C_j ≤ x` with `C_j = (2^{w(j)})^{q(j)}`. The cited calibration section only says "x exceed the fixed profile cost" and never defines that cost. The formula is the source's `step_cost`. State it as the definition of the profile cost in the lemma, or define it in the calibration section in a follow-up. |
| M2 | minor, recommended | relay l. 149 | "The retained coupling price is subpower along every extraction order" has no reference. It follows in one line from `β̂_m = β_* + s_G s_m` (common-scale-selection l. 60), with the same `s_N = log(1/a_N)`, or from calibration l. 486–487. Cite one of these. |
| N1 | optional, notation | relay l. 119; calibration l. 177, 226 | `w(j)` for the profile's power clashes with the tail exponent `w_d` of the cited calibration section, which calls order and power `k_i`, `P_i`. Also `J_N` (shift factor) and `J(N)` (stage map) now share a line (l. 143–144). Consider `C_j = (2^{P_j})^{k_j}` and renaming the shift factor. |
| N2 | note, outside #282 | common-observable-purchases l. 277–279 | "at every transition from stage j to stage i ... beyond the entry delay of stage j ... credit bounds for all grades d ≤ i" puts the entrance on `j` and the profile on `i`. That reverses the reading of "from j to i" relative to the calibration caller (entrance `J(N+1)`, profile `J(N)`) and to source `dusk`. The lemma uses the correct convention. A later editorial pass could reword the shared chapter. |

This bounded review covers PR #282 only. It does not review the rest of C14, the analytic suppliers the section assumes (service, reserves, keepers, opened-scale bounds), or the identification of the actual family with the funded history. Human acceptance is not recorded here.
