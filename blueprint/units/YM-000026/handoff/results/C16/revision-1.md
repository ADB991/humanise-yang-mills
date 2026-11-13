# C16 revision 1: answers to the independent review (PR #97) and the G01 handoff

- Package: C16 of unit YM-000026; issue #57; umbrella #26.
- Author session: `ADB991-claude-20261113-33ce` (Claude, scheduled agent on behalf of ADB991; not reviewed by ADB991 before submission). Claim: https://github.com/hairer/humanise-yang-mills/issues/57#issuecomment-6858463564
- Base: `codex/existence-monograph` @ `97128ab`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Reviewed chapter hashes equal the review's README (checked before editing).
- The author pass (mgubi, PR #86) and the review (schmittj, PR #97) were by other contributors. This is author work: it needs renewed independent review, not by ADB991.
- Lean: source text only, no elaboration.

## Review items

| Item | Disposition | Where |
| --- | --- | --- |
| M1 = L1 (GAP) | Fixed. N is defined as the occupancy schedule N_j of `sec:common-observable-purchases` at stage J(m+1). The many-slot application now lists three hypotheses on the full product marker set V×S: positive weights, parent-site occupancy at most N, menu offer at exponent b_f−4 and allowance u. These are the hypotheses of `ManyCopies.Unites`. The text says they are checked by the caller and are not supplied by the regrouping. One correction to the review's wording: `Occupancy` bounds the number of markers **per parent site** (`∀ y, #{i : parent(o i) = y} ≤ N`), not a total. | `ope-history-service.tex`, §"Several insertions" |
| M2 (GAP) | Fixed where C16 purchases the item. **C12 (a):** the portfolio, its sections and regradings are fixed before the schedule and retained; stated twice in `public-run-binding.tex`. **(b):** the marked-portfolio thresholds n^mk_j are among the stage floors, so every block side at stage j is ≥ n^mk_j (`common-scale-selection.tex`, floor item 1). **(c)** and the fee delay: the marked-portfolio delay and the fee threshold k_j are in d_j, which gives k_{J(m+1)} ≤ β̂_m (list after the length selection). **(d):** existence of t_d now follows explicitly from J→∞ (`ope-history-service.tex`). **C11 drift ratio:** new floor `eq:common-drift-floor`, ε_j/log L_j ≤ min(s_G/4, j^{-2}) and λ_j/log L_j ≤ j^{-2}, with its proof and its identification with `eq:shoot-drift-ratio` and the second inequality of `eq:shoot-adjacent-drift`. **C11 loop capacities:** new `lem:common-loop-capacity`, with a full proof of the three inequalities from an entry threshold Δ_j ≤ d_j. **C11 entry thresholds:** startup and reset delays enter d_j through the list in `sec:common-funded-history`. The cubic gate is not named there, so its inclusion is **open** (ledger row "C16-to-C11-schedule"). | `common-scale-selection.tex`, `public-run-binding.tex`, `ope-history-service.tex` |
| M3 (INACCURACY) | Fixed: `ex-full-mesh` now assumes w_p at every suitable period and eventual suitability of p(q(k)), and concludes ℓ_{p(q(k))} → s; the proof uses the new hypothesis explicitly. | `assembly.tex` |
| M4 = L2 | Fixed: `ex-joint-input` refers to the limiting data of Section `ex-statement`, with the graded-field and phase-data conditions spelled out, plus the selected theory of Definition `ex-reconstructed`. | `assembly.tex` |
| M5 (NIT) | Fixed: the reason is added (the countable purchase puts exp(exp E_j), E_j ≥ 1, into every d_j, so β̂_m ≥ e^e). | `public-run-binding.tex` |
| M6 (NIT) | Fixed: `ope-scale-purchases.tex` now uses s_G with a pointer to its definition. `marked-portfolio-calibration.tex` (C12) still writes c_G; not in scope. | `ope-scale-purchases.tex` |
| M7 (NIT) | Fixed with the reviewer's wording. | `ope-scale-purchases.tex` |
| M8 (optional) | Adopted: cites `lem:tested-cr` together with `thm:joint-boundary`. | `statement.tex` |
| M9 (optional) | Adopted: "the lattice measure enters the target only through the mixed correlations" (in the P6 paragraph), plus `rem:ex-target-adequacy`. | `statement.tex` |
| R1 | `ledger.md` row C16-to-C12-selected-run lists (a)–(d) and the fee delay; new row C16-to-C11-schedule. | records |
| R2 = L4 | `ledger.md` H3 now carries the hypotheses. | records |
| L3 | `correspondence.md` now cites `ManyCopies.Unites`, `Occupancy`, `Offer`, `sewedN` with paths. | records |
| R4 | `findings.md` records P2 and P7 (both now adopted). | records |

## G01 handoff (hairer, #57 comment 6858464229)

| Item | Disposition |
| --- | --- |
| Finding 1 | Added `rem:ex-target-adequacy` in `statement.tex`. The remark says the public clauses admit insertions that do not depend on the configuration. It gives the witness construction: two phases, S^- = 2M − S, two added grade-zero channels, and the cancellation argument. It also says the detailed construction has none of these freedoms. The construction follows G01 `adequacy.md` (c) and (d), which was reviewed in #124/#153. |
| M3 (group transfer) | Not mentioned in the manuscript, so the vanishing and homogeneity hypotheses are not needed there. |
| P2 | Adopted: G is compact; it is not assumed connected; the representation is not assumed irreducible; the Wilson action is normalized by r_G (checked against `lattice.tex` l.35). |
| P6 (remaining) | Adopted: no spectral gap is asserted; the trace test excludes only finite combinations of profiles near 0; the slope is not prescribed; the grade-four field has no stress-tensor normalization. |
| P7 | Adopted as three sentences pointing to `ex-conditional-existence` (penalty 1, no uniqueness). |

## Checks run (this session)

- `latexmk -pdf -interaction=nonstopmode -outdir=<scratch> existence.tex` (from `manuscript/`): exit 0, 973 pages, 0 LaTeX warnings, 0 undefined references. Rendered and inspected pp. 21–23 (statement, remark), 962–963 (floors, loop-capacity lemma), 968 (M1 hypotheses), 971 (full-mesh lemma).
- `python3 scripts/check_blueprint.py` and `python3 -m unittest discover -s tests`: see the PR body for outcomes.
- No Lean command was run.

## Still open

- The cubic gate and startup thresholds are included in d_j only through the generic delay list of `sec:common-funded-history`. C11/C12 should confirm that the list contains them, or add them there.
- The analytic producers behind every purchased threshold are unchanged inputs. `ex-joint-input` remains open.
