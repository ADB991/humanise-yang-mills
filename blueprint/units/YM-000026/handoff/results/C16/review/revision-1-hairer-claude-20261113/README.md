# C16 revision 1: renewed independent review (agent review, no human acceptance)

- Package C16, issue [#57](https://github.com/hairer/humanise-yang-mills/issues/57); parent #26.
- Session `hairer-claude-c16-rev1-review-20261113` (Claude, under the `hairer` account). Claim:
  <https://github.com/hairer/humanise-yang-mills/issues/57#issuecomment-6859148847>.
- Reviewed: PR #165 (head `aab25d7`, merged as `4178c8c`; author session
  `ADB991-claude-20261113-33ce`), against the review in PR #97 (schmittj,
  `../schmittj-claude-20261112/`) and the G01 handoff on #57 (comment 6858464229). The twelve changed
  files are byte-identical between the PR head and `codex/existence-monograph` at the review
  branch base. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Independence: this account authored no C16 file. **Disclosure:** it wrote the G01 findings
  handed to C16; checking their disposition is part of this review. The author also used Claude.
- **Outcome: accepted; every item of the PR #97 review and of the G01 handoff is answered
  correctly. No required change.** Two optional nits below. The chapters remain conditional on the
  inputs listed in `../../ledger.md`; the author's open item (cubic gate and startup thresholds
  inside the generic delay list) stays open.

## PR #97 items

| Item | Verdict | Evidence |
| --- | --- | --- |
| M1 = L1 (gap: many-slot hypotheses) | **Fixed, correct.** The three conditions in `ope-history-service.tex` are exactly the hypotheses of `YM.MergeProof.Ribbons.ManyCopies.Unites` (`Lean/YM/OPE/Replicas/Price.lean` 18–19): positive weights; `Occupancy (S.ratio.parent ∘ o) N`; `Offer o q r R.p.B d c'`. The author's correction to the review is right: `YM.Extra.Multi.Occupancy` (`Lean/YM/Extra/MULTISOURCE_BOUNDS/Root.lean` 95) bounds the number of markers **per site**, `∀ y, #{i : o i = y} ≤ μ`, not a total. `YM.MergeProof.Menu.Offer` (`Lean/YM/MergeProof/Fruit.lean` 19–21) has the crest condition `sites` and the `budget` clause, and `Bandage.sewedN` (`Lean/YM/OPE/Replicas/Sponsor.lean` 44–48) instantiates exponent `K1.supportExponent − 4` and allowance `u`, as the text states. `N` is now defined. | source read |
| M2 (gap: C12/C11 obligations) | **Fixed, correct where C16 purchases them.** (a) portfolio fixed before the schedule, stated in `public-run-binding.tex` (twice); (b) `n^mk_j` in the stage floors; (c) fee threshold `k_j` and the marked-portfolio delay in `d_j`, giving `k_{J(m+1)} ≤ β̂_m`; (d) existence of `t_d` from `J → ∞`. **Drift floor** `eq:common-drift-floor`: matches `eq:shoot-adjacent-drift` (second inequality, `ε_{i+1} ≤ (s/4) log L_i`) and `eq:shoot-drift-ratio` (`ε_{i+1}/log L_i ≤ J_{i+1}^{-2}`) with `ε_{i+1}` the allowance of stage `J(i+1)` and `L_i = L_{J(i+1)}`; the existence of `u_j` is valid because `ε_j, λ_j` are fixed with the profile before the length. **Loop capacities** `lem:common-loop-capacity`: proof checked line by line (`log ℓ' − log ℓ ≤ v/(xℓ)`, `log ℓ + log ℓ' ≤ 2ℓ+1` for `x ≥ max{e, v}`, hence a log-ratio `≤ 3v/x`; monotonicity `θ_j ≤ θ_{J(m)}`). Its two schedule facts hold in the manuscript: `β̂_{m+1} = β̂_m + s_G log L_{J(m+1)}` from `s_{m+1} = s_m + log L_{J(m+1)}` (`common-scale-selection.tex` 43–60), and `d_{J(m+1)} ≤ β̂_m`. `loopCap` matches the source `YM.RG.History.loopCap m = 2 * monitor m ^ theta (J m)` with `monitor m = exp((log log β̂_m)²)` (`Lean/YM/RG/History.lean` 81, 86). The three conclusions are exactly the inequalities consumed in `path-attachment-producer.tex` 697–702. | manuscript + source read |
| M3 (`ex-full-mesh` hypotheses) | **Fixed, correct.** `w_p` at every suitable period and eventual suitability of `p(q(k))` are in the statement; the proof uses them, and the conclusion `ℓ_{p(q(k))} → s` is stated. | |
| M4 (`ex-joint-input` data) | **Fixed.** Graded fields, phase data and correlations are spelled out, with the selected theory of Definition `ex-reconstructed`. | |
| M5 (`1 ≤ 1 + log log β̂_m`) | **Fixed, correct.** `E_j = 1 + Σ|F_{n,i}| ≥ 1` and `exp(exp E_j)` is included in `d_j` (`common-scale-selection.tex` 139–145), so `β̂_m ≥ β_* ≥ d_{j_*} ≥ e^e`. | |
| M6, M7 (notation, delay wording) | **Fixed.** `c_G` remains in C12's `marked-portfolio-calibration.tex`, out of scope, as the author notes. | |
| M8, M9 (optional) | Adopted. | |
| R1, R2, L3, R4 (records) | Done: ledger rows `C16-to-C12-selected-run` (with (a)–(d) and the fee delay) and the new `C16-to-C11-schedule`; H3 carries the M1 hypotheses; `correspondence.md` cites `ManyCopies.Unites`, `Occupancy`, `Offer`, `sewedN` with correct namespaces and paths; `findings.md` records P2 and P7. | |

## G01 handoff

| Item | Verdict |
| --- | --- |
| Finding 1 | **Answered, correct.** `rem:ex-target-adequacy` states that the public clauses admit configuration-independent insertions and gives the construction of G01 `adequacy.md` (c), main version. Checked: at the selected phase the new channels cancel by homogeneity (`h·S − ½h·2S = 0`); in the mixed state the expansion reproduces `M` because `m((0,u)) = 1`, `m((0,2u)) = 0` (`u ≠ 0`) and `M` vanishes on positive-grade actors; the remainder at `−` is minus that at `+` by linearity; `½S + ½(2M − S) = M`; the running input holds with `σ = log(N+2)/log(N+2) = 1`. The closing paragraph correctly limits the remark to what the target certifies. |
| M3 (group transfer) | Not mentioned in the manuscript. The handoff asked for the hypotheses only *if* group transfer is mentioned, so this disposition is acceptable. |
| P2, remaining P6, P7 | Adopted with the requested content (compact, not assumed connected, representation not assumed irreducible, normalization by `r_G`; no gap; trace test excludes only finite combinations of profiles near 0; slope not prescribed; no stress-tensor normalization; penalty one, no uniqueness). |

## Optional nits

- **N1.** `lem:common-loop-capacity` uses `β̂_m ≥ d_{J(m+1)}`; it is stated in the paragraph before
  the lemma ("Since `d_{J(m+1)} ≤ β̂_m` at every step"). Repeating it in the lemma's hypotheses
  would make the lemma self-contained.
- **N2.** That the protection exponents `θ_j` are nonincreasing is assumed in the lemma; I did not
  check where the schedule supplies it.

## Checks actually run

- Hash identity of the twelve changed files between `aab25d7` and the branch head.
- Source reading at the pin as cited above.
- Full monograph build (`latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`):
  exit 0, 975 pages, no undefined references or multiply defined labels. `rem:ex-target-adequacy`
  on page 23, `lem:common-loop-capacity` on 965 (rendered and inspected), `ex-full-mesh` on 973.
- Not run: Lean elaboration, axiom checks. Analytic producers behind the purchased thresholds were
  not re-checked.

## Next

Responsible human acceptance of C16 revision 1. Open: the cubic gate and startup thresholds in
`d_j` (C11/C12 to confirm), and `ex-joint-input` as before.
