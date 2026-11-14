# Independent review of PR #347: selected birth denominator and common width (#320)

- Session: `ADB991-claude-20261114-395d` (Claude, scheduled agent on behalf of ADB991).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/320#issuecomment-6868253715
- Role: independent review covering both the mathematics and the textual Lean correspondence. ADB991 did not
  author PR #347 or any hunk of `centered-birth-receipt.tex`. This report authors no manuscript hunk.
- Reviewed object: `manuscript/existence/centered-birth-receipt.tex` at git blob
  `fd8a8429cc50865954b5f61696d64013dad82bab` (SHA-256 `1b8b251f…2e8e91675b`, full value in `hashes.json`). This is
  the PR #347 head `afe81c1` and is unchanged on `codex/existence-monograph` @ `97f806c` (merge commit of #347 is
  `051facb`). The new text is lines 111–189: `lem:ex-selected-birth-denominator` and the paragraph "Common width and
  the vacuum cutoff". Lines 1–109 predate #347 and are read only as context.
- Also read: the author note `results/C02/author/hairer-codex-320-2358/README.md`, review #328 M3
  (`results/C12/endpoints/ADB991-claude-20261113-2684-review/README.md` l.110–118), `centered-construction.tex`
  l.75–125, `centered-public-service.tex` l.38–62, and `centered-freight-producer.tex` l.182–196.
- Lean pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All Lean evidence here is textual. Nothing was elaborated.

## Verdict

**No mathematical error. One required clarification (M1), one should-fix (S1), minor N1–N5 and optional O1.**

- The lemma's two identities are correct, and the integral identity is exactly the Lean
  `YM.RG.History.partition_eq`.
- The width arithmetic is correct.
- The treasury comparison reproduces `YM.Vac.suffices_bill` term by term.

Review #328 M3 is closed for the integral identity ∫eval(A_k) dμ_k = Z_{N,p}. M3 also needed the step "the
denominator of the served representation is ∫eval(A_k)". The new text uses that step but does not state it (M1).
One sentence fixes it.

## Mathematics

### `lem:ex-selected-birth-denominator` (l.113–141)

**Statement.** Assume A_N^ev = R_N and A_i^ev = Push_i A_{i+1}^ev for i < N. Then for i ≤ N:
- (a) (B_i)_∅ = A_i^ev;
- (b) ∫A_i^ev dμ_i = Z_{N,p}.

**(a) is correct on the range where B_i is defined.**
- At N: B_N = R_N·Pass(Σ_a e_{{a}}T_a). The constant term of the finite exponential is 1, and every other term has
  marker degree ≥ 1. So (B_N)_∅ = R_N = A_N^ev.
- Step: Push_i acts coefficientwise. B_i is a finite sum of basis elements e_S with scalar function coefficients,
  and the push is linear and integrates each coefficient, so (Push_i B_{i+1})_S = Push_i((B_{i+1})_S). Lean states
  this as `push_get`, used in `Accent.vista`. The step therefore holds.
- Range: the chain B_i is defined only for k ≤ i ≤ N (l.51). See N1.

**(b) is correct.**
- Induct downward and use the conservation identity (l.64–68) at each step.
- Every step needs A_{i+1}^ev to be integrable:
  - for i+1 = N, R_N is continuous on a compact space;
  - for i+1 < N, A_{i+1}^ev = Push_{i+1}A_{i+2}^ev. The kernel is bounded (l.70), so this function is bounded and
    measurable whenever A_{i+2}^ev is integrable.

  The proof only says "by the same … argument" (see N3), but the step goes through.
- Z_{N,p} > 0 because R_N is the bare Wilson density.
- (b) does not use (a), so it holds for all i ≤ N.

### The denominator in the served bound (l.183–184): M1

`centered-public-service.tex` l.41–62 and `centered-construction.tex` l.98–109 divide by Z_A = ∫eval(A) dμ, where A
is *the representative of the served representation of B_k*. The lemma computes ∫A_k^ev, where A_k is *the
history's unmarked representative at k*. "By Lemma … the denominator in this calculation is Z_{N,p}" therefore needs
A = A_k. The paragraph does not say so.

There are two short ways to close this:
- **(i) Lean's route.** Make "the served representation is over the history representative A_k" part of the served
  census input. The paragraph already makes that input conditional ("whenever the shared retention and transfer give
  the served census…"). In Lean, `YM.MergeProof.pollinate` (`SpringT.lean` l.34–37) concludes
  `Served (A.rep N p m) …`. `Accent.vista` (`Arbol.lean` l.40–60) feeds `Served (R k) …` to `Accent.sail`, whose
  denominator is `∫ (A.rep N p k).eval`. It then rewrites that denominator with `History.partition_eq`, so Lean
  never uses (a).
- **(ii) Through (a).** Show that the served format's quiet coefficient is eval of its representative, i.e.
  (X)_∅ = e^E·(vacuum field) = eval(A), from the format at `centered-construction.tex` l.81–84. Then
  eval(A) = (B_k)_∅ = A_k^ev pointwise, and the lemma gives Z_A = Z_{N,p}. This route explains why (a) is in the
  lemma, but the step that uses (a) is not written.

**Required:** one sentence choosing (i) or (ii). (i) matches the source.

### Common width (l.143–162)

**The cone bound holds.**
- Cone inequality: `centered-freight-producer.tex` l.186, ‖x_{m+1}(v)‖₁ ≤ s_{m+1}‖x_m(v)‖₁.
- Normalization (l.190): x_t(v) = v at the reference scale t ≤ k.
- Hence ‖x_k(v)‖₁ ≤ (∏_{t≤m<k} Γ_{m+1})‖v‖₁ ≤ D_k g_{d,R}, because every Γ_i ≥ 1
  (`(params m).columns_ge`, `RG/History.lean` l.60).
- g_{d,R} = max(1, sup_{‖v‖≤R}‖v‖₁) is finite in finite dimension.
- D_k depends only on the schedule, not on (N,p), site or label.

**The weight is correct.** With ω_k = a_k^d ζ_{d,k}/(Γ_k g_{d,R} D_k):

ω_k·Γ_k a_k^{−d} q_k(v) ≤ ω_k·Γ_k a_k^{−d} g_{d,R} D_k = ζ_{d,k}.

This gives the theorem's hypothesis w_a 𝔪_a ≤ 𝔣_k with 𝔣_k = ζ_{d,k}, uniformly on the ball. **Missing:** 𝔣_k ≤ 1,
which the theorem also requires (l.30) and which the 6|V| step (l.105–106) uses (S1).

### Vacuum cutoff and treasury (l.164–184)

**Radius.**
- s_k = β̂_k^{−1/2}.
- β̂_k > 1 gives 0 < s_k ≤ 1 (`Levels.fits.delayed`).
- threshold_k = s_k·exp((log log β̂_k)²) ≥ s_k (`Calendar.threshold`, `Calendar.monitor`). Lean has the same step
  as `he'` in `vista`.

**Per-site bill.**
- Numerator: E + κ (`Bands.fine`).
- Denominator: E + β·baseBudget(s_k) + 4d_G log(16/s_k) (`Rep.denominator`, `Shelter.lean` l.114–118, with
  |edges| = 4|sites|).
- Sum: 2E + κ + β·base + 4d_G log(16/s_k) (`Bands.finalBill`, `Bill.lean` l.52–54).

**Comparison with `Vac.treasury`** (`Treasury.lean` l.29–37, which is
2(δ + loopsPrice(2β̂)) + forcedAllowance + 2β̂·baseBudget(u) + 4d_G log(16/u) with u = s_k):
- E = exCost = δ + loopsPrice(β) (`Rep.exCost`), with δ = allowance_k by `Conv.good`.
- loopsPrice(β) = β·C(θ³+θ⁴) + Λθ² (`Caps.lean` l.99). This is affine in β with slope ≥ 0.
- κ = forcedAllowance_k.
- β ∈ [β̂/2, 2β̂] (`Conv.band`).
- baseBudget ≥ 0.

Replacing β by 2β̂ in both places therefore yields the treasury. This is exactly `Vac.suffices_bill` (l.39–59). The
statement is correct, with the same scalar σ = scalar(A) cancelling.

## Textual Lean correspondence

| Manuscript | Lean (pin) | Match |
| --- | --- | --- |
| Hypotheses A_N^ev = R_N, A_i^ev = Push_i A_{i+1}^ev | `History.Selected.starts` (`eval = bare (β N p N)`, `v = 0`), `.steps` → `Transfer.1` | yes; the push is at coupling β_{N,p,i+1} (N2) |
| (b) ∫A_i^ev = Z_{N,p} | `History.partition_eq` (`RG/History.lean` l.242–249) | exact |
| (a) (B_i)_∅ = A_i^ev | not stated in Lean; `vista`'s `hT` at I = ∅ together with `partition_eq` gives only the integrated form | additional true statement, proved correctly on k ≤ i ≤ N |
| denominator = Z_{N,p} | `Accent.vista` rewrites `sail`'s `∫ (R k).eval` by `partition_eq` | needs Served-over-A_k (M1) |
| payment w·Γ_k a_k^{−d} q_k ≤ ζ_{d,k} | `pollinate` hypothesis `hy : w i * bond … k (v i) ≤ ζ k`, `bond = ‖alto‖·coeffSize(index)`, `‖alto‖ = a_k^{−d}` (`Crisp.lean` l.27, `Cashew.lean` l.54–55) | conservative: Lean's `bond` has no Γ_k (O1) |
| ζ_{d,k} ≤ 1 | `Fiesta.coin : ζ m * Γ m ≤ 1` (`Crisp.lean` l.21) with Γ ≥ 1 | not cited (S1) |
| treasury comparison | `Vac.suffices_bill`, `Vac.treasury` | exact |

## Findings

- **M1 (required, one sentence).** Identify the representative of the scale-k served representation with the
  history's A_k before invoking the lemma for the denominator (l.183–184). Either:
  - (i) state it as part of the conditional served-census input (Lean: `pollinate` concludes `Served (A.rep N p m) …`); or
  - (ii) prove that the served format's quiet coefficient equals eval of its representative, and use (a).

  Without this, the closure of #328 M3 is only partial.
- **S1 (should).** The width paragraph takes 𝔣_k = ζ_{d,k}, but it never shows ζ_{d,k} ≤ 1. The theorem's hypothesis
  𝔣_k ≤ 1 (l.30) and the bound x+y+2 ≤ 6 need it. Cite the coin condition ζ_{d,k}Γ_k ≤ 1 with Γ_k ≥ 1 (Lean
  `Fiesta.coin`, hypothesis `hC` of `pollinate`), or its manuscript counterpart.
- **N1.** Lemma (a) is stated "for all i ≤ N", but B_i is defined only for k ≤ i ≤ N (l.51). Restrict (a) to that
  range; (b) holds for all i ≤ N.
- **N2.** Push_i depends on the coupling: the Lean kernel is `(op i p).push (β N p (i+1))`. The lemma's "same
  transition" is right only because the birth chain (`vista`'s `h`) and `Transfer` use the same β_{N,p,i+1}. Say so.
- **N3.** In (b), say explicitly that A_{i+1}^ev is integrable. It follows from the bounded-kernel argument at l.70,
  or from the lawful envelope (`Rep.envelope` via `Conv.good`, as in `partition_eq`).
- **N4.** The letter E is used for the per-site excess cost (l.172), while `centered-construction.tex` uses E(U) for
  the pointwise exponent. Use "exCost".
- **N5 (rendering).** Two `\eqref`s in the new text point at labels that sit inside unnumbered `\[…\]` displays.
  Such a `\label` takes the last counter that was stepped.
  - The proof of the lemma (l.132) cites `\eqref{ex-selected-birth-integral}` (its label is at l.75). It renders as
    "(22)", which is the *section* number. Checked on p. 123 of the build below.
  - The width paragraph (l.187) cites `\eqref{ex-selected-birth-bound}` (its label is at l.43). It renders as
    "(22.1)", which is the theorem number, not an equation number.

  Both labels predate #347, but the new text relies on them. Use numbered `equation` environments, or cite
  `thm:ex-selected-birth-moment` instead.
- **O1 (optional).** The weight ω_k carries Γ_k in its denominator, because the theorem's 𝔪_a = Γ_k·paid_a. Lean's
  payment `hy` has no Γ_k: the column factor enters only through `Fiesta.coin` and `Cherry.cost`. The manuscript
  condition is therefore stronger than the source's. It is still valid, since a smaller weight only weakens the
  conclusion. The theorem's remark that "the unweighted payment alone is insufficient" (l.32, pre-existing) may
  deserve a second look against `cost_step`.

## What remains open (unchanged by #347)

The served census and its local response on the retained selected history are still inputs:
- the geometry and occupancy;
- the common volume threshold;
- the #317/#318 menu and Music prerequisites.

They remain part of I-C02-funded-record, as the author note says.

## Evidence (commands actually run)

**Reading.**
- `gh api` reads of PR #347 (body, files, head `afe81c1`) and of issues #320 and #315.
- `git show origin/codex/existence-monograph:<path>` for every file listed in `hashes.json`. Lean was read with
  `sed -n`/`grep -n` at the cited lines.
- `git show afe81c1:manuscript/existence/centered-birth-receipt.tex | git hash-object --stdin` →
  `fd8a842…`, identical to `97f806c`.

**Structural checks.**
- `python3 scripts/check_blueprint.py` → "Blueprint structure OK: 4 units."
- `python3 -m unittest discover -s tests` → 22 tests OK.

**LaTeX build.**
- Export: `git archive origin/codex/existence-monograph manuscript` at `97f806c`, then
  `latexmk -pdf -interaction=nonstopmode existence.tex` → exit 0, 1022 pages, no undefined references in the log.
- `pdftotext` of pp. 122–123 (Section 22.1) was inspected. This is the source of N5.

**Not performed.**
- No Lean elaboration or `#print axioms`: Mathlib hosts are blocked here. The correspondence is textual only.
- No change to the manuscript, to `unit.json` or to any review record.
