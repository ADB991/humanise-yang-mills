# Free-kernel strip-estimate evidence

- Unit: YM-000026, lattice existence construction.
- Status: draft; mathematical and Lean-correspondence reviews pending.
- Imported source revision, recorded in `source/upstream.json`: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Authoritative mathematical text: `manuscript/existence/free-kernel-estimates.tex`.
- This chapter proves the analytic-cube-to-Fourier-strip estimate, finite-residue power counting, and centered-carry difference identity. It gives the actual branch formulas and reconstructs the branch algebra and reciprocal overlap argument. Companion `free-kernel-components.tex` proves the component weights and finite-history train induction.

## Exact input and notation crosswalk

| Article quantity | Formal declaration/meaning | Path | Status |
| --- | --- | --- | --- |
| analytic cube estimate with weight $w_i$ | `Moderate w f := ∃ η C>0, ∀ i, SafeCube η (C*w i) (f i)`; `SafeCube` is differentiability on the complex cube plus a uniform norm bound | `YM.Next.Free.Moderate`, `Lean/YM/Next/FREE_KERNELS/Moderate.lean` | Definition inspected |
| dual wire thread and actual branches | `Flight.wire k P p l`, branching into `Flight.copper` at zero alias and `Flight.stake` otherwise | `YM.Next.Free.Flight.wire`, `Lean/YM/Next/FREE_KERNELS/Wire.lean` | Definition inspected |
| weight $\Gamma_L(l)^{-j}$ | `decay j l = mix l ^ (-j)`, with `mix l=∏_a(1+|lift(l)_a|)` | `YM.Next.Free.decay`, `Lean/YM/Next/FREE_KERNELS/AliasWeights.lean` | Definition inspected; equals article's $\Gamma_L(l)^{-j}$ |
| wire analytic input | `YM.Next.Free.Flight.wire_budget`: `Pay (fun i => decay j (l i)) (fun i p => wire k (F i) p (l i))`, for arbitrary index family of flights and alias sites, $k>0$, $j,t\geq4$ | `Lean/YM/Next/FREE_KERNELS/Cable.lean` | Fully proved source theorem; branch algebra and component powers are reconstructed across the two article chapters |
| entrywise form of payment | `YM.Next.Free.Pay.site` and `.tap`; `Pay` says each fixed matrix entry is Moderate with the named index weight | `Lean/YM/Next/FREE_KERNELS/MatrixPay.lean` | Definition inspected |
| reciprocal overlap for all alias residues | `YM.Next.Free.Secured.relay`, supplied for the wire thread by `YM.Next.Free.secure_both` | `Lean/YM/Next/FREE_KERNELS/Strands.lean` | Fully proved source theorem, built from `Flight.knots_shift`; article uses its exact shift content |
| zero and nonzero branch identities | `YM.Next.Free.Flight.copper_match`, `.stake_match`, `.wire_match` | `Lean/YM/Next/FREE_KERNELS/Wire.lean` | Article gives the finite matrix calculations from the port, notch, latch, hinge, flux, brace, and mouth identities |
| reciprocal shift for wire and pilot | `YM.Next.Free.Flight.knots_shift`, based on `alias_exchange` and `script_shift` | `Lean/YM/Next/FREE_KERNELS/Ends.lean`; `Lean/YM/Next/FREE_KERNELS/Aliases.lean` | Article proves the residue exchange and invariance of the script factors on the common real enlarged cube |
| finite-residue spread | `YM.Next.Free.spread`; coefficient row `meshBook f e u P` | `Lean/YM/Next/FREE_KERNELS/Strands.lean` | Definition inspected. Article rewrites the source formula as an alias average with a word of finite differences. |
| lattice weight absorption | `grade_le_mix`, `absorbs`, `decay_cost` | `Lean/YM/Next/FREE_KERNELS/AliasWeights.lean` | Proved source estimates; article gives the elementary finite-residue bound $81$ directly |
| word factor bound | `YM.Next.Free.differential_bound`; `YM.Next.Free.residue_cost` | `Lean/YM/Next/FREE_KERNELS/Strands.lean` | Proved source bounds. The ordinary derivation in this chapter uses $|e^{iz}-1|\leq |z|e^{|\Im z|}$ and explicitly sums the alias weights. |
| spread estimate from paid symbols | `YM.Next.Free.Secured.propels` | `Lean/YM/Next/FREE_KERNELS/Strands.lean` | Proved source estimate; article presents its quantitative product/sum mechanism from the displayed spread formula. |
| common-width coefficient export | `YM.Next.Free.tapes_sound`, `YM.Next.Free.matrix_cover` | `Lean/YM/Next/FREE_KERNELS/Glue.lean`; `Lean/YM/Next/FREE_KERNELS/MatrixPay.lean` | Proved source estimates; article proves the underlying contour-shift and geometric-sum bound directly. |
| coefficient extraction theorem used in the source proof | `YM.Laurent.Vane.issues` | `Lean/YM/Laurent/Art.lean` | Proved source estimate; article gives a direct four-coordinate contour proof with explicit geometric factor. |
| true fine differences with carries | `YM.Precision.forwardC`; `YM.Next.Free.enters`; `YM.Next.Free.Secured.traverse` | `Lean/YM/PREC/Stacks.lean`; `Lean/YM/Next/FREE_KERNELS/Sprout.lean` | Proved source identities; article derives the symbol identity from the centered lift equation and Fourier uniqueness. |
| finite list uniformization | `YM.Next.Free.Secured.limited_lengths`, `YM.Next.Free.Secured.honored`, using `YM.Next.Free.staple` | `Lean/YM/Next/FREE_KERNELS/Sprout.lean`; `Lean/YM/Next/FREE_KERNELS/MatrixPay.lean` | Proved source estimates; article uses finiteness of words of length at most $j-2$ and minimum width/maximum price. |
| tower cross-kernel | `Flight.duo.T = meshBook (wire k) 2 [] P` | `Lean/YM/Next/FREE_KERNELS/Primal.lean` | Definition inspected; $e=2$ gives the base $L^{-2}$ and one-difference $L^{-3}$ receipts used by the atlas chapter. |
| finite feed and noise feedback | `YM.Next.Free.bind_feeds`, `YM.Next.Free.Train.nozzle_flow`, `YM.Next.Free.Train.D_feedback`, `YM.Next.Free.Train.drive_links` | `Lean/YM/Next/FREE_KERNELS/Feed.lean` | The article rewrites the finite product-site bijection `radices` / `alias_refine` as the mixed-radix decomposition and displays the normalization $(LM)^{-2}=L^{-2}M^{-2}$; the top nozzle contributes one constant feed. |
| reciprocal shift of the two-form script and actual wire | `YM.Next.Free.Flight.script_shift`, `YM.Next.Free.Flight.wire_match`, `copper_match`, `stake_match`, `foot_is`, `bank_mouth`, `portion_field`, `brace_match`, `hinge_transport` | `Lean/YM/Next/FREE_KERNELS/Ends.lean`, `Wire.lean`, `Signal.lean`, `Scripts.lean` | The prose checks the ingredients used by the actual wire's two-form script shift. It does not use the tabE/weights computation from the separate scriptA shift. |

## Wire branch producer ledger

`YM.Next.Free.Flight.wire_budget` is not an axiom or a type-level record
assumption: it is a proof. Its two branch theorems are:

- `YM.Next.Free.Flight.copper_budget`, `Lean/YM/Next/FREE_KERNELS/Cable.lean`: the zero-alias term. The proof combines the foot and flux product, then the brace/latch/mouth product and pulse/latch/tail correction, multiplies by the dual exterior multiplier, and adds the estimates.
- `YM.Next.Free.Flight.stake_budget`, same path: the nonzero-alias term. The proof combines the heart/signal/port-mask/flux/dual-multiplier product and the levy/flux/notch product, then adds them. The alias weight is preserved or weakened by the grade bounds.
- `YM.Next.Free.Flight.wire_budget`, same path: partitions the alias site into zero and nonzero cases and invokes the two branch estimates.

The directly invoked component estimates include `latch_budget`, `mouth_budget`,
`foot_budget`, `brace_budget`, `copper_budget`, `notch_budget`, `levy_budget`,
`stake_budget`, and `wire_budget` in `Cable.lean`. The products further use
`flux_budget`, `sig_budget`, `portD_budget`, and `tail_budget` from
`Buffer.lean`; `heart_budget` from `Heart.lean`; and train bend, bulb, rail,
mass, denominator, and alias controls from the adjoining files. The source
proof uses the closure operations on `Pay` and `Moderate` (sum, product,
scaling, transpose/reversal, reciprocal under a proved lower bound, and
finite branches). The two article chapters reconstruct the lower train-factor
inequalities and the branch identities; their precise source crosswalk is in
`free-kernel-components-evidence.md`.

## Correspondence of the article proof

| Article statement | Formal correspondence | Classification |
| --- | --- | --- |
| Lemma `lem:ex-lattice-uniform-strip-extraction` | `YM.Next.Free.tapes_sound`; analytic coefficient estimate `YM.Laurent.Vane.issues`; `YM.Work.F07.widthRealPart` | New direct Cauchy-contour derivation of the same type of estimate, using a common smaller strip and explicit product geometric sum |
| Bound $\sum_{l\in\Lambda_L}\Gamma_L(l)^{-2}\leq81$ | `YM.Next.Free.decay_cost` | Article proves a concrete dimension-four bound using the one-dimensional integral test |
| Word factor and alias average estimate (equations `ex-lattice-spread-symbol`–`ex-lattice-spread-supremum`) | `YM.Next.Free.differential_bound`, `residue_cost`, and `Secured.propels` | Reorganized quantitative argument; the source uses Pay/Moderate closure to obtain the same $L^{-(e+s)}$ price |
| Lemma `lem:ex-lattice-residue-difference` | `YM.Next.Free.enters` and `Secured.traverse`, based on `Precision.forwardC` | Article derives the exact carry phase and checks the Fourier reindexing |
| Theorem `thm:ex-lattice-wire-tower-strip` | `YM.Next.Free.Secured.bankCost`, `.traverse`, `.honored`; `Flight.duo`; downstream `YM.Next.Free.pledges` | Article proves strip extraction after deriving the wire bound and overlap data in the companion component calculation |

The standard analytic inputs are the one-variable Cauchy integral theorem,
identity theorem, and Fourier uniqueness for an absolutely convergent Fourier
series on the torus. The chapter states and checks the contour movement and
geometric summation explicitly. No outside RG theorem is used.

## Literature and source search

The shared background-note search for `Wilson`, `atlas`, `Schur`, `kernel`,
`strip`, `Laurent`, and `RG` found only `blueprint/background/su2-simplicity.md`,
which does not cover these Fourier-strip estimates. No relevant external
result was needed: the exact contour shift and lattice sum are proved in the
chapter. The nearest source implementation of the analytic coefficient
extraction is `YM.Laurent.Vane.issues`, whose hypotheses (bounded holomorphic
function on a periodic strip) match the smaller-width formulation given here.

## Commands and limits

Read-only inspection commands included:

- `sed -n '1,140p' Lean/YM/Next/FREE_KERNELS/MatrixPay.lean` — definitions of weighted payments, finite product/sum closure, and the entrywise-to-matrix cover extractor.
- `sed -n '1,140p' Lean/YM/Next/FREE_KERNELS/AliasWeights.lean` — the centered-lift polynomial weight, absorption inequality, and uniform residue sum.
- `sed -n '1,150p' Lean/YM/Next/FREE_KERNELS/Cable.lean` — the wire estimate and its zero/nonzero branch proofs.
- `sed -n '1,175p' Lean/YM/Next/FREE_KERNELS/Strands.lean` and `sed -n '1,135p' Lean/YM/Next/FREE_KERNELS/Sprout.lean` — finite-difference symbol and the complete strip receipt extraction to all word lengths.
- `sed -n '1,230p' Lean/YM/Next/FREE_KERNELS/Glue.lean`, `sed -n '1,120p' Lean/YM/Laurent/Art.lean`, and `sed -n '1,145p' Lean/YM/Work/F07/Read.lean` — overlap gluing, Cauchy coefficient majorant, and real-coefficient extraction.
- `sed -n '1,120p' Lean/YM/Next/FREE_KERNELS/Wire.lean` and `sed -n '1,175p' Lean/YM/Next/FREE_KERNELS/Buffer.lean` — dual kernel definition and immediately used weighted component estimates.
- `sed -n '1,180p' Lean/YM/Next/FREE_KERNELS/Feed.lean` — pull-line and drive factors; finite normalized feed, mixed-radix reindexing, train noise and level-response feedback.
- `sed -n '1,220p' Lean/YM/Next/FREE_KERNELS/Scripts.lean` — exact definitions of the two-form script and its scalar branch inputs.
- `sed -n '70,185p' Lean/YM/Next/FREE_KERNELS/Wire.lean` — zero and nonzero branch matching equations and the helper identities used by them.
- `sed -n '70,112p' Lean/YM/Next/FREE_KERNELS/Ends.lean` — reciprocal shift of `scriptA` and `scriptT`; article follows only the actual `scriptT` factors required by the wire.
- `sed -n '1,95p' Lean/YM/Next/FREE_KERNELS/Signal.lean` — signal/hinge definitions and the rail-chip transport identity.
- `sed -n '1,220p' Lean/YM/Next/FREE_KERNELS/Train.lean`, `Bend.lean`, `Chip.lean`, `Reserve.lean`, `Heart.lean`, `Docked.lean`, and `Moderate.lean` — recursive cumulative-filter bounds, positivity, divisor, port, noise, pulse/vault, and cube-budget estimates.
- `sed -n '1,240p' Lean/YM/Next/FREE_KERNELS/Lines.lean` and `sed -n '1,90p' Lean/YM/Next/FREE_KERNELS/Aliases.lean` — one-dimensional box/rail estimates and alias coordinates.
- `rg -n "lemma (flux_budget|heart_budget|tail_budget|portD_budget|notch_budget|levy_budget|sig_budget|foot_budget|brace_budget|mouth_budget|copper_budget|stake_budget|wire_budget|honored|propels|differential_bound|residue_cost|traverse|layout|decay_cost|matrix_cover|tapes_sound|issues)" Lean/YM/Next/FREE_KERNELS Lean/YM/Work/F07 Lean/YM/Laurent/Art.lean` — located component producer declarations.

No Lean or LaTeX build has been run for these edits. The required command
`python3 scripts/check_blueprint.py` was run and exited 1 because this
isolated output directory has no `blueprint/units/YM-000026/unit.json`;
adding shared unit metadata is outside the assigned outputs.
The imported source revision was read from `source/upstream.json`; no separate
nested Lean checkout or alternate source revision is asserted. The component
derivation status is recorded in `free-kernel-components-evidence.md`.
