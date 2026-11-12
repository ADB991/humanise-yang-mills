# Actual reader on the small panel

- Unit: `YM-000026`, issue #26, draft status.
- Manuscript: `manuscript/existence/actual-reader-small-window-bridge.tex`.
- Imported source pin from `source/upstream.json`: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Parent canonical chapters are read-only files under `/private/tmp/ym-existence-20261111`; they were not copied or edited in this clone.
- No Lean source was changed and no Lean build was run.

## Exact mathematical scope

The outer radius is (B=\operatorname{radiusB}(x)=\lceil(\log x)^2\rceil). The reader panel radius
is the source's **natural-number quotient**

\[
 p=\operatorname{boxCharge}(x)=\left\lfloor(B+80)/20\right\rfloor,
\]

not the real quotient. The article proves the geometric inequalities for
(B\ge200):

\[
30p<11B+1-p,\quad 9p\le B,\quad B/4+p+B/50\le B/2,
\quad B/4+2p+B/25\le B,
\quad p+B/50+B/4+B/2\le B.
\]

Here `Clears` at outer B excludes the seed dome of radius `10B+B+1`.
`Translate` supplies an onto bijection of actual and cleared panel labels,
using `clearance` to prove range/liveness. It does **not** equate the curved
and identity row Gram entries. Instead the manuscript derives the source
change from the rowwise frozen cancellation, chart estimates, and a
cutoff-plus-tail estimate; derives the actual mean via the normal residual
identity and its local inverse/tail split; and derives the inverse-column
bound by an entrywise Gram perturbation followed by the finite resolvent
identity. The two distinct positive Gram gaps are retained.

The stated outputs are the actual mean error (x^{-7/8}) and the
actual-to-cleared panel inverse-column error (x^{-1/4}), for a fixed
payment multiplier R and source parameter 0<=t<=R*clearanceFare(x),
with coarse period c>=100(1+B), the stored-flag equality, and the same
pose/history across all queried centers. The mean coordinate is active
and within B/4 of the target; the inverse-column indices lie in its panel.
The exact outer-scale
price, clearance and path receipts. The later cut-head split to the full
physical covariance is expressly excluded from the theorem.

## Source correspondence

| Manuscript step | Fully qualified source declaration | Pinned path and checked mathematical role |
|---|---|---|
| Exact panel radius | `YM.AnalyticBridge.LocalGaussianLaws.Remote.boxCharge`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.stockBound` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/ChipHeal.lean`. The first is natural division `(radiusB x + 80)/20`; the second proves every sector address lies within that radius. |
| Outer radius and path cutoff | `YM.Pressure.radiusB`, `YM.Pressure.Stores.till` | `Lean/YM/Pressure/Seeds.lean`. Here `radiusB x=ceil((log x)^2)` and `till x=radiusB x/100000`. The former supplies the explicit stretched-log tail estimate; the latter truncates paths, not the direction. |
| Two-scale clearance arithmetic | `YM.AnalyticBridge.LocalGaussianLaws.Remote.Clears`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.live_test` | `ChipHeal.lean`. Clearance excludes the halo with radius `10*radiusB x + D + 1`; at `D=B` this is `11B+1`. The live test uses this dome exclusion and triangle inequality. |
| Fixed-row base difference | `YM.AnalyticBridge.LocalGaussianLaws.Lift.base_summary` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Staged.lean`. Its output is `|Rows.base - firstTerm| <= C*t*widen (till x) t tau`. The proof obtains the upper/lower chart and kernel-chart costs, applies the product-difference split for `zip`, and preserves the same `V,v` and row. |
| Nonlinear pulse versus uncut ideal | `YM.AnalyticBridge.LocalGaussianLaws.Lift.prepared`, `YM.AnalyticBridge.LocalGaussianLaws.Lift.pulse_cost`, `YM.AnalyticBridge.LocalGaussianLaws.Lift.ideal_tail`, `YM.AnalyticBridge.LocalGaussianLaws.Lift.peon` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Watch.lean`. The direction is cut at the outer comparison radius D=B by finite row dependence. Separately, the path sum is cut at `till x=B/100000`; the finite pulse cost is `A*(1+till x)*t*||a||`, while the weighted omitted-path tail is `C*||a||*exp(-sigma*till x)`. This distinction is used in the manuscript. |
| Response-size bound | `YM.AnalyticBridge.LocalGaussianLaws.Lift.carry_summary` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/TurnZero.lean`. Gives the bound on the frozen response norm by a constant times the direction norm. |
| Frozen row cancellation | `YM.AnalyticBridge.LocalGaussianLaws.Lift.rowzero` | `TurnZero.lean`. Exact pointwise identity `Flat.ideal T (doc T F v) + firstTerm T v = 0`. This is substituted before estimating the kept-row difference. |
| Source error after cancellation | `YM.AnalyticBridge.LocalGaussianLaws.Lift.accounting` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Subtotal.lean`. The selected credit is the row normalization times `(base-firstTerm)+(marked bump-flat ideal)`. `rowzero` cancels `firstTerm+flat ideal` before absolute values. `base_summary` supplies the first difference, and `prepared` restricts the direction at outer radius B while truncating paths at `till x`, using its finite pulse cost and weighted omitted-path tail; `carry_summary` supplies the frozen-response norm. Their combination proves `|credit| <= A*t*widen (till x) t tau` on receipt rows within B/2. The fixed data include one patch/tube/configuration/frozen forest/pose, outer clearance, flags, paid local price, and `AgreeNear`. |
| Normal residual and local solve | `YM.AnalyticBridge.LocalGaussianLaws.Lift.spacing`, `YM.AnalyticBridge.LocalGaussianLaws.Lift.focused` | `Subtotal.lean`. The hypotheses require the coarse side `c.val>=100*(1+radiusB x)`, the target within B/4 and the source flags equal to the posed configuration flags. `spacing` proves `offCenter(pane W Q 0)y-x=(Q*pane-I)^T x-pane^T(Qx+y)`. `focused` substitutes the exact row Gram identity `Q a+b=M^T(Ma+f')`, bounds the residual by summing at most `D=pieces P G * LocalJet.grain (span P x)` source rows, and uses the local inverse row/column sums plus the central-coordinate exponential inverse-window tail. No global operator-norm bound for the padded-window error is asserted. |
| Canonical mean normal identities | equations `eq:mean-error-identity`, `eq:mean-point`, `eq:mean-remote-final` | Parent `/private/tmp/ym-existence-20261111/manuscript/existence/local-mean.tex`, section `sec:local-mean`, SHA256 `f32876889ca48172b9399bafc1ff983ae0eee0750d4d7dd4329c2211ce60f1b5`. Reused for its exact (m-v=E^*v-P^*(Av+\ell)) algebra and fixed-window bound; the present article does not substitute p for the outer B in the source matrices/cutoff. |
| Mean payment | `YM.AnalyticBridge.LocalGaussianLaws.Lift.mean_shot`, `YM.AnalyticBridge.LocalGaussianLaws.Lift.pay_mean`, `YM.AnalyticBridge.LocalGaussianLaws.Lift.plume` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Cues.lean`. `pay_mean` proves the displayed allowance after setting (t=R\,\text{clearanceFare}(x)). The actual price is `16*(2*(radiusB x+1)+1)^5*card PlaqAxes*temp x`; `temp_cost` at (1/32), `plume`, the polynomial prefactors, and the exponential tails yield (x^{-7/8}). `mean_shot` turns this estimate into the actual local mean statement with the same agreement and paid pose. |
| Per-entry row perturbation | `YM.AnalyticBridge.LocalGaussianLaws.Remote.stamps`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.local_gram` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Movers.lean`. With `wiggle=A*(1+till x)*t`, `stamps` gives actual-vs-identity row error at most wiggle and identity row size at most A. `local_gram` splits products as `a_i(a_j-b_j)+(a_i-b_i)b_j` and sums at most `pieces * LocalJet.grain(span)` contributing rows, producing `matter = D*((A+wiggle)*wiggle+wiggle*A)`. Thus Gram entries are controlled, not identified. |
| Finite inverse comparison | `YM.AnalyticBridge.LocalGaussianLaws.Remote.switches`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.chip_repair` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/ChipHeal.lean`. `switches` is the ordinary identity (X^{-1}-Y^{-1}=X^{-1}(Y-X)Y^{-1}) on matched principal panels, with the square of the panel-count bound and both spectral gaps. `chip_repair` packages this as `clockChip` and uses `Translate` only to reindex. |
| Cleared panel bijection | `YM.AnalyticBridge.LocalGaussianLaws.Remote.staff_W`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.Translate`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.clearance`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.staff_inj` | `ChipHeal.lean`. `staff_W` preserves membership; `clearance` proves a bare panel address lies in the official-map range from outer clearance; injectivity plus this range proof makes `Translate` onto. No entrywise Gram equality is used. |
| Covariance charge/exponent | `YM.AnalyticBridge.LocalGaussianLaws.Remote.census`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.fares`, `YM.AnalyticBridge.LocalGaussianLaws.Remote.matter` | `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/NearDelay.lean` and `Movers.lean`. `census` is panel-count squared times both inverse-gap factors times the row perturbation. `fares` bounds it by a polynomial (Z(x)\le x^{1/8}) times temperature (\vartheta(x)\le x^{-1/2+1/8}), giving (x^{-1/4}). The fixed-multiplier transfer `matter(A,Rt)\le matter(RA,t)` is proved as `YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.alter` in `Venue/Chips.lean`. |
| Actual reader consumer | `YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.aperture`, `YM.PhysicalNext.InteractingRank.StrongScope.sight`, `YM.PhysicalNext.InteractingRank.scopes` | `Lean/YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Venue/Chips.lean` and `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Focusing.lean`. `aperture` relocates a target to an outer-clear pose and consumes mean plus chip-repair receipts, returning the (x^{-7/8}) mean and (x^{-1/4}) actual/bare panel covariance-column bounds. `scopes` then applies its separate palette/covariance sandwich; this chapter does not claim that final split. |
| Pose at shifted centers | `YM.PhysicalNext.InteractingRank.Pose.center` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Pose.lean`. It supplies clear, agreement and payment only for centers satisfying the original `separation + walls <= W` margin. This precise margin is retained for every queried center. |

## Other manuscript inputs reused

- Parent `local-covariance.tex`, section `sec:local-covariance`, SHA256
  `29461555fd5eeb24f58f1a4d4ec2896fb4cb85ae60bc3c4aa03248ddc2e86218`:
  principal inverse floors, exponential inverse entries, and finite window
  tails.
- Parent `principal-comparison-jets.tex`, section
  `sec:principal-comparison-jets`, SHA256
  `ff624cbd11db727d32b9c3c50cf5540d2a048efb46e3e83b6c05c8b64dd1dded`:
  fixed-window identities; this output makes no new higher-jet claim.

The subpower bounds use the imported source's `till`, `temp_cost(1/32)`,
`plume`, and scale estimates. `R` is fixed before taking the large-x
tail; the multiplier is absorbed by the proved monotonicity
`matter(A,Rt)<=matter(RA,t)`.
The article records the elementary exponent arithmetic but does not prove
the global growth law for B or manufacture the incoming path/gap budgets.

## Commands and checks

Read-only commands run: targeted `rg -n`/`sed` inspections of the source
files in the table; reads of the three parent canonical TeX chapters; pin
read from `source/upstream.json`; `shasum -a 256` on the manuscript,
evidence and canonical files; trailing-whitespace `awk` scan (exit 0).
`python3 scripts/check_blueprint.py` was attempted and returned exit 1
because this isolated clone lacks `blueprint/units/YM-000026/unit.json`;
the bounded output contract allows only this TeX and evidence file, so no
metadata was added. No Lean build or full manuscript build was run.
Independent review is pending; this remains a draft.
