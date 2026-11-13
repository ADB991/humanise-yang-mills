# Review of a proof unit

- Unit: YM-000033, `blueprint/units/YM-000033/`
- Role: mathematical validity (renewed review of revision 1)
- Human reviewer: `ADB991` (account under which this report is submitted; ADB991 had not reviewed it before submission, and no human acceptance is recorded by this report)
- Agent assistance: the whole review was done by a Claude (Anthropic) agent session, `ADB991-claude-20261113-f80c`, running as a scheduled agent. This account authored no part of YM-000033 and did not write review #126/#127. The revision was drafted with Codex (GPT family), so the reviewing model family differs from the authoring one.
- Content SHA-256: `ad3b82466a1b69b610548e1af518251def5ac1cd4a6bc5757a91b3cc46cba4aa` (`python3 scripts/check_blueprint.py --fingerprint YM-000033` at `codex/existence-monograph` `b0bfc78`; equal to the author's recorded revision fingerprint). All ten file hashes in `revision-candidate.json` match this base.
- Manuscript files and labels: `manuscript/existence/trace-prosper-sensor.tex`, read in full (645 lines): `lem:trace-sensor-arch-ratio`, `lem:trace-sensor-initial-price`, `lem:trace-sensor-transport-price`, `lem:trace-sensor-lift-limit`, the list (S1)–(S7), `prop:trace-prosper-sensor`, equations `eq:trace-sensor-*`. Support: the subsection "Low-grade invariant labels" of `trace-free-rank.tex` (for R2) and the statement of `lem:ex-lattice-trace-weighted-price` in `trace-weighted-estimates.tex`. `preamble.tex` not reviewed.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: issue [#33](https://github.com/hairer/humanise-yang-mills/issues/33), claim https://github.com/hairer/humanise-yang-mills/issues/33#issuecomment-6856591729; revision PR #134 (head `0076542`, merged at `b13f2ef`); this report's PR: report-only draft against `codex/existence-monograph`.
- Outcome: **no change required.** R1, R2, R3, R4 and R5 of review #126 (as corrected in #127) are resolved. No mathematical error was found in the revised text. Four optional presentation suggestions (S1–S4 below; named O1–O4 to avoid a clash with the chapter's (S1)–(S7)). Acceptance would be local and conditional on the inputs (S1)–(S7).

## Findings and evidence

### Responses to the earlier findings

- **R1 (required): resolved.** The inputs are now the numbered list (S1)–(S7) (lines 503–561), immediately before `prop:trace-prosper-sensor`. The four derived results are labelled lemmas with proofs: arch ratio (117–145), initial-level price (231–361), transport price (363–475), lift convergence (477–501). The proposition cites them. I checked that every "assume"/"suppose" in the chapter is covered by the list:
  - clock, block sizes, arch scales and \(n_i=q(k_i)\) (105–115) → (S1);
  - chart formulas, \(PY_i=X_i\), intertwining, \(fU=\mathrm{id}\) (147–213) → (S2);
  - ultrafilter refining the fused order, joint transport, running parameter and lift convergence (240–262) → (S3);
  - \(\mathsf A,\mathsf T\) endomorphisms with unit, injectivity of \(\mathsf A\), the two bounds of `eq:trace-sensor-tested-price`, the lift formula and \(\mathsf A=d_{k_i}^{-5}\operatorname{Col}_{k_i}\) (274–345) → (S4);
  - threshold ratio and residual bound `eq:trace-sensor-raw-step` with the quantifier "each fixed \(j\), eventually in \(\nu\), uniformly in \(N>j\) and label" (418–431) → (S5);
  - column budget and preservation of oddness (416–417, 433–435) → (S6);
  - the marked limits → (S7), which the proposition states separately in `eq:trace-sensor-marked`.

  Nothing is used that is not in the list. The "Suppose finite-volume coefficients … satisfy `eq:trace-sensor-finite-price`" (248–256) and "suppose … `eq:trace-sensor-step-input`" (373–381) are derived inside the same proofs (355–357 and 455–472), so they are not extra hypotheses (see O2).
- **R2 (nit): resolved.** Line 316–317 now cites Section `sec:ex-lattice-trace-free-rank`. Its subsection "Low-grade invariant labels" (`trace-free-rank.tex` line 12) contains the invariant-linear-form argument.
- **R3 (minor): resolved.** Line 277: \(\mathsf A,\mathsf T:\mathsf V\to\mathsf V\) are endomorphisms. The dimension sentence is gone. Injectivity of \(\mathsf T\) follows from the first bound and injectivity of \(\mathsf A\) (288–290); finite dimension gives invertibility. Correct.
- **R4 (nit): resolved.** Lines 240–245 and (S3): the selected ultrafilter refines the fused order, \(\mathcal L\le\mathcal F_{\mathrm{fuse}}\), and only coordinate tails are used. I checked that the fused-order filter contains both tails (see the Lean report: both coordinate sequences are strictly increasing). Then the fixed-\(i\) set "eventually in \(\nu\) for each \(k_i\le j<n_i\), and \(N\ge n_i\)" is in \(\mathcal L\): a finite intersection of an "eventually in the period" set (uniform in \(N>j\)) and a mesh tail.
- **R5 (record): resolved.** The wrapper (`evidence/wrapper.tex`) now documents the two external labels in a comment. My build reproduces exactly those warnings (see Evidence).

### Re-verification of the revised mathematics

I rechecked each derivation in the changed text.

1. **Lemma `lem:trace-sensor-arch-ratio`.** Let \(\chi=\widehat\beta_k\), \(g=(\log\chi)^{48}\), \(q(k)=m+1\). Minimality gives \(\ell_m-\ell_k\le g\). For large \(k\), \(\gamma g\le\chi\), so \(\widehat\beta_m\le2\chi\). Then \(\log L_m\le L_m\le\log\widehat\beta_m\le\log 2\chi\le g\). So \(0\le\ell_{q(k)}-\ell_k\le2g\), and \(\widehat\beta_{q(k)}/\widehat\beta_k\to1\). With \(\widehat\beta_j\ge\gamma\ell_j\), `eq:trace-sensor-clock-input` gives \(b_j/\widehat\beta_j\to1\), hence the claim. Correct.
2. **Lemma `lem:trace-sensor-initial-price`.**
   - Centring: with \(c=(\mathsf Tv)_0\) and \(v^\circ=v-c\mathbf 1\), \(\mathsf Tv^\circ=\mathsf Tv-ce_0=\operatorname{core}\mathsf Tv\) and \(\operatorname{core}\mathsf Av^\circ=\operatorname{core}\mathsf Av\). From \(|\mathsf Av^\circ|_1\le\tfrac12|\mathsf Av^\circ|_1+|\mathsf Tv^\circ|_1\) we get \(|\mathsf Av^\circ|_1\le2|\operatorname{core}\mathsf Tv|_1\). The second bound **applied at \(v^\circ\)**, then \(\operatorname{core}\), gives `eq:trace-sensor-centered-price`. Correct (O1).
   - Calibration: \(\operatorname{Dil}_\xi\mathsf T\lambda_i=\operatorname{Pos}_{\sigma_i}p=\sigma_i^5p\) because the nonzero nonunit coordinates of the odd \(p\) have position degree 5. \(\operatorname{Dil}_{\xi^{-1}}\) multiplies factor-degree-2 coordinates by \(\xi^{-2}=\beta_i\vartheta_{k_i}^2\). So \(\operatorname{core}\mathsf T\lambda_i=\beta_i\vartheta_{k_i}^2\sigma_i^5p\). Multiplying the centred price by \(\vartheta_{k_i}^{-2}d_{k_i}^5\) and using \(r_i=d_{k_i}\sigma_i\) gives \(|Z_i-\beta_ir_i^5p|_1\le2\eta_i\beta_ir_i^5|p|_1\), which is `eq:trace-sensor-finite-price`. Correct.
   - The degree classification (311–322) is the same argument as before, now with the R2 reference. Correct.
   - Limits: \(Z_i(\omega)\to\vartheta_{k_i}^{-2}\operatorname{core}M(k_i)y_i=W_{k_i}y_i\) by (S3) applied to \(v(\omega)=\lambda_i(\omega)\to y_i\); \(B_i(\omega)\to b_{k_i}r_i^5=D_i\). The non-strict inequality passes to the ultrafilter limit. Correct, with the volume limit at fixed \(i\).
3. **Lemma `lem:trace-sensor-transport-price`.**
   - Telescoping with \(a=\delta_i/N_i\le 1/N_i\): from \(|z_{j+1}|_1\le2|z_{n_i}|_1\), the step bound \(\tfrac{\delta_i}{2N_i}|z_{j+1}|_1\le a|z_{n_i}|_1\). Correct.
   - Grade scaling `eq:trace-sensor-grade-scaling`: block factor \(L_j^{0}=1\), dilation factor \((\vartheta_j/\vartheta_{j+1})^2\) on the nonunit coordinates of the odd \(\widetilde z_{j+1}\). Correct.
   - Budget: \(\widehat\beta_{n_i}\le2\chi\); \(\log L_j\ge\log3\ge1\) gives \(N_i\le2(\log\chi)^{48}\); \(C_{j+1}\le\log\widehat\beta_{j+1}\le2\log\chi\); monotonicity gives \(A_{1/2}(j+1)\ge A_{1/2}(k_i)\). Then \(2N_i\cdot4g_j\le32(\log\chi)^{48}(1+2\log\chi)/A_{1/2}(k_i)\le A_{-2/5}(k_i)=\delta_i\), because a fixed power of \(\log\chi\) is eventually below \(A_{1/10}(k_i)\). Correct.
   - Quantifiers: the finite intersection over \(k_i\le j<n_i\) with \(N\ge n_i\) is taken for fixed \(i\) before the ultrafilter limit. This matches (S5).
4. **Lemma `lem:trace-sensor-lift-limit`.** \((u_ih)_\alpha=c_i^{-1}W_{n_i}y_i=(b_{k_i}/b_{n_i})\mathsf R_i\). The bound \(|\mathsf R_i-p|_1\le(2\eta_i+\delta_i)(1-\delta_i)^{-1}|p|_1\) follows: \(\delta(1+2\eta)/(1-\delta)+2\eta=(2\eta+\delta)/(1-\delta)\). With `lem:trace-sensor-arch-ratio`, \(u_ih\to Uh\). Finite dimension gives operator-norm convergence. Correct.
5. **Proposition.** The proof is unchanged in substance from the version reviewed in #126 (item 8 there), which I re-read. \(T_i=u_if+A\otimes v_i\to\mathrm{id}\), \(s_iT_i=f+A\otimes s_i(v_i)\), \(\|s_i-f\|\le(\|A\|\|s_i(v_i)\|+\|f\|\epsilon_i)/(1-\epsilon_i)\), then `lem:ex-lattice-trace-weighted-price` with \((s_i,u_i,v_i,\mathfrak a_i)\). The statement now has "for all sufficiently large \(i\), \(|\mu_i(h)|\le C\|h\|\)" and one tail per \(\varepsilon\), uniform in \(y\). Correct.

**Existing results.** The tools remain the Neumann series (cited in `correspondence.md` to Winklmeier, Thm 2.10) and the rank-one receiver lemma proved in `trace-weighted-estimates.tex`. I know of no literature result that would shorten the chart and calibration bookkeeping.

## Optional suggestions (not required)

- **O1 (clarity), lines 295–299.** "Applying core to the second bound" should say "applied to \(v^\circ\)". At \(v\) itself the bound has \(|\mathsf Av|_1\) on the right, which need not be at most \(2|\operatorname{core}\mathsf Tv|_1\).
- **O2 (presentation).** The lemmas cite "(S1)–(S6) below" before the list appears (line 229). Two proofs also open with "Suppose …" for statements they derive later (248–256, 372–381). Moving the list before Lemma `lem:trace-sensor-initial-price`, and stating the finite-volume price and the one-step price as claims to be proved, would read more directly. The proposition statement also contains a proof sentence ("By Lemmas …, the stated chart has an eventual right inverse …"), which could move to the proof.
- **O3 (scaffolding), line 340.** "On the selected tail, where \(i\ge5\)" comes from the Lean indexing of the lift (`heightV`, with `5 < i+1`; see `correspondence.md` line 33). In the monograph, "on the selected tail" suffices.
- **O4 (wording), lines 243–245.** "Write \(\mathcal F_{\mathrm{fuse}}\) for its fused-order filter" — "its" refers to the order, not the ultrafilter. Suggest: "Write \(\mathcal F_{\mathrm{fuse}}\) for the fused-order filter on pairs; the selected ultrafilter satisfies \(\mathcal L\le\mathcal F_{\mathrm{fuse}}\), so it contains both coordinate tails."

Not checked: the production of the inputs (S1)–(S7), which by design are hypotheses; `preamble.tex`; the parts of the support chapters not cited here.

## Evidence (commands actually run, at `b0bfc78`)

- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified." (also after adding these reports)
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `python3 scripts/check_blueprint.py --fingerprint YM-000033`: `ad3b82466a1b69b610548e1af518251def5ac1cd4a6bc5757a91b3cc46cba4aa`; SHA-256 of all ten files listed in `revision-candidate.json` recomputed: all match.
- From `manuscript/`, `pdflatex -interaction=nonstopmode -halt-on-error -output-directory=<scratch> ../blueprint/units/YM-000033/evidence/wrapper.tex`, twice: exit 0 both times, 21 pages. Warnings: only `prop:ex-lattice-charge-bounds` (pages 11, 12) and `prop:ex-trace-mission-price-transfer` (page 6), the two documented external labels; one inherited 5.3389pt overfull box in the receiver paragraph. Pages 14–21 rendered with `pdftoppm -r 70` and inspected (pages 17 and 20 in detail): lemma headings, the (S1)–(S7) list and the proposition render correctly.
- Lean: source text read with `grep`/`sed` only (paths in the Lean report). No elaboration.

## Acceptance

No acceptance is recorded by this report. A responsible human may record local mathematical acceptance at fingerprint `ad3b8246…46cba4aa`, conditional on (S1)–(S7). O1–O4 are optional; any edit would change the fingerprint.
