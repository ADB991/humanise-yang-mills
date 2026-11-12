# Coherent physical stress normalization — draft

Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Parent session `hairer-codex-existence-20261111`, issue #26.
Text: `manuscript/existence/actual-stress-normalization.tex`.
This is a bounded producer from one actual `Approaches`/`Stable` curve and
the exact reference `FreeDiv` certificate. It does not prove the reference
Maxwell Ward normalization or the physical shell economics.

## Exact source correspondence

Namespaces below are `YM.Next.UVStress` unless otherwise specified.

| Mathematical step | Declarations | Path under `Lean/YM/` |
| --- | --- | --- |
| Curve and normalization quantifiers | `YM.Climb.Scaling`, `Scaling.meter`, `Scaling.jets`, `Scaling.Align`; `YM.Climb.Track`, `ActLaw` | `Climb/Cells.lean`, `Climb/Beams.lean` |
| Uniform order-zero joint-test convergence, stronger than pointwise weak convergence | `Fades`, `Approaches`, `Stations.build_curve` | `Next/UV_STRESS/Weak.lean`, `Rates.lean` |
| Same-curve corrected isomorphisms and eventual coherence | `Stable`, `Stations.equivalences` | `Next/UV_STRESS/Invert.lean` |
| Derivative transport via integration by parts and finite detectors | `scaled_identity`, `head_tilt`, `bend_limit` | `Next/UV_STRESS/Focus.lean` |
| Moving-label differences and derivative closure | `flowing`, `Travels`, `closed_path`, `travels_jet`, `comparison_jets` | same |
| Fourier upgrade across coordinate ties within Conf | `scan_uniform`, `GradientFamily.vanishing`, `.radial`, `.localized`, `.uniform`, `.jets` | `Next/UV_STRESS/Local.lean` |
| Center equivalence, vector equivalence, physical divergence rank | `centerEquiv`, `moves`, `differential_rank`, `FreeDiv` | `Next/UV_STRESS/Dimension.lean` |
| Positive norm normalization and compact sphere | `labelScale`, `strength`, `positive_strength`, `balanced_J`, `subsector` | `Next/UV_STRESS/Limit.lean` |
| Actual expectation and divergence in the limit | `balanced_zero`, `center_expect`, `on_axis` | same |
| One physical sign and tails for every finite request | `produce_current`, `focused_track`, `focused`, `narrow_path`, `narrow_stable` | same |
| Native application | `YM.MergeProof.Acme.readyA`, `.emanate` | `MergeProof/Emanate.lean` |

The manuscript follows the source's finite-test/IBP proof of derivative
convergence, then its Fourier-modulation/localization proof of compact jets.
It does not infer derivative convergence from distributional convergence alone.
The finite test matrices give a uniform lower bound before applying it to
the possibly unbounded transported derivative vector. Recentring equivalence
reuses the canonical trace-calibration calculation; a short surjectivity
argument binds that equivalence to the actual derivative limit. The compact
sphere is in the full reference array space; centering is subsequently proved
by the arity-one limit, exactly as in `on_axis`. The final sign is real and
chosen once, with the reference tensor fixed.

## Inputs, reuse and remaining boundaries

Canonical reuse: `trace-calibration-producer.tex` (corrected lifts, uniform
short-test estimate, finite detectors, recentering); `trace-free-rank.tex`
(free low-grade rank and line); `three-panel-weak-comparison.tex` (actual
uniform test bound from physical comparison); `finite-rank-kernel-transport.tex`
(actual grade quotient dimensions). These are not replaced by a new family.

The exact reference `FreeDiv` includes onto, one-dimensional kernel,
centered membership, conservation and nonzero for its specified tensor.
The reference Ward-flux producer is a separate newly identified obligation
(`Maxwell.Free.beacon_signal` and `FreeStress.fire`/`common_stress`/`kappa_eq`).
Physical annular representation is assigned separately to the lattice drafting
agent. Neither is inferred from this local normalization result. The curve
still consumes the same-table uniform `Approaches` and eventual `Stable`
receipts; their analytic funding must be matched in global closure review.

Literature check: searched the shared background index and notes for stress,
conserved tensors, compactness and dimension. No matching specialized result
was recorded. The argument uses elementary finite-dimensional algebra,
compactness, integration by parts and Fourier inversion for smooth compactly
supported functions, also used in the existing Fourier chapters. No new
literature shortcut or novelty claim is made.

Read-only inspection used bounded `rg`, `sed` and `cat` on every source file
listed above and the named canonical chapters. `git diff --check` passed
after drafting. No Lean command, axiom replay or source mutation was run.
Independent review and parent TeX/render checks remain pending.
