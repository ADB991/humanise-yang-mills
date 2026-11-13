# Independent review: C10 part A, linear-algebra and determinant chapters

- Task: [#143](https://github.com/hairer/humanise-yang-mills/issues/143) (parent C10 #51, umbrella #26). Unit YM-000026.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/143#issuecomment-6856714764
- Reviewer session: `ADB991-claude-20261113-59b4` (Claude, running as a scheduled agent for GitHub account ADB991). Roles: mathematical validity and Lean correspondence. Agent review only: no human has accepted anything here.
- Independence: this account authored no C10 file. Its only C10 contact was raising G04-F1, which C10 revision 2 answered. That revision touched `annulus-two-wave-estimates.tex`, which is not in this scope.
- Reviewed text: `codex/existence-monograph` at `ddc3c90f7fcc4e10048b173e58d41f25f0107730`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Hashes are in `hashes.json`. The five chapter hashes equal the author handoff hashes in `results/C10/README.md`, so this review covers the C10 author pass (PR #95) as it stands.
- Files: `mathematics.md` (mathematical validity), `lean.md` (source correspondence), `validation.md` (commands actually run), `hashes.json`.

## Scope

| Chapter | Section label |
| --- | --- |
| `manuscript/existence/weighted-frame-penalty.tex` | `sec:ex-weighted-frame-penalty` |
| `manuscript/existence/weighted-stationary-inverses.tex` | `sec:ex-weighted-stationary-inverses` |
| `manuscript/existence/selected-stationary-linear-data.tex` | `sec:ex-selected-stationary-linear-data` |
| `manuscript/existence/selected-kinetic-response.tex` | `sec:ex-selected-kinetic-response` |
| `manuscript/existence/stationary-determinant-prices.tex` | `sec:ex-stationary-determinant-prices` |

The matching rows of `results/C10/part-A/{correspondence,findings,ledger}.md` are also in scope.

Not in scope: `soft-curvature-receipts.tex`, `multileg-curvature-lift.tex` and `thermal-contact-cancellation.tex` (the rest of part A); the part-B chapters; the producers of the named inputs listed under "Dependencies".

## Outcome: minor changes requested; no mathematical error found

Every displayed identity and estimate in the five chapters was recomputed by hand. None is false and no conclusion depends on an unstated hypothesis inside these chapters. The author's two corrections were checked and are right: the factor 5 in `|q(k_l(p))|≤5h_l(p)` off the real slice (E1), and the hypothesis `ε>0` (E2).

Required changes (both text-level; no statement changes):

- **R1** `weighted-frame-penalty.tex` l.210–213. The justification given for the bound `4μ` does not yield it. The inequality `|e^z−1|≤e^{|z|}|z|` gives `eμ` per coordinate, so `2eμ≈5.44μ` in the Euclidean norm on `ℂ^4` that defines `h_l`. The claim itself is true. Use `|e^z−1|≤(e−1)|z|≤2|z|` for `|z|≤1` instead: this gives `2μ` per coordinate and `4μ` in Euclidean norm, which is how the source proves it (`YM.Stationary.q_drift`, `qCost`). As written, the constant 5 in the multiplier estimate is not supported; this chapter is the one later chapters cite for it.
- **R2** `weighted-frame-penalty.tex` l.98–107. The text says "the sum of `J` independent uniform half-block points". The residue argument needs each summand uniform on a complete residue system mod `L`. "Half-block" reads as half of a block, which is not one. In the source the summands are uniform on `P.Small`, the centred box of side `L` (odd) and radius `(L−1)/2`; `roulette : P.Small ≃ Site P.L` and `roll_card` give this. Say so. Also state that `ω` is supported in `𝓑`: its support has radius at most `J(L−1)/2<(J+3)L`. The comparison `ω≤H_Jν` uses this support property and the text leaves it implicit.

Suggestions, S1–S5, are in `mathematics.md`. The most useful is S1: give the one-line reason that the zero-background penalty Hessian equals its constraint pullback (`stationary-determinant-prices.tex` l.184–186).

## Dependencies (named inputs; not checked here)

These are stated in the text as inputs, and this review treats them that way. Their producers were not reviewed.

1. `thm:ex-lattice-wire-tower-strip` and its hypotheses for the retained rows. These come from C01 and the horizon supplier in `curvature-horizon-producer.tex`. The bounds are stage-indexed, with no uniformity over stages.
2. The stationary tangent input (`selected-stationary-linear-data.tex` l.60–72). Its producer is C11, `subsec:path-stationary-chart`.
3. `thm:ex-soft-response-mockups` and (SR2). These are in `soft-curvature-receipts.tex`, which is outside this scope.
4. The self-consistency equation and analyticity of the selected normalized frame: C06 `predictor-branch.tex` and `stationary-action-prices.tex`.
5. `eq:ex-vertex-cruise` and `eq:ex-vertex-penalty-price`, consumed in `classical-stationary-vertices.tex` (part B, not reviewed).
6. The floor clause that supplies the all-period kinetic bound with `ε>0`.

## Next steps

The C10 author (or any author) should apply R1 and R2. Both are local wording changes. A renewed review of the changed hunks is then needed, not by this account. Separate review tasks remain for the other three part-A chapters and the five non-annulus part-B chapters (see #143).
