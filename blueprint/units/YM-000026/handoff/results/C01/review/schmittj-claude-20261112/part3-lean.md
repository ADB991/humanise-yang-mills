# C01 review, part 3: Lean correspondence

- Package: C01 (unit YM-000026), issue #42, PR #81 head `165fb24`; Lean source pinned at `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`; tracked tree `Lean/` = `328ad19b404d2db2a578319ea3e4eba4b27e34ef` at both `18d0327` and `HEAD`).
- Scope: correspondence claims for `atlas-estimates.tex`, `rg-horizon-geometry.tex`, `curvature-horizon-producer.tex`, and the statements of `RESULTS.md`, `HANDOFF.md`, `VALIDATION.md`, `manifest.json` (producer/consumer edges, claimed repairs, hashes). Canonical evidence files read: `atlas-estimates-evidence.md`, `rg-horizon-geometry-evidence.md`. No Lean build or elaboration was run; all statements below come from reading the declaration types and the definitions they depend on.
- Reviewer: Claude agent, session `schmittj-claude-c01-review-20261112`. No human acceptance recorded.
- Outcome: the three chapters follow the source's main steps closely and their English statements match the declaration types, with the deviations listed below; none makes an English claim false. The records' main defect is that the literal-run attachment and path-bound claims cite no producer declaration that states them for the literal run (L2).

## Findings, ordered by severity

### L1. INACCURACY (records, packaging). Review status rests on commits absent from the repository

- Location: `VALIDATION.md` paragraphs 1, 3, 5; `HANDOFF.md` paragraph 3; `manifest.json` `mathematical_content_review_basis`.
- Passage: "The independent reviewer, Checker alpha, issued a conditional local interim renewal at frozen commit `292c535…`"; "All eleven C01 mathematical files are byte-identical to the independently reviewed author snapshot `292c535…`"; "assembled at commit `ebdeb57…`".
- Verified reasoning: `git cat-file -t` fails for `292c535d58ed4e9e0437be95c6271f383e12adab` and `ebdeb57914c0e284d85f1eddd0649e4a0c6300e1` in this worktree, and there is no `results/C01/review/` directory at `165fb24` (and none at `18d0327`). The claimed interim review and its findings A1/A2/A3/N1 therefore cannot be inspected from the PR. What I could verify: the eleven chapter hashes in `HANDOFF.md` and `manifest.json` equal the files at `165fb24`; the target `18d0327` did not change any owned C01 file since the release `9d11cca` (`git diff --stat` empty); `git diff --check 18d0327 HEAD` passes; the Lean tree hash is as stated.
- Requested change: either add the Checker alpha report (or a link to a reachable ref) to the PR, or describe it as unverifiable external evidence; do not let it count as a review of the current text.

### L2. INACCURACY (records; manuscript text correct). Literal-run attachment and path bounds cited without their producer

- Location: `RESULTS.md` row "Retained horizon and actual path" and bullet "Literal path data"; `HANDOFF.md` edges `C01-to-C16-public-run-binding`, `C01-path-physical-quadratic`; manuscript `rg-horizon-geometry.tex` lines 386-398.
- Passage (RESULTS): "attachment and level-priced path bounds hold for the same `(N,p,i)` when `i≤N`" with anchors `YM.Independent.{constructionRun,fundedRun}`, `YM.Integration.NativeComponentRecipe.{Choice,realize}`, `YM.RG.PathData.Bounds`, `YM.Work.F03.*`.
- Verified reasoning: none of the cited declarations states `Attached (R.alloy.B.M.H N i) ((R.family.path.rep N p i).path)` or the `Bounds` for the literal `R`. `PathData.Bounds` is a definition; `constructionRun`/`realize` give `Realized` (door, book, bill, payment, licensed, supplies, flat `Quorum`), not attachment. The evidence file cites `YM.RG08.Reports.on_same`, `YM.RG08.Supplies.heatSame` and `ExtraGates.attached`, which concern existentially chosen families, as RESULTS itself warns. I located the actual chain: `R.family = Family.mk (Issue.trail R.T) …` (`Lean/YM/FullVolume/Cross.lean`), `Issue.trail V = A.B.bake.make V.history` (`Lean/YM/Extra/SOURCE_HISTORIES/Issue.lean`), `R.T.sticks : A.B.bake.Stays history` (`YM.Org.Bolt`, `Lean/YM/Org/Input.lean`), `YM.Shoot.Competes.prices` and `YM.Shoot.Lives.path` (path at `(N,i)` equals `bake.path N i`), `YM.PCalc.Directed.bases : bake.path = kin.path`, and `YM.PCalc.Kin.Planned.links`/`.cap` (`Lean/YM/PCalc/Loop.lean`), which give `Attached (M.H N m) (kin.path N m)` and `Bounds (a.params m).clip (a.params m).width (a.params m).paths (a.clock.loopCap m)`. The same three-step argument is the proof of `YM.PCalc.Directed.actually` (`Lean/YM/PCalc/Band.lean`). This is exactly the argument of manuscript lines 389-394, so the manuscript is correct; the records lack the anchors. The RESULTS description of the `Bounds` fields (positive width; row, three- and four-leg budgets at the path price; two-leg budget at the loop cap; invariance; summability; `metric_zero` at the clip; loop jets) matches `YM.RG.PathData.Bounds` exactly.
- Requested change: cite `YM.PCalc.Kin.Planned.{links,cap}`, `YM.PCalc.Directed.bases`, `YM.Shoot.{Competes.prices,Lives.path}`, `YM.Org.Bolt.sticks` (and the pattern `YM.PCalc.Directed.actually`) as the producer for the literal run.

### L3. INACCURACY (manuscript, pre-existing). Metric form of the second transport identity versus the source

- Location: `rg-horizon-geometry.tex` lines 29-34, 206-212; `RESULTS.md` bullet "Original transport and terminal packet".
- Verified reasoning: `YM.Precision.Towers.Diagonal.stays` is `installed T * H'.diagonal.acts c * d 1 c = H.diagonal.acts f * d 1 f * installed A0` (unamended pulses). `YM.Work.F09.answer` converts it to the metric form using `Floor.same` (`metric * d 1 = diagonal * d 1`) on both beds; `YM.Pert.Bulk.inherited_precision` does the same. The manuscript states the metric form as what "the tangent identities give". Mathematical content: see `part3-mathematics.md` F1.

### L4. INACCURACY (manuscript, pre-existing). Curvature factor in the retained horizon is not literally the square root of the rebased row

- Location: `rg-horizon-geometry.tex` lines 213-215; `curvature-horizon-producer.tex` lines 195-223, 262-264 ("This proves the bed and curvature suppliers used by the horizon construction").
- Verified reasoning: `YM.Next.Free.check_bleep` gives `Bleeps … (P.rollFunds k m l)` from `YM.Next.Free.Flight.rebased`; `rollFunds = D^T (render) D` is the manuscript's $R=D_c^{\mathsf T}R_0D_c$, and `Flight.frontier` gives its full positivity (`Funds`) under `m*B ≤ L^2` and its lower amendment requirement `C ≤ l`, exactly as in the manuscript. However `Craft.Rack.creak` only retains `Reaches` (positivity on the range of $d_2$), and `YM.Bid.pinning` then applies `F06` (a new fully positive $P_1$ with `Pledge`, i.e. the same $d_2^{\mathsf T}\cdot d_2$) and `F07` (square root) before `F08`. So the factor $P$ appearing in the retained tower rows $M_O$ is the square root of $P_1$, not of `rollFunds`. The Roll identities and costs hold for either choice, so no English statement becomes false, but "used by the horizon construction" overstates the literal identity of the factor.
- Requested change: say that the source re-enlarges the factor (F06) before the square root (F07), or that the manuscript's direct square root is an equivalent alternative.

### L5. NIT/INACCURACY (records). Small imprecisions in the RESULTS atlas row

- `RESULTS.md` row 2: "`0≤σ≤min(α_f,α_c)`" does not mention that the tower receipt must hold at a width $\ge\sigma$; in `YM.Pert.Bulk.predictor_atlas` the tower shares the fine bed's width and cost ($C_f=C_T=C$), which is also what `priced_atlas` uses. The manuscript theorem uses one common width $\alpha$ for all three receipts and is consistent.
- "its response row sum is `L^-2` times the product of the fine and coarse bed row sums" means the matrix product over the intermediate face label (as displayed in `prop:ex-lattice-response-travel`).
- "its cover response obeys `K(x+Lu,y+u)=K(x,y)`" is true (I checked it from $\rho_L(x+Lu)=\rho_L(x)+u$ and translation invariance of the stencils) but is not stated in the cited manuscript producer.
- `travels_route` (cited for the travel property) proves only the existence of a constant row sum; the carrier on every period is `YM.Pert.Bulk.matches_response`/`values`, which needs neither the wire nor the stages. The proposition bundles both; the records should cite both, as row 2 partly does via `values`.

## PR #81 repairs touching these chapters

- "make cost signs explicit": the added premises $C\ge0$ (`lem:ex-lattice-cross-atlas`), nonnegative $Q$ (`lem:ex-lattice-sandwich-atlas`), $C_T\ge0$ (`thm:ex-lattice-response-atlas`) correspond to `cross_atlas (hg : 0 ≤ p)`, `Atlas.nonneg`, `predictor_atlas (hp : 0 ≤ C) (hr : 0 ≤ X)`. The new statement $\Omega_{J_i}\ge0$ (`rg-horizon-geometry.tex` lines 312-314) is `YM.Pert.Bulk.merit`, which derives it from the inverse-row strip bound at a fixed face label, exactly as argued. Verified.
- "make convergence premises explicit": the absolute convergence in the proof of `prop:ex-lattice-response-travel` corresponds to `travels_bind`'s summability via `produce_any`; correct.
- New `prop:ex-lattice-response-travel`: matches `YM.RG08.Flat.travels_route` (its flight type `Flight j t` carries odd $L\ge3$, `4 ≤ j` and `t ≤ j ≤ t+1`; the theorem adds `4 ≤ t`, uses `k.penalty_pos`, and assumes `V.T = (F.duo k.penalty).T`), `alias_origin` (zero-momentum read equals `toll L 2 * δ` with `toll L 2 = L^{-2}`), `travels_duo`, and `matches_response`. Verified; see L5 and `part3-mathematics.md` F3/F4.
- New paragraph on stage-indexed prices (`rg-horizon-geometry.tex` 309-328) matches `YM.Precision.Horizon.Suffices.{rows,costs}` and `YM.Pert.Bulk.priced_atlas` exactly (cost `pre Faces Faces Ω_{J(m+1)} (exp(4σ) Ω_{J(m+1)}) Ω_{J m}`, depth `3 ≤ J(m+1)` implied by admissibility `4 ≤ J`). Verified.
- New sentence that the public horizon contract does not identify transport rows (337-342): correct; identification needs `YM.Next.Free.Present` (used as hypothesis `hD` in `Lean/YM/RG08/Flat/World.lean`).
- New direct-block identity (372-384) matches `YM.Work.F03.metric_pair` (with `left_stack`, `ellLine_mulVec`), including the requirement that the floor and the bounds use the same clip. Verified.
- New attachment argument (386-398): correct, see L2.
- `curvature-horizon-producer.tex` 258-262 (stage-indexed prices without common bounds): matches `YM.Next.Free.pledges` (`X.α i = min …`, `X.Ω i = max …`, floors `max (n i i) (n i (i-1))`). Verified.
- "correct the free-kernel source anchors": not in my chapters except `rem:ex-lattice-atlas-open`, whose new wording is accurate.

## Per-chapter correspondence table

| Chapter | Claims checked | Verdict |
| --- | --- | --- |
| `atlas-estimates.tex` | install, carry, cross atlas, sandwich, predictor atlas, travel, carrier | Matched (L5 for the records). The manuscript constants are per label, exactly as `RowCost`/`ColCost`; the centered margin $+2$ versus source $+4$ is stated. |
| `rg-horizon-geometry.tex` | Floor/Diagonal/Roll/Replaces/Bleeps/Opens, F08 constants, F09 algebra, schedule recursion, shelves/pinning/retained_support, Suffices, priced atlas, Attached/F03, public-run binding | Matched with L3, L4 and the omitted width $\nu$ (mathematics F2); L2 for the records |
| `curvature-horizon-producer.tex` | lifts (`dormant_right`, `dormant_left`, `roof_final`, `Double.duplex`), rebased defect, frontier positivity and floor, amendment beds (`Defined`, `bid_bed`), price selection (`pledges`, `buys`) | Matched, with L4; the manuscript's symmetrization of $C$ is an addition not present in `duplex`, harmless and needed for its own square-root route |

## Lean declarations opened

| Fully qualified name | Path | Matched |
| --- | --- | --- |
| `YM.Pert.Bulk.RowCost`, `ColCost`, `foot`, `Atlas` | `Lean/YM/Pert/Bulk/Atlas.lean` | yes (per-label row $p/L^m$, column $pL^4/L^m$, difference $p/L^{m+1}$, `nonneg`) |
| `YM.Pert.Bulk.delta`, `sep` | `Lean/YM/Pert/Bulk/Sites.lean` | yes ($d_L(x,y)=|x-Ly|_1/L$) |
| `YM.Pert.Bulk.install`, `mixed_sep`, `cross_row`, `cross_col`, `install_step`, `cross_atlas` | `Lean/YM/Pert/Bulk/Crossing.lean` | yes |
| `YM.Precision.forwardC`, `advanceC`, `Towers`, `Towers.Deep`, `Towers.Diagonal`, `Towers.Roll`, `Bed`, `Bed.full`, `Bed.covered`, `Floor`, `Attached`, `Horizon`, `MapPrices`, `Horizon.Suffices` | `Lean/YM/PREC/Stacks.lean` | yes (note `Diagonal.stays` uses `diagonal`, L3) |
| `YM.Pert.Bulk.sandwich`, `pre`, `row_sandwich`, `col_sandwich`, `all_sandwich`, `response`, `predictor_atlas`, `priced_atlas` | `Lean/YM/Pert/Bulk/Coin.lean` | yes |
| `YM.Pert.Bulk.merit`, `fine_share`, `carrier_share`, `values`, `atlas_here`, `allotment` | `Lean/YM/Pert/Bulk/Keys.lean` | yes |
| `YM.Pert.Bulk.carrier`, `matches_response`, `inherited_precision` | `Lean/YM/Pert/Bulk/Inherit.lean` | yes |
| `YM.Pert.Bulk.Matches` | `Lean/YM/Pert/Bulk/Projected.lean` | yes |
| `YM.RG08.Flat.travels` | `Lean/YM/RG08/Packets/Swing.lean` | yes |
| `YM.RG08.Flat.travels_bind`, `travels_plain`, `alias_origin`, `travels_duo`, `travels_route` | `Lean/YM/RG08/Packets/Harmonic.lean` | yes |
| `YM.Next.Free.toll` | `Lean/YM/Next/FREE_KERNELS/Strands.lean` | yes (`(L^v)⁻¹`) |
| `YM.Next.Free.Flight` | `Lean/YM/Next/FREE_KERNELS/Signal.lean` | yes (odd, $L\ge3$, $4\le j$, $t\le j\le t+1$) |
| `YM.Craft.Donate`, `defect`, `Bleeps`, `Reaches`, `Funds`, `Pledge`, `Opens`, `bond`, `Replaces`, `Rack` | `Lean/YM/Bid/Craft.lean` | yes |
| `YM.Bid.F06`, `F07`, `F08`, `F09`, `Retained`, `pinning` | `Lean/YM/Bid/Craft.lean` | yes (L4) |
| `YM.Work.F08.stencilCost`, `strip_stencil`, `fullRow`, `acts_full`, `answer` | `Lean/YM/Work/F08.lean` | yes, all constants; width includes $\nu$ (mathematics F2) |
| `YM.Work.F08.fineCompose`, `carry_size` (signature) | `Lean/YM/Work/F08/Mixed.lean` | yes |
| `YM.Work.F09.answer` (uses `Floor.same`) | `Lean/YM/Work/F09.lean` | yes |
| `YM.Next.Free.diagonal`, `check_bleep`, `stageHop`, `flying`, `location`, `destination`, `loc_land`, `loc_top`, `Present`, `Credit`, `shelves`, `retained_presents`, `retained_support` | `Lean/YM/Next/FREE_KERNELS/Rack.lean` | yes |
| `YM.Next.Free.Mag`, `BottomQuote`, `HopQuote`, `Catalog`, `buys`, `pledges` | `Lean/YM/Next/FREE_KERNELS/Priced.lean` | yes |
| `YM.Next.Free.Flight.rollFunds`, `Flight.frontier`, `Flight.rebased` | `Lean/YM/Next/FREE_KERNELS/Eject.lean` | yes |
| `YM.Next.Free.dormant_right`, `supplyLift`, `dormant_left`, `roof_final`, `Double.{wing,flow,top,X,skip,both,duplex}` | `Lean/YM/Next/FREE_KERNELS/Lifts.lean` | yes, step by step |
| `YM.Next.Free.Defined`, `bid_bed` | `Lean/YM/Next/FREE_KERNELS/Ground.lean` | yes (diag = pulse, dual = dual pulse, metric = amended, inverse = pledge) |
| `YM.Work.F03.layout_physical`, `ellLine_root`, `ellLine_mulVec`, `left_stack`, `metric_pair` | `Lean/YM/Work/F03/Metric.lean` | yes |
| `YM.RG.PathData.Bounds` | `Lean/YM/RG/PathActions.lean` | yes (RESULTS field list exact) |
| `YM.Independent.constructionRun`, `fundedRun` | `Lean/YM/Independent/ConstructionRun.lean` | yes (statement only) |
| `YM.Integration.ActualRunNativeComponentRecipe.on_run`, `Attached`, `of_preselection` | `Lean/YM/Integration/ActualRunNativeComponentRecipe.lean` | yes (this `Attached` is a run predicate, unrelated to `YM.Precision.Attached`) |
| `YM.Integration.NativeComponentRecipe.Choice`, `floor`, `Realized`, `realize` | `Lean/YM/Integration/NativeComponentRecipe.lean` | yes (flat `Quorum` with `e=0`, `flatFloor` premise) |
| `YM.RG08.Flat.Quorum`, `entrance_gate` (statement) | `Lean/YM/RG08/Flat/Entrance.lean` | yes |
| `YM.RG08.Flat.curve`, `Lambda`, `Lambda'`, `Delay` | `Lean/YM/RG08/Flat/Length.lean` | yes ($w(j)=\min(1,\alpha_j,\alpha_{j+1})$, $\Lambda'=3+\log\hat\beta$) |
| `YM.RG08.Flat.clock` | `Lean/YM/RG08/Flat/Mesh.lean` | yes ($2+Z_k+|{\rm scale}_i-{\rm scale}_k|$) |
| `YM.RG08.Reports.on_same`, `YM.RG08.Supplies.heatSame`, `ExtraGates` | `Lean/YM/RG08/Reports/Receipt.lean`, `Lean/YM/RG08/Supplies/Actual.lean`, `Lean/YM/RG08/Reports/Roads.lean` | existential families, not the literal run (L2) |
| `YM.PhysicalNext.Repeat.Legato.Run`, `Run.family` | `Lean/YM/FullVolume/Cross.lean` | yes |
| `YM.Org.Alloy`, `YM.Org.Bolt`, `Assembly` | `Lean/YM/Org/Input.lean` | yes |
| `YM.PCalc.Directed`, `Directed.actually` | `Lean/YM/PCalc/Band.lean` | yes (producer pattern for L2) |
| `YM.PCalc.Kin.Planned` | `Lean/YM/PCalc/Loop.lean` | yes |
| `YM.Shoot.Competes`, `YM.Shoot.Lives` | `Lean/YM/Shoot/Reach.lean`, `Lean/YM/Shoot/Criteria.lean` | yes |
| `YM.RG08.Flat.turn_class` (location only) | `Lean/YM/RG08/Packets/Present.lean` | exists |

Existence-only checks for the other RESULTS anchors (not my chapters): `YM.Slice.reflected_positive`, `YM.Extraction.Banks.{kept,reflectedK,at_cut}` (namespace `YM.Extraction.Banks` in both `Banks.lean` and `Pairs.lean`), `YM.Extraction.Order.{witnesses,realPositive}`, `YangMills.WilsonFamily.Converges` (`def Converges` in `Lean/PublicWilson.lean`; namespace not checked), `YM.RG08.Flat.{poised,toward,same_shadow}`, `YM.RG08.Packets.matches_back` (namespace not checked), `YM.Next.Free.{Flight.wire_budget,secure_both,carryStep,cover_step,enters,matrix_cover,record_eq,Moderate.kept,Moderate.inv,Train.D_signed,pink_row,rotations_d,sworn_metric,heart_inverse,heart_saves,Flight.tangent,Flight.scaled_tri,Flight.scaled_mul,Flight.adjust_adj}`, `YM.Org.Arrives.serves`, `YM.Org.Cleaner.stay`, `YM.Next.Extract.finish`: all found at the cited paths (`rotations_d` is in `Pulled.lean`, consistent with the brace grouping). Their statements were not compared with the manuscript.

## What I did not check

- No Lean build, `#check`, axiom listing or kernel replay; correspondence is by reading types and definitions.
- The proofs of `F06.answer`, `F07.answer`, `Flight.frontier`, `absorb_before`, `wire_budget`, `secure_both` and the selection theorem behind `constructionRun` were not read.
- The Wilson-law, reflection-positivity, flat-step, flat-rate, terminal-packet, signed-symmetry and later-closure rows of `RESULTS.md` were checked only for declaration existence.
