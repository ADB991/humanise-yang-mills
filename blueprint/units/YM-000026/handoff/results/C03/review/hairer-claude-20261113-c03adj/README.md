# Independent review: semilinear field union and reflected adjoint (PR #292)

Issue #289; session `hairer-claude-20261113-c03adj-review`. Reviewer account
`hairer` (coordinator), which did not author PR #292, `phase-fields.tex` or the
C03/C04 E4 consumers. Target: PR #292 head `a1171b79d8791b1aa8b11c05068d49caa2547a0a`,
merged as `04ea6b6`; delta reviewed against #279 head `cf15917`. Current
canonical `phase-fields.tex` SHA-256 `a928beef241269e359ce6ac4c13806e3d84be5ae59b32bec794f591b64121fba`. Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Textual inspection only; no Lean
elaboration or axiom audit.

**Verdict: no required change.** Every new algebraic step was checked; the
hypotheses are stated explicitly and are the ones the source uses. Three
optional notes follow.

## Mathematics, step by step

1. **Semilinear universal property** (`prop:phase-field-union`).
   - Well-definedness moves two representatives to `D=max(d,e)`; injectivity
     of the `j_D` gives equality of the lifted classes. Unchanged from #270.
   - Additivity is proved at a common grade.
   - `F(cu)=F_d(cv)=σ(c)F_d(v)` uses only the image of `σ`, so
     surjectivity is not needed.
   - Uniqueness holds because `E=⋃ j_d(E_d)`.
   - `σ=id` recovers the earlier linear statement. ✔
2. **Null preservation.**
   - Conjugation: `S(x;ā,b)=conj S(x;a,b̄)=0`, from the reality receipt on the
     whole tuple.
   - Signed action: `S(x;R_s a,b)=S(s^{-1}x;a,R_{s^{-1}}b)=0`. This uses covariance
     with `y=s^{-1}x` and `R_sR_{s^{-1}}=1`; the positions stay distinct.
   - Inverses give equality `N_d` → `N_d`.
   - `c_d` is conjugate-linear and `m_{d,s}` is linear and well defined on
     `E_d`, because `π_d` is linear and onto.
   - `δ_{d,ρ}=m_{d,ρ}c_d` is conjugate-linear. `δ²=m_ρc m_ρc=m_{ρ²}c²=1`,
     using commutation and `ρ²=1`. ✔
3. **Orientation criterion** (eq. `phase-raw-inclusion-orientation`). With
   `ι_{de}π_d=π_eK_{de}`, the difference of the two sides of each quotient
   identity is `π_e` of the displayed raw difference. It therefore vanishes
   iff that difference lies in `N_e`, and every quotient label is a
   projection. Both directions hold. ✔
4. **`prop:phase-union-adjoint`.**
   - `δ_eι_{de}=ι_{de}δ_d` by the two identities, so `F_d=j_dδ_d` is
     compatible: `F_eι_{de}=j_eι_{de}δ_d=j_dδ_d`.
   - Each `F_d` is `conj`-semilinear; item 1 gives the unique lift and the
     restriction formula `J j_dπ_da=j_dπ_da^†`.
   - `J²j_dv=j_dδ_d²v=j_dv`.
   - `J(j_dE_d)=j_dδ_d(E_d)=j_dE_d`, since `δ_d` is bijective.
   - Uniqueness: the restriction formula alone determines `J`, because
     `j_dπ_d` is onto each level. ✔
5. **Two tables.**
   - `q_dδ^S_dπ^Sa=q_dπ^Sa^†=π^Ta^†=δ^T_dq_dπ^Sa`. This needs `N^S⊆N^T` and T's own
     reality and covariance receipts, both stated.
   - With the same `K_{de}`, `q` is induced on the union, and
     `qJ^Sj^S_d=qj^S_dδ^S_d=j^T_dq_dδ^S_d=j^T_dδ^T_dq_d=J^Tqj^S_d`. ✔
6. **Precision edits from #281/#285.**
   - The narrowed citation of `ex-phase-original-null` is accurate: its proof
     (`phase-regularity.tex`) uses only slab-insertion boundedness, the
     matrix-element identity, density and placement independence.
   - Replacing "smooth" by "continuous" is sound: the tested-to-pointwise step
     (`phase-fields.tex`, around line 225) uses only continuity of `h`.
   - The inverse-calibrated norm is identified with the relay's
     `|X^{-1}v|_1`.
   - The remark on per-label refinements is correct: each representative
     satisfies an identity between limits along the original filter, which do
     not depend on the refinement.

## Source correspondence (textual)

- `YM.DiffPlan.uniqueLift` (`Lean/YM/Euclid/Union.lean`, line 62): arbitrary
  `t : ℂ →+* ℂ`, maps `→ₛₗ[t]`, additivity and `map_smulₛₗ` at a common
  grade, no scalar preimage. Matches item 1.
- `YM.DiffPlan.unionAdj` and `through_adjoint` (lines 85 and 90): lifts
  `pin∘adj` with `starRingEnd ℂ`. Its compatibility proof uses only
  `Orientation.realInc` and `.mirrorInc` (`Lean/YM/Euclid/Differential.lean`,
  lines 66–70), as the author record says. `realDer` and `mirrorDer` are
  unused. The manuscript assumes `mirrorInc` only for the chosen reflection,
  which is weaker than the source premise and enough for this proof.
- The source reflects along an arbitrary `a : Axis`; the manuscript's
  "coordinate reflection `ρ`" matches.

## Optional notes (not required)

- **N1.** The square-one identity is cited from
  `ex-reflection-transport`, which states it for time reflection. The same
  two-line computation (`J²v=R_ρR_ρv=v` from commutation) applies to any
  coordinate reflection. Saying so would make the citation exact.
- **N2.** `F(0)=F_d(0)=0` is redundant given additivity.
- **N3.** In `prop:phase-union-adjoint`, uniqueness holds among *all* maps
  satisfying the restriction formula; conjugate linearity is not needed for
  it.

## Not checked

- Lean elaboration and axioms.
- The production, for any selected run, of the reality, covariance and
  inclusion-orientation receipts. The text assumes them explicitly and does
  not claim them.
- Derivative, rotation, Lorentz and Ward compatibility, which the text
  explicitly excludes.

## Checks run

- `git diff` of `manuscript/existence/phase-fields.tex` between the #292 head and the
  current `codex/existence-monograph`: identical.
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK".
- No LaTeX build: this report changes no manuscript text.
