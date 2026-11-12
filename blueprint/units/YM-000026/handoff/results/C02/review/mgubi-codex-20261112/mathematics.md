# C02 PR82: bounded independent mathematical review

- Unit: `YM-000026`, package C02.
- Role: mathematical validity; changed finite-menu/common-history interfaces and selected service calculation.
- Contributor account: `mgubi`; responsible human acceptance: **not recorded**.
- Agent assistance: Codex review subagent, separate from the C02 author. This is deliberately duplicated verification, requested by the contributor, not the earlier full-package review and not human acceptance.
- Reviewed author head: `93fd8657d90942fb17ba3298c755a73b0a642592` (PR82, merged).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Unit content SHA-256 from the checker: `d3b1b8c18e25833946f4e760ad55e2156ecedcf5b166939f3d4e1dafbb8b3286`.
- Exact chapter hashes: `hashes.json` beside this report; all twelve agree with the author's manifest.
- Task: [issue43](https://github.com/hairer/humanise-yang-mills/issues/43); [PR82](https://github.com/hairer/humanise-yang-mills/pull/82).
- Claim: [bounded replacement claim](https://github.com/hairer/humanise-yang-mills/issues/43#issuecomment-6835851191), session `mgubi-codex-review82-20261112`.
- Outcome: **one required clarification in the service calculation; no blocking defect found in the checked finite-menu/common-history interface**. No package-wide acceptance.

## Required correction M1: specialize the treasury cutoff

At the reviewed head, `manuscript/existence/centered-public-service.tex:22` chooses an arbitrary `0 < s <= min(1, theta)`. Lines35–38 then bound the resulting per-site bill by the selected fixed treasury `T_k`. The general small-ball denominator estimate is valid with that arbitrary cutoff, but the selected treasury comparison is not.

Set `s = h_k = beta_hat_k^(-1/2)` before using the treasury receipt, and state that `baseBudget` is evaluated at this same cutoff. Explain admissibility: the selected coupling exceeds1, so `0 < h_k < 1`, and the selected threshold is `h_k` times a monitor at least1. The generic denominator estimate may remain generic if the specialization is explicit at the next step. Make the same specialization before the treasury invocation in `centered-construction.tex:105` (the generic radius there is called `rho`).

This is necessary, not a cosmetic naming preference. At fixed scale the treasury is finite and independent of `s`, whereas the displayed term `4 d_G log(16/s)` grows without bound as positive `s` tends to0 for the nontrivial gauge group here. The quadratic base-budget term does not cancel that divergence. The final root-test estimate can be repaired by the specified choice, without changing its conclusion or introducing a new hypothesis.

Source confirmation is in the separate Lean report. This omission was first brought to this reviewer by the independent full-review handoff [PR89](https://github.com/hairer/humanise-yang-mills/pull/89); the cutoff definition and its actual use were then inspected independently. It is inherited prose retained in the materially revised service paragraph, rather than a new regression introduced by PR82. Other PR89 requests have not been independently certified by this bounded pass.

## Checked finite-menu argument

The principal reviewed manuscript labels are `thm:ex-lattice-volant-supplier` and `sec:finite-menu-history-handoff`; relevant lines at the exact head are `rg-construction.tex:169–311` and `finite-menu-history-handoff.tex:9–130`.

1. **Assembly is conditional on paid terms.** The supplier theorem explicitly assumes nonnegative summable majorants, support/shell conditions, and the ungrouped identities. Grouping by support or box preserves the majorant inequalities by the triangle inequality and nonnegative rearrangement. Quiet and singleton coefficient maps are continuous linear maps on the finite-dimensional marker algebra, so summability permits the displayed coefficient identities. This is not a proof of the upstream analytic production of the majorants, and the statement does not present it as one.
2. **Shipment conversion retains the correct origins.** The menu hypothesis is occupancy after the parent map. Fine-site occupancy follows because a fine-site fibre is contained in its parent fibre; the converse would not suffice. The birth-region step puts a chosen parent origin in the coarse support before using rooted majorants. The exponent loss is covered by `13 epsilon/4 < 13 e_1/16 <= e_1 - 4` when `e_1 >= 100`, using the stated foam/radius and birth inputs. No free change of support radius was used.
3. **Ordinary and flagged responses have different payments.** In `finite-menu-history-handoff.tex:33–63`, `V_Q=10(P_0+E')`, `P_1=E' exp(-E_0)`, and `rho<=1/2` give `4 exp(E_0)P_1+4P_0/(1-rho)<=V_Q<=1/2`. Consequently `2P_0/(1-rho)<=1/4`, so ordinary allowance1 is safe. Reducing the ordinary exponent to `b_c+1/2` decreases the nonnegative cover weights. The flagged allowance `2 exp(-mu Delta^2/16)` at exponent `b_c+1` is a separate purchased estimate, not a consequence of the ordinary bound.
4. **The selected history is not reselected.** The fine/coarse representations and the door are fixed before the response, and the quiet, singleton and full push identities retain them. The fine coupling is `beta_hat_(m+1) = beta_F(beta_hat_m,L)`, giving allowance `beta_hat_(m+1)^(-1)` and single-insertion price `beta_hat_(m+1)^(-2)`. The two budget radii in the tariff are correctly distinguished.
5. **Downstream hypotheses remain visible.** Lines78–87 require the prepared finite list to be an offer for this same transition and door; preparation, slice integrability and singleton identities remain separate inputs. Lines126–130 explicitly retain arrival/raised-response receipts and other selected data. A funded path alone does not close those obligations.

## C02-to-C16 clarification: occupancy counts all slots

The arbitrary finite-slot extension uses the complete marker set `V x slotsZ`. Its occupancy condition is `Occupancy(parent composed with o) N` on that product, in addition to the offer bound. The same history and door work for every admissible finite product. This does **not** allow arbitrary numbers of coincident slots at a fixed occupancy budget: if each of `r` slots at a cell has the same parent, all `r` contribute to that parent's count. Increasing slot count needs an offer and a product-marker occupancy bound within the already purchased allowance, or a correspondingly funded allowance.

C02's revised parent-occupancy wording is correct. This is an explicit cross-package integration condition for C16, not a requested author edit in C02; no C16 file was changed by this reviewer. The source side is `YM.MergeProof.Ribbons.ManyCopies.Unites`, quoted precisely in the Lean report.

## Service checks and limits

The revised `k<=N` guard on stock witnesses and the separate `k<N` guard for the propagated moment estimate match their mathematical uses. Column-weighted affordability implies the weaker initial payment because `Gamma_k>=1` and `paid_i>=0`. Given the selected cutoff in M1 and the stated served/integrability inputs, cancellation of the common scalar, the charge `3a+a+2<=6`, and the identity `|Lambda_k|=M(a_m/a_k)^4` yield `exp((a_m/a_k)^4 T_k+6)/w`. The treasury factor survives the root normalization.

This review does not reconstruct the full public producer, settle every C02 chapter, certify all C05/C06/C12/C16 dependencies, or independently verify the cited Schatten-Hoelder literature. Shared literature notes were searched; no external result is newly invoked to supply the elementary checks above. Original-source verification of the remaining literature citation belongs to the full review. The conclusion is conditional on the explicitly retained analytic receipts. No manuscript, author record, shared metadata, or Lean source was edited.

## Acceptance

Responsible human acceptance is pending. Resolve M1 and obtain a review of the new exact content; this report must not be used to refresh another reviewer's approval or mark the package `reviewed`.
