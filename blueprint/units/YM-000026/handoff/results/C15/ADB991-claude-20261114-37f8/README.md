# C15 producer of `eq:trace-basis-error` (#336)

Session `ADB991-claude-20261114-37f8` (Claude, Anthropic, scheduled agent on
behalf of ADB991; ADB991 had not reviewed this before submission). Claim:
https://github.com/hairer/humanise-yang-mills/issues/336#issuecomment-6868695020.
Base `codex/existence-monograph` @ `97f806c7`; Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`Lean/` tree `328ad19b`).
All source checks are textual; nothing was elaborated.

## Output

- New `manuscript/existence/trace-rounded-comparison.tex`
  (`subsec:trace-rounded-comparison`, `lem:trace-rounded-conjugate`,
  `prop:trace-rounded-comparison`, `cor:trace-rounded-input`,
  `eq:trace-rounding-error`, `eq:trace-rounded-receipt-one/two`,
  `eq:trace-rounded-comparison`). sha256
  `69c54766b70e84b2db07d14cc8c4fb5a4b7d6914ada32b2881ddc3d4d7c68925`.
- `manuscript/existence/trace-asymptotic.tex`: the `\input` (placed after the
  proof of `lem:trace-moving-correlation`, before "Removing rounding and
  subsequences", so that the lemma stays in its own subsection) and the one
  status sentence after `input:trace-scales`. sha256
  `1013c02371af3de2a34f5256fff4ec29d317926cbd5e14d0262a438f3c51ec83`.
- **Integration needed (coordinator):** add
  `manuscript/existence/trace-rounded-comparison.tex` to the `manuscript`
  list of `blueprint/units/YM-000026/unit.json`. `unit.json` is outside this
  claim's owned outputs and was not edited.

## What is established

Conditional on (G1)–(G4) and (Ph1)–(Ph3) of the new subsection:
`prop:trace-rounded-comparison` gives, for fixed grade `d`, all large `i`
(threshold depending only on `d`), every basis pair and every fit `x` with
rounded configuration in the window,

`|S_chi(U_i e, U_i e'; r_i q) - S_0(e, e'; q)| <= eps_i (1 + |S_0(e;q_0)| + |S_0(e';q_1)|)`,
`eps_i = 1/(i+1)`, `q = m_i^{-1} ceil(m_i x)`.

`cor:trace-rounded-input` derives the pointwise, continuity and window
clauses of `input:trace-scales` with `M_ab(q) = |S_0(e_a;q_0)| + |S_0(e_b;q_1)|`.

The only quantitative input is the pairwise receipt (G3) = `SeqPair.boot`
(with its `width` clause). It is part of the one-step chart output that
`trace-firesky-gallery.tex` already records ("a pairwise comparison receipt
at cost costHint(l)") and attributes to `sec:three-panel-weak-comparison`
via the private step `YM.MergeProof.East.await`. Its proof is **not** given
here; see open question Q1.

## Correspondence (pin 3456e5e, paths under `Lean/YM/`)

| Manuscript | Source | Remark |
| --- | --- | --- |
| `prop:trace-rounded-comparison` | `YM.Trace.Verse.seat` (`TraceExtension/Verse/Pears.lean` l.23) | Same bound `costHint i + (‖m₀‖+‖m₁‖)·costHint i`; same eventuality (`hq.terminal d`, `i ≥ d`), uniform in `x`. |
| Rounded configuration `q_i(x)=ρ_{m_i}(x)`, `r_i q_i(x)` the grid configuration | `Verse.fad`, `flat`, `rum`, `raw` (Pears.lean l.16–19); `Next.Rank.Station.choose/key/tested/reading` (`Next/RANK/Tuning.lean` l.20–30); `Extraction.address` (ceiling), `tag` (`Extraction/Round.lean`) | `rum = wheel.r • fad`, `wheel.r = gap = a_k·mag` (`Next/RANK/Station.lean` l.47–49). |
| `eq:trace-rounding-error`, `q_i(x)→x` | `Verse.rounds` (`Verse/Round.lean` l.16), `Extraction.approximate`, `mag_rate` (Station.lean l.57) | Lean bound `4n·m⁻¹`; manuscript proves `2√n·m⁻¹` directly. `m_i ≥ μ^5→∞` uses `b_i>5` (`TimberSky.high`) and `Gondola.growth`. |
| Window `𝒲` | `Scaling.window 100 2` (`Climb/Cells.lean` l.40): `spaced 100⁻¹ x ∧ ‖x‖≤100`, `cubedist` = Euclidean distance in `E4` | |
| Fit at level i | `FitSky` (`TraceExtension/Prom/Hill/Tuning.lean` l.15): `usable` (key generic), `deep` (coords ≤ a(middleSky)/8) | Depends on `x` only via `choose` (address); idempotence = `authentic`, used in `Verse.mixed`. |
| (G1) | `Gondola.growth`, `Gondola.season` (`.2`: `wheel.r = X.r i`), `TimberSky.high` | |
| (G2) | `Gondola.terminal` (`TraceExtension/Terrace/Gondola.lean` l.18), `heightV` | `X.U i d z = S.project d (Y d i z)`. |
| (G3) | `TimberSky.plate : SeqPair k_i b_i i R (costHint i)` via `Vane.checked` (`Prom/Zoom/Boats.lean` l.21–72): `SeqPair.boot`, `SeqPair.width` | Grades `w ≤ i` (Vane C i), `N > k_i`, all `l`, `s` nonempty. |
| Corrected polynomial parts | `Read.retrieve`, `cylinder_single`, `cylinder_pair` (`Next/RANK/Finite.lean` l.120–139), `invoiceSky` (`Prom/Hill/Allowance.lean` l.40), `cumulants`/`maxProfile` | Manuscript proves the `|s|≤2` parts directly from the defining recursion. The identity `invoiceSky … = cylinder … (B.shoots N p)` is `hC` in `seat` (by `ladder_reads` and `rfl`). |
| (G4) | `FitSky.stencils` (`Prom/Hill/Coordinates.lean` l.150) with `Seed.cutoff : C.Makes`; root depth `widthSky ≤ k` (`widerSky`, `beforeSky`) | |
| Step 1 (packets → all powers) | `Verse.Duo.receipt` (`Verse/Part.lean` l.51) → `Verse.ticket` (`Verse/Curtain.lean` l.10) → `cutoff_bound` (`Verse/Pound.lean` l.85, `Tiling.planted`), `term_pass` (`Verse/Movie.lean` l.198), `opening` (`Verse/Stars.lean` l.79, `Ground.arcs`) | Same argument as `actual-phase-detector-moments.tex`, `eq:episode-cutoff-power`–`eq:episode-all-powers`; packets match `Duo.receipt`'s `q = enact ![unary 1 i, blank (-Z i)]` and `r = enact ![pair 1, unary (-Z0) 1, unary (-Z1) 0, blank (Z0*Z1-z)]`. |
| `lem:trace-rounded-conjugate` | `Verse.conj_M` (`Verse/Stars.lean` l.22), `Ground.attains` (`Ground/Spectrum.lean` l.115) | Lean derives `M(w̄)=M(w)*` from phase reality (`(hq i).spin.real`), `receives`, `ht.ground`, and `attains` (Ω separating for the abelian algebra). The detector-moment section takes `eq:episode-conjugate` as input; here it is proved under (Ph1)+(Ph3). |
| Step 2 | `Extraction.Retain.bit` (`Phase/Detect.lean` l.22) = `ex-character-moments`; algebra = final lines of `Duo.receipt` = `ex-detector-two` | |
| Step 3 | `Read.profile_full` (`Next/RANK/Finite.lean` l.66), `Table.class_agrees` (`Euclid/Lift.lean` l.61), `hU` from `Gondola.terminal` | (Ph3) null-relation clause = `(K x').respects S`. |
| Corollary: continuity | `Read.profile_part_cont` (Finite.lean l.40), `class_smooth` | Corollary assumes continuity of reference correlations on distinct-point configurations (Lean: `H.smooth`). |
| Corollary: eventual fitness | `Verse.mixed` (`Verse/Round.lean` l.24) | |
| Downstream use | `Verse.greens`, `Verse.rainbow` (Round.lean l.35, l.51) | Already the content of `lem:trace-moving-correlation`'s proof (moving labels by finite-basis expansion); unchanged. |

Hypotheses of `seat` not displayed as separate clauses: `w : Seed C f S`
(`kernel`, `generic` = point limits, `copies` = cell hypotheses for the
planted inequality, `cutoff`), `hf : 𝓛 ≤ f.fuse`, `R : p.Out`,
`hv : Steady V`, `hs : ∀ i, (K i).Hierarchy`, `hy : ∀ i, p.receives (K i) i`,
`hr : (K x').respects S`. They are covered by (Ph1)–(Ph3) and by the
extraction set-up stated in (G2).

## Open questions

- **Q1 (supplier, not produced).** (G3), i.e. `SeqPair.boot` and
  `SeqPair.width` at cost `costHint i`, is produced in Lean by the private
  `YM.MergeProof.East.await` (Boats.lean): `boot` from
  `YM.MergeProof.East.lava_vSky` (`TraceExtension/Prom/Orion/Reach.lean`
  l.34, via `earningsSky`; root test ≤ `Ship.budget A n k`) and
  `Ship.diminishes` (budget → 0, hence ≤ `costHint` eventually); `width`
  from `open_readSky` and the `PoisedSky` supply. The manuscript
  (`trace-firesky-gallery.tex`) records the receipt as part of the one-step
  chart output and attributes the quantitative estimates to
  `sec:three-panel-weak-comparison`; but `three-panel-weak-comparison.tex`
  takes the grid-point comparison as its own input (`eq:three-grid`) and does
  not state a root-test bound. **No manuscript producer of (G3) located.**
  **First unsupported implication:** from the chart supply (`PoisedSky`,
  `earningsSky`) to `eq:trace-rounded-receipt-one/two` for every basis pair,
  every `N > k_i`, all `p`, and every fit `x` with `ρ_{m_i}(x) ∈ 𝒲`. This
  should be a separate task (suggested: explain `lava_vSky`/`earningsSky`
  with the `budget` decay).
- **Q2.** (Ph3)'s reality clause is used for every character (Lean: every
  index of the resolution). If the manuscript's phase construction only
  provides it μ-a.e., the proof of `lem:trace-rounded-conjugate` still works
  (the integral vanishes), but the statement of (Ph3) should then be relaxed;
  left as stated to match the source.
- **Q3.** The identification of the chart sequence (Gondola index `i`) with
  the comparison subsequence of `input:trace-scales` is assumed in
  `cor:trace-rounded-input`; it is the business of the scale-selection and
  endpoint assembly (#337), not of this subsection.
- **Q4.** `unit.json` manuscript list (see Output).

## Literature

No external result is needed beyond those already cited in the sections
used (Gelfand/Riesz in `ex-phase-selection`). The rounding estimate and the
cumulant recursion are elementary and proved in place.

## Evidence (commands actually run)

- `python3 scripts/check_blueprint.py` and
  `python3 -m unittest discover -s tests`: see the PR body for results.
- `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`:
  exit 0, 1027 pages, no undefined references; pages 996–1001 rendered at
  75 dpi and inspected (new subsection 235.4 on pp. 998–1001).
- No Lean build: Mathlib sources are blocked in this environment; all source
  correspondence above is from reading the pinned files.
