# Complex time, boundary values and word-domain reconstruction

Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Parent author: `hairer-codex-existence-20261111`. Status: draft.
The independent gpt-6-astra review and fingerprints are in `reviews/draft-review.md`.

## Inspected source and mathematical correspondence

| Prose | Fully qualified source declarations | Pinned paths |
| --- | --- | --- |
| Positive-contraction continuous calculus, holomorphic heat | `YM.OS.Semigroup.at_root`, `holo_root`, `localHeat`, `pairs`, `flip_row`, `stays` | `Lean/YM/Heat/Rows.lean` |
| Rational/real heat identification and injectivity | `YM.OS.Semigroup.quotient`, `roots_heat`, `heat_faithful` | `Lean/YM/Heat/Extend.lean` |
| Dense-range unitary boundary, strong continuity | `YM.OS.Semigroup.whole`, `pillar`, `high`, `along`, `either`, `send`, `cont` | `Lean/YM/Heat/Imaginary.lean` |
| Fixed vectors and final uniqueness handoff | `YM.Boundary.offiero`, `YM.Boundary.Action.only` | `Lean/YM/Fields/Spectrum.lean` |
| Single insertion on union, power bound | `YM.Work.C01.single`, `singles_agree`, `at_width`, `answer` | `Lean/YM/Work/C01.lean` |
| Padding and pure-imaginary identification | `YM.Work.C02.pad_bar`, `pad_rip`, `train_pure`, `root`, `matrix_pad`, `answer` | `Lean/YM/Work/C02.lean` (some helpers private) |
| Fixed-width analytic matrix, gap powers | `YM.Work.C03.defined_exists`, `defined_region`, `defined_power` | `Lean/YM/Work/C03.lean` |
| Tested CR, global real-position Cauchy bound | `YM.Work.C04.bounds`, `along`, `deriv_bound_near`, `lines` | `Lean/YM/Work/C04.lean` |
| Exact Taylor boundary extension | `YM.Boundary.Waves.right`, `meant`, `expense`, `maintains`; `cost`, `storm`, `seeks`, `jointly` | `Lean/YM/Shift/Breath.lean`, `Osc.lean`; definitions `Ridge.lean` |
| Compact-frequency exponential testing | `YM.Work.C05.tendsto_exp_slope`, `tendsto_psi`, `hasDerivAt_zero_psi`, `answer` | `Lean/YM/Work/C05.lean` |
| Ordered-height dual support | `YM.Work.C06.lift_falls`, `answer`; `YM.Boundary.half`, `coneM`, `tents`, `sees`, `total` | `Lean/YM/Work/C06.lean`, `Lean/YM/Shift/Closing.lean` |
| Mixed point heat Gram identity | `YM.Work.C22.euclideanRef`, `onImag`, `fromInner`, `pointJoined`, `answer` | `Lean/YM/Work/C22.lean` (helpers private) |
| Fixed-height Bochner integrals and translation | `YM.Work.C23.shot_control`, `shot_int`, `shot_shift`, `integral_shift`, `answer` | `Lean/YM/Work/C23.lean` |
| Two independent height limits | `YM.Work.C24.toward`, `integrated`, `answer` | `Lean/YM/Work/C24.lean` |
| Norm Cauchy and Gram-positive boundary | `YM.Boundary.norms_kernel`, `Cups.out`, `Outfield.safe` | `Lean/YM/Fields/Lo.lean` |
| Null-space descent and common domain | `YM.Boundary.Soil.compactor`, `starter`, `sharp`, `usable`, `regional`, `sees` | `Lean/YM/Fields/Stems.lean` |
| Poincare implementation and isometric embedding | `YM.Boundary.Soil.universal_embed`, `mobilize`, `cultivates`; `YM.Boundary.Outfield.daylight` | `Lean/YM/Fields/Motion.lean`, `Lo.lean` |
| Exact endpoint and field conventions | `YM.Boundary.Fields.Total`, `sharpPair`, `really`, `notLost`, `Wightman.Realizes`; `YM.Boundary.harvest` | `Lean/YM/Fields/System.lean`, `Lo.lean` |

These are targeted full reads of the listed source files/declarations, not a Lean build.
Failed guessed paths Fields/Soil.lean, Fields/Words.lean, OS/Complex.lean and
Shift/Bounds.lean were replaced by the actual Stems, Heat and Ridge files.

## Reorganized proofs and exact conventions

* Injectivity of E_t is proved by repeated halving and strong continuity, a valid
  shorter variant of the source's analytic identity-theorem proof. The imaginary
  unitary group is still constructed on the dense range of E_1. Spectral zero is
  never assigned an imaginary power by continuous calculus.
* Complex duration is `-i z - p` on the initial vector leg and `-i(z_j-z_i)-2p`
  between insertions. Real-time translation has sign +i in its spectral exponent.
* The independent-height Gram path is (-n s,...,-s,t,...,m t). The first real
  position tuple is reversed but NOT geometrically reflected. The first labels
  and tests are reversed and starred/conjugated.
* Joint tempered boundary uses the exact finite Taylor formula on weakly ordered
  heights. It is stronger than fixed-profile convergence and applies to arbitrary
  ratios of the two independent heat parameters.
* Fourier convention: test transform integrates exp(-i X.p), with inverse factor
  (2 pi)^(-4n); the distribution transform is W composed with that same hat.
  The halfspace result concerns absolute-coordinate momenta and all suffix sums.
* The field common domain is the finite span of all word vectors. Its null space
  is invariant because of the star-concatenation pairing identity, not because
  positivity alone makes arbitrary concatenation bounded. No field boundedness
  or essential self-adjointness is claimed.

## Literature

The continuous calculus uses the already inspected Williams, Theorem 2.19,
printed p.34, in its bounded self-adjoint specialization. The calculus input
is separate from the explicitly proved complex heat and edge construction.
See phase-evidence.md for bibliographic URL and source verification. There is
no invocation of a blanket OS reconstruction theorem in these new chapters.

## Remaining inputs after these chapters

The actual all-copy slab bound, finite-level inclusions, Euclidean hierarchy
and reflection involution still depend on earlier construction work. Conditional
on those inputs, complex heat, strict-time analytic matrices, joint tempered
boundary, heat-vector positivity and translation embedding are now supplied.
The following remain substantive: actual Lorentz label representation;
spacelike locality; actual RG/UV estimates and OPE/trace outputs. The field
reconstruction theorem deliberately displays these hypotheses where used.

## Lorentz continuation and an alternative boundary-detection proof

`lorentz-covariance.tex` follows inspected C07/Euclid, Geometry, Integrate,
Continue; C08; C09; and Work/A16. Exact declarations include
`YM.Work.C07.oriented_differential`, `orbit_image`, `error_imag`, `compact_boost`,
`YM.Work.C08.answer`, `YM.Work.C09.boost_corner`, `moving_eval`, `boost_invariant`,
`answer`, and `YM.Work.A16.exists_rest`, `answer`. It proves tested Ward transport,
strong Schwartz pullback, integration along boosts, and finite generation of the
proper orthochronous group. It still assumes the actual compatible finite-level
Lorentz label action with derivative -i times the Euclidean plane generator.

`boundary-detection.tex` proves tensor density by the compact Fourier-cutoff/
Schwartz-quadrature method of inspected `YM.Work.C25.cut_port_mem`, `compact_mem`,
`answer`; supplies the `Symbol` and `Cam` inputs of `YM.Work.C29.answer`; and
follows `YM.Work.C26.marker_on_joint`, `strict_zero`, `read_zero`, `answer`.
After tensor density gives zero joint W, the linear definition of tube emission
makes that emission zero; `YM.Boundary.Surface.Aurora.lower` in Shift/Sol
uses FullBody.pure to obtain zero strict-time values. Sorting and Conf continuity
then give the Euclidean null criterion. The initial independent shorter
frequency-testing route was removed following the user's main-step-fidelity
clarification. The current chapter uses the actual C26 main construction.

R. B. Melrose, *Introduction to Microlocal Analysis*, Chapter1, §1.7,
Theorem1.3, printed p.22, equations(1.59)–(1.61) printed p.21, author PDF
https://math.mit.edu/~rbm/iml/Chapter1.pdf, actually inspected via web reader.
Fourier transform is a continuous isomorphism of Schwartz space with inverse
factor(2pi)^(-d), exactly the radian convention here. This background supplies
Fourier inversion/homeomorphism only; the tensor-density quadrature and
boundary-detection arguments are given in full in the manuscript.

## Joint momentum and reconciliation with the new blueprint

`spectral-measure.tex` follows full reads of `YM.Paley.same`, `bound`
(`Lean/YM/Paley/Line.lean`), `YM.Paley.smoothed`, `supports`
(`Lean/YM/Paley/Half.lean`), `YM.OS.Semigroup.altitude`, `nonneg`
(`Lean/YM/Heat/Lift.lean`), and `YM.Boundary.Action.placed`, `south`,
`spectrum`, `only` (`Lean/YM/Fields/Spectrum.lean`). The manuscript proves
the Gaussian shift, support positivity, characteristic-function uniqueness,
Lorentz improvement, projection identity and vacuum uniqueness. It cites SNAG
in place of reproducing `YM.Spectral.Orbit.P` / `total` in
`Lean/YM/SNAG/Escape.lean`.

B. Bekka, P. de la Harpe and A. Valette, *Kazhdan's Property (T)*,
author manuscript, Theorem D.3.1, printed p.397, author URL
https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf.
The primary-source indexed page text was inspected and states the unique
regular PVM theorem for a unitary representation of an LCA group. Direct
PDF fetches timed out. This access limitation is not a claim of visual PDF
inspection. The application is to the already proved strongly continuous
representation of R4, with characters exp(i p.a). The Gaussian and measure
transport arguments are additional proved steps, not attributed to SNAG.

On 11 November the newly merged draft `blueprint/background/osterwalder-schrader.md`
(blob 2fc4e4096a102d182b1bca34d84eb191227be234, PR27; Trishen Gunaratnam
with Codex assistance) was read. Its exact corrected OS-II E0′/E0″ growth
quantifiers confirm why fixed-arity estimates alone do not justify invoking
the general reconstruction theorem. Its documented C01–C04/Shift direct
route matches the chapters here. This is corroborating draft navigation,
not an accepted reference proof or a claim of checking all its original scans.
The new `blueprint/interfaces/gaussian-sector.md` (blob
9378ceea6c7112d3dab5d775fefbf1f5b6795fea, PR28) was read and passed to the
estimate authors. It distinguishes the windowed covariance, full inverse,
Haar normalization and relative logdet; its corrected exact hypotheses are
retained as navigation for subsequent producer work. The independent reviewer
rechecked its corrected Agreements.exact and Priced.chains paragraphs against
their Lean source; no full-note or human acceptance is inferred.

## Full tube and locality: the source's complete continuation route

`full-tube.tex` follows `YM.Work.C10`–`C16` in order: the suffix-cone
pairing telescopes, a strict interior ball yields the dual margin, convolution
of an indicator thickening gives the smooth cutoff, bounded closed shifts act
continuously on Schwartz tests, and the strict lens has an exponential reserve.
`YM.Work.C13.hasFDerivAt_shift` and its `Variation.lean` Taylor estimate give
joint complex differentiation. C14's modulation-to-translation bound and compact
Schwartz quadrature identify the integral, C15's compact negatively lifted tests
and support identify the original strict-time wave, and C16 compares cutoffs
only near the spectral cone for Lorentz covariance. The chapter proves each
of these steps; it does not substitute a general reconstruction theorem.

`locality.tex` follows full reads of `YM.Work.C17`–`C21`, `C27`,
`Lean/YM/Shift/Swap.lean` and `Exchange.lean`. Exact main declarations are
C17.local_paths/height_path/answer; C18.eq_exponential/entire/answer;
C19.paneAlong/answer; C20.jets_on_open_side/complex_germ/answer;
C21.realize/reindex/answer; `YM.Boundary.Pane.agree`, `propagate`;
`YM.Boundary.NearPair.Panes.reaches`, `forgets`, `actor`; and C27.exchange/answer.
The proof preserves the two uniform imaginary-boost paths, entire finite-level
labels, two tube-anchored germs, equality of all Wick-slice jets, clopen germ
propagation along real-time contraction, local dominated convergence, partial
height removal, and product-test support argument. All spectators remain in
the joint distributions. Finite-level inclusions and actual symmetry/calibration
inputs are still required from the construction chapters.

Independent gpt-6-astra review passed these chapters at the fingerprints recorded
in reviews/draft-review.md, including source-main-step fidelity. This is agent
review evidence, not accepted or kernel-verified mathematical status.

## Finite-level Lorentz descent

`label-descent.tex` follows full reads of `Lean/YM/Work/A17.lean` and
`Lean/YM/Spin/Floor.lean`, at the recorded source pin. It proves the
conjugated generator identity, differentiates Euclidean inclusion compatibility,
uses constant-coefficient ODE uniqueness for boosts, then A16 generation to
descend the actions to the field union. It deliberately does not assume the
calibration maps commute with inclusions. Actual calibration and reference
actions remain explicit inputs. Independent review passed fingerprint
894d899b2dc2b222c1fe52b850131c92bcb3657264fffe5a919322099fb6cb69.
