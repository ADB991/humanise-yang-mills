# G02 independent review (agent review, not human acceptance)

- Package: G02 (`blueprint/units/YM-000026/handoff/G02.md`), issue [#136](https://github.com/hairer/humanise-yang-mills/issues/136); parent #26.
- Reviewed: `blueprint/units/YM-000026/handoff/results/G02/` as merged by PR #138 (author commit `3aaca81`), read at `codex/existence-monograph` `ddc3c90`. Author session `ADB991-claude-20261113-6470`.
- Content fingerprint of the reviewed files (SHA-256):
  ```
  b3239665e183909b25d891abeba637c0cc141ead48e9be506ecfd75045010e17  README.md
  bb39f8ddec256abc4ee01800ac461ec5ec2f0a287fa07063828c66b54ffaf0ed  ledger.md
  fb89e44029f139e362e621dff344b328b1d4b995634925fabf7b9891fdd91e01  proposed-patches.md
  c043ab664851b0fa347a67fbf333eadc2be33a6dee262af79c0d39ba70170f13  proposed.patch
  ```
- Roles: mathematics review of the new text P1a–P1c and P7, and source-correspondence review of the ledger and of the anchors named in `proposed-patches.md`.
- Reviewer session: `hairer-claude-g02-review-20261113`, under the account `hairer`. Claim: comment of 2026-11-13 14:59 UTC on #136 (until 2026-11-14 12:00 UTC).
- Agent: Claude (Anthropic). The claim was posted by @hairer. This report was prepared by the agent and has not yet been read by @hairer.
- Independence: this account wrote no G02 file and no chapter that the patch changes.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Outcome

**Confirmed, with minor changes recommended. Nothing is required.** The identity $s_G=\lambda_G=2b_0(G)$, the drift derivation P1b, the identification of the shooting estimate with `eq:running`, and Proposition `prop:shoot-public-running` (P1c) are correct. They also match the pinned source declaration for declaration: P1b is `YM.Input.Directed.links`, the running estimate is `YM.Extension.UV.pays`, and P1c is the first component of `YangMills.regular`. The patch applies cleanly at the current branch head, and the patched monograph builds. Two sentences of P1b should be tightened (m1, m2). The open item O2 is confirmed as stated.

## What was checked, with evidence

1. **The base has not moved (confirmed).** All eleven base hashes in the G02 README equal the SHA-256 of the same files at `ddc3c90`. Since `bac6004` the branch has changed only `argument-outline.tex` (#60) and `trace-branch-moments.tex` (#34). The patch touches neither.

2. **P1a: the definition `eq:shoot-slope` (confirmed).** `annulus-two-wave-estimates.tex:66–82` defines $C_G$ through $-\operatorname{tr}(\operatorname{ad}u\,\operatorname{ad}v)=C_G\langle u,v\rangle$ with the colour form $-r_G^{-1}\operatorname{Re}\operatorname{tr}(uv)$. It also gives the averaged formula over an orthonormal colour basis. This is the definition of $C_{\mathfrak g}$ in `pilots/running-coupling.tex:24–36`, so $\lambda_G=11C_G/(24\pi^2)=2\cdot11C_{\mathfrak g}/(48\pi^2)=2b_0(G)$. Positivity of $b_0(G)$ is proved in the pilot for a nonabelian $\mathfrak g$, and this covers the simple groups of `statement.tex`. Source: `YM.Gauge.casimir` and `YM.Gauge.slopeConstant` (`Lean/YM/Gauge/Colors.lean:180–184`), with the basis `EuclideanSpace.basisFun G.ColorIndex ℝ`; `YM.Pert.Asymptotics.b0_normalizes` (`RawAxis.lean:14`) gives `2*b0 G = G.slopeConstant`.

3. **P1b: the drift derivation (confirmed; see m1, m2).** The steps check out:
   - The reset returns the coarse coupling $b(x)+d(x)=\beta_f(x)+\alpha_{N,m}+d(x)$ with $|d(x)|\le w\le1$ (`coupling-reset-selection.tex:54–60, 114–124`).
   - The path step gives $|\alpha_{N,m}+\lambda_G\log L_m|+1\le D_{m+1}$ (`background-path-convergence.tex:79–81`, item 1, applied to the history in item 2).
   - The triangle inequality then gives $|\beta_{i+1}-\beta_i-\lambda_G\log L_i|\le D_{i+1}$.
   - Signs: the fine coupling is the larger one ($\widehat\beta_i$ increases in $i$), and $\alpha\approx-\lambda_G\log L$. Both match `eq:shoot-adjacent-drift`.

   The source proves exactly this:
   - `YM.Input.Directed.Move.δ` (`Lean/YM/PCalc/Band.lean:55`) states $|u.\beta-v.\beta-\alpha_{N,m}|\le1$; the reset width in the source is exactly $1$.
   - `YM.Precision.Kin.Planned.kinetic` (`Lean/YM/PCalc/Loop.lean:110`) states $|\alpha_{N,m}+\texttt{slopeConstant}\log L_m|+1\le$ `(params (m+1)).drift`.
   - `YM.Input.Directed.links` (`Band.lean:57–63`) combines the two into the second conjunct of `YM.RG.History.Transfer` (`Lean/YM/RG/History.lean:223–227`).

   So $\varepsilon_{i+1}=D_{i+1}=$ `(params (i+1)).drift` holds in the source as well. The schedule properties that the shooting chapter assumes are stated for the same quantity: `driftSmall` (`History.lean:114`) is `eq:shoot-drift-ratio`, and `Drifting` (used in `YM.Extension.UV.bottom_gates`) gives the second inequality of `eq:shoot-adjacent-drift`.

4. **P1c: the running estimate is `eq:running` (confirmed).** The chapter constants and the pilot constants match:

   | Chapter | Pilot (`eq:running`) |
   | --- | --- |
   | intercept $\bar\beta$ | intercept $\bar\beta$ |
   | slope $s=2b_0(G)$ | slope $2b_0(G)$ |
   | $S_m=\log(a_m^{-1})$ | $s_m=\log(a_m^{-1})$, with $a_m^{-1}$ an integer product of block sides |

   - The telescoped bound `eq:shoot-running-error` is uniform in $N\ge i$ and $p$. The allowances are stage constants of the fixed schedule, independent of $N$ and $p$.
   - $|b-\bar\beta|$ is a constant: it is $0$ on the selected run (`Selected.reaches`), and at most $h$ in general.
   - The pilot asks for block factors $\ge3$, while the chapter allows $L_i\ge2$. This is harmless: the schedule has odd blocks $\ge3$ (`YM.Lattice.Schedule.block_large`, `block_odd`), and `prop:uniform-extraction` uses only $s_m\to\infty$.
   - Source: `YM.Extension.UV.pays` (`Lean/YM/Extension/UV/Shoot.lean:101–130`) proves `History.Running` from `reaches` and `Transfer`, by the same telescoping and the same $J^{-2}$ argument. `Running` (`History.lean:229–230`) is `eq:running` verbatim, with `hatBeta m = bar + slopeConstant * scale m` and `scale m = log (a m)⁻¹` (`Lean/YM/Lattice/Scale.lean:99, 115`).

5. **Proposition `prop:shoot-public-running` (confirmed).** The proof applies `prop:uniform-extraction` with $A=\bar\beta$, $c=2b_0(G)$, $s_m=S_m$, and takes $m=N$. The threshold is independent of $p$, as the quantifier order of `ex-running-input` (`statement.tex:42–47`) requires: $\sigma$ first, then $\varepsilon$, then $N_0$ uniform in $p$. The hypothesis $D_N=e^{S_N}$ makes $D_N$ a strictly increasing positive integer sequence, as `statement.tex` requires, because every $L_i\ge2$. Source correspondence:
   - `YangMills.regular` (`Lean/HierarchyBridge.lean:16–22`) takes slope `2*b0` and closes the running clause with `zeroUp_bound C h hε` at `m = N` (`hN N p le_rfl`).
   - `zeroUp_bound` (`RawAxis.lean:15–28`) is `prop:uniform-extraction` with $\varepsilon/4$ in place of $\varepsilon/2$.
   - The goal `WilsonRegularity.running` (`ChallengeSpec.lean:12–14`) is `ex-running-input`.

6. **O2, the public-run identification (confirmed as stated).** In the source the identification is definitional:
   - `YM.Family.beta N p := C.path.β N p N` is an `abbrev` (`Lean/YM/Source/Construction.lean:38`).
   - `YangMills.wilsonFamily` sets `denominator := C.S.denominator` and `beta := C.beta` (`Lean/WilsonBridge.lean:20–26`).
   - `YM.Lattice.Schedule.denominator` is the product of the blocks (`Scale.lean:39–41`).

   No chapter states this for the public family. `grep` for `beta_{N,p` outside the shooting chapter and the pilot finds only uses of $\beta_{N,p}$ as given data (`lattice.tex`, `trace-crown-buffer.tex`) and of $\beta_{N,p,k}$ in rank chapters. P7 records the identification as part of Input `ex-joint-input`, which is the right place until F01 states it in the assembly.

7. **Ledger (spot-checked, confirmed).** I opened every source anchor in the ledger's first table at the pin. Each says what the ledger says: `betaF` (`Pressure/Seeds.lean:23`), `cloak` (`Pane/Calls.lean:21`), `absoluteGeode` (`MomentumIntegral.lean:346–347`), `PertExtension.Running.slope`, `casimir_pos` and `slopeConstant_pos` (`Casimir.lean:160, 174`), and `WilsonRegularity.running`. For O3: the C14 anchor `YM.Trace.Over.transferX` exists (`Lean/YM/TraceExtension/Chart/Dray.lean:63`; namespace `YM.Trace.Over`, line 4). It states that the uncorrected flux tends to `-G.slopeConstant`, so $\kappa=s_G$ in C14 holds at the source. I did not re-inspect the C15 row. I read the 22 manuscript rows against the grep output, but did not re-derive each one.

8. **Build (confirmed).**
   - `git apply --check` of `proposed.patch` on `ddc3c90` passes, and `git apply` succeeds in a scratch worktree.
   - `latexmk -g -pdf -interaction=nonstopmode -halt-on-error existence.tex` exits 0 and produces 971 pages.
   - The log has no undefined references or citations. Its only warning is the pre-existing `amsmath` `\atopwithdelims` notice.
   - A page-by-page scan of the PDF text finds no `??`.
   - Pages 607 (`eq:shoot-slope` = (783) and the drift paragraph) and 609 (`prop:shoot-public-running`) were rendered at 80 dpi and inspected. Page 970 (remark P7) was located in the text. All are legible, and every reference resolves.

## Minor findings (recommended)

- **m1 (P1b, the "forced" sentence).** The text says that with another slope $s'$ the extra term $|s'-\lambda_G|\log L_i$ "is not bounded by a stage constant fixed before the block sides". That is the right intuition, but it is not quite an argument: the chapter itself only needs $\varepsilon_{i+1}\le\frac s4\log L_i$, which a small $|s'-\lambda_G|$ would not violate. The precise reason is `eq:shoot-drift-ratio`. Suggested replacement for the last two sentences of the new paragraph:

  ```latex
  This is the first inequality in \eqref{eq:shoot-adjacent-drift} with
  $s=\lambda_G$ and $\varepsilon_{i+1}=D_{i+1}$; the allowances $D_{i+1}$ satisfy
  \eqref{eq:shoot-drift-ratio}. No other slope is possible. If
  \eqref{eq:shoot-adjacent-drift} also held with a slope $s'$ and allowances
  $\varepsilon'_{i+1}$ satisfying \eqref{eq:shoot-drift-ratio}, the two bounds
  would give $|s'-\lambda_G|\log L_i\le\varepsilon'_{i+1}+D_{i+1}$, so that
  $|s'-\lambda_G|\le2J_{i+1}^{-2}\to0$, and hence $s'=\lambda_G$.
  ```

  `eq:shoot-drift-ratio` is stated later, in the same section, so the paragraph would make a forward reference. Alternatively, move the sentence to the end of the running-estimate subsection.

- **m2 (P1b, uniformity along the shooting interval).** The interval argument applies `eq:shoot-adjacent-drift` to every input on the parameter curve, including the endpoints $\ell_{i+1}$ and $u_{i+1}$, and not only to the selected history. P1b's bound holds there because $\alpha_{N,i}$ is fixed with the path, and the reset bound $|d(x)|\le w$ holds for every $x$ in the interval. Neither depends on the shooting parameter. Say so in one clause, for example after "with $|d_i|\le w\le1$": "; both bounds hold for every input on the parameter interval, since $\alpha_{N,i}$ is fixed with the selected path and $|d(x)|\le w$ for every $x$". In the source this is `Directed.Program.advances`, which gives `Move` for every `x ∈ Icc l u`.

- **m3 (ledger, O3).** In the C14 row, add the path `Lean/YM/TraceExtension/Chart/Dray.lean:63` for `YM.Trace.Over.transferX`. Mark that row as re-inspected (item 7), which closes O3 for C14. The C15 row remains open.

- **m4 (line numbers for G04 and #34).** The G04 pointers in the README (`argument-outline.tex:209–211, 399–402`) refer to `bac6004`. At `ddc3c90` the relevant lines are 214 and 415–416. `trace-branch-moments.tex:501, 506` still call the slope $b$ after the #34 revision.

## Incidental observation (outside G02's scope)

`trace-crown-buffer.tex:21` writes the Lean expression `A_j=C.S.a(j)` in the manuscript text, and line 25 refers to "the normalized-root convention of the source". By `AGENTS.md`, implementation names belong in the blueprint. Its owner (#33/#34 trace package) should replace these with $A_j=a_j$, the spacing at level $j$, and state the convention. This finding is not a defect of G02.

## Recommendation to the coordinator

G02 can be accepted once m1 and m2 have been applied to `proposed.patch`, by the author or by F01 when applying P1. Neither changes a statement. The patches remain unapplied (O1). Each owner, or F01, applies its row, and the changed chapters then need renewed review. The P1 text, with m1 and m2, is reviewed here, so the renewed review of C11 need only check that the applied text equals `proposed.patch`.

## Commands run

- `sha256sum` of the eleven base files at `ddc3c90`: equal to the README values.
- `git worktree add --detach /home/claude/g02-scratch ddc3c90`; `git apply --check` and then `git apply` of `proposed.patch`: success.
- In `manuscript/` of the scratch tree, `latexmk -g -pdf -interaction=nonstopmode -halt-on-error existence.tex`: exit 0, 971 pages; `grep` of the log for `undefined` and `Warning`; `pdftotext` per page for `??`; `pdftoppm -r 80 -f 607 -l 607` and `-f 609 -l 609`.
- Source inspection with `grep` and `sed` of the files named above, at the pin. No Lean elaboration was attempted.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: OK.
