# Independent review of PR #272: `lem:ex-centered-root-seminorm`

- Unit: YM-000026 (existence monograph), C02 `manuscript/existence/centered-estimates.tex`, new `lem:ex-centered-root-seminorm` (with `eq:ex-centered-root-planted`, `eq:ex-centered-root-finite-sum`) and the real-projection paragraph that follows it.
- Role: mathematical validity and textual Lean correspondence (both).
- Human reviewer: none yet. This report was prepared autonomously by Claude (Anthropic) as a scheduled agent on behalf of ADB991. ADB991 has not read it. Under `docs/proof-standard.md`, a human reviewer must take responsibility before acceptance.
- Agent assistance: Claude Code, session `ADB991-claude-20261113-bb1d` (single agent, no subagents).
- Independence: ADB991 did not author PR #272, `centered-estimates.tex` (history: hairer a235312, TrishenGunaratnam 93fd865) or the C03 consumer passage.
- Reviewed content: PR #272 head `0c0215f83a9aa8b94de30aa084c2e93ab8ea6e7b` against base `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. `centered-estimates.tex` SHA-256 `dd6ae5865b967752c2bfccee9dd8c6264f127f39c52b5e633712ec0561f28f95`. Every inspected file is hashed in `hashes.json`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task: https://github.com/hairer/humanise-yang-mills/issues/268 (claim https://github.com/hairer/humanise-yang-mills/issues/268#issuecomment-6865137436).
- Outcome: **no required change.** The lemma is correct, conditional on the stated full-cell planted inequality. The correspondence records are accurate. The proposed attachment to I-C02-root-seminorm matches the consumer. Optional notes N1–N3 follow.

## Mathematics

The lemma has a single hypothesis: the full-cell planted inequality (103) for one law, one tiling and one strict home chamber. This is exactly the special case of the hypothesis of Theorem `ex-centered-producers` in which the injection `c` is a bijection `I = Cell(T)`. So the lemma introduces no new assumption, and in particular it does not assume the triangle inequality it proves. I checked each step.

1. **Closure of the admissible class.** Admissibility means gauge invariance, measurability, a finite sup bound, and dependence only on links with both endpoints in the strict home chamber. Each of these is preserved by sums, complex scalar multiples and pointwise conjugation, and the zero function is admissible. The proof gives exactly this. Correct.
2. **Finiteness and the zero case.** The copies are compositions with measurable configuration maps, possibly followed by conjugation, so finite products of copies are bounded and measurable. They are therefore integrable for the probability law. Since `M ≥ 1`, the copied product of `0` is `0`, so `ρ(0) = 0`. Correct.
3. **Absolute homogeneity.** For each cell, `(zF)^{(C)} = w_C F^{(C)}` with `w_C ∈ {z, z̄}`. This holds pointwise, before any expectation or absolute value. Then `|∏ w_C| = |z|^M`, and taking the nonnegative `M`th root gives `ρ(zF) = |z| ρ(F)`. This also covers `z = 0` and needs no balance between conjugated and unconjugated cells. Correct.
4. **Triangle inequality.** The proof proceeds as follows.
   - Copies are additive, including the conjugated ones, so `∏_C (F+G)^{(C)}` expands into `2^M` subset terms by finite distributivity.
   - Integrate the finite sum and apply the triangle inequality in `ℂ`.
   - Apply (103) to each assignment `H_{S,·}`. Every entry is `F` or `G`, so each family lies in the admissible class.
   - Recombine by distributivity to get `(ρ(F)+ρ(G))^M`, then take the nonnegative `M`th root, which is monotone on `[0, ∞)`.

   No division by a root value occurs, so `ρ(F) = 0` and `ρ(G) = 0` are both covered. Correct.
5. **Conjugation invariance.** For both values of `ε_C`, `(F̄)^{(C)}` equals the conjugate of `F^{(C)}`. Conjugation commutes with finite products and with integration against a positive measure, and `|w̄| = |w|`. Correct.
6. **Finite sums.** Induction on `|I|` from closure, the triangle inequality and homogeneity gives (104). The empty sum is `0` with `ρ(0) = 0`. Replacing `ρ(F_i)` by budgets `A_i ≥ ρ(F_i)` keeps the inequality. Correct.
7. **Real projection.** Since `Ū = U`, `V − U = ½(U' − U) + ½·conj(U' − U)`. Steps 3, 4 and 5 then give `ρ(V − U) ≤ ρ(U' − U)`, and `V` is admissible by step 1. Correct.

The lemma claims no positive-definiteness, and none is needed. The closing paragraph correctly says that the planted inequality itself (its reflection-positivity/chessboard producer) and any centered budget along a trajectory remain separate inputs.

Literature: a reference is not needed. The argument is the standard derivation of a seminorm from a Hölder/chessboard-type product bound, here written out completely in a few lines.

## Lean correspondence (textual; nothing elaborated)

I read each declaration below at the pinned revision.

- `YM.Cells.Tiling.copy` (`Lean/YM/Cells/Tiling.lean` l.222): the copy is `F ∘ pull (omega v) (translateBy v)`, followed by `star` exactly when `hand v` holds, i.e. when an odd number of axes are reversed. This matches the manuscript's `P_C` and `ε_C ∈ {0,1}`.
- `YM.Cells.Tiling.rootTest` (l.226): `‖moment β (∏ copies)‖ ^ (card Cell)⁻¹`.
- `YM.Wilson.moment` (`Lean/YM/Wilson/Law.lean` l.99): integral against `law`, which carries an `IsProbabilityMeasure` instance (l.89).
- `YM.Cells.Tiling.cells_positive` (`Chess.lean` l.19): `M ≥ 1`.
- `YM.Cells.Interior` (`Cut.lean` l.109): gauge invariance, measurability, `LocalOn K`, and a finite bound. `LocalOn`/`Agrees` (`Lean/YM/Lattice/Path.lean` l.192–197) is agreement on links whose two endpoints lie in `K`. This matches "both endpoints in the strict home chamber"; `Tiling.chamber` is defined by `Kind.Strict` margins.
- `YM.Cells.Interior.constant/real/scale/plus` (`Interior.lean`): the closure facts used in step 1.
- `YM.Cells.Tiling.tiles` (`Chess.lean` l.80) is exactly the full-cell planted inequality (103). `YM.Cells.Tiling.adds` (l.108) proves the triangle inequality by expanding over `Cell → Bool`, applying `norm_sum_le`, then `tiles` termwise, then `Fintype.prod_sum`. This is step 4 with subsets in place of Boolean assignments.
- `YM.Cells.Seam` and `YM.Cells.laws` (`Certificate.lean` l.14–24): `laws` fills `inequality` from `tiles` and `semi` from `adds`, using `Slice.reflected_positive` for `β ≥ 0`. The author's correction to their own record, that the theorem is `YM.Cells.laws` and not `YM.Cells.Seam.laws`, is accurate.
- `YM.Next.Extract.root_smul` and `.rooted` (`Next/EXTRACTION/Basis.lean` l.27, l.46): homogeneity via `star c` or `c` per cell, and finite-sum induction through `Seam.semi`, matching step 6.
- `YM.Work.B15.rootTest_star` (`Work/B15.lean` l.16): conjugation invariance, matching step 5.
- `YM.MergeProof.Accent.realityC` (`MergeProof/South/FinalG.lean` l.35): writes `paint(Re U') − U = s•w + s•star w` with `s = 1/2`, then applies `semi`, `root_smul` and `rootTest_star`. This matches the real-projection paragraph, at the station depth `J` tiling `center C.S p hk 0`.

`correspondence.md` describes all of these accurately. `response.md`'s proposed attachment matches the consumer: the C03 ledger row I-C02-root-seminorm (base l.89), the finite-combination premise of `lem:ex-public-origin-sum`, and the "triangle inequality and invariance under complex conjugation … are inputs here" sentence before `prop:ex-public-origin` (`phase-quantitative-producer.tex`).

## Optional notes (no change required)

- **N1.** Item 2 of `prop:ex-public-origin` also assumes that "the centered chamber interior … is preserved by the real-part projection used below". The closure part of the new lemma (sums, scalars and conjugation in `𝒜`) supplies this too: `V = (Z+Z̄)/2 ∈ 𝒜`. Whoever applies the attachment to the ledger could record that this clause is discharged as well.
- **N2.** The pre-existing sentence after Definition `ex-centered-budget` says copies are "reflected and conjugated on alternating chambers". In the source, each axis is reflected according to the parity of that cell coordinate, and conjugation is applied iff an odd number of axes is reflected (`hand`). The lemma abstracts this as fixed `(P_C, ε_C)`, so its proof is unaffected. Only the older wording is imprecise, and that text is outside this PR's scope.
- **N3.** `realityC` also returns the sup bound `|Re U'| ≤ α`. The real-projection paragraph rightly leaves this to the consumer, since it is pointwise and trivial.

## Checks actually run (this session)

- `python3 scripts/check_blueprint.py` at PR head: `Blueprint structure OK: 4 units.`
- `python3 -m unittest discover -s tests` at PR head: 22 tests, OK.
- The author's `verify.py` at PR head: it first failed because commit `135cd51` (the PR #219 head) was missing locally. After `git fetch origin pull/219/head` it printed `PASS 15 frozen versions, 13 current hashes, 10 source-manifest entries; source and C03 unchanged`.
- `git diff --check 69b2631 0c0215f`: clean.
- From `manuscript/`: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<tmp> existence.tex` finished with exit 0 and 984 pages. The log has no `undefined` occurrences. I rendered pp. 90–92 (Lemma 18.2, its proof and the real-projection paragraph) at 70 dpi and inspected them visually. The text is legible, displays are not clipped, and the equation numbers (103) and (104) resolve.
- Lean: nothing elaborated or built and no axiom audit. The correspondence above is a textual reading only.

## Acceptance

Not recorded. A human reviewer must take responsibility. Any material edit to the lemma changes the fingerprint above and requires renewed review.
