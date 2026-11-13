# Review of a proof unit

- Unit: YM-000022, `blueprint/units/YM-000022/`
- Role: Lean correspondence
- Human reviewer: schmittj (no acceptance recorded; see the last section)
- Agent assistance: one Claude Opus reviewer agent, coordinated by a Claude session. The agent read the pinned source text and wrote this report. No other model was used.
- Content SHA-256: `37a404dea24a3001c320680e4b25334e619d6865178c86e3d85993bb4000168f` (`python3 scripts/check_blueprint.py --fingerprint YM-000022` at commit `d4be082`, head of draft PR #111; equal to the value in the revision README)
- Reviewed content: commit `d4be082`, the single revision commit on top of `47762e9`. File SHA-256: `manuscript/pilots/running-coupling.tex` `3f10d3ac67788342c85ed368691b8ea35b81bbc052ec1dd7a67c9a7e1d02a0ca`; `correspondence.md` `ab7053e8121e39802821ddbc2872160b91d4722aa686b66f25e0ccea9f17958c`; `unit.json` `cfc20482faefa90b34cca4d903b0b21620efd55e60dd333cbeb69b8b96986731`; `revisions/mgubi-astra-22-repair-20261113/README.md` `2cba60fb7c67fc7c761611f18ec5973b8b074061c85db89a1d539678dd157cd3`; `manuscript/preamble.tex` `0827ef17…90df`; `manuscript/references.bib` `2d5d1447…dbb7`.
- Manuscript files and labels: `manuscript/pilots/running-coupling.tex` (`sec:running-coefficient`, `eq:running`, `prop:uniform-extraction`, `prop:running-asymptotic`), `manuscript/preamble.tex`, `manuscript/references.bib`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22), review claim by session `schmittj-claude-review22-rev-20261113`; author revision in draft PR #111.
- Outcome: no change requested (two NITs below). Every cited declaration exists under the stated name and path, and its type or definition says what the English says. This is an agent review without human acceptance.

I am not an author of this unit.

## Findings and evidence

Evidence level: **[S]** source text read at the pinned revision under `Lean/`; **[R]** the unit's retained elaboration output `evidence/lean-inspection.txt`, read but not regenerated. I did not elaborate anything myself. The ten source files listed in the revision's `source-checksums.txt` match `Lean/SOURCES.sha256` (the seven-file `evidence/check_sources.py` passes; I checked `Wilson/Law.lean`, `Gauge/MatrixGroup.lean`, `Lattice/Faces.lean` against the manifest by hand).

### Owned statements (unchanged by the revision)

1. `YM.Pert.Asymptotics.zeroUp_bound` (`RawAxis.lean:15–30`) [S, R]: for `C : Family G`, `C.Makes`, `0 < ε`, eventually in `m`, `∀ N p, m ≤ N → |C.path.β N p m / C.S.scale m − 2 * b0 G| < ε`. No simplicity hypothesis. `prop:uniform-extraction` is the abstract generalisation (any `A`, `c`, `s_m → ∞`); specialised to `A = bar`, `c = 2b0` it is this lemma.
2. `YM.Pert.Asymptotics.comparison` (`RawAxis.lean:36–48`) [S, R]: hypotheses `C.Makes`, `G.Simple` (via `include hc hg`), `∀ᶠ i, i ≤ N i`; `k` unconstrained; conclusion `Tendsto (fun i => regulatorRun C (N i) (k i) i * √(log (C.S.a i)⁻¹)) atTop (𝓝 (√(2 * b0 G))⁻¹)`. Matches `prop:running-asymptotic`.
3. `regulatorRun` (`RawAxis.lean:35`) [R]: `fun {G} C N p m => (√(C.path.β N p m))⁻¹`, no hypotheses despite following `include`; the correspondence's totalisation remark is accurate.
4. `b0 G = 11 * G.casimir / (48 * π^2)`, `b0_normalizes : 2 * b0 G = G.slopeConstant`, `slopeConstant = 11 * casimir / (24 * π^2)` (`Colors.lean:184`) [S].

### Running input

5. `YM.RG.History.Running` (`History.lean:229–231`) [S]: `∀ ε > 0, ∀ᶠ m, ∀ N p, m ≤ N → |A.β N p m − A.levels.clock.hatBeta m| ≤ ε * A.S.scale m`, with `hatBeta m = bar + G.slopeConstant * schedule.scale m` (`History.lean:79`). Reached through `YM.Family.Makes.wilson : C.path.Selected` (`Construction.lean:45`) and the field `Selected.running` (`History.lean:240`). `History.S = levels.S = clock.schedule` and `Family.S = C.path.levels.S` are abbreviations (`History.lean:138,210`; `Construction.lean:34`), so a single `s_m` is faithful. `eq:running` is this statement with `2b_0(G)` for `slopeConstant`.

### New anchors added by the revision

6. **Bare coefficient** [S]. `YM.RG.History.Selected.starts` (`History.lean:237`): `∀ N p, (A.rep N p N).v = 0 ∧ (A.rep N p N).eval = bare (A.β N p N)`; `bare` resolves to `YM.Wilson.bare` (`open Wilson` at `History.lean:40`). `YM.Wilson.bare β U = Real.exp (−β * energy U)` (`Law.lean:58`); `YM.Wilson.energy U = Σ_{p : Face (Per n)} G.price (faceValue U p)` (`Law.lean:29`); `YM.Gauge.price u = 1 − (G.mat u).trace.re / G.repDim` (`MatrixGroup.lean:112`). `YM.RG.Rep.eval U = exp (R.exponent U) * R.activities.gas R.p U` (`History.lean:179`). So at stage `m = N` the represented density equals `exp(−β_{N,p,N} Σ_p (1 − r_G^{-1} Re tr U_p))`, and `β_{N,p,N}` is the multiplier of that energy, as the correspondence says; its description of `Rep.eval` as "an exponential times an activity gas", not an action, is accurate. The closing remark of the section is justified by `starts` (second conjunct), with the normalisation spelled out in the correspondence. NIT: the correspondence writes "`hc.wilson.starts N p` identifies `(C.path.rep N p N).eval` …"; strictly this is `(hc.wilson.starts N p).2`.
7. **Divergence** [S]. `YM.Schedule.denominator` (`Scale.lean:39–41`: `0 ↦ 1`, `k+1 ↦ denominator k * block k`) and `YM.Schedule.block_large : ∀ m, 3 ≤ (block m).val` (`Scale.lean:31`), with `a m = (denominator m)⁻¹` (`:99`) and `scale m = log (a m)⁻¹` (`:115`). This is the text's product formula and `B_j ≥ 3`. The source also requires `B_j` odd (`block_odd`), unused by the text.
8. **Representation and Lie algebra** [S]. `YM.Gauge` (`MatrixGroup.lean:23–26`): `n : ℕ` and a closed subgroup of `Matrix.unitaryGroup (Fin (n+1)) ℂ`; `repDim = n + 1`, `dimPos : 0 < repDim` (`:73–75`), so `r_G ≥ 1` is exactly `dimPos`. `YM.Gauge.Generates X := ∀ t : ℝ, exp (t • X) ∈ range G.mat` (`Lie.lean:26`), `YM.Gauge.lie` the real submodule with this carrier (`:126–135`), `generates_skew : star X = −X` (`:42–44`), `bracket_mem : X*Y − Y*X ∈ G.lie` (`:159–176`). These support the text's derivative argument and its (implicit) use of bracket closure; the conventions agree with Hall, Definition 3.13 and Theorem 3.16 (checked against the versioned PDF, see the mathematics report).
9. **Simplicity** [S]. `YM.Gauge.Simple` (`Lie.lean:178–182`): some `X, Y ∈ G.lie` with `XY − YX ≠ 0`, and every real submodule `I ≤ G.lie` with `[G.lie, I] ⊆ I` is `⊥` or `G.lie`. This is "nonabelian simple real Lie algebra" in the text.
10. **Casimir transport** [S]. `frobInner` (`Colors.lean:24–35`) is the local instance `⟪x,y⟫ = Re tr(x y^*)`, unnormalised. `colorIso` (`:52–54`) is the standard orthonormal basis of `G.Alg` rescaled by `√repDim`; `trace_color` (`:71–75`) gives `−Re tr(colorMat c · colorMat d) = repDim · ⟪c,d⟫`, so `colorMat` of the standard basis is orthonormal for `−r_G^{-1} Re tr(XY)`. `ad c d = projectColor (colorMat c · colorMat d − colorMat d · colorMat c)` (`:136–150`) and `colorMat_ad` (`:152–154`, via `bracket_mem` and `colorMat_project_self`, `:103–104`) show the projection acts as the identity on brackets, so `ad` is conjugate to the matrix commutator and `casimir = −(Σ_i Tr(ad b_i ∘ ad b_i))/lieDim` (`:180–182`) equals the text's `C_𝔤` for that particular orthonormal basis. The text's basis independence is a (correct) strengthening not present in the source. Lean's `/ lieDim` would be `0` if `lieDim = 0`; under `Simple` this does not occur.
11. **Positivity in Lean versus the text** [S]. `YM.Gauge.casimir_pos` (`Casimir.lean:160–172`) bounds `minusKilling x x > 0` for one non-central `x` and then needs `trace_adjoint` (`:140–158`), whose `invariant_scalar` step uses the ideal clause of `Simple`. The correspondence now says correctly that the manuscript's summed-commutator proof replaces this argument and uses only the nonabelian clause, and that `comparison` obtains positivity through `slopeConstant_pos` (`:174–176`).

### Crosswalk locations

12. Every fully qualified name in the table exists under that name (namespaces `YM`, `YM.Gauge`, `YM.Schedule`, `YM.RG`, `YM.RG.History`, `YM.Wilson`, `YM.Pert.Asymptotics` checked) and lies in the stated line range; small offsets (e.g. `frobInner` at `24–35` cited as `25–38`) are immaterial.
13. NIT: the correspondence's "Literature and editorial treatment" section still lists only Lebl, although the revision README relies on Hall for the one-parameter definition and bracket closure. See the mathematics report, required change 1.

### Commands run

```sh
git diff d4be082~1 d4be082
sed/grep reads of Lean/YM/Pert/Asymptotics/RawAxis.lean, Lean/YM/Source/Construction.lean (20–50), Lean/YM/RG/History.lean (1–90, 165–245), Lean/YM/Wilson/Law.lean (1–70), Lean/YM/Gauge/MatrixGroup.lean (15–120), Lean/YM/Gauge/Lie.lean (1–60, 120–184), Lean/YM/Gauge/Colors.lean (1–186), Lean/YM/Gauge/Casimir.lean (1–30, 100–178), Lean/YM/Lattice/Scale.lean (20–125)
python3 blueprint/units/YM-000022/evidence/check_sources.py .      # 7 × OK
sha256sum of Law.lean, MatrixGroup.lean, Faces.lean, each found in Lean/SOURCES.sha256
python3 scripts/check_blueprint.py --fingerprint YM-000022         # 37a404de…168f
```

No Lean elaboration, axiom query, `lake build` or kernel replay was run; statements of the five owned declarations rest on source text plus the retained `evidence/lean-inspection.txt`. Not checked: `Rep.exponent` beyond its definition, `Activities.gas`, `Face`/`faceValue` details (I relied on `energy` summing `price` over faces), the remaining fields of `Family.Makes`, and how `Family.Makes` is produced.

## Required changes and remaining uncertainty

None required for this role. The two NITs (finding 6, `.2` of `starts`; finding 13, Hall missing from the correspondence's literature section) can be fixed together with the mathematics report's required change. The running estimate remains an unproved input, as the unit says.

## Acceptance

Not recorded. This is an agent review without human acceptance; any edit in response changes the fingerprint and needs renewed review.
