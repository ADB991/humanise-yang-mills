# Independent review: tested and shell comparison deduction

Reviewer: `/root/shell_review`; no authorship or manuscript edits. Scope: the paragraph “From chart comparison to the tested and shell limits” and its forward reference in input (4d) in `trace-scribe-producer.tex`. The rest of the chapter is outside this review. Final reviewed file SHA-256: `56ebf795263c42bba04faceb1c92e5fe659e2629475a0adb3b4a299884a2bbe1`.

Verdict: PASS mathematics and textual source correspondence, conditional on the expressly retained same-chart tested approach and compact jet-comparison inputs. This does not discharge the compact jet-comparison theorem itself.

## Mathematics

The tested approach property applies to the differentiated test as well, because that test remains smooth, compactly supported and separated. The finite separating family follows by strictly reducing the common kernel, using the reference separation and smooth-bump argument already exposed in the gallery. These are local deductions from those existing inputs.

For the shell step the gradient support is compact and avoids every fixed insertion point. The shell configurations therefore form a compact subset of the noncoincident configuration space. Each fixed stress component is covered by the explicitly stated order-zero compact comparison. Changing variables in the four-dimensional cutoff-gradient integral gives multiplier `r * r^{-4} * r^{-1} * r^4 = 1`. The finite sum of L1 norms of the cutoff derivatives times the compact supremum errors tends to zero. Finite-dimensional basis expansion then gives operator-norm convergence, sufficient for convergent moving stress tensors. No domination near a collision diagonal is assumed, and no pointwise-to-uniform inference is made.

One required correction was found and applied by the author: the exact shell formula has a minus sign. `eq:scribe-shell-change` and its preceding sentence now use minus the sum, matching the source convention. The absolute-value estimate was unaffected.

## Textual Lean correspondence

Independently inspected the following imported source at pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`:

- `YM.Table.shellGrad`, `Euclid/Stress.lean`: minus a finite sum of four-dimensional integrals against cutoff derivatives.
- `YM.Work.A05.integrate_sheet_scale`, `Work/A05/Window.lean`: cutoff derivative contributes `r^{-1}` and four-dimensional volume contributes `r^4`, giving `r^3` before the external stress factors. This is not a three-dimensional surface integral.
- `YM.Trace.Over.reaches_mutable` and `drape`, `TraceExtension/Chart/Earl.lean`: fixed/moving stress shell convergence on a separated compact window, with the one external factor `r` and the same chart-transformed spectators.
- `Year`, `TraceExtension/Chart/Stage.lean`: `r^4` times entrywise inverse chart. Thus choosing `J_i=r_i^{-4}U_{i,4}H` makes `Year_i(J_i)=H` exactly, verifying the specialized stress normalization in the new paragraph.
- `YM.Next.UVStress.travels_jet`, `window_closed`, and `comparison_jets`, `Next/UV_STRESS/Focus.lean`: uniform compact comparison for fixed finite grade/arity/jet-order budgets from their hierarchy, derivative-plan and approach premises. The manuscript retains this comparison as an input.
- `panels`, `tested`, and `isoPanel` in Station/Invert: the compact comparison uses precisely correlations of chart-transformed labels at rescaled points, without an additional spectator scaling factor.

Manifest hashes matched for the principal inspected files: Earl `ceeddee1928b5877667a011bad1357a79e4019cab2faaf88f8a127919e073127`; Focus `abb3a589bfad409f1eacb3f68e2d8548c29771dacf2900f7cdbb659a9eb411d7`; Stress `a442cd3240a1500e3da8000cf6656d22578f9739ba221b5fa23af77b66c287e8`; Window `732fe096a502ec80a651b2131b118816fc38592071d140d750819d2a86c25684`; Stage `d6475137b9a0d6fb6c93954030b46b5fa0ad380934b2cc3163caeb44b4bc7bf2`.

No Lean elaboration, LaTeX build, or rendering was run by this reviewer. No other chapter claims or dependency closure are certified.
