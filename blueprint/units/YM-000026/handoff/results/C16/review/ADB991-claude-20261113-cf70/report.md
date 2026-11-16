# Independent review of PR #257 (public Wilson family of the retained history)

- Reviewer session: `ADB991-claude-20261113-cf70` (account ADB991, Claude agent, scheduled run). Claim: https://github.com/hairer/humanise-yang-mills/issues/253#issuecomment-6864276919
- Roles: mathematical validity and textual Lean correspondence of the **new passage only**.
- Reviewed head: `fe5ec7a333e13a09c07f1e9a955581a179412c07` (mgubi, PR #257, issue #253); base `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`; source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Content inspected: `manuscript/existence/public-run-binding.tex` at head, SHA-256 `392fbb290f799ff64ddc7d30f8ec223fd3e21b03fccdf3d921bd6a0dbe7cde6f` (base `86c47601…c460`; both match the author's `file-hashes.json`), paragraphs "The public family of this retained history" and "Conditional running consequence" (95 added lines), plus the four author records.
- Independence: ADB991 did not author PR #257 or the new passage. Disclosure: ADB991 authored G02 (#138) and C16 revision 1 (#165). This review does not renew or approve any G02 or C16 fingerprint, and does not accept the chapter.

## Verdict

**No required change.** Every identity the passage asserts matches the pinned source definitions, the m=N specialization of the uniform extraction proposition is correct, and the conditional status is stated honestly. Three minor notation/reference points (N1–N3) and one optional suggestion (O1) follow.

## Identity-by-identity check

| Claim in the passage | Source (pin `3456e5e`) | Result |
| --- | --- | --- |
| ℓ_m = L_{J(m+1)} is the level-m block, D_0=1, D_N=∏_{m<N} ℓ_m | `YM.RG.Calendar.Fits.sameFactor` (`Lean/YM/RG/History.lean:99`: `S.factor (S.J (m+1)) = S.schedule.block m`); `YM.Schedule.denominator` (`Lean/YM/Lattice/Scale.lean:39–41`: `0 ↦ 1`, `k+1 ↦ denominator k * block k`). `YM.RG.Calendar.op m p` maps side `m+1` data to side `m` with patch `J(m+1)` and `block m` (`History.lean`, `def op`), so "block used from level m+1 to level m" is right. | OK |
| a_N = D_N^{-1} = e^{-s_N}; s_0=0, s_{m+1}=s_m+log ℓ_m | `YM.Schedule.a` (Scale.lean:99, reciprocal of denominator), `YM.Schedule.scale` (Scale.lean:115, `log (a m)⁻¹`), `scale_succ` (Scale.lean:124). In the source s is *defined* as log D; the manuscript's recurrence-plus-induction is an equivalent route. | OK |
| ℓ_m ≥ 3, D strictly increasing; P_pD_N sites per axis | `Schedule.block_large` (Scale.lean:31), `den_strict` (Scale.lean:60), `Schedule.side m p = period p * denominator m` (Scale.lean:67); `YangMills.wilsonFamily` (`Lean/WilsonBridge.lean:20–30`) takes `period`, `denominator`, `period_strict`, `den_strict` from the schedule. | OK |
| β^pub_{N,p} = β^R_{N,p,N}; level-N density is bare Wilson with zero vacuum parameter | `YM.Family.beta N p := path.β N p N` (`Lean/YM/Source/Construction.lean`), `wilsonFamily.beta := C.beta`; `YM.RG.History.Selected.starts` (`History.lean:237`). See N-remark under N2 on which fact does what. | OK |
| Haar measure and Wilson action of Section 2 | `wilsonFamily.haar := probHaar`; `energy_eq`, `law_eq` (WilsonBridge.lean:32–46). | OK |
| Init^R_{d,N,p}(w;x;U) = a_N^{-d} 𝓛_d(Δ_d(ϑ_N^{-1})w; x; U), (Δ_d(t)w)_α = t^{c_{d,α}} w_α | `YM.Source.initial` (`Lean/YM/Source/Insertion.lean:77–79`: `((a N)^d)⁻¹ • C.places (F.scaled (threshold N)⁻¹ v) o`); `YM.Labels.Frame.scaled` (`Lean/YM/Labels/Reference.lean:58–61`: coordinate j multiplied by `t^(grades j).2`). The exponent is the second grade component (colour-factor count, cf. `factors_pos`), not d — as the passage says. | OK |
| O^pub_{N,p,(d,v)} = Init^R((A^R_{d,N,p})^{-1} v) | `TransferData.terminal : F.Coeff ≃ₗ[ℂ] F.Coeff` (Insertion.lean:75), `TransferData.cylinder C v := initial … (terminal.symm v)` (Insertion.lean:87), `YM.Family.O` (Construction.lean:42), `YM.Family.seen` (`Lean/YM/Extraction/LatticeFamily.lean:26`), `wilsonFamily.insertion := C.seen`. Tokens are pairs (d, v) with v in the grade-d coefficient space (`seen` uses `t.1`, `t.2`). | OK |
| Insertions defined at every cutoff; estimates only for N ≥ t_R(d) | `TransferData` has no cutoff hypothesis; the soundness clauses (`Makes.places`, `Makes.priced`, `TransferData.Based`) carry `ref d ≤ N`. Consistent with `selected-centered-service.tex` ("for t_d>N the stored transfer datum is a default map and carries no assertion"). | OK |
| Finite moments equal at every N, p, token and site tuple | `YangMills.moment_eq` (WilsonBridge.lean:49–55), definitional before any limit. | OK |
| Running hypothesis form | `YM.RG.History.Running` (`History.lean`): ∀ε>0, eventually in m, ∀N p, m≤N → \|β N p m − hatBeta m\| ≤ ε·scale m, with `hatBeta m = bar + slopeConstant·scale m` (`History.lean:79`). Matches the displayed hypothesis with β̄ = `bar`, σ = `slopeConstant`. | OK |
| σ = 2b_0(G) > 0 | `YM.Pert.Asymptotics.b0_normalizes` (`RawAxis.lean:14`: `2*b0 G = G.slopeConstant`); positivity for simple G via `casimir_pos` in `YangMills.regular` (`Lean/HierarchyBridge.lean:16–23`). | OK |
| m=N specialization gives (ex-running-input) with N_0 before ∀p | Prop. `prop:uniform-extraction` (`manuscript/pilots/running-coupling.tex:77–101`) gives one threshold m_* with \|β_{N,p,m}/s_m − c\|<ε for all m≥m_*, N≥m, p. Setting m=N (allowed since N≥N) gives the display for N≥N_0:=m_*, uniform in p, with s_N=log(a_N^{-1}) by the first identity. Source: `zeroUp_bound` then `hN N p le_rfl` in `regular`. Matches `ex-running-input` (`statement.tex:47–52`, which asks ∃σ>0). | OK |

## Minor points (no change required)

- **N1 (notation clash).** The same section already uses A_j(L) for one of the two post-length costs ("let A_j(L) and B_j(L) be the two actual post-length costs"); the new passage uses A^R_{d,N,p} for the terminal isomorphism. The decorations differ, but a different letter would read better. Other chapters write the actual terminal map as X_{N,p} (`actual-insertion-derivative-relay.tex:37`, "ξ_{N,p}=X_{N,p}^{-1}x_{N,p}"); reusing that letter would also help cross-reading.
- **N2 (which fact gives the second identity).** β^pub_{N,p}=β^R_{N,p,N} is true by definition of the public family (`Family.beta`, `wilsonFamily.beta`). `Selected.starts` is what makes the history's level-N density equal to the bare Wilson density with that coefficient, i.e. it identifies the law of C_R with the public Wilson law (cf. `History.partition_eq`). The passage's sentence "this gives the second identity" merges the two. A rewording such as "the public coefficient is the history's level-N coefficient by definition, and the stored history starts at cutoff N with the bare Wilson density of exactly this coefficient and zero vacuum parameter, so the two laws agree" would be more precise.
- **N3 (ϑ_N undefined in the passage).** "Write ϑ_N>0 for the selected threshold" does not say which threshold. In the source it is `Calendar.threshold N = hatCoupling N · monitor N = \widehat\beta_N^{-1/2} exp((log log \widehat\beta_N)^2)` (`History.lean:80–83`), positive because \widehat\beta_N ≥ e^e (shown earlier in the same section). `marked-field-local-estimates.tex:19` uses "a budget threshold ϑ_N∈(0,1]" generically, so a reader may conflate the two. Giving the formula or a cross-reference would close this.

## Optional suggestion

- **O1 (producer of the running hypothesis).** In the source, `Running` is a field of `History.Selected` (`History.lean`, `structure Selected`, field `running`), so `regular` uses it unconditionally under `Family.Makes`. In the manuscript, the subsection "The running-coupling estimate" of `surviving-interval-shooting.tex` derives exactly this form, |β_i − \widehat\beta_i| ≤ ε S_i uniformly in cutoff and period, with \widehat\beta_i = \bar\beta + sS_i. Two identifications are needed to cite it as the producer: (a) that section's level-indexed block sides L_i are the present ℓ_i (it writes S_{i+1}=S_i+log L_i with L_i indexed by *level*, i.e. the very level/stage distinction this passage introduces), so S_i = s_i; (b) its slope s=s_G equals 2b_0(G), which is part of G02's O1 and is not established in `existence.tex`. The passage's conditional phrasing is therefore correct as it stands; one sentence naming the shooting subsection, with (a) stated and (b) left as an open input, would make the dependency explicit.

## What was not checked

- No Lean elaboration, build, or `#print axioms` (Mathlib hosts are blocked in this environment); all source checks are textual reads of the definitions cited above.
- Whether the analytic inputs (shooting, calibration, transport) hold is outside this review; the passage claims none of them.
- The identification of the clock factor with the selected block lengths L_j (pre-existing chapter text "Its actual block at step m has length L_{J(m+1)}", via the `lengths` fields of the planned data) was not re-audited.

## Evidence (commands actually run)

- `git diff --check 69b2631f..fe5ec7a3`: clean. `git diff --quiet 69b2631f..fe5ec7a3 -- Lean source/upstream.json`: no change.
- At PR head: `python3 scripts/check_blueprint.py` → "Blueprint structure OK: 4 units. Lean and mathematics were not verified."; `python3 -m unittest discover -s tests` → OK.
- From `manuscript/` at PR head: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` → exit 0, 983 pages, 0 "undefined" lines in the log. Rendered pages 979–980 (pdftoppm, 80 dpi) inspected: both paragraphs, displays (1279), (1280) and the running display are legible; "which is (1)" resolves to `ex-running-input`.
- SHA-256 of inspected files at the head: `hashes.json` in this directory.
