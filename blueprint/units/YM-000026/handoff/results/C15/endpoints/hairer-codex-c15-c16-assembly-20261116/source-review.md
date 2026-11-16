# #337 final source-correspondence review

**Verdict: PASS (correspondence only).** I reviewed the six changed manuscript files against the pinned source interface `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. This is not a mathematical-validity review, Lean build, or axiom audit.

## Source correspondence

`YangMills.Hierarchy.TraceTest` in `Lean/ChallengeSpec.lean` states four clauses: the vacuum one-point functional of the grade-four `T.centeredTrace` field vanishes for every test function; the coefficient `3 * finrank ℝ g.lieAlgebra / pi^4` is positive; the selected two-point function at `timePair r` has the stated `r^8 (log r⁻¹)^2` limit; and it is not eventually equal near positive zero to any finite complex combination of `wickProfile` terms. The new `thm:trace-selected-endpoint` matches these endpoint quantifiers and normalizations: it uses the selected phase, the time-axis pair `(-r/2,+r/2)`, and the same coefficient. The manuscript's profile class also matches the source `Mode`/`Track` class: nonnegative mass, natural spatial/time orders, continuous real numerator positively homogeneous at positive scales, Lebesgue momentum integral, the `1/(2E)` kernel factor, complex finite coefficients, and empty products/sums.

`YangMills.publicTrace` in `Lean/TraceBridge.lean` is an adapter: given `Headline.TraceExclusions`, it supplies `TraceTest`, rewriting the internal award to the public coefficient, identifying `traceTwo` definitionally with `euclidean F`, and deriving finite-profile exclusion from the short-distance limit and positivity. It does not itself prove the physical stress construction or select a phase. The manuscript's proof order—construct/center the physical trace, establish its asymptotic, then apply profile exclusion—is compatible with that adapter's interface.

The fixed-choice quantifiers in the source's `YM.Trace.Over.Gallery.lead` (`Lean/YM/TraceExtension/Chart/Line.lean`) and `Scribe.meters` (`.../Chart/Time.lean`) are represented faithfully in the revised supplier discussion: the hierarchy/filter/arch are fixed before each arbitrary positive null sequence, and the resulting same `J`, `V`, and filter are used for the scribe receipts. The edited receipt is correctly described as a corollary applying `prop:allarity-selected-application`; references in the comparison/gallery chapters were updated accordingly. The added allarity paragraph identifies the leading guarded component and avoids equating the full interacting density with a Gaussian law. The assembly now states the trace consequence for the canonical selected data while retaining separate OPE and joint-construction obligations.

## Canonical field mapping

The designated public field is explicitly the manuscript's canonical physical centered stress field in the actual construction. `YangMills.HierarchyBridge.hierarchy` assigns `centeredTrace := TraceExtension.center F`. `YM.TraceExtension.WilsonTrace.center` defines this as `theta (selected F) F.sector.energy`; `YM.TraceExtension.Centered.theta` is `centerIn` applied to `stressTrace F.sector.energy`, and `stressTrace` is the diagonal sum of the stress tensor. Thus the selected phase and centered grade-four physical field in the new manuscript theorem have a direct canonical source mapping, rather than an unassigned generic `TraceTest` field. The bridge's hierarchy correlation is `S.useAt (spectator F s)`, with selected phase `F.α.atPoint`; `TraceExtension.WilsonTrace.euclidean` uses that selected phase and the same `center F`. `YangMills.publicTrace` identifies `traceTwo` definitionally with this Euclidean correlation. The endpoint's `timePair` is the same time-axis pair with separation `r` (up to the source's coordinate convention), so the field/correlation mapping is coherent. The source bridge remains an adapter for the resulting endpoint properties; it need not prove the physical field identification, because `HierarchyBridge` makes that assignment.

## Scope and evidence

Read `AGENTS.md`, `docs/proof-standard.md`, `/tmp/ym337-source.md`, the six diffs, and the relevant source declarations in `ChallengeSpec.lean`, `HierarchyBridge.lean`, `TraceBridge.lean`, `YM/TraceExtension/{Centered,WilsonTrace,Endpoint}.lean`, `YM/Nonperturbative/HeadlineSpec.lean`, `Chart/Line.lean`, and `Chart/Time.lean`. Current checkout `HEAD` is `e9ea7c447ef33913191ed9c54dbd31dd841ea47d`; it is downstream of the pinned Lean source. No Lean command or build was run.

Final SHA-256 fingerprints:

| File | SHA-256 |
|---|---|
| `manuscript/existence/allarity-marked-propagation.tex` | `9030d41790512dc16f355b98dd9945870748564f36a4617c632f89c95bcda527` |
| `manuscript/existence/trace-rounded-receipt.tex` | `590561d0e7c2ce71547a33c7f82027ceb4d991b1f24177c105bace048d1c54ce` |
| `manuscript/existence/trace-rounded-comparison.tex` | `8360f3629419de3af0b26d76f242e8802772481dab7ff5c372465f90cc93a59e` |
| `manuscript/existence/trace-firesky-gallery.tex` | `5540d18101efb0f10e898f3833b75ca717ccbb19134d4d2bc6f3231827d4d1a1` |
| `manuscript/existence/trace-asymptotic.tex` | `ce567e5b7e87ce15d5e6b773b2ace76fee844daa5ed55043cb2a6fc7247742f2` |
| `manuscript/existence/assembly.tex` | `ad82f1b165c2679465dd6325c35f8349b4c94df0e8395852847dca7aae65c2fd` |
