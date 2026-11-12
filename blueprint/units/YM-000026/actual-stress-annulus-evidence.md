# Actual stress annulus: source and proof audit

- Unit/claim: YM-000026 / issue #26, same live claim and source pin.
- Status: draft, with independent review requested; not a complete proof of the global theorem.
- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Session: `hairer-codex-existence-lattice-20261111`.
- Outputs: `manuscript/existence/actual-stress-annulus.tex`, labels
  `sec:ex-lattice-actual-stress-annulus`,
  `def:ex-lattice-shell-receipt`,
  `lem:ex-lattice-annulus-annihilation`,
  `prop:ex-lattice-annular-field`.

## Exact source route and same-history binding

The inspected public route is `YM.PhysicalNext.Repeat.Legato.Run.extractible17`
in `Lean/YM/RG17/Joint.lean`. It destructures `R.bought`, takes
`C := R.family`, builds `Ribbons.Created C` from the run's stored history, and
constructs `Acme.Aroma C` on that same family as
`⟨Ribbons.laurelE C ..., tabs, Ribbons.fugacious C ...⟩`. It subsequently calls
`Acme.readyA` on the received table/hierarchy and the current free comparison.
`YM.MergeProof.Acme.readyA` in `Lean/YM/MergeProof/Emanate.lean` calls
`produce_current`, obtains the actual conserved stress `J.val`, and invokes
`shells_law ... J.val ... budget`. The output Ward laws are attached to the
same returned first extension. This rules out substituting a stress from a
nearby alternate constructor.

## Exact producer crosswalk

| Mathematical step in the draft | Fully qualified declaration(s) | Path | Source content inspected |
|---|---|---|---|
| Uniform collar correction | `YM.MergeProof.Ribbons.ShellNode`, `YM.MergeProof.Ribbons.sales`, `YM.MergeProof.Ribbons.bricks` | `YM/MergeProof/North/Brim.lean`, `North/Siroco.lean` | For every fixed collar grid point, obtain a bounded grade-D label sequence and a late volume/period set. The late set may depend on the point; the coefficient and root-test bounds do not. At a fixed annulus scale only finitely many stencil points are used, so their late sets can be intersected before taking one compact subnet for the correction labels. `sales` writes the correction as the two-component insertion minus the output label, invokes `mutation`, and converts its quota through `quota_stop`; `bricks` supplies whole-collar geometry and late-filter choice. |
| Price and scale economics | `YM.MergeProof.Ribbons.pricey`, `YM.MergeProof.Ribbons.lightness`, `YM.MergeProof.Ribbons.laurelE`, `YM.MergeProof.Ribbons.fugacious`, `YM.MergeProof.Ribbons.Economics` | `YM/MergeProof/North/Burrough.lean`, `North/Economist.lean` | With `scale(i)=log(a_i^{-1})`, `laurelE` chooses `t=1+1/(64(d+12))` and a mesh subsequence satisfying `scale(j_m)/scale(m)→t` (not `a_{j_m}/a_m→t`). It combines `pricey`, `lightness`, opened Tabs, reference thresholds, and room to call `bricks`; `fees` is uniform in labels, grade relation, open level `p_0` and level `k`, and extraction order. `fugacious` gives exponent `-1` for `fuga(i+1)`. |
| Scale radius and two-channel payment definitions | `YM.MergeProof.Ribbons.fuga`, `YM.MergeProof.Ribbons.pitts`, `YM.MergeProof.Ribbons.ventola`, `YM.MergeProof.Ribbons.mutation`, `YM.MergeProof.Ribbons.fundR`, `YM.MergeProof.Ribbons.paid_new`, `YM.MergeProof.Ribbons.paid_scale`, `YM.MergeProof.Accent.stakes` | `YM/MergeProof/North/Vert.lean`, `North/Burrough.lean`, `North/Brick.lean`, `North/Sultan.lean`, `YM/MergeProof/Strudel.lean` | `fuga(i)=128 B_i^2 a_i` (so `r_m=fuga(m+1)`); `pitts(i)=exp(scale(i)/32)` and diverges because `scale(i)→∞`; `ventola` is the product of the two Boolean-channel picket budgets; `stakes(p_0,k)=exp((a_{p_0}/a_k)^4 treasury_k+5)`. The two-channel construction consumes the local cost, run/throw, room, opened-count, chamber, root, and payment bounds. This is a source map, not a proof of these upstream producer estimates. |
| Coefficient quota and root-test normalization | `YM.Next.UVStress.quota`, `YM.Next.UVStress.quota_stop`, `YM.Cells.Tiling.rootTest` | `YM/Next/UV_STRESS/Least.lean`, `YM/Cells/Tiling.lean` | The quota comparison gives a fixed factor from normalized terminal quota to coefficient norm; the root test is the normalized positive root of the finite Gibbs moment of the translated/reflected/conjugated cell product. |
| Finite-stencil cancellation | `YM.MergeProof.Acme.stencil_pay` | `YM/MergeProof/West/Stencil.lean` | Approximate each rescaled insertion by a common grade-D tester with error bounded by the shell tolerance times a per-watch cost; sum against coefficients and use exact annihilation. |
| Derivative chain | `YM.MergeProof.Acme.district`, `YM.MergeProof.Acme.pelts`, `YM.MergeProof.Acme.mountain`, `YM.MergeProof.Ribbons.beneath` | `YM/MergeProof/West/Puppy.lean`, `West/Peak.lean` | `Puppy.mountain` iterates the derivative-plan identity; `Peak.beneath` gives the quantitative decay from `Note.mills` when the raised tag plus two plus spectator-cloud degree is less than the scale exponent. The manuscript states the resulting separated-point majorant explicitly as an input, rather than claiming smoothness alone proves it. Its moving stress tag has degree 4; its cloud degree includes the fixed input insertion and spectators. In physical coordinates differentiation raises the tag without a scale factor; the factor `a_{j_m}` appears on the lattice chord. |
| Finite-node derivative interpolation | `YM.MergeProof.Acme.angel`, `YM.MergeProof.Acme.arctic`, `YM.MergeProof.Acme.mitten`, `YM.MergeProof.Acme.rink`, `YM.MergeProof.Acme.reed` | `YM/MergeProof/West/Arch.lean`, `West/Geo.lean` | The manuscript derives the real recurrence `A_0=1`, `A_{q+1}=1+4P A_q` by pairing ordered nodes and applying the mean-value theorem, then handles complex values by real/imaginary parts. `angel` supplies the same finite-stencil result; `arctic` chooses nonzero lattice-coordinate nodes and `mitten` keeps their segments in the collar. |
| Collar to annulus interpolation | `YM.MergeProof.Acme.mars`, `YM.MergeProof.Acme.arena`, `YM.MergeProof.Acme.read_grid` | `YM/MergeProof/West/Fur.lean`, `West/Stencil.lean` | A nested induction over the axes not yet discretized chooses nonzero shifted grid nodes only at the final stage; the total displacement is at most `4r/128=r/32`. The quantitative top derivative bound is `C a_{j_m}^{q_*} r_m^{-(q_a+q_*+2+c_a)}`, whose logarithmic rate is negative by the displayed scale inequality. This transfers the grid bound to the annulus. `arena` is the wider radius interval. |
| Generic chamber and shrinking bump | `YM.MergeProof.Acme.cloudW`, `YM.MergeProof.Acme.capB`, `YM.MergeProof.Acme.stretch_window`, `YM.MergeProof.Acme.within_cap` | `YM/MergeProof/West/Fur.lean`, `West/Blanca.lean` | `cloudW` applies only when every coordinate is nonzero. A nested induction over the axes not yet discretized chooses nonzero shifted nodes only at the final stage; intermediate nodes need not be generic. The total displacement is at most `4r/128=r/32`. The compactly supported bump is a valid window after shrinking below separation from other insertions. |
| Annihilator-to-flux identity | `YM.MergeProof.Acme.zone`, `YM.MergeProof.Acme.tenet` | `YM/MergeProof/West/Ozone.lean`, `West/Blanca.lean` | `zone` turns finite tester annihilation into uniform vanishing of the scaled insertion on the shrinking annulus. `tenet` rescales the flux integral, sums finitely many components, and sends the fixed flux combination to zero. |
| Finite-dimensional representation and extension | `YM.MergeProof.Acme.obtainable`, `YM.MergeProof.Acme.annular_fieldA` | `YM/MergeProof/West/Bravo.lean` | The annihilator criterion puts each finite flux vector in the range of the finite tester map. `observes` gives a finite faithful watch set, which fixes one field for every additional watch; continuity and dense grid configurations extend the identity. |
| Ward maps | `YM.MergeProof.Acme.map_shell`, `YM.MergeProof.Acme.shells_law` | `YM/MergeProof/West/Orange.lean` | Flux is evaluated with the Killing field centered at the distinguished point, `U(y-x_0)`. `Bravo.raised` translates the configuration to a watch rooted at zero; `moves_flux` and `slide_disc` restore its center. Constant Killing fields give translation maps with `D=d+1`; orbital skew fields give angular maps with `D=d`. `front_eval` identifies these maps with the flux rows. The angular map is complex-linear in the field and real-linear in the skew matrix. |
| Public consequence | `YM.MergeProof.Acme.readyA`, `YM.PhysicalNext.Repeat.Legato.Run.extractible17` | `YM/MergeProof/Emanate.lean`, `YM/RG17/Joint.lean` | `readyA` calls `shells_law` on the stress it has just produced; public selected-run extraction passes its same-family Aroma into this call. |

## Proof correspondence and limitations

The numeric gates used in `bricks` were read literally. Put
`lambda_i=scale(i)=log(a_i^{-1})`; the diverging exponential is in this
logarithmic scale, not in the vanishing physical spacing. With
`Z_i=ventola(C.path.levels,j_i,i+1,δ,φ,η,δ_{i+1},A_i)`,
`X_i=exp(sqrt(hatBeta_{i+1}))`,
`e_i=32(1+columns_i) a_{i+1}^D X_i/Z_i`, and
`c_i=exp(lambda_i/32)`, `pricey` supplies eventually
`Z_i>0`,
`march(c_i,η,k,i)≤δ_i Z_i/(16 X_i)`, and
`32(1+columns_i)c_i ||alto(k,D)||(e_i/gainChart(i,k))≤fly(D,k)/2`.
Its logarithmic condition is
`((d+12)(1-t)>-1/32)`.  At each fixed opened reference level `p_0` and level `k`, the remaining stake is
`exp((a_{p_0}/a_k)^4 treasury_k+5)`, hence constant as `i→∞` while `c_i→∞`.
The separate `lightness` output is eventually
`32 fuga(i+1)≤a_{p_0}` and
`a_{i+1}(B_{i+1}^2+1+2*1024*B_{i+1}^2)≤a_{p_0}`.
`bricks` uses the first gate for collar room and the second to fit the finite
stencil into the coarse chamber.  This exact arithmetic is in the manuscript;
it is not a proof of the sublemmas feeding these receipts.

The manuscript gives the measure-theoretic shrinking argument explicitly,
conditional on the shell-node input and the displayed separated-point
majorants from `Peak.beneath`. At each fixed stencil point the bounded
counterterm sequence is extracted once in the common fused filter, using
finite-dimensional compactness; that one limit is used for every watch in
the finite family. The cost-limit identities then approximate all tester
values on the same filter refinement, so their weighted sum cancels. No
watch-dependent subsequences are used.

For the bump with unit-scale profile `capB`, the source support of its
derivative lies between radii `1/2` and `1`; after dilation by `r_m`, it lies
inside the source annulus `r_m/4<|x|<2r_m`. The four-dimensional Jacobian,
one derivative of the bump, and homogeneity degree `p` give the factor
`r_m^(3+p)`. The grade relation in the two source propositions implies
`h=3+p`, so the shell estimate has exactly the required scaling. The
componentwise integral has an integrable compactly supported weight; uniform
annulus decay therefore makes it tend to zero. Conservation/window-change
identifies it with a fixed flux combination. This proves the exact
annihilator statement, not merely asymptotic flux decay.

The finite-dimensional range argument is expanded in ordinary linear
algebra: every functional annihilating the tester range also annihilates the
flux vector, hence the flux vector belongs to that range. The finite faithful
tester set ensures that the representative is independent of the added
watch. The continuity extension is the source's `frequently_eq` argument
using grid density and continuous flux/disc maps.

The shell economics are recorded at the level of their actual output and
composition. The manuscript does not prove the shell-node output from those
inputs. In particular, it does not rederive the primitive analytic estimates
feeding `pricey`, `lightness`, the paid local-cost receipt, the cofinal
run/throw receipt, or the two-channel construction. In particular,
`YM.MergeProof.Ribbons.pricey` imports `YM.MergeProof.Ribbons.quilled`,
`YM.MergeProof.Ribbons.mintN`, `YM.MergeProof.Ribbons.fuchsia`, and
`YM.MergeProof.Ribbons.seeing`; `lightness` imports `fuchsia` and
`briar`. The proof of the paid local-cost and run/throw records is not
rederived here. Those are genuine upstream quantitative proof obligations if the
monograph is to discharge the whole source chain here. This draft does not
claim their names prove the estimates. The listed declarations were read,
but their transitive producer proofs were not exhaustively expanded in this
bounded unit. The annular annihilator, finite-dimensional range argument, and
root-centered translation/rotation conversion are proved conditional on the
explicit shell-node statement; the public endpoint chain is a correspondence,
not a completed proof that this statement is available.

## Literature search

The shared `blueprint/background/` contains only the SU(2)-simplicity note and
the directory instructions; no accepted Ward/stress-annulus result applies
to this finite-volume insertion and its project-specific scale budgets. The
local bibliography likewise has no Ward/stress entry. Accordingly, this
unit invokes no external theorem: the compactly supported rescaling, finite
annihilator linear algebra, and four-coordinate interpolation are proved
directly. No new literature citation is substituted for the shell estimates.

## Commands and reads performed

Targeted commands in the isolated clone:

```text
rg -n 'laurelE|fugacious|Ribbons\.sales|ShellNode|bricks|pricey|lightness|theorem zone|annular_fieldA|shells_law|extractible17' Lean/YM
sed -n '65,90p' Lean/YM/RG17/Joint.lean
cat Lean/YM/MergeProof/North/Brim.lean
cat Lean/YM/MergeProof/North/Economist.lean
sed -n '1,180p' Lean/YM/MergeProof/North/Siroco.lean
sed -n '1,125p' Lean/YM/MergeProof/North/Burrough.lean
sed -n '1,160p' Lean/YM/MergeProof/North/Brick.lean
sed -n '25,90p' Lean/YM/MergeProof/North/Welch.lean
sed -n '25,90p' Lean/YM/MergeProof/North/Wicker.lean
sed -n '25,100p' Lean/YM/MergeProof/North/Bonus.lean
sed -n '1,105p' Lean/YM/MergeProof/West/Stencil.lean
sed -n '1,90p' Lean/YM/MergeProof/West/Arch.lean
sed -n '1,110p' Lean/YM/MergeProof/West/Geo.lean
cat Lean/YM/MergeProof/West/Puppy.lean
cat Lean/YM/MergeProof/West/Fur.lean
sed -n '1,180p' Lean/YM/MergeProof/West/Ozone.lean
sed -n '1,240p' Lean/YM/MergeProof/West/Blanca.lean
cat Lean/YM/MergeProof/West/Bravo.lean
cat Lean/YM/MergeProof/West/Orange.lean
cat Lean/YM/MergeProof/Emanate.lean
cat blueprint/background/README.md
rg -ni 'ward|stress|noether|dilation|annulus' manuscript/references.bib
rg -n -C 4 'ShellNode|laurelE|fugacious|tenet|annular_fieldA|shells_law|extractible17' /private/tmp/ym-existence-20261111/blueprint/units/YM-000026/reviews/closure-audit.md
sed -n '225,295p' /private/tmp/ym-new-rank-interface.md
```

`git diff --check` passed. `python3 scripts/check_blueprint.py` was attempted
but cannot run in this isolated partial clone because the parent-owned
`blueprint/units/YM-000026/unit.json` is absent. No Lean build or TeX build was
run; parent owns integration and metadata.
