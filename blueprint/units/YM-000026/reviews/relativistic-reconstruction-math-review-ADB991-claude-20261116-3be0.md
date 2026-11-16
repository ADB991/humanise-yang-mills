# Review of the "Relativistic reconstruction" section

- Unit: YM-000026, section *Relativistic reconstruction* of `manuscript/existence.tex` (lines 102–113)
- Role: mathematical validity (independent error-discovery review; not acceptance)
- Human reviewer: none. Prepared autonomously by Claude (Anthropic) running as a scheduled agent on behalf of ADB991 (session `ADB991-claude-20261116-3be0`); ADB991 had not reviewed it before submission.
- Agent assistance: Claude, sole reader of all eleven files; no subagents.
- Content SHA-256: unit fingerprint `682a958867ef6f4888c0e127c4b03a551e641990dbf91a74fbcb21c3b89493d3` (`python3 scripts/check_blueprint.py --fingerprint YM-000026` at the commit below). The per-file hashes are at the end of this report.
- Manuscript files and labels: `manuscript/existence/{complex-heat,analytic-boundary,fourier-support,label-descent,lorentz-covariance,full-tube,heat-vectors,reconstruction,boundary-detection,spectral-measure,locality}.tex`. Upstream inputs were read only where needed to settle a question (`physical-angular-actions.tex`, `assembly.tex`, `statement.tex`).
- Source revision: manuscript at `main` `962ac43b0ec22ec2831da438eadd8728de800b50`; Lean pinned at `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #478; PR linked from that issue.
- Outcome: no error found in the section's own proofs. There is one gap in an upstream input (F1). One stated assumption is not discharged by name (F2). There are four editorial items.

## Findings and evidence

Each proof was read line by line and its signs, conventions and quantifiers were recomputed. Numbering follows the reading order.

### Proofs checked with no defect found

- **complex-heat.tex.** Positivity is checked from `E_t = E_{t/2}^2`, and injectivity by iterating `‖E_{t/2}x‖² = ⟨x,E_t x⟩`. The construction `E(z)=A^z` and `V(t)=A^{-it}` uses `A=E_1`. Writing `A=e^{-H}` with `H≥0` gives `V(t)=e^{itH}`. This fixes the sign used later in spectral-measure.tex: `F_v(t+is)=⟨v,e^{i(t+is)H}v⟩` is bounded on the upper half-plane. Also checked: the identification of `E(p/n)` with `E_{p/n}` by uniqueness of positive roots, and the norm-holomorphy bound `sup λ^δ|log λ|²`. Lemma `lem:time-fixed-heat` is correct. The coordinate-convention paragraph is consistent: `Cη_firstC^T = diag(-1,-1,-1,1)`.
- **analytic-boundary.tex.** Width independence is checked: `E_u R_q E_u = R_p` with padding `B_{p+u}=E_uB_pE_u`. The real part `y_j-y_i-2p > 2p` is positive. The gap bound with `p=k/8` gives `C=∏C_v 8^{a_v}`. The positions in the imaginary-time identification are checked: the first insertion lands at `(0,p)`, and the word is shifted by `(-x_1,-y_1+p)`. The Cauchy–Riemann step `d/ds F(t+i(y+sa)) = i∂_aF`, together with integration by parts, gives `D_a=-i∂_a` with the stated sign. The Taylor telescoping identity for `P'(s)` was recomputed term by term. The remainder bound uses `k=s≤1`, so the seminorm bound is uniform on the closed ordered cone.
- **fourier-support.tex.** `g_s'=-D_yg_s` is checked from `∂_{t_i}e^{-iX·p}=-ip_i^0e^{-iX·p}`. The `s`-derivative of `ψ_{sy}(g_s)` vanishes. The support argument uses `y(t)=ty+r` with gaps ≥ 1, the bound at `k=1`, and `h_t→0` in `𝒮`. The suffix-sum characterization of `H_n` is correct. Corollary `cor:cone-support` is correct: `Λ^{-T}=ηΛη` is again proper orthochronous, and both the boost contradiction and the zero total momentum hold.
- **label-descent.tex.** The generator transport `K_{d,a}=Q_d(-iL^0_{d,a})Q_d^{-1}=-iL_{d,a}` is correct. So are the ODE-uniqueness argument for boosts commuting with inclusions and the generation step. The `J` computation at lines 90–95 is correct given the input.
- **lorentz-covariance.tex.** The boost Ward identity was recomputed. At `c=iσ` one has `cz_i=-σY_i`, so `T_{iσ}=A_σ`. In the coordinates `(Y,x)` the field is `A_σ=σ𝓡_a`. With `L_a=iK_a`, the integrand is exactly `A_σ(Ff)`, which is divergence-free and compactly supported. `D` is a horizontal strip containing the real axis. Lemma `lem:schwartz-motion` gives `d/ds P_{B_a(s)}f=-𝓑_af`, so `A'(0)=0`. The reduction `Λ↦BΛ` fixing `e_0` is correct.
- **full-tube.tex.** The margin lemma (`p·y=Σ_j q_j·(y_j-y_{j-1})`, `c=r/2`) is correct, as are the cutoff support radii (`χ=1` on `K^{(1)}`, support in `K^{(3)}`) and the bound `-y·p ≤ 3(|y|+c)-c|p|`. The holomorphy remainder is checked with `|h|<c/2`. In `prop:tube-identification`, `d(y)∈C_n^∘` for strictly increasing `y`, and `W_{d(y)}=ψ_y`. In `prop:tube-covariance`, recomputing `(h∘A^{-1})^∧=P_Λĥ` and `(Ap)·(Λz)=p·z` confirms the displayed Fourier form.
- **heat-vectors.tex.** The Gram identity was recomputed from `E(w)^*=E(\bar w)`. The middle factor is `E(y_1+z_1-p-q-i(s_1-t_1))`, which matches `R` at the combined heights with real times not negated, as stated. The holomorphy of `c↦⟨A(\bar c),B(c)⟩` and the Euclidean point `c=iτ` are correct. The translation identity uses `E(-ia^0)=V(a^0)`, consistent with complex-heat.tex.
- **reconstruction.tex.** Checked: `K(ab,c)=K(b,a^*c)`, the null-space invariance, the bilinearity argument, continuity in the test, closability, the locality and label-retention propositions, unitarity and strong continuity of the motion, the isometry `𝒱` and the intertwining by norm limits.
- **boundary-detection.tex.** Checked: the tensor-test density, the involution compatibility `(gb)^*=g(b^*)`, the continuity of `g↦K(b,gc)` by basis expansion together with the affine form of `lem:schwartz-motion`, the J-commutation computation at lines 142–154, the zero-boundary lemma, the reduction to strictly ordered times with permutation symmetry and continuity, and the nonzero-field corollary.
- **spectral-measure.tex.** In the Paley-type lemma, the contour bound gives `bs+εs²=-b²/(4ε)` at `s=-b/(2ε)`. The neighbourhood `A` gives `m≤Ce^{-3b²/(16ε)}`. The pushforward `μ_{U(Λ)v}=(Λ^{-T})_*μ_v`, the measure-uniqueness argument and vacuum uniqueness are correct.
- **locality.tex.** The imaginary part of `B_e(ib)(x+iY)` is `Y+\sin b\,C_ex+(\cos b-1)P_eY`, and `C_ea=(|𝐚|,a^0e)∈V_+` for spacelike `a`. The exchanged orientation has the same inward vector. The complex extension of the label action is correct. Equality of germs on the Euclidean slice follows because the image of the Wick map `M` is a totally real subspace of full dimension: all complex derivatives at `q` agree, not only the values. The partial-boundary identification, including the change of variables on the exchanged tube, and the tied profiles `a_j=i` are correct. The argument avoids the edge-of-the-wedge theorem and Jost points, and it is complete as written.

### F1 (gap in an input; affects the Lorentz chain): the reference Lorentz action `T_d^0` is not constructed in the monograph

Input `input:calibrated-actions` (label-descent.tex:13–34) requires several things on the *reference* spaces `E_d^0`:

- a continuous representation `T_d^0` of the proper orthochronous Lorentz group;
- its boost generator equal to `-iL^0_{d,a}`;
- agreement with `R_d^0` on spatial rotations;
- an antilinear involution `J_d^0` commuting with `T_d^0`.

The section's whole Lorentz chain rests on this input: Proposition `prop:lorentz-label-descent`, Theorem `thm:lorentz-covariance`, Corollary `cor:cone-support`, the full tube and locality.

`physical-angular-actions.tex:24–28` and `:304–311` treat this action as "already fixed" and "attached to that same free hierarchy". No file under `manuscript/existence/` constructs it, states it or cites it. The searches were for `T_d^0`, `boost`, `Lorentz` and `complexif` over all of `manuscript/existence/*.tex`. Outside this section, "Lorentz" occurs only in physical-angular-actions, trace-spectrum, trace-asymptotic, statement (about the generalized free field) and phase-fields. None of them constructs the reference action.

The Lean source does prove it. `YM.Maxwell.Free.voyage` and `YM.Maxwell.Free.launched` (`Lean/YM/Next/MAXWELL/Descent.lean:173–181`) construct the action and prove the generator identity, spatial agreement and star commutation (`Boundary.Spins.Descends`, `Lean/YM/Fields/Star.lean:24–35`). `YM.Maxwell.Free.maxwell_supplies` (`Lean/YM/Next/MAXWELL/Lit.lean:45–48`) passes the result as the `vacuum`/`rolls` fields of `YM.Org.MaxwellData`. The file's docstring says "No Lie-group integration theorem assumed", so the formal proof is not just a citation.

Mathematically this is standard: a finite-dimensional rotation representation of the free jet/Wick spaces continues holomorphically and restricts to the Lorentz group (Weyl's unitary trick). The sign of the generator and the commutation with the reflected conjugate `J^0=θκ`, however, depend on the project's conventions (`i^{α_t}` time factors, contour sign "evaluates at `-It`"). The section's own computation at boundary-detection.tex:142–154 shows that the sign matters: `κ` alone would anticommute with the boosts.

**Required change:** add a short subsection near the free reference hierarchy. It should construct `T_d^0`, or cite a precise source for it, and verify the four properties above in the project's conventions, linked to `YM.Maxwell.Free.voyage`/`launched`.

### F2 (undischarged named assumption): identification of involutions

Corollary `cor:word-motion-inputs` (boundary-detection.tex:67–76) explicitly assumes that the word-construction involution (the reflected conjugate of Subsection `ex-reflection`) is the `J` of Input `input:calibrated-actions`. The final assembly (`assembly.tex:375–392`) invokes the descent and covariance results but does not mention this identification. The ingredients appear to be present:

- `physical-angular-actions.tex:73–74` says the comparison maps `U_{n,d}` commute with conjugation and the signed actions, which yields `J_dQ_d=Q_dJ_d^0` once the signed actions include the time reflection;
- `J_d^0` commuting with `T_d^0` is part of F1.

**Required change:** one sentence in the assembly, or after `cor:word-motion-inputs`, discharging the identification with these pointers.

### Editorial items (minor)

- **E1.** fourier-support.tex:138–140 says that the Lorentz covariance hypothesis "is still to be proved from the infinitesimal Euclidean rotation identities". It is proved two subsections later, in Theorem `thm:lorentz-covariance`, conditional on F1. Replace with a forward reference.
- **E2.** Vacuum uniqueness is argued twice: complex-heat.tex:117–121 and Theorem `thm:field-spectrum` (spectral-measure.tex:167–171). Keep one and refer to it from the other.
- **E3.** label-descent.tex:76–79 cites "the explicit reduction of `Λe_0` in the proof of Theorem `thm:lorentz-covariance`", which is a forward reference to a later subsection. The reduction is short and could be stated as a lemma before both uses.
- **E4.** reconstruction.tex:140–145 says that "the forward spectral condition and uniqueness of the invariant vacuum require additional facts". These are now proved in spectral-measure.tex, so a pointer to Theorem `thm:field-spectrum` would help the reader.

## Required changes and remaining uncertainty

- F1 is required. F2 is required (one sentence). E1–E4 are optional.
- **Literature locators not re-verified.** The cited sources could not be downloaded from this sandbox: requests to the BHV and Williams URLs returned HTTP 403 from the proxy. This review therefore did not check Trèves Thm 51.6 / Eq. (51.3), Reed–Simon I Thm VII.2, Williams Thm 2.19 or BHV Thm D.3.1 p. 397 against the originals. It relies on the #472/#473 record in `blueprint/background/literature-472.md`, which reports Trèves as "checked in the original text". The *uses* of these results here are standard and their hypotheses hold in the section: a bounded self-adjoint operator, a strongly continuous unitary representation of ℝ⁴, and nuclearity of `𝒮`.
- **Not checked:**
  - the upstream inputs themselves: the all-copy slab bound, slab padding and insertion rules, Euclidean rotation/permutation covariance of the selected hierarchy, reflection positivity, the null-space equality `ex-no-new-null`, and `ex-limits-unit`;
  - Lean correspondence of the section's statements;
  - whether `R_d^0` is itself defined in the manuscript. F1 concerns only `T_d^0` and `J_d^0`.
- No LaTeX or Lean was built for this report; the commands actually run are listed on the PR.

## Acceptance

Not applicable: this is an agent error-discovery review. Acceptance of YM-000026 requires an independent human reviewer, per #26.

## Per-file SHA-256 at 962ac43b

```
9eb889e0a9b80e94060c3ea47f9f9bc6b3024f97c7b1768507c50fb3bc5a33de  complex-heat.tex
e88b299bb8c40bc41f7cb3954446fa87e1692984e714aecf593b236fe933c545  analytic-boundary.tex
e6e1cb447992b2bcc6c2b7d3675b535a6eac0727a61677d8e93f2dbf4ce8e941  fourier-support.tex
0e0d0b6737f66d8e0db7144f5a48eacacf53b9f137973a421e7ce8325a62e5df  label-descent.tex
f1727793cdb774fa621bf7e9e0becadc3122087f86a475400dd91a5a0f82987d  lorentz-covariance.tex
46c83c84a860077c86238e4e777beea45ee0d153edbd7be341f8cbc9b97bbd19  full-tube.tex
4d1ca9a26bbd0309fd6202761da2d2ab488241dedf16ad8b0d44af7d0aea0e03  heat-vectors.tex
06fd759c48925a0c7aba3693b6745302044f5200fff9b2a13fdaa3dd29481ea8  reconstruction.tex
531af2e1e5a5f49313e691f7982b7b33b9da44b9d9690d6273ce77774cdb6977  boundary-detection.tex
22cffc2a8793c013e9b6967a6203b4125bfb76d4585f77d05810b055e7470bf1  spectral-measure.tex
50edbb74d53a0238b89c2724172744d569719a23599f8ccb5a250fd63ed8a929  locality.tex
```
