# C04 input/output ledger

Status words: **proved here** (detailed proof in the C04 chapter, conditional
only on the listed premises); **input** (stated premise produced elsewhere);
**cited** (external literature, hypotheses checked in the chapter).
"Producer" names the package that owns the producing chapter according to
`coverage-inventory.json` at `9d11cca`. A producer entry is an assignment of
responsibility, not a claim that the producer has delivered or that the
statements have been matched on both sides. Every edge below remains open
until the producer acknowledges it and the independent reviewer agrees.

## Outputs (theorem level)

| Output (label, chapter) | Statement in brief | Incoming premises (edge IDs below) |
| --- | --- | --- |
| `prop:complex-heat`, `lem:time-fixed-heat` (complex-heat) | Holomorphic contraction semigroup E(z), Re z>0; unitary edge group V(t) with V(t)E(z)=E(z-it); injectivity/dense range; commutant and vacuum statements; fixed vectors of V = fixed vectors of E_s | E1 (Euclidean semigroup), E2 (spatial translations), L1 (Williams Thm 2.19, cited) |
| `lem:continued-matrix` (analytic-boundary) | Width-independent ordered-time matrix F_n, holomorphic on ordered tube, Euclidean at imaginary times, gap-power bound C k^{-m} | E1, E2, E3 (slab bound + padding), E4 (finite levels, inclusions, union), E5 (Euclidean correlations/word density) |
| `lem:tested-cr`, `thm:joint-boundary` (analytic-boundary) | Tested CR identity; exact edge Taylor formula; tempered boundary W_n(v), limit through all strictly ordered heights | `lem:continued-matrix` only |
| `lem:exponential-testing`, `prop:half-support` (fourier-support) | Frequency-height identity; support of \hat W_n in zero-total, nonnegative suffix-time half space | `thm:joint-boundary` |
| `cor:cone-support` (fourier-support) | Forward suffix-cone support | `prop:half-support`; Lorentz covariance (`thm:lorentz-covariance`) |
| `prop:lorentz-label-descent` (label-descent) | Calibrated finite-level Lorentz actions commute with inclusions; one action on the union with K_a=-iL_a; commutes with J | C14-to-C04-calibrated-actions |
| `prop:boost-ward`, `lem:schwartz-motion`, `thm:lorentz-covariance` (lorentz-covariance) | Tested boost Ward identity; Schwartz continuity of Poincaré pullback; Lorentz covariance and translation invariance of W | `thm:joint-boundary`; E5 (Euclidean O(4) covariance, inclusion compatibility); `prop:lorentz-label-descent` |
| `lem:tube-margin`, `prop:full-tube-holomorphic`, `prop:tube-identification`, `prop:tube-covariance` (full-tube) | Fourier–Laplace continuation to the full forward tube; identification with F_n; tube Lorentz covariance | `cor:cone-support`, `thm:lorentz-covariance`, `lem:exponential-testing` |
| `lem:mixed-heat-gram`, `prop:heat-cups` (heat-vectors) | Mixed Gram identity at reversed (not reflected) real positions; independent-height Gram limit; translation intertwining | `lem:continued-matrix`, `thm:joint-boundary`, E1, E2, E3, C03-to-C04-reflection-J |
| `lem:cold-vectors`, `prop:word-fields`, `prop:word-locality`, `prop:word-motion` (reconstruction) | Positivity, common invariant domain D, adjoint inclusion, closability, locality/label retention (conditional), unitary Poincaré rep and isometry 𝒱 with translation intertwining | `input:word-boundary` (discharged by `prop:heat-cups`, `cor:word-test-inputs`); `eq:word-motion-input` (discharged by `cor:word-motion-inputs`, new) |
| `lem:tensor-tests`, `cor:word-test-inputs` (boundary-detection) | Tensor-test density; label/test multilinearity and joint Gram continuity | `thm:joint-boundary`; L2 (Melrose Thm 1.3, cited) |
| **`cor:word-motion-inputs` (boundary-detection, new)** | Poincaré action on words, (gb)^*=g(b^*), K(gb,gc)=K(b,c), continuity of g↦K(b,gc); translation hypothesis of `prop:word-motion` | `thm:lorentz-covariance`, `lem:schwartz-motion`, `prop:lorentz-label-descent`, `prop:heat-cups`, C03-C14-to-C04-involution-identity |
| `lem:zero-boundary`, `prop:boundary-detection` (boundary-detection) | Zero boundary ⇒ zero strict continuation; every nonzero label gives a nonzero smeared field | `prop:tube-identification`; E5 (permutation symmetry, continuity); C14-to-C04-null-equality; E4 |
| `lem:paley-positive`, `thm:field-spectrum` (spectral-measure) | Positive-measure Paley–Wiener lemma; translation spectral measure in closed forward cone; invariant vectors = CΩ | `prop:word-motion`, `prop:complex-heat`, `lem:time-fixed-heat`, L3 (SNAG, BHV Thm D.3.1, cited), C03-to-C04-unique-heat |
| `lem:imaginary-boost-path`, `lem:euclidean-germs`, `thm:spacelike-exchange` (locality) | Adjacent spacelike exchange of joint distributions with spectators; field commutativity on D | full-tube outputs; `prop:lorentz-label-descent` (entire finite-level extension); E5 (permutation symmetry); `prop:word-locality` |

## Incoming edges

| Edge ID | Producer → consumer | Exact statement needed by C04 | Common objects to match | Status |
| --- | --- | --- | --- | --- |
| E1 = C03-to-C04-euclidean-semigroup | C03 (`reflection.tex`, Thm `ex-euclidean-semigroup`) → complex-heat, analytic-boundary, heat-vectors | Strongly continuous semigroup of self-adjoint contractions E_t on the selected Euclidean Hilbert space H_E, E_0=I, unit vacuum Ω_E with E_tΩ_E=Ω_E | Same selected hierarchy and GNS space as the slab operators B_p | input |
| E2 = C03-to-C04-spatial-translations | C03 → complex-heat, analytic-boundary, spectral-measure | Strongly continuous unitary spatial translations U(x) commuting with E_t and fixing Ω_E | same H_E | input |
| E3 = C03-to-C04-slab | C03 (`actual-slab-copy-bounds.tex`, `slab-regularity.tex`) → analytic-boundary (`eq:bar-power`, `eq:bar-padding`) | For each union label v: ‖B_p(v)‖ ≤ C_v p^{-a_v} for 0<p<1 (single-insertion all-copy slab bound with buffer p), and B_{p+u}(v)=E_uB_p(v)E_u | B_p defined on the union through all exterior words; constants per label, no uniformity over labels | input |
| E4 = C03-to-C04-levels | C03 (`limits.tex`, field quotients) → analytic-boundary, label-descent, boundary-detection | Finite-dimensional field levels E_d, injective inclusions forming a directed system, union = algebraic direct limit, every union label has a finite-level representative; selected correlations compatible with inclusions | same field quotient used by the OPE (see C03-C04-to-C05-phases) | input |
| E5 = C03-to-C04-euclidean-axioms | C03 (`reflection.tex`, `phases.tex`) → analytic-boundary, lorentz-covariance, boundary-detection, locality, heat-vectors | Smooth distinct-point Euclidean correlations S(v;X): multilinear, permutation symmetric, O(4)-covariant with the compatible representation R, translation invariant, reflection relation with the reflected conjugate J; matrix elements of slab words are these correlations | same J, R, labels | input |
| C03-to-C04-reflection-J | C03 (`reflection.tex` l.13–15) → heat-vectors | Word pairing reflects the first tuple in time and applies the reflected conjugate J to its labels | J = reflected conjugate on every level, compatible with inclusions | input |
| C14-to-C04-calibrated-actions | C14 (`physical-angular-actions.tex` l.304–315) → label-descent (`input:calibrated-actions`) | Isomorphisms Q_d, reference actions R_d^0, T_d^0 with boost generator −iL^0, agreement on spatial rotations, R_d=Q_dR_d^0Q_d^{-1} commuting with inclusions, involutions J_d, J_d^0 with J_dQ_d=Q_dJ_d^0, J_d^0T_d^0=T_d^0J_d^0 | the same Q_d that define R_d (no fresh choice); same inclusions as E4 | input; C14 text states it supplies exactly this |
| C03-C14-to-C04-involution-identity (**new**) | C03, C14 → boundary-detection (`cor:word-motion-inputs`) | The involution J_d of `input:calibrated-actions` equals the reflected conjugate J of `reflection.tex` on every level | J = θκ (time-reflection label action composed with real structure); see the computation after `cor:word-motion-inputs`: θκ commutes with K_a=-iL_a, κ alone anticommutes | input; Lean: `YM.Boundary.starRead J h` (J = time-axis adjoint of the real spin), used through `YM.Boundary.Letter.rewrites` |
| C14-to-C04-null-equality | C14 (detector chapters) → boundary-detection | At every finite level, the selected null space (labels vanishing in every distinct-point correlation with arbitrary exterior labels) equals the original null space | same hierarchy T, same quotient | input |
| C03-to-C04-unique-heat | C03 (`phase-selection.tex`/`phases.tex`) → spectral-measure, complex-heat | The heat-fixed subspace of H_E is CΩ_E | the selected (pure) phase's H_E | input; the Lean `Next/BOUNDARY/Stage.establishing` variant explicitly omits it, so the endpoint's use must be matched by G01 |
| L1 | Williams, *Lecture notes on C\*-algebras*, Thm 2.19 | continuous functional calculus, bounded self-adjoint case | — | cited (previously inspected; not re-inspected in this pass) |
| L2 | Melrose, *Introduction to Microlocal Analysis*, Ch. 1, Thm 1.3 | Fourier transform is a homeomorphism of Schwartz space, radian convention | — | cited (previously inspected; not re-inspected) |
| L3 | Bekka–de la Harpe–Valette, *Kazhdan's Property (T)*, Thm D.3.1 | SNAG theorem | — | cited (previously inspected via indexed text; not re-inspected) |

## Outgoing edges

| Edge ID | C04 output → consumer | Status |
| --- | --- | --- |
| C03-C04-to-C05-phases | heat continuation, field quotient, injection → C05 OPE reader | open (from known-open-edges.md) |
| C04-to-C15-spectrum | `thm:field-spectrum` → `trace-spectrum.tex` (C15) | open; consumer cites the theorem by label |
| C04-to-C14-ward | full-tube/reconstruction/heat-vector outputs → `phase-ward-inheritance.tex`, `physical-ward-packet-prices.tex` (C14) | open; consumers cite C04 labels |
| C04-to-C16-endpoint | all reconstruction outputs → Definition `ex-reconstructed` (statement.tex) via `assembly.tex` | open; `cor:word-motion-inputs` closes the previously unmatched Poincaré-invariance hypothesis inside C04 |
