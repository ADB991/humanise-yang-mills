# C10 source-leakage review: correspondence

**Verdict: no required correspondence correction in rows 120–128.** Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; target and comparison base are frozen in `inputs.json`. Source was inspected as text, not elaborated. No axiom audit, full theorem check, or all-C10 approval is claimed.

Row 120 was checked beyond the author's admitted dependency-access limit. `YM.Bloch.Row.acts` in `Lean/YM/CellFourier/Circulant.lean` is the real entrywise tsum with the residue indicator. `YM.Bloch.Row.read` complexifies each real coefficient and calls `YM.Laurent.read` in `Lean/YM/Laurent/Eval.lean`. The latter sums `mode p i • f i`; `YM.Laurent.mode_constant` gives `mode 0 i = 1` (distinct from `mode_zero`, which fixes the lattice argument). `YM.Precision.Bed` and `YM.Precision.Floor` in `Lean/YM/PREC/Stacks.lean` introduce no hidden convergence requirement for arbitrary beds; `Floor.starts` uses the totalized zero-mode value. Strip bounds supply absolute convergence where the manuscript actually uses the symbol.

The exact Mathlib revision is `81a5d257c8e410db227a6665ed08f64fea08e997`, read from `Lean/lake-manifest.json`. The local dependency source was absent, so the following primary files were fetched through GitHub's immutable Git blob API and inspected:

- [InfiniteSum/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/81a5d257c8e410db227a6665ed08f64fea08e997/Mathlib/Topology/Algebra/InfiniteSum/Defs.lean), lines 75–168: `HasProd`, `Multipliable`, `tprod`, their `to_additive` sum counterparts, and the unconditional notation. The finite-subset filter defines unconditional convergence; failure of summability selects zero in the additive definition. In the Hausdorff real/complex spaces the sum is unique.
- [FiniteDimension.lean](https://github.com/leanprover-community/mathlib4/blob/81a5d257c8e410db227a6665ed08f64fea08e997/Mathlib/Analysis/Normed/Module/FiniteDimension.lean), lines 595–623: `summable_norm_iff` assumes a real normed space of finite real dimension and gives equivalence of summability and summability of norms. This applies to the actual real entries and complex entries (and finite matrices); no infinite-dimensional absolute-convergence equivalence is being asserted.

Git blob IDs and SHA-256 fingerprints of both downloads are in `inputs.json`. The author's “not opened” statement remains an accurate report of its own checks; this independent review supplies the additional evidence without editing that record.

For rows 121–124, the source names and composition pointers remain in author-record (b)–(d) and existing part-B correspondence. The changed prose does not purport to close the response conversion. The two-wave and same-data paragraphs were checked at their immediate manuscript interfaces; the whole HorizCalc proof was not re-audited.

For row 125, the amplitude convention is now internal to the prose. Author-record (e) correctly retains the earlier **partial, statements-read** status of `carry_plan`/`carryRow` and `HessianMatch.lean`; this review does not upgrade it.

For rows 126–128, inspected `YM.Stationary.PostCard` in `Lean/YM/Next/STATIONARY/Films/TraceDifference.lean` (470ff), `YM.Stationary.TicketPost` in `Films/LeadingRay.lean` (771ff), and `YM.Stationary.Scud` in `Level/Transition.lean` (26ff). The fields `bare`, `tilts`, `meets`, `spun`, `health`, and the `critical`/`wind` pair agree with the retained caveats. The immediate `pole_reduced` use in `Loops/HessianMatch.lean` (719ff) was read as context, not certified as an independent proof. Revision-3's dropped-hypotheses explanation is preserved in author-record (f). The fact that a package has extra fields is distinguished from a claim that the English theorem assumes those fields.

No Lean, author record, manuscript or shared metadata was edited. These findings apply to the exact frozen inputs only; human acceptance remains unset.
