# Review of a proof unit

- Unit: YM-000022, `blueprint/units/YM-000022/`
- Role: mathematical validity
- Human reviewer: mgubi (no acceptance recorded; see the last section)
- Agent assistance: Claude Code (Claude Fable 5.2) checked the argument and wrote this report; a web-fetch subagent made a first read of the cited page, which I then repeated directly.
- Content SHA-256: `367b5982bb56035d3f0cbf81641d1f0564c27a48169707b9aa64a5cf3c0b0aa2`
- Manuscript files and labels: `manuscript/pilots/running-coupling.tex` (`sec:running-coefficient`, `eq:running`, `prop:uniform-extraction`, `prop:running-asymptotic`), `manuscript/preamble.tex`, `manuscript/references.bib`
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22), claim <https://github.com/hairer/humanise-yang-mills/issues/22#issuecomment-6817176547>
- Outcome: changes requested (two small gaps in the positivity paragraph). The two propositions and their proofs are correct as written, conditional on the stated input `eq:running`.

I am not an author of this unit. This is an agent-assisted review; it is not a human acceptance.

## Findings and evidence

### Proposition `prop:uniform-extraction`

Correct. With `η = ε/2` and `s_m > 2(|A|+1)/ε`:
`|β/s − c| = |β − c s|/s ≤ (|β − (A + c s)| + |A|)/s ≤ ε/2 + |A|/s`, and `|A|/s < ε|A|/(2(|A|+1)) < ε/2`. Both thresholds depend only on `ε`, so the bound is uniform in `N ≥ m` and `p`. The enlargement of the threshold uses only `s_m → +∞`. No sign condition on `c` or `A` is used, as the text says.

### Proposition `prop:running-asymptotic`

Correct.

- The substitution `m = i`, `N = N(i)`, `p = k(i)` is legitimate once `i ≤ N(i)`, and uniformity in `p` is what frees `k`.
- `ε = c/2` gives `x_i > c/2 > 0`, and `s_i > 0` on the same tail, so `β = s_i x_i > 0`.
- The identity `1/√x_i = √s_i/√β = g·√(log a_i^{-1})` holds on the positive tail.
- The cited rules require their hypotheses for every index (`x_n ≥ 0` for all `n`; `y_n ≠ 0` for all `n` and nonzero limit). The text applies them on a tail and then observes that altering finitely many terms does not affect convergence. That is sufficient.

### The citation

I downloaded <https://jirilebl.github.io/ra/html/sec_factslimsseqs.html> on 12 November 2026 (SHA-256 of the HTML `2bf861b19ffb89c27fd781ee16eb71da011463127982dad8fb791f3c7f78a100`) and read the two statements.

- Proposition 2.2.5 assumes `{x_n}`, `{y_n}` convergent; item (iv) adds `lim y_n ≠ 0` and `y_n ≠ 0` for all `n`, and concludes `lim x_n/y_n = lim x_n / lim y_n`.
- Proposition 2.2.6 assumes `{x_n}` convergent with `x_n ≥ 0` for all `n`, and concludes `lim √x_n = √(lim x_n)`.

Both are as the unit describes and both apply. The page shows no version number or date; the bibliography entry's "inspected" date is therefore the only version identifier, which the unit already acknowledges.

### Scale divergence

Correct: `a_m^{-1} = ∏_{j<m} B_j` with `B_j ≥ 3` gives `s_m = ∑_{j<m} log B_j ≥ m log 3`. Note `s_0 = 0`; the propositions only use `s_m > 0` eventually, and the text arranges that.

### Positivity of `b_0(G)`

The argument is right, with two unstated steps.

- The invariance identity holds: `tr([X,Y]Z) + tr(Y[X,Z]) = tr(XYZ) − tr(YZX) = 0`.
- Given an inner product for which each `ad e_j` is skew-adjoint, `−Tr((ad e_j)²) = Tr((ad e_j)^T ad e_j) = ∑_ℓ ‖[e_j,e_ℓ]‖²`. If `[X,Y] ≠ 0` for some `X, Y ∈ 𝔤`, bilinearity gives some `[e_j,e_ℓ] ≠ 0`. So `C_𝔤 > 0`.

## Required changes and remaining uncertainty

1. **State why `⟨X,Y⟩ = −r_G^{-1} Re tr(XY)` is an inner product on `𝔤`.** The text calls `(e_j)` an orthonormal basis and uses norms, but never says the form is positive definite. It is, because `𝔤` consists of skew-Hermitian matrices (`G ⊂ U(r_G)`), so `−tr(X²) = tr(X^*X) > 0` for `X ≠ 0`. One sentence is needed; without it the display `∑‖[e_j,e_ℓ]‖²` is not justified.
2. **State that `C_𝔤` does not depend on the orthonormal basis, and that `dim 𝔤 ≥ 1`.** The definition says "an orthonormal basis". Independence holds because `∑_j (ad e_j)²` is unchanged under an orthogonal change of basis. The division by `dim 𝔤` is harmless because a nonabelian algebra is nonzero; the hypotheses give this but the text does not say it. Closure of `𝔤` under brackets is the standard fact for the Lie algebra of a closed matrix group and could be mentioned with a reference to the existing background note on SU(2) or a textbook.

Suggestions, not required:

3. A normalisation example would help readers compare with the usual one-loop coefficient. By my hand computation (not checked against the source or a reference), for `SU(N)` in its defining representation `C_𝔤 = 2N²`, so `2b_0 = 11N²/(12π²)`, which is the standard `β = 2N/g²` running. If included it should be verified by someone else.
4. The symbol `g` for `β^{-1/2}` invites reading it as the usual coupling; with the normalisation above the two differ by the factor `√(2N)`. The closing paragraph's caveat covers the physical identification but not this constant.

Not checked: the running estimate `eq:running` itself (an explicit input of the unit); whether the manuscript's reading of `β` as "the action coefficient" is justified beyond the declarations listed in the Lean-correspondence report. I built `manuscript/main.tex` out of tree with `latexmk -pdf` (exit 0; no undefined references in the final pass; `pdftotext` finds no `??`) but did not inspect the rendered pages visually.

## Acceptance

Not recorded. This report is agent-assisted evidence for a human reviewer. Any edit made in response changes the content fingerprint and needs a renewed check.
