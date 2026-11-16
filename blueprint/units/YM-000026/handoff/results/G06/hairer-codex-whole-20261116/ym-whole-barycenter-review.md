# Independent mathematics review: joint boundary barycenter

Reviewer: `/root/whole_audit_continuum`, read-only, parent G06 claim6919920698.
Author file: `/tmp/ym-whole-assembly/manuscript/existence/assembly.tex`.
Scope: `prop:assembly-boundary-barycenter`, from its `begin{proposition}` through the subsequent `end{proof}` inclusive. SHA-256 of that exact UTF-8 passage (without following newline): `e8c1752c9a0027b32157327186bdbb95dfd1ef8390b55b0e17e2ace46707ceb1`.

**Verdict: pass.** This is a bounded mathematical review of the added proposition, not approval of the mutable final assembly or all upstream proofs.

The common slab norm bound gives a single gap-power exponent and constant for a fixed tuple, uniformly over all characters. For fixed real times and spatial positions, the complex line `z(c)=iy+ct` stays in the strict time tube on a horizontal strip containing the real axis. At imaginary c near zero the known Euclidean character formula gives continuity and the mixture identity. Common compact bounds, Cauchy's formula, Arzelà–Ascoli and uniqueness on that imaginary interval prove continuity in the character throughout the strip. The constant-line case causes no difficulty. Probability integration preserves holomorphy with these bounds, so the same identity theorem extends the mixture to c=1 and hence all strict interior configurations.

The separate continuity argument gives joint Borel measurability on the compact metrizable character space and the separable position space. The gap bound dominates the joint Schwartz pairing by a constant times its L1 norm; thus Fubini gives the interior tested mixture. The common exact edge-Taylor formula then provides a uniformly integrable remainder, bounded by `C ||D^(m+1)f||_1 / m!`, and a finite sum bounded by the same fixed collection of L1 derivative seminorms. Fubini and dominated convergence yield both the barycenter identity and character continuity on arbitrary joint Schwartz tests. No unproved exchange of a distributional limit with the phase integral occurs.

The arity-zero case and choice of common exponent are handled explicitly. The construction uses the existing field union and phase tables and makes no new ultraviolet or volume extraction.

No source build, Lean correspondence audit, LaTeX build or render inspection was performed by this reviewer. Final integrated-file fingerprints must be recorded after all other assembly edits and checked against this unchanged passage.
