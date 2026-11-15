# Stored-tube compatibility and warning inputs

Refs #317, #43, #315. Session `hairer-codex-317-local-20261115`.
Claim: https://github.com/hairer/humanise-yang-mills/issues/317#issuecomment-6898546904.
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Publication base: `058a43868699170f93ed62fedddd5ea360c6a440`.

## Result

The new `sec:selected-local-warnings` gives mathematical content to the
previously undefined phrase "stamped sector". The compatibility is between
one stored tube, its two adjacent beds, its actual paths and clips. It consists
of the diagonal and transport identities, all six block identities, signed
invariance of the full quadratic forms, path attachment, and the floor identities
and bounds. `lem:selected-tube-compatibility` obtains these from the retained
horizon and stationary plan with indices i+1,i. The argument includes i=0 and
i+1=N without using tail-only identities between different horizons.

`lem:selected-warning-inputs` then connects the mean cancellation, safety
plateaus and actual local covariance bound to that stored tube. It retains the
funded path/shell/guide/local precision inputs and their common purchases.
It covers all six warning types, with the 300B compulsory region for the five
mask/likelihood/contraction types and the direct mean bound for the bond cutoff.
It also covers the reduced margin for zero germs. It does not infer packet
support health from manifestness, or identify the local covariance with the
full inverse or with the derivative-row construction.

The only change to `warning-safety.tex` replaces the undefined phrase with this
explicit compatibility and its selected-tube producer. No previous review
fingerprint is refreshed; the new text remains draft.

## Source correspondence

Paths relative to `Lean/`; all inspected file hashes checked against
`Lean/SOURCES.sha256` at the pin.

| Step | Fully qualified declaration and path |
| --- | --- |
| Exact compatibility | `YM.ConnectedActivityE6.SliceRows.Stamp`, `YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Voyage.lean`; `YM.Precision.Towers.Diagonal`, `YM.Precision.Towers.Roll`, `YM.Precision.Floor`, `YM/PREC/Stacks.lean`; `YM.Bid.Sworn`, `YM/Bid/Station.lean` |
| Actual physical tube | `YM.PhysicalNext.Repeat.Opera.protocol`, `YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Opera.lean`; the witnesses are the stored beds at N,m+1 and N,m, with plan.crossings/stack/all and support.links |
| Auxiliary-torus cross-check only | `YM.PhysicalNext.Repeat.Pane.orchestra`, `ovation`, `YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Pane/Rooms.lean`; not used to replace the physical tube |
| Stationary cancellation | `YM.ConnectedActivityE6.SliceRows.accords`, `Voyage.lean`; manuscript `eq:mean-stationary-zero` |
| Safety production and conditions | `YM.ConnectedActivityE6.Target.GrantBodies.safety`, `Target.issue`, `YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Issue.lean`; `YM.ConnectedActivityE6.Coat.ready`, `Peak.lean`; manuscript `sec:warning-safety` |
| Warning support | `YM.ConnectedActivityE6.Coat.mandatory_far`, `blowing`, `Guards.lean`; `Coat.mandatory`, `mayor`, `aura`, `detect`, `Alert.lean` |
| Selected consumer | `YM.ConnectedActivityE6.Planning.testing`, `walls`, `Wall.lean`; retains the actual Works/Intake witnesses and common purchases |

The covariance inequality is an application of the existing weighted local
inverse proof in `sec:local-covariance` to the sector precision supplied by
`sec:sector-gram`. No new external analytic theorem is invoked. Shared literature
notes were searched; the substantive mean/safety/covariance proofs remain canonical
in their existing chapters rather than being duplicated.

## Remaining scope

This settles the missing algebraic meaning and selected witnesses of Stamp and
the warning consequences of the retained funded local bounds. It does not by
itself assemble all of Target.Invoices or Cash, the actual summed packet variants,
the optional rooted sum, the thin component bound, differentiated entrance, or
the ordinary/raised precursor and vapor inputs. Those are subsequent #317 chunks.
No existing hypothesis of `prop:selected-centered-retention` is removed here.

## Review and validation

Prepared by Codex for Martin Hairer. A user-authorized GPT-6 Luna agent inspected
the exact Stamp and physical producers read-only in a separate clone. An independent
agent reviewed the new mathematics and source correspondence in another clone,
with no required correction after the explicit warning-type/radius distinction.
Its final hashes are those in `hashes.json`; this is scoped agent evidence, not
human acceptance or a whole-package review.

- `python3 scripts/check_blueprint.py`: passes, four units.
- `git diff --check`: passes.
- `pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build-local317 existence.tex` from manuscript/: three successful passes; final PDF 1105 pages, no undefined references or changed-label warning. Rendered pages 327–328 and 708–711 inspected, with legible text and unclipped formulas. Existing whole-book box warnings remain.
- No Lean elaboration, build or axiom replay; checker tests not run (checker unchanged).
- Terminal fetch failed due to unavailable DNS. The GitHub plugin provided immutable
  current file contents. The local build overlay contains all manuscript differences
  from db0178a9 to 058a438; unrelated blueprint evidence was not imported for the build.
