# Character Ward inheritance and common continuation application

Parent author draft, issue26, session hairer-codex-existence-20261111.
Pin3456e5e75cf8d4cd558955a5c7638fba2d68f464.
Prose: manuscript/existence/phase-ward-inheritance.tex.
Independent review, LaTeX integration/render and structural check pending.

This fills the explicit phase-flux caller join identified by external issue11
review6818544207, and records the mixed/selected continuation application.
It assumes the actual unselected normalized stress law and the already-proved
slab/character/null-space interfaces. It does not produce shell nodes or free
Ward classifiers, nor claim every character has UniqueHeat. No new public
conclusion beyond the established interfaces is inferred.

Full reads at this pin:
- YM.Work.B09.Core.lean (path Lean/YM/Work/B09/Core.lean): InsideTimes,
  Padded, exists_padded, middle, middle_diff, Evaluates, has_evaluator,
  tester_ext, exterior_not_inside, matrix_of_placed, matrix_at_center.
  Qualified declarations use namespace YM.Work.B09. Character extension is
  only complex bounded linear outside the compression algebra. Same evaluator
  for every fixed translated slab/field configuration.
- YM.Work.B09.{Evaluates.inclusions,Evaluates.derivatives}, Differential.lean:
  constant slab and translation on an open configuration neighborhood;
  slot derivative through continuous evaluator. Already covered by canonical
  phase-regularity; not re-proved as a separate theorem here.
- YM.Work.B09.{window_extends,matrix_on_shell,weight_vanish,weight_within,
  padded_shell,shell_integrable,integrated,pushed,Evaluates.flux}, Shell.lean:
  whole support of window lies inside one slab; derivative weight vanishes
  near every collision. Norm-Bochner integration precedes evaluation. Extra
  word spectators outside whole window make unselected Ward laws applicable.
- YM.Work.B09.answer, Lean/YM/Work/B09.lean: applies that same evaluator for
  every character and returns inclusion/derivative/flux data.
- YM.OS.Selection.Certificate, Lean/YM/Phase/Mixture.lean: flux is for EVERY
  character, not only the selected/typical phase. Read entire file, including
  whole-word receives, compact-character resolution and barycenter.
- YM.Spec.{Seed,Locals,Materializes,Relativistic,Final}, Spec/Closed.lean:
  allWorld is unselected contour; chosen is selected contour; qt realizes
  chosen. Read full file; no identification of these distinct contours.
- YM.Next.BOUNDARY.{unselected_pantry,selected_pantry,both,after_materializes},
  Next/BOUNDARY/Stage.lean: read full file. Same reconstruction arcs apply
  without UniqueHeat to mixed FieldCore. Selected Compatible.vacuum invokes
  heat uniqueness; unselected does not. Existing full-tube/locality/domain
  arguments supply the mathematical mechanisms, not a new invocation of an
  unproved generic OS reconstruction theorem.
- YM.Pert.withFinal, Pert/Construction.lean: phase Looms then
  after_materializes on same Seed, algebra, selected character and spins.
- YM.EveryPhase.{Completed,all_characters}, EveryPhase/Extension.lean:
  read for scope. Its all-character UniqueHeat, low-energy, irreducibility,
  continued Minkowski stress and boundary-mixture clauses are stronger than
  the mixed/selected application here; their existence in this source is not
  claimed as a proof of them in the present chapter.

Canonical reuse: phases, phase-selection, phase-regularity, reflection-transport,
phase-fields, slab-regularity; physical-angular-actions for normalized stress;
complex-heat, analytic-boundary, fourier-support, label-descent,
lorentz-covariance, full-tube, heat-vectors, reconstruction, boundary-detection,
spectral-measure and locality. These are exact retained interfaces, not closure
of their analytic construction dependencies. Hahn--Banach and Bochner integral
commutation are standard functional-analysis background already used by the
canonical phase chapters; the latter is explained by simple approximation.
No new literature theorem substitution or search claim.

Commands actually run: scoped rg, cat and sed on named files and canonical
chapters; whole-manuscript rg for phase/stress/flux wording found no existing
explicit transfer argument. This search is a navigation aid, not an exhaustive
negative theorem-coverage certificate. No Lean edits, build or axiom replay.
