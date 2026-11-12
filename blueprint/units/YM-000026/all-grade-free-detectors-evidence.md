# All-grade free detector: source and proof evidence

- Unit: YM-000026, all-grade free detector.
- Status: draft; the local source-to-mathematics and independent reviews are
  still required.
- Imported source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/all-grade-free-detectors.tex`.
- Main result: Theorem `thm:ex-lattice-all-grade-free-detector` and the
  all-grade tower diagonalization in equation `eq:ex-lattice-tower-gram`.

## Source crosswalk

| Mathematical content | Fully qualified declarations | Pinned source path |
| --- | --- | --- |
| Shell field-strength solution spaces, Euclidean inversion and reflection | `YM.Extra.FD.Sol`, `YM.Extra.FD.face`, `YM.Extra.FD.solO` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Solutions.lean`, `Forms.lean`, `Covariance.lean` |
| Green-potential curl response and normalization | `YM.Extra.FD.reply_radial`, `YM.Extra.FD.strength`, `YM.Extra.FD.strength_sign` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/LegAct.lean`, `Kelvin.lean` |
| Taylor translation of homogeneous solutions | `YM.Extra.FD.towards`, `YM.Extra.FD.field_expands` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Translation.lean` |
| Shifted response, vanishing lower jets, and top jet | `YM.Extra.FD.shifts`, `.signal_kelvin`, `.signal_lower`, `.signal_top` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Shift.lean` |
| Reflected one-leg pairing and grade-tower form | `YM.Extra.FD.scan`, `.towerB`, `.newLeg`, `.shiftAll_gram`, `.towerB_pos` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/PositiveLeg.lean` |
| Finite polynomial encoding and removal/derivation recurrence | `YM.Extra.FD.code`, `.from_large`, `YM.Extra.FD.crash_test`, `.aligned_step` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Script.lean`, `Duplex.lean` |
| Orthogonal monomial formula and strict reflected positivity | `YM.Extra.FD.aligned_script`, `.duplex_script`, `.upright`, `.reflected_positive` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/PowerGram.lean`, `WickPositive.lean` |
| Maxwell/Bianchi shell quotient and null-space elimination | `YM.Euclid.Comparator.shellSector`, `.snap`, `YM.Extra.FD.point_probe`, `.no_residual`, `.free_null`, `.exactField`, `.writes_inj` | `Lean/YM/Euclid/Comparator.lean`, `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Rank.lean` |
| All-index reflection and finite scanner injectivity | `YM.Extra.FD.readsTwo`, `.faceTest`, `.faceTest_eq`, `.scanner_inj` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Columns.lean` |
| Finite free moments and their matching expansion/removal | `YM.Maxwell.Wick.moment`, `.sumFormula`, `YM.Extra.FD.Pair.remove` | `Lean/YM/Maxwell/Wick.lean`, `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Removal.lean` |

## Argument correspondence

The off-origin scalar identity `eq:ex-lattice-shell-green` is the explicit
induction corresponding to `YM.Extra.FD.shell_green` in
`Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Harmonic.lean`: `applyDiff_succ`
decomposes the normalized Taylor coefficient into derivatives of frozen
first-slot tensors; the trace sum vanishes by `freeze_trace`, and their
coordinate contraction recovers the original tensor by `freeze_diagonal`.
The trace vanishing is derivative-slot harmonicity: differentiating the
Bianchi identity and summing gives `Delta F_im=0` after the divergence
terms vanish; the coefficient/freeze relation then gives
`sum_a partial_a(A_a)=0`. It is not inferred from the Maxwell divergence
equation alone.
The response formula in `eq:ex-lattice-kelvin-response` then groups radial
Green differentiation, divergence reduction, and the second curl in
`reply_radial` and `curl_kelvin`. The manuscript supplies this radial
calculation explicitly: the divergence-free equation removes derivatives
of the field strength, the radial-curl identity gives the factor `j+2`, and
the derivative of `|x|^{-2(j+2)}` gives the reflected radial term. Its
constant is `strength j = 4(j+1)(j+2)(-2)^j normal`, with `normal=1/(4*pi^2)`.

The translated Taylor maps in the manuscript are `towards j k (-I(x))`
with the source normalization `strength(j)/strength(k)`. Their finite sum
is `field_expands`. Applying the Kelvin response termwise gives the signal
of `Shift.signal_kelvin`. `invert_line`, `line_eq`, and `signal_diag`
justify the line-jet statement: the first nonzero normalized Taylor
coefficient is at order `j` and equals
`strength(j) rr(x)^(j+2) solO(face x) P`. The one-leg test formula
`replyTest` supplies the second-side sign `(-1)^k`.

The reflection in `scan`/`legKernel` is `solO(face x)`, which acts on both
the field indices and every derivative slot. This is the full action
`(s dot Q)(v)=s^(2)Q(sv)`, not merely a two-index matrix multiplication.
The manuscript's lower-triangular transform on the finite direct sum of
solution grades is the source `shiftAll`. `newLeg_below` makes its
off-diagonal blocks vanish after using the symmetry of `towerB`; `newLeg_diag`
and `slide_top` give the diagonal factor
`(-1)^j strength(j) rr(x)^(j+2) dotF(P,Q)`. Since this factor is positive
and `dotF` is positive definite, `towerB_pos` proves positivity on the full
tower simultaneously. The manuscript additionally explains invertibility
from the identity diagonal and strict grade lowering.

For a finite orthogonal basis of this tower, `aligned_step` is the exact
removal identity. The manuscript solves its recurrence by induction on
monomial degree, obtaining the diagonal weight
`prod_i alpha_i! d_i^(alpha_i)`. `from_large` represents every fixed Wick
polynomial in a sufficiently large finite tower. The manuscript explains
why: every restricted linear jet coordinate is represented by a vector in
the finite-dimensional solution space via its Frobenius Riesz vector, so a
polynomial in finitely many jet coordinates is a finite polynomial in tower
coordinates. Thus
`reflected_positive` is strict on every nonzero Wick polynomial.

`shellSector` is the image of the polynomial observation map, so quotienting
by Maxwell's equations and Bianchi relations is not an informal deletion of
coordinates. `no_residual` uses `point_probe` and strict positivity to show
that no further on-shell vector is invisible to every probe; `free_null`
identifies the free field quotient with the kernel of the observation map.
`writes_inj` embeds that quotient into the polynomial algebra. Finally,
`faceTest_eq` identifies the actual scanner columns with the reflected
pairing, applying the geometric reflection to every tensor index and
ordinary coefficient conjugation separately. Strict positivity then gives
`scanner_inj`.

## Literature search and scope

The shared literature index `blueprint/background/README.md` and the
background notes were searched for an accepted all-grade Kelvin/Maxwell
detector or matching theorem. No directly applicable reviewed result was
found. This manuscript therefore gives the local derivation and the finite
algebraic recurrence rather than attributing them to an unverified external
reference. No external result is invoked in the proof. The mathematical
linear-algebra facts used are finite-dimensional Gram--Schmidt and the
finite-dimensional inverse of a lower-triangular matrix with identity
diagonal; their use is spelled out in the prose.

## Commands and checks

Targeted source navigation used `rg -n` for the declarations in the table
and `sed -n` on the listed files, especially the full proofs of
`reply_radial`, `signal_kelvin`, `shiftAll_gram`, `towerB_pos`,
`aligned_step`, `aligned_script`, `duplex_script`, `reflected_positive`,
`no_residual`, and `scanner_inj`. The repository background index was read.
No Lean build, theorem check, or LaTeX build was run. Running `python3 scripts/check_blueprint.py` failed because the isolated
clone does not contain the coordinator-owned
`blueprint/units/YM-000026/unit.json`. No Lean build, theorem check, or
LaTeX build was run.

## Remaining proof/review questions

- Check the exact map from the source's shell-sector quotient to the
  gauge-invariant field-strength grades used in the integrated manuscript.
- Independently review the finite-moment removal recurrence and scanner
  interpretation; this unit proves only the free reference detector, not
  any interacting positivity or comparison estimate.
