# C13 review, part 3 (reader 3 of 3): Lean correspondence

- Unit: work package C13 of YM-000026; chapters `allarity-coordinate-calibration.tex`, `allarity-marked-propagation.tex`, `three-panel-weak-comparison.tex`, `selected-history-limits.tex` (changed by PR #103), `all-arity-reader-gaussian-model.tex`, `allarity-cumulant-comparison.tex`, `marked-healthy-cumulant-launch.tex`, `rank-root-normalization.tex`.
- Role: Lean correspondence (textual reading; no elaboration).
- Human reviewer: `schmittj` (agent review; no human acceptance recorded).
- Agent assistance: one Claude (Opus 5.5) agent, session `schmittj-claude-c13-review-20261113`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. The 13 Lean files opened in this part match `Lean/SOURCES.sha256` (see `part3-validation.md`).
- Outcome: no manuscript statement in these chapters contradicts the pinned source. Each of the four PR #103 changes has a source basis that I confirmed. The findings below concern correspondence descriptions in the manuscript and in the canonical evidence files.

## Findings, ordered by severity

### L1. INACCURACY (manuscript, pre-existing) — one-cell argument versus `Display.s_ectors`

- File: `allarity-marked-propagation.tex` lines 13–51.
- Source: `YM.PhysicalNext.InteractingRank.Display.s_ectors` (`Lean/YM/MergeProof/West/Cabaret.lean`). Hypotheses include `roomTest … a q`, `hd : (6*n+3) ≤ a/(3+2*n)`, and `F_ring` (each piece's space is `wings … ⊆ patch (3*bK) (rd z)` for every reader `z`, via `e_gress`). The conclusion is `separation (rd j) x' ≤ a/(3+2*n) * bK` for every reader `j` and every point `x'` of the connected zone. Inside the proof, `h₀` uses `periods … (3*q*bK)` with `6 ≤ 3*q` to separate cells at distance $>6B_K$. The reader-graph walk is bounded through `card Y ≤ n` as $n\cdot6B_K$, and `hd` is used only in the final `linarith`.
- Comparison: with $\rho=3B_K$ the manuscript's argument is the source argument, with the sharper $n-1$ edge count. But (i) the source conclusion is $\le(a/(3+2n))B_K$, while the manuscript concludes $\le dB$ (with $d=a$, i.e. $\le aB$), which is weaker; (ii) the manuscript calls `hd` "the separate local room condition needed to produce these elementary slices", whereas in the source the slices and their $3B_K$ radius come from `roomTest`/`e_gress` and `hd` gives the final distance bound; (iii) the source needs cell separation only $>2\rho$, not $>dB$. Mathematically consistent; the description is inaccurate. See M4 in `part3-mathematics.md`.
- Requested change: align the description with `s_ectors` and state the conclusion actually used downstream.

### L2. INACCURACY (canonical evidence, pre-existing) — file-prefixed names presented as declarations

- File: `blueprint/units/YM-000026/allarity-coordinate-calibration-evidence.md` (records).
- The evidence lists `ArcEstimate.{flight,eastward,starbound,fares}`, `Prayer.{integer,resolution}`, `PaperGate.{covered,clockwise,passing_all}`, `ParticleGate.{Heating,income,love}`. These are file names, not namespaces. The fully qualified names are `YM.Next.Rank.Beamer.flight` etc. (`ArcEstimate.lean` declares `namespace YM.Next.Rank.Beamer`), `YM.Next.Rank.Prayer.integer`/`.resolution`, and `YM.Next.Rank.Atlas.covered`/`.clockwise`/`.passing_all`/`.Heating`/`.income`/`.love` (`PaperGate.lean` and `ParticleGate.lean` declare `namespace YM.Next.Rank.Atlas`). The C13 `ledger.md` correctly writes `YM.Next.Rank.Atlas.leash`. AGENTS.md requires fully qualified names.
- Requested change: qualify the names in the evidence file. This is an editorial fix to a canonical record and needs coordinator ownership.

### L3. INACCURACY (manuscript, pre-existing) — the forced-realignment estimate is the source's `resFt`, not literally `sec:soft-log-fusion`

- File: `allarity-marked-propagation.tex` lines 121–146. Source `YM.Next.Rank.Tapes.West.resFt` (`Lean/YM/MergeProof/West/Prince.lean`): `hM : Real.exp g * s + (m:ℝ)*Z*rentQ q (c+1) ≤ δ`, `ht : ((B+B+1))^4*δ ≤ 1`, `hu` (healthy discrepancy $\le y$ on the enlarged support), `hB : r ≤ 1`; output `Light … (z + 2^m*(rentQ q c*y)) (Real.exp (-g)*(Real.exp δ-1))` with the exact `dust` identity and `Background` preserved. The manuscript's numbers (`eq:allarity-realign-regular`, `eq:allarity-realign-forced-input/output`) match this exactly, including $r\le1$ and the exponents $e$ and $e+1$. The cited prose section has a different budget ($e^\kappa b+2w$). See M1.

### L4. NIT (manuscript, PR #103 addition) — the three-panel diagonal is an English consequence, not a source declaration

- File: `three-panel-weak-comparison.tex` lines 271–285. The source works per request: `YM.Next.UVStress.realizes_stations` (`Lean/YM/Next/UV_STRESS/Granular.lean`) takes `estimate : ∀ N D R, 1 ≤ R → ∃ W, Granular W F a N R` and produces `Stations C F a`, whose `arbitrarily D N R ε δ` gives one station with error `ε` (via `supply_wheel`/`pay_word`, uniform over tests in the window with sup bound `M`, error `ε*charge*M`) and radius `≤ δ` (from `Granular.small`). `YM.MergeProof.East.podium` (`Lean/YM/MergeProof/East/Largo.lean`) works at fixed `n`, `D`, `R`. No source declaration builds the diagonal sequence. The English diagonal, with $C_h^h\epsilon^{(h)}_k\le1/(h+1)$ and radius $\le1/(h+1)$, is a correct consequence of the per-request statement. Its vanishing-radius condition corresponds to the `δ` argument of `Stations.arbitrarily`. The ledger's description ("matches the quantifier shape of `supply_wheel`/`Extraction.Order.upper`") is fair.

### L5. NIT (manuscript, pre-existing) — the reader frame is sample-independent in the source

- File: `all-arity-reader-gaussian-model.tex` lines 182–192: "The frame may depend on the reader and on the sample." In `YM.PhysicalNext.InteractingRank.screens` (`…/AFTERNOON_INTERACTING_RANK_COMPARISON/Emulation.lean`) the frame is `X a` with `X := constantGauge (fingers v' o) …`, determined by the coarse field and the pose and independent of the Gaussian sample. The manuscript statement is weaker than the source, and therefore not wrong. If a consumer needs measurability or independence of the frame in the sample, cite the stronger form.

## PR #103 changes: source checks

| Change | Source checked | Verdict |
| --- | --- | --- |
| `allarity-coordinate-calibration.tex` 232–233, $q_*=0$ on an empty frame | `YM.Next.Rank.Atlas.leash` = `Finset.univ.sup fun i => (F.grades i).2` (ℕ, empty sup $0$), `saves = leash + 2`, `passing_all` hypothesis `saves C d + 3 ≤ b` (that is, $b\ge q_*+5$) | matched |
| `allarity-marked-propagation.tex` 13–16, readers belong to support | `SourceAt.remembers`, `Lifted.remembers` (`Value.lean` lines 42, 55: `i∈fires.val → ζ i ∈ extent`); `(H w).placed` used in `s_ectors` | matched |
| `three-panel-weak-comparison.tex` 111–117, 150–155, 251–285 | `pay_word` (∀ tests in window, ∀ `M>0`, `F.upper … (ε*charge*M)`), `supply_wheel`, `realizes_stations`, `Granular.small`, `podium` | matched (diagonal is English-only, L4) |
| `selected-history-limits.tex` 160–172 | ledger's source route (`Window.guild`, `Pith.shall`, …) not reopened; the change only weakens a claim to an explicit input | no source contradiction possible; mathematically correct (M2) |

## Correspondence checks on unchanged material

- `allarity-coordinate-calibration.tex` `eq:allarity-meridian-purchases` ↔ `YM.Next.Rank.Prayer.Meridian` fields `aperture 1≤ρ`, `debris M^(d-1) ≤ T` (truncated `d-1` = $q$), `origin sensed d T` ($C_d\le T$), `rapid X*T ≤ B`, `full X*T*T ≤ B`, `spoke ‖cov‖ + X*T*T ≤ B`, `precise ε*T ≤ e`, `precision ε*T*T ≤ e`: matched, with $X=P$, $\varepsilon_{\rm Lean}=E$, $e=\varepsilon$. `YM.Next.Rank.Atlas.clockwise` instantiates `T = X = fraction`, `ε = bill(-3)`, `B = bill(fuel)`, `e = bill(-2)`, `M = lengthW`, with `fuel ≤ 1/4`: matched to $T=P=H^{\lambda/4}$, $E=H^{-3}$, $B=H^\lambda$, $\varepsilon=H^{-2}$. `covered` gives $|F|\le\frac12B$: matched. `YM.Next.Rank.Prayer.resolution` concludes `Sorts u m B ∧ Nearby (ferry u) F (m∘polar) 0 B e`: matched to "all enlarged entries bounded by $B$; physical block and mean within $\varepsilon$ of $(F,0)$". `Gather`/`Vane` contain closedness (`shutter`), see M3.
- `allarity-cumulant-comparison.tex` ↔ `YM.Next.Rank.Common.{Sorts,Nearby,priced,width,differs}`: `priced B d = ((2*B)*(d+1))^d`; `width : ‖blend Q m p‖ ≤ coin p * priced B d`; `differs : … ≤ coin p * (E*priced B d)` under `Nearby` (both pairs bounded by $B$, entries within $E$). Matched to `eq:allarity-wick-bound`/`eq:allarity-wick-difference` (the source entries are complex; the manuscript's real statement is a special case).
- `allarity-marked-propagation.tex` `eq:allarity-density-envelope` ↔ `YM.Next.Rank.Value.Notice.price`: `Poly.price r (u U) ≤ exp(P.exponent U + card(Site)*L + card(V)*l)` for positive weights `r`, `e ≥ 0`, under `Notice` (exact `dust` identity, `Background`, `Light` with per-mark regular and per-site forced bounds). Matched.
- `rank-root-normalization.tex` ↔ `YM.Next.Rank.Station.{Meets,ticket,affordable}` (`StationMeter.lean`): `Meets` fields (same clip, `β ≤ 4 hatBeta`, `β g² = 1`, `0<g ≤ threshold ≤ clock threshold`, `δ ≤ 1`, `Λ ≤ loopCap`) match lines 227–238. `ticket = 2(1+(8A+1)) + |PlaqAxes| + |PlaqAxes|(c_dir+A²)/2 + (1+M) + 3 ent − 4 log small + 1` equals $T_M$. `affordable` is `∀ᶠ m`, uniform in `p`, with the harmonic term divided by the output-site cardinality. Matched.
- `all-arity-reader-gaussian-model.tex` `eq:ex-lattice-reader-covariance-error` ↔ `YM.PhysicalNext.InteractingRank.faithfulSight` (`Compass.lean`): conclusion `‖P i' j − (short B N p i).Q.cov i' j‖ ≤ ε` via the tracked covariance and `h.swim` ($x^{-1/8}+t\le\varepsilon$), with the margin `walls x + 1 ≤ W` required at both endpoints. Matched. `eq:ex-lattice-reader-guard` ↔ `YM.Next.Rank.Guarded` (`Guard.lean`: values in $[0,1]$, measurable, `∫(1−g) ≤ η`). Matched; the manuscript correctly does not claim $\mu\{\Gamma<1\}\le\varepsilon^2$.

## Lean declarations opened

| Fully qualified name | Path | Matched |
| --- | --- | --- |
| `YM.Next.Rank.Beamer.Gather`, `.Drift`, `.Vane`, `.fares`, `.flight`, `.eastward`, `.starbound`, `.breezy` | `Lean/YM/Next/RANK/ArcEstimate.lean` | yes (closedness in `Gather`/`Vane`, M3) |
| `YM.Next.Rank.Prayer.Meridian`, `.Reads`, `.resolution`, `.integer`, `.collect` | `Lean/YM/Next/RANK/Prayer.lean` | yes |
| `YM.Next.Rank.Prayer.gleam`, `.grown` (scaling of the free kernel) | `Lean/YM/Next/RANK/Hydro.lean` | read for context only |
| `YM.Next.Rank.Atlas.leash`, `.saves`, `.Heating`, `.income`, `.love` (statements) | `Lean/YM/Next/RANK/ParticleGate.lean` | yes |
| `YM.Next.Rank.Atlas.covered`, `.clockwise`, `.passing_all` (statements) | `Lean/YM/Next/RANK/PaperGate.lean` | yes |
| `YM.Next.Rank.Common.Sorts`, `.Nearby`, `.priced`, `.width`, `.differs` | `Lean/YM/Next/RANK/Common.lean` | yes |
| `YM.Next.Rank.Value.SourceAt` (`remembers`), `.Lifted` (`remembers`), `.Light`, `.Notice`, `.Notice.price`, `.charge`, `.dust` | `Lean/YM/Next/RANK/Value.lean` | yes |
| `YM.Next.Rank.Station.Meets`, `.ticket`, `.affordable` (statement; `rolls_law` statement only) | `Lean/YM/Next/RANK/StationMeter.lean` | yes |
| `YM.Next.Rank.Guarded` | `Lean/YM/Next/RANK/Guard.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Display.roi`, `.e_gress`, `.adm_ft`, `.s_ectors`, `.F_ring` | `Lean/YM/MergeProof/West/Cabaret.lean` | yes, with the description issue L1 |
| `YM.Next.Rank.Tapes.West.perFt`, `.constFt` (private), `.resFt` (statement) | `Lean/YM/MergeProof/West/Prince.lean` | yes (L3) |
| `YM.MergeProof.East.podium`, `.reduce_wave` | `Lean/YM/MergeProof/East/Largo.lean` | yes (fixed request; L4) |
| `YM.Next.UVStress.Granular`, `.Granular.upon`, `.pay_word`, `.supply_wheel`, `.realizes_stations` | `Lean/YM/Next/UV_STRESS/Granular.lean` | yes (L4) |
| `YM.Next.UVStress.Wheel.Spots`, `.spots_upon` | `Lean/YM/Next/UV_STRESS/Fringe.lean` | yes (`crude`: $a_m<r/(2R)$, $n\cdot6a_k<a_m$; `slab`: $a_j<r\sigma$) |
| `YM.PhysicalNext.InteractingRank.faithfulSight` (statement and first proof lines) | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Compass.lean` | yes |
| `YM.PhysicalNext.InteractingRank.screens` (statement) | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Emulation.lean` | yes (L5) |

## What I did not check

- Hidden instances, coercions and elaboration. This was a textual reading only: no `lake build`, no `#print axioms`.
- The source routes for `selected-history-limits.tex` (`Stationary.Artes.Cadre`, `ThroughLaunch.Perceived`, `Lark.Glide`, `Pith.shall`, `Legato.Locrian`, …) cited in the ledger, and the source for `marked-healthy-cumulant-launch.tex` (`Zephyr.lean`, `Herald.lean`, `Walked.lean`, `West/Jenn.lean`, …). For these I relied on the mathematics, not on the source.
- `Glide.lean` (`pays_film`, `cutoff_balance`), `Medal.lean` (`Checks`), `Nitre.lean` (`echo_scale`), `Grain.lean` (`band_cover`), `Haar.lean`, `Axial.lean`, `Determinant.lean`, `Denarii.lean`, `Teddy.lean`, `Planck.lean`, `Flight.lean`, `Mooncake.lean`, `Equity.lean`, `Moon.lean`/`Muse.lean`/`Longbow.lean` (other uses of the $6n+3$ purchase).
- Whether `Carport (a*P.p.B)` in `resFt` needs only the manuscript's weaker one-cell conclusion (L1).
