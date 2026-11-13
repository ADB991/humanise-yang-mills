# Review of a proof unit

- Unit: YM-000022, `blueprint/units/YM-000022/`
- Role: Lean correspondence
- Human reviewer: ADB991 (no acceptance recorded; see the last section)
- Agent assistance: one Claude agent running as a scheduled session (`ADB991-claude-20261113-af9e`) on behalf of ADB991. It read the pinned source text and wrote this report. ADB991 had not read it before submission. No other model was used.
- Content SHA-256: `24db9174727f1abf8bcb4211cb1c3bc601711dfd4c193983b1fde864a02ce056` (`python3 scripts/check_blueprint.py --fingerprint YM-000022` on `main` at `f73c5002e8d7e716fe5cce58185ec46ea74951b4`, after PR #115 merged)
- Reviewed content (file SHA-256): `manuscript/pilots/running-coupling.tex` `105a1a28…5426`; `manuscript/preamble.tex` `0827ef17…90df`; `manuscript/references.bib` `844ea80b…ac53`; `correspondence.md` `c9feae1f…655f`; `unit.json` `cfc20482…6731` (full hashes in `mathematics-adb991.md`).
- Manuscript files and labels: `manuscript/pilots/running-coupling.tex` (`sec:running-coefficient`, `eq:running`, `prop:uniform-extraction`, `prop:running-asymptotic`), `manuscript/preamble.tex`, `manuscript/references.bib`. The list is complete.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22), claim https://github.com/hairer/humanise-yang-mills/issues/22#issuecomment-6848731664; this report-only draft PR against `main`.
- Outcome: no change required; one nit. This is an agent review: no human acceptance and no approval field is set.

ADB991 is not an author of YM-000022 and wrote none of its earlier revisions or reviews.

## Findings and evidence

Evidence level: **[S]** means I read the source text under `Lean/` at the pinned revision. Nothing was elaborated: this environment cannot reach the Mathlib sources or cache, so `lake build` and `#print axioms` were not run. The unit's retained `evidence/lean-inspection.txt` was not regenerated. `python3 blueprint/units/YM-000022/evidence/check_sources.py` reports OK for all 7 inspected files against `Lean/SOURCES.sha256`.

PR #115 changed no Lean anchor in the table. It added a literature paragraph and a status paragraph to `correspondence.md` and changed the opening of the section. I nevertheless rechecked the whole table against the current text.

### The new opening against the source

1. **Lie algebra definition** [S]. `YM.Gauge.Generates X := ∀ t : ℝ, exp (t • X) ∈ range G.mat` (`Lie.lean:26`), and `YM.Gauge.lie` is the real submodule with this carrier (`Lie.lean:126–134`). This is exactly the displayed set {X : exp(tX) ∈ G for every real t}, with G identified with `range G.mat`, as the correspondence states. It is also Hall's Definition 3.13.
2. **Closedness** [S]. `YM.Gauge` (`MatrixGroup.lean:23–26`) is a natural number `n` together with a `Subgroup` of `Matrix.unitaryGroup (Fin (n+1)) ℂ` satisfying `IsClosed` in the unitary group. This is the text's "closed matrix subgroup of U(r_G)", with `r_G = repDim = n + 1` and `dimPos : 0 < repDim` (`:73–75`). The text's step "U(r_G) closed in GL, so G closed in GL" is ordinary topology. The source does not need it, because it proves bracket closure itself.
3. **Skew-Hermitian generators and bracket closure** [S]. `generates_skew : G.Generates X → star X = -X` (`Lie.lean:42–44`, via `tangent_skew`), and `bracket_mem : X ∈ G.lie → Y ∈ G.lie → X*Y - Y*X ∈ G.lie` (`Lie.lean:159–176`). The source proves bracket closure by differentiating conjugation and using that `G.lie` is closed (`closed_lie`, by finite dimensionality). That is Hall's own proof of Theorem 3.16(3). The citation therefore replaces, rather than misdescribes, the formal argument.
4. **Simplicity** [S]. `YM.Gauge.Simple` (`Lie.lean:178–182`) consists of a nonabelian clause (some X, Y ∈ `G.lie` with XY − YX ≠ 0) and an ideal clause over real submodules. This is "nonabelian simple real Lie algebra".

### Casimir and slope

5. [S] `casimir = −(Σ_i trace(ad b_i ∘ ad b_i)) / lieDim` over the standard basis of `Color = EuclideanSpace ℝ (Fin lieDim)` (`Colors.lean:180–182`). `trace_color` (`:71–75`) gives −Re tr(colorMat c · colorMat d) = repDim · ⟨c, d⟩. Hence `colorMat` sends the standard basis to an orthonormal basis of g for the text's form −r_G^{-1} Re tr(XY). `colorMat_ad` (`:152–154`) identifies `ad` with the matrix commutator. So `casimir` is the text's C_g computed in one orthonormal basis. The text proves basis independence separately, which the source does not need. `slopeConstant = 11·casimir/(24π²)` (`:184`), `b0 G = 11·casimir/(48π²)` and `b0_normalizes : 2*b0 G = slopeConstant` (`RawAxis.lean:13–14`) match the text's b_0(G) and c = 2b_0(G).
6. [S] Positivity: the source uses `slopeConstant_pos` ← `casimir_pos` ← `trace_adjoint` (`Casimir.lean:140–176`), which needs the ideal clause. The text gives a different, valid argument using only the nonabelian clause, and the correspondence says so. Both lead to the same conclusion under the source's hypothesis `G.Simple`.

### Owned statements

7. `zeroUp_bound` (`RawAxis.lean:15–30`) [S]: from `C.Makes` and `0 < ε`, eventually in m, for all N and p with m ≤ N, |β_{N,p,m}/s_m − 2b0| < ε. There is no simplicity hypothesis, because `include hc hg` comes after this lemma (line 33). `prop:uniform-extraction` is the abstract version with arbitrary A and c. The source instantiates it with A = `clock.bar` and c = `slopeConstant`, via `hc.wilson.running` (`Construction.lean:44–45`, `History.lean:229–231,240`).
8. `regulatorRun` (`:35`) and `comparison` (`:36–48`) [S]. The hypotheses are `C.Makes`, `G.Simple` and `∀ᶠ i, i ≤ N i`; k is unconstrained. The conclusion is that (√β_{N(i),k(i),i})⁻¹ · √(log (a_i)⁻¹) tends to (√(2b0))⁻¹. This matches `prop:running-asymptotic`. The text adds the eventual positivity of β, which the source never states but which follows inside the proof (the text derives it). The correspondence's remark on the totalized √ and ⁻¹ is accurate.
9. Running input [S]. `Running` (`History.lean:229–231`) says: for every ε > 0, eventually in m, for all N, p with m ≤ N, |β − hatBeta m| ≤ ε · scale m, where `hatBeta m = bar + slopeConstant · scale m` (`:79`). This is `eq:running` with η = ε, and `bar` is a fixed field of the `Calendar` (`:64–73`). The source's `bar_pos` is not used by the text, as the correspondence notes.
10. Schedule [S]. `block_large : 3 ≤ (block m).val` (`Scale.lean:31`). `denominator` (`:39–41`) is the product of blocks, `a m = (denominator m)⁻¹` (`:99`), and `scale m = log (a m)⁻¹` (`:115`). These are the text's B_j ≥ 3, a_m and s_m.
11. Closing remark [S]. `Selected.starts` (`History.lean:237`) gives `(A.rep N p N).eval = bare (A.β N p N)`, with `bare` resolving to `YM.Wilson.bare` through `open Wilson` (`History.lean:40`). `bare β U = exp(−β · energy U)` (`Law.lean:58`), `energy = Σ_faces price` (`Law.lean:29`) and `price u = 1 − Re tr(mat u)/repDim` (`MatrixGroup.lean:112`). This supports "at N(i) = i the coefficient is the bare lattice action coefficient" for the Wilson action normalized by (1/r_G) Re tr.

### Crosswalk locations

12. Every qualified name in the table exists under the stated name and in the stated file, inside or within a line or two of the stated range. For example, `YM.Family.S` is at `Construction.lean:34` inside the cited `32–35`, and `frobInner` occupies `Colors.lean:24–35` against the cited `25–38`. The offsets are immaterial.
13. NIT. The PR #113 nit (the Hall citation missing from the correspondence) is resolved: the "Literature and editorial treatment" section now records Hall v1 with locators. I checked those locators against the PDF (see the mathematics report). A further nit: the rendered Hall bibliography item prints "31 May 2000, 2000." because both `howpublished` and `year` carry the year. This is cosmetic.

## Required changes and remaining uncertainty

None required. Not done here: elaboration, `#print axioms`, and regeneration of `evidence/lean-inspection.txt` (Mathlib unreachable from this environment). The claims above about elaborated types rest on source text only, together with the unit's retained inspection output, which I did not regenerate.

Commands actually run (on `main` at `f73c500`):

```sh
python3 scripts/check_blueprint.py --fingerprint YM-000022   # 24db9174…ce056
python3 scripts/check_blueprint.py                            # Blueprint structure OK: 2 units
python3 -m unittest discover -s tests                         # Ran 22 tests, OK
python3 blueprint/units/YM-000022/evidence/check_sources.py   # 7 x OK
git diff 0a24993 f0c6056                                      # PR #115 content
sed -n / grep reads of Lean/YM/Pert/Asymptotics/RawAxis.lean, Lean/YM/Gauge/{Lie,Colors,Casimir,MatrixGroup}.lean,
  Lean/YM/RG/History.lean (40, 60–80, 170–242), Lean/YM/Source/Construction.lean (25–50),
  Lean/YM/Lattice/Scale.lean (25–45, 95–122), Lean/YM/Wilson/Law.lean (29, 58)
cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build main.tex
  # exit 0, 3 pages, no undefined references or LaTeX warnings; pages rendered with pdftoppm and inspected
```

## Acceptance

Not recorded. An agent review is evidence for a human reviewer and is not acceptance. `unit.json` approvals remain null.
