# Flat-sector approximation audit

- Unit: YM-000026, issue #26; claim and source pin are unchanged.
- Status: draft audit; mathematical and Lean-correspondence review pending.
- Scope: immediate chain from the flat entrance estimate to the quantitative cutoff comparison, plus the first irreducible per-step RG input.
- Outputs for this bounded follow-up: this file only. The finalized lattice manuscript is unchanged.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Conclusion

The rate is not obtained by merely summing a geometric tail of an already given
kernel estimate. The source first proves a one-step propagation estimate for a
neutral curvature representative of the difference of two quadratic RG
precisions. This estimate yields a recurrence for a positive weighted
coefficient cost. A separate, elementary exponential-tilt argument turns that
recurrence into a power of the RG scale ratio. A Cauchy argument then constructs
the limiting kernel.

The scale-recursion and limit arguments can be explained from explicit scalar
inequalities. The first genuinely RG-specific step is the private `to_here` helper in
`Lean/YM/RG08/Flat/World.lean`, which applies the fully qualified theorem
`YM.RG08.Flat.toward` in `Lean/YM/RG08/Packets/FlatStep.lean`. Its hypotheses
include exact stationarity and quadratic-floor data, atlas bounds on input
kernels, an exact tower identity, and neutrality/travel conditions. Its
conclusion propagates a curvature representative and its folded cost through a
Schur-complement step. I did not prove that mathematical lemma independently.
It is the smallest next source declaration to assign for a detailed
mathematical proof. A separate scalar proposition is supplied in
[`manuscript/existence/flat-estimate.tex`](../../../manuscript/existence/flat-estimate.tex),
labels `prop:ex-lattice-flat-rate` and `rem:ex-lattice-flat-rate-scope`. It proves
only the recurrence-to-power-rate implication. The full flat-sector estimate
remains open until the untranslated RG step is proved and its hypotheses are
verified on the selected construction data.

## Exact local chain

All declarations below are from the pinned source revision. Paths are relative
to `Lean/`.

### 1. Entrance reshapes one schedule, then returns to the original RG data

`YM.RG08.Flat.entrance_gate` (`YM/RG08/Flat/Entrance.lean`) starts with a simple
gauge group, kernel choices, a supply sheet, and equality of its kernel with
the selected kernel. It obtains a retained linear plan, changes the sheet's
stage clips by positive factors, and applies that plan. For an arbitrary
compatible consumer level sequence and length floor, it then sets
`b := shadow a γ HC.fit` and invokes `YM.RG08.Flat.spacing_choice` on `b`.
From the returned separation schedule and a sufficient horizon, it invokes
`YM.RG08.Flat.supplies` and transports the result back to the original
horizon using `YM.RG08.Flat.same_shadow`.

The shadow is defined in `YM.RG08.Flat.shadow`
(`YM/RG08/Flat/Shadow.lean`). It changes the `Stage.clip` factorization while
preserving the schedule, RG levels, block lengths, couplings, and quadratic
precision data. `YM.RG08.Flat.same_shadow` proves equality of the evaluated
flat kernels, conditional on sufficient-horizon hypotheses on both schedules.
It does not identify other higher-order or auxiliary data built from the two
histories.

`YM.RG08.Flat.spacing_choice` (`YM/RG08/Flat/Length.lean`) supplies a
`Spacing` record with width
`min(1,min(P.α j,P.α(j+1)))`, exponent `θ=1/2`, and age function
`1+Lambda(a)` (where `Lambda=2+log(hatBeta)`). Its numerical inputs are:

- length floors at least the ceiling of the explicit entrance cost
  `2/curve + before(j,j)^2 + before(j,j-1)^2`;
- a delay bound `P.Ω(J_i) ≤ log(hatBeta_i)` for all `i` after the supplied
  threshold;
- simplicity, used for the positive RG slope that bounds the RG age by the
  logarithmic coupling.

The source proof of this helper is elementary: the fit condition makes adjacent
`J_i` indices either equal or consecutive; the chosen entrance cost pays both
the contraction quote and width-crossing inequalities, while the delay and
coupling slope give the polynomial age cap. It is a finite numerical estimate,
not the cutoff comparison itself.

### 2. RowCost is an absolute, exponentially weighted summability bound

`YM.Pert.Bulk.RowCost` is defined in `YM/Pert/Bulk/Atlas.lean`. For a kernel
`K` between cover-markets, a side length `L`, width `σ`, and cost `p`, its
meaning is
\[
 \forall u,j,\qquad
 \sum_{y\in\mathrm{Cover}}
 \operatorname{ofReal}\!\left(
     |K(u,(y,j))|\,e^{\sigma\,\delta_L(u_{\rm pos},y)}
 \right)\leq \operatorname{ofReal}(p).
\]
Here `δ_L(x,y)=sep(x,L.val\,y)/L.val`, where `sep` is the Laurent-size
distance on the full cover. It is a rescaled cover distance, not finite-torus
distance. Thus it controls
absolute summability of every row, with an exponential spatial weight; it is
stronger than pointwise kernel convergence. The associated `Ticket` bound has
the same weighted absolute-sum form. `Flat.output` in
`YM/RG08.Flat.Curl` contracts a packet with two fixed coboundary kernels;
`Flat.sigil_row` turns a `Folded` packet bound into `RowCost` of this output.

### 3. One RG step propagates the curvature representative

`YM.RG08.Flat.FlatRep` in `YM/RG08/Flat/World.lean` contains four conditions
on a packet representing the cutoff difference at a level: `Folded` weighted
absolute summability over all packet coordinates, neutrality (the packet
coefficient sum vanishes), `town 1` invariance under the simultaneous unit shift, and a `Sigil`
identity saying its exterior-derivative contraction agrees with the difference
of the two quadratic precisions on every torus in the period family.

The private `to_here` helper transports a `FlatRep` from level `i+1` to level
`i`. Its conclusion is a pushed packet, with new folded cost multiplied by the
source coefficient `quote(a,P,i,u)`. Its proof invokes
`YM.RG08.Flat.toward` with, among other data:

- the two histories' exact `Diagonal` identities and `Floor` bounds;
- order-two `Atlas` bounds and `city` conditions for the two curvature kernels;
- exact matching of each history's one-step tower with the destination
  quadratic update;
- neutrality, `town 1`, folded-cost, and travel properties of the previous
  packet; and
- the previous level's `Sigil` identity.

The output of `toward` preserves neutrality and `town 1`, multiplies the
folded cost by the exact coefficient
`neutralCoin(L, Faces, Faces, τ, q, p) = |Faces| q (|Faces|(2/τ)p)/L`,
and proves the next `Sigil` identity. The `Sigil` step uses a mixed Schur
identity (`YM.RG08.Flat.poised`) and the exact `Diagonal` hypotheses. The proof of the folded bound uses the
source-specific `push_null` estimate. These are substantive RG statements;
they cannot be replaced by the numerical spacing estimate.

### 4. World.overlap solves a discrete weighted recurrence

The private helper `existsRows` in `YM/RG08/Flat/World.lean` starts from an
endpoint packet constructed by `Flat.at_end`. That endpoint packet is the
difference between the two saddle kernels at the top cutoff. Its cost is the
top allowance. Working downward one stage at a time, it applies `to_here`.
The explicit scalar cost majorant is
\[
 f_i=C_{\rm top}\,W_i^{-1},\qquad
 W_i=\exp\!\bigl(\theta(t_{\rm top}-t_i)\bigr),
\]
where `t_i` is cumulative logarithmic RG scale. Since
`W_i^{-1}=W_{i+1}^{-1}\exp(-\theta(t_{i+1}-t_i))`, the propagated packet cost
is bounded by the next-stage cost times
`drop_i = exp(-θ(t_{i+1}-t_i))`, plus a top-only source. The theorem
`YM.RG08.Flat.World.overlap` combines this recurrence with the paid-quote,
block-width, and top-cost receipts in its `Funding` hypothesis. It applies
`YM.RG08.Rate.Stair.fade_solve` to obtain constants `A≥0`, integer `d`, and
`c>0` such that the folded cost at level `i` is at most
\[
 A\,\bigl(2+Z+|t_i-t_k|\bigr)^d
   \left(\frac{a_{\rm top}}{a_i}\right)^c.
\]
This is the geometric/decay part of the argument, but only after the
one-step packet propagation and all funding receipts have been established.

### 5. The recurrence-to-rate lemma is separately proved

The source uses `YM.RG08.Rate.Stair.fade_solve`
(`YM/RG08/Rate/Ascent.lean`). The new manuscript proposition is a finite-interval
variant, proved in ordinary mathematical language; it is not a translation of
the source theorem statement or a proof of the RG estimate that supplies the
recurrence.

For the source application, set the finite interval endpoint to the top RG
level, take `s` to be the reporting scale `t_k`, and let `Z` be the nonnegative
schedule offset. The source age is exactly `2+Z+|t_i-t_k|`. The scalar
proposition uses `R+Z+|t_i-t_k|` with fixed
`R=max(2,2(d+1)/(theta-mu))`, so its constants do not depend on the reporting
scale or the schedule offset. The source's polynomial bound in its smaller age
therefore implies the proposition's bound in the larger age, provided the
forcing and endpoint coefficient are uniform across schedules. The `Spacing`
age-cap and `Funding.top_cap` fields are the source receipts used to obtain
that uniformity in `World.overlap`. Matching the source's exact recurrence,
forcing and endpoint to the proposition remains a correspondence step; it does
not discharge the per-step packet estimate.

The scalar proof tilts by `exp(mu*(T-t_i))`, with
`mu=min(c_0,theta/2)`. The resulting contraction is
`exp(-(theta-mu)*Delta_i)`. Polynomial age growth is absorbed by choosing an
additive age offset at least `2(d+1)/(theta-mu)`, leaving a uniform geometric
factor `exp(-(theta-mu)*log(3)/2)<1`. Backward induction sums the forcing
with constant `A/(1-q)`. Undoing the tilt yields the factor
`exp(-mu*(T-t_i))=(a_top/a_i)^mu`. The full proof, including the finite
terminal case and zero-cost case, is in the manuscript proposition.

### 6. Kernel limit and conversion to the stated estimate

`YM.RG08.Flat.Mesh.meshed` (`YM/RG08/Flat/Mesh.lean`) instantiates
`World.overlap` on a road indexed by reporting scale, lower level, and finer
cutoff. In addition to a sufficient horizon and `Spacing`, its hypothesis
requires exact equality between each actual tower's transfer matrix and the
designated destination update. The theorem turns each `FlatRep` into a `Sigil`
for the difference of the two cutoffs' quadratic precisions, applies `Flat.resolve`
to identify the output-kernel difference, and then applies `Flat.sigil_row`.
This yields the weighted RowCost Cauchy bound for two cutoffs.

`YM.RG08.Flat.Mesh.supplies` invokes
`YM.RG08.Packets.solvent` (`YM/RG08/Packets/Limit.lean`). That completeness
lemma has explicit hypotheses: a fixed reporting level, nonnegative spatial
expense, a cutoff difference bound tending to zero, nonnegative error bills,
and an eventual absolute-cost bound for one cutoff. It proves pointwise
convergence to a kernel, retains the error ticket relative to the limit, and
passes the cutoff cost bound to the limit. The proof is the Cauchy criterion in
the complete target followed by Fatou/finite-sum lower semicontinuity for the
weighted absolute costs. This part is not an additional RG estimate.

`Mesh.supplies` gives a separate limit kernel for each reporting clock label
`k`; uniqueness of pointwise limits proves they agree. It then multiplies the
generic kernel cost by the fixed convolution constant from `Flat.sigil_row`.
This yields the public `Flat.Quorum` fields: frame bound, cutoff convergence,
and a cutoff-to-limit RowCost power estimate. The RowCost power estimate is
not itself a theorem about the public Wilson measure or its smeared moments.

## Smallest next mathematical task

The next task should prove or independently review
`YM.RG08.Flat.toward` (`Lean/YM/RG08/Packets/FlatStep.lean`) as one coherent
one-step lemma. Required work:

1. Read and state the meanings of `Diagonal`, `Floor`, `Atlas`, `city`,
   `Matches`, `neutral`, `town`, `Folded`, `travels`, `push_null`, and
   `town_hall` used by its hypotheses and proof.
2. Derive the propagated `Sigil` equality from the exact mixed Schur identity
   `YM.RG08.Flat.poised` and the inherited precision identities.
3. Reproduce the `push_null` weighted coefficient estimate from the stated
   atlas, floor, and geometry bounds, checking the constants and exponent in
   `neutralCoin` and the `Folded` bound.
4. Explain why the resulting neutral packet remains within the hypotheses of
   the next scale step.

Do not expand the assignment to all higher-order flat kernels or the Wilson
observable bridge: the local source explicitly limits this chain to the
order-zero unmasked quadratic precision. Those additional components are
separate requirements for applying the estimate to the full continuum theorem.

## Source reads and commands

Targeted reads made for this audit:

```text
sed -n '1,220p' Lean/YM/RG08/Flat/Entrance.lean
sed -n '1,260p' Lean/YM/RG08/Flat/Shadow.lean
sed -n '1,180p' Lean/YM/RG08/Flat/Mesh.lean
sed -n '1,180p' Lean/YM/RG08/Flat/Length.lean
sed -n '1,230p' Lean/YM/RG08/Flat/World.lean
sed -n '1,160p' Lean/YM/RG08/Packets/FlatStep.lean
sed -n '1,160p' Lean/YM/RG08/Flat/Curl.lean
sed -n '1,180p' Lean/YM/RG08/Packets/Limit.lean
sed -n '1,180p' Lean/YM/RG08/Rate/Stair.lean
sed -n '1,175p' Lean/YM/RG08/Rate/Ascent.lean
sed -n '1,100p' Lean/YM/Pert/Bulk/Atlas.lean
sed -n '1,90p' Lean/YM/Pert/Bulk/Stacks.lean
sed -n '1,120p' Lean/YM/Pert/Bulk/Sites.lean
sed -n '1,130p' Lean/YM/RG08/Packets/Lines.lean
sed -n '1,90p' Lean/YM/RG08/Packets/Torus.lean
sed -n '1,42p' Lean/YM/Pert/Bulk/NullPair.lean
rg -n 'RowCost|retained_support|fade_solve|solvent|FlatRep|toward' Lean/YM/RG08 Lean/YM/Pert/Bulk
```

No Lean build, theorem replay, full-tree read, or LaTeX build was run. The
mathematical recurrence lemma in the new manuscript file is a newly organized
proof of the scalar rate step; it is not a proof of `Flat.toward` or a review of
its source proof. `python3 scripts/check_blueprint.py` was attempted and failed
because this bounded scope does not include the unit metadata file required by
the checker. `git diff --check` passed.
