# C14 revision 1 (parts A, B, C): renewed review

- Unit: YM-000026, package C14, issue #55. Reviewer session `schmittj-claude-c14-rereview-20261113`; the reviewer wrote the review these revisions answer (PR #117) and no C14 chapter.
- Reviewed content: the changed hunks of commits `20df4b0` (part A, PR #130), `8aeb001` (part B, PR #129) and `6770728` (part C, PR #133) and their response tables `results/C14/revision-1.md`, `revision-1b.md`, `revision-1c.md`, at `codex/existence-monograph` `497fa89`. SHA-256 of the thirteen revised chapters at that commit are at the end.
- Method: one read-only GPT-6 Astra pass per part over every changed hunk (the revisions were written with Claude agents), instructed to re-derive each new computation and to open every cited declaration; then the coordinating Claude session re-read the manuscript passage and the Lean declarations behind each item numbered below before reporting it. Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Outcome: **most of the review is answered correctly; four changes requested, one of them an error that our own review caused.** No Lean elaboration and no LaTeX build was run for this renewed review. Agent review, no human acceptance.

## Requested changes

**1. `trace-calibration-producer.tex` 106–125: the kernel identity holds only eventually (error; caused by finding F5 of part 4 of our review, which is hereby withdrawn).** The revised text says that positivity of \(b_i\) and invertibility of \(U_{i,5}\) "hold at every scale \(i\)" and concludes \(O_iT=0\Leftrightarrow DT=0\) "for every tensor \(T\) and every scale \(i\)". Our review asked for exactly this wording, and it was wrong. In the source, `YM.Trace.Shelves.Optics` (`Lean/YM/TraceExtension/Shelves/Lore.lean` 40–44) is defined by cases on `Coherent H₂.spin H₁.spin 5 (J.U i 5)` and **is the zero map when coherence fails**; `Optics_pay` (46–48) identifies it with \(b_i\,U_{i,5}^{-1}\circ D\) only for the eventual set given by `hq'.units 5`, and `aprilA` (51–55) is `∀ᶠ i in atTop, ∀ B, Optics … i B = 0 ↔ nabla S₁ B.val = 0`. At an index where the chart is not coherent, \(O_i=0\) and the equivalence fails for any \(T\) with \(DT\ne0\). The original word "cofinal" was also not right. Requested: state the displayed formula and the kernel identity for all sufficiently large \(i\) (uniformly in \(T\)), and say that the optical map is totalised by zero at the finitely many other indices. The author's response row for part 4 F5 describes the edit accurately; the fault is in the request.

**2. `actual-stress-shell-nodes.tex` 429–435 against 440–446 and 465–479: quantifier order of the chamber hypothesis (gap; not closed by parts B and C).** The hypothesis reads "for each fixed opened pair \((p_0,k)\), labels \(B,T\), cover anchor \(x\) and extraction order \(\mathfrak f\), for all sufficiently large \(m\) …", which allows the threshold in \(m\) to depend on \(x\). The conclusion, and the proof at 465–479, fix \(m_0\) first and then take any cover anchor in the collar at level \(m\ge m_0\). The collar changes with \(m\) and its radius in anchor coordinates grows, so finiteness of each collar does not exchange the quantifiers. The source has the uniform form: `YM.MergeProof.Ribbons.near_center` (`Lean/YM/MergeProof/North/Cent.lean` 47) is `∀ᶠ N in atTop, ∀ (h : J ≤ N) p (a : Site …), 8*‖place a‖ ≤ a J → ∀ v, Interior (chamber) (O N p v a)`, with the eventual quantifier in front of all sites and labels, and `bricks` (`North/Brim.lean`) feeds it the collar bound \(8\lVert\operatorname{place}(x)\rVert\le32r_m\le a_{p_0}\). Requested: state the chamber receipt as "there is \(m_0\) such that for every \(m\ge m_0\) and every cover anchor in the level-\(m\) collar …" (the late event in \((N,q)\) may still depend on the anchor), or include the `near_center` argument. Until then the sentence in `actual-stress-annulus.tex` 163–169 that the shell-node proposition supplies the receipt, and the corresponding row of `revision-1b.md`, remain conditional on this point. Everything else in finding 1 of our review is repaired: the opening lemma (`lem:ex-lattice-opening-exists`) is correct and matches `YM.Stock.Tabs.mayOpen`; the opening is now chosen per family; the uniqueness argument over enlarged families is valid.

**3. `trace-firesky-gallery.tex` 233: the decomposed object (inaccuracy; part A).** "the \(r_i^4\)-rescaled transformed energy tensor equals \(e_i\,1+d_i\,(4\mathcal O)\)". The object decomposed is the centred scalar trace, not the energy tensor: `YM.TraceExtension.theta T J : S.Field 4 := centerIn S T (stressTrace J)` (`Lean/YM/TraceExtension/Centered.lean` 64), and the manuscript's own `trace-scribe-producer.tex` writes \(r_i^4U_i^{-1}\Theta_T=\iota(e_i,d_i)\). Replace by "centred trace of the energy tensor" and display \(\Theta_T\). The other corrections of this paragraph (weighted limits \(b_id_i\to d_2\), \(b_ie_i\to0\); zoomed limit \(4d_2\mathcal O\); table hypotheses) are right.

**4. `physical-ward-propagation.tex` 35–38: a false reason (inaccuracy; part C).** "Because the orbital term contains \(Kx_i\), the expression is not translation invariant, so this is weaker than the identity on all lines parallel to an axis." Under the chapter's standing hypotheses the expression is translation invariant: for a common shift \(h\), \(\mathcal A_K(q;x+h)-\mathcal A_K(q;x)=\sum_b(Kh)_b\sum_i\partial_{x_{i,b}}S(q;x)=0\) by translation invariance of the correlations. The axis definition itself is the source's (`YM.Ward.onLine`, `Collinear`) and should stay; delete the reason, in the text and in `revision-1c.md` (row P2 I5).

## Smaller points

- `physical-ward-propagation.tex` 952–966 against 879–888 (part B): the new lemma gives covariance under signed permutation matrices; `lem:ward-brackets` asks for "Euclidean covariance". The signed form is what the source uses (`YM.Bid.Hyper.hex`); say so in the bracket lemma. The author's own open item 4 notes this.
- `trace-calibration-producer.tex` 321–327 against 429–435 (part C): the new convention "the charts are the corrected maps \(U_{i,d}=C_{i,d}\)" conflicts with the later use of \(U_{k,d}\) for the raw charts in the recursion defining \(C_{k,d+1}\); the corrected maps are bijective only eventually at each grade (`YM.Next.UVStress.Stations.equivalences`). Whether the trace receipts and the normalisation statements live on one curve is still open, as `revision-1c.md` says; the instruction of the package document on this point is therefore not yet met.
- `actual-stress-shell-nodes.tex` 192–207 (part C): the one-step growth bound is now called a stated input but is still not written. It is \(\phi_iL_i^{D+1}\upsilon_i\le\upsilon_{i+1}\) for \(i\ge\operatorname{ref}(D)\) (source `YM.MergeProof.Scrim.jump`); `thm:ex-selected-run-service`, cited for it, assumes the adjacent weight-growth inequalities and does not prove them.
- Empty cases (part B): `physical-ward-propagation.tex` 409–415 defines \(\rho\) as the least distance to the other points, which needs a convention when there are none; `actual-stress-annulus.tex` 216–220 takes the largest reference depth of a family, which needs one for the empty family.
- Records: `revision-1.md` row for finding 5 says "only the \(b_i\)-weighted coefficients converge" (the unweighted ones tend to zero, as the manuscript says); `findings.md` and `ledger.md` still call two chapters changed by part A "unchanged"; `revision-1b.md` 36–39 has three wrong locators (`YM.Climb.Lighthouse.Goes.delta`, not `Lighthouse.delta`; `pressured` is a private lemma of namespace `YM.Bid` in `Bid/Town.lean`; `YM.Schedule.block_large`); the correction of the propagation evidence file is proposed but not applied.

## Confirmed as answered

| Finding of PR #117 | Status after revision 1 |
| --- | --- |
| 1 shell-to-annulus join | Answered except for requested change 2. Opening lemma, per-family choice, faithfulness argument and scale note are correct. |
| 2 response laws and readout limits | Answered. `lem:ward-local-response-laws` (commutation, inclusion, unit, reality, signed covariance) and `prop:ward-readout-limits` were checked step by step, including both scaling computations, the recovery estimate and the derivation of \(c\ne0\); they match `YM.Work.A01`, `A02`, `A05` and `YM.Bid.A05`. \(V_d\) membership is now shown. |
| 3 missing hypotheses | Answered for `finite-rank-kernel-transport` (\(J\)-invariance, matches `YM.Push.Mark.Active`), the equation relay (open inputs of `prop:ex-marked-solaris` shown as such) and the insertion relay (\(J_N\le\hat\beta_N\) as an assumption; the eventual form suffices). **Not addressed: `trace-free-rank.tex`** (derivative compatibility at 292–318, injectivity of curl on radial potentials at 70–82); the response table says so. |
| 4 cell diameter | Answered: \(2a_k<\delta\) with pairwise separation. |
| 5 gallery limit | Answered except for requested change 3. |
| 6 strict positivity; collinear scenes | Answered. The split of `thm:free-collinear-scenes` and the new proof that the kernel on the spin subspace is \(\mathbb R\partial\) are correct (`finite_lenses`, `scanner`, `quiet_runs`). |
| 7 statements to complete | Answered for the free Maxwell inputs R1–R3 and the drive, the separation convention and sign in the detector chapter, the petal and packet bounds, the mixed-space identity, the uniform test estimate, the label-dependent bound \(A_m\). Partly: growth bound, chart notation and one curve (above); requested changes 1 and 4. |
| 8 records | Applied, with the residual slips listed above. |

**A correction of our review that the author made and that is right.** For part 4 F3 our review suggested that the factor 2 in quota \(\le2e_m\) comes from a separate remainder bound. The author follows the source instead: `YM.MergeProof.Ribbons.mutation` bounds the principal coefficient and the remainder each by \(p'_m\) and applies `bequeathed` to their sum \(2p'_m\). The text is correct and our suggested explanation was not.

## Not checked

No Lean elaboration, no LaTeX build, no rendering. The response tables' build and hash claims were not reproduced beyond the chapter hashes below. Unchanged text of the chapters was not re-reviewed. `trace-free-rank.tex` was not changed and its two findings stand.

## Hashes of the revised chapters at `497fa89`

| File | SHA-256 |
| --- | --- |
| `trace-firesky-gallery.tex` | `4dd0bd90b135f8ec8dc3776023e916f074f3b321ad78811c2e3c1ccc4d0c0de7` |
| `finite-rank-kernel-transport.tex` | `5abd0cc495d61893611cf5d42336589fb4f059956befb75937c8b766ca214679` |
| `actual-equation-kernel-relay.tex` | `bf75181d78490ac46b571007134b8c2fe3317d3fb0f53f604f77827ffb1c0785` |
| `actual-insertion-derivative-relay.tex` | `f9dc7e949bec0d37a325e7a27a7337723ce94ceccf5bb93b87f78d4ab974b93a` |
| `physical-ward-free-classification.tex` | `e3356f9ba36869afdce60614e5e2680eed000d93f0b03d9bf7a951336ea381e7` |
| `physical-ward-propagation.tex` | `89956e3fdb977acbce453c190bf0a9b42dc22516e5a8577cd198232b3be39f9d` |
| `physical-angular-actions.tex` | `0dbdf4bcc4290be59c6e7d782252065a2c753224158b86b92f25b57d0a78756e` |
| `actual-stress-annulus.tex` | `953b8bc789daf7685a10bda2f07b26e524688c54860d399ce25b89017d9db21b` |
| `actual-stress-shell-nodes.tex` | `fef7f53c3c74b7b2e15ba070589b767baf9dd39ea36f5fbefc711c935d7f192d` |
| `actual-stress-normalization.tex` | `80e8969b4b39bb242ce4bf14ac5807b283421c2ba56332e90403c78c47a04bfd` |
| `all-grade-free-detectors.tex` | `c788ecc1d138fef4bba71ad07f18184caa958f587ba73407f196a35058517a13` |
| `free-maxwell-ward-flux.tex` | `83be666e58cfb43b1f54fe75d2e51e62d6e1eb26df5353c8577960558850d60e` |
| `trace-calibration-producer.tex` | `404f5e4cf240f155da5ca3c65719910299a6a0aafd84fcc7568bdb3da06b1035` |
