# Joint all-reader Gaussian model

- Unit: YM-000026, joint Gaussian law and masked coordinates for the reader family.
- Status: draft; independent source and mathematical review remain required.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/all-arity-reader-gaussian-model.tex`.
- Scope: identify the exact common sample law, its pushed Gaussian covariance
  from active input coordinates to every retained incidence coordinate, the short-kernel covariance bound,
  and the masked coordinate comparison on every admissible reader patch.
  This is an auxiliary leading law, not the full interacting block law.

## Source crosswalk

| Content | Fully qualified declaration | Pinned path |
| --- | --- | --- |
| Actual consumer route and finite tag mixture | `YM.PhysicalNext.InteractingRank.Soft.Spear.a_pprove` | `Lean/YM/MergeProof/West/Horns.lean` |
| Joint emulator construction | `YM.PhysicalNext.InteractingRank.e_xpose` | `Lean/YM/MergeProof/West/Expose.lean` |
| Reader support, coordinate means, and common-sample data | `YM.Next.Rank.Tapes.West.Mural`, `.StageNow`, `.sp_okes`, `.t_ests`, `.basisFt`, `.colorFt` | `Lean/YM/MergeProof/West/Mural.lean` |
| Common room law and finite update | `YM.PhysicalNext.InteractingRank.RoomView`, `.viewer`, `.gazed` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Images.lean` |
| Signed forest/tag transport and the transported Gaussian law | `.cusps`, `.fans`, `.fanMap` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Images.lean` |
| Reader-coordinate matrix and full joint covariance | `.projected`, `.rowView`, `.incTable`, `.transverse`, `.Q_sub`, `.preserves_counts`, `.needle`, `.faithfulSight` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Compass.lean` |
| Guard-to-field comparison for each reader patch | `YM.PhysicalNext.InteractingRank.screens` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Emulation.lean` |
| Exact transported field map and common finite channel | `YM.PhysicalNext.PhysicalGuard7f546.Curved.photo` | `Lean/YM/PhysicalNext/PHYSICAL_GUARD_7F546/Continuation/Consumer.lean` |
| Gaussian coordinate pushforward under a linear row map | `YM.SectorTools.PhysicalGaussianSwitch.covView`, `.view_cloud` | `Lean/YM/SectorTools/PHYSICAL_GAUSSIAN_SWITCH/Marginal.lean` |
| Guard range and lost-mask integral | `YM.Next.Rank.Guarded` | `Lean/YM/Next/RANK/Guard.lean` |
| Probability and Gaussian integration-by-parts receipt | `YM.Next.Rank.Tapes.VMeasure` | `Lean/YM/Next/RANK/ParticleMoment.lean` |
| Exact centered Gaussian law and covariance orientation | `YM.PhysicalNext.WeightedGaussianMarginal45C.Issue.realRank`, `.fullGlyph` | `Lean/YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Issue/Glyph.lean` |
| Same fixed masked insertion in actual/reference integrals | Theorem `thm:ex-lattice-eve-producer`, equations `eq:ex-lattice-eve-two-integrals`, `eq:ex-lattice-eve-source-identification` | `manuscript/existence/trace-eve-producer.tex` |

## Exact route and mathematical correspondence

In `Horns.lean`, the consumer iterates over the finite streak of the lantern.
For each streak element it calls `e_xpose` with that element's wood (forest)
and tag and retains its nonnegative share; the shares sum to one. Thus the
article's common-law statement is applied separately at each forest/tag atom. It does not
identify different tag covariances as one law. Within each atom, however,
all reader patches use the same `Mural` probability space and the same random
vector.

`RoomView` is exactly the product of Haar variables on frozen links and a
Gaussian vector on `In x A F`, the active fine-link Lie coordinates. `viewer` equips this
space with product Haar times the centered cloud of the selected channel
covariance. `gazed` applies one frozen-link-dependent channel drift and the
same scaled Gaussian vector to the coarse configuration by the finite
physical update. These are the article's (1) and (2). The common sample
convention is source-exact: the integration variable is not resampled when
the reader label changes.

For the covariance, `Compass.projected` first makes the single signed
transport of the frozen links/forest and applies the pose's fixed gauge
rotation to the Gaussian vector. The matrix `rowView` is exactly
`(dKeys A F x).submatrix toPAC id`; the incidence-curvature vector is formed
only at this row map, not at the Gaussian input stage. `fanMap` proves that the transported second
coordinate has exactly the covariance of the transported channel with its
transported tag. The turned channel law then gives the covariance at the
pose-aligned field. `rowView` is the submatrix of `dKeys` selecting the
incidence coordinates, and `covView` is defined by
`R * Q * R.transpose`. Therefore the centered reader array has full joint
law `cloud (R Q Rᵀ)`, not merely matching diagonal variances. The exact
measure-preserving statement is in `preserves_counts`; `needle` composes it
with the full Gaussian integration-by-parts law and stores the resulting
`VMeasure` in `Mural.initial`.

`faithfulSight` proves the comparison with the short covariance for every
pair of incidence coordinates in `sp_okes`. It inserts the tracked
finite-volume covariance, applies the paid `Dawn.strong.sight` bound on the
two entries, and then applies the common-history telescope. The manuscript
displays this exact two-term split. The reader supports enter through
`sp_okes`; the room and pose margins provide the separation hypotheses for
both entries. The estimate is not just a diagonal covariance statement.

For the coordinate comparison, `e_xpose` defines a separate scalar mask
`Γ a` for each patch reader `a`, while retaining the same room law, sample,
forest, tag, and centered vector. `shade_auth` supplies the `Guarded` receipt;
by the definition of `Guarded`, it has values in `[0,1]` and
`∫(1-Γ a)≤ε²`. This implies `μ{Γ a=0}≤ε²`; it does not imply
`μ{Γ a<1}≤ε²`. If that reader's mask is positive, `paid_veil` and the local
room estimate put the sample in the region where `screens` applies.
`screens` first returns health and then, for every chamber coordinate in
that patch's reader set, a single gauge element (depending on sample and
patch, but not on the coordinate) with the field-coordinate error at most
`ε`. The complex fine read is exactly
`rigid (coloring q (basisFt ...))`; the center is `(colorFt ...).re` using
the one fixed parent manner `T.2.val` and coarse configuration `U`, where
`colorFt` applies `Normal.reads (R i).H` to that rigid coarse basis. The fine
patch manner `a.val` enters only the fine basis, while `J_a` restricts the
common parent forecast coordinates.
`fine_read` identifies the fine basis value with the transported local core,
and the change-of-level identity identifies the coarse reference value with
this real normal read. These are precisely equation
`eq:ex-lattice-reader-coordinate` and its per-reader quantifiers.

The guard estimate is per patch. This chapter makes no union-bound claim
that all patch masks are simultaneously positive; such a claim would require
an additional cost depending on the number of patches. What is shared across
the family is the underlying law and the full Gaussian vector, so cross-reader
covariances are preserved.

## Relation to existing proof units

The section does not duplicate the density-jet comparison in
`sec:principal-gaussian-comparison`: it identifies the finite-dimensional
Gaussian reader vector and the fixed masked field coordinates that the
comparison requires. That canonical comparison still needs its separate
mean, covariance-jet, cutoff, compact-ball, and tail inputs. It does not
differentiate a reader insertion.

The section does not duplicate `sec:gaussian-reassembly`, which proves the
absolutely convergent activity sum restores the original block integral and
factors by its assigned supports. The present auxiliary `Mural` law alone
does not prove that reassembly identity.

The handoff to `sec:ex-lattice-trace-eve-producer` is the same fixed masked
insertion, common reader coordinates, and uniformity over its allowed reader
directions. The response-rate and cloud-price estimates are not reproved
here. The finite tag average outside this construction has nonnegative
weights summing to one, so estimates uniform in the tag atom pass through
that average without changing the common-law argument within each atom.

## Commands and checks

Read-only source inspection used `rg -n` and `sed -n` on the files listed in
the crosswalk, including the full proofs of `e_xpose`, `fanMap`,
`preserves_counts`, `needle`, `faithfulSight`, and `screens`, and the full
`Mural` fields. The three canonical manuscript sections listed above were
read from the integrating workspace to avoid duplicating their proofs. No
Lean build or LaTeX build was run. I ran `python3 scripts/check_blueprint.py`;
it stops because the isolated clone lacks the coordinator-owned
`blueprint/units/YM-000026/unit.json`.

## Remaining review questions

- Independently check that the article's conventional notation for the
  physical update, transported covariance, and normal-read forecast preserves
  the orientation and incidence-index conventions of the selected `photo`.
