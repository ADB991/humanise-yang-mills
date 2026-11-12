# Collision-pole separation and the circulation null test

Status: author draft; independent mathematical/source review pending.
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Manuscript: `manuscript/existence/free-collision-pole-separation.tex`.
Labels: `sec:free-collision-pole-separation`,
`lem:collision-radial-separation`, `lem:collision-product-separation`,
`thm:free-circulation-null`.
Author: parent hairer-codex-existence-20261111. This disjoint unit was split
from the Luna classifier after independent review identified a missing
harmonic/product-pole separation. The classifier author retains generic
probe/determinant elimination, quiet-charge classification and finite scenes.

## Exact source map

All names below lie in `YM.Maxwell.Free` unless qualified otherwise.

- `rad`, `Clears`, `Pole`, `green_pole`, `Pole.step`, `Pole.taylor`,
  `kernel_pole`, `Lean/YM/Next/MAXWELL/Pole.lean`: degree `-r`, harmonicity,
  and globally smooth radial numerator after multiplying by `|z|^(2(r-1))`.
  The prose derives the numerator differentiation formula and all kernel orders
  from the canonical covariance, rather than treating harmonicity as a new input.
  It only uses smoothness, a consequence of the source's `ContDiff ... omega`.
- `lap_valued`, `clears_faint`, `Faint.lean`: Laplacian coefficient
  `4(s+1)(s+2-r)` in four dimensions, clearing descent, and homogeneity plus
  continuity at zero. The zero coefficient at the genuine pole clearing order
  is not divided by; descent only uses exponents strictly below r-1.
- `Silt`, `Echoes`, `Deep`, `Silt.twice`, private `sum_peel`, `Deep.clear`,
  `Silt.lean`: product poles homogeneous of degree -q with radial clearing q-2;
  finite highest-degree peeling separates them from a harmonic residue. Prose
  writes natural truncation `max(q-2,0)` explicitly. No false plain limit of the
  full colliding moment is asserted.
- `Rack`, `shelf`, `Shelves.lean`: jet cutoff j, not weighted cap d.
  `eat`, `Recurse.lean`; `singleBite`, `all_bite`, `upper_shelf`, `circulate`,
  `circulate_eval`, `Morsels.lean`: finite coordinate contraction derivation and
  same-colour quadratic circulation. Polynomial derivations do not act on z.
- `path_wield`, `chorus`, `Deep.weaker`, `duet_path`, `Frenzy.lean`:
  continuous distant contractions, highest jet residue, lower-order suppression,
  and exact double-hit expansion into product poles. Orders are 4+k+s and
  8+k+l+s+b; M is strictly greater than 8+k+l+2j.
- `front_egress`, private `cluster_in`, `vertex`, `cluster_clear`,
  `Rumbles.lean`: four contraction placements, reconstruction of the surviving
  single-hit sum by the one-leg Wick identity, eventual separated configuration
  along every fixed nonzero direction, and gauge-invariant colour sum. Local
  vanishing uses the original null capacity because the added quadratic test
  has grade k+l+4<=d. The source requires l<k; it does not impose l<j here.
  That latter inequality belongs to the separate weighted-degree drop in
  `circulates_lower` and must be checked by the classifier consumer.

The chapter's top theorem is exactly the same-capacity null conclusion of
`cluster_clear` for P in shelf j. It does not prove the generic invertibility
of the colour-probe matrix, the uniform external detector, or the classification
of quiet charges. These remain in the separate classifier chapter.

## Inputs and literature

Reuse the explicit free Maxwell covariance and Wick polynomial convention of
`free-maxwell-ward-flux.tex`; the calculation here expands the singularity
argument required by the actual classifier. Source-level shelves and flavours
are interpreted through their definitions, not names. Existing shared literature
notes were checked in the parent session; no exact literature replacement is
asserted for this tailored collision lemma. The radial calculation, finite
asymptotic peeling and Wick contractions are all proved explicitly.

## Commands actually run and limits

Read Pole.lean in two bounded chunks (1–145,145–280), and all of Faint.lean,
Silt.lean, Frenzy.lean and Rumbles.lean. Read Morsels.lean 1–130 including the
contraction definitions, Shelves.lean1–75 and Recurse.lean1–52 for meanings.
Used scoped `rg` to find definitions and existing canonical labels. Two guessed
paths Probes.lean/Tides.lean did not exist; the actual files above were located.
No Lean changes, fresh Lean build or axiom replay. LaTeX/visual/structural checks
and independent review are pending at draft creation.

Review should check radial powers (squared radius versus radius), Laplacian
coefficient and nonzero range, the finite product-pole peeling, all four Wick
placements, no hidden uniform-in-direction limit, and the exact jet/grade
hypotheses of the final null test.
