# Bounded mathematical review of C06 rows 63–64

- Task: [#186](https://github.com/hairer/humanise-yang-mills/issues/186); target [PR #205](https://github.com/hairer/humanise-yang-mills/pull/205).
- Exact reviewed revision: `6a5d308377bd799b9ac7bab0d4e04264e2920dbc`; parent `2017d6f3ee648beb054322e9b994eb3c757cbcf6`.
- Session: `mgubi-astra-c06-leakage-review-20261113`, [claim](https://github.com/hairer/humanise-yang-mills/issues/186#issuecomment-6860958266), expiry 2026-11-13 21:00 UTC.
- Independent OpenAI Codex Astra subagent under @mgubi, distinct from target author @TrishenGunaratnam. Human acceptance is **unset**.
- Scope: the changed sentences of `gaussian-warnings.tex`, new `source-audit-response-186.md`, and their immediate local-error, plateau and radius interfaces. This is not renewed review of all C06 or PR #87. Frozen full-file digests are in `reviewed-files.sha256`.

## Verdict

No required mathematical change found in rows 63–64. The rewritten argument remains conditional on the local plateau, mean and physical covariance inputs; the edits do not establish their production for the selected family.

## Row 63: local estimates retain their event and allowance

The new wording expressly assumes the fine and predictor estimates on the same radius-B small-coordinate event used immediately before it, outside the radius-R_p seed neighborhood. It retains the local error allowance δτ, the separate guide bounds Aτ/L² and Aτ, and the three contributions each bounded by δτ/3. Thus it neither removes the local event restriction nor replaces a conditional estimate with an unconditional construction claim.

The adjacent numerical deductions are unchanged: with δ = sqrt(c_f)/32 and A/L² ≤ δ, the fine coefficient is at most 4δ/sqrt(c_f) = 1/8, strictly below 1/4. Choosing W strictly larger than the predictor coefficient gives the stated predictor margin. Smallness of the fluctuation coefficient is obtained by the choice of ξ; eventual bounds for the mean and nonlinear errors remain separately required. The likelihood-one assertions remain part of the explicitly named plateau conclusion, not a consequence of the triangle inequality alone.

The C06 ledger still calls X2 an unmatched physical-covariance input and X3 a located but not fully matched plateau interface. The new author record expressly preserves that status. The immediate `warning-safety.tex` interface states the deterministic estimates on funded data, with the same allowance/field-scale distinction and three-error decomposition; this review does not independently validate all its suppliers or identify their budgets with the selected family.

## Row 64: the abstract margin suffices

Removing the parenthetical concrete radii changes no assumption in `lem:warning-vanishes`. For a warning site i outside the radius-R_c neighborhood and a site j with distance at most B, the retained inequality R_c ≥ R_p+B gives distance(j,seeds) > R_p. The triangle inequality gives the inclusion of the radius-B ball about j in the radius-2B ball about i. Hence the same plateau hypothesis applies at each nearby j, including the neighboring parent needed for the contraction argument. The lemma is already in the large-x regime with B ≥ 1.

The source choices 30B and 300B satisfy the margin and are preserved in the author record. That record correctly describes the compulsory mask/likelihood/contraction test as a district intersection, rather than equating it with a test at the assigned site alone. A district may intersect the compulsory region even when its assigned site is outside; in that case the warning is zero by definition. For a noncompulsory warning the assigned-site distance conclusion is sufficient for the proof.

The bond cutoff is separately controlled by the local pointwise bond estimate and its outer plateau. The author record preserves its distinct support test at 304B and does not claim that the 300B district test or the contraction plateau theorem defines this branch. No stronger covariance or probability assertion is introduced by moving these source constants to the blueprint.

## Limits and acceptance

No bounded blocking finding was identified. Existing nearest-point/literature findings, the full C06 package, covariance matching, cross-package budgets and incoming producer proofs are outside this review. No new literature result is invoked by the two edits; shared literature notes were searched without finding a needed new reference for this elementary radius and allowance check.

This is an agent recommendation for local acceptance conditional on the retained inputs, not human acceptance or unit-level `reviewed` status. No author files or old review records were changed.
