# Independent review of the C14 source-leakage response (PR #216)

- Unit: YM-000026, package C14 (#55); source-leakage follow-up #193 (audit #159, report PR #164).
- Roles: mathematical validity (`mathematics.md`) and textual Lean correspondence (`lean.md`), kept in separate reports.
- Reviewer account: ADB991. Session `ADB991-claude-20261113-41d8`.
- Agent assistance: Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not reviewed this report before submission. ADB991 did not author any C14 chapter, C14 author record, or the PR #216 response.
- Reviewed head: PR #216 `44df7abe1cd6e903230d58fc7f1a73396d17ba8f`, base `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/193#issuecomment-6862075767
- Content fingerprints: the 13 SHA-256 values in `source-leakage-hashes-20261113.sha256` at the reviewed head, all re-verified with `sha256sum -c` (see `validation.md`). The author validation file has SHA-256 `16ecf7ca1bebb4c5066921a2a7f2ebb1d519ace074f0f4450da9e1162b4e117f`.

## Outcome

**No blocking defect found in this scope; no change required.** Two minor wording points (M1, M2) and two optional clarifications (O1, O2) are suggested. All 42 rows are answered. Every row-level change preserves the mathematical content of the base passage. Each B caveat has a home in a record: the new response file, the package ledger, or an existing evidence file. Each J row is resolved in one of two ways. Either it points to an argument already in the manuscript, which I checked, or it names an input whose statement matches the hypotheses of the lemma that consumes it. No new argument is invented, and no hypothesis is dropped.

The one material mathematical change, the row-256 repair of PR #177 request 1, is correct. The optical formula and the kernel identity are now asserted on one eventual tail only. That matches the pinned definitions: `YM.Trace.Shelves.Optics` is `0` off coherence, and `Optics_pay`/`aprilA` hold `∀ᶠ i in atTop`. The rank lemma uses property 3 only eventually, so nothing downstream is weakened.

This is a bounded review of the PR #216 delta. It is not a renewed review of C14 as a whole. It does not resolve PR #177 requests 2–4 (mgubi's live #55 claim), the two free-rank findings, or the analytic inputs now named in the ledger. Human acceptance is not recorded here.

## Findings summary

| ID | Kind | Location | Summary |
| --- | --- | --- | --- |
| M1 | minor, wording | `trace-calibration-producer.tex`, corrected-lifts gluing paragraph (row 272) | "The same bound is assumed in eq:ex-lattice-firesky-lift-bound". That equation assumes the bound on an F-late set, which is stronger than the "set belonging to the ultrafilter" used here (U is finer than the fused filter of F). Suggest "a bound of the form … (there on an F-late set, hence on a set of the ultrafilter)". Also add a comma: "independent of volume and period, on that set". |
| M2 | minor, wording | `actual-stress-annulus.tex` (rows 285–286) | "The proposed construction has two stages" / "The proposed construction uses the following numerical gates". The construction is the one carried out conditionally in Proposition `prop:ex-lattice-actual-shell-node`, and "proposed" reads as though it were not carried out. Suggest "The construction of Proposition~\ref{prop:ex-lattice-actual-shell-node} has two stages". |
| O1 | optional, pre-existing quantifier | `thm:ex-lattice-selected-trace-gallery` | The theorem concludes "for every positive sequence s_n→0", so its hypothesis "the one-stage selection property eq:ex-lattice-trace-one-stage" must hold for every positive null sequence. The ledger entry I-C14-one-stage-selection says exactly this; the theorem statement could say it too. |
| O2 | optional, grammar | `trace-calibration-producer.tex` opening (row 252) | "The interacting-center dimension equivalence and the scale-dependent comparison are conditional on the inputs stated below" would read better as "… are supplied by the inputs stated below". |

Neither M1 nor M2 changes any mathematical statement.
