# Trace proof correspondence (draft)

Source revision: 3456e5e75cf8d4cd558955a5c7638fba2d68f464.
Parent author session: hairer-codex-existence-20261111.

`manuscript/existence/trace-profiles.tex` follows full reads of
`Lean/YM/TraceExtension/Wick/{Expansion,Gain,Massive,PolynomialField,Log,Refute}.lean`.
Its principal declarations are `YM.TraceExtension.Wick.Expands.mult`,
`primitives`, `moment_d`, `euler`, `differentiated`, `basic_expands`,
`moment_expands`, `Mode.field_value`, `Track.moments_expand`, `no_powerlog`,
`real_profile`, and `euclidean_excludes`.

The main steps are preserved: finite power-log algebra, derivative comparison
for primitive remainders, radial Euler identity and order bootstrap (including
the exceptional -1 order), polar angular factor, and dyadic lexicographic
leading-term obstruction. Standard elementary integration by parts replaces
the Gamma-integral library call. No convergent asymptotic series is assumed.
This proves the public finite-profile exclusion conditional on a positive
trace asymptotic. It does not yet prove that asymptotic, nor the stronger
internal momentum-test/Wick-palette/Maxwell exclusions.

Independent gpt-6-astra review passed fingerprint
6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54.
Machine review fields remain null; this is not human acceptance.

## Numerical coefficient, physical normalization, and all-radius passage

`trace-asymptotic.tex` follows full reads of
`Lean/YM/TraceExtension/Foundation/Constant.lean`, `Foundation/Dilate.lean`,
`Chart/{Masts,North,Nectar,Time,Line}.lean`, and
`Verse/{Pears,Round,Day,Cape}.lean`. The central declarations are
`YM.Trace.curl_squares`, `wick_norm`; `YM.Trace.Over.ranking`,
`year_spec`, `july`, `Store_l`; and `YM.Trace.Verse.rounds`, `greens`,
`rainbow`, `axis_shape`, `tagline`, `monotone_axis`, `border`, `outside`.

The chapter proves the ordered-axis Wick coefficient, rank-nullity reduction,
nonzero flux test fixing scalar amplitude, vanishing unit correction,
finite-basis moving-label limit, normalization factor, exact radial reduction,
positive-spectral monotonicity squeeze at generic diagonal shots, and the
bad-sequence contradiction removing scale subsequences. It preserves these
source main steps. It does NOT claim to prove ChoiceK/reveals, the detecting
observer and Ward jet estimates, Gondola/seat quantitative receipts, Gallery
scale selection. Those inputs are explicitly displayed in ordinary
mathematical form. The specialized TraceSpectrum measure is now constructed
in the subsequent section of this evidence record.
The source's `force_b` uses the definition `d2 = forceR` and `beta_eq`;
its physical interpretation relies on the unresolved stress calibration.
The exact curvature covariance convention is `YM.Maxwell.normal` from
`Lean/YM/Maxwell/PotentialKernel.lean`, equal to 1/(4 pi^2).

Initial trace-asymptotic review passed ea67b21fa62625532697710fd0ca52bc36facb76deedfae2a2508c9d60bd82d6.
The subsequent removal of its specialized spectral-measure input in favor of
the new proof below passed renewed review at 5153c8ba (full hash in review report). No new external literature search
was needed for these elementary proofs.

## Point-field spectral measure

`trace-spectrum.tex` follows full reads of `Lean/YM/Heat/{Lift,Duration}.lean`,
`Lean/YM/Paley/{Icon,Mapped}.lean` and
`Lean/YM/TraceExtension/{Damping,PolynomialGrowth,Relative,Momentum,Centered,WilsonTrace}.lean`.
Principal declarations: `YM.Paley.empty`, `along_edge`, `heat`;
`YM.OS.Semigroup.heat`, `damp`; `YM.TraceExtension.self_ample`,
`pointState_add`, `pair_restricted`, `undamp`, `damp`, `pair_at`,
`energy_bounded`, `falling`, `spectral_temperate`, `surface_integral`,
`norm_read`, `mass_read`, `weights_injective`, `spectral_forward`,
`spectral_placed`, `trace_turn`, `trace_adj`, `scalar_rail`, `vev_boundary`,
and `traceSpectrum_exists`.

All major steps are proved, using the earlier heat/Gram/slab/boundary and
field representation chapters. No specialized trace positive measure is
assumed. The source's Gaussian boundary-uniqueness proof is preserved. The
forward cone is transferred from actual field PVM measures by Fourier weights
equal to one on compact balls, not asserted for the auxiliary chamber.
Trace scalar/self-adjoint/centered properties remain conditional on the actual
real symmetric tensorial stress and Ward structure, whose construction is
still outstanding. Independent review passed
2f2c16737f123073f07ec3e5132fd4c6df83ad8021d20fa44d2d32aaece494e7.
