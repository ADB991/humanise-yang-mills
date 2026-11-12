# Free external detection, quiet charges, and collinear tests

- Canonical issue and unit ID: https://github.com/hairer/humanise-yang-mills/issues/26, YM-000026
- Status: draft; independent mathematics/source review pending
- Authoritative manuscript: `manuscript/existence/physical-ward-free-classification.tex`; labels `sec:physical-ward-free-classification`, `thm:free-uniform-detection`, `thm:free-quiet-classification`, and `thm:free-collinear-scenes`
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`)
- Contributors and agent assistance: bounded source-to-prose draft by the assigned agent; independent review pending.

## Inputs and notation

The prose uses ordinary polynomial and Euclidean-moment language. Its inputs are the pinned source's finite polynomial jet spaces, the gauge-invariant weighted grading, the free Wick moments on separated configurations, reflection positivity, the compact simple gauge group's color pairing, and the spin/reality/covariance subspace of the finite-level vector charge. The fixed capacity is chosen once from the bounded-jet invariant ideal generators, the host-product bound, and the largest mixed-circulation test. It is independent of shell, polynomial length, and the finite field level.

Internal Ward-map erasure is intentionally not proved in this unit. The parent-owned `manuscript/existence/free-internal-ward-erasure.tex`, label `sec:free-internal-ward-erasure`, is the separate unit for that input. The selected-scale application in `physical-ward-propagation.tex` also requires its stated same-family observer/row convergence; this unit does not prove those interacting-theory inputs.

| Symbol | Meaning, space and normalisation | Origin | Local conversion |
| --- | --- | --- | --- |
| `X_{r,alpha}` | Polynomial coordinate of jet order `r`, weight `r+2` | `YM.Maxwell.Free.scaleW`, `degree` | Weighted polynomial degree in the prose |
| `S_D` | Gauge-invariant observables of weighted degree at most `D` | `YM.Maxwell.Free.shellSector` and `Host` | External spectator capacity |
| `ghost G D` | Polynomial whose moment insertion vanishes against every separated word from the level-`D` sector | `YM.Maxwell.Free.ghost` | “Null at capacity `D`” in the prose |
| `Host G D k` | Span of products of painted invariant homogeneous factors, total ordinary length `k`, each factor within capacity `D` | `YM.Maxwell.Free.Host` | `H_{D,k}` |
| `grams G` | Euler derivation diagonal with eigenvalue weighted degree; opposite-coordinate reflection has parity `(-1)^degree` | `YM.Maxwell.Free.grams`, `weight_own`, `weight_mono` | `Gamma` in quiet-charge proof |
| `fare` | Color-resolved one-to-zero jet two-point pairing | `YM.Maxwell.Free.fare` | `F` in the reciprocity identity |

## Correspondence

| Manuscript label or step | Fully qualified declaration | Pinned source path |
| --- | --- | --- |
| `lem:free-uniform-generation` | `YM.Maxwell.Free.hosting` | `Lean/YM/Next/MAXWELL/Living.lean` |
| `lem:free-coalescence` | `YM.Maxwell.Free.collapses` | `Lean/YM/Next/MAXWELL/Batch.lean` |
| `lem:free-shell-reduction` | `YM.Maxwell.Free.hosted_out` | `Lean/YM/Next/MAXWELL/Batch.lean` |
| External top-shelf elimination | `YM.Maxwell.Free.matrix_meal`, `YM.Maxwell.Free.reduces_top`, `YM.Maxwell.Free.group_meal` | `Lean/YM/Next/MAXWELL/Hidden.lean` |
| Mixed collision preserves nullity | `YM.Maxwell.Free.cluster_clear` | `Lean/YM/Next/MAXWELL/Rumbles.lean` |
| Weighted-degree lowering under lower probe | `YM.Maxwell.Free.circulates_lower` | `Lean/YM/Next/MAXWELL/Morsels.lean` |
| `thm:free-uniform-detection` | `YM.Maxwell.Free.exposed` | `Lean/YM/Next/MAXWELL/Hidden.lean` |
| Degree-four and degree-five shell decomposition | `YM.Maxwell.Free.low_support`, `YM.Maxwell.Free.five_support` | `Lean/YM/Next/MAXWELL/Ends.lean` |
| Panel representation and polarization | `YM.Maxwell.Free.tent`, `YM.Maxwell.Free.canopy_faithful`, `YM.Maxwell.Free.team_square_span` | `Lean/YM/Next/MAXWELL/Canopy.lean` |
| Three-point collision identity and recovery of a linear panel | `YM.Maxwell.Free.tri_focus`, `YM.Maxwell.Free.tri_takes`, `YM.Maxwell.Free.receives` | `Lean/YM/Next/MAXWELL/Refract.lean` |
| Point-separating third quadratic at a nonzero point | `YM.Maxwell.Free.point_fares`, using `cell_test`, `stock_floor`, and House-reflection covariance | `Lean/YM/Next/MAXWELL/Leading.lean`, `House.lean` |
| Pairing family separates every finite flavor sheet | `YM.Maxwell.Free.payment`, `YM.Maxwell.Free.ranging` | `Lean/YM/Next/MAXWELL/Flavor.lean`, with the radial-flux formula in `Affine.lean` |
| Finite sign classification of the panel | `YM.Maxwell.Free.near_cell`, `YM.Maxwell.Free.far_cell`, `YM.Maxwell.Free.classification` | `Lean/YM/Next/MAXWELL/Stabilizer.lean` |
| Quiet charge reduces to derivative on stress shell; grading/reflection erasure | `YM.Maxwell.Free.motor_low`, `YM.Maxwell.Free.racer`, `YM.Maxwell.Free.commute_ghost`, `YM.Maxwell.Free.off_pole`, `YM.Maxwell.Free.charges_quiet` | `Lean/YM/Next/MAXWELL/Racers.lean`, `Statistic.lean`, `Magnitude.lean` |
| `thm:free-collinear-scenes` | `YM.Maxwell.Free.lenses`, `YM.Maxwell.Free.to_scanner`, `YM.Maxwell.Free.scenes_gone`, `YM.Maxwell.Free.finite_lenses`, `YM.Maxwell.Free.scanner` | `Lean/YM/Next/MAXWELL/Scenes.lean` |
| Dilation insertion and finite-flavor separation by radial flux | `YM.Maxwell.Free.radial_flux`, `YM.Maxwell.Free.payment`, `YM.Maxwell.Free.ranging` | `Lean/YM/Next/MAXWELL/Affine.lean`, `Flavor.lean`; exposition in `sec:free-maxwell-radial-flux`, `eq:maxwell-radial-single-charge`, `eq:maxwell-radial-polynomial-ward` |
| Same-capacity mixed-collision nullity | `YM.Maxwell.Free.cluster_clear` | `Lean/YM/Next/MAXWELL/Rumbles.lean`; exposition in `sec:free-collision-pole-separation`, `thm:free-circulation-null` |
| Internal Maxwell Ward-map erasure, used downstream | Parent-owned theorem `thm:free-internal-erasure` | Exposition in `sec:free-internal-ward-erasure` |

## Literature and editorial decisions

The finite-generation step uses the Hilbert basis theorem for polynomial rings in finitely many variables: the ideal is generated by the family of positive-length invariant homogeneous polynomials, and finite generators can be selected from that family. Compact-group averaging is normalized Haar integration and is used only to make the coefficient factors invariant. No YM-specific external theorem is invoked. The Wick collision and reflection-positivity steps are proved in the manuscript using the free moments' stated properties. The exact source flow is grouped into three mathematical arguments rather than translated one helper at a time.

The external detector's source induction sets `j=dim Lie(G)`, chooses a host bound `r_j`, and uses capacity at least `max(r_j, 4+j+(j+1))`; the latter covers the extra probe of order `j+1` with every order `<j` probe. The quiet-charge proof follows the source sequence: opposite-reflection degree reduction, panel representation, the triangular three-point collision, the two parity projections and cross-seed, then the localized flux commutator and weighted-degree/opposite-reflection parity. Its dilation identity is supplied by the parent-owned radial-flux unit, not inferred from translation or rotation Ward identities. The finite-scene proof is the source's strict-order perturbation plus analytic continuation along a collision-free segment and finite-dimensional kernel selection.

## Open obligations and evidence

- The quiet-charge theorem is stated on the finite spin-covariant/reality/unit subspace, with the filtration condition at each grade through the cutoff. Independent mathematics/source review remains pending for the panel, collision, and finite sign-classification arguments.
- The mixed-collision input is the reviewed parent theorem `thm:free-circulation-null`; the application states its jet cutoff, capacity, and strict lower/upper probe order hypotheses. The fixed-shelf finite-generation and top-shelf elimination arguments remain local proof obligations for review.
- The selected interacting family still needs same-run finite-row convergence and free-data alignment; those are not proved here.
- Internal-map erasure is delegated to the separate parent-owned unit above.
- Commands run: targeted `rg`/`sed` inspection of declarations and immediate dependencies; `python3 scripts/check_blueprint.py` failed because this clone has no `blueprint/units/YM-000026/unit.json`. No Lean build or LaTeX build was run.
- Status remains draft until independent mathematics and source-correspondence reviews pass.
