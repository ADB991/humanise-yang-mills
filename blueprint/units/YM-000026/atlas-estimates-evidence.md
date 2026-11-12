# Atlas-estimate evidence

- Unit: YM-000026, lattice existence construction.
- Status: draft; mathematical and source-correspondence review pending.
- Source revision requested for this task: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Authoritative mathematical text: `manuscript/existence/atlas-estimates.tex`.
- All arguments here are a new ordinary-mathematics organization of inspected finite weighted-kernel estimates. No external theorem is invoked.

## Inputs, meanings, and status

| Article notation | Formal meaning | Source |
| --- | --- | --- |
| $\mathcal C,\Lambda_L,\pi_L,\ell_L,\rho_L$ | The cover $\mathbb Z^4$, the four-dimensional finite torus, reduction, centered lift, and block quotient `rent` | `YM.Lattice` conventions used by `YM.Pert.Bulk.Crossing.install`; `YM.Precision.forwardC` |
| `strip` cost of a cross-stencil | For each residue and fixed pair of finite labels, the Laurent weighted absolute coefficient sum is bounded | `YM.CellFourier.Row.strip`; `YM.Laurent.Width` in `Lean/YM/Laurent/Eval.lean`; `YM.Pert.Bulk.Atlas` |
| $\widehat T$ | Installation of a cross-kernel as a cover-to-cover kernel: $T(\operatorname{wrap}x,i,j,y-\operatorname{rent}x)$ | `YM.Pert.Bulk.Crossing.install` |
| $\nabla_a^LT$ | `YM.Precision.forwardC L T a`; increments residue and corrects displacement by centered-lift carry | `Lean/YM/PREC/Stacks.lean` |
| order-two atlas | Per-fixed-label row cost $q/L^2$, column cost $qL^2$, and input-forward-difference row cost $q/L^3$ | `YM.Pert.Bulk.Atlas.Atlas`, defined from `RowCost` and `ColCost` in `Lean/YM/Pert/Bulk/Atlas.lean` |
| $I_f,J_c$ | Fine inverse and coarse metric row stencils | `YM.Pert.Bulk.Coin.response`; bed fields `Precision.Bed.inverse` and `.metric` in `Lean/YM/PREC/Stacks.lean` |
| $T$ | Tower two-form cross-kernel, not the newly generated `mf`, `mn`, or `o` rows | `Precision.Towers.T` in `Lean/YM/PREC/Stacks.lean`; for the selected free-kernel supplier, `Flight.duo.T = meshBook (wire k) 2 [] P` in `Lean/YM/Next/FREE_KERNELS/Primal.lean` |

The added proofs `lem:ex-lattice-cross-atlas`,
`lem:ex-lattice-sandwich-atlas`, and
`thm:ex-lattice-response-atlas` reproduce, with explicit cover changes of
variables, the content of `cross_atlas` followed by `all_sandwich` and
`predictor_atlas`. The article formulation names the finite labels and states
the per-label constants directly. These are reorganized arguments rather than
literal source theorem statements.

## Correspondence and construction chain

| Article result or step | Fully qualified declaration | Pinned path | Classification |
| --- | --- | --- | --- |
| Installed kernel and exact install-difference identity | `YM.Pert.Bulk.install`; `YM.Pert.Bulk.install_step`; `YM.Pert.Bulk.cross_atlas` | `Lean/YM/Pert/Bulk/Crossing.lean` | Proved source input; article rederives the coefficient change and residue decomposition explicitly |
| Per-label row/column/difference atlas interpretation | `YM.Pert.Bulk.RowCost`; `YM.Pert.Bulk.ColCost`; `YM.Pert.Bulk.Atlas` | `Lean/YM/Pert/Bulk/Atlas.lean` | Definition inspected |
| Composition and finite-label cost factors | `YM.Pert.Bulk.row_sandwich`; `YM.Pert.Bulk.col_sandwich`; `YM.Pert.Bulk.all_sandwich` | `Lean/YM/Pert/Bulk/Coin.lean`; bind estimates in `Lean/YM/Pert/Bulk/Tails.lean` | Proved source input; article supplies an ordinary weighted convolution proof |
| Complete response atlas from `Deep` and covered beds | `YM.Pert.Bulk.predictor_atlas` | `Lean/YM/Pert/Bulk/Coin.lean` | Proved in source; exact inputs are `V.Deep α C z`, `H.covered α C`, `H'.covered θ X`, `1≤z`, odd `L`, width comparisons and nonnegative costs. It consumes `V.T` base strip at `C/L²` and four first-difference strips at `C/L³`; no higher `Deep` fields are used for this estimate. Its output cost is `pre Faces Faces C (exp(4σ)*C) X`, i.e. `|Faces|² exp(4σ) C² X` for equal face types. |
| Publicly priced response atlas | `YM.Pert.Bulk.priced_atlas`; caller in `YM.RG08.Flat.to_here` | `Lean/YM/Pert/Bulk/Coin.lean`; `Lean/YM/RG08/Flat/World.lean` | `priced_atlas` only projects `Horizon.Suffices.costs` and `.rows` into `predictor_atlas`; the latter performs the quantitative estimate. |
| Tower receipt specification | `YM.Precision.Towers.Deep`; `YM.Craft.Donate` | `Lean/YM/PREC/Stacks.lean`; `Lean/YM/Bid/Craft.lean` | Definition inspected. `Deep` asks for `mn,o,mf` strips and every `A0,T` advance up to a finite order; `Donate` is the preserved `A0,T` part. |
| Bed construction from a flight | `YM.Next.Free.Flight.duo` | `Lean/YM/Next/FREE_KERNELS/Primal.lean` | `duo.T` is the actual cross-stencil `meshBook (wire k) 2 [] P`; it is not `rollFunds`. |
| Entrywise momentum-space estimate for the tower wire | `YM.Next.Free.Flight.wire_budget` | `Lean/YM/Next/FREE_KERNELS/Cable.lean` | Quantitative producer proved in source. For each finite family of flights `F : ι → Flight j t` and selected aliases `l i : Site (F i).L`, positive coupling `k`, and `j,t≥4`, it proves `Pay (fun i => decay j (l i)) (fun i p => wire k (F i) p (l i))`. `Pay.tap` bounds each complex matrix entry by a Moderate function, uniformly over the family and momentum. The proof splits on zero/nonzero aliases using `copper_budget` and `stake_budget`, whose factors are assembled by sum/product/quotient bounds for flux, heart, tail, masks, and train denominators. |
| Uniform thread receipt for all flights | `YM.Next.Free.secure_both`; `YM.Next.Free.Secured` | `Lean/YM/Next/FREE_KERNELS/Strands.lean` | `secure_both` applies `wire_budget` to the sigma-finite index of every flight and alias, then records reciprocal-shift and reflection identities. These are formal hypotheses of the `Secured` record, each proved by `knots_shift` and `knots_reflect`. |
| Laurent strip receipts for every actual difference word | `YM.Next.Free.Secured.bankCost`; `YM.Next.Free.Secured.traverse`; `YM.Next.Free.Secured.honored` | `Lean/YM/Next/FREE_KERNELS/Sprout.lean` | Proved source input. `bankCost` applies `matrix_cover` to entrywise `Pay`, obtaining `C/(L)^{e+|u|}` uniformly over flights. `traverse` identifies true cover differences with the mesh-book advance including carry. `honored` intersects the finitely many widths/costs for all words of length at most `j−2` by `staple`. For `e=2`, this gives exactly `Donate` for `duo.T` including empty and one-letter words. |
| Catalog containing these receipts | `YM.Next.Free.pledges` and fields `Catalog.hop` | `Lean/YM/Next/FREE_KERNELS/Priced.lean` | Proved in source. The hop uses `secure_both` plus `Secured.honored` for the tower strips; `Flight.frontier` supplies a different strip/positivity bound for `rollFunds`. The two are not interchangeable. |
| Rack carrying the receipts to the horizon | `YM.Next.Free.shelves`; `YM.Bid.Craft.Rack.legs` | `Lean/YM/Next/FREE_KERNELS/Rack.lean`; `Lean/YM/Bid/Craft.lean` | Proved transport: `shelves` uses `Catalog.hop` to fill `Rack.legs`. |
| Full horizon `Deep` records | `YM.Bid.pinning`; downstream `retarget_arc`; `Horizon.Suffices.costs` | `Lean/YM/Bid/Craft.lean`; `Lean/YM/UVExtension/Case/Valence.lean`; `Lean/YM/PREC/Stacks.lean` | Proved transport/construction: `pinning` calls `Work.F08.answer`; that theorem generates the new `mf,mn,o` estimates and passes the old `T,A0` `Deep` receipts through. `retarget_arc` then transports them using width/cost monotonicity. |
| Public construction selection and consumption of a suffices horizon | `YM.Independent.constructionRun`; `YM.Integration.ActualRunNativeComponentRecipe.on_run` | `Lean/YM/Independent/ConstructionRun.lean`; `Lean/YM/Integration/ActualRunNativeComponentRecipe.lean` | `constructionRun` selects a run with `R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric`; `on_run` uses the already selected `R.alloy.B.plan` on the actual horizon. This audit does not replay that larger selection theorem. The `FundedPredictionSupply.Always` argument is definitionally `True` and is not the source of the tower strip estimates. |

## Mathematical proof notes

1. For a fixed input point, the row sum is reindexed by
   $z=y-\rho_L(x)$. The centered lift has one coordinate of magnitude at most
   $(L-1)/2$, so $|\ell_L(r)|_1/L\leq2$; the difference from the source's
   $+4$ margin is harmless. The same substitution on a fixed output column
   first decomposes each input uniquely as $x=\ell_L(r)+Lv$; summing over
   $v$ costs the original strip bound, then summing over residues contributes
   exactly $L^4$. The one-step difference is exactly installation of
   `forwardC`, requiring the odd centered-lift carry identity.
2. The sandwich proof uses
   $d_L(x,y)\leq d_L(x+u,y+v)+|u|_1/L+|v|_1$,
   absorbs each displacement in its stencil strip using both
   $\sigma/L\leq\alpha$ and $\sigma\leq\alpha$, and sums over the two
   intermediate face-label sets. The input difference is obtained by
   subtracting the two convolution formulas with the same summation variables;
   the difference acts on the installed tower kernel at the shifted inner
   input point, with no reindexing of the first displacement.
3. The publication proof is therefore not blocked at `Rack.legs`: the local
   tower cross-kernel receipt is actually generated from the wire entrywise
   `Pay` estimate. The high-level public selection uses that proved route via
   the stored horizon plan, although this audit does not audit every other
   component of the selection theorem.

## Literature search

Searched `blueprint/background` for `Wilson`, `atlas`, `Schur`, `kernel`,
`strip`, `Laurent`, and `RG`. The only matching background note was
`blueprint/background/su2-simplicity.md`, unrelated to the weighted lattice
kernel estimates. No outside theorem is required for the arguments in this
unit; the period decomposition and weighted convolution bounds are proved
directly. The inspected Lean estimates give a fully formal source proof, but
the ordinary-mathematics exposition remains a draft awaiting independent
review.

## Commands and limits

Read-only source inspection commands run in the isolated clone included:

- `rg -n "predictor_atlas|all_sandwich|cross_atlas|def install|def Atlas|def RowCost|def ColCost" Lean/YM/Pert/Bulk/Atlas.lean Lean/YM/Pert/Bulk/Crossing.lean Lean/YM/Pert/Bulk/Coin.lean` — located the atlas, installation, and predictor declarations.
- `sed -n '1,250p' Lean/YM/Pert/Bulk/Coin.lean` — read the strip-composition bounds and exact predictor hypotheses/cost.
- `sed -n '1,175p' Lean/YM/PREC/Stacks.lean` — checked `Bed`, `Towers`, `forwardC`, `Deep`, and `Horizon.Suffices` meanings.
- `sed -n '1,200p' Lean/YM/Next/FREE_KERNELS/Sprout.lean` and `sed -n '1,140p' Lean/YM/Next/FREE_KERNELS/MatrixPay.lean` — checked the strip extraction chain from weighted entries.
- `sed -n '1,155p' Lean/YM/Next/FREE_KERNELS/Cable.lean`, `sed -n '1,175p' Lean/YM/Next/FREE_KERNELS/Strands.lean`, `sed -n '1,120p' Lean/YM/Next/FREE_KERNELS/Priced.lean`, and `sed -n '1,160p' Lean/YM/Next/FREE_KERNELS/Rack.lean` — inspected the concrete `wire_budget` supplier and its public transport.
- `sed -n '1,220p' Lean/YM/Independent/ConstructionRun.lean` and `sed -n '1,115p' Lean/YM/Integration/ActualRunNativeComponentRecipe.lean` — checked the selected-run output and use of the actual stored plan.
- `rg -n "Wilson|atlas|Schur|kernel|strip|Laurent|RG" blueprint/background` — focused literature-note search.

No Lean build, manuscript build, blueprint checker, or external-source search was run for this unit. The imported Lean source revision recorded in `source/upstream.json` is `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. The reviewed declarations and paths must be rechecked against that imported source before acceptance.
