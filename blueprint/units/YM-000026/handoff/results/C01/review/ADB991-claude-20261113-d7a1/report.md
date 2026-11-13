# Independent review of PR #306: `prop:ex-lattice-reflection-invariance`

- Unit: YM-000026 (existence monograph), C01 `manuscript/existence/lattice.tex`, subsection `subsec:ex-lattice-finite-reflection`. New text: the paragraph defining the reflection `r` and its pullback `eq:ex-lattice-reflection-pullback`, `prop:ex-lattice-reflection-invariance` with its proof, and the closing sentence attaching it to `prop:ex-centered-planted`. Also read: the author note `results/C01/author/hairer-claude-20261113-reflinv/README.md` and the C01 `HANDOFF.md` hash change.
- Role: mathematical validity and textual Lean correspondence (both).
- Human reviewer: none yet. This report was prepared autonomously by Claude (Anthropic) as a scheduled agent on behalf of ADB991. ADB991 has not read it. Under `docs/proof-standard.md`, a human reviewer must take responsibility before acceptance.
- Agent assistance: Claude Code, session `ADB991-claude-20261113-d7a1` (single agent, no subagents).
- Independence: ADB991 did not author PR #306, issue #304 or `lattice.tex`. Our earlier review #290 (session 49cc) of `prop:ex-centered-planted` noted (O1) that the invariance hypothesis is the source theorem `YM.Wilson.moment_pull`; this review does not re-examine that proposition.
- Reviewed content: PR #306 head `04dae86706fb64d4155e6883d76f510e63ae5eab` (merged into `codex/existence-monograph` as `ee1a8dc`). `lattice.tex` SHA-256 `cdd4d7ffdf5a6dad3526a288492321cbacf4bad092a6a2577bfe92722549d24f`, matching the updated C01 `HANDOFF.md` entry. `lattice.tex` and `centered-estimates.tex` are byte-identical at the current integration head `36a84131`. Hashes in `hashes.json`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (imported `Lean/` tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`).
- Review task: https://github.com/hairer/humanise-yang-mills/issues/304 (claim https://github.com/hairer/humanise-yang-mills/issues/304#issuecomment-6866673815).
- Outcome: **no required change.** The proposition is correct as stated and the proof is complete at monograph level. Minor notes N1–N2 and optional notes O1–O3 follow.

## Mathematics

I rederived each step before comparing it with the text.

1. **Pullback formula (eq. `ex-lattice-reflection-pullback`).** `r` is an affine involution of `Λ_ℓ` (`r(rx) = x` since `2c−κ−(2c−κ−x_a) = x_a`), well defined mod `ℓ` for every integer `c`. For `i ≠ a`, `r(x+e_i) = rx+e_i`, so the positive edge `(x,i)` goes to the positive edge `(rx,i)`. For `i = a`, `r(x+e_a) = rx−e_a`, so `(x,a)` goes to the negatively oriented edge from `rx` to `rx−e_a`, read as `U_a(rx−e_a)^{-1}`. This gives the displayed formula. With `ℓ = 2h`, `c = 0`: `κ = 0` gives `t ↦ −t` and `κ = 1` gives `t ↦ −1−t`, the two cuts of the subsection. Correct.
2. **Involution.** `(Θ²U)_a(x) = ((ΘU)_a(rx−e_a))^{-1} = U_a(r(rx−e_a)−e_a)`, and `(r(rx−e_a))_a = x_a+1`, so the argument is `x`. For `i ≠ a` it is `r² = id`. Correct.
3. **Invariance of `ρ_ℓ`.** On the coordinates of `G^{E_ℓ}`, `Θ` is the relabelling `(x,i) ↦ (rx,i)` for `i ≠ a` and `(x,a) ↦ (rx−e_a,a)` (both bijections of `Λ_ℓ`), followed by inversion of the `a`-coordinates. Haar probability measure on a compact group is inversion invariant (compact groups are unimodular), and a finite product of copies of one probability measure is invariant under coordinate relabelling and under coordinatewise measure-preserving maps. Correct.
4. **Plaquettes.** I expanded all three cases with `U_{ij}(x) = U_i(x)U_j(x+e_i)U_i(x+e_j)^{-1}U_j(x)^{-1}`.
   - `a ∉ {i,j}`: all four links are off-axis and `r` commutes with `+e_i, +e_j`, giving `U_{ij}(rx)`.
   - `i = a < j`, `z = rx−e_a`: the factors are `U_a(z)^{-1}`, `U_j(r(x+e_a)) = U_j(z)`, `(ΘU)_a(x+e_j)^{-1} = U_a(z+e_j)`, `U_j(rx)^{-1} = U_j(z+e_a)^{-1}`. Their product is `U_a(z)^{-1}·[U_j(z)U_a(z+e_j)U_j(z+e_a)^{-1}U_a(z)^{-1}]·U_a(z) = U_a(z)^{-1}U_{aj}(z)^{-1}U_a(z)`.
   - `i < j = a`, `z = rx−e_a`: the factors are `U_i(rx) = U_i(z+e_a)`, `U_a(z+e_i)^{-1}`, `U_i(r(x+e_a))^{-1} = U_i(z)^{-1}`, `U_a(z)`, and the product equals `U_a(z)^{-1}U_{ia}(z)^{-1}U_a(z)`.

   Both displays in the text are exactly these. Correct.
5. **Action.** `Re tr V^{-1} = Re tr V^* = Re conj(tr V) = Re tr V` for unitary `V`, and trace is conjugation invariant, so each summand of `S_ℓ(ΘU)` at `(x,i,j)` equals the summand of `S_ℓ(U)` at `(rx,i,j)` or `(rx−e_a,i,j)`. For fixed `i<j` both maps are bijections of `Λ_ℓ`, so the sums agree. Correct.
6. **Law.** With `S_ℓ∘Θ = S_ℓ` and `Θ_*ρ_ℓ = ρ_ℓ`, `∫F∘Θ dμ = Z^{-1}∫(F e^{-βS})∘Θ dρ = Z^{-1}∫F e^{-βS} dρ`. Correct. Bounded Borel `F` suffice to determine the measure.
7. **Small sides.** Nothing in the argument uses `ℓ ≥ 2` or `ℓ` even: all statements are about labels in `Λ_ℓ × {0,…,3}`, and the plaquette identities are formal. The proposition's "every positive integer `ℓ`" is justified.
8. **Attachment to `prop:ex-centered-planted`.** That proposition (centered-estimates.tex) assumes invariance of `μ` under the pullback `R_{p,a}` of `x_a ↦ 2(b_a+ℓp_a)−δ−x_a` on the torus of side `2hℓ`, "including reversal of oriented links". This is the present `Θ` with torus side `2hℓ`, `c = b_a+ℓp_a`, `κ = δ`. The law there is `E_{N,p}`, which `lattice.tex` (around l. 286) identifies with `μ_{ℓ_{N,p},β_{N,p}}`. So the closing sentence is correct, and the invariance hypothesis of `prop:ex-centered-planted` is now proved in the manuscript for the Wilson law. Seam positivity remains a separate hypothesis there (covered by `prop:ex-lattice-finite-reflection` for the cuts it treats); this PR does not claim otherwise.

**Literature.** Reflection invariance of the Wilson action and of the product Haar measure is classical in the reflection-positivity literature for lattice gauge theory (Osterwalder–Seiler 1978). I did not read that source in this run and give no locator; the self-contained proof in the PR is short and complete, so no citation is needed for correctness.

### Notes

- **N1 (minor, notation).** In the closing sentence, `ℓ` means the cell side of `prop:ex-centered-planted`, while in the proposition just proved `ℓ` is the torus side (and earlier in the same subsection `ℓ = 2h`). Writing "apply the proposition with torus side `2hℓ` in place of `ℓ`" (or using another letter for the generic side) would remove the clash.
- **N2 (minor).** The statement asserts that `Θ` is measurable, but the proof only shows that it is an involution acting by relabelling and inversion. One phrase suffices: `Θ` is continuous (a coordinate permutation composed with inversion in some coordinates), hence Borel, and indeed a homeomorphism.
- **O1 (optional).** The restriction `β ≥ 0` is not used: invariance holds for every real `β`, as the source (`YM.Wilson.law_pull`, all `β : ℝ`) and the earlier remark in `lattice.tex` that the law is defined for every real `β` both indicate. Harmless as stated, since positivity needs `β ≥ 0` anyway.
- **O2 (optional).** The source proves invariance under every signed permutation of the axes composed with any translation, not just the single-axis reflections. A one-line remark could record this, since translation invariance of the Wilson law is used elsewhere (e.g. `fullmesh-fixedbounds-producer.tex` l. 234 "Invariance of the Wilson law under translations and …").
- **O3 (outside this PR).** `prop:ex-centered-planted` calls `R_{p,a}` "the site reflection" even when `δ = 1`; `lattice.tex` correctly calls `κ = 1` a link reflection. Worth harmonising in a later C02 edit.

## Lean correspondence (textual; nothing elaborated)

Read at the pinned revision:

- `YM.Lattice.pull` (`Lean/YM/Lattice/Path.lean`): `pull s b U (x,i) = ((posDir i).rotate s).read U (s.act x + b)`, where `Step.read` of a negative step at `y` is `U(y − e_i, i)^{-1}`. For `s` the signed permutation with identity `perm` and `flip` true only at `a`, and `b = (2c−κ)e_a`, this is exactly eq. `ex-lattice-reflection-pullback`: `s.act x + b = rx`, and the rotated step for `i = a` is `negDir a`, read as `U_a(rx−e_a)^{-1}`.
- `YM.Wilson.prior_pull` (`Lean/YM/Wilson/Symmetry.lean`): measure preservation of the product Haar prior, proved as a relabelling of edges (`sendEdge`, a bijection by `sendEdge_injective` and finiteness) composed with coordinatewise inversion on flipped axes (`G.preserve_inv`). This is step 3.
- `YM.Wilson.energy_pull` (`Lean/YM/Wilson/Law.lean`) with `YM.Lattice.Face.send_price` and `Face.injective_send` (`Lean/YM/Lattice/Faces.lean`): the face value of the pulled configuration has the same `price` as a face of `U`, using exactly `price_inv` and `price_conj` (`Lean/YM/Gauge/MatrixGroup.lean`, `price u = 1 − Re tr(mat u)/repDim`), and `Face.send` is a bijection of faces. This is steps 4–5; the manuscript's explicit conjugate-inverse holonomies are a concrete instance of `send_price`.
- `YM.Wilson.law_preserved`, `law_pull`, `moment_pull`: invariance of `law G n β` for all real `β` and of integrals of integrable `F`. This is step 6.
- `continuous_pull`: continuity, supporting N2.

The author note's correspondence (textual, via `YM.Slice.reflected_positive` and `YM.Wilson.moment_pull`) is accurate; `law_pull`/`energy_pull`/`prior_pull` are the more direct matches for the proposition itself.

## Evidence (commands actually run)

On PR #306 head `04dae86`:
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units.`
- `python3 -m unittest discover -s tests`: OK.
- `sha256sum manuscript/existence/lattice.tex`: `cdd4d7ff…49d24f`, equal to the C01 `HANDOFF.md` entry.
- `git diff --quiet 04dae86 36a84131 -- manuscript/existence/lattice.tex manuscript/existence/centered-estimates.tex`: identical.
- `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`: exit 0, 1011 pages, no undefined references. `prop:ex-lattice-reflection-invariance` is Proposition 2.2 on p. 25; pp. 25–26 rendered with `pdftoppm` and inspected (formulas, cross-reference to Proposition 18.2, proof end).

Not run: Lean elaboration or `#print axioms` (the correspondence above is textual); Osterwalder–Seiler not re-read.
