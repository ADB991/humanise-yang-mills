# Renewed check of PR #301: answer to review #288 M1/M2 (C14, `lem:actual-derivative-shift-payment`)

- Unit: YM-000026, package C14 (#55), task #276 (closed by the coordinator at 22:22 UTC; this record supplies the "quick confirmation by another account" requested in the author handoff https://github.com/hairer/humanise-yang-mills/issues/276#issuecomment-6866286916).
- Target: PR #301 (hairer, session `hairer-claude-20261113-c14shift`), head `35ed1c68aac4355ff6a3f99baa45a7c5715006d8`, merged as `90a5c58`. It edits the proof of `lem:actual-derivative-shift-payment` in `manuscript/existence/actual-insertion-derivative-relay.tex` (+11 −3) and adds `results/C14/author/hairer-claude-20261113-c14shift/response.md`.
- Roles: mathematical validity and textual Lean correspondence of the delta only; both are in this file. Commands are in `validation.md`.
- Reviewer account: ADB991, session `ADB991-claude-20261113-2fc6`. ADB991 wrote review #288 (session `e8e7`), which raised M1/M2. ADB991 did not author the lemma (#282, mgubi) or #301.
- Agent assistance: Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not reviewed this report before submission.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/276#issuecomment-6866831498
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`Lean/` tree `328ad19b…` at both `35ed1c6` and the report base `7a1a748`).

## Content fingerprints (SHA-256)

Identical at the PR head `35ed1c6` and at the report base `7a1a748` (`codex/existence-monograph`).

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/actual-insertion-derivative-relay.tex` (changed) | `390a98533c27acf2f2de39783c319fa6e6851b7d0b4c40f6b2acbd17a011310f` |
| `.../C14/author/hairer-claude-20261113-c14shift/response.md` (new) | `1d14f3274db3d0bfb25c5116cb728d107c9e53896841729e81a1f3739d75623d` |
| `manuscript/existence/common-scale-selection.tex` (cited, unchanged since #288) | `54ce4f6d3d79a5b392e7472c6451e0062c7956da4621c742acbd0fb8ca560faf` |
| `manuscript/existence/marked-portfolio-calibration.tex` (cited) | `ec4d0bcdb188b512dbb546401fa657b08ddf65490266cebc60559c5ce5f3bf96` |
| `manuscript/existence/actual-equation-kernel-relay.tex` (subpower definition) | `bf75181d78490ac46b571007134b8c2fe3317d3fb0f53f604f77827ffb1c0785` |

## Outcome

**M1 and M2 of #288 are resolved. No required change; no mathematical error found.** Two optional wording points (O1, O2) below. N1 of #288 (optional notation) was not taken, as the author note says; it stays optional.

### M1 (profile cost stated as a definition): resolved

Relay l. 119–126 now *defines* `C_j=(2^{w(j)})^{q(j)}` and takes it as "the fixed profile cost at stage `j`" of the entrance-delay construction, instead of claiming that the calibration text "says precisely" this. Check:

- The calibration section (`marked-portfolio-calibration.tex` l. 243–246) still only requires that "x exceed the fixed profile cost" at a fixed stage–profile pair and does not define that cost. Its finite-threshold argument (l. 245–252: each condition holds on a tail of `x`, finite conjunction per stage, prefix maxima, maximum with the old delay) uses only that the cost is a fixed finite number attached to the profile. So specifying the cost as `C_j` is legitimate and costs nothing: the construction with this specification produces the delay `E_i` that the lemma uses, and the common history retains it (`common-scale-selection.tex` l. 238–255, item 1, "including its profile-cost … clauses"; `common-observable-purchases.tex` l. 266–284).
- "Exceed" there and `C_j ≤ x` in the lemma are compatible (strict implies non-strict).
- Source: `YM.PhysicalNext.Repeat.Legato.step_cost` (`Lean/YM/MergeProof/Apres.lean` l. 35) is `((2:ℝ)^a.power)^a.order`, and the first conjunct of `Legato.dusk` (l. 36) and of the per-pair predicate `Q` in `Legato.shower` (l. 48) is `step_cost p ≤ x`. The new wording matches the source, as the response note says.

### M2 (subpower property of `β̂_N` derived): resolved

Relay l. 153–157 now derives it: `β̂_N=β_*+s_G s_N` is affine in `s_N` and `s_N→∞`, hence `β̂_N ≤ e^{η s_N}` for all large `N`, independently of period and order. Check:

- `common-scale-selection.tex` l. 44–61: `s_0=0`, `s_{m+1}=s_m+log L_{J(m+1)}`, `a_m=e^{-s_m}`, and `β̂_m=β_*+s_G s_m` with `s_G>0`, `β_*>1`. This is the same `s_N=log(1/a_N)` as in the relay. By `eq:common-scale-brackets`, `s_m ≥ m log 3`, so `s_N→∞`.
- For fixed `η>0`: `(β_*+s_G s)e^{-ηs}→0` as `s→∞`, so there is `S_η` with `β̂_N ≤ e^{η s_N}` whenever `s_N ≥ S_η`, in particular for all `N ≥ S_η/log 3`. `β̂_N>1>0`, so the norm is `β̂_N` itself. The threshold depends only on `η` (and `β_*`, `s_G`), not on the period, which `β̂` does not involve.
- Definition (`actual-equation-kernel-relay.tex` l. 126–128): subpower means that for every `η>0` the norm is eventually at most `e^{η s_N}` "on the ordered filter under consideration". The ordered filters in use are an extraction order `(u,p)` with `u` strictly increasing (`assembly.tex` l. 66–68), or the two-stage filter "large period, then mesh cutoff `N ≥ N_0(p)`" (`finite-rank-kernel-transport.tex` l. 59–62). In both, a bound valid for all `N ≥ N_1` with `N_1` independent of `p` holds eventually (`u(N) ≥ N`). So "independently of the period and of the order" is correct, and refinements inherit it.
- Source: `YM.RG.Calendar.hatBeta` (`Lean/YM/RG/History.lean` l. 79), `def hatBeta (m) := S.bar + G.slopeConstant * S.schedule.scale m`, is the same affine formula; `YM.Gauge.slopeConstant_pos` (`Lean/YM/Gauge/Casimir.lean` l. 174) needs `G.Simple`, which is the standing simplicity hypothesis of the section (relay l. 6) and the manuscript's `s_G>0`. The source proves slow growth through `YM.Push.RelayDifference.beta_slow` (`Rates.lean` l. 169) via `Work.I04.hat_receipt`; the manuscript's elementary route is equivalent, as noted in L1 of #288.

### Optional

| ID | Location | Note |
| --- | --- | --- |
| O1 | relay l. 155 | `s_N→∞` could cite `eq:common-scale-brackets` (`s_N ≥ N log 3`) directly; that bound also makes the order-independence immediate (`s_{u(N)} ≥ N log 3`). |
| O2 | relay l. 122–124 and l. 131–133 | The new sentence "That construction applies to it, because `C_j` is a fixed finite number determined by the profile" is repeated almost verbatim in the next paragraph ("for a fixed adjacent pair `(i,j)`, `C_j` is a fixed finite number, so it is exceeded on a tail of `x`"). One of the two could go. |

## Scope and limits

This record covers the delta `35ed1c6~1..35ed1c6` only. The rest of the lemma was reviewed in #288; that review, and its hypotheses (funded history, simple group, service, reserves, keepers, opened-scale bounds), are unchanged. Textual Lean correspondence only: no elaboration, build or axiom audit. Human acceptance is not recorded here.
