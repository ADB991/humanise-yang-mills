# Ground algebra and phase selection: inspected source and remaining inputs

Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Author: parent session `hairer-codex-existence-20261111`; independent review by
`/root/independent_review` (gpt-6-astra), recorded separately. Status: draft.

Authoritative prose: `manuscript/existence/phases.tex` and
`manuscript/existence/phase-selection.tex`. These extend the reflection chapter;
they do not discharge the Wilson construction's slab bounds or full covariance.

## Correspondence

| Prose | Inspected declarations | Path |
| --- | --- | --- |
| Large-time orthogonal projection | `YM.OS.Semigroup.ground`, `fixed`, `norm_decrease`, `emerges` | `Lean/YM/OS/Core.lean` |
| Repeated insertion implies bounded slab operator | `YM.OS.Drive.against`, `QRead`, `enroll`, `fed`, `size`, `producer` | `Lean/YM/OS/Train.lean` |
| Slab placement and adjoint identities | `YM.OS.Slab`, `linked`, `opposite`, `realignment`, `Spread.reads`, `Spread.blank`, `concatenate`, `adjoints`, `perpendicular` | `Lean/YM/OS/Slabs.lean` |
| Ground space spatial invariance | `YM.OS.Ground.settles`, `overtops`, `across_axis`, `rays`, `inert` | `Lean/YM/Ground/Lean.lean` |
| Width/placement independence and cyclic vacuum | `YM.OS.Ground.stretches`, `crossing`, `pins`, `revisits`, `same_atom`, `at_any`, `M`, `X`, `coming`, `almost`, `slim`, `full` | `Lean/YM/Ground/Compress.lean` |
| Separated clusters with arbitrary varying spatial displacement | `YM.OS.Ground.receives`, `future_train`, `arcs` | `Lean/YM/Ground/Moments.lean` |
| Four-cluster exchange and commutative closure | `YM.OS.Ground.same_up`, `exchanges`, `gens`, `star_mem`, `adjunction` | `Lean/YM/Ground/Permute.lean` |
| Compact metrizable spectrum and full-support measure | `YM.OS.Ground.tiny`, `supports`, `attains`, `resolution` | `Lean/YM/Ground/Spectrum.lean` |
| Whole-word character values and barycenter | `YM.OS.Spread.Resolution.receives`, `place_exists`, `barycenter` | `Lean/YM/Phase/Mixture.lean` |
| Almost-everywhere one-dimensional heat-zero space | `YM.OS.Cluster.magnitude`, `trail`, `fits`, `champ`, `exp_real`, `horizon`, `lifts`, `selects` | `Lean/YM/Phase/Unique.lean` |

The countable rational-position/basis-word lemma in the prose is a separately
proved sufficient condition for `Cluster.horizon`. It must not be presented as
an inspected source implementation of `Vendor.horizon`. Its assumptions include
finite-dimensional raw label spaces, multilinearity, and continuity on all of
Conf in every phase. The character RP paragraph is likewise an explicit
operator proof using the inspected `slim` identity; the paragraph is not a claim
that all of `Vendor.emits` has thereby been constructed.

## Checked external results

Shared `blueprint/background/README.md` and the available notes were searched;
there was no accepted matching Gelfand/Riesz note. No shared background file is
owned or modified by this task.

* D. P. Williams, *A (Very) Short Course on C*-Algebras*, 14 February 2024,
  Theorem 2.13, printed pp. 29–31, and Theorems 2.17/2.19, pp. 33–34.
  Author-hosted PDF: https://math.dartmouth.edu/~dana/bookspapers/cstar.pdf.
  Actual statements inspected through the web reader. The application is to
  the nonzero unital norm-closed commutative star algebra in B(H0); its unit
  acts on a unit vacuum. The Gelfand transform is onto C(X), and characters
  are continuous star homomorphisms. Spectral permanence and functional
  calculus justify positivity in the closed subalgebra. The proof of
  metrizability and full support in the manuscript is specific and explicit.
* E. T. Sawyer, *Lecture Notes in Advanced Real Analysis*, Chapter 6,
  Theorem 32, printed p. 78, author-hosted PDF:
  https://math.mcmaster.ca/~sawyer/Publications/Advanced_Real_Analysis.pdf.
  Actual positive-functional statement inspected. The compact metrizable
  character space is locally compact Hausdorff and Cc(X)=C(X); the transported
  vacuum functional is positive by the continuous square root and has value
  one on the constant function one. Only its Borel representing measure is
  used. The source's completed sigma algebra is not needed here.

These are source matches checked by the author, not accepted shared references.
Independent review of the matches remains necessary. Failed fetches of other
Riesz notes were not used as evidence.

## Exact outstanding inputs

1. The repeated-word bound `QRead` must hold with the all-arity uniform rate
   needed for `Spread.AllCopy`, not just a constant for each fixed arity.
   `YM.OS.irons` in `Lean/YM/OS/Halves.lean` reduces this to `Tiled`; its
   construction is not yet written. The parent inspected this reduction.
2. Full O(4) covariance of the unselected hierarchy is needed for `Ground.inert`
   and the cluster exchange argument. Signed coordinate symmetries alone
   do not justify either step.
3. Norm separability is now proved from the dense rational slab/label family in
   `slab-regularity.tex`; its upstream all-copy and raw-slot derivative identities
   remain inputs. This discharges the earlier abstract separability premise.
4. `phase-regularity.tex` proves all-character smoothness/caps, phase semigroups,
   smeared RP and phase all-copy transfer. `reflection-transport.tex` proves the
   replication variance, ordinary reflection and full O(4) transport, conditional
   on actual bounded real approximations. Stress/differential identity production
   and the upstream hierarchy remain outstanding. These chapters now supply the
   phase semigroup and countable-horizon hypotheses used in a.e. selection.
5. `phase-fields.tex` proves the corrected finite-dimensional detector argument
   and common-null retention from explicit moment/spanning/injective-limit data.
   Production of `Retain.Funds` and those detector properties remains open.
6. Relativistic complex heat, joint boundary values, heat-vector bridge and field
   domain are now proved in the subsequent chapters; Lorentz covariance, locality,
   boundary label detection and momentum PVM remain. See reconstruction-evidence.md.

## Additional inspected correspondence

* `slab-regularity.tex`: `YM.Work.B02.norm_remainder` (B02/Analysis.lean),
  `YM.Work.B02.smooth_place` (B02/Slab.lean): full dense matrix-element
  remainder argument and finite derivative-label bounds, not weak-only continuity.
* `phase-regularity.tex`: `YM.Work.B11.phase_cap`, `YM.Work.B13.answer`,
  `YM.Work.B08.smear`; actual all-character powers and joint-test Bochner RP.
* `reflection-transport.tex`: `YM.OS.Grid.Covering.square` (Phase/Square.lean),
  `YM.Work.B05.answer`, `YM.Work.B06.answer`. Generic-inside-each-word qualification
  checked; no all-Conf grid approximation assumed without the continuity extension.
* `phase-fields.tex`: `YM.Extraction.Retain.bit` (Phase/Detect.lean),
  `YM.Extraction.Retain.lift_detect` (Phase/Picks.lean). The parent read the full
  source proofs and `Euclid/Null.lean` quotient definitions.

All these chapters have independent local agent review. That is evidence, not
accepted human review; metadata stays null.

## Validation at this stage

The parent compiled `phases.tex` as part of the standalone draft successfully
(19 pages before adding phase-selection). `python3 scripts/check_blueprint.py`
passed with two units at that checkpoint. No new Lean build or axiom audit
was run. Subsequent exact compilation, render checks, and hashes belong in
`validation.md` after integration. The independent agent's local mathematical
review does not change machine status from draft.
