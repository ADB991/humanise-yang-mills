# G02: running-coupling integration contract (author pass 1)

Issue #136 (package G02 of #26; task document `../../G02.md`). Session
`ADB991-claude-20261113-6470`, claim
https://github.com/hairer/humanise-yang-mills/issues/136#issuecomment-6854439459.
Base: `codex/existence-monograph` @ `bac6004`. Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Prepared autonomously by Claude (Anthropic) running as a scheduled agent on behalf
of @ADB991. Author draft: it needs independent review.

## Files

- `README.md`: this report.
- `ledger.md`: every manuscript name for the slope constant ($s_G$, $\lambda_G$, $c_G$, $\kappa$, $b$), classified against the source.
- `proposed.patch`: the exact LaTeX changes, as a unified diff against `bac6004` (`git apply --check` passes). Nothing in it has been applied to a chapter in this PR, as `G02.md` requires.
- `proposed-patches.md`: the patches by owner, with their purpose and their dependencies.

## Outcome

**G1. $s_G=\lambda_G=2b_0(G)$, and the manuscript itself forces this.** In the
source there is a single constant, `YM.Gauge.slopeConstant` $=11\,C/(24\pi^2)$,
with $C=$ `YM.Gauge.casimir`. Every $s_G$, $\lambda_G$, $c_G$, $\kappa$ and $b$ in the
ledger is that constant. The manuscript does not need the source to see this.
- `coupling-reset-selection.tex:59` returns the coarse coupling
  $\beta_i=\beta_{i+1}+\alpha_{N,i}+d_i$ with $|d_i|\le w\le1$.
- The path step gives $|\alpha_{N,i}+\lambda_G\log L_i|+1\le D_{i+1}$
  (`background-path-convergence.tex:80`).
- Hence $|\beta_{i+1}-\beta_i-\lambda_G\log L_i|\le D_{i+1}$. This is
  `eq:shoot-adjacent-drift` with $s=\lambda_G$ and $\varepsilon_{i+1}=D_{i+1}$.
- With any other slope $s'$ the remainder picks up $|s'-\lambda_G|\log L_i$, which no stage constant fixed before the block sides can bound.

This agrees with the source: `YM.RG.History.Transfer` and `YM.Precision.Kin.kinetic`
use the same `slopeConstant`, and the drift allowance is `(params (m+1)).drift`. C10
revision 2 (#131) gives $\lambda_G=2b_0(G)$. Patch P1 states the identity once as
`eq:shoot-slope` and writes out this derivation.

**G2. Same history and uniformity.** The shooting estimate
(`surviving-interval-shooting.tex:121–153`) is exactly the hypothesis `eq:running` of
`sec:running-coefficient`, for:
- the same coefficients $\beta_{N,p,m}$ (the level-$m$ coupling of the history selected at cutoff $N$ and period $p$);
- intercept $\bar\beta$ (`Selected.reaches`: $\beta_{N,p,0}=\bar\beta$; the term $|b-\bar\beta|$ in `eq:shoot-running-error` is $0$ on the selected run and a constant in general);
- $s_m=S_m=\log a_m^{-1}$;
- uniformity in $N\ge m$ and in $p$.

Source: `YM.RG.History.Running` is the same statement, and `YM.Pert.Asymptotics.zeroUp_bound`
consumes it. One mismatch is harmless. The shooting chapter allows $L_i\ge2$, while the
running unit asks for block factors $\ge3$. The schedule has $L_j\ge3$
(`common-scale-selection.tex`, `YM.Schedule.block_large`), and the running unit
only uses $s_m\to\infty$.

**G3. The $N=m$ specialization.** Patch P1 adds Proposition
`prop:shoot-public-running`. If the public family reads the selected run at its
finest level ($D_N=e^{S_N}$, $\beta_{N,p}=\beta_{N,p,N}$), then `ex-running-input`
holds with $\sigma=s_G=2b_0(G)$. The proof applies `prop:uniform-extraction` at
$m=N$ and does not repeat it. This is the manuscript form of `YangMills.regular`
(`Lean/HierarchyBridge.lean:17–22`). There, `wilsonFamily` sets `denominator := C.S.denominator`
and `beta := C.beta` $=\beta_{N,p,N}$, and the proof uses `zeroUp_bound … N p le_rfl`.

The hypothesis "the public family has the selected histories as its runs" is
stated in the proposition. It is not proved here. No chapter currently states
the identification $D_N=e^{S_N}$, $\beta_{N,p}=\beta_{N,p,N}$ for the public family.
In the source it is the *definition* `YangMills.wilsonFamily`. In the manuscript
it belongs to the assembly (`assembly.tex`, Input `ex-joint-input`), which is
F01's. See proposed patch P7 and open item O2.

**G4. Integration.**
- `sec:running-coefficient` (`manuscript/pilots/running-coupling.tex`) is not included in `existence.tex`, so `\ref{sec:running-coefficient}` and `prop:uniform-extraction` do not resolve there.
- Its two citations `hall2000` and `lebl` exist only in `references.bib`, and `existence.tex` uses its own `thebibliography`.
- Instruction I1 includes the pilot right after `coupling-reset-selection` and before `surviving-interval-shooting`, its first consumer.
- Instruction I2 adds the two `\bibitem`s with the metadata of `references.bib`.
- G03's proposed `verified-references.tex` lists the same Hall preprint under the key `HallArxiv`. F01 should keep one key: either rename the two `\cite` keys in the pilot, which needs renewed review of YM-000022, or keep both keys pointing to one entry.
- The G05 order (`results/G05/proposed-total-order.md`, entry 119) puts `surviving-interval-shooting` after `coupling-reset-selection`. I1 is consistent with that order.

## For other packages

- **G04 (#60, live claim of TrishenGunaratnam):** after P1, the sentence in `argument-outline.tex:209–211` ("Once $s_G$ is matched …") and item 1 of `ex-outline-open` (lines 399–402) can say that $s_G=\lambda_G=2b_0$ (`eq:shoot-slope`). The running input then follows from `prop:shoot-public-running`, conditional on the public-run identification (O2). This is not proposed as a patch, because that file is under a live claim.
- **#34 (live claim):** `trace-branch-moments.tex:501, 506` call the same constant $b$. Its owner may add "$b=s_G$".
- **G06:** G02 evidence for the running edge is this directory. The edge is closed conditionally on O2.

## Open items

- O1. None of the patches is applied. Each needs its owner, or F01, to apply it, and a renewed review of the changed chapters.
- O2. The identification of the public family with the selected run ($D_N=e^{S_N}$, $\beta_{N,p}=\beta_{N,p,N}$, same insertions) must be stated where the public family is assembled. In the source it is `YangMills.wilsonFamily`. Owner: F01, or the assembly owner.
- O3. The $\kappa$ rows (C14, C15) rely on those chapters' evidence files for the source flux limit `-slopeConstant`. They were not re-inspected here.

## Checks actually run

- Source: text inspection of every declaration in `ledger.md` at the pin, using `grep` and `sed`. No Lean elaboration was attempted, because the Mathlib hosts are blocked in this sandbox.
- `git apply --check blueprint/units/YM-000026/handoff/results/G02/proposed.patch` on `bac6004`: passes.
- Scratch build of the patched monograph (all of `proposed.patch` applied, including I1 and I2): `latexmk -g -pdf -interaction=nonstopmode -halt-on-error existence.tex` exited 0. The output has 971 pages, with no LaTeX warnings and no undefined references or citations. Pages 604 (the included running section), 607 (`eq:shoot-slope` and the drift derivation), 609 (`prop:shoot-public-running`), 961 (common-scale-selection) and 970 (remark P7) were rendered at 70 dpi and inspected.
- Fidelity: `git apply` of `proposed.patch` on a clean worktree of `bac6004` reproduces the built scratch tree byte for byte (`cmp` over every `.tex`).
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --cached --check`: clean. Blank context lines in `proposed.patch` are stored as empty lines, which `git apply` accepts.

## Base hashes of the patched files (sha256 at `bac6004`)

```
1b7f5c4e91d7a8c4c76ef066d9b25d07d79330a1c9936e18c403769d7f2492ab  manuscript/existence/surviving-interval-shooting.tex
ca52894602cabccee2b7ef55148f8e08709f79cdb1fca37fca451305c13cd195  manuscript/existence/common-scale-selection.tex
53fa34328b5558342bca7264ecf118e65759e5da8b7c0dcc9aa533971058ad48  manuscript/existence/rg-construction.tex
97869cb5f5b5b402281362734be9159e8ab6d4c5f6f9e8b9d7958979042dfc9b  manuscript/existence/marked-portfolio-calibration.tex
b5eadcf32f1106cf065ba3d08c1118c65a891b4f1e0c225cc344bbed78da5366  manuscript/existence/centered-geyser-scale-estimates.tex
404f5e4cf240f155da5ca3c65719910299a6a0aafd84fcc7568bdb3da06b1035  manuscript/existence/trace-calibration-producer.tex
8e59a151a2d294e1b0a7f6c057d8736040abc046b15822292f57c29c6d93aeb3  manuscript/existence/trace-local-charge.tex
0b69fffa8ef93450cfe36d10acaed603ca1f06c622e2b6f67995e4d3367e79b6  manuscript/existence/symbolic-index.tex
a82c6985751b1688e246597d6199ed6cec20b968a0ef97bdf5e9eab155d0dcc7  manuscript/existence/assembly.tex
08e6d49ad766e1b62ba1268e6f9ac23791b360fdb2574ef622d18b9782ea1dab  manuscript/existence.tex
105a1a28e30be0756cd37ac9f8c22c77ed82547148c086a71788865670845426  manuscript/pilots/running-coupling.tex   (included, unchanged)
```
