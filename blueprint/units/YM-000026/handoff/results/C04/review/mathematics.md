# Review of work package C04: mathematical validity

- Unit: work package C04 "Analytic continuation and relativistic reconstruction" of unit YM-000026 (`blueprint/units/YM-000026/`), author reports in `blueprint/units/YM-000026/handoff/results/C04/`.
- Role: mathematical validity.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: four Codex `gpt-6-astra` read-only review passes by chapter group (A: complex-heat, analytic-boundary, heat-vectors; B: fourier-support, spectral-measure, boundary-detection; C: label-descent, lorentz-covariance, full-tube; D: reconstruction, locality, cross-chapter consistency and ledger), verified and synthesised by a Claude agent. Session `schmittj-codex-c04-review-20261112`.
- Content SHA-256: a package has no single unit fingerprint; the files reviewed are listed with their SHA-256 under "Manuscript files and labels". All seventeen hashes were recomputed at the end of the review and are unchanged from the start (see `validation.md`).
- Manuscript files and labels: see the list below.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (pinned upstream Lean source under `Lean/`).
- Review task and PR: issue #45; author PR #66 (merged); reviewed at branch commit `18d0327` (`18d0327ae5b19d869000209b7490e59fda09c3c2`).
- Outcome: changes requested for `locality.tex`, `reconstruction.tex`, `heat-vectors.tex` and the author's `ledger.md` (all textual; no false theorem and no invalid proof step was found). For the other eight chapters the agent review found no required mathematical change beyond the package-wide coordinate-convention sentence (M4) and the optional clarifications listed; they are "accepted locally, conditional on stated dependencies" only in the sense of this agent review. No human acceptance is recorded for any chapter.

Files reviewed (SHA-256):

- `manuscript/existence/complex-heat.tex` `f069409bffc8a10c8d2c294a32073a30a53211104f62d6da849e9e5d5579ba21` (`prop:complex-heat`, `lem:time-fixed-heat`)
- `manuscript/existence/analytic-boundary.tex` `1c282b20444bb16c68ca01001bfcc7c6871746ae88ee1fc49018e8d6168613e3` (`lem:continued-matrix`, `lem:tested-cr`, `thm:joint-boundary`)
- `manuscript/existence/fourier-support.tex` `7da33ddfdb0ce8533441e935c566a56cd251ac4bd701f1c39d20da6869f8bf12` (`lem:exponential-testing`, `prop:half-support`, `cor:cone-support`)
- `manuscript/existence/label-descent.tex` `894d899b2dc2b222c1fe52b850131c92bcb3657264fffe5a919322099fb6cb69` (`input:calibrated-actions`, `prop:lorentz-label-descent`)
- `manuscript/existence/lorentz-covariance.tex` `eca0747edec7f2b1f6b5c3b76ba2b365fa530c36433cc78acb8e6c0d6a63f592` (`prop:boost-ward`, `lem:schwartz-motion`, `thm:lorentz-covariance`)
- `manuscript/existence/full-tube.tex` `e4152d81a8059b5345a7e6a58e5d235536cb1b3fc34114e642176aee76efab9f` (`lem:tube-margin`, `prop:full-tube-holomorphic`, `prop:tube-identification`, `prop:tube-covariance`)
- `manuscript/existence/heat-vectors.tex` `31e865e455f9487d2d1c64c8fa361c799309b1e0ebf9d3c7dd6e539e2d27320e` (`lem:mixed-heat-gram`, `prop:heat-cups`)
- `manuscript/existence/reconstruction.tex` `9cf06bc780df01e8f372b2cc72c64130909b4ce3182e8fa4373414d0714a0a49` (`input:word-boundary`, `lem:cold-vectors`, `prop:word-fields`, `prop:word-locality`, `prop:word-motion`)
- `manuscript/existence/boundary-detection.tex` `b152255ca88fd6e4d3401fa74f31bd0ee98e028a1141b7714a942e777dcedf53` (`lem:tensor-tests`, `cor:word-test-inputs`, `cor:word-motion-inputs`, `lem:zero-boundary`, `prop:boundary-detection`)
- `manuscript/existence/spectral-measure.tex` `c4fc14d4b0a29c8411096e40f68fb2b332cb10aa4c04a192ed00f1e585e400d2` (`lem:paley-positive`, `thm:field-spectrum`)
- `manuscript/existence/locality.tex` `3ea90586d69437267ad7754dd936c8fe02c7da320698fcd3da1cc6c663a2d5b5` (`lem:imaginary-boost-path`, `lem:euclidean-germs`, `thm:spacelike-exchange`)
- `results/C04/README.md` `00108f4863c590e667aa3c3e9a00c327e542e0e0b3eebb11677b3bce291c5594`
- `results/C04/correspondence.md` `27f1602f2dcd60f74e4027442441c9ae4ef9a7fced9e2436b3f61894cb49bc7f`
- `results/C04/findings.md` `a0b64ab974621f9455880d3303469f10e5eadba6a7397dafe7707c68120c1006`
- `results/C04/handoff.md` `d246d8329fe0bc3db2ee220f6c4d45b0941aea8891acbfbb1cef2bb30fef7258`
- `results/C04/ledger.md` `dd56bfa09a94f4408d7095e01f4df6cf8b3a99eabaaf9fe3e04181dcd2ff4544`
- `results/C04/validation.md` `9ce6ab2bd1b871ee2c7642348b749382573e18f1e6b1822e5a69076594b8c9e7`
- Also consulted, not owned by this pass of the author: `blueprint/units/YM-000026/reconstruction-evidence.md` `432b7c0b84c8a2f6a7469b6ae395942515b2caaa5020b3b614a29ef81d02a496`.

## Findings and evidence

Status vocabulary. CONFIRMED: the synthesising agent reproduced the finding from the LaTeX and, where relevant, the Lean text. REFINED: partly right; the corrected version is stated. UNDECIDED: what would decide it is stated. "Carried over" marks parts reported by an agent reviewer and not re-verified. Reviewer labels are written as report/part/number, e.g. D-I-1. The agent reviewers' original severity labels (ERROR, GAP, INACCURACY, NIT) are quoted; the severity assigned here is the verified one.

Summary of the verification. No statement of a theorem, proposition, lemma or corollary in the eleven chapters was found false, and no proof step was found invalid. The one finding labelled ERROR on the mathematical side (D-I-1) is a sentence that is false if parsed literally and correct in its evident intended meaning; the three findings labelled GAP concern the dependency ledger and open cross-package edges, not proofs inside the chapters. The author's gap repair (`cor:word-motion-inputs`) is valid; see "The repaired gap" below.

### M1. Cutoff sentence in the locality argument is false as literally written (D-I-1, labelled ERROR). Status: REFINED; verified severity INACCURACY (wording), proof step valid.

Location: `manuscript/existence/locality.tex` lines 199–204, the paragraph preceding `thm:spacelike-exchange`.

Passage: "For arbitrary Schwartz support contained in this open set, multiply by compact cutoffs approaching one in the Schwartz topology; their supports remain in \(O_{ij}\) and continuity passes the equality to the limit."

Verified reasoning. Read literally, the sentence asserts that compactly supported cutoffs \(\chi_R\) converge to \(1\) in the Schwartz topology. That is false: \(1\notin\mathscr S\), and \(\sup|\chi_R-1|\ge1\) for every compactly supported \(\chi_R\). "Their supports remain in \(O_{ij}\)" is also false for the cutoffs themselves. What the argument needs, and what is true, is the statement about the products: for \(\chi\in C_c^\infty\) equal to one near zero and \(f_R=\chi(\cdot/R)f\), one has \(f_R\in C_c^\infty\), \(\operatorname{supp}f_R\subseteq\operatorname{supp}f\subset O_{ij}\), and \(f_R\to f\) in every Schwartz seminorm. The manuscript itself proves exactly this convergence in the proof of `prop:boost-ward` (`lorentz-covariance.tex` lines 95–99), and `full-tube.tex` line 199 uses the same construction correctly. With that reading the step is valid: the compact-support case gives \(W_{d(y),v}(f_R)=W_{\sigma d(y),v\circ\sigma}(f_R\circ\sigma)\), and both sides are continuous in the test. The pinned source uses the product form (`Lean/YM/Shift/Cut.lean` lines 44–45 and 83; quoted in `lean.md`). So the reviewer is right that the sentence is false as written and right about the repair; it is not an error in the mathematics of the exchange theorem, and the label ERROR overstates it.

Requested change: replace the sentence by, for instance, "For an arbitrary Schwartz test \(f\) with closed support in \(O_{ij}\), put \(f_R=\chi(X/R)f\) as in the proof of Proposition~\ref{prop:boost-ward}. Each \(f_R\) is smooth with compact support contained in \(\operatorname{supp}f\subset O_{ij}\), and \(f_R\to f\) in the Schwartz topology; continuity of both distributions passes the equality to the limit."

### M2. Ledger edge E4 names a producer that explicitly does not produce it (D-I-3, labelled GAP; also A-II-1 and C's cross-package note). Status: CONFIRMED as a defect of the dependency record; no chapter proof is affected.

Location: `results/C04/ledger.md` line 39 (edge E4 = "C03-to-C04-levels").

Passage: "C03 (`limits.tex`, field quotients) → analytic-boundary, label-descent, boundary-detection | Finite-dimensional field levels E_d, injective inclusions forming a directed system, union = algebraic direct limit, every union label has a finite-level representative; selected correlations compatible with inclusions".

Verified reasoning. `manuscript/existence/limits.tex` lines 285–287 state: "Field quotients and Wightman reconstruction do not follow from a subsequence argument; they are separate hypotheses or results in the hierarchy and reconstruction units." So the cited chapter disclaims the content of E4. The author's later statement on the issue that E4 should be read as a C14-to-C04 edge corrects the owner but still names no producing statement. C04 uses E4 substantively (common finite level in `cor:word-motion-inputs` and `thm:lorentz-covariance`, finite-dimensional exponentials in `locality.tex` lines 86–102, injectivity and finite-level representatives in `prop:boundary-detection`); each such use is stated as a hypothesis in the chapter concerned, so the proofs are valid conditionally. This is an unmatched input, as the ledger's own preamble allows ("Every edge below remains open"), but the producer pointer is wrong.

Requested change: in the ledger, rename the edge to its actual owner, remove the pointer to `limits.tex`, and cite the exact statement(s) that construct the level quotients, the injective inclusions, coverage of the union and compatibility of the selected correlations; record that these are the same spaces used by the calibrated actions and the involution. Until such a statement is named the edge should be marked "input; producer statement not identified". Agent reviewer A additionally points to `phase-regularity.tex`, `ex-phase-original-null` (label exists at line 69; content not re-verified here) for the original-to-selected null inclusion.

### M3. The endpoint clause "at least one smeared field is nonzero" has no recorded producer on the C04-to-C16 edge (D-I-2, labelled GAP). Status: REFINED; not a gap in any C04 proof.

Locations: `results/C04/ledger.md` line 57; `reconstruction.tex` lines 146–148 (`prop:word-locality`); `boundary-detection.tex` lines 203–211 (`prop:boundary-detection`); `manuscript/existence/statement.tex` lines 99–100.

Passages. Statement: "Every nonzero label acts nontrivially for some test, and at least one smeared field is nonzero." Reconstruction: "for every \(v\ne0\) there is an \(f\) with \(\Phi(v,f)\ne0\)."

Verified reasoning. `prop:word-locality` and `prop:boundary-detection` are correct as stated and deliver the first clause. The second clause additionally needs a nonzero union label; no C04 chapter claims it and none of the C04 inputs implies it (with \(E=\{0\}\), \(\mathcal H_E=\mathbb C\), \(W_0=1\), \(W_n=0\) for \(n>0\), all hypotheses of the reconstruction chapters hold and every field is zero). `assembly.tex` lines 91–112 (`ex-joint-input`) assumes a theory "as in Definition `ex-reconstructed`" and so does not supply it. The reviewer's observation is therefore correct, but it is a missing item in the description of an edge that the ledger already marks open, not a hole in C04. The pinned source keeps the clause separate (`Lean/ChallengeSpec.lean` line 121, field `acts`) and has a candidate producer, `YM.Table.alive` in `Lean/YM/Euclid/Null.lean` line 102 (quoted in `lean.md`; the qualified name is read off the namespace blocks of the file, not from elaboration).

Requested change: add to the ledger's outgoing edge C04-to-C16 the explicit remark that C04 supplies "every nonzero label has a nonzero smeared field" and that existence of a nonzero label (for example nonvanishing of the unit class at some level together with injectivity into the union) must be supplied by the hierarchy package. No change to the chapters is required.

### M4. Coordinate order in the C04 chapters contradicts the manuscript's declared convention (A-I-2, B-I-1, labelled INACCURACY). Status: CONFIRMED.

Locations: `complex-heat.tex` line 109 ("\(T_E(a^0,\mathbf a)=V(a^0)U(\mathbf a)\)"); `analytic-boundary.tex` line 109 ("\(X=(t_1,x_1,\ldots,t_n,x_n)\)"); `heat-vectors.tex` line 10 ("\(X_i=(t_i,x_i)\)"); `fourier-support.tex` line 12 ("\(d(y)=(y_1e_0,\ldots,y_ne_0)\)"); `spectral-measure.tex` lines 148–149 ("\(\eta=\operatorname{diag}(1,-1,-1,-1)\)"); against `statement.tex` lines 24–25: "Coordinates on \(\mathbb R^4\) are written \(x=(\boldsymbol x,t)\), with time last."

Verified reasoning. The C04 chapters consistently write time first; the statement chapter and the source (`Lean/YM/Space/Index.lean` line 20, `abbrev timeAxis : Axis := Fin.last 3`) put time last. Within C04 the usage is self-consistent, all measures involved are invariant under the coordinate permutation, and I found no sign that depends on the order (the passages I checked line by line are listed in the table below). The displayed matrix \(\eta\) is, however, not the matrix of the form \(t^2-|\boldsymbol x|^2\) in the declared coordinate order.

Requested change: one sentence at the first use (`complex-heat.tex` before line 109, or the opening of `analytic-boundary.tex`) declaring that Sections `sec:complex-heat`–`sec:locality` write points as \((t,\mathbf x)\) with index \(0\) for time, identified with \((\boldsymbol x,t)\) of `statement.tex` by the evident permutation; alternatively convert the displays.

### M5. Quantifier of the eventual translation identity in `prop:word-motion` (D-II-3, labelled NIT). Status: CONFIRMED.

Location: `reconstruction.tex` lines 180–186.

Passage: "If, for every translation \(a\), the heat vectors obey \(h_t(\tau_ab)=T_E(a)h_t(b)\) for all sufficiently small \(t>0\), then \(\mathcal VU(a)=T_E(a)\mathcal V\)."

Verified reasoning. The word \(b\) is unquantified and the threshold's dependence on \((a,b)\) is unstated. The proof ("Taking the norm limit in the stated translation identity for heat vectors proves intertwining on every word") needs only: for every \(a\) and every word \(b\) there is \(\varepsilon(a,b)>0\) with the identity for \(0<t<\varepsilon(a,b)\). That is the form in the source (`YM.Boundary.Cups.time`, quoted in `lean.md`). The application (`prop:heat-cups`) gives the identity for every \(t>0\), so nothing breaks.

Requested change: write "If for every translation \(a\) and every word \(b\) there is \(\varepsilon>0\) such that \(h_t(\tau_ab)=T_E(a)h_t(b)\) for \(0<t<\varepsilon\), then ...".

### M6. `prop:heat-cups` states its translation clause less precisely than its consumers use it (found in this synthesis; not in the four reports). Status: CONFIRMED by reading `heat-vectors.tex` lines 107–145 and `boundary-detection.tex` lines 107–109, 162–164.

Passage (`heat-vectors.tex` lines 110–111): "They also intertwine real translations of all tests with the Euclidean real-time translation representation."

Verified reasoning. `cor:word-motion-inputs` cites this proposition for "\(h_t(\tau_ab)=T_E(a)h_t(b)\) for every \(t>0\)", with \(a\in\mathbb R^4\) and \(T_E(a)=E(-ia^0)U(\mathbf a)\) the joint translation group. The proof of `prop:heat-cups` (lines 132–145) does establish exactly that, and I checked it: \(Q_{p,y}(X+a;v)=T_E(a)Q_{p,y}(X;v)\), substitution \(X\mapsto X+a\) with tests \(f_i(\cdot-a)\), bounded operator moved out of the Bochner integral. But the proposition's statement names only "the Euclidean real-time translation representation" and no parameter range, so the cited identity is in the proof, not in the statement.

Requested change: state in `prop:heat-cups`: "For every \(a\in\mathbb R^4\), every word \(b\) and every \(t>0\), \(h_t(\tau_ab)=T_E(a)h_t(b)\), where \(\tau_a\) replaces each test \(f\) by \(f(\cdot-a)\)."

### M7. Producer chains of ledger edges E3, E5, null equality and the outgoing C14 edge are imprecise (A-I-1, B-I-4, C-I-1, C-I-2, D-I-4, labelled INACCURACY). Status: CONFIRMED where checked; partly carried over.

Locations: `results/C04/ledger.md` lines 38, 40, 44, 56.

Verified by the synthesising agent. (a) E5 cites `phases.tex` for \(O(4)\) covariance, but `phases.tex` lines 119–121 read "Assume now full orthogonal covariance of the correlation table"; the chapter assumes it. (b) The outgoing edge "C04-to-C14-ward" lumps two consumers at different stages: `physical-ward-packet-prices.tex` lines 4–5 "uses spectral estimates before full rotation covariance has been proved" and lines 33–35 use the joint spectral measure with "only its Euclidean application", whereas `phase-ward-inheritance.tex` lines 174–194 applies the Lorentz, full-tube and locality arguments after the calibrated action is fixed. Read as one edge it suggests a cycle through the C14 calibration that the texts do not have. (c) The labels named by the reviewers as the actual producers exist: `ex-phase-slab-bounds` (`phase-regularity.tex` line 163), `ex-slab-laws` (`phases.tex` line 104), `ex-no-new-null` (`phase-fields.tex` line 59), `ex-individual-rotations` (`reflection-transport.tex` line 109), `ex-phase-dynamics` (`phase-regularity.tex` line 109).

Carried over (reported by the agent reviewers, not re-verified): that those statements have exactly the content needed (the selected-phase slab bound \(\|A_{\chi,d}(w)\|\le\|A_d(w)\|\), the composite C03/C14 nature of null equality, the mixed-table covariance in `physical-angular-actions.tex` lines 195–239).

Requested change: in the ledger, cite the labelled producer statements for E3 (`ex-phase-slab-bounds`, `ex-slab-laws`), split E5 into "permutation symmetry, smoothness, translation invariance, reflection relation" and "\(O(4)\) covariance with the calibrated \(R\)" with their separate producers, name `ex-no-new-null` for the null-equality edge, and split the outgoing C14 edge into its Euclidean-spectral and relativistic parts.

### M8. Ledger row for locality attributes an entire extension to `prop:lorentz-label-descent` (C-I-3, labelled INACCURACY). Status: CONFIRMED; minor.

Location: `results/C04/ledger.md` line 30: "`prop:lorentz-label-descent` (entire finite-level extension)".

Verified reasoning. `prop:lorentz-label-descent` (`label-descent.tex` lines 40–49) gives compatible real representations, their boost generators and commutation with \(J\). The entire extension \(R(z)=e^{zK}\) of a one-parameter boost group on a finite level is proved in `locality.tex` lines 86–102; I checked that argument (invertibility of \(A(a)=\int_0^aR\), \(R(t)A(a)=A(t+a)-A(t)\), \(R'=RK\), uniqueness via \(R(t)e^{-tK}\)) and it is correct. No proof is missing.

Requested change: in the ledger write "`prop:lorentz-label-descent` (compatible real action); entire one-parameter extension proved in `locality.tex`, Section 'Holomorphic germs across the tied gap'".

### M9. Williams citation: the chapter is right, the bibliography locator is not specific to it (A-I-4, labelled INACCURACY; author's O1). Status: REFINED.

Locations: `complex-heat.tex` line 12 ("\cite[Theorem 2.19]{Williams}"); `manuscript/existence.tex` lines 277–280 ("lecture notes, 14 February 2024, Theorem 2.13, pp. 29--31").

Verified reasoning. I retrieved the cited PDF (dated "14 February 2024 — 22:21" in its text) and extracted its text. Theorem 2.13 is the "Abstract Spectral Theorem" (Gelfand transform of a commutative \(C^*\)-algebra); Theorem 2.19 is "The Functional Calculus" for a normal element of a unital \(C^*\)-algebra, referred to in the notes as "Theorem 2.19 on page 34". The chapter's citation is therefore correct for its use (bounded self-adjoint operator in \(\mathcal B(\mathcal H)\)). The bibliography locator is not simply wrong: `phase-selection.tex` line 28 cites Theorem 2.13 and line 89 cites Theorems 2.17 and 2.19 of the same notes. The defect is a theorem-specific locator in a shared bibliography entry.

Requested change (shared file, not C04's to edit): remove "Theorem 2.13, pp. 29--31" from the bibitem and let each `\cite` carry its own locator. The author's observation O1 is resolved in favour of the chapter.

### M10. Clarifications of wording, all with valid underlying arguments (labelled NIT by the reviewers). Status: CONFIRMED at the quoted passages.

- B-I-2, `boundary-detection.tex` lines 29–33 (`lem:tensor-tests`): "Let \(\eta_R\) be a smooth compact frequency cutoff approaching one. Fourier inversion on Schwartz space gives \(f_R\to\chi f=f\) in Schwartz space." "Approaching one" needs to mean \(\eta_R\widehat f\to\widehat f\) in \(\mathscr S\); take \(\eta_R=\eta(\cdot/R)\) with \(\eta=1\) near zero and refer to the cutoff argument of `prop:boost-ward`. Same looseness as M1, in milder form.
- C-I-4, `full-tube.tex` lines 221–227 (`prop:tube-identification`): in \(w(a_{d(y)}h)=w(e^{-d(y)\cdot p}h)=\psi_y(\widehat h)\) the middle expression is meaningful only for compactly supported \(h\) (multiplication by \(e^{-d(y)\cdot p}\) does not preserve \(\mathscr S\)). Say that the two outer expressions are continuous on \(\mathscr S\) and that their equality extends by density.
- A-I-3, `analytic-boundary.tex` lines 167–168 (`thm:joint-boundary`): "continuously in every weakly ordered \(y\)" should name the topology: for each fixed \(f\) the scalar \(\widetilde\psi_y(f)\) is continuous in \(y\) (weak-\(*\) continuity of \(y\mapsto\widetilde\psi_y\)).
- B-I-3, `spectral-measure.tex` lines 130–131: "Uniqueness for regular measures then gives equality, by the Riesz representation theorem" should cite the uniqueness clause of the Riesz–Markov theorem for positive functionals on \(C_c(\mathbb R^4)\) with a reference, or give the two-line regularity argument.
- B-II-1 (mathematical side), `fourier-support.tex` lines 103–105 (`cor:cone-support`): "the continuous finite-dimensional label representation" should read "the label representation \(\rho\) of Section `sec:lorentz-covariance`, which preserves every finite-dimensional level and is continuous there"; the union is not finite-dimensional and carries no topology.
- Found in this synthesis, `boundary-detection.tex` lines 155–159: "The proof of Lemma~\ref{lem:schwartz-motion} used only that the pulling-back maps range over a continuous family of invertible affine maps of the position space; it applies verbatim to \(g\mapsto\widetilde g\)". I checked the proof at `lorentz-covariance.tex` lines 121–134 and the claim is true, but a proof is being reused for a statement the lemma does not make. Either state `lem:schwartz-motion` for continuous families of invertible affine maps, or argue as the source does: each \(g\mapsto P_g\varphi_j\) is continuous by the lemma (arity one) and the product map is continuous multilinear by `lem:tensor-tests`.

### The repaired gap: `eq:word-motion-input` via `cor:word-motion-inputs`

Checked line by line by the synthesising agent: `boundary-detection.tex` lines 81–179 and `reconstruction.tex` lines 161–209, against `Lean/YM/Work/C28.lean` (all 145 lines; correspondence details in `lean.md`). Verdict: the repaired proof is valid under its stated hypotheses, and the author's finding F1 (the hypothesis was previously undischarged) and F2 (the identification of involutions is a genuine same-data requirement) are both correct.

- Action on words: \(P_gP_h=P_{gh}\) and \(\rho\) a representation give a letterwise group action; correct.
- Star: \((g(v,f))^*=(J\rho(\Lambda)v,\overline{P_gf})=(\rho(\Lambda)Jv,P_g\overline f)\) uses \(J\rho=\rho J\) from `prop:lorentz-label-descent` for the same \(J\) as in the word construction; this is precisely where the identification of involutions enters. Reversal commutes with a letterwise action. Correct.
- Invariance: the product of the moved tests is the simultaneous pullback of \(F\); with \(g=(a,I)(0,\Lambda)\) one has \(P_g=P_{(a,I)}P_{(0,\Lambda)}\); translation invariance removes \(P_{(a,I)}\) and `thm:lorentz-covariance` in the form \(W_n(\rho(\Lambda)v)(P_\Lambda F)=W_n(v)(F)\) gives \(w(gd)=w(d)\). Both properties are conclusions of `thm:lorentz-covariance` (lines 146–155). Correct, including the composition order.
- Continuity: labels in one finite level, basis expansion with continuous coefficients, fixed-label distributions continuous on \(\mathscr S\), and \(g\mapsto F_g\) continuous (see the last item of M10). Correct. No topology on the union is used.
- Consumption in `prop:word-motion`: \(\|[gb]-[g_0b]\|^2=2K(b,b)-2\operatorname{Re}K(g_0b,gb)\) and \(K(g_0b,gb)=K(b,g_0^{-1}gb)\) by invariance, so the stated continuity suffices. Correct.
- The remark at lines 167–179: with \(\theta L_a\theta=-L_a\), \(\kappa L_a\kappa=L_a\) and \(\kappa\) antilinear, \(J(-iL_a)J^{-1}=\theta(iL_a)\theta=-iL_a\); \(\kappa\) alone anticommutes with \(-iL_a\). Correct.
- Remaining condition: the corollary is conditional on the hypotheses of `thm:lorentz-covariance` and on the identification \(J_d=\theta\kappa\) with the involution of `input:calibrated-actions` (ledger edge C03-C14-to-C04-involution-identity). The latter is not proved anywhere in C04 and is correctly kept as an input.

### Per-chapter table

"Agent reviewer" means the chapter-group pass by Codex `gpt-6-astra`, which reports a line-by-line reading; "synthesis" is what the Claude agent itself re-derived.

| Chapter | Checked line by line | Verdict of this agent review | Open inputs from other packages |
| --- | --- | --- | --- |
| complex-heat | Agent reviewer A: all 141 lines. Synthesis: lines 5–16, 26–31, 93–134 (functional-calculus citation, commutant and vacuum clauses, \(T_E\), `lem:time-fixed-heat`). | No defect found; M4 (convention sentence), M9 (bibliography, shared file). | E1, E2 (C03); unique heat ground space for the last clause of `lem:time-fixed-heat`. |
| analytic-boundary | Agent reviewer A: all 229 lines. Synthesis: lines 105–112, 164–180 only. | No defect found by the reviewer; M10 (topology wording). Not independently re-derived in synthesis. | E1–E5; selected-phase slab bound and padding (`ex-phase-slab-bounds`, `ex-slab-laws`). |
| fourier-support | Agent reviewer B: all 140 lines. Synthesis: lines 6–14, 50–64, 98–108 only. | No defect found by the reviewer; M10 (label-representation wording), M4. | `thm:joint-boundary`; Lorentz covariance for `cor:cone-support`. |
| label-descent | Agent reviewer C and synthesis: all 98 lines (generator intertwining, ODE uniqueness, subgroup argument, direct limit, involution). | No defect found. | `input:calibrated-actions` (C14), same \(Q_d\), inclusions of E4. |
| lorentz-covariance | Agent reviewer C and synthesis: all 209 lines (the \(c\)-continuation, \(A_\sigma\) divergence free and equal to \(\sigma\mathcal R_a\) in \((Y,x)\), sign \(K_a=-iL_a\), cutoff passage, \(A'(s)=0\), generation of the group). | No defect found. | E5 with the calibrated \(R\); `prop:lorentz-label-descent`. |
| full-tube | Agent reviewer C: all 262 lines. Synthesis: lines 196–232 only. | No defect found by the reviewer; M10 (density sentence). Not independently re-derived in synthesis. | `cor:cone-support`, `thm:lorentz-covariance`. |
| heat-vectors | Agent reviewer A: all 152 lines. Synthesis: lines 8–12 and 104–152 (`prop:heat-cups` and its translation argument). | Changes requested: M6 (statement of `prop:heat-cups`). No invalid step. | E1–E3, reflection \(J\) (C03). |
| reconstruction | Agent reviewer D and synthesis: all 216 lines. | Changes requested: M5 (quantifier). All proofs valid. | `input:word-boundary` (from `prop:heat-cups`, `cor:word-test-inputs`), `eq:word-motion-input` (from `cor:word-motion-inputs`). |
| boundary-detection | Agent reviewer B and synthesis: all 247 lines. | No invalid step; repaired gap valid; M10 (two clarifications). | `prop:tube-identification`; null equality (C03/C14); E4; involution identity; hypotheses of `thm:lorentz-covariance`. |
| spectral-measure | Agent reviewer B: all 168 lines. Synthesis: lines 121–132 and 144–156 only. | No defect found by the reviewer; M10 (Riesz citation), M4. SNAG citation not confirmed against the PDF in this review. | `prop:word-motion`, `prop:complex-heat`, unique heat (C03); L3. |
| locality | Agent reviewer D: all 232 lines. Synthesis: lines 85–232; `lem:imaginary-boost-path` (lines 1–83) not re-derived. | Changes requested: M1. The exchange theorem and its proof are otherwise valid as far as checked. | Full-tube outputs; E5 (permutation symmetry, smoothness on distinct points); E4; `prop:word-locality`. |

## Required changes and remaining uncertainty

Required before a positive mathematical review can be recorded:

1. `locality.tex` lines 199–204: correct the cutoff sentence (M1).
2. `reconstruction.tex` lines 180–186: quantify \(b\) and the threshold (M5).
3. `heat-vectors.tex` lines 107–112: put the translation identity, with its range of \(a\) and \(t\), into the statement of `prop:heat-cups` (M6).
4. One sentence declaring the time-first coordinate order used in the C04 chapters (M4).
5. `results/C04/ledger.md`: correct E4's producer (M2), record the nonzero-label requirement on C04-to-C16 (M3), cite labelled producers for E3, E5 and null equality and split the C14 outgoing edge (M7), correct the locality row (M8).

Recommended, not blocking: the clarifications of M10; the bibliography change of M9 belongs to the owner of `existence.tex`.

Remaining uncertainty and what this review did not check:

- Every theorem of the package is conditional on the incoming edges of the ledger (E1–E5, reflection \(J\), calibrated actions, involution identity, null equality, unique heat). None of the producers was reviewed here beyond confirming that the named labels exist and reading the quoted lines. E4 has no identified producer statement. The outgoing edge to C05 is unresolved (see `lean.md`, L7).
- The synthesising agent re-derived in full only label-descent, lorentz-covariance, reconstruction, boundary-detection and lines 85–232 of locality. For complex-heat, analytic-boundary, fourier-support, full-tube, heat-vectors (first 103 lines), spectral-measure and `lem:imaginary-boost-path`, the line-by-line check rests on a single agent reviewer's report; those reports state that every proof was checked and list the steps, and they contain no finding of an invalid step.
- Literature: Williams Theorem 2.19 was checked against the PDF in this synthesis. Melrose Theorem 1.3 was reported as checked against the primary chapter by agent reviewers B and D and was not re-verified. Bekka–de la Harpe–Valette Theorem D.3.1 (SNAG) was checked by reviewer B only through indexed text; reviewer D and this synthesis could not retrieve the PDF. Its exact formulation and page therefore remain unconfirmed against the primary source.
- No LaTeX build was run and no rendered page was inspected in this review; the author's build record (873 pages) was not reproduced. The earlier agent review in `reviews/draft-review.md` was not consulted.
- Finding labelled "GAP" in report B: there is none; report B states that it found no ERROR and no substantive local GAP.

## Acceptance

No human acceptance is recorded. This file is an agent review submitted under the account `schmittj`; it is not a certification of the chapters, and the responsible human reviewer has not checked the proofs. Under `docs/proof-standard.md` acceptance can be recorded only by a human reviewer after the required changes are resolved, and any material edit of a chapter changes its SHA-256 and requires renewed review of that chapter.
