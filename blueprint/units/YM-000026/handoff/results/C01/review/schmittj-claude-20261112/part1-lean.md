# Review of work package C01, part 1: Lean correspondence

- Unit: work package C01 of unit YM-000026; chapters `lattice.tex`, `quadratic-lattice-symmetry.tex`, `flat-estimate.tex`, `flat-step.tex`, `positive-row-producer.tex`; author records `blueprint/units/YM-000026/handoff/results/C01/{RESULTS,HANDOFF,VALIDATION}.md` and the evidence files `lattice-evidence.md`, `flat-step-evidence.md`, the relevant rows of `correspondence.md`.
- Role: Lean correspondence (review question II), part 1 of a split review.
- Human reviewer: `schmittj` (no human acceptance recorded). Agent: one Claude (Opus 5.5) agent, session `schmittj-claude-c01-review-20261112`.
- Reviewed at commit `165fb24` (PR #81 head); source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read from `Lean/` in the worktree. No Lean build, elaboration or axiom replay was run; all statements below come from reading declaration types and definitions.
- Outcome: every declaration cited for these chapters in the records exists under the stated name and path, with one namespace slip in the evidence file (L4). The English statements are faithful to the source; where they differ, the English is a reorganisation with explicitly stated hypotheses that are equivalent to or implied by the source's (details below). No mismatch that changes a mathematical statement was found. The five chapters themselves contain no Lean names (as required by the project rules); the correspondence lives in the records.

## Findings, ordered by severity

### L1. INACCURACY. The finite reflection-positivity proof is a reorganisation, not the source's proof. Records (`RESULTS.md` line 12, `HANDOFF.md`); introduced by PR #81 together with the new section.

The English statement of `prop:ex-lattice-finite-reflection` matches `YM.Slice.reflected_positive : 0 ≤ β → YM.Cells.Positive G β C` exactly: `YM.Cells.Cut` has `even : n = 2*half`, a kind (site/link), an axis and a base line; `Cut.sector` is `{x | kind.Strict half (x_pos - b).val}` with `Strict site w r := 0<r<w`, `Strict link w r := r<w`; `Cut.reflect` sends the time coordinate to `2b - shift - t` with shift 0 (site) or 1 (link); `Cut.pullC = pull flip slide`, which reads a reflected negative step as the inverse link; `YM.Cells.Interior K F` requires gauge invariance, Borel measurability, `LocalOn K F` (dependence only on links with both endpoints in `K`) and a uniform bound; `Positive` asserts `0 ≤ moment β (F · star (F ∘ pullC))` in the complex order, i.e. the integral is real and nonnegative. This is the English statement with $b=0$, translated cuts and arbitrary axis. The source proof, however, is a single positive-kernel argument over a decomposition `Dwelling = (Posts × Doors) × (Open × Open)` with `NNKernel.integrated` and `portPos`, covering both kinds; the manuscript gives a transfer-kernel argument for the link cut and a conditioning argument for the site cut. Both are correct (verified in `part1-mathematics.md`). The records do not say that the prose argument differs from the source's. Requested change: one sentence in the correspondence record ("the manuscript proof is a reorganisation; the source proves both kinds with one kernel argument in `Lean/YM/Slice/Reflection.lean`").

### L2. INACCURACY. Matching is defined with absolute convergence in English and with `tsum` in the source. `flat-step.tex` lines 209–217 (PR #81) and records line 14.

`YM.Pert.Bulk.Matches K A` is `∀ x y, display K c x y = A (wrap f x.1, x.2) y` with `display` a `tsum` over all cover points in the fibre; `tsum` of a non-summable family is 0, so the source definition carries no convergence. PR #81 made the English definition require absolute convergence of every fibre sum. This makes the English hypothesis stronger and the English conclusion stronger. In the use made here nothing is lost: the fibre sums of $T,U$ converge absolutely by the atlas, those of $P^\sharp$ by the folded bound, those of $P'$ by the folded bound of $P'$, and `YM.RG08.Packets.town_hall` itself proves its conclusion from `RowCost 0` bounds (via `second_ship`, `applies_bind`). The source transpose rule `YM.RG08.Packets.matches_back` assumes only `f = c·L`, `city L T` and `Matches T M`, no summability (an `Equiv` reindexing of `tsum` needs none); the English adds column summability, which is needed only because of the English definition. The records state this correctly ("Formal `tsum` matching alone does not assert ordinary convergence"). Status: the PR #81 repair is correct and makes the English meaningful; recorded here only so that the integrator knows the English and the source definitions are not literally the same. No change requested.

### L3. Confirmed. Penalty convention after PR #81. `flat-step.tex` lines 324–332.

`YM.Precision.Inputs S W H H'` has fields `primal : K H * W = (mean S)ᵀ * K H'` and `dual : mean S * W = 1 - S.kernel.penalty⁻¹ • K H'`, with `K H = (d 1 n)ᵀ * H * d 1 n` (`YM.Precision.K`) and `penalty_pos`. So the English $B=$ `mean S`, $\lambda=$ `S.kernel.penalty`, $\kappa=\lambda^{-1}$, $Q_H=K(\text{metric})$, and the transports $M_A,N_A$ are the `W` of the two histories (`installed S.ratio K.A0` in `Towers.Diagonal.trial`). The pre-PR wording "penalty coefficient $\kappa$" mislabelled the reciprocal; the repair is correct. `YM.RG08.Flat.poised` proves `K Y' - K H' = Wᵀ * (K Y - K H) * T` from `Inputs S T H H'`, `Inputs S W Y Y'` and symmetry of `Y`, `Y'` only: the English (`eq:ex-lattice-flat-step-schur`, with $T=M_A$, $W=N_A$) is the same identity with the same orientation.

### L4. NIT. Fully qualified name in the evidence file. `blueprint/units/YM-000026/flat-step-evidence.md`, crosswalk row "Diagonal tower data"; pre-existing.

The record writes `YM.Towers.Diagonal`; the structure is declared inside `namespace YM.Precision` / `namespace Towers` in `Lean/YM/PREC/Stacks.lean`, so its name is `YM.Precision.Towers.Diagonal`. Requested change: correct the name (evidence files are canonical read-only inputs for the author; the correction belongs in the author's C01 report directory).

### L5. NIT. "Selected grids have positive coupling": source path. `lattice.tex` lines 204–208 and `RESULTS.md` line 12/25; introduced by PR #81.

Confirmed in the source: `YM.Schedule.period_four : ∀ p, 4 ∣ (period p).val` (`Lean/YM/Lattice/Scale.lean`), so every side `P_p D_N` is even; under `C.Makes`, `C.path.Selected.represents` gives `YM.RG.History.Conv.band : β N p N ∈ [hatBeta N / 2, 2·hatBeta N]` (`Lean/YM/RG/History.lean`), and `YM.RG.Calendar.Fits.delayed : 1 < hatBeta m`, so $\beta_{N,p}>1/2$. The extraction uses only $\beta\ge0$ (`YM.Cells.seamless`, `Lean/YM/Cells/Packing.lean`, which calls `YM.Cells.laws` and hence `reflected_positive`). The records cite the extraction anchors but not these three declarations. Requested change: add them to the correspondence row for `subsec:ex-lattice-scales`.

### L6. Confirmed with a remark. Signed symmetry. `quadratic-lattice-symmetry.tex`; records `RESULTS.md` line 17 and edge `C01-quadratic-signed-symmetry`.

`YM.Bid.Sworn B n G := ∀ s a b, gaugeFiscal B (pulled a s) (pulled b s) = gaugeFiscal B a b`, with `gaugeFiscal` the colour sum of `dotProduct (parts x i) (K (B.metric.acts n) *ᵥ parts y i)` and `pulled` the signed pullback reading a reversed bond as minus the link at the shifted base, i.e. the English $R_s$. `YM.Next.Free.sworn_metric (B) (h : B.metric = amend k l v) (G) : Sworn B n G` under the section variables `0 < k`, `0 ≤ l`, `4 ≤ j`: this is the English final statement, "under the fixed positive penalty, nonnegative amendment and stage ≥4" as the ledger says. Its steps are those of the chapter: `obligations` (`G * d 1 n = H * d 1 n`, the amendment is invisible on exact forms), `apply_bill` (the bilinear form identity), `face_bill` (`eq:quadratic-face-symmetry`, with `turned` = $\epsilon_s$ and `regime` = $r_s$), `rotations_d` (`eq:quadratic-curl-rotation`), `pink_row` (`f a b z = f x y (s.act z)` and vanishing off the diagonal, i.e. $P_{pp}(z)=P_{p'p'}(sz)$, $P_{pq}=0$), `pink_sign` (the symbol identity on `baseCube`, with the $q=0$ case separate), and `Train.D_signed : levelD k v (s.perm a) (s.act p) = levelD k v a p`. Remark: `D_signed` is where the source does the work that the manuscript compresses into one sentence (`part1-mathematics.md`, M1); the source proves it from `feed_signed` and `chipSq_signed` by induction over the nozzle list. The English symbol formula is stated for $q\in[-\pi,\pi]^4\setminus\{0\}$, the source for `baseCube`; since uniqueness of Fourier coefficients only needs agreement on a full-measure set, this does not matter for the conclusion, and the correspondence record already notes the restriction.

### L7. Confirmed. Positive rows. `positive-row-producer.tex`; `correspondence.md` lines 630–640.

`YM.Bid.F07 : ∀ ι A v η, 0 < v → 0 < η → ∃ w B e, 0 < w ∧ 0 < e ∧ ∀ Q, Q.strip η A → YM.Craft.Funds Q v A → ∃ P, Funds P w B ∧ P.strip e B ∧ YM.Bid.SqActs Q P`, proved by `YM.Work.F07.answer` via `rootCollar` and `makeRoot`. `Funds Q v A` requires `IsHermitian (Q.read p)` and $v|x|^2\le\langle x,\widehat Q(p)x\rangle\le A|x|^2$ for real $p$; `SqActs Q P` is `Q.acts n = (P.acts n)ᵀ * P.acts n ∧ IsSymm (P.acts n)` for every side $n$. This matches the English square-root construction, with constants chosen as in the English ($\sigma=\eta/2$, $D=(\eta-\sigma)^{-1}A$ times the chart norm, $\tau=\min(\sigma,v/(2CD))$, $r=1-v/(2A)$); the English uses separate constants $C$ (strip) and $M$ (band) where the source uses one $A$. The source states the Hermitian hypothesis explicitly, the English presupposes it (`part1-mathematics.md`, M3). The analytic inverse via the Neumann series is not in `F07`; the record correctly calls it a local variant (the source inverts by an adjugate formula in `Next/FREE_KERNELS/Warm.lean`, not opened by me). The amendment identities coincide with `YM.Next.Free.obligations` (`Lean/YM/Next/FREE_KERNELS/Amend.lean`): `H*B=1`, `G*A=1`, `A=B+l•(Xᵀ*X)`, `G*d 1 n=H*d 1 n`, `X*G=D*d 2 n`, `Gᵀ=G`, `Dᵀ=D`, with `X = d 2 n * B`, `B = blue k v`, `H = pink k v`, `G = amend k l v`.

### L8. Confirmed. One-step flat propagation. `flat-step.tex`; `flat-step-evidence.md`; `RESULTS.md` line 14.

`YM.RG08.Flat.toward` assumes two `Towers.Diagonal` records, four `Floor`s, `Atlas ω L 2 T q`, `Atlas ω L 2 U p`, `city L T`, `city L U`, `Matches T (carrier S.ratio N Y Y')`, `Matches U (carrier S.ratio M H H')`, `neutral B`, `town 1 B`, `Folded τ B r`, `0<τ`, `0≤σ`, `σ≤ω`, `2σ ≤ L·τ`, `0≤r`, `Sigil B f (Q_Y − Q_H)` and `travels U`, and concludes `neutral B' ∧ town 1 B' ∧ Folded σ B' (neutralCoin L Faces Faces τ q p * r) ∧ Sigil B' c (Q_{Y'} − Q_{H'})`. Definitions checked: `Atlas` (row cost `p/L^m`, column cost `p·L^4/L^m`, first-difference `foot` row cost `p/L^{m+1}`, all per fixed input market/label and output label, weight `σ·delta L x y`, `delta L x y = sep x (L•y)/L`, `sep` the $\ell^1$ length), `Folded` (supremum over inputs of the weighted absolute sum in `ℝ≥0∞`), `neutral` (`∑' u, K x (u,i) = 0` over the output cover position for each output label), `town 1` (diagonal stationarity), `city` (`T (x+L•u) (y+u) = T x y`), `travels` (output-sum independent of the input cover point for each label pair), `neutralCoin L α β τ q t = card α · q · (card β · (2/τ) · t) / L` $=m^2q(2/\tau)p/L$, `carrier = H.inverse · installed T · H'.metric` ($C=G^{-1}RG'$), `inherited_precision` ($Cd_c=d_f\cdot$`installed A0` from `Diagonal.stays` and `Floor.same`), `Floor.inverse` (`metric * inverse = 1`, a right inverse, equivalent to the English left inverse for finite square matrices). The English proposition replaces `Diagonal`/`Floor` by the identities it derives from them (`eq:ex-lattice-flat-step-schur`, `eq:ex-lattice-flat-step-inherited`), which is a legitimate weakening of hypotheses, and states the explicit matching matrix $M^{\mathsf T}AN$ (which is what `town_hall` proves) instead of the existential `Sigil`. The orientation (root kernel matched by the $Y$ carrier, outgoing by the $H$ carrier) agrees.

### L9. Confirmed. Completion independence. `lem:ex-lattice-flat-same-output` (PR #81); `RESULTS.md` line 14 and edge `C01-flat-completion-output`.

`YM.RG08.Flat.same_shadow (h : H.Suffices P) (ht : T.Suffices R) (N i) (hI : i ≤ N) : output (H.H N i) = output (T.H N i)` for a horizon `H` over levels `a` and a horizon `T` over `shadow a γ hg` (same levels with an adjusted clock). Its proof is the English one: backward induction from `same_terminal` (both terminal precisions equal `K 1`) with `poised` at each step, then `readahead` with `RowCost 0 1` bounds on the outputs, `Matches (output) (quadratic _ n)` for all `n`, and `mesh_sides` (sides tend to infinity). The English lemma is a more general statement (any two horizons with common blocking data and the Schur identities), with the convergence hypotheses stated; the generalisation is correct (`part1-mathematics.md`, M4, for the wording). The ledger correctly says that only the quadratic outputs, not beds, roots or transports, are identified.

### L10. Confirmed. Scalar rate. `prop:ex-lattice-flat-rate`; `correspondence.md` line 24.

`YM.RG08.Rate.Stair.fade_solve` sets `μ := min c (θ/2)` and calls `poly_solve` with rate `θ - μ`; `poly_solve` uses `K = 2(d+1)/θ'`, `q = exp(-(θ'/2)·log 3)`, `B = A/(1-q)`, `y = K + age`; `weight_inv` gives `(weight θ x i)⁻¹ = (a_top / a_i)^θ`. The English proposition is the finite scalar version with general gap $\delta$ (the source has $\delta=\log3$ from blocks $\ge3$) and an extra shift $Z$; constants agree. The record's description "finite scalar variant" is accurate.

### L11. Confirmed. Finite law and interface. `lattice.tex` lines 11–88, 194–222.

`YangMills.plaquette U x i j = U(x,i)·U(x+e_i,j)·U(x+e_j,i)⁻¹·U(x,j)⁻¹`, `wilsonEnergy` sums over `Site l × Directions` (pairs `i<j`) of `1 − Re tr/(g.n+1)`, `wilsonLaw` is product Haar with density `exp(−β·energy)/∫exp(−β·energy)`, matching `eq:ex-lattice-action` and $\mu_{\ell,\beta}$; `YangMills.energy_eq`, `law_eq` identify these with `YM.Wilson.energy`, `law`; `YM.Wilson.partition_pos` holds for every real β. `WilsonFamily.smear` uses `mesh^(4n)` and `place` multiplies `valMinAbs` by the mesh; `WilsonFamily.Converges` is: eventually suitable along `volumeOrder`, a full mesh limit `row p` for each suitable `p`, then `row (volumeOrder k)` converges. `YangMills.WilsonRegularity` supplies continuity, gauge invariance and fixed-stencil locality of insertions, which the English "We require" refers to. The English gauge action `(g·U)_i(x) = g(x)U_i(x)g(x+e_i)^{-1}` is `YM.Lattice.gauge`.

## Checks of the PR #81 changes in these chapters

| Change | Source basis | Verdict |
| --- | --- | --- |
| `lattice.tex`: new subsection on finite reflection positivity | `YM.Slice.reflected_positive`, `YM.Cells.{Cut,Kind.Strict,Interior,Positive}`, `YM.Lattice.{pull,LocalOn}` | statement exact; proof reorganised (L1), mathematically correct |
| `lattice.tex`: $4\mid P_p$, $\beta_{N,p}>0$ in the selected construction | `YM.Schedule.period_four`, `YM.RG.History.Conv.band`, `YM.RG.Calendar.Fits.delayed` | correct (L5) |
| `lattice.tex`: "public convergence interface" | `YangMills.WilsonFamily.Converges` | correct |
| `flat-step.tex`: folded supremum in $[0,\infty]$ | `YM.Pert.Bulk.Folded` (values in `ℝ≥0∞`) | correct |
| `flat-step.tex`: negative-edge base point in the centering lemma | `YM.Pert.Bulk.atlas_difference`, `foot` | correct; I did not open `atlas_difference` itself, the repair was checked mathematically |
| `flat-step.tex`: absolute convergence in matching; transpose summability | `YM.Pert.Bulk.Matches`, `YM.RG08.Packets.matches_back` | stronger than the source's `tsum` definition, harmless (L2) |
| `flat-step.tex`: explicit Fubini majorant `mqpr` | `YM.RG08.Packets.second_ship` (`RowCost 0` bounds) | correct |
| `flat-step.tex`: penalty $\lambda$, $\kappa=\lambda^{-1}$ | `YM.Precision.Inputs.dual` | correct; fixes a mislabel (L3) |
| `flat-step.tex`: uniformity in $n_c$, cross-references | — | correct; the cross-referenced producers are outside this part |
| `flat-step.tex`: `lem:ex-lattice-flat-same-output` | `YM.RG08.Flat.{same_shadow,same_terminal,poised}` | correct generalisation (L9); wording M4 |

The author's statement that PR #81 "makes cost signs and convergence premises explicit" is accurate for `flat-step.tex` (convergence premises; penalty reciprocal). No cost-sign change touches these five chapters. The statement "correct the free-kernel source anchors" concerns files outside this part; I did not check it.

## Declarations opened

| Fully qualified name | Path (under `Lean/`) | Matched |
| --- | --- | --- |
| `YangMills.plaquette`, `YangMills.wilsonEnergy`, `YangMills.wilsonLaw`, `YangMills.WilsonFamily`, `YangMills.WilsonFamily.{mesh,place,finiteMoment,suitable,smear,Converges}` | `PublicWilson.lean` | yes |
| `YangMills.WilsonRegularity` | `ChallengeSpec.lean` | yes |
| `YangMills.wilsonFamily`, `YangMills.energy_eq`, `YangMills.law_eq`, `YangMills.smear_eq` | `WilsonBridge.lean` | yes |
| `YM.Wilson.{energy,prior,bare,partition,partition_pos,weight,law,moment,moment_formula}` | `YM/Wilson/Law.lean` | yes |
| `YM.Cells.{Kind,Kind.Strict,Cut,Cut.distance,Cut.sector,Cut.reflect,Cut.pullC,Interior,Positive}` | `YM/Cells/Cut.lean` | yes |
| `YM.Lattice.{gauge,GaugeInvariant,affine,pull,Agrees,LocalOn}` | `YM/Lattice/Path.lean` | yes |
| `YM.Slice.reflected_positive` | `YM/Slice/Reflection.lean` | yes (proof structure differs from prose, L1) |
| `YM.Cells.{Seam,laws}` | `YM/Cells/Certificate.lean` | yes |
| `YM.Cells.seamless` | `YM/Cells/Packing.lean` | yes |
| `YM.Schedule` (`period_four`) | `YM/Lattice/Scale.lean` | yes |
| `YM.RG.History`, `YM.RG.History.{Conv,Selected}`, `YM.RG.Calendar.Fits` (`delayed`) | `YM/RG/History.lean` | yes |
| `YM.Family` (`beta`, `Makes`) | `YM/Source/Construction.lean` | yes |
| `YM.Extraction.Banks.{reflectedK,at_cut}` | `YM/Extraction/Pairs.lean` | exists (statement read for `reflectedK`, `at_cut`) |
| `YM.Extraction.Banks.kept` | `YM/Extraction/Banks.lean` | exists, statement read |
| `YM.Extraction.Order.realPositive` | `YM/Extraction/Harvest.lean` | exists, signature read only |
| `YM.Extraction.Order.witnesses` | `YM/Extraction/Inherited.lean` | exists, signature read only |
| `YM.RG08.Flat.{poised,quadratic,Sigil,toward}` | `YM/RG08/Packets/FlatStep.lean` | yes |
| `YM.Precision.{K,Inputs}` | `YM/PREC/TreeMatch.lean` | yes |
| `YM.Precision.{Floor,Towers,Towers.Diagonal}` | `YM/PREC/Stacks.lean` | yes (evidence file misnames `Towers.Diagonal`, L4) |
| `YM.Pert.Bulk.{bill,RowCost,ColCost,foot,Atlas}` | `YM/Pert/Bulk/Atlas.lean` | yes |
| `YM.Pert.Bulk.{sep,delta}` | `YM/Pert/Bulk/Sites.lean` | yes |
| `YM.Pert.Bulk.{expense,Folded}` | `YM/Pert/Bulk/Stacks.lean` | yes |
| `YM.Pert.Bulk.neutral` | `YM/Pert/Bulk/NullPair.lean` | yes |
| `YM.Pert.Bulk.{display,Matches}` | `YM/Pert/Bulk/Projected.lean` | yes (`tsum`, L2) |
| `YM.Pert.Bulk.{carrier,inherited_precision}` | `YM/Pert/Bulk/Inherit.lean` | yes (`inherited_precision` statement via its use in `toward` and the evidence file) |
| `YM.RG08.Packets.{pass,city,town,matches_back}` | `YM/RG08/Packets/Torus.lean` | yes |
| `YM.RG08.Packets.travels` | `YM/RG08/Packets/Swing.lean` | yes |
| `YM.RG08.Packets.{neutralCoin,push_null}` | `YM/RG08/Packets/Lines.lean` | yes |
| `YM.RG08.Packets.{second_ship,town_hall}` | `YM/RG08/Packets/Pushed.lean` | yes |
| `YM.RG08.Flat.{shadow,same_shadow}` | `YM/RG08/Flat/Shadow.lean` | yes |
| `YM.RG08.Flat.same_terminal` | `YM/RG08/Flat/Agreement.lean` | yes |
| `YM.RG08.Flat.Quorum` | `YM/RG08/Flat/Entrance.lean` | exists, not analysed (outside this part) |
| `YM.RG08.Flat.travels_route` | `YM/RG08/Packets/Harmonic.lean` | exists, not analysed (outside this part) |
| `YM.RG08.Rate.Stair.{poly_solve,fade_solve}` | `YM/RG08/Rate/Ascent.lean` | yes |
| `YM.RG08.Rate.Stair.{weight_inv,Poly}` | `YM/RG08/Rate/Stair.lean` | yes |
| `YM.Next.Free.{pink_sign,pink_row,turned,turned_sq,reorient,rotations_d}` | `YM/Next/FREE_KERNELS/Pulled.lean` | yes |
| `YM.Next.Free.{address,regime,face_bill,apply_bill,sworn_metric}` | `YM/Next/FREE_KERNELS/Signed.lean` | yes |
| `YM.Next.Free.Train.D_signed` | `YM/Next/FREE_KERNELS/Feed.lean` | yes |
| `YM.Next.Free.pink` | `YM/Next/FREE_KERNELS/Curl.lean` | definition located (`record (pulse k v)`) |
| `YM.Next.Free.obligations` | `YM/Next/FREE_KERNELS/Amend.lean` | yes |
| `YM.Bid.{gaugeFiscal,pulled,Sworn}` | `YM/Bid/Station.lean` | yes |
| `YM.Craft.Funds`, `YM.Bid.{SqActs,F07}` | `YM/Bid/Craft.lean` | yes |
| `YM.Work.F07.{rootCollar,makeRoot,answer}` | `YM/Work/F07.lean` | yes |

## What I did not check

- No Lean build, `#print axioms`, elaboration or kernel replay; hidden instances and coercions were inspected only where they appear in the statements above (e.g. `ComplexOrder` for the RP inequality, `ℝ≥0∞` in `Folded`/`Atlas`).
- I did not open `YM.Pert.Bulk.atlas_difference`, `YM.RG08.Packets.{row_save,push_est,invariant,pass_push}`, `YM.Pert.Bulk.{applies_once,applies_bind,use_head2,readahead}`, `NNKernel.integrated`, `portPos`, `feed_signed`, `chipSq_signed`, `pulse_sources`, `pulse_zero`, or `Next/FREE_KERNELS/Warm.lean`; their roles were inferred from the theorems that call them and checked mathematically instead.
- The extraction consumers (`at_cut`, `kept`, `realPositive`, `witnesses`) were checked for existence and statement shape only; their use is C03's.
- The free-kernel anchors corrected by PR #81 in other chapters, and all declarations cited only for the other six C01 chapters.
