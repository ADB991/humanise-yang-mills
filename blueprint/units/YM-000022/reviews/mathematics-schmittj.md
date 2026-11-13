# Review of a proof unit

- Unit: YM-000022, `blueprint/units/YM-000022/`
- Role: mathematical validity
- Human reviewer: schmittj (no acceptance recorded; see the last section)
- Agent assistance: one Claude Opus reviewer agent, coordinated by a Claude session. The agent checked the argument, opened the cited sources and wrote this report. No other model was used.
- Content SHA-256: `37a404dea24a3001c320680e4b25334e619d6865178c86e3d85993bb4000168f` (`python3 scripts/check_blueprint.py --fingerprint YM-000022` at commit `d4be082`, head of draft PR #111; this equals the fingerprint recorded in the revision README)
- Reviewed content: commit `d4be082` ("docs: repair running-coefficient positivity and source anchors"), the single revision commit on top of `47762e9`. File SHA-256: `manuscript/pilots/running-coupling.tex` `3f10d3ac67788342c85ed368691b8ea35b81bbc052ec1dd7a67c9a7e1d02a0ca`; `manuscript/preamble.tex` `0827ef173e55ac6cf7b9726f3cbaaa5be93a5dfac8ffb2cfdf7b3faed65e90df`; `manuscript/references.bib` `2d5d144741d57e970b239c69184b7566f90aa9355293026cfe26f37f0f73dbb7`; `correspondence.md` `ab7053e8121e39802821ddbc2872160b91d4722aa686b66f25e0ccea9f17958c`; `unit.json` `cfc20482faefa90b34cca4d903b0b21620efd55e60dd333cbeb69b8b96986731`; `revisions/mgubi-astra-22-repair-20261113/README.md` `2cba60fb7c67fc7c761611f18ec5973b8b074061c85db89a1d539678dd157cd3`.
- Manuscript files and labels: `manuscript/pilots/running-coupling.tex` (`sec:running-coefficient`, `eq:running`, `prop:uniform-extraction`, `prop:running-asymptotic`), `manuscript/preamble.tex`, `manuscript/references.bib`. The list in `unit.json` is complete for this section.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22), review claim by session `schmittj-claude-review22-rev-20261113`; author revision in draft PR #111.
- Outcome: changes requested (one small citation gap; the mathematics is otherwise correct). This is an agent review without human acceptance.

I am not an author of this unit. The previous reviewer (mgubi) is now credited as an author of this revision, so the reports `reviews/*-mgubi.md` cannot serve as review of the current fingerprint; this report is independent of them in that sense, although I read them.

## Findings and evidence

I reviewed the whole section, not only the diff, and recomputed every step.

### Inner product and positive definiteness (new text)

Correct. For `X` in the Lie algebra, `t ↦ exp(tX)` is a curve of unitary matrices with value `I` and derivative `X` at `0`; differentiating `exp(tX)^* exp(tX) = I` gives `X^* + X = 0`. The form `⟨X,Y⟩ = −r_G^{-1} Re tr(XY)` is real bilinear and symmetric (`tr(XY) = tr(YX)`). On skew-Hermitian matrices `−tr(XX) = tr(X^*X) = Σ_{a,b} |X_{ab}|^2`, which is real and positive for `X ≠ 0`, so the form is an inner product on `𝔤`; the sign convention is right. The class of algebras is exactly the one the hypotheses give: real subalgebras of `u(r_G)`, i.e. Lie algebras of closed subgroups of `U(r_G)` (compact type). The display writes `r_G^{-1} tr(X^*X)` without `Re`; this is harmless because the trace is real (NIT).

### Casimir constant, basis independence, nonzero dimension (new text)

Correct. If `f_i = Σ_j q_{ij} e_j` with `q` orthogonal, linearity of `ad` gives `Σ_i (ad f_i)^2 = Σ_{j,k} (qᵀq)_{jk} ad e_j ad e_k = Σ_j (ad e_j)^2`; any two orthonormal bases are related by such a `q`, so `C_𝔤` is basis independent. A nonabelian algebra contains a nonzero element, so `dim_ℝ 𝔤 ≥ 1` and the division is legitimate. Only the nonabelian clause of simplicity is used here (and for positivity below); the section keeps the full simplicity hypothesis, which is harmless and matches the source.

### Positivity of `b_0(G)`

Correct. I rechecked `⟨[X,Y],Z⟩ = −⟨Y,[X,Z]⟩`: both sides equal `−r_G^{-1} Re(tr(XYZ) − tr(YXZ))` after cycling `tr(YZX) = tr(XYZ)`. Hence each `ad e_j` is skew-adjoint, `−Tr_𝔤((ad e_j)^2) = Tr((ad e_j)ᵀ ad e_j) = Σ_ℓ ‖[e_j,e_ℓ]‖^2`, and `C_𝔤 = (dim 𝔤)^{-1} Σ_{j,ℓ} ‖[e_j,e_ℓ]‖^2`. If all `[e_j,e_ℓ]` vanished, bilinearity would make `𝔤` abelian; so `C_𝔤 > 0` and `b_0(G) = 11 C_𝔤/(48π^2) > 0`.

Normalisation check (my hand computation, offered for orientation; not a claim of the section): for `SU(N)` in the defining representation, `e_a = i√(2N) T^a` with `tr(T^aT^b) = δ_{ab}/2` is orthonormal, `[e_a,e_b] = −√(2N) f_{abc} e_c`, so `C_𝔤 = 2N · N(N^2−1)/(N^2−1) = 2N^2` and `2b_0(G) = 11N^2/(12π^2)`. With the conventional `β = 2N/g_{std}^2` and `b_0^{std} = 11N/(48π^2)` one gets `β ≈ 2N · 2b_0^{std} log(a^{-1}) = 11N^2/(12π^2) log(a^{-1})`, consistent with `c = 2b_0(G)`. So the constant is the expected one; but `b_0(G)` is `2N b_0^{std}` for `SU(N)`, and `g = β^{-1/2} = g_{std}/√(2N)` (NIT; see suggestion 3).

### Scale divergence

Correct: `a_m^{-1} = Π_{j<m} B_j` with integers `B_j ≥ 3`, so `s_m = Σ_{j<m} log B_j ≥ m log 3 → ∞`. Here `s_0 = 0`; only eventual positivity is used.

### The running estimate `eq:running`

Stated correctly as an explicit outstanding input: one fixed intercept `β̄`, and for every `η > 0` a threshold `m_0(η)` uniform in `N ≥ m` and `p`. The section does not claim to prove it. Quantifier order (`∀η ∃m_0 ∀m ≥ m_0 ∀N ≥ m ∀p`) matches what the propositions use.

### `prop:uniform-extraction`

Correct. With `η = ε/2` and `s_m > 2(|A|+1)/ε`: `|β/s_m − c| ≤ |β − (A + c s_m)|/s_m + |A|/s_m ≤ ε/2 + |A|/s_m`, and `|A|/s_m < ε|A|/(2(|A|+1)) < ε/2`. Both thresholds depend on `ε` only. No sign of `A` or `c` is used.

### `prop:running-asymptotic`

Correct, conditional on `eq:running` and `c = 2b_0(G) > 0`. Substituting `m = i`, `N = N(i)`, `p = k(i)` is legitimate once `i ≤ N(i)`; uniformity in `p` is what frees `k`. Taking `ε = c/2` gives `x_i > c/2 > 0` and `β = s_i x_i > 0` eventually. Lebl's rules are applied on the positive tail, and the finite-modification remark handles their "for all `n`" hypotheses. The identity `1/√x_i = √s_i/√β = g √(log a_i^{-1})` holds on that tail. There is only one limit, so no order-of-limits issue arises. NIT: the proposition's statement does not name its standing hypotheses (the fixed family with `eq:running`, and the nonabelian/simple `𝔤` giving `c > 0`); they are only in the preceding paragraph and in the proof's first line.

### Closing remark

Correct as worded. At `N(i) = i` the coefficient is the one in the bare density `exp(−β Σ_faces (1 − r_G^{-1} Re tr U_p))` (see the Lean-correspondence report). The section does not write this action out; doing so in one line would let readers compare with the usual Wilson normalisation (suggestion 4).

### Literature

Lebl, *Basic Analysis I*, Propositions 2.2.5(iv) and 2.2.6: I did not refetch the page; the previous mathematics review (`reviews/mathematics-mgubi.md`) records its statements and hash, the propositions as quoted there are the standard ones and apply as used, and the scalar proofs are unchanged by this revision.

Hall, arXiv:math-ph/0005032v1: I downloaded the versioned PDF on 13 November 2026 (`https://arxiv.org/pdf/math-ph/0005032v1`, 128 pages, SHA-256 `2be9f80ed20b18b361c759d386dfd6804d5f9b31cb94b547a29883fa78f8f7f1`) and read the cited passages. Chapter 3, Definition 3.13 (printed p. 36): the Lie algebra of a matrix Lie group is the set of `X` with `e^{tX} ∈ G` for all real `t`. Section 5.4 of Chapter 3 (printed p. 37): `e^{tX}` is unitary for all `t` iff `X^* = −X`, by differentiating at `t = 0`. Theorem 3.16 (printed pp. 40–41): `g` is closed under real scalars, sums and `XY − YX`. Hall's "matrix Lie group" is a subgroup of `GL(n;ℂ)` closed in `GL(n;ℂ)`; a closed subgroup of `U(r_G)` is one. The citations are precise and applicable. However, they appear only in the revision README; neither the manuscript nor the correspondence's literature section cites Hall (finding 1).

### Build

I built `manuscript/main.tex` out of tree with `latexmk -pdf` (exit 0, three pages); the log has no warnings, undefined references or over/underfull boxes, and `pdftotext` finds no `??`. I did not visually inspect the rendered pages.

## Required changes and remaining uncertainty

1. **GAP (citation): define `𝔤` and cite the facts that make it a Lie algebra.** The section never defines `𝔤`; its first new sentence ("Since `exp(tX)` is unitary for `X ∈ 𝔤`") silently uses the one-parameter definition, and the definition of `C_𝔤` needs `ad e_j` to map `𝔤` into itself, i.e. closure of `𝔤` under commutators, which for the one-parameter set is a theorem (it needs the Lie product formula and closedness of `G` for sums). The phrase "with nonabelian simple real Lie algebra `𝔤`" presupposes this without reference. Smallest repair: one sentence, "Here `𝔤 = {X : e^{tX} ∈ G for all t ∈ ℝ}`, a finite-dimensional real Lie algebra under `[X,Y] = XY − YX` [Hall, Definition 3.13 and Theorem 3.16]", plus a `references.bib` entry for the versioned arXiv source (and optionally Hall §5.4 next to the derivative argument). The author has already checked these passages; they should also be listed in the correspondence's literature section. The previous review raised this only as optional, so it is a new request.

Suggestions, not required:

2. State the standing hypotheses in `prop:running-asymptotic` ("Assume `eq:running`; `𝔤` nonabelian").
3. Note that `b_0(G)` is not the conventional one-loop coefficient: for `SU(N)`, `b_0(G) = 2N b_0^{std}` and `g = g_{std}/√(2N)` (my computation above; to be verified independently if included).
4. Write out the bare Wilson action `β Σ_p (1 − r_G^{-1} Re tr U_p)` in the closing remark.

Not checked: the running estimate `eq:running` and the construction that is said to supply it (an explicit input of the unit); Lebl's page was not refetched; the rendered PDF was not inspected visually.

### Commands run

```sh
git log --oneline -5; git diff d4be082~1 d4be082
sha256sum manuscript/pilots/running-coupling.tex manuscript/preamble.tex manuscript/references.bib blueprint/units/YM-000022/{correspondence.md,unit.json} blueprint/units/YM-000022/revisions/mgubi-astra-22-repair-20261113/README.md
python3 scripts/check_blueprint.py                      # Blueprint structure OK: 2 units. Lean and mathematics were not verified.
python3 scripts/check_blueprint.py --fingerprint YM-000022   # 37a404de…168f
curl -sSL -o hall.pdf https://arxiv.org/pdf/math-ph/0005032v1; pdftotext -layout hall.pdf hall.txt   # scratch directory
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> main.tex   # exit 0
```

## Acceptance

Not recorded. This is an agent review without human acceptance; any edit in response changes the fingerprint and needs renewed review.
