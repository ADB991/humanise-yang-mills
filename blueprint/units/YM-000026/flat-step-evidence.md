# Flat-sector one-step propagation: source audit

- Unit: YM-000026, issue #26; same claim and source pin.
- Status: draft; independent mathematical and source-correspondence reviews pending.
- Output: [`manuscript/existence/flat-step.tex`](../../../manuscript/existence/flat-step.tex), labels `lem:ex-lattice-flat-step-center`, `lem:ex-lattice-flat-step-convolution`, `prop:ex-lattice-flat-step`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Session: `hairer-codex-existence-lattice-20261111`.

## Mathematical content and status

The manuscript reorganizes the local proof of `YM.RG08.Flat.toward` as two
mathematical arguments: a neutral weighted-kernel convolution estimate and an
exact quadratic representative identity. It states the finite-label weighted
row/column and first-difference costs explicitly, including the powers
`L^{-2}`, `L^2`, and `L^{-3}`. The scalar bound used in centering is proved in
the text. The product bound is obtained by the triangle inequality for cover
expense, Tonelli/Fubini on nonnegative absolute majorants, and multiplication
of the row/column constants. Its coefficient is
`m^2 q (2/tau)p/L`, where `m` is the common finite face-label cardinality.

The zero-sum replacement of the outgoing kernel by its centered difference is
proved from neutrality. The separate neutrality and simultaneous-translation
invariance conclusions use the source's travel and covariance assumptions;
their proofs are given at the level of cover sums and changes of variables.
The matrix identity is derived in the manuscript: it proves the mixed Schur
identity by matrix multiplication from the two primal/dual input relations,
and proves each inherited carrier identity from the floor equalities and
diagonal tower identity.

This write-up is newly reorganized prose; it is not a literal translation of
Lean helper structure. The independent reviewer has been asked to check the cover-path estimate,
label sums, and finite-period reindexing. No external literature
theorem is invoked: the arguments are elementary weighted-sum and
finite-dimensional matrix calculations, and the local source proof was directly
inspected.

## Exact source crosswalk

All declarations below were inspected at the pinned source revision; paths are
relative to `Lean/`.

| Manuscript item | Exact declaration(s) | Source path | Role |
| --- | --- | --- | --- |
| Exact mixed precision update | `YM.RG08.Flat.poised` | `YM/RG08/Packets/FlatStep.lean` | Derives the difference identity from the two primal and dual `Inputs` identities and symmetry. |
| One-step theorem being explained | `YM.RG08.Flat.toward` | `YM/RG08/Packets/FlatStep.lean` | Supplies the two diagonal tower records, four floors, two order-two atlases, city invariance, matching, neutrality, stationarity, folded bound, travel, and old representative. |
| Schur input identities | `YM.Precision.Inputs` | `YM/PREC/TreeMatch.lean` | `primal: K(H) W = mean^T K(H')`; `dual: mean W = 1 - penalty^{-1} K(H')`. |
| Floor data | `YM.Precision.Floor` | `YM/PREC/Stacks.lean` | Includes symmetry, metric/diagonal agreement on `d`, and the inverse/root identities. |
| Diagonal tower data | `YM.Towers.Diagonal` | `YM/PREC/Stacks.lean` | Includes exact trial `Inputs` and `stays` identity. |
| Inherited carrier identity | `YM.Pert.Bulk.inherited_precision` | `YM/Pert/Bulk/Inherit.lean` | Proves `carrier * d_c = d_f * installed(A0)` from `Diagonal.stays` and the two `Floor.same` equalities. |
| Coefficient matching | `YM.Pert.Bulk.display`, `YM.Pert.Bulk.Matches` | `YM/Pert/Bulk/Projected.lean` | Finite display is the sum over the full cover fibre; matching is required for every cover input. |
| Rank-one pushed match | `YM.RG08.Packets.town_hall`, `YM.RG08.Packets.second_ship`, `YM.Pert.Bulk.applies_once`, `YM.RG08.Packets.matches_back` | `YM/RG08/Packets/Pushed.lean`, `YM/RG08/Packets/Torus.lean`, `YM/Pert/Bulk/Projected.lean` | Factorizes the second packet into two cover compositions; each finite display product follows by grouping a cover sum into quotient fibres. The transpose uses city covariance and the explicit quotient reindexing. |
| Push definition | `YM.RG08.Packets.push` | `YM/RG08/Packets/Mixed.lean` | The two cover sums and the product over packet legs. |
| Neutrality of push | `YM.RG08.Packets.invariant` | `YM/RG08/Packets/Swing.lean` | Uses absolute summability, travel of the outgoing kernel, and neutrality of the input packet. |
| Stationarity of push | `YM.RG08.Packets.pass_push` | `YM/RG08/Packets/Pushed.lean` | Changes variables in both cover sums and applies city covariance. |
| Centered row estimate | `YM.RG08.Packets.row_save` | `YM/RG08/Packets/Lines.lean` | Gives the per-output-label difference bound; the source row theorem then sums over output labels and includes factor `m(2/tau)p/L^3`. |
| Atlas telescoping estimate | `YM.Pert.Bulk.atlas_difference` | `YM/Pert/Bulk/Discrete.lean` | Uses a coordinate path of Laurent length and the first-difference row cost. |
| Root column estimate | `YM.Pert.Bulk.use_head2` | `YM/Pert/Bulk/UseRows.lean` | Gives `m q L^2` from the order-two column cost. |
| Weighted push bound | `YM.RG08.Packets.push_null` | `YM/RG08/Packets/Lines.lean` | Centers by neutrality and combines `row_save` with the weighted push estimate. |
| Weighted product/Fubini estimate | `YM.RG08.Packets.push_est`, `YM.RG08.Packets.revenue`, `YM.RG08.Packets.sends`, `YM.RG08.Packets.price_one` | `YM/RG08/Packets/Mixed.lean` | Proves factorization of the outgoing weighted sums, sums over the packet, then sums over the root variable. |
| Folded packet and expense | `YM.Pert.Bulk.Folded`, `YM.Pert.Bulk.expense`, `YM.Pert.Bulk.expense_sep` | `YM/Pert/Bulk/Stacks.lean` | Defines the absolute weighted packet sum and proves the rank-one geometric weight split. |
| Cover distance and scaled distance | `YM.Pert.Bulk.sep`, `YM.Pert.Bulk.delta`, `YM.Pert.Bulk.delta_fine` | `YM/Pert/Bulk/Sites.lean` | The full-cover Laurent metric and its scale triangle inequality. |

## Constants and normalization cross-check

For order two, the source Atlas bounds are row cost `q/L^2`, column cost
`q L^4/L^2=qL^2`, and first-difference row cost `p/L^3`. The manuscript
keeps each fixed input/output type in these inequalities; each finite-type
sum is counted once explicitly. The centered row coefficient per fixed output label is `(2/tau)p/L^3`; summing over output labels gives `m(2/tau)p/L^3`. The root column per fixed input label is `qL^2`; summing over input labels gives `mqL^2`. Their product is `m^2q(2/tau)p/L`, which equals `YM.RG08.Packets.neutralCoin` with both finite
label sets equal to the face labels. The pullback matrix orientation is
`M^T A N`; in `toward`, the root kernel is matched by the `Y` carrier and the
outgoing kernel by the `H` carrier. The inherited identities consequently
produce `N_A` on the left of the fine representative and `M_A` on its right,
matching the orientation of `YM.RG08.Flat.poised`.

## Remaining construction obligations

This local unit does not establish that the selected histories satisfy their
order-two Atlas bounds, exact city covariance, matching, Floor conditions, or
the travel condition. Those are hypotheses of `toward` supplied by the
construction. It also does not prove the separate scale funding, limiting
kernel, higher-order observable, or Wilson bridge arguments recorded in the
other unit audit. The manuscript's finite-label statement is the rank-one
specialization used here; no claim is made for general rank.

## Reads and commands actually performed

Targeted source reads:

```text
sed -n '1,180p' Lean/YM/Pert/Bulk/Inherit.lean
sed -n '1,110p' Lean/YM/Pert/Bulk/Projected.lean
sed -n '1,130p' Lean/YM/RG08/Packets/Torus.lean
sed -n '1,130p' Lean/YM/Lattice/Site.lean
sed -n '1,130p' Lean/YM/Lattice/Subdivision.lean
sed -n '1,70p' Lean/YM/CellFourier/Shuttle.lean
sed -n '1,85p' Lean/YM/Pert/Bulk/Crossing.lean
sed -n '1,180p' Lean/YM/RG08/Packets/FlatStep.lean
sed -n '1,240p' Lean/YM/RG08/Packets/Lines.lean
sed -n '1,220p' Lean/YM/RG08/Packets/Mixed.lean
sed -n '1,190p' Lean/YM/Pert/Bulk/Atlas.lean
sed -n '1,130p' Lean/YM/Pert/Bulk/Discrete.lean
sed -n '1,120p' Lean/YM/RG08/Packets/Swing.lean
sed -n '1,150p' Lean/YM/RG08/Packets/Pushed.lean
sed -n '1,110p' Lean/YM/RG08/Packets/Norm.lean
sed -n '1,70p' Lean/YM/Pert/Bulk/Stacks.lean
sed -n '58,68p' Lean/YM/Pert/Bulk/UseRows.lean
sed -n '55,105p' Lean/YM/PREC/Stacks.lean
sed -n '70,108p' Lean/YM/PREC/TreeMatch.lean
rg -n 'inherited_precision|def inherited|theorem inherited' Lean/YM/PCalc Lean/YM/PREC Lean/YM/RG08 Lean/YM/Pert
rg -n 'atlas_difference|def centered|def Folded|def charge|def expense|def delta|def neutral|def city|def travels|pass_push|invariant' Lean/YM/Pert Lean/YM/RG08/Packets
rg -n 'expense_sep|def sep|delta_fine|use_head2|def pass' Lean/YM/Pert/Bulk Lean/YM/RG08/Packets
rg -n 'theorem town_hall|def Matches|structure Inputs|structure Diagonal|structure Floor|theorem pass_push|def centered' Lean/YM/RG08/Packets Lean/YM/Pert/Bulk Lean/YM/PREC
```

No Lean files were edited; no Lean build, LaTeX build, or blueprint checker was
run. The article now states the fixed-label Atlas bounds, proves the centered path
estimate at fixed output type, and derives both the finite-matrix product and
transpose match by explicit quotient-fibre reindexing. Independent review is
pending. `git diff --check` passed after the revision.
