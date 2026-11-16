# Joint guarded principal moments and polynomial transport (#375)

Session: hairer-codex-375-transport-20261115. Author draft; independent
mathematical and source correspondence review required.
Claim: https://github.com/hairer/humanise-yang-mills/issues/375#issuecomment-6894413110
Base: db0178a97c9e5d969541fd371f6d18d5cde9be72.
Source pin: 3456e5e75cf8d4cd558955a5c7638fba2d68f464.

## Outcome

Authoritative mathematics is in `allarity-marked-propagation.tex`.

- Corrects the proposed requirement that the compensated map be affine.
  It is nonlinear; an exact cutoff-reference/polynomial-history equality
  is not supplied by changing Gaussian variables.
- Proves a one-step transport-defect alternative, so prescribed polynomial
  inputs can be retained rather than iterating nonpolynomial cutoff outputs.
- Gives the source-following alternative: one joint probability law per
  tag, individual guards of lost mass epsilon squared, shared Gaussian
  curvature array, physical coordinate error epsilon, and joint covariance
  error epsilon. The empty moment is exactly one. There is no division by
  the mass of a particular insertion's guard.
- Proves product-guard loss, physical-to-affine product error, the L2
  failure correction, covariance pairing comparison, mixture averaging,
  and finite moment-to-cumulant comparison. Constants do not count unused
  coordinates. The prescribed short covariance may be signed.
- Gives explicit monitor-power payment: if A,B <= H^c, choose f greater
  than q+c times the degree of the fixed price polynomial, then epsilon
  <= H^(-f) pays the requested discrepancy. This matches the source's
  monitor allowance; it is not incorrectly assigned a negative coupling
  exponent.
- Attaches the guarded law to the canonical joint reader model and
  dawn selection on constant-order plateaux, and to the principal-only
  component in the actual mixed compiler, retaining their same-data
  and prior-purchase hypotheses. Full interacting sector density is
  explicitly distinguished from that component law.

## Source investigation and correspondence

A user-authorized cheaper Luna subagent performed read-only source
tracing in a separate clone, session `/root/source375`. It wrote no files
or GitHub comments and did not review this draft. The parent inspected
the key declarations below and authored/integrated the proof.

All paths below are relative to `Lean/` at the pin above.

| Declaration | Path | Role |
| --- | --- | --- |
| `YM.Next.Rank.Tapes.West.MuralSky`, `StageNowSky`, `planterFtSky`, `pFt_oneSky` | `YM/TraceExtension/Prom/Front/West/Mural.lean` | Same measure/vector/field for all readers; per-reader guards; mixture unit exactly one. |
| `YM.PhysicalNext.InteractingRank.e_xposeSky` | `YM/TraceExtension/Prom/Front/West/Expose.lean` | Constructs the joint model from Dawn, room and chart receipts; `faithfulSightSky`, `screensSky` and `shade_auth` are retained suppliers. |
| `YM.PhysicalNext.InteractingRank.Soft.SpearSky.a_pprove` | `YM/TraceExtension/Prom/Front/West/Horns.lean` | Finite Streak mixture; shares are nonnegative and sum one. |
| `YM.Next.Rank.Tapes.Guarded`, `guards_mul`, `squareFits`, `escaped` | `YM/Next/RANK/Guard.lean` | Product loss and polynomial second-moment failure estimate. The draft uses Cauchy--Schwarz instead of the source's Young inequality; same epsilon order. |
| `YM.Next.Rank.Tapes.West.goalieSky`, `jesterSky`, `t_wornSky` | `YM/TraceExtension/Prom/Front/West/Pair.lean` | Product guards and arbitrary finite lists of principal polynomials; not restricted to two markers. |
| `YM.Next.Rank.Tapes.West.festivalSky`, `e_facadeSky` | `YM/TraceExtension/Prom/Front/West/Beluga.lean` | Actual polynomial Lead versus atlas Lead, then actual curvature versus a closed cochain; combines errors using Caff.hiatus. |
| `YM.Next.Rank.Tapes.West.ChastSky`, `claspSky`, `legionSky` | `YM/TraceExtension/Prom/Front/West/Residual.lean` | All-arity middle-level comparison, componentwise error bill(-3/2), not exact reference equality. |
| `YM.Next.Rank.Tapes.West.PleaFtSky` | `YM/TraceExtension/Prom/Front/West/Throne.lean` | Compiler principal coefficients identified with the same joint planted moments. |
| `YM.PhysicalNext.InteractingRank.Soft.galaFtSky`, `billing_XSky` | `YM/TraceExtension/Prom/Front/West/Muse.lean`, `PayW.lean` | Upper compiler and whole-window billing still consume TimeBand/Caff, Coupler, Kiln and other actual receipts. |
| `YM.PhysicalNext.Repeat.Mercury.radiance`, `pop6`, `pop9`, `trove` | `YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mercury/Oasis.lean`, `Glow.lean`, `Radio.lean` | Singleton nonlinear comparison; not substituted for the all-arity joint law. |

The source route through `s_in_stalls_ftSky` / `s_foliated_ftSky` in
Moon/Ballast was located by the subagent; these source details are not
claimed to have received an independent review. The parent used the
canonical `actual-mixed-marked-compiler` principal-only product and
guard split for the mathematical attachment.

## Precisely what remains

This PR does not close #375. The plateau attachment retains the hypotheses
of `actual-reader-dawn-selection` and `actual-mixed-marked-compiler`.
The former explicitly assumes J(i+1)=J(i). To cover a changing stage,
the corresponding pair-indexed actual mean/covariance, guard, pose and
room construction must be supplied on the same course; the numerical
stage-boundary estimate does not construct it. The upper compiler must
also be applicable at e*=e+1+sigma, with its body, all-hole and joint
warning estimates. Terminal launch still uses the same StampDuty/raw
polynomial and calibrated-family attachment tracked in #415/#442.

The former common-cutoff (M)/(CI) route is retained as a sufficient
alternative, not advertised as the actual source's normalization.
No need to prove that the full interacting measure is Gaussian, or that
the nonlinear compensated map is affine, remains in the new route.

## Integrity and checks

Shared background inventory and the canonical Gaussian, reader, mixed
compiler and marker-algebra chapters were consulted. The new arguments
are finite Gaussian moment and polynomial calculations proved in full;
no unverified literature citation replaces a source-specific join.
No Lean code, shared unit metadata or historical review record changed.
No Lean elaboration or axiom replay was performed.

Validation on the base plus this PR alone (without #442):
- `python3 scripts/check_blueprint.py`: PASS, 4 units.
- `git diff --check`: PASS.
- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`: PASS, 1083 pages.
- Rendered the changed region with PDFKit; inspected the final guarded-law
  statement, proof, corollary, plateau attachment and remaining-input list
  on pages 806--809. Earlier changed pages were inspected during drafting.
- Live #375 comments rechecked immediately before submission: no intervening
  overlapping claim.

`hashes.json` records SHA-256 hashes of the manuscript, canonical suppliers,
 and the main inspected source files. No independent approval is asserted.
