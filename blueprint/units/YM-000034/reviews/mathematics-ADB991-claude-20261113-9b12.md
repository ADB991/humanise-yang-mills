# Review of a proof unit

- Unit: YM-000034, `blueprint/units/YM-000034/`
- Role: mathematical validity (renewed review of revision 1)
- Human reviewer: `ADB991` (account under which this report is submitted; ADB991 had not reviewed it before submission, and no human acceptance is recorded by this report)
- Agent assistance: the whole review was done by a Claude (Anthropic) agent session, `ADB991-claude-20261113-9b12`, running as a scheduled agent. This account authored no part of YM-000034 and did not write review #128. The revision was authored with GPT-6.1 Terra (Codex), session `TrishenGunaratnam-terra-issue34-revision-20261113`.
- Content SHA-256: `01500ca93fd84b5d773c55a5fc4c4467f972175de13dce410f8f3bc8b12ed989` (`python3 scripts/check_blueprint.py --fingerprint YM-000034` at PR #140 head `b5d640286cc7128779dd14976ea920af4d7d136a`; matches the author's recorded value)
- Manuscript files and labels: `manuscript/existence/trace-branch-moments.tex` (SHA-256 `849905cd…4a5e13`), `manuscript/existence/trace-free-rank.tex`, `manuscript/preamble.tex`. Labels checked: `eq:ex-branch-test-properties`, `eq:ex-branch-grade-three-unit`, `eq:ex-branch-book-current`–`eq:ex-branch-book-tensor`, `eq:ex-branch-recorded-difference`, `eq:ex-branch-recorded-traces`, `prop:ex-branch-raw-fast`, `eq:ex-branch-moving-detector`, `eq:ex-branch-transport-bound`, `prop:ex-branch-washout`, `eq:ex-branch-chart-identity`, `eq:ex-branch-moment-input`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: issue [#34](https://github.com/hairer/humanise-yang-mills/issues/34), claim https://github.com/hairer/humanise-yang-mills/issues/34#issuecomment-6855003177; revision PR #140; earlier review PR #128 (findings R1, R2); this report's PR: report-only draft against `codex/existence-monograph`.
- Outcome: **no change required; R1 and R2 are resolved.** Accepted locally for the revised hunks, conditional on the same stated inputs as before (chart, recording, transport and purchase inputs). Two optional suggestions (S1, S2).

## Scope

The revised hunks (`git diff bac6004 b5d6402`, chapter lines 674–713, 748–765, 944–1028, 1051–1131), checked step by step, together with the parts of the chapter they cite (setup lines 1–175, recording paragraph 715–758). The unchanged parts of the chapter were reviewed in #128 and were not re-derived here, except where a revised statement now cites them.

## Findings and evidence

**R1 (hypotheses of the two propositions): resolved.**

- `eq:ex-branch-test-properties` states two facts. First, \(L^\sigma_d(z)\to\lambda^\sigma_d\) in operator norm: the functionals act on a finite-dimensional space, so pointwise continuity implies this. Second, \(\bigcap_\sigma\ker\lambda^\sigma_4=\{0\}\). Kernels of finite intersections form a descending chain of subspaces of a finite-dimensional space, so finitely many tests already separate, as the text says. The separation itself is still attributed to field separation of the selected hierarchy plus grid density, and is marked as a retained input. Correct.
- `eq:ex-branch-grade-three-unit` holds on a test-dependent small neighbourhood. The proof uses it only at the two endpoints \(0\) and \(n_ka_ke_d\), and \(n_ka_k=h_k\to0\), so for large \(k\) both lie in the neighbourhood. Correct.
- `eq:ex-branch-recorded-traces` makes explicit what the old prose took as exact. On the false branch, \(J^-_{aa}=0\) (setup, the \(J^-\) display). On the principal branch, \(\sum_aJ^0_{aa}=\sum_d\nabla_dQ^{[r]}_d\) (setup, after the \(\varrho_k\) definition). Applying the same linear tested correlation at grade four gives \(\sum_aT^{\sigma,-}=0\) and \(\sum_aT^{\sigma,0}=\sum_dG^\sigma_d(0)\). Both sides carry the same grade-four normalisation, which is consistent with the \(a_k^{-1}=a_k^{-4}/a_k^{-3}\) remark. Correct.
- I recomputed the proof of `prop:ex-branch-raw-fast` against the new hypothesis list.
  - (a) Moving detector: pointwise convergence on a finite-dimensional space is norm convergence. The joint limit map is injective, so it has a positive minimum \(m\) on the unit sphere, and for large \(k\), \(\max_\sigma|\Lambda^\sigma_kz|\ge(m/2)\|z\|\). This is `eq:ex-branch-moving-detector`.
  - (b) Telescoping: summing `eq:ex-branch-recorded-difference` over \(0\le j<n_k\) gives \(\sum_jG(j)=a_k^{-1}(F(n_k)-F(0))\). Both endpoint values are within \(E\) of \(L_3(0)v_{d,k}\) by `eq:ex-branch-book-current` and `eq:ex-branch-grade-three-unit`. Hence \(|\Lambda_kw|\le n_k^{-1}\sum_j|L_4(ja_ke_d)w-G(j)|+|n_k^{-1}\sum_jG(j)|\le D+2E/(a_kn_k)\), as displayed. With \(h_k\ge e^{-\tau s_k}\), the second term is \(O(e^{-(\eta-\tau)s_k})\). Only \(n_k+3\) ultrafilter-large sets are intersected at each fixed \(k\).
  - (c) False and principal traces follow from the linearity of \(\lambda^\sigma_4\), `eq:ex-branch-book-tensor`, `eq:ex-branch-book-difference` at \(j=0\) (where \(L_4(0)=\lambda_4\)), and `eq:ex-branch-recorded-traces`.

  Every input the proof uses is now among the cited labels, or in the recording paragraph those labels belong to (radius \(c_\sigma\), common ultrafilter, eventual cutoff).
- `eq:ex-branch-transport-bound` is now labelled. It is the closed-ball ultrafilter limit of the finite-volume bound at fixed \(k\) and \(v\), followed by a supremum over \(\|v\|\le1\). No infinite intersection of large sets is used. `prop:ex-branch-washout` cites it together with \(\ell_k=o(s_k)\) and the affine clock. These are exactly what the proof's step \(\widehat\beta^p_kB_kr^b_k\to0\) needs: \(\widehat\beta^p_k\|B_k\|=O(e^{\epsilon s_k})\) for every \(\epsilon>0\), and \(\|r^b_k\|=O(e^{-\eta s_k})\). The remaining steps of the washout proof are unchanged and I rechecked them:
  - the diagonal trace of the symmetry average is \(|\mathcal G|^{-1}\sum_g\mathfrak c\rho_g(y^b_k)\), because squared signs cancel and the axis maps are bijections;
  - the chart identity applied to \(x=r^b_k\) uses \(\pi R=\mathrm{id}\) and \(\mathfrak cq=q\);
  - \(\mathsf P_i\) is linear, so \(\mathsf P_i\operatorname{tr}t=\operatorname{tr}\mathsf P_it\).

**R2 (unused support file): resolved.** I took the labels defined in `ope-filtration.tex` (at PR head) and intersected them with the `\ref`/`\eqref` targets of both `trace-branch-moments.tex` and `trace-free-rank.tex`. The intersection is empty. The two-pass wrapper build without the file (below) has no undefined references and no box warnings, so the file supplied neither labels nor macros needed here. Removing it from `unit.json` and `evidence/wrapper.tex` is correct.

**Records.** The `revision-candidate.json` manifest hashes all match the PR head files (8/8, recomputed). The Lean tree at the basis is `328ad19…`, as recorded. `git diff --check bac6004 b5d6402` is clean. The PR touches no file under `Lean/`. Earlier reports and the null approval fields are unchanged.

## Suggestions (optional, not required)

- **S1.** `prop:ex-branch-washout` still cites "the stated projection equivariance" in words. It could point to the setup sentence ("The table projection intertwines these label motions…") by a label, as was done for the other inputs.
- **S2.** In `prop:ex-branch-raw-fast` the en-dash range `\eqref{…book-current}--` is followed by a source line break, which renders as "(23)– (25)" when it falls inside a line. A `~` or joining the lines avoids the stray space. Cosmetic only.

## Commands actually run

- `python3 scripts/check_blueprint.py` at the PR head: `Blueprint structure OK: 4 units.`
- `python3 -m unittest discover -s tests`: 22 tests OK.
- `python3 scripts/check_blueprint.py --fingerprint YM-000034`: `01500ca9…2ed989`.
- From `manuscript/`, twice: `pdflatex -interaction=nonstopmode -halt-on-error -jobname=issue34 -output-directory=<scratch> ../blueprint/units/YM-000034/evidence/wrapper.tex`. Both passes exited 0; the PDF has 20 pages; the log has 0 `undefined` and 0 over/underfull lines (TeX Live 2023, Debian). Pages 14–20 were rendered with `pdftoppm`. Pages 17–18, which hold both propositions' hypotheses and the raw-fast proof, were inspected visually. The hypothesis text on pages 14–20 was checked via `pdftotext`.
- Label-intersection scan and manifest hash recomputation in Python; `git diff --check`.

## Required changes and remaining uncertainty

None required. Not checked: the production of the inputs, which are hypotheses by design (finite-volume purchases, root prices, spectator estimates, chart and moment limits, column calibration); the unchanged parts of the chapter beyond what the revised statements cite (reviewed in #128); integration with the physical trace producer in #26.

## Acceptance

No acceptance is recorded by this report. A responsible human may record local mathematical acceptance at fingerprint `01500ca9…2ed989`, conditional on the listed inputs.
