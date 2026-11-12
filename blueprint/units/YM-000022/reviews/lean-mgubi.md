# Review of a proof unit

- Unit: YM-000022, `blueprint/units/YM-000022/`
- Role: Lean correspondence
- Human reviewer: mgubi (no acceptance recorded; see the last section)
- Agent assistance: Claude Code (Claude Fable 5.2) carried out the inspection and wrote this report. One subagent fetched a web page for the mathematical review; none was used for this role.
- Content SHA-256: `367b5982bb56035d3f0cbf81641d1f0564c27a48169707b9aa64a5cf3c0b0aa2` (`python3 scripts/check_blueprint.py --fingerprint YM-000022` at main `fa70509`)
- Manuscript files and labels: `manuscript/pilots/running-coupling.tex` (`sec:running-coefficient`, `eq:running`, `prop:uniform-extraction`, `prop:running-asymptotic`), `manuscript/preamble.tex`, `manuscript/references.bib`. The section has no `\input`; `manuscript/main.tex` inputs only the preamble, this section and the bibliography. The list in `unit.json` is complete.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22), claim <https://github.com/hairer/humanise-yang-mills/issues/22#issuecomment-6817176547>
- Outcome: changes requested (two additions to the crosswalk, one clarification). No mismatch was found between the stated results and the source.

I am not an author of this unit. This is an agent-assisted review; it is not a human acceptance.

## Findings and evidence

Evidence levels: **[E]** elaborated by me at the pinned revision; **[S]** source text read.

### Statements

1. **`prop:uniform-extraction` matches `YM.Pert.Asymptotics.zeroUp_bound` [E].** The elaborated type is: for `C : YM.Family G` with `C.Makes` and `0 < ε`, eventually in `m`, for all `N p : ℕ` with `m ≤ N`, `|C.path.β N p m / C.S.scale m - 2 * b0 G| < ε`. The text's proposition is stated for abstract `s_m`, `A`, `c` and so is more general; specialised to `A = bar`, `c = 2 b_0(G)` it is this statement. The Lean statement has no simplicity hypothesis, as the correspondence says.
2. **`prop:running-asymptotic` matches `YM.Pert.Asymptotics.comparison` [E].** Hypotheses `C.Makes`, `G.Simple`, and `∀ᶠ i, i ≤ N i`; `k : ℕ → ℕ` is unconstrained; conclusion `Tendsto (fun i => regulatorRun C (N i) (k i) i * √(Real.log (C.S.a i)⁻¹)) atTop (𝓝 (√(2 * b0 G))⁻¹)`. The text's limit `1/√(2 b_0(G))` and its quantifiers agree.
3. **`regulatorRun` is total [E]:** `fun C N p m => (√(C.path.β N p m))⁻¹`, no hypotheses. The correspondence's remark on the totalised square root and inverse is accurate, and the text's "positive tail" reading is enough for a `Tendsto` statement.
4. **`b0` and `b0_normalizes` [E]:** `b0 G = 11 * G.casimir / (48 * π^2)` and `2 * b0 G = G.slopeConstant`, with `slopeConstant = 11 * G.casimir / (24 * π^2)`.

### The input `eq:running`

5. **`eq:running` is `YM.RG.History.Running` for `C.path` [E].** `Running A := ∀ ε > 0, ∀ᶠ m, ∀ N p, m ≤ N → |A.β N p m - A.levels.clock.hatBeta m| ≤ ε * A.S.scale m`, with `hatBeta m = bar + G.slopeConstant * schedule.scale m`. It is reached by `YM.Family.Makes.wilson` then `YM.RG.History.Selected.running`, as stated.
6. **Hidden identification checked [E].** `Running` measures the error against `A.S.scale` while `hatBeta` uses `clock.schedule.scale`, and the theorems use `C.S.scale`. All three are the same schedule by unfolding: `Family.S C = C.path.levels.S` and `Levels.S s = s.clock.schedule` are reducible abbreviations, and
   `example … : C.path.levels.clock.hatBeta m = C.path.levels.clock.bar + G.slopeConstant * C.S.scale m := rfl` elaborates. So the single `s_m` of the text is faithful.
7. **Spacing and scale [E].** `Schedule.a S m = ((S.denominator m : ℕ) : ℝ)⁻¹`, `Schedule.scale S m = Real.log (S.a m)⁻¹` (by `rfl`), `denominator 0 = 1`, `denominator (k+1) = denominator k * block k` [S, `Lean/YM/Lattice/Scale.lean:39–41`], and `Schedule.block_large : ∀ m, 3 ≤ block m`. This is the text's `a_m = (∏_{j<m} B_j)^{-1}` with integer `B_j ≥ 3`. Lean also requires each `B_j` odd; the text does not use this.
8. **Indices [E].** `History.β A N p m = (A.rep N p m).beta`, where `A.rep N p m : Rep G (levels.S.side m p)` and `side m p = period p * denominator m`. So `m` indexes the lattice of spacing `a_m`, `N` the starting level and `p` the period, as in the text. The function is defined for all `N, p, m`; only `m ≤ N` is constrained, which is what the text uses.

### Gauge data and the constant

9. **Group and Lie algebra [E].** `YM.Gauge` is a natural number `n` and a closed subgroup of `Matrix.unitaryGroup (Fin (n+1)) ℂ`; `repDim = n + 1`. `G.lie` is the real subspace of matrices `X` with `exp(tX)` in the group for every real `t` (`YM.Gauge.Generates`). `G.Simple` says some pair in `G.lie` does not commute and every real subspace of `G.lie` stable under brackets with `G.lie` is `⊥` or `G.lie`. The opening sentence of the section is a faithful reading, with `r_G = n + 1`.
10. **Casimir normalisation [E].** `casimir = (-∑ i, trace (ad (b i) ∘ ad (b i))) / lieDim`, with `b` the standard basis of `Color = EuclideanSpace ℝ (Fin lieDim)` and `ad c d = projectColor (colorMat c * colorMat d - colorMat d * colorMat c)`. `YM.Gauge.trace_color` gives `-(colorMat c * colorMat d).trace.re = repDim * ⟪c, d⟫`, so the matrices `colorMat (b i)` are orthonormal for `⟨X,Y⟩ = -r_G^{-1} Re tr(XY)`. The text's formula for `C_𝔤` is this definition transported along the linear isomorphism `colorIso`, which preserves traces of endomorphisms. I did not inspect which inner product on matrices defines `orthogonalProjectionOnto` in `projectColor`; on brackets of elements of `G.lie` the projection should be the identity, but I did not look for the declaration that proves closure under brackets.
11. **Positivity is proved differently in the text than in Lean [S].** `YM.Gauge.casimir_pos` (`Lean/YM/Gauge/Casimir.lean:160–172`) picks a non-central `x`, shows `-trace (ad x * ad x) > 0`, and then uses `trace_adjoint h`, which needs the full simplicity hypothesis, to convert this into positivity of the constant. The text instead sums `‖[e_j, e_ℓ]‖²` over a basis and uses only noncommutativity. The text's route is a reorganised argument in the sense of `docs/proof-standard.md` item 5 and is checked in the mathematical review, not by the formal source.

### Crosswalk table and evidence

12. The fully qualified names in the table all exist and are at or near the stated lines [E, S]. `YM.Schedule.divergent` starts at `Scale.lean:117` and its proof runs past the stated end line 120; this is immaterial.
13. The unit's `evidence/lean-inspection.txt` agrees line for line with my own output for the same commands [E]. `evidence/check_sources.py` rerun on this checkout reproduces `evidence/source-checksums.txt` exactly, and the seven files are byte-identical to my separate pinned checkout.
14. Axioms [E]: `b0_normalizes`, `zeroUp_bound`, `comparison` each report `[propext, Classical.choice, Quot.sound]`.

### Commands run

From a separate checkout of the pinned source (commit `1dba6965`, which is the pinned revision plus CI and `.gitignore` files; the seven source files above were compared with `cmp` against `Lean/` in this repository), toolchain `leanprover/lean4:v4.32.0`, existing build artifacts, no rebuild:

```sh
lake env lean c1.lean   # exit 0: #print/#check of the five owned declarations, Running, Calendar, hatBeta,
                        # History, β, Selected, Family, Family.S, Makes, Schedule, a, scale, a_pos, divergent,
                        # Gauge, Simple, Color, colorIso, trace_color, ad, casimir, slopeConstant(_pos), axioms
lake env lean c2.lean   # exit 0: denominator, Side, side, Levels(.S), History.S, Rep, GaugeU, lie, Alg,
                        # ColorIndex, lieDim, repDim, colorScale, colorMat, projectColor, casimir_pos; three rfl examples
lake env lean c3.lean   # exit 0: Wilson.bare, Rep.eval, block_large, Generates, Mat, dimPos
python3 blueprint/units/YM-000022/evidence/check_sources.py <this worktree> | diff - …/source-checksums.txt   # no difference
python3 scripts/check_blueprint.py --fingerprint YM-000022
```

The scratch files are not committed. No `lake build` and no kernel replay were run.

## Required changes and remaining uncertainty

1. **Add the source of the closing remark.** "At `N(i)=i` the coefficient is the bare lattice action coefficient" rests on `YM.RG.History.Selected.starts`: `(A.rep N p N).v = 0 ∧ (A.rep N p N).eval = YM.Wilson.bare (A.β N p N)`, with `Wilson.bare β U = exp(-β * Wilson.energy U)` [E]. Neither declaration is in the crosswalk. I did not inspect `Wilson.energy` or `Rep.eval`, so whether "bare lattice action coefficient" needs a normalisation caveat is open.
2. **Add the declarations behind the text's own divergence argument.** The text proves `s_m ≥ m log 3` from the product formula and `B_j ≥ 3`. The table cites `Schedule.a`, `a_pos`, `scale`, `divergent` but not `YM.Schedule.denominator` or `YM.Schedule.block_large`, which carry these two facts. `YM.Gauge.lie` / `YM.Gauge.Generates` and `YM.Gauge.repDim` would similarly anchor the opening sentence.
3. **Say that the positivity argument is not the Lean one** (finding 11). The correspondence currently says simplicity "is used here solely through `slopeConstant_pos`" and that the section "supplies its elementary positivity argument explicitly"; it should state that this argument replaces, and does not paraphrase, `casimir_pos`.

Not checked: the definitions of `A.Conv`, `A.Transfer`, `Calendar.Fits`, `BlockControl` and the other fields of `Family.Makes` (not used by this unit); `Wilson.energy`; the inner product on `G.Mat`; anything about how `Family.Makes` is produced. The running estimate remains an unproved input of the unit, as the unit says.

## Acceptance

Not recorded. This report is agent-assisted evidence for a human reviewer. Any edit made in response changes the content fingerprint and needs a renewed check.
