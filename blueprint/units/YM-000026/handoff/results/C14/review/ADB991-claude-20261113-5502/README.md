# Renewed independent review of the C14 author follow-up on PR #216

- Unit: YM-000026, package C14 (#55); source-leakage follow-up #193 (audit #159).
- Roles: mathematical validity and textual Lean correspondence, both in this file (the delta is two short passages and one quantifier). Validation is in `validation.md`.
- Reviewer account: ADB991. Session `ADB991-claude-20261113-5502`.
- Agent assistance: Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not reviewed this report before submission. ADB991 authored no C14 chapter, no C14 author record and neither PR #216 commit. The same account wrote the earlier review #230 (session `ADB991-claude-20261113-41d8`), whose points M1/M2/O1/O2 this delta answers.
- Reviewed delta: PR #216 `44df7abe1cd6e903230d58fc7f1a73396d17ba8f..4c141ec86b5cb20e7d837a343b26bbe91e57394a` (one commit, "Clarify C14 filter and sequence hypotheses after independent review"). Base of PR #216: `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; Lean tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`, unchanged by the delta.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/193#issuecomment-6863375448
- Content fingerprints at the reviewed head (re-verified, see `validation.md`):
  - `manuscript/existence/trace-calibration-producer.tex` `7dcff79b572cc5c16020e96f2e1cfdc7ea67ae814cb968ffce45f14d3409ab2a`
  - `manuscript/existence/actual-stress-annulus.tex` `a53ee0d49fdb9f3839f3fe9fb96c12f2c795fa3112e0b09cc0fb5b5f4fa14645`
  - all 13 entries of `source-leakage-hashes-20261113.sha256` and all 7 `after_sha256` entries of the author's `fingerprints.json` match.

## Outcome

**All four points are addressed. No new defect found in the delta; no change required.** One optional wording remark (N1) is recorded below.

| Point | Change at `4c141ec` | Verdict |
| --- | --- | --- |
| M1 | `trace-calibration-producer.tex` (finite-chart lift paragraph): the bound is now "on that set" with the comma restored, and the text says the firesky display assumes the bound on an $F$-late set, a stronger hypothesis that supplies the ultrafilter-set bound when the ultrafilter refines the fused filter of $F$. | Resolved. An $F$-late set belongs to the fused filter of $F$, hence to any finer ultrafilter. The implication goes the right way and the converse is not claimed. The firesky section (`trace-firesky-gallery.tex`, the paragraph introducing `eq:ex-lattice-firesky-lift-bound`) fixes $\mathcal U$ finer than the fused filter of $F$, so the condition holds in the setting where the display is used. "Its availability for the chosen charts remains an input" is kept. |
| M2 | `actual-stress-annulus.tex`: "Under its stated inputs, the construction in Proposition~\ref{prop:ex-lattice-actual-shell-node} has two stages"; next sentence "That construction uses the following numerical gates". | Resolved. The label is defined once, in `actual-stress-shell-nodes.tex`, which `existence.tex` inputs immediately before `actual-stress-annulus.tex`, so this is a backward reference. That proposition is the construction described: two-channel coefficient construction, $t=1+1/(64(d+12))$, quota and lightness estimates. "Under its stated inputs" keeps the conditional status. The pointwise-in-anchor late events and the caveat against one event for the growing collar are unchanged. |
| O1 | `thm:ex-lattice-selected-trace-gallery`: the one-stage selection property `eq:ex-lattice-trace-one-stage` is now assumed "for every positive null sequence $(s_n)$". | Resolved. The hypothesis now matches the conclusion "for every positive sequence $s_n\to0$" and the ledger entry I-C14-one-stage-selection. Source check: `YM.MergeProof.East.boatsSky` and `wakesSky` (`Lean/YM/TraceExtension/Prom/Zoom/Boats.lean`, lines 49–50 and 75–76) take an arbitrary `s : ℕ → ℝ` with `Tendsto s atTop (𝓝 0)` and `∀ i, 0 < s i`. So the universally quantified premise is the faithful reading. |
| O2 | Opening paragraph: "are supplied by the inputs stated below; the elementary rank conclusion is proved conditional on them." | Resolved. It does not claim the inputs are proved. |

**N1 (optional, wording only).** In the M1 sentence, "when the ultrafilter refines the fused filter of the extraction order $F$" reads as an extra condition. In this chapter the fixed ultrafilter is the one chosen in the firesky extraction paragraph, which already refines that fused filter. Writing "since the fixed ultrafilter refines …, as chosen in the extraction paragraph of Section~…" would close the loop. It changes no statement.

**N2 (out of scope, pre-existing, for integration).** On rendered page 839 the cross-chapter reference to `eq:ex-lattice-firesky-lift-bound` prints as "(1)". That display carries a manual `\tag{1}` (`trace-firesky-gallery.tex`, line 118). The base text had the same reference, so the delta did not introduce this. The same manual tag is used in eight files under `manuscript/existence/`: `physical-ward-propagation.tex:956`, `trace-eve-producer.tex:48`, `trace-medal-prices.tex:33`, `phase-quantitative-producer.tex:446`, `trace-row-jet-estimates.tex:24`, `trace-free-rank.tex:102`, `trace-firesky-gallery.tex:118` and `fullmesh-fixedbounds-producer.tex:37`. Any `\eqref` to one of these from another chapter is therefore ambiguous in the assembled monograph. Removing the manual tags, so that the global numbering applies, is a whole-monograph editorial fix for the integration task. It is not a C14 author request.

## Scope limits

This review covers only the two-passage delta and its records. It does not renew review of the rest of PR #216 beyond #230, of PR #227 (the annulus chamber-threshold patch) or PR #234 (free rank), which are under the separate #55 claim of session `ADB991-claude-20261113-b066`. It does not supply any named analytic input. The author's `git apply --check` compatibility note for PR #227 was not re-run. Human acceptance is not recorded here.
