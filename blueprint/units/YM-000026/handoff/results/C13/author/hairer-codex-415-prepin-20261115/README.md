# Issue 415: polynomial pre-pin and scale-dependent Wick bounds

Session: hairer-codex-415-prepin-20261115 (Codex for Martin Hairer).
Claim: https://github.com/hairer/humanise-yang-mills/issues/415#issuecomment-6893273068
Base: 90e6883a89182324a97f6cee20db146a6fe7c006, codex/existence-monograph.
Source pin: 3456e5e75cf8d4cd558955a5c7638fba2d68f464.
Status: author draft; no independent review or human acceptance. Issue remains open.

## Results and limits

The new LaTeX lemmas prove the finite sampling / near-wide pre-pin reduction, its subpower payment, and the Wick pin and primal bound with the source's growing B=H^(1/(4(D+2))). They do not assume B stays bounded. Polynomial pre-pin error must be multiplied by the fixed frame constant before it becomes a coefficient-vector error. The dilation z=theta/g sends the signed covariance to z^(-2) Gamma; the source Gaussian operator has a positive exponential sign. Negative covariance gives normal ordering.

The earlier abstract reduction remains correct under its own hypotheses. Its proposed application was not yet supplied. In particular its coefficient-space pre-pin is not literally MarkedStart clause 4, which is a polynomial-space estimate.

## Inspected source correspondence

All paths below start at `Lean/YM/Next/RANK/`; all declarations have prefix `YM.Next.Rank.`. This is textual inspection, not elaboration.

| Output / input | Declarations and paths | Correspondence and status |
| --- | --- | --- |
| Finite jet sampling | `Spindle.kiosk`, `RayGate.lean` | Fixed finite evaluations control polynomial coefficients. Manuscript proves this by finite-dimensional duality. The quantitative ray bounds in kiosk remain application inputs. |
| Near/wide bound | `Spindle.WRead`, `Spindle.tallied`, `ValueVeneer.lean`; `Spindle.drift`, `RayGate.lean` | Near cost 3 beta M, wide cost expCut beta M. The manuscript proves exactly their triangle/sampling step. |
| Exact near reading | `Spindle.purchase_pin`, `Spindle.industry`, `Spindle.sumsKey`, `Carried.lean` | Uses actual calibrated local sections, regular remainder vanishing, summable coefficientwise Taylor lists and a nonwrapping Provision. The abstract lemma labels this input explicitly; it has not been instantiated from the current chapters. |
| Taylor-reader production | `Spindle.machine`, `ValueVeneer.lean`; `Spindle.Teller.charge`, `Stories.lean` | Reader exists from the two Wrapper receipts, at order D+1; uniqueness of Taylor coefficients supplies linearity, reality and unit. No claim that the current coordinate-recovery chapter proves this. |
| Pre-pin payment and degree | `Spindle.prototype`, `Spindle.checks`, `Spindle.setter`, `Spindle.shrank`, `RayGate.lean` | alpha=shade(D), gamma=alpha/4; column budget, dimension price and ray price each cost H^gamma. dustAt costs at most (1+4b)^D. Plain coefficient cost <=4H^(3gamma); polynomial error <=2H^(3gamma-4). Source prototype chooses nonlinear defect T=0 after ordinary radial conversion. |
| Wick pin / primal | `LiftMark.pins`, `Rails.lean`; `LiftMark.stock`, `Pin.lean`; `LiftMark.terms`, `RailsPrice.lean` | Manuscript uses w_D=(D²/2)exp(D²/2) instead of source's (2(D+2))^D. D is fixed, so the same negative powers pay either constant. Frame cost is applied after polynomial comparison. |
| Signed Gaussian operator | `Normal.cream`, `Normal.feeds`, `Normal.milk`, `Gaussian.lean` | `milk Q(X_i X_j)=X_i X_j+Q_ij`, so it is the positive-sign Gaussian operator; normal ordering uses negative covariance. No positivity required. |
| Frame closure | `Spindle.Stamped`, `Spindle.caressed`, `Inks.lean` | Requires real covariance and adjoint-invariant restricted covariance, as well as invariant Taylor reading; not implied by covariance smallness alone. Still an explicit application input. |
| Terminal stamp | `Spindle.fusible`, `Spirals.lean`; `Edition.Ticket`, `Post.lean`; `Ribbon.forge`, `Ribbon.StampDuty`, `Tilt.lean` | Ticket is a healthy-field VALUE approximation of nearHol by signet(W), with support and reliability. It is not just the coefficient norm of the Wick heater. The same un-Wicked W produces both this ticket and the heater. Matching it to manuscript (T4) remains open. |

## Precise remaining work (not a completion claim)

1. Instantiate the near/wide summaries and ordinary-ray comparison for the selected history: `machine` → `purchase_pin` / `kiosk` → `drift`. The finite-difference recovery of a closed cochain in allarity-coordinate-calibration does not identify the actual masked insertion's Taylor polynomial. Its linear algebra alone cannot close this gap.
2. Verify the column (`year`), Taylor order, Provision and coordinate-substitution purchases on this trace endpoint, uniformly for every late k, N>=k and p. The new corollary proves the numerical consequence, not these purchases.
3. Supply `Stamped` on the actual covariance atlas, including invariant-frame closure and real structure. Retain the signed covariance and coupling dilation checked here. `Hail` in Tilt includes both Stamped and the tin covariance bound.
4. Match `Ticket` for raw W to the terminal input used by the marked comparison, rather than asserting it for the Wick heater from its primal bound. `forge` also requires the restarted threshold tau, B=walls, q>=8 and D+1<=order. These are separate same-data identities.

This is the concrete block to closing #415: neither these identities nor independent review are provided by the three new elementary lemmas. The source proves them in its own interfaces; the corresponding complete manuscript supplier and join have not been established here. No claim of a flaw in the Lean source is made.

## Literature / dependency search

Read blueprint/background/README.md and searched the shared background inventory and the calibration, primary-calibration, regular-principal, local-source-stability and marked-launch chapters. No external theorem would identify the particular regular insertion and its masks. The new finite-dimensional sampling, monomial and exponential estimates are proved directly. Source-specific Taylor-ray inputs remain explicitly identified, not replaced by a generic citation. Historical reviews of #416/#428/#432 are preserved at their original scope; they do not approve these new lemmas.

## Validation

- `python3 scripts/check_blueprint.py`: passed (4 units; no mathematical/Lean verification implied).
- `git diff --check`: passed.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` in manuscript: passed, 1073 pages. Full build used to resolve cross references. No new Lean build or axiom audit.
- First local fetch was denied writing the original .git/FETCH_HEAD; isolated clone succeeded. Network SSH fetch from that clone failed DNS. GitHub plugin confirmed the edited source file on the live base branch has the same blob as the starting clone (971cc2750cd1a1851b487208b1bcbeddca9699bb). Submission uses the plugin.
- An initial patch command used the wrong working directory and made no edit; corrected before final build. An initial PDFKit render overlapped a rebuild and failed to open the PDF; retried after build completion.

- Final PDFKit render succeeded; pages 884–886 visually inspected, with no clipping or missing mathematical references in the new text.
