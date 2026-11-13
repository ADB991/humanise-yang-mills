# Mathematical review: changes requested

Review session: `mgubi-astra-c15-leakage-review-20261113` (independent delegated Astra review on behalf of mgubi). Target: PR #207, exact commit `a4a73dc9e0efcb16db2519acfb33ba7df0d0c032`; parent `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Claim: https://github.com/hairer/humanise-yang-mills/issues/194#issuecomment-6861077618 (expires 2026-11-13 22:00 UTC).

Scope: the 67 responses in issue #194 and U1, changed hunks of 18 chapters and three author records, with immediate interfaces. This is not a full C15 review, renewed approval of PRs #107/#112, or human acceptance. Author files were read only. Fingerprints are in `reviewed-files.sha256` and bind this review to the frozen target, not a later checkout.

## R1 — row 380: distinguish the proved implication from its open inputs

In `trace-scribe-producer.tex`, the new paragraph following the field-limit equation says that the coefficient limit c_i^1 → −κ/4 is an outstanding input “not proved in this monograph.” The same chapter, immediately after `eq:ex-lattice-scribe-sensor-limits` (lines 215–233 at the frozen revision), proves precisely this limit for the same correction coefficients. This is not a proof of the incoming analytic receipts, but it is a proof of their conditional consequence.

Indeed, write α_i=t_i μ_i(K_i Ω_i) and β_i=t_i(μ_i(K_i Δ_i)+4). The stated sensor limits give α_i,β_i→0 and μ_i(X_i)→−κ. Exact cancellation gives

    0 = μ_i(X_i) − 4c_i^1 + (c_i^0/t_i)α_i + (c_i^1/t_i)β_i.

The coefficient bound and ρ_i≤t_i make both coefficient ratios bounded. The last two products therefore vanish, yielding c_i^1→−κ/4. No change of coefficients or schedule is identified between that argument and the flux calculation.

Requested correction: cite this conditional coefficient-extraction proof; retain the incoming scale bounds as open inputs. Remove the coefficient limit from the *unproved* components of `I-C15-scribe-scale-bounds` in part-B/ledger.md and source-leakage-response.md, including its reviewer question, or explain an actual mismatch of data if one is intended. Do not claim that this resolves the construction of the sensor or scale data.

The other new row-380 steps are sound under their stated inputs. The finite-dimensional trace is continuous; the true profile has trace 4 O. The exponent-one principal/false washout limits are the immediately cited branch-moment result, not ordinary field convergence alone. With q_i≤2z_i and |c_i^0|≤Cρ_i≤Cz_i, the first two trace contributions vanish, and the true contribution tends to −κ O. The factor four and sign agree with the profile normalization.

## R2 — row 328: align the closing claim with the new outstanding input

`trace-eve-producer.tex` now explicitly leaves the identification of the rate −1/2 function f and the price 2|f| with the preceding envelope B_* outstanding. Its concluding sentence nevertheless says that the local insertion estimate “is supplied by the two cited comparison sections under their explicit hypotheses.” These are incompatible descriptions of the proof status in the same revised paragraph.

Requested correction: make that closing sentence conditional on `I-C15-eve-insertion-rate`, or provide the exact uniform estimate and normalization argument that closes the input and update both records consistently. Merely knowing that B_* has rate −1/2 does not by itself document the identification of the full uniform derivative receipt. The issue is proof-status consistency, not a demonstration that the desired identification is false. The finite-test selection and the preservation of rate under multiplication by 2 and absolute value remain conditional deductions.

## Remaining checked interfaces

All 67 row responses and U1 were checked against the changed hunks; `coverage.tsv` records the coverage. For the seven newly named inputs, the crown witness, selected-frame normalization, paid bill label/root receipt, eventual probe scales, and finite-volume response-price inequalities remain explicit hypotheses. Their construction is not certified here. The Eve and scribe entries require R2 and R1 respectively. Existing P1–P5, the planted expansion, rate tickets, E-clock and calibration are not discharged by relabeling them.

Row 385 preserves that the manuscript only requires comparison data after a null sequence is selected; the stronger sequence-uniform source order remains in the blueprint. Row 393 retains decay only at postselected levels, not arbitrary original levels. Row 409 correctly derives t_i(1)→∞ from p_i→∞ and the displayed exponential formula, hence eventual t_i(1)≥4. Row 413 uses only domination by the coefficient size, as the revised wording says. The guard ε≤1/4 and the other transition assumptions remain present (312,329). U1 leaves the small/large-support charts as inputs.

The undefined core-to-strip map (296) is still a real manuscript definition gap and is honestly recorded; this review does not certify that notation as complete. The q_i wording (373) can be made clearer as “arch scale (limiting finite-volume coupling)”; no equality with the reference coupling is inferred. These retained issues do not supply an additional newly introduced mathematical defect in the bounded changes.

Verdict: request R1 and R2 before accepting this response. Apart from those proof-status inconsistencies, no further defect was found in the inspected changed implications. This does not certify all C15 proofs or any open analytic input.
