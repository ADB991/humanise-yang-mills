# C04 audit findings

Each chapter was read in full and every displayed step was rechecked
(algebra, signs, quantifiers, domains, limits). "No defect" below means no
substantive mathematical defect was found in this pass; it is author-side
evidence, not a review.

## Repaired gap (substantive)

**F1. The Poincaré-invariance hypothesis of the word construction was never
discharged.** Proposition `prop:word-motion` (reconstruction.tex) assumes
`(eq:word-motion-input)`: K(gb,gc)=K(b,c) and continuity of g↦K(b,gc). The
chapter said these were "to be established before this construction is
applied", and no chapter in the 873-page draft established them (checked by
grepping all `\ref`s to the equation, the proposition and the input). The
endpoint Definition `ex-reconstructed` needs the resulting strongly
continuous unitary Poincaré representation, so this was a real hole in the
dependency chain, not only a presentational one.

The pinned source proves exactly this statement as `YM.Work.C28.answer`
(`Lean/YM/Work/C28.lean`; consumed through
`YM.Integrated.reconstructionArcs.cν` in `Lean/YM/Next/BOUNDARY/Stage.lean`
and by `YM.Boundary.harvest` via `Surface.Strong`/`Surface.Transforms` in
`Lean/YM/Fields/Lo.lean`). `reconstruction-evidence.md` lists C01–C27 and C29
but not C28, which explains the omission.

Repair: new Corollary `cor:word-motion-inputs` in `boundary-detection.tex`,
with a detailed proof following C28's three steps: (i) the star commutes with
the motion (`rev_po`, using `J ρ = ρ J` from `prop:lorentz-label-descent`);
(ii) invariance of the word functional, splitting g=(a,I)(0,Λ) and applying
translation invariance then Lorentz covariance from `thm:lorentz-covariance`
(`expect_po`, `gpush_split`); (iii) continuity by pinning all labels in one
finite level, expanding in a basis with continuous coefficients, and using
Schwartz continuity of the affine pullback (`strong`, `continuous_pinned`,
`continuous_push`). It also records that the translation hypothesis of
`prop:word-motion` is `prop:heat-cups`. The corollary is placed after
`cor:word-test-inputs`, which discharges the other inputs of the same
construction.

**F2. Same-data requirement on the involution J (new edge
C03-C14-to-C04-involution-identity).** The word construction (heat-vectors,
reconstruction) uses the reflected conjugate J of `reflection.tex`;
`prop:lorentz-label-descent` proves commutation with the involution J_d of
`input:calibrated-actions`. F1 needs these to be the same map. The text after
the corollary shows this is forced, not conventional: with θ the time
reflection and κ the real structure, θκ commutes with K_a=-iL_a, while κ alone
anticommutes. In Lean the identification is the hypothesis
`YM.Boundary.starRead J h` (J acts as the time-axis adjoint of the real spin)
used through `YM.Boundary.Letter.rewrites`. C14 states that its Q_d preserve
"reality and signed motions", which would give J_dQ_d=Q_dJ_d^0 for J=θκ, but
the C14 author should confirm this explicitly.

## Notation repairs (no mathematical change)

- **N1.** The letter V denoted both the unitary time group of
  `prop:complex-heat` and the isometry H→H_E of `prop:word-motion`, and the
  two met in the proof of `thm:field-spectrum`. The isometry is now 𝒱
  (`\mathcal V`) in reconstruction.tex, spectral-measure.tex and
  complex-heat.tex. The apologetic sentence in complex-heat.tex is removed.
- **N2.** reconstruction.tex wrote U_E(a) for the joint Euclidean translation
  group, which complex-heat.tex and spectral-measure.tex call T_E (U_E there
  is spatial only). It now uses T_E, introduced in the statement.
- **N3.** In `prop:word-motion`, "h_t(ab)" used a for a translation acting on a
  word, while the same paragraph used ab for concatenation. It now reads
  h_t(τ_a b).

## Chapter-by-chapter result

| Chapter | Result |
| --- | --- |
| complex-heat | No defect. Holomorphy bound, rational-to-real identification, injectivity by halving, edge isometry, group law, commutant and fixed-vector lemma all checked. |
| analytic-boundary | No defect. Width independence (E_u merging), gap-power constants (p=k/8), tested CR sign, the telescoping of P'(s) and the uniform seminorm bound checked. |
| fourier-support | No defect. Sign of g_s'=-D_yg_s, constancy argument, half-space identification and the boost argument for the forward cone checked. |
| label-descent | No defect. Note that L_{d,a}Q_d=Q_dL^0_{d,a} is automatic from the definition of R_d; it does no harm as stated. |
| lorentz-covariance | No defect. The c-continuation with A_σ divergence free, the identification A_σF=σ𝓡_aS, sign K_a=-iL_a and the generation argument checked. |
| full-tube | No defect. Exponential testing sign consistency between fourier-support (e^{+d·p}) and tube identification (e^{-d·p}), margin constant, cutoff support radii, Fourier covariance with A=Λ^{-T} checked. |
| heat-vectors | No defect. First leg subtracts p, interior legs 2p; real times reversed but not negated; the c ↦ ⟨A(c̄),B(c)⟩ continuation checked against the Euclidean heights. |
| reconstruction | Gap F1 (hypothesis never discharged); notation N1–N3. Otherwise no defect. |
| boundary-detection | No defect in existing text; new corollary added (F1, F2). |
| spectral-measure | No defect. Contour bounds, choice s=-b/(2ε), mass bound e^{-3b²/(16ε)}, pushforward support and cone argument checked. |
| locality | No defect. C_e²=P_e, imaginary part of boosted gaps, both orientations at the tied gap, germ uniqueness, totally real Wick image, propagation in s and the tied profiles y^{(m)} checked. |

## Observations for other packages (no edit made)

- **O1 (for G03, bibliography).** complex-heat.tex cites
  `\cite[Theorem 2.19]{Williams}` and `reconstruction-evidence.md` says
  "Theorem 2.19, printed p.34", but the bibitem in `existence.tex` says
  "Theorem 2.13, pp. 29--31". One of them is wrong. The Dartmouth URL was
  blocked from this sandbox (proxy 403), so I could not check which.
- **O2 (for G06, dependency closure).** `lem:zero-boundary` follows the source
  route through the full tube, so `prop:boundary-detection` inherits the
  Lorentz-covariance hypothesis through `cor:cone-support`. Mathematically the
  same conclusion also follows from `lem:exponential-testing` alone: if
  W_n(v)=0 then ψ_y vanishes on Fourier transforms of all compactly supported
  tests, a dense subspace, so F_n(·+iy)=0. I did not change the chapter
  because the maintainer asked for main-step fidelity and this exact shortcut
  was removed earlier (see `reviews/draft-review.md`). G06 may use the
  observation to confirm that label detection does not depend on the
  calibrated Lorentz input.
- **O3 (for G01).** `thm:field-spectrum`'s uniqueness clause needs the
  heat-fixed space to be CΩ_E. The Lean variant
  `YM.Next.BOUNDARY.Stage.establishing` omits that hypothesis and its
  conclusion; `YM.Boundary.harvest` keeps it (`C.UniqueHeat`). G01 should
  check which one the public endpoint uses.

## Revision 1: response to the independent review (PR #76)

| Review item | Response |
| --- | --- |
| M1 locality cutoff | Accepted; sentence replaced by the product construction f_R=χ(X/R)f. |
| M2 E4 producer | Accepted; edge renamed, `limits.tex` pointer removed, marked "producer statement not identified", with Lean anchors. |
| M3 nonzero smeared field | Accepted; recorded on the C16 edge as a requirement on the hierarchy package. No chapter change. |
| M4 coordinate order | Accepted; convention paragraph added in `complex-heat.tex`. |
| M5 quantifier in `prop:word-motion` | Accepted. |
| M6 statement of `prop:heat-cups` | Accepted; identity now in the statement. |
| M7 producers of E3, E5, null equality; C14 split | Accepted; producers named by label (`ex-phase-slab-bounds`, `ex-slab-laws`, `ex-phase-dynamics`, `ex-individual-rotations`, `ex-no-new-null`); E5 split into E5a/E5b; C14 edge split into Euclidean-spectral and relativistic parts. The null-equality producer is a C03 chapter (`phase-fields.tex`), so the edge is renamed C03-to-C04-null-equality. |
| M8 locality row | Accepted. |
| M9 Williams locator | Agreed with the reviewer; shared bibliography, left to G03. |
| M10 clarifications | All six adopted; for the last one `lem:schwartz-motion` is now stated for the whole affine group, which its proof already covered. |
| L1, L2, L9 | Accepted in `correspondence.md`. |
| L3, L4 | Accepted; written out in `correspondence.md` for the owner of `reconstruction-evidence.md`. |
| L5 | Accepted; new edge E4b with producer `ex-phase-original-null`. |
| L6 | Same as the fourier-support item of M10. |
| L7 | Accepted; full edge statement copied, kept open. |
| L8 | Same as M5. |

New observation (for the coordinator): in the source the field union is
realised as a submodule of functionals on exteriors (`YM.Table.Union`,
`Lean/YM/Euclid/Union.lean` l.20–30), so injectivity of the level maps is
`YM.Table.pin_inj`, while compatibility of correlations with the inclusions
is the separate premise `YM.DiffPlan.Inclusions`. No manuscript chapter
located in this revision constructs the levels, inclusions and union; E4 is
therefore unowned.
