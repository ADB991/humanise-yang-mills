# Local projection and section evidence

Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Parent author session: `hairer-codex-existence-20261111`; isolated clone
`/private/tmp/ym-existence-20261111`. All prose remains draft.

## `local-splitting.tex`

Inspected full source: `Lean/YM/Push/LOCAL_SPLITTING/{Projection,Atoms,Raw,Recovery,Merge,Funding}.lean`,
`Lean/YM/Next/FOUNDATIONS/{Readout,TestBounds,LinkBounds,Split,Regular,Primary}.lean`,
`Lean/YM/Planned/ATOM_GUARDED_LAYOUT/{Assembly,Guards}.lean`,
`Lean/YM/MergeProof/{Chalet,Wallet,Visit,Coffer,Cloudlet,Orchestra,Flavor}.lean`.
Inspected meaning-determining excerpts: `RG/Masks` BudgetPoint/Regular/supBounds;
`Next/FOUNDATIONS/JetReads` JetTest/Reads/unique; `Lattice/Support` Nonwrapping;
`Work/G02` endpointGerm and linkGerm.

- Jet existence and wrapping convention: `YM.Next.Foundations.read_projection`,
  `YM.Next.Foundations.exists_read`, `YM.Push.Local.project_reads`.
- Uniform logarithmic link estimate and fixed-order tensor/readout bound:
  `YM.Next.Foundations.testLog_bound`, `test_bound`, `price_of_readout`.
  Text follows compact normalized profile argument, not a claimed uniform
  analyticity radius. Real Volterra resolvent is `YM.Work.G02.endpointGerm`.
- Exact mask correction: `YM.Push.Local.convert_atom`, `charge_atom`.
- Exact pointed product bijection: `YM.Push.Local.Slots.recover` in Recovery.
  The text gives both maps and the absolute-summability qualification.
- Price: `YM.Push.Local.packBudget`, `Slots.forceCost`, `price_meeting`,
  `price_join`, `income_of_reserved`.
- Built coefficient/density: `YM.Push.Local.Raw.build`, `build_density`,
  `build_remBound`; actual guaranteed-address version is
  `YM.Planned.GuardedAtom.Guard.mint`, `usage`, `value_mint`, `tab_mint`.
  Prose uses original predicates with guaranteed eligibility directly;
  temporary proof-only predicate erasure is suppressed as scaffolding.
- Grouped response and profile: `YM.MergeProof.coda`, `vigor`, `budgetProfile`.

Independent reviewer found three precision defects in first draft: undefined
nonwrapping convention, unqualified summation of merge costs, and literal
`qquad`/`quad` text from missing LaTeX backslashes. All repaired in hash
`de7802139e0416e3ebe5ba6f607fd8b7cea56ee3261e86005b959a5f22119c6f`;
independent reviewer confirmed the local mathematical/source pass. Raw one-step expansion remains a
separate producer obligation; this chapter does not discharge it.

## `local-sections.tex`

Inspected full `Lean/YM/Work/{G01,G03,G04,G05,G06,G07}.lean`,
`Work/G05/Pose`, `Work/G06/{Formula,Pose}`, `Work/G07/Stencil`, `Bid/Source`.
Inspected `Source/Drops` finite radial spaces, sampler, Vision and insight;
`Work/G06/Average` through the covariance proof; `Maxwell/Exterior` located
radial contraction identity. The proof of that identity is written explicitly
from Euler's identity and radial gauge, not assumed from the name.

Main chain: `YM.Work.G03.answer` (all plaquette linearizations separate via
shrinking-grid highest-degree argument, then finite kernel descent),
`YM.Work.G04.answer` (equivariant orthogonal splitting),
`YM.Source.Drops.insight` (analytic recovery), `YM.Work.G05.answer`
(shared Taylor recovery and lower slot degree), `YM.Work.G06.answer`
(finite signed averaging and actual matrix-entry polynomial realization),
`YM.Work.G07.answer` (fixed-stencil derivative and threshold powers),
`YM.Next.Foundations.priced` and `stencil_price` (finite price table/room).
Initial hash `ba31f8b09439e162ba5207c4125ec0909fa4da18518f52993e4fc05191b2804f`
is under independent review. Does not prove calendar affordability.

## Search and validation

Shared literature README consulted. This is an explicit source-specific finite
construction, with standard finite-dimensional Taylor calculus, the analytic
inverse function theorem and elementary operator power series; no extensive
external literature search was undertaken. No claim of novelty.

Commands actually run: targeted `rg`, `cat`, `sed` reads above; one attempted
read of nonexistent `Push/LOCAL_SPLITTING/Reserves.lean` failed and was replaced
by the actual Merge/Funding/Guards files. No Lean source edits or new Lean build.
The 157-page integrated PDF was built before the final precision fixes and
local-sections insertion. Five contact sheets covering pages 18–32 and 108–133
were viewed. Literal qquad/quad text in the old local-splitting render was visible
and has been repaired; corrected render remains pending. No other clipping or
layout issue was identified in this overview inspection.

Local-sections wording clarified explicit signed covariance and reversed ordered link derivative list, yielding hash `a9987194194cc332b06e0b4d58e7420ff33169663e10914ec80fe41f096397ac`; reviewer notified. Kernel reflows preserve mathematical passes at hashes `4e831e4a8fc153705abdf4a6ca47668873393bf134ec92c79583be836546e7e3` and `2a20c8dc96e80d552370b98a23457efa1cd165c430f714f6e4ddfbb5d81ade98`.

## Final local section and elementary transfer snapshots

Independent reviewer confirmed local-sections hash
`a9987194194cc332b06e0b4d58e7420ff33169663e10914ec80fe41f096397ac`.
`leaf-transfer.tex` hash `e7234ac0f3ce52aa92ebcd456ccaadfbce2f4f4c63ce2f423211cb5a311ad62a`
passed local mathematical/source review after two fixes: positive square-root
forced allowance is explicit, and the transferred singleton profile is a
separate hypothesis beside the scalar raw density identity. Sources inspected:
`MergeProof/Blush/{Parcel,Wind,Confetti,Ribbon}.lean`,
`MergeProof/North/{Partly,Angled,Shawl,Morsel}.lean`, `MergeProof/Mercury/Assure.lean`,
`MergeProof/Graces/Aspire.lean`; actual principal estimate `Partly.haze`,
complex raw assembly `Blush.bookbag`, final Graces host/coin price conversion.
Raw nonlinear expansion, tail/forced bounds and selected-history affordability
remain producer inputs to this local result.

## Differentiated insertion expansion

`leaf-expansion.tex` hash `22ed8bcc327a5892904b94332ca64dda7c8e3be57221e05c1d937686a9181e7b`
passed local mathematical/source review. Targeted full reads beneath
`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/`:
`Mallow/{Kitchen,Tonic,Fresh,Brisk,Drip}.lean`,
`Daisy/{Curtail,Kin,Wisteria,Coasts,Tino,Corral,Sparks,Rose,Gnomon}.lean`;
`AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/{Numerics,Armada}.lean` definitions;
`Push/ABSOLUTE_SUMS/{Basic,Reserves}.lean` polynomial reserve located.

- Joint bound and differentiation: `YM.PhysicalNext.Repeat.Daisy.Charity.Est`
  and `Est.{mold,summit,logCharge,seqOwnUp}`. No factor of occurrence count:
  common value/derivative allowance is split into nonnegative witnesses.
- Fixed-address forced derivative and cost: `YM.PhysicalNext.Repeat.Mallow`
  `Season`, `gaze`, `real_force`, `dimes`. Added explicit absolute convergence
  of the full pointed double series, not merely the grouped derivative.
- Normalization: `Daisy.Charity.logOffer`; `Mallow.{curd,cord,cone,crown,floats,gust}`.
  The two whole-gas fusion identities are stated as inputs here; local-splitting
  does not establish these full transformations. Reviewer caught this false
  cross-reference in the first draft and it was removed.
- Tail: `Daisy.Charity.{stockB,baron,roughS,needleTail,catchAll,clockP}`.
  Order zero/nonprincipal excess cardinality and order >=1 are distinguished.
- Strict exponents: `Daisy.{strides,scaleHome,burden,stables}`, actual `Rate`
  means a bound at every strictly looser fine-beta power, not a big-O at its
  endpoint. Exact `polyPrice` retained. Tilt/block/mixed analytic producers and
  additional profile identity remain upstream obligations.

## Connected clusters and real logarithm

`cluster-expansion.tex` initial hash
`7cef87fd1c751b3685669c32bccac1cc16d7dcda44f7ff2f34cae8696d21dad9`
is under independent review. Full targeted reads under
`Lean/YM/Push/ABSOLUTE_SUMS/`: `Graph`, `Parent`, `Weigh`, `Forest`,
`Clusters`, `Ursell`, `Gas`, `Coef`, `FiniteLog`, `Log`; `Breadth` through
its build/uniqueness interface. Source correspondence:

- `YM.Push.AbsoluteSums.Graph.pay`: breadth-first intervals, cancellation of
  alternating connected graphs. Occurrence labels may repeat.
- `YM.Push.AbsoluteSums.Trees.parent_fanout`, `trees_afford`, `forest_at`,
  `root_at`: child factorials and normalized overlap kernels, exact degreePrice
  `4*(2B+1)^4*gamma/delta`. Text proves the count by weak compositions instead
  of the equivalent inductive factorial identity.
- `YM.Push.AbsoluteSums.Ursell.{budget_root,cluster_at,cluster_tail,pay_cover,log_hit_tail}`:
  root average with normalization `(m+1)!`, actual union support, geometric tail.
- `YM.Push.AbsoluteSums.Coef.recurrence`, `Gas.exact_polynomial`, `Gas.price_log`:
  connected component decomposition, real ODE on an interval containing [0,1],
  finite-alphabet exhaustion with absolute majorants. Positivity is proved,
  not assumed to permit taking the logarithm.

This supplies the combinatorial connected-tail and log-normalization input of
leaf-expansion from a vertex site bound. It does not supply the analytic vertex
bound of the actual nonlinear block integral. Shared literature README was
consulted previously; these elementary source-specific proofs were followed
without an extensive external search. No Lean source modifications or build.

Commands actually run this checkpoint: targeted rg/cat/sed; two zsh globs
for nonexistent paths failed before reads and were replaced with exact paths;
`python3 scripts/check_blueprint.py` passed (structure only). The intermediate
162-page PDF compiled with only the known unresolved `ex-centered-sail` reference.
Later chapter PDF build and visual QA remain in progress.

The independent reviewer passed `cluster-expansion.tex` at the recorded hash,
checking the graph cancellation, factorials, support reserve and logarithm ODE.

## Mixed packet and marked-component prices

`mixed-activity-prices.tex` passed local mathematical/source review at hash
`f3c4b4fafad5e632e5afc8ffd6d139e50ef5e86b6727c9c04c8dbe54ee287706`.
Full reads: `Push/ABSOLUTE_SUMS/{Animals,Packet,Charge,Distinct,Reserves,Mixed}.lean`,
`PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/{Solvent,Gnomon}.lean`.
Key correspondence: `Animals.animals`, `Packets.{stores_count,packet_income,packet_hit}`,
`Trees.touch_tail`, `Reserves.{reserve_tail,sets}`, `Mixed.{ready_vertices,mixed_hit,output}`,
`Daisy.Charity.{dew,sustains,coco,premium_hit}` and `Daisy.sailsW`.
The reviewer required L>=3 and integer halo/cover radii to justify the parent
plaquette distance. These are now explicit with the source inequality
L*distance<=L+2. Typed seeds, set/occurrence distinction, component fibers,
polynomial/mark reserve and insertion debt*normalized-weight identity retained.
Actual analytic packet weight, optional activity bound, projected cover/rate
inputs remain visible. Targeted later reads of `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6`
`Das`/`Lambent` located Utopia.stream/accrues/paid as the next analytic boundary;
one combined tool output truncated Das and was not treated as a complete read.

## Full soft-log fusion

`soft-log-fusion.tex` initial hash
`9b434687e1dde6ed69af6e5cd83a33f365a38d45ed74b5c7d2d7e275383817ed`
is pending independent review. Full reads:
`PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/{Passage,Kitchen,Carries}.lean`.
Main exact identity is `YM.PhysicalNext.Repeat.Mallow.Passage.gathered`, with
`fused_forcedFamily`; same-debt tilted bounds are `Mallow.wallets`/`harvest`.
Prose retains flag coverage, support connectivity, old hard separation and
original eligibility conjunction; the nonzero flatten/component bijection
excludes pure soft components using vanishing on healthy supports. Numerical
inflation Gamma=exp(kappa)b+2w is followed by the already proved distinct-forest
bound. This supplies a general fusion theorem, not proof of its actual analytic
Vapor inputs or calendar purchase.

## Rendering checkpoint

173-page PDF built before soft-log-fusion, with no overfull boxes and only
`ex-centered-sail` unresolved (centered-construction remains in reviewer/author
repair). Pages 118--145 rendered with pdftoppm to
`/private/tmp/ym-existence-preview-175/`; all 28 page images viewed in four contact
sheets. These include corrected local-splitting, local-sections, elementary
projection, connected clusters, mixed prices, differentiated expansion and the
beginning of reference transport. No visible clipping/layout defect identified.
The directory name is only a checkpoint name, not the actual page count.

### Gaussian warnings and packet estimates, continued 11 November

New source-following chapters `gaussian-warnings.tex` and
`packet-estimates.tex` expand the analytic vertex-price route. Root inspected
complete `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/{Many,Crash,ResponsePrice,
Peak,Alert,Tax,Weaving,Batch,Issue,OptionCost,Quotation,Annulus,AssignedPrice,
Steam,Revenue,TowerPower,Hogs,Veined,Flue,Brush,Inc,Remainder,Outer}.lean`,
`Push/ABSOLUTE_SUMS/Delay.lean`, `.../Numerics.lean`, and
`PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Lotus/Pygmy.lean`
at the pinned source. `Charge.lean` was inspected through packet_income's
counting step; the already checked mixed-activity chapter supplies that count.

Correspondence:
- `YM.ConnectedActivityE6.Poll.rectangle`, `count_for`, `shattered`:
  Gaussian MGF/orthant union, distinct coordinate witnesses and address census.
- `YM.ConnectedActivityE6.Coat.alarm_bills`, `charge_area`, `ready`, `fires_at`:
  actual monitor, physical beta window, deterministic warning implication and
  bounded warning amplitudes. The plateau and physical covariance analytic
  inputs are retained, not claimed produced by the Gaussian calculation.
- `YM.ConnectedActivityE6.Cash.combined`, `every`, `lease`, `integrated`,
  `statements`; `YM.PhysicalNext.Repeat.Lotus.Leaf.coin`, `tip`:
  shared Gaussian/Haar product, norm before integration, marked vertex erased
  with its own price. No independent-warning or independent-factor assumption.
- `YM.ConnectedActivityE6.Coat.expenses`, `earns`, `upkeep`, `steam_prices`:
  actual core-to-annulus accounting and full Gaussian/chart normalization.
- `YM.ConnectedActivityE6.Blaze.Silica.Clutch.dinner`, `stilly`, `chimney`;
  `Blaze.fever`, `Clutch.dynam`: closed support of persistent masks, jet bound,
  same per-seed exponential gain. Elementary partition chain rule gives a
  harmless enlarged derivative constant; all principal steps retained.
- `YM.Push.AbsoluteSums.Delay.monitor_pays`, `wins`, `fits`:
  monitor squared absorbs costs with monitor exponent strictly below two,
  and full rooted packet tail. Schedule production remains a separate input.

Independent reviewer passed gaussian-warnings at 21ca6fe4...; subsequent
precision edit makes the individual-warning implication explicit for marked
subsets and replaces TeX `over` by `frac`. Packet chapter is under review.
Local scalar, mean, chart and Taylor producers are stated as outstanding inputs;
these chapters do not prove the complete construction. No Lean changes/build.

Prior local review updates: soft-log-fusion final a8caa20893e55269853ba6e26d08b60c6f09b3f3572a00c7e7aff8d20f5c43db
passed; leaf-expansion cross-reference revision d6ba28b61050f42f1826c1bc223f24beb480b2cbf74f0eb230945b1835f1adec
passed. These supersede earlier local draft hashes only, with no machine approval.
