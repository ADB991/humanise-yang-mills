# Review of work package C16: mathematical validity

- Unit: work package C16 "Schedule purchases and final same-witness public assembly" of unit YM-000026 (`blueprint/units/YM-000026/`), author reports in `blueprint/units/YM-000026/handoff/results/C16/`.
- Role: mathematical validity.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: one Claude Opus reviewer agent (this report), coordinated by a Claude session. Review session `schmittj-claude-c16-review-20261112`.
- Content SHA-256: listed per file in `README.md`; all seven chapter hashes agree with the author's `hashes.json` (final values) and with the coordinator's `c16-hashes.txt`.
- Manuscript files and labels: `manuscript/existence/{statement,nonlinear-payment-selection,common-scale-selection,ope-scale-purchases,ope-history-service,public-run-binding,assembly}.tex` (1,144 lines), all read in full.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #57; author PR #86 (author commit `3c2ed3b`, merged), reviewed at worktree commit `81538d6`.
- Outcome: changes requested for `ope-history-service.tex` and `public-run-binding.tex`, and (minor, imprecise hypotheses) for `assembly.tex`; `statement.tex`, `nonlinear-payment-selection.tex`, `common-scale-selection.tex`, `ope-scale-purchases.tex` accepted locally in the sense of this agent review, conditional on their stated inputs, with optional nits. No human acceptance is recorded.

Severity vocabulary: ERROR (false statement, invalid step, or statement stronger than Lean), GAP (substantive step or hypothesis missing), INACCURACY (imprecise or misleading), NIT. Every finding says whether it is in the manuscript or in the records, and whether commit `3c2ed3b` introduced it ("new") or it was already there ("pre-existing").

## Summary

No ERROR was found. No false sentence was added by `3c2ed3b`; its five manuscript changes (public regularity and boundary clauses, the order of the first-stage payment, retained profile orders, the OPE pointer, and the individual-marker/grouped-cell distinction) are correct, and the first-stage repair and the grouped-cell repair resolve real defects of the earlier text. Two GAPs remain: the many-slot application in `ope-history-service.tex` omits the occupancy and offer hypotheses of its source statement (note (b) on the issue; pre-existing), and `public-run-binding.tex` does not state several obligations that C12 and C11 later recorded as expected from C16 (these edges were posted after the author's commit). The final assembly is correctly presented as conditional: `assembly.tex` 142–152 says the article does not contain a complete existence proof.

## Findings, ordered by severity

### M1 (GAP, manuscript, pre-existing). `ope-history-service.tex` 131–152: occupancy and offer hypotheses of the many-slot application are not stated

Passage (146–149): "To apply them to several slots in each replica cell, take the finite marker set to be the product of the cell set and its slot set. The compiler of the finite-menu construction already permits every finite marker set." Line 134 sets "\(N=N_{J(m+1)}\)" without saying what \(N\) is; \(N\) then enters the price \(s_m=2(1+N)\delta_m(Ne^\alpha+1)+(1+N)\chi_m\) (171).

Verified reasoning: the source statement for arbitrary cell-by-slot marker types is `YM.MergeProof.Ribbons.ManyCopies.Unites` (`Lean/YM/OPE/Replicas/Price.lean` 18–19). For every finite cell type `V`, slot type `slotsZ`, positions `o : V × slotsZ → Site f`, weights `r` and insertions `q`, its conclusion is available only under the three hypotheses `(∀ i, 0 < r i)`, `Occupancy (S.ratio.parent ∘ o) N` and `Offer o q r R.p.B d c'`, i.e. a bound \(N\) on the parent occupancy of the full product marker set and the offer bound on that full product set. The application on the selected history, `YM.PhysicalNext.Repeat.Legato.Bandage.sewedN` (`Lean/YM/OPE/Replicas/Sponsor.lean` 44–48), supplies `Unites` with the parameter `Q ((P!).J (m+1))`, i.e. the purchased occupancy bound \(N_{J(m+1)}\); the hypotheses are still those of `Unites`. The chapter never states that the marker positions must have total parent occupancy at most \(N\), nor that the offer bound is required on the product set. "Permits every finite marker set" is true only under these two hypotheses. Note (b) on #57 is therefore confirmed. The author's commit did not touch this passage, and the ledger entry H3 repeats the omission (see R2).

Requested change: define \(N_j\) as the purchased bound on the total parent occupancy, and state that the many-slot estimate applies to a finite cell-by-slot marker set whose positions have total parent occupancy at most \(N_{J(m+1)}\) and which satisfies the offer bound (with the stated exponents and allowances) on the full product set; name the producer chapter (C02 `sec:finite-menu-history-handoff`) for these hypotheses.

### M2 (GAP, manuscript, pre-existing; the incoming edges postdate `3c2ed3b`). `public-run-binding.tex` 13–56 and `common-scale-selection.tex` 173–194: obligations expected by C12 and C11 are not stated

The C12 handoff (`results/C12/handoff.md` 18; `part-B/ledger.md` 28, 31; `part-B/findings.md` 65) lists edge `C16-to-C12-selected-run` with four obligations, plus the fee-delay edge. The C11 ledger (`part-B/ledger.md` 40; `part-B/findings.md` 61, C6) expects from C16 the drift ratio, three loop-capacity inequalities and the inclusion of startup thresholds and the cubic gate among the stage entry requirements. Both handoffs were committed after the author's commit (`0f9f7ca` and `05112f0` are later than `3c2ed3b`), so the author could not have answered them. Status found here:

| Obligation | Where stated in C16 chapters | Status |
| --- | --- | --- |
| C12 (a) portfolio sections and regradings are those chosen before the schedule | not found; `public-run-binding.tex` 21–23 retains \(K,\pi_j,P\) and 80–82 evaluates the continuation at the "local sections ... stored in \(R\)", without saying they precede the schedule | not stated |
| C12 (b) `paper` thresholds at most the floor lengths | not found; 47–48 says component floors are at most \(n_{J(m+1)}\le L_{J(m+1)}\), which is a different statement | not stated |
| C12 (c) `dusk` for the run's delay | not found; 53 ("The other payment supplies the flat-step delay") is the nearest sentence and does not identify it | not stated |
| C12 (d) \(d+3\le J(t_d)\) | `ope-history-service.tex` 191–192 ("retain the reference level \(t_d\) with \(d+3\le J(t_d)\)"); existence follows from \(J\to\infty\) (`common-scale-selection.tex` 21, 44) but is not said there | stated |
| C12 fee delay among the entrance thresholds | only generically: `common-scale-selection.tex` 189–192 ("every other selected finite-stage threshold before constructing \(J\) and \(\widehat\beta\)") | partially stated |
| C11 drift ratio \(\varepsilon_{i+1}/\log L_i\le\min(s/4,J_{i+1}^{-2})\) | not found (`grep` for drift/loop/capacit over the seven chapters: no hit) | not stated |
| C11 loop capacities | not found | not stated |
| C11 entry thresholds (startup thresholds, cubic gate) | only generically, as above | partially stated |

In the source, the drift condition is the field `driftSmall := fun m => (w.large (A.J (m+1))).slow (hj _)` of `Fits` in `YM.RG.Supply.Wait.ready` (`Lean/YM/Price/Waits.lean`), i.e. a property of the block lengths, so it belongs with the block-length floors of `common-scale-selection.tex` 173–182 or `public-run-binding.tex` 18–22.

Requested change: state each of these as a named condition at the place where it is purchased (block-length floors, entrance thresholds or retained run data), or record them as explicit open inputs with the producing package, and update `ledger.md`.

### M3 (INACCURACY, manuscript, pre-existing). `assembly.tex` 72–89, `ex-full-mesh`: hypotheses used in the proof are not in the statement

The statement assumes "\(W_{u(j),p}\to w_p\)" without saying for which \(p\), and concludes "the same volume limit \(s\) holds with the full mesh limits"; the proof uses "Suitability holds eventually on the volume sequence" (86–87), which is not a hypothesis. Since \(\ell_p\) is defined only at suitable \(p\), the conclusion \(\ell_{p(q(k))}\to s\) needs eventual suitability of \(p(q(k))\). With "at every suitable period \(p\)" added to the second hypothesis and "\(p(q(k))\) is suitable for all large \(k\)" added, the proof is correct (the argument \(u(j)\ge j\), uniqueness of limits, eventual agreement of the two row-limit sequences). The lemma is explanatory: `ex-conditional-existence` uses item 1 of the Input directly and does not invoke it.

Requested change: add the two hypotheses.

### M4 (INACCURACY, manuscript, pre-existing). `assembly.tex` 96–117, `ex-joint-input`: the graded-field and phase-data conditions are referenced only through Definition `ex-reconstructed`

The Input supplies "one set of graded fields, phase data, correlations and selected relativistic theory as in Definition~\ref{ex-reconstructed}". The conditions on the graded fields (injectivity of each \(\mathcal F_d\to\) labels, every label represented at some grade, tokens onto \(\coprod_d\mathcal F_d\)) and on the phase data (compact metric space, probability measure of full support) are stated in `statement.tex` 63–73, not in the definition. Item 2 lists only smoothness, symmetry, continuity and mixture. Proposition `ex-conditional-existence` claims "the full existence target", which needs those conditions. A reader will probably understand "graded fields, phase data" as in Section `ex-statement`, so this is imprecise rather than wrong.

Requested change: refer to "the limiting data described in Section~\ref{ex-statement}, with the selected theory of Definition~\ref{ex-reconstructed}".

### M5 (NIT, manuscript, pre-existing). `public-run-binding.tex` 34: "\(1\le1+\log\log\widehat\beta_m\) for all \(m\)"

This requires \(\widehat\beta_m\ge e\), whereas `common-scale-selection.tex` 55–56 only gives \(\beta_*>1\). It does hold on the public run: the countable purchase includes \(\exp(\exp E_j)\) with \(E_j\ge1\) in every \(d_j\) (`common-scale-selection.tex` 145), so \(\beta_*\ge d_{j_*}\ge e^e\). (In the source, `Bar.exists_above` also takes \(\beta_*\ge2\).) Requested change: add the reason.

### M6 (NIT, manuscript, pre-existing). Notation \(s_G\) versus \(c_G\)

`common-scale-selection.tex` 60 writes \(\widehat\beta_m=\beta_*+s_Gs_m\); `ope-scale-purchases.tex` 21 and 103 write \(y=x+c_G\log L\) and \(\widehat\beta_m=\beta_*+c_G\log a_m^{-1}\). Since \(s_m=\log a_m^{-1}\) these agree with \(c_G=s_G\) (the slope constant `G.slopeConstant` in `Wait.ready`). Requested change: use one symbol.

### M7 (NIT, manuscript, pre-existing). `ope-scale-purchases.tex` 88–90: "enlarge the existing entrance delay by their running maxima"

After `3c2ed3b`, `common-scale-selection.tex` 54–56 makes \(d_j\) the final threshold, fixed before \(\beta_*\). The sentence here is consistent with that (the chapter's opening, 4–6, places these purchases "before the scale sequence is realized"), but "delay" and "running maxima" are not the vocabulary of `common-scale-selection.tex`, and a running maximum over \(j\) is not needed. Requested change: say "include these thresholds in the final entry thresholds \(d_j\) before \(\beta_*\) is chosen".

### M8 (NIT, manuscript, new). `statement.tex` 129–131: pointer for integrability

"their integrability must be supplied by the analytic estimates, as in Theorem~\ref{thm:joint-boundary}". The absolute convergence of the tested integrals at positive heights is `lem:tested-cr` (`analytic-boundary.tex` 116–127), on which `thm:joint-boundary` rests. Also, `analytic-boundary.tex` writes the continuation as \(F_n(t+iy,x;v)\) in its own coordinates; identifying it with the public continuation is the open C04 join that the author records (F6). The sentence is not wrong. Requested change (optional): cite `lem:tested-cr` together with `thm:joint-boundary`.

### M9 (NIT, manuscript, new and pre-existing). `statement.tex` 155–161: what the target ties to the Wilson measure

What is said is accurate: the lattice measure enters through the mixed correlations being the Wilson limits (78), only the selected point carries a reconstructed theory (81–83), and no lattice formula for the insertions and no stress-tensor identification is part of the target (158–161). Nothing in `statement.tex` or `assembly.tex` suggests that the public statement alone certifies the lattice origin of the selected theory, and nothing suggests a defect in the Lean proof or in `constructed`. However the sentence "The target concerns a theory of the constructed gauge-invariant observables" (156–157), true in the sense that tokens label the fields, could be read as more than that. G01 P6 proposed the definitional observation "the lattice measure enters the target only through the mixed correlations"; this follows from the definitions alone (`wilsonLaw` occurs only in `finiteMoment`, hence only in `Converges`, which is applied to `correlation none`), without relying on G01's unreviewed constant-insertion theorem. Requested change (optional): add that sentence after 157.

## Checks with a positive outcome

### `statement.tex` (changed by `3c2ed3b`)

Compared clause by clause with `YangMills.JointExistence` and its definitions (details in `lean.md`). The new regularity paragraph (35–41) is exactly `WilsonRegularity`: continuity, invariance under every lattice gauge transformation, a finite stencil per token independent of \(N,p,x\) with dependence only on links with both endpoints in the translated stencil reduced mod \(P_pD_N\), and the running condition counted as the fourth condition. The boundary display (117–126) has the product test, the positive imaginary shifts \(t_j+i\epsilon h_j\) with strictly increasing \(h\), the limit \(\epsilon\downarrow0\), and the operator order \(\langle\Omega,\Phi(A_1,f_1)\cdots\Phi(A_n,f_n)\Omega\rangle\), all as in `Reconstructed.boundary`, `complexShift`, `tensorTest` and `FieldSystem.vacuumExpectation` (the word is built with the first letter outermost). The convention sentence (127–129) is the Bochner convention (value zero for a non-integrable integrand) and correctly says that no integrability is required by the target. The new phase paragraph (81–85) is correct: only `selected` enters `root`/`boundary`; other points of `Character` carry only `permutation`, `smooth`, `characterContinuity`, `mixture` and the OPE `remainder` (which quantifies over every `s : Option Character`); `correlation` is a bare function of tags, so multilinearity is not part of the target. The group hypotheses (16–24) are exactly `GaugeGroup` and `IsSimple`; nothing more (connectedness, irreducibility) is assumed. No sentence claims or suggests a mass gap (`grep` for gap/free/mass over the seven chapters: no hit apart from "mass-shell" in `assembly.tex`).

### `nonlinear-payment-selection.tex` (unchanged)

All arithmetic re-derived: \(\kappa=CP_f^2/2\) gives \(e^\kappa a\le D_0\tau_C\), \(I\le1\) eventually, and \(e^{-\kappa}(e^I-1)\le\tau_C(e-1)I\le2\tau_C\); \(h_{\rm hit}\le[2(A+1)+C_{\rm pair}/2]t\) from \(H\le t^2\le t\); the footprint comparison \((2B+1)^4\le3^4(1+B)^4\) and \((8B+5)^4\le13^4(1+B)^4\) gives exactly the radius-one values times \((1+B)^4\); \(H(x)\le x^{-1}\le t(x)^2\) for \(x>1\); the logarithmic comparison with \(\beta_f^{-1/4}\); and the two successive payments \(2e^{-\mu P_f^2/8}\) (with \(C=\mu/4,D_0=1\)) and \(2e^{-\mu P_f^2/16}\) (with \(C=\mu/8,D_0=2\)), at the same \(x\). The threshold-enlargement argument \eqref{eq:nonlinear-entry-max} is correct. The analytic inputs (monitor estimate, footprint sums, marked construction) are stated as inputs.

### `common-scale-selection.tex` (changed by `3c2ed3b`)

Re-derived: the recursion gives \(A_1\ge3\), so \(J_0(0)=J_0(1)=0\); the increment and divergence; \(b_j\le m\) when \(J_0(m+1)=j>0\); the plateau lies in \([A_j,A_{j+1})\); \(m\log3\le s_m\le m\log L_{J(m)}\); the window choice (integer windows give \(\le\lfloor k/2\rfloor\)); the first-plateau volume payment by \(M\); \(P_p=4(M+p+1)\) with \(p=c(M+z+1)-(M+1)\ge z\) giving \(P_p=4c(M+z+1)\); the vanishing relative increment; \eqref{eq:common-countable-payment} and \eqref{eq:common-allstage-payment}.

Order of choices. After `3c2ed3b` the order is: stage profiles, kernel, row prices and widths; block-length floors; \(L_j\); all post-length costs, countable requests, nonlinear and OPE thresholds folded into the final \(d_j\) (`common-scale-selection.tex` 54–55, 145–146, 162–163, 189–192; `nonlinear-payment-selection.tex` 147–151; `ope-scale-purchases.tex` 4–6; `ope-history-service.tex` 194–195); then \(\beta_*\ge d_{j_*}\); then \(b_j,c_j\), \(J_0\), and \(M\) and the periods. No threshold folded into \(d_j\) depends on \(\beta_*\): those that do depend on it (the scale entry \(e_j(\beta_*)\), \(V_j\) through \(B(s)\)) are paid by \(b_j\) and \(M\), which are chosen after \(\beta_*\). The author's claim that all finite threshold enlargements precede the choice of the initial coupling is therefore correct for the text as revised. The repair is real: before `3c2ed3b`, \(\beta_*\) was chosen "to meet the first-stage entry requirement" and \(d_j\) was raised afterwards, so the all-stage payment at the first plateau was not justified by the text. The scale-entry and positive-scale requirements are imposed only after the first plateau (95–97), which matches the source (`Wait.ready` proves the scale entry only under `p.first < A.J (m+1)`).

### `ope-scale-purchases.tex` (unchanged)

(O1)–(O9) re-derived: \(B(y)\le2B(x)\) eventually and \(H_L=O((1+\log x)^{16})\); (O5) from \(z\ge\max(1,B_i,2D_G+1)\); the identification \(L=L_{J(m+1)}\), \(y=\widehat\beta_{m+1}=\widehat\beta_m+c_G\log L_{J(m+1)}\); (O7), (O8); (O9) from the first index \(k\) with \(a_k\le ra_i\). Purchases for every \(i\le j\) cover \(i=J(m)\le J(m+1)=j\). Correct, subject to M6 and M7.

### `ope-history-service.tex` (changed by `3c2ed3b`)

Note (a) on #57 is resolved. Lines 153–161 now distinguish the individual-marker coefficient before grouping (the sum of derivatives through \(\mathcal D\)) from the grouped singleton-cell coefficient (the old coefficient at the cell's full slot set). This matches `YM.MergeProof.Ribbons.Fibers.reap` (`Lean/YM/OPE/Grouping/Fibers.lean` 42–45: the new coefficient at \(s\) is `p.part (L.plena s)`, and `plena` of a singleton is the full fiber `contents v`) and the `fire j` clause of `ManyCopies.Unites`, indexed by individual markers. The example is correct in the algebra of `ope-grouping-algebra.tex` 12 (\(e_Ae_B=e_{A\cup B}\) for disjoint sets, zero otherwise): \(\exp(z_1e_{\{1\}}+z_2e_{\{2\}})=(1+z_1e_{\{1\}})(1+z_2e_{\{2\}})\) has coefficient \(z_1z_2\) at \(e_{\{1,2\}}\). No later sentence of the chapter uses the old, ambiguous reading. Also re-derived: the compression of countable sums into reserved slots at price \(2A\); \(2(p_M+E_*m)+2q_M\le(2+2L)m\le6Lm\) for \(L\ge1\); the degree-zero payments imply \eqref{eq:ope-elementary-compression-bills} since \(c_0\le1\), \(\kappa\le1\). M1 remains.

### `public-run-binding.tex` (changed by `3c2ed3b`)

The change from "order at least \(j\), power at least \(j\)" to "\(6+j\)" and "\(2+j\)" makes the chapter consistent with `ope-scale-purchases.tex` 8–10; the earlier text was weaker, not wrong. The two kinds of payment (countable, eventual in \(m\) for fixed \(E\); all-stage at every \(m\ge0\)) are correctly distinguished. The second-refinement argument (limits survive passage to a subsequence) is correct. M2 and M5 remain.

### `assembly.tex` (changed by `3c2ed3b`)

The OPE paragraph (10–40) matches `OperatorProductExpansion` (cluster and spectator geometry, coefficient independent of the phase, threshold uniform in positions and in \(s\), dependent on \(D,M,\eta,c,\epsilon\) and the fields). The new pointer (41–45) cites the correct theorem: `thm:ope-quantitative` (`ope-estimates.tex` 178) states the same two bounds with the same uniformities, conditional on `input:ope-raw-estimates` and the standing assumptions including `eq:ope-mixed-covariance`, and the added text says its hypotheses must hold for the hierarchy used. The trace paragraph (47–63) matches `TraceTest`: \(T(r)\) is the selected two-point function at \((\mathbf0,\mp r/2)\), time last; centred means vanishing vacuum one-point functional; the limit \(3\dim_{\mathbb R}\mathfrak g/\pi^4>0\); exclusion of finite combinations of mass-shell tracks on an interval \((0,\delta)\), which is what `thm:profile-exclusion` proves from the asymptotic. The trace clause is described as exactly this two-point short-distance test; no "non-free" or mass-gap claim is made. Proposition `ex-conditional-existence` is a correct conditional projection: one family chosen per group before \(p\), then for every strictly increasing \(p\) the order \((\mathrm{id},p)\), the returned \(q\) and one hierarchy, with full-mesh row limits from item 1. The section ends (142–152) by saying that the article does not contain a complete existence proof until the Input is established. Subject to M3 and M4.

## Per-chapter table

| Chapter | Changed by `3c2ed3b` | Findings | Outcome |
| --- | --- | --- | --- |
| `statement.tex` | yes (+40/−6) | M8, M9 (nits) | accepted locally; optional nits |
| `nonlinear-payment-selection.tex` | no | none | accepted locally, conditional on the stated analytic inputs |
| `common-scale-selection.tex` | yes | M6 (nit); part of M2 | accepted locally, conditional; the M2 floors to be added |
| `ope-scale-purchases.tex` | no | M6, M7 (nits) | accepted locally, conditional |
| `ope-history-service.tex` | yes | M1 (gap); note (a) resolved | changes requested |
| `public-run-binding.tex` | yes | M2 (gap), M5 (nit) | changes requested |
| `assembly.tex` | yes | M3, M4 (inaccuracies) | changes requested (minor); correct as a conditional assembly |

## Premises consumed by `assembly.tex`

Every label was located with `grep -rn '\\label{...}' manuscript/existence/`.

| Premise as used | Producer label and file | Owning package | Status |
| --- | --- | --- | --- |
| Public target, regularity, running condition, row and volume limits, mixture, selected theory | `ex-statement`, `ex-running-input`, `ex-row-target`, `ex-volume-target`, `ex-mixture`, `ex-reconstructed` (`statement.tex`) | C16 | definitions; checked against Lean (see `lean.md`) |
| OPE coefficient and remainder bounds on the same hierarchy | `thm:ope-quantitative` (`ope-estimates.tex` 178) | C05 | conditional on `input:ope-raw-estimates` and the standing assumptions incl. `eq:ope-mixed-covariance`; C05 ledger edge `C05-to-C16-ope-endpoint`: statements match; C05 reports matched-field inputs open |
| Finite-profile exclusion from the asymptotic | `thm:profile-exclusion` (`trace-profiles.tex` 219), `sec:trace-profiles` | C15 | proved in its chapter (pure real analysis given \(A>0\)); not re-reviewed here; no C15 results directory at this commit |
| Trace asymptotic | `thm:trace-asymptotic` (`trace-asymptotic.tex` 247) | C15 | conditional on `input:trace-scales`; assembly says the estimates "remain necessary" |
| Integrability convention pointer (statement) | `thm:joint-boundary` (`analytic-boundary.tex` 166), `lem:tested-cr` (116) | C04 | proved in its chapter from `lem:continued-matrix` and the slab bound; the identification with the public continuation is an open C04 join |
| Full mesh identification | `ex-full-mesh` (`assembly.tex` 72) | C16 | proved, with M3 |
| Joint construction input (all three items) | `ex-joint-input` (`assembly.tex` 96) | C16 assumption; producers C03 (full mesh), C04 (reconstruction), C05 (OPE), C14 (Ward/stress), C15 (trace), C11/G02 (running), C12 (funded run) per `results/C16/ledger.md` | open input; the assembly does not claim it |
| Euclidean Hilbert space remark | `ex-reflection` (`reflection.tex` 2) | C03 | cited in a remark only |
| The conditional assembly | `ex-conditional-existence` (`assembly.tex` 119) | C16 | proved from the Input (M4) |

## G01 patches P1–P7

| Patch | Taken up? | Where | Faithful to Lean? |
| --- | --- | --- | --- |
| P1 define "regular" | yes, reworded | `statement.tex` 35–41 | yes; the gauge transformation is named, not written out (acceptable) |
| P2 group hypotheses | not adopted | `statement.tex` 16–24 unchanged | the existing text is exact (`IsSimple`); it does not assume connectedness or irreducibility; P2 was optional; the records do not say it was declined |
| P3 locality | yes | `statement.tex` 37–40 | yes, exactly `localSupport` (both endpoints, reduction mod \(P_pD_N\)) |
| P4 boundary values | yes, option (i) plus a pointer | `statement.tex` 115–131 | yes: product test, positive shifts \(t_j+i\epsilon h_j\), \(h\) strictly increasing, operator order, Bochner convention, no integrability field |
| P5 characters | yes in substance | `statement.tex` 81–85 | yes; the unverified sentence about the construction was rightly omitted |
| P6 scope | partly | `statement.tex` 158–161 | the adopted sentences are accurate; not adopted: no-gap spectral sentence, trace-test scope, unspecified slope, "lattice measure enters only through the mixed correlations" (M9). None of the omissions makes a sentence false |
| P7 forward pointer to penalty 1 | not in `statement.tex` | `assembly.tex` 125 ("choose \(b=1\)") | the content is present in the assembly proof; acceptable |

## Notes from other contributors

(a) Ambiguous singleton sentence (`ope-history-service.tex` 150–155 before the commit): resolved by `3c2ed3b`, correctly (see above). (b) Occupancy bound \(N\) and offer bound on the full product set: not explicit; confirmed as M1.

## Records (author's report directory)

- R1 (INACCURACY, records, new). `ledger.md`, edge `C16-to-C12-selected-run`, and `handoff.md` do not list the C12 obligations (a)–(c), the fee delay or the C11 items of M2. These edges postdate the author's commit; the ledger should be updated when M2 is answered.
- R2 (INACCURACY, records, new). `ledger.md` H3 ("Arbitrary finite slot sets on cell x slot ...") omits the occupancy and offer hypotheses (same defect as M1).
- R3 (NIT, records, new). `correspondence.md` (F7 follow-up) cites the pair-version `YM.MergeProof.Ribbons.Unites` (`Lean/YM/MergeProof/North/Price.lean` 21) for the singleton `fire j` clause. The cell-by-slot statement is `YM.MergeProof.Ribbons.ManyCopies.Unites` (`Lean/YM/OPE/Replicas/Price.lean` 18); both have the same clause and hypotheses, so the conclusion is unaffected.
- R4 (NIT, records, new). `findings.md` F1 does not record the disposition of P2 and P7.
- Confirmed claims: F1 (P1, P3, P4, P5, core of P6), F2 (order; matches `Bar.exists_above`, `Wait.ready`, `NativePostLengthPayment.eventuallyPaid`), F4, F5 (local arguments), F7. F3's statement that the source's starting `Orders` has the values \(6+j\), \(2+j\) was not checked (see below). F6 correctly lists the joins as open.

## Not checked

The analytic content of every producer outside C16 (C02, C03, C04, C05, C08, C11, C12, C14, C15) beyond the cited statements; the proofs of `thm:joint-boundary`, `thm:trace-asymptotic`, `thm:profile-exclusion`; the Lean counterparts of (O1)–(O9) (`YM/OPE/Rough/Gate.lean`) and of the nonlinear payments (`Mallow/Stove.lean`, `Eco.lean`), which were not opened; F3's claim about `Orders` in `NativePreselectedPostnumericPeriodClock.lean`; the meaning of the source names `paper` and `dusk` in the C12 obligations; any LaTeX build or rendered page; any Lean elaboration or axiom query; the live issue and PR discussion beyond the notes relayed in the task.
