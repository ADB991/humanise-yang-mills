# PR #466: residual representation audit repair

Author session: hairer-codex-466-residual-repair-20261116.
Starting PR head: ddb65cd6d95731f60cd5a31cafa03c8dc16a681e.
Pinned source: 3456e5e75cf8d4cd558955a5c7638fba2d68f464.
Parent #55, bounded dependency cross-claim #53. New prose remains a draft.

## Audit and repair

[Independent review 5920200497](https://github.com/hairer/humanise-yang-mills/pull/466#pullrequestreview-5920200497)
correctly found an inherited missing proof in `prop:actual-marked-figment`.
The earlier completion claim overlooked its explicitly conditional served-residual
input. This response supersedes that completion claim at the affected dependency;
historical reports are retained unchanged.

The authoritative repair is `par:figment-served-residual` in
`manuscript/existence/actual-marked-portfolio-calibration.tex`. It constructs the
full polynomial for the actual field b-C.O(v), without treating b as a label of
the selected family's section:

1. Combine Cream attainment with the negative played attainment. Use their exact
   density and hook identities to identify every terminal mode by telescoping.
2. Construct higher arrays by connected components of background forced factors
   and healthy-vanishing responses. Pay the anchored site bound and spare-three
   support loss, obtaining terminal pitch alpha_N-3 and reserve one.
3. Union the Coupon and Carol wings. Cancel both recentering profiles and explicitly
   pay the upper and lower Tale prices, including lower charge subadditivity.
4. Push the entire polynomial through every same-history door. Apply the full-mode
   R4 input, response closure, half-exponent reweighting and singleton uniqueness
   (strict positivity is proved independently in `prop:selected-reprise`).
5. Preserve coefficient integrals and partition normalization to identify the
   original Wilson residual moment. The existing 2+1+2 vault payment then applies.

The Solaris, original-history attachment, local-estimate and insertion-relay
consumers now cite the proved construction. The phase-grid paragraph points to
its separate two-stage proof `lem:c14-selected-phase-reflection`. The reserve
formula now cites `sec:selected-centered-service`, addressing the minor audit note.

## Dependency boundary and proof reuse

The implication uses the complete stated transition/profile records R1–R7 and
Cream, not just their numerical inequalities. The mathematical interface is
expanded in the new proof using the already established local-transfer anchored
expansion, connected-component closure, forest price and geometric reweighting.
No new served-residual hypothesis is introduced. Upstream nonlinear response,
terminal attachment, history selection and hierarchy hypotheses retain their
existing scope; this is not a new audit of all their suppliers.

The proof reuses the internal results `eq:ope-single-coin`,
`eq:transfer-root-hit`, `eq:transfer-closure`, `eq:ope-forest-price`,
`sec:local-transfer`, and `prop:selected-reprise`. A focused search of the shared
background notes for forest/cluster sources did not identify a more specific
external replacement for this finite marked-polynomial application. No novelty
claim or additional external theorem is needed.

## Review and validation

- A mathematics assistant derived and checked the terminal and adjacent joins.
- A separate reviewer, who did not author or edit the proof, audited the seven-file
  repair and supplied `independent-mathematical-review.md` with SHA256 fingerprints.
- A Luna source assistant traced the narrow Lean producer chain; see the separate
  textual correspondence report. No Lean elaboration was run.
- Full command from `manuscript/`:
  `/Library/TeX/texbin/latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym466-repair-build existence.tex`.
  Result: success, 1199 pages, no undefined or multiply-defined references.
  Existing layout and duplicate PDF-destination warnings elsewhere remain.
- PDFKit rendered and parent inspected new proof pages 702–705: formulas and text
  are legible and within the page; terminal/mode/transition/moment displays checked.
- `python3 scripts/check_blueprint.py`: pass (structure only).
- `git diff --check`: pass.
- The initial build invocation from repository root failed because the TeX entry
  point is in `manuscript/`; the corrected command above completed successfully.
- Lean, pinned dependencies, shared integration files, historical evidence and the
  user's working PDF are unchanged. No merge, issue closure or human acceptance.
