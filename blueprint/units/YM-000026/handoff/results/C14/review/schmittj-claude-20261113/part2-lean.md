# C14 review, part 2 (Ward and angular chapters): Lean correspondence

- Package C14, unit YM-000026, issue #55; review session `schmittj-claude-c14-review-20261113`; reviewer 2 of 4; Claude agent working for `schmittj`, no human acceptance recorded.
- Source: `Lean/` at pinned revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, worktree `/home/jo314/ym-wt/c14-review` at `e058a61`. Only the declarations listed in the table below and their immediate definitions were read; no Lean build or axiom replay.
- Chapters (unchanged by PR #98; hashes in `part2-mathematics.md`): `physical-angular-actions.tex`, `physical-ward-analytic-continuation.tex`, `physical-ward-free-classification.tex`, `physical-ward-packet-prices.tex`, `physical-ward-propagation.tex`. The manuscript chapters cite no Lean names themselves; correspondence claims are in the evidence files `blueprint/units/YM-000026/{physical-ward-free-classification,physical-ward-analytic-continuation,physical-ward-packet-prices,physical-ward-propagation,physical-angular-actions}-evidence.md` and in `results/C14/{ledger,correspondence}.md`. All findings below were present before PR #98.
- Outcome: the English statements follow the source closely. No case where the English is stronger than the Lean in a way that matters, except as noted in L1–L4. Record errors in qualified names (L5).

## Findings, ordered by severity

### L1. INACCURACY (manuscript vs source): `thm:free-collinear-scenes`

- Source: `YM.Maxwell.Free.finite_lenses (d : ℕ) : ∃ L : Select (standard F) d, ∀ t, L.reads t = 0 ↔ quiet F t` (every level, no threshold) and `YM.Maxwell.Free.scanner (h : G.Simple) : ∃ N, ∀ d ≥ N, ∃ P, Ens P (scheme F) (hierarchy F).spin`, with `N = max d 4` where `d` comes from `exposed`; `Ens` packages `charges_quiet`, i.e. kernel on the spin subspace equal to the multiples of `leaves (scheme F).deriv d`.
- Manuscript (`physical-ward-free-classification.tex` 426–431) states a single garbled theorem with a doubled threshold and omits the derivative-line conclusion that `physical-ward-propagation.tex` 480–481 consumes. See I2 in `part2-mathematics.md`. Requested change: state both parts as in the source.

### L2. INACCURACY (manuscript vs source): source of strict positivity and of $c\ne0$

- `YM.Maxwell.Free.hosted_out` obtains strict positivity from `YM.Maxwell.Free.detects` (Core.lean), whose proof uses `coordGram ... isUnit` and `form_strict`, i.e. a nondegenerate Gram matrix, not reflection positivity alone. The manuscript (115–123) says "reflection positivity ... gives $>0$" (I1).
- `YM.Bid.station` → private `pressured` proves `∃ c, c ≠ 0 ∧ ∀ d, leaves I.p d = c • leaves V.deriv d`; nonvanishing comes from `smul_ne_zero W.T.hκ hT.nz`, i.e. from the A05 translation limit with $\kappa\ne0$. The manuscript (`physical-ward-propagation.tex` 495) says "Since $p\ne0$" without a source for it (G2).

### L3. INACCURACY: "collinear" versus `onLine`

- `YM.Ward.Collinear := ∀ a n K q x, x ∈ conf _ → onLine a x → angular W T q K x = 0`, with `onLine a x := ∀ i, ∃ t, x i = t • basis a` (axis through the origin). The manuscript's "one common coordinate line" (`physical-ward-propagation.tex` 33–34) is ambiguous and, read as lines parallel to an axis, stronger than the source (I5).

### L4. GAP in the English relative to source content: A02 and A05

- `YM.Bid.A05` (Bid/Angular.lean 55–59) states the two readout limits used by `physical-angular-actions.tex` (translation: `ConLap X p d ((R.T.κ:ℝ) • R.T.W.deriv) (fun i => X.r i / X.xi i)`; rotation: `(X.xi i)⁻¹ • Spin.transport Y (X.U i d) j → R.T.κ • Spin.leaf R.T.K.lie d j`). These match the English displays at angular 46–49 and 61–64 exactly (same $\xi_n$, extra $r_n$ only for translation). Their proof (`YM.Work.A05`, Observer.gets_translation, gets_rotation) has no English counterpart beyond two sentences (G1).
- `Town.formed` derives `Crystal.ready.1 : commutes V ((c⁻¹:ℝ) • Y)` from `ShellCom V I.p I.Y` (produced by A02). The English has only a sketch of this local law (G1).

### L5. NIT (records): non-existent qualified names in the evidence

- `physical-ward-propagation-evidence.md` cites `YM.Maxwell.Free.Hidden.exposed`, `YM.Maxwell.Free.Magnitude.charges_quiet`, `YM.Maxwell.Free.Scenes.scanner`, `YM.Maxwell.Free.AwayTeam.erasing`. The files declare these in namespace `YM.Maxwell.Free` (no file-named sub-namespace); the correct names are `YM.Maxwell.Free.exposed`, `.charges_quiet`, `.scanner`, `.erasing`. The free-classification evidence uses the correct names.
- `physical-ward-propagation-evidence.md` states "The manuscript proves ... the finite-level A01--A08 bridges"; for A01, A02 and A05 this is not so (G1).

## Correspondence checks that passed

- `thm:free-uniform-detection` ↔ `YM.Maxwell.Free.exposed (h : G.Simple) : ∃ d, ∀ w, ∀ p ∈ shellSector G w, p ∈ ghost G d → p = 0`. The proof matches: `j := G.lieDim`, `L := j+1`, `d := max r (4+j+L)` with `r` from `hosting`; strong induction on `w`; inner loop `reduces_top` with lower probes `l < j`, `cluster_clear` with `l < L` and `L+l+4 ≤ d`, `circulates_lower` into `shellSector G w`; final `hosted_out`. `ghost G d` is exactly "null at capacity $d$" (all $n$, all spectators in `shellSector G d`, all separated `x`).
- `lem:free-uniform-generation` ↔ `hosting`; `Host G d k` = span of products of `Pure (r i)` factors in `shellSector G d` with $\sum r_i=k$ = $\mathcal H_{D,k}$. `lem:free-coalescence` ↔ `collapses` (same hypotheses). `lem:free-shell-reduction` ↔ `hosted_out` (time reflection `Signed.reflect timeAxis`, pair `(-x, x)`).
- Top-shelf elimination ↔ `matrix_meal` (determinant of `bit (q c) i` nonzero, by evaluating on `fill j (unitColor ...) (w ...)`, i.e. the identity specialization), `reduces_top` (adjugate step, `M *ᵥ D = 0` from `circulate_eval`), `group_meal` (spanning by `probe_radius_span`).
- `thm:free-circulation-null` hypotheses as used (jet cutoff arbitrary, `l < k`, `k+l+4 ≤ d`, `z ≠ 0`) ↔ `cluster_clear`. Matched.
- `WickPol G = MvPolynomial (Slot G) ℂ`, `Slot G = Σ i, Fin (finrank (Shell G i))` (Maxwell/Equation.lean): free coordinates on the on-shell jet spaces, so the "integral domain" and "polynomial coordinate" language is correct.
- `thm:free-quiet-classification` ↔ `charges_quiet (h : G.Simple) (hd : 4 ≤ d) (hz : detection at capacity d) (t) (v : t ∈ Colors ... spin d) : quiet F t ↔ ∃ c : ℝ, t = c • leaves deriv d`. The English gives the forward direction under $d\ge\max\{4,D_*\}$; detection at capacity $d$ follows from `exposed` via `ghost_le`, as in `scanner`. Matched (English weaker by omitting the trivial converse).
- `thm:ward-global-propagation` ↔ `YM.Ward.global (S) (H : S.Hierarchy) (W) (T) (P : W.Derivatives S) (C : commutes W T) (Y : Collinear W T) (x) (hx : x ∈ conf n) : Still W T x`. The source derives segment analyticity internally (`channel` from `first_adv`/`last_adv`, which themselves take `Collinear` and `commutes`); the English isolates it as a hypothesis proved in the analytic chapter. Same mathematical content; the English correctly notes that smoothness alone is insufficient.
- `eq:ward-angular-expression` ↔ `YM.Ward.angular` (spin substitution `turns T K (q i)` plus `M4.move K.val (x i) b • disc (update q i (rise W b (q i)))`); `eq:ward-commutation` and `eq:ward-analytic-commute` ↔ `YM.Ward.commutes` (`W.deriv d b (T d t p) + ∑ i, t.val i b • W.deriv d i p = T (d+1) t (W.deriv d b p)`). Signs and index order match.
- Extreme-point analyticity ↔ `YM.Ward.first_adv`, `last_adv` (`Earliest`/`Latest`: strict extremum of the moving point in axis `a`, moving coordinate `b` arbitrary), `higher`; comparator ↔ `YM.Ward.Circle.*` and `YM.PDE.flow_step`/`sure`; Hilbert factorial step ↔ `YM.Analysis.center`, `builds` (Ward/Rate.lean). Matched at statement level.
- `lem:ward-outer-miles` and the collinear stress identity ↔ `YM.Outer.outer : Bid.LineSum p ∧ ∀ K a n q x, x ∈ conf _ → onLine a x → localTurn p Y K q x = 0`, `miles`; the line sum is obtained by translation along the line (`stagger`), as in the English proof.
- Packet exponents ↔ `YM.Outer.exterior_size` (Vanishing.lean): `chart a b l` = $-100,-150,-300$ as in the English; `u := if d = l then 1 else -(1+w l)+1`; `line_cost ... 1 (-3000)`; `mass ... (-99) ... 1`; `bead_size`, `mote_size`, `shear_size`; `normal ... 300` giving $900$; the case split `d = b` / `d ≠ b`; the hypotheses `d ≠ a`, `a ≠ b`. All exponents agree with the English. The English omits the sign-pattern hypotheses `hB : ∀ i, Own B i (spar a b i)`, `hA : ∀ i, Own A i (spar d b i)` and their consequence `mixesLine` (I4 in the mathematics file).
- Packet chapter ↔ `YM.Outer.opp` (opposite signs, integrability; no on-hyperplane requirement, as in the English), `alternate` (the alternation inequality with nonnegativity hypotheses `hW`, `hf`), `point_cost` (`Mixed Q e`, `Pressed` on `Q`, `w ≤ 0`, `q < 0`), `gap_cost`, `line_cost` (`Mixed (other l) e`, `∃ i ∈ other l, e i ≠ e l`). Matched.
- Angular chapter ↔ `YM.Bid.station` (signature has A01–A11, A13–A17 and no A12, consistent with the brief); `Town.currencies` (scalar ratio from a nonzero limit, \eqref{eq:angular-scalar-ratio}); `YM.Work.A09.answer` (perfect plane brackets, Casimir centrality); `YM.Work.A12.selector_exists` (polynomial selector, proved in the English); `YM.Spin.offset`, `demand` (the two iteration identities, by `noncomm_ring`), `rectify` (hypotheses `‖1‖ + ‖2‖ A < C`, `‖x‖ + C(2ε) ≤ A`, matching the English constants), `enough` (all `‖D i‖ < 1/2` and perfect relations give `D i = 0`), `realize` (near-identity unit intertwiner in a closed subgroup containing 1); `YM.Work.A15.averageStress` (Haar integral over `Ortho`); `YM.Work.A14.answer`; `YM.Climb.descends` (calls `Ward.global` on `c⁻¹ • Y` with `Crystal.ready`).

## Lean declarations opened

| Fully qualified name | Path | Matched |
| --- | --- | --- |
| `YM.Maxwell.WickPol`, `YM.Maxwell.Slot`, `YM.Maxwell.equalPol` | `Lean/YM/Maxwell/Equation.lean` | yes |
| `YM.Maxwell.Free.Host`, `YM.Maxwell.Free.hosting` | `Lean/YM/Next/MAXWELL/Living.lean` | yes |
| `YM.Maxwell.Free.collapses`, `YM.Maxwell.Free.hosted_out` | `Lean/YM/Next/MAXWELL/Batch.lean` | yes (strictness via `detects`, L2) |
| `YM.Maxwell.Free.score`, `YM.Maxwell.Free.core`, `YM.Maxwell.Free.detects` | `Lean/YM/Next/MAXWELL/Core.lean` | not cited in English (L2) |
| `YM.Maxwell.Free.ghost`, `ghost_le`, `ghosts_out` | `Lean/YM/Next/MAXWELL/Statistic.lean` | yes |
| `YM.Maxwell.Free.group_meal`, `matrix_meal`, `reduces_top`, `exposed` | `Lean/YM/Next/MAXWELL/Hidden.lean` | yes |
| `YM.Maxwell.Free.circulate`, `circulate_eval`, `circulates_lower` | `Lean/YM/Next/MAXWELL/Morsels.lean` | yes |
| `YM.Maxwell.Free.cluster_clear` | `Lean/YM/Next/MAXWELL/Rumbles.lean` | yes |
| `YM.Maxwell.Free.charges_quiet` | `Lean/YM/Next/MAXWELL/Magnitude.lean` | yes |
| `YM.Maxwell.Free.scenes_gone`, `finite_lenses`, `scanner` | `Lean/YM/Next/MAXWELL/Scenes.lean` | statement conflated in English (L1) |
| `YM.Maxwell.Free.erasing` | `Lean/YM/Next/MAXWELL/AwayTeam.lean` | name only (evidence misnames it, L5) |
| `YM.Ward.angular`, `commutes`, `onLine`, `Collinear`, `fromD` | `Lean/YM/Ward/Sum.lean` | yes (L3 for `onLine`) |
| `YM.Ward.channel`, `Still` | `Lean/YM/Ward/Walk.lean` | yes |
| `YM.Ward.fills`, `YM.Ward.global` | `Lean/YM/Ward/Axis.lean` | yes |
| `YM.Ward.higher`, `Latest`, `Earliest`, `last_adv`, `first_adv` | `Lean/YM/Ward/Extreme.lean` | yes |
| `YM.Analysis.center`, `YM.Analysis.builds` | `Lean/YM/Ward/Rate.lean` | yes |
| `YM.PDE.flow_step`, `YM.PDE.sure` | `Lean/YM/Ward/PDE.lean` | yes (existence and statement head) |
| `YM.Ward.Circle.uniform`, `vector` | `Lean/YM/Ward/Circles.lean` | yes (existence and statement head) |
| `YM.Ward.radial`, `YM.Ward.swing` | `Lean/YM/Ward/Genuine.lean` | yes (existence and statement head) |
| `YM.Outer.outer`, `YM.Outer.miles` | `Lean/YM/Next/ROTATIONS/Route.lean` | yes |
| `YM.Outer.chart`, `mixesLine`, `track_sale`, `exterior_size` | `Lean/YM/Next/ROTATIONS/Vanishing.lean` | yes (sign hypotheses omitted in English, I4) |
| `YM.Outer.shear_size`, `bead_size`, `mote_size` | `Lean/YM/Next/ROTATIONS/Cove.lean` | content not written in English (I4) |
| `YM.Outer.coneWeight` | `Lean/YM/Next/ROTATIONS/Mass.lean` | yes ($Z_{r,n}$) |
| `YM.Outer.point_cost`, `line_cost` | `Lean/YM/Next/ROTATIONS/Tunnel.lean` | yes |
| `YM.Outer.opp`, `alternate` | `Lean/YM/Next/ROTATIONS/Switch.lean` | yes |
| `YM.Outer.petal_mid`, `petal_home` (and `petal_d`, `petal_self`) | `Lean/YM/Next/ROTATIONS/Patch.lean` | English says "limits" (I3) |
| `YM.Bid.A05`, `A06`, `A07`, `A08`, `Brackets` | `Lean/YM/Bid/Angular.lean` | yes; A05 proof not in English (L4) |
| `YM.Bid.station`, private `pressured`, `formed`, `currencies` | `Lean/YM/Bid/Town.lean` | yes (L2 for $c\ne0$) |
| `YM.Climb.Crystal`, `YM.Climb.descends` | `Lean/YM/Climb/Beams.lean` | yes |
| `YM.Work.A05.Observer.gets_translation`, `YM.Work.A05.Observer.gets_rotation` | `Lean/YM/Work/A05.lean` | existence only (L4) |
| `YM.Work.A06.test_aisle`, `transverse_zero` | `Lean/YM/Work/A06.lean` | existence and statement head |
| `YM.Work.A07.transfer`; `YM.Work.A08.orbital_ward`, `defect_ward` | `Lean/YM/Work/A07.lean`, `A08.lean` | existence and statement head |
| `YM.Work.A03.all_line`, `YM.Work.A04.finite_faithful` | `Lean/YM/Work/A03.lean`, `A04.lean` | existence and statement head |
| `YM.Work.A09.answer` | `Lean/YM/Work/A09.lean` | yes |
| `YM.Work.A12.selector_exists` | `Lean/YM/Work/A12.lean` | existence |
| `YM.Work.A14.answer`, `YM.Work.A15.averageStress` | `Lean/YM/Work/A14.lean`, `A15.lean` | existence and definition |
| `YM.Spin.defect`, `φ`, `offset`, `demand`, `rectify`, `stable` | `Lean/YM/Spin/Isolates.lean` | yes |
| `YM.Spin.restrict_rel`, `enough`, `onto` | `Lean/YM/Spin/Close.lean` | yes |
| `YM.Spin.realize` | `Lean/YM/Spin/Shape.lean` | yes |
| `YM.Spin.produces` | `Lean/YM/Spin/Lands.lean` | existence |

## What I did not check

- Proof bodies of A01–A08, A14, A15, `Spin.*`, `Outer.*` beyond statements and the parts quoted; hidden instances and coercions were not audited systematically (e.g. the `Own`, `Pressed`, `Allows`, `Runs` predicates were read only through their use).
- Declarations of the analytic chapter's evidence other than those in the table (`Plants.lean`, `Rows.lean`, `Ket.lean`, `Motion.lean`).
- The Lorentz-step declarations (`YM.Org.Commission.picks`, `Tab`, `mill`) and `Work.A16/A17`.
- No Lean build, `#print axioms`, or replay.
