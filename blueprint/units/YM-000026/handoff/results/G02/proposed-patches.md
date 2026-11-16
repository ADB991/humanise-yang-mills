# G02 proposed patches

All patches are in `proposed.patch` (unified diff against `codex/existence-monograph` @ `bac6004`;
`git apply --check` passes). None is applied in this PR. Apply as one set, or in the order
below: P1 defines `eq:shoot-slope` and `prop:shoot-public-running`, which P2–P7 cite. I1 must be
present for P1 to resolve `sec:running-coefficient` and `prop:uniform-extraction`. With the
whole set applied the monograph builds (971 pp, no warnings; see README).

| Id | File (owner) | Change | Needs |
| --- | --- | --- | --- |
| P1a | `surviving-interval-shooting.tex` (C11) | Replace "Let $s=s_G>0$" by the definition `eq:shoot-slope`: $s_G=\lambda_G=11C_G/(24\pi^2)=2b_0(G)>0$, with the reason $C_G=C_{\mathfrak g}$ (same colour form and orthonormal basis). | I1 |
| P1b | same | New paragraph after the drift explanation. It derives `eq:shoot-adjacent-drift` with $s=\lambda_G$, $\varepsilon_{i+1}=D_{i+1}$ from $\beta_i=\beta_{i+1}+\alpha_{N,i}+d_i$ (`coupling-reset-selection`) and $\lvert\alpha_{N,i}+\lambda_G\log L_i\rvert+1\le D_{i+1}$ (`background-path-convergence`), and explains why no other slope works. | — |
| P1c | same | New subsection "The public running condition". It records that the running estimate is `eq:running`, and adds Proposition `prop:shoot-public-running` with its proof (`prop:uniform-extraction` at $m=N$). | I1 |
| P2 | `common-scale-selection.tex` (C16) | "$s_G>0$" becomes "$s_G=\lambda_G=2b_0(G)>0$ … `eq:shoot-slope`; $\beta_*$ is the $\bar\beta$ of that section". | P1a |
| P3 | `rg-construction.tex` (C02) | Line 132 cites `eq:shoot-slope`. | P1a |
| P4a | `marked-portfolio-calibration.tex` (C12) | "$c_G=s_G$ … `eq:shoot-slope`". | P1a |
| P4b | `centered-geyser-scale-estimates.tex` (C02) | "$c_G=s_G$ of `eq:shoot-slope`". | P1a |
| P5a | `trace-calibration-producer.tex` (C14) | "$\kappa$ is the slope constant $s_G=2b_0(G)$ of `eq:shoot-slope`". | P1a |
| P5b | `trace-local-charge.tex` (C15) | "$\kappa=s_G>0$ … `eq:shoot-slope`". | P1a |
| P6 | `symbolic-index.tex` (G05) | Replace "The match to $s_G$ is a separate input" by the identity and its aliases. | P1a |
| P7 | `assembly.tex` (F01) | Remark `rem:ex-joint-input-running`: for a family read from the selected histories, the running condition of Input `ex-joint-input` holds with $\sigma=2b_0(G)$, by `prop:shoot-public-running`; the identification itself stays part of the input (O2). | P1c |
| I1 | `existence.tex` (F01) | `\input{pilots/running-coupling}` between `coupling-reset-selection` and `surviving-interval-shooting`. | — |
| I2 | `existence.tex` (F01) | `\bibitem{hall2000}` and `\bibitem{lebl}`, with the metadata of `manuscript/references.bib`. Reconcile with G03's `HallArxiv` key (README, G4). | — |

Not proposed, because of live claims: `argument-outline.tex` (#60) and `trace-branch-moments.tex` (#34).
See README, "For other packages".

Review note: P1b and P1c are new mathematical text (short arguments). They need an
independent mathematics review and a source-correspondence review, against
`YM.RG.History.Transfer`, `YM.Precision.Kin.kinetic`, `YM.RG.History.Running`,
`YM.Pert.Asymptotics.zeroUp_bound` and `YangMills.regular`. The other patches are
one-line notation pointers.
