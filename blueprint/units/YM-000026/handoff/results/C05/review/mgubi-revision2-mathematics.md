# Additional mathematical review of C05 revision 2

- Unit/package: YM-000026 / C05; additional revision-2 verification.
- Author PR: [#72](https://github.com/hairer/humanise-yang-mills/pull/72), final head `889deac713c6004e383fe0e5f4ec6f6510aacd46` (merged 2026-11-12 20:34:43 UTC).
- Compared with: `8b15d44410a2784d25e765b5b7b9ca2b05e5582c`.
- Source: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; Lean `leanprover/lean4:v4.32.0`.
- Reviewer: independent OpenAI Codex subagent under authorized account `mgubi`, session `mgubi-codex-review72-20261112`; not a C05 author. Independence is agent-based. No human acceptance is asserted.
- Claim: [issue #46](https://github.com/hairer/humanise-yang-mills/issues/46#issuecomment-6835587411), checked again before submission.
- Whole-unit snapshot fingerprint: `59ad9fe6249c394cb2a6c005bf188de1a521c7ae5f8fb85a431f09c5a1d981a0`; this identifies the snapshot, not a whole-unit review. File hashes and coverage are in [validation](mgubi-revision2-validation.md).

- Role: mathematical validity of revised arguments and critical incoming interfaces.
- Outcome: three focused corrections remain; major revision-2 repairs are locally sound conditional on the expressly retained inputs. No new serious inequality or rate error found in this pass. This corroborates [#85](https://github.com/hairer/humanise-yang-mills/pull/85), not an additional independent discovery of its findings.

## Required corrections

### M1 — Make the opened-scale substitution literal (medium priority)

At `manuscript/existence/ope-cutoff.tex:232`, the new dictionary correctly sends reference-match's centered/opening/matching depths `(J,m,k)` to `(k,K(k),m)`. But its gain and allowance rows at lines 238–239 still give `G(m,k)` and `vartheta_q(k)`. These must be `G(m,K(k))` and `vartheta_q(K(k))`. Likewise the normalization in `eq:ope-match-pay-two` (lines 196–198), when used through this dictionary, is `a_{K(k)}^{-q}`. The transported allowance starts at `K(k)` too.

The general replacement instruction at lines 212–214 makes the intended argument recoverable, but the later claim at lines 251–253 that affordability is *literally* identical is false for the printed table. Equal logarithmic rates do not identify depths, as the text itself observes. State the payment formulas at the opened depth explicitly, or distinguish abstract opening-variable formulas from their actual substitution throughout. Keep the root test and the first argument of the cell price at centered `k`. This is a finite-scale interface correction; the rate computation remains unchanged.

Independent source check: `YM.OPE.funding`, `Lean/YM/OPE/Prices/Circuit.lean:64`, defines the opened level `P`, gives it the same height rate, and calls `terminalAfford` with `hP`; the price remains `2 * stakes C (k i) (P i) / z i`. Thus source correspondence and the three-depth substitution agree on the correction.

### M2 — State the opening condition, separately from room (medium priority)

`manuscript/existence/reference-match.tex:13` describes `m` as an opened depth for `J` by reference to `ex-centered-construction`. That section uses opened depths but does not display their defining condition. State, with `B_m` explicitly the cover/separation scale,

`J <= m` and `B_m^2 <= a_J / a_m`.

This is `YM.Stock.Tabs.opens` at parameter `s = 1` (`Lean/YM/Overlay/Prior.lean:23`). The new room inequality at reference-match lines 83–87 concerns `J`, the matching depth `k`, and the propagated support radius; it does not replace this opening condition at `m`. Add the predicate to the local hypotheses and dependency ledger so the finite-cutoff matching claim is usable without reverse-engineering the schedule. No counterexample to the conditional source theorem is alleged.

### M3 — Include germ regularity in the local-trial criterion (medium priority)

`manuscript/existence/ope-filtration.tex:245`–262 now states locality, measurability, gauge invariance, eventual continuity, global size and purchased-order left-derivative bounds. The criterion still does not explicitly require the regularity of the local chart germ on every healthy configuration, or that the iterated directional derivatives are genuine derivatives at each recursive step.

Add that the chart germ `v -> a_N^e Z_N(increment(U,v))` is of class `C^{order_N}` at zero and satisfies the recursive directional derivative identities through the purchased order, on every healthy configuration, for arbitrary directions. The numerical bounds then restrict directions by the purchased weighted threshold. If the author intends the phrase “left-derivative bounds” to include these existence and regularity conditions, define that convention explicitly rather than leave it implicit.

The source separates these requirements: `YM.Push.RelayDifference.clothed` (`RawTop.lean:27`) contains both `BudgetPoint.Regular` and `supBounds`; `YM.RG.BudgetPoint.Regular.smooth` and `.hasDerivs` are at `Lean/YM/RG/Masks.lean:158`–161. Plain continuity and numerical derivative bounds are not the full source interface. The local comparison remains an outstanding substantive input; the report does not claim its producer has been proved.

## Verified repairs and surviving dependencies

- The new mixed-correlation rotation, translation and reality laws in `ope-homogeneous.tex` are explicit assumptions of `thm:ope-quantitative`. In `ope-estimates.tex` the rotation/translation comparison, varying finite-dimensional labels and conjugation now use precisely these laws. The rate argument is conditional on them. Their producer `C03-to-C05-O4` remains open; adding the hypothesis resolves the local logical omission, not that upstream obligation.
- `ope-phase-prices.tex` and the matching assembly now name ordinary, unreflected conjugation and continuity in every character. Passing the scalar estimates for each fixed character and then taking their supremum is legitimate; it does not assume norm continuity of the character map. The conditional producer `ex-ordinary-reflection` is still needed.
- The grouping covariance conditions now preserve the partition and chosen representative, copied domain, positions and flags, and the original coefficient identities on all focused parts. The connected-cover definition and nonnegative support exponent make the stated grouping bound meaningful.
- The normalized forced remainder condition `R + kappa_m^{-1} F <= B`, the late reference threshold for degree `d`, and the grid derivative-slot identity/phase compatibility have been added. These are explicit assumptions, not proofs of incoming producer results.
- The single-mark weight description, terminal calibrated label `Q_{N,p}=T_{N,p}b`, whole-label rate correction, displayed cell price, threshold dependence on fixed labels/degree, and mesh factor in spectator rounding address the corresponding prior findings.

## Limits and acceptance

This is a bounded additional review of all revision-2 changed hunks, with expanded reads for the quantitative theorem and critical interfaces, not a fresh audit of every unchanged C05 proof or every producer. The C16 singleton ambiguity and canonical correspondence-file corrections are separately owned; this report makes no acceptance claim for those files. No new external literature theorem is used to justify these findings. The repository literature guidance/background index was consulted; the disputed conditions here are source-specific definitions, so no external theorem can supply the omitted interface automatically.

The responsible human must decide acceptance after the three corrections and any required renewed review. No unit status, another reviewer's record, author file or Lean source has been changed.
