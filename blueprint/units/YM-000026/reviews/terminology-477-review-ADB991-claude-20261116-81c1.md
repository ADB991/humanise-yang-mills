# Review of the terminology revision #477: preservation of the mathematics

- Unit: YM-000026 (`manuscript/existence.tex`, `manuscript/existence/*.tex`)
- Role: mathematical validity, restricted to one question: does the #477 diff
  preserve the mathematics? This is not a whole-argument review.
- Human reviewer: none. ADB991 has not reviewed this report. It was prepared
  by a scheduled agent acting under ADB991's account.
- Agent assistance: Claude (Anthropic), session `ADB991-claude-20261116-81c1`,
  wrote the scripts, read the residual hunks and wrote this report.
  No subagents were used.
- Content inspected: PR #477, merged as `962ac43b` with first-parent base
  `9ded0b7a`. The `manuscript/existence` tree is `d422b163` after the PR and
  `40777beb` before it. `manuscript/existence.tex` is unchanged by the PR.
- Source revision: Lean `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, unchanged.
- Review task and PR: #479 (claim
  https://github.com/hairer/humanise-yang-mills/issues/479#issuecomment-6932410501);
  the report PR is linked from the issue.
- Outcome: no changed mathematical statement, constant or exponent was found.
  The PR's renames preserve the content of every hunk that touches math mode.
  Changes are requested at the level of notation and editing:
  - S1–S3: symbol overloads introduced by the renames, and an incomplete
    dilation conversion;
  - N1–N3: old terms left undefined after their definitions were renamed,
    duplicated words, and one garbled sentence.

## Method and evidence

Every command below was actually run, on copies of the two trees made with
`git archive 9ded0b7a manuscript` and `git archive 962ac43b manuscript`.

1. **Token-level substitution map.** Each changed `.tex` file (180 files) was
   tokenised into control sequences, words, numbers, whitespace and single
   characters, and the two versions were aligned with `difflib.SequenceMatcher`
   (`autojunk=False`). The script is in the Bots note. Result: 525 distinct
   old→new substitutions, 3953 occurrences in total. The most frequent are
   `price`→`bound` (1273), `prices`→`bounds` (511), `door`→`interface` (121),
   `train`→`kernel history` (60) and `bill`→`bound` (54).
2. **Label, reference and citation sets.** The multisets of `\label`, `\ref`,
   `\eqref` and `\cite` keys were compared across both trees.
   - `\eqref` (1305) and `\cite` (33) are identical.
   - One label was added, `sec:ex-rg-terminology` (argument-outline.tex:11).
   - Seven `\ref`s were added: three to `sec:ex-lattice-trace-coffer-supplier`,
     which replace prose "the Coffer …", and one each to
     `sec:ex-rg-terminology`, `sec:ex-soft-curvature-receipts`,
     `sec:heading-history-handoff` and `sec:selected-zero-coordinate-coupon`.
   - All added references resolve to existing labels.
   - No key was removed.
3. **Hunks that touch math.** I flagged every aligned change whose old or new
   text contains a digit, one of `^ _ < > = + / |`, a binary minus, or one of
   `\le \ge \frac \sum \prod \exp \log \sqrt \min \max \sup \inf \int \cdot
   \times`. That gave 108 hunks, and I read each with its context. The
   verifications are listed under "Checked and found consistent".
4. **Collisions.** For every new math symbol or operator name I counted
   occurrences per file before and after the PR. A new symbol that already
   occurred in the same file is a candidate collision; I read each candidate.
   - These new operator names occur nowhere in the old tree, so they cannot
     collide: `fieldCut`, `fineCut`, `zoomCap`, `invDil`, `stepSmall`,
     `vacuumBound`, `volFac`, `rootFac`, `redBud`, `scaleDecay`, `gradeDecay`,
     `frameWeight`, `symProd`, `comparisonConst`, `forcedReserve`,
     `activityBound`, `localizationBound`, `pathCutoff`, `pathBound`,
     `countertermBound`, `landMoment`, `massiveSymbol`, `probeBound`,
     `quadBound`, `scAllow`, `stopBound`, `logScale`, `scaleRate`.
   - These subscripted families are new and fresh: `\mathcal B_{\rm …}`
     (`final`, `loop`, `merge`, `row`, `refl`, `degree`, `test`, `read`,
     `err`), `\mathfrak M` and `R_{\rm supp}`.
   - Reused letters are dealt with in S1 and S2.
5. **Merged names.** I built the inverse map (new name → set of old names)
   and checked each case in which two distinct old identifiers became one new
   identifier.
6. **Leftovers.** I counted whole-word occurrences of old identifiers in the
   new tree and read every file that now uses both the old and the new name.
7. **Newly duplicated words.** I searched both trees for a word repeated
   across whitespace, including line breaks, and kept the cases that are new
   in the PR.

Structural checks on the review branch: `python3 scripts/check_blueprint.py`
and `python3 -m unittest discover -s tests` (results in the PR).

## Checked and found consistent

- **`puffs` → explicit power.**
  - Old definition: `\operatorname{puffs}(H_i)=L_i^{1/8}`
    (actual-marked-portfolio-calibration.tex:303). This agrees with Lean
    `YM.Bid.Loan.puffs L = L^(1/8)` (`Lean/YM/Bid/Loan.lean:34`).
  - The replacements in centered-freight-producer.tex:142–145 are
    `L^{1/8}`, `e=L^{-3/8}` (from `puffs^{-3}`) and `L^{-1/4}` (from
    `puffs^{-2}`). The exponent arithmetic is correct.
  - In actual-marked-portfolio-calibration.tex the PR writes `\lambda_i` at
    l.303 and `L_{N-1}^{1/8}` at l.496 and l.531. These are consistent.
- **`momentPrice` → `\mathfrak M`.**
  - New definition at trace-local-charge.tex:470:
    `\mathfrak M(s,\eta)=e^\eta s!/\eta^s`. This equals Lean
    `momentPrice s η := Real.exp η * s.factorial / η^s`
    (`Lean/YM/Extra/ITERATION_NO_LOSS/Sums.lean:106`).
  - The stated bound $(1+g)^s e^{-\eta g}\le\mathfrak M(s,\eta)$ holds: put
    $x=1+g$; then $x^s e^{-\eta x}\le s!/\eta^s$ by
    $e^{\eta x}\ge(\eta x)^s/s!$.
  - trace-local-pairing.tex:855 and :870 rewrite `momentPrice_P(a/4)` as
    `\mathfrak M(P,a/4)`. These are consistent.
- **`\mathrm{puff}(t)` → `R_{\rm supp}(t)=4(R+2)`** (trace-local-charge.tex:766).
  - Before #477, `puff` was used without definition. The PR adds one.
  - It agrees with Lean `YM.Trace.Zn.puff x := 4*(rim x+1+1)`
    (`Lean/YM/TraceExtension/Zn/Setup.lean:13`) with `rim x = 1000*radiusB x`
    (`Lean/YM/TraceExtension/Zn/Have.lean:59`). The manuscript's
    $R=1000\lceil\log^2 t\rceil$ (l.433) plays the role of `rim`. I did not
    check `radiusB` itself.
  - `countertermBound(t)=t^{-30}` (formerly `calorie`) agrees with Lean
    `calorie x = (x^30)⁻¹` (same file, l.21).
- **`\operatorname{price}` → `\Phi`** (stationary-action-prices.tex:145–147).
  - The PR adds the definition "half the squared chord to the identity". The
    bound $\le\frac12(C_3r)^2$ in the next display needs exactly this
    definition.
  - `\Phi` does not occur elsewhere in that file.
- **Merge `CTax`, `circleTax` → `\operatorname{Cauchy}`.** Both have the same
  recursion: $X(R,0)=1$ and $X(R,k+1)=X(R,k)/(R/2^{k+1})$
  (wilson-vacuum-price.tex:29–30 and soft-curvature-receipts.tex:75–76 in the
  old tree). The merge is legitimate.
- **Grade dilation.**
  - The definition in sec:ex-rg-terminology is
    $(\mathsf D^{\rm gr}_{d,L}v)_\alpha=L^{d-\deg\alpha}v_\alpha$. It matches
    the old `D_L` in ope-filtration.tex:17 and the old description of
    `\operatorname{vowel}_L`.
  - At every converted use I checked that `d` is the grade in scope:
    - centered-freight-producer.tex:7 ("degree between $0$ and $d$");
    - actual-marked-portfolio-calibration.tex:17 and :71 ($L^{d-r_j}$, as
      before);
    - heading-history-handoff.tex:376;
    - phase-quantitative-producer.tex:14 and :94;
    - selected-centered-service.tex:2046 and :2645;
    - ope-filtration.tex:17.
  - The rewrite `\operatorname{vowel}_m` → `\mathsf D^{\rm gr}_{d,\ell_m}`
    agrees with the outline's convention "for a step with block side
    $\ell_m$".
- **Price and bill operators.** Old operator names containing `price` or
  `bill` (76 in math mode) are all gone from math mode in the new tree.
- **Rewritten sentence at centered-freight-producer.tex:29.** "Equal price
  $\eta_m u/\kappa$ and bill $2u$" became "bounds $\eta_m u/\kappa$,
  $\eta_m u/\kappa$ and $2u$". These are the same three fields.

## Findings

### Required (notation)

**S1. The renames introduce symbol overloads in the same passage.**

| File (new tree) | New use | Pre-existing use |
| --- | --- | --- |
| trace-coffer-supplier.tex:649, 694, 703 | `\omega(w,s)` (weight, formerly `toll`) | `\omega_{a,P}(U)` singleton box amplitudes, l.607–620, same subsection |
| fullmesh-correlation-cauchy.tex:215 | `\omega_w(S)` (weight) | `\omega_{N,m,i}` forced profile, l.33–158 |
| stationary-output-construction.tex:327, 399 | `\mathcal B_{\rm row}` (row bound) | `\mathcal B_{t_k}` completed determinant correction, l.387 |
| rg-construction.tex:181, 221, 224, 325–326 | `\mathcal N_r` (weighted norm) | `\mathcal N_i` set of named origins, l.297–298 |

- The first row is the most confusing. In that subsection
  \eqref{eq:ex-trace-spiker} reads $|M|\,\omega(w,\mathfrak s)$ a few lines
  after $\sum_P w_a|\omega_{a,P}(U)|\le1$.
- In fullmesh-correlation-cauchy.tex, l.329 says "identify all of the $\Phi$
  and $\omega$ above". This now also covers the weight $\omega_w$, which is
  not a local-section datum.
- Proposed fix: use a letter for the marker-weight product that is not
  otherwise used in these files, for example $w^S$ or $\varpi_w(S)$. Use a
  different letter either for the row bound or for the determinant
  correction, and either for the norm or for the origin sets.

**S2. The global index does not record the new symbol families.**
- symbolic-index.tex lists `\mathcal N_d` (l.43–45) as the null part of
  classical jets.
- The PR makes `\mathcal N_w` and `\mathcal N_r` weighted coefficient norms
  in centered-construction.tex, centered-production.tex,
  centered-public-service.tex, rg-construction.tex and rg-multisource.tex. It
  also introduces the `\mathcal B_{\rm …}` bound family and `\mathfrak M`.
  None of these is indexed.
- Proposed fix: add index entries, or choose letters that are not already
  indexed.

**S3. The grade-dilation conversion is incomplete.** The PR states that it
keeps "the grade and block size explicit at every use of the dilation", but
two places still use other names for this dilation:
- reference-cone.tex:16–22 defines and uses a bare `D_L`, described as
  multiplying "the coordinate of degree $j\le d$ by $L^{d-j}$". This is
  $\mathsf D^{\rm gr}_{d,L}$.
- primary-calibration-producer.tex:218 calls it `\mathscr V_L`, described as
  "diagonal multiplication by $L^{d-g_i}$". The neighbouring
  `\mathscr D_L` multiplies by $L^{g_i}$, which is a different map.

In addition:
- `\mathsf D_a` (annulus-fleet-face-estimates.tex:702–706, a fixed
  direction-selection matrix) is a third `\mathsf D`.
- symbolic-index.tex:53–56 names only $\mathsf D^{\rm gr}_{d,L}$ and
  $\mathsf D_m$.

### Non-blocking (editorial)

**N1. Old terms remain in prose after their definitions were renamed.** The
following now refer to objects that no longer carry those names:
- "toll": centered-production.tex:101, 104; centered-public-service.tex:58;
  centered-construction.tex:253; fullmesh-correlation-cauchy.tex:192. The
  object is now `\omega_w`.
- "chip factors": free-kernel-estimates.tex:361, 739. The object is now
  `\delta_{\rm F}`.
- "mouth identity": free-kernel-estimates.tex:456, 575. The object is now
  `landMoment`.
- "rail" and "plank": kernel-transport-identities.tex:243–244. The objects
  are now block and centered averages.
- "stain/contact bound": selected-centered-service.tex:1912.
- "escrow": actual-marked-portfolio-calibration.tex:547.

Old words also survive in large numbers elsewhere, for example `ticket` 125,
`receipt(s)` 465, `invoice` 34, `treasury` 29, `palette` 48 and `scribe` 105.
The PR says some specialised vocabulary is intentionally kept, so I list only
the cases where the definition itself was renamed.

**N2. Newly duplicated words and misspellings.**
- actual-marked-portfolio-calibration.tex:393–394, "transfer witness /
  witness".
- actual-marked-portfolio-calibration.tex:400 and
  selected-centered-service.tex:3028, "decompositiones".
- actual-palette-warning.tex:231–232, "bound / bound".
- trace-small-means.tex:7–8, "local bound / bound".
- trace-firesky-gallery.tex:1083–1084, "quantitative / quantitative".

**N3. Garbled text from mechanical replacement.**
- free-kernel-components.tex:33–34 reads "the uniform block and centered
  averages lower and principal-centered average constants". The original was
  "rail/plank lower and principal-plank constants".
- trace-clock-cap.tex:2 has the heading "The zoom bound and the logarithmic
  zoom bound". The original was "The tilt cap and the logarithmic zoom
  bound".

## Not checked

- Prose substitutions that do not touch math tokens, beyond those read for
  N1–N3. Examples are `same`→`common` (34), `history`→`trajectory` (33) and
  `stored`→`fixed` (31). I read a sample, not every occurrence.
- Whether every surviving occurrence of `bound`, `estimate` or `fixed`
  remains unambiguous now that these words also replace `price`, `receipt`
  and `stored`.
- The LaTeX build. This report changes no `.tex` file. The PR author reports
  a clean build; I did not rebuild the PDF or look at the rendered pages.
- Lean: no Lean command was run. The three Lean comparisons above are
  textual readings of the pinned source.
- Changes merged before #477, including #471.

## Acceptance

This is an agent report and supplies no acceptance. A responsible human
reviewer decides whether S1–S3 must be fixed before the terminology pass is
accepted.
