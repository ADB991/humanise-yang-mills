# Raw terminal supplier and Gaussian reading (#415)

Session: hairer-codex-415-supplier-20261115. Author draft, not independent review.
Claim: https://github.com/hairer/humanise-yang-mills/issues/415#issuecomment-6894241046
Base: db0178a97c9e5d969541fd371f6d18d5cde9be72, after #440/#441/#435.
Source pin: 3456e5e75cf8d4cd558955a5c7638fba2d68f464.

## Mathematical changes

Authoritative text is in `manuscript/existence/actual-rank-purchases.tex`.
Fixes review S1 by defining g and proving the uniform lower bound on z.
Separates the raw curvature polynomial W from its Gaussian reading H.
The physical terminal stamp belongs to W; the Gaussian calculation uses H
and subtracts the same diagonal covariance. The new finite differential-
operator identity proves this conversion for every subset of labelled slots.

Proves the Taylor reader from the original summable regular lists, including
coefficient norm, near jet identity, linearity, real structure, and unit.
Gives the finite-order holonomy-ray estimate and invariant-frame argument.
Proves the healthy raw approximation, explicit threshold payment, and
three-piece terminal decomposition with original masks. Value prices do
not assert derivative bounds or compiler geometric prices.

## Source correspondence inspected

All paths below are relative to Lean/ at the pin above. These are textual
source inspections, not a new elaboration or axiom audit.

- `YM/Next/RANK/ValueVeneer.lean`, `Carried.lean`, `Stories.lean`,
  `LineBox.lean`, `Insiders.lean`: actual regular-list Taylor construction,
  its near/wide projections and calibrated exponential mass bounds.
- `YM/Next/RANK/Peaks.lean`, `Ray.lean`: nonlinear/linear ray comparison
  and axial product error on healthy fields.
- `YM/Next/RANK/Inks.lean`, `RayGate.lean`, `Breeze.lean`: invariant real
  frame, coupling dilation, raw polynomial and its carried evaluation.
- `YM/Next/RANK/Spirals.lean`, `Tilt.lean`, `Post.lean`: healthy raw
  error, StampDuty.coupon versus heater, and the exact masked decomposition.
- `YM.Next.Rank.East.mintingSky`,
  `YM/TraceExtension/Prom/Orion/Eupho.lean`: construction of the same stamp
  and pin from Binding, Makes, ParadeX, order/year and Hail inputs.
- `YM.MergeProof.East.stagingSky`,
  `YM/TraceExtension/Prom/Orion/Plume.lean`: selected-grade invocation
  from LegacyCostSky, including the common finite menu and threshold.
- `YM.Next.Rank.Tapes.West.attireSky`,
  `YM/TraceExtension/Prom/Front/West/Delft.lean`, and its supplier in
  `Tael.lean`: same stamp, solved labels, course and terminal coupons.

The covariance conversion is proved directly as an elementary polynomial
identity. Canonical local-splitting, local-sections, covariance Fourier and
transport, allarity calibration, and marked healthy cumulant chapters were
read alongside the shared literature inventory. No external theorem is
used as an unverified substitute for these source-specific identities.

## Remaining closure obligations

This does not close #415. On the selected family one must still identify
the calibrated regular-list mass, order and column bounds with the input
data used here, and its terminal birth with this same masked near list.
The source assembly passes these through LegacyCostSky / StampDuty; merely
citing that assembly would not prove the manuscript's same-history join.
The raw/Gaussian identity does not identify the nonlinear sector law in
#375. The latter also must retain its cutoff and forest/tag loading.

## Validation

- `python3 scripts/check_blueprint.py`: passes (4 units); structural only.
- `git diff --check`: passes.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`:
  passes; full monograph, 1083 pages. Existing box warnings retained.
- No Lean build or axiom replay; no upstream Lean, shared metadata, or
  historical reviewer record changed.

Rendered pages 893-897 with PDFKit and visually checked all new proofs; no clipping or layout defect found.
