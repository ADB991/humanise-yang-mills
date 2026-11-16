# Findings: C10 part B (non-annulus), session ADB991-claude-20261113-e4d9

`S/` = `Lean/YM/Next/STATIONARY/`. Line numbers refer to the chapter files at `ddc3c90`.

## Required changes

**R1. The determinant identities in `stationary-germ-symmetry.tex` omit the side conditions of their source.**

The text displays `eq:stationary-germ-gauge-det` (l.71) and `eq:stationary-germ-signed-det` (l.97) for arbitrary base points `(V,U)`.

The source lemmas take extra hypotheses:
- `bounty_carry` (`S/Joint/Symmetry.lean` l.93) needs:
  - `R.Bounds`;
  - `Explosives S t 1 U` and `Explosives S t 1 (wages S k u U)`;
  - `0<μ`;
  - analyticity of `canon` at the transformed point.
- `twistWorth` (l.280) needs:
  - `0<μ`;
  - `Explosives` at both points;
  - `Shell S t p R (pull s 0 V) (twistUniform s U)`, where `Shell` (`S/Joint/Gauge.lean` l.163) means that the transformed action is analytic and stationary at the increment origin.

`Explosives` (`S/Joint/Regulator.lean` l.501) is a regularity condition on the frame.

The prose argument says only "near the stationary origin" in the opening paragraph. The signed case in the source uses stationarity at the twisted point. The prose claims "There is no derivative of `T`" and does not explain why that is not needed.

Fix one of two ways:
- (a) State the identities under these conditions: frame regularity at both points, stationarity at the transformed point for the signed case, and `μ>0`. Then note that they hold along the selected branch near zero, which is the only place they are used.
- (b) Prove the signed congruence without stationarity, and record that this is a strengthening of the source.

Neither the use in `stationary-output-construction.tex` nor the summary on l.153–162 is affected, because both evaluate along the stationary branch. The correspondence table also omits `bounty_carry`; add it.

**R2. Records of the hypotheses dropped from packaged data (`part-B/correspondence.md`, `part-B/findings.md`; prose after `prop:inherited-loop-picture` and in the pole chapter).**

The propositions list fewer hypotheses than the Lean lemmas, which take whole `PostCard`/`TicketPost` structures. I checked the English proofs. The proofs of `prop:inherited-loop-picture` and `prop:ex-pole-coefficient-transport` use only the hypotheses listed. So the stronger English statements are supported by the English argument, but they are not machine-checked in that form. The records should say exactly which fields were dropped:
- `bequest` also carries `X.health` (`PriceGap`), `Q.tilts`, `Q.meets`, `X.spun` (`Q.L i = cardHand (mat i)`) and `Q.bare`. The closing paragraph of `inherited-loop-transport.tex` (l.300–304) names only the gap and the "response data". Name `spun` and `bare` there, or in the correspondence row.
- `pole_reduced`/`questPole` also use `Q.tags`, the block-representative choices. The pole chapter's standing data (l.25–44) does not mention representatives. Either add "for the block representatives of the step" or explain why the pole functional does not depend on them.

## Suggestions

- **S1.** The `D_*` constant (classical, l.45): the source constant is `ruffle D = D + 5e^4` (`S/Shape/Rank.lean` l.165). The text has `1+D+5e^4`, which is a harmless overestimate. Either match the source or say where the `5e^4` comes from. Per the source (`S/Films/Site.lean` l.71–91), the factor 5 bounds the symbol `q` on `strip(1)` and `e^4` is a phase cost; the rough-leg estimate is for `j≤1` and needs `η≤1`. As written, the constant has no explanation.
- **S2.** The uniform gap (classical, `prop:ex-classical-stationary-pictures`, hypothesis (1) and l.401–404): the proof uses only `δ_i>0` for each `i`, through invertibility of `M` on each torus. The source `exchangeYield` also uses `X.health i` separately for each `i`. The uniformity "δ independent of i" is not needed here. Either weaken the hypothesis or say that it is carried only for the consumer. The README's note that "three new propositions list only the hypotheses their arguments use" is not accurate for this one.
- **S3.** Volume factor in the contraction (classical, l.311–315 and proof l.374–376): show the one-line count. With unnormalized waves, each cubic covector carries `|Λ|`, and Fourier inversion of `M` contributes `|Λ|^{-1}`. The contraction therefore carries one net `|Λ|`, consistent with `D^4A`.
- **S4.** Gauge flow (classical, l.189–194): `HR=0` needs the gauge flow to fix the coarse variable `x=0`, i.e. to act on internal variables only. Say so.
- **S5.** Germ symmetry, representative independence (l.131–136): the sentence about "the same inherited loop plus `B_t` or `B_r`" is confusing. The argument is shorter: by `j^2 det M = det H_tree det Γ^2` along the branch, `B_t = ½ log det H_tree,t − log j`; the tree Hessians agree as germs and `j` is common. Also, the standing hypotheses on l.13–20 omit the block-size condition (fine side ≥ 100× macro radius, coarse side > 1). That condition appears in `prop:stationary-output-path` and in `actual-reader-tree-covariance.tex`. State whether the tag-independence of `sec:stationary-action-prices` needs it.
- **S6.** The germ-symmetry chapter has no numbered statement. Packaging the summary (l.153–162) as a proposition would make the consumers' citations checkable.
- **S7.** `prop:stationary-output-path`, hypothesis (2)/(3): the source fixes one pair of floor constants for `B` at every `f_k` and one for `C` at every side. Saying "with constants independent of `k`" would match. The block-size clause of `Bid.Larger` is not used in this chapter's argument; say where it enters (germ symmetry / tree covariance).
- **S8.** Pole chapter, l.71: the display ends with a comma and is followed by a new sentence. Fix the punctuation.
- **S9.** Pole chapter, l.125–132: spell out the two facts used.
  - `Q d_0^{fine} = d_0^{coarse} Q_0`, by telescoping along the straight block path and averaging over the transverse weights.
  - On the constant alias, `Q` multiplies by `L`.
  
  Cite the label where the block mean `Q` is defined. Both facts are correct, and the source `anchored` (`S/Loops/HessianMatch.lean` l.477) gives `N_0(0)=inch L • 1`.
- **S10.** `inherited-loop-transport.tex`, l.100: the width `σ' = σ/4` is the source's `surfHeight 1 σ`. A two-leg picture has one independent momentum, so the width rule `η/(2n)` of the classical chapter explains it. Add one clause. Also l.34: give the reason for the constant `4(e^τ+1)`, or just say "a constant depending on τ".
- **S11.** Notation clashes across these chapters: `M` is both the completed matrix and the Taylor bound; `D` is the bridge constant, the lift constant and `d_0(k)`; `F` is both the gauge-fixing map and the inverse bound. These are local, but G05 may want them recorded.

## What was checked (mathematics)

- **Classical vertices.**
  - `HR=0` from invariance and stationarity.
  - `HM^{-1}H=H` (also matches `radiant`).
  - Orthogonality and `Hu=-s`.
  - The fourth-order ray coefficient `D^4/24 + s[u]/4 + u^THu/8 = D^4/24 − s^TM^{-1}s/8`, and the three pairings by polarization.
  - The scale count `μ^{n+q}·μ^{-4}`, including the internal leg: `‖v‖_p≤1` gives normalized `L^2 ≤ μ`.
  - The strip widths `η/(2n)`.
  - The dual-norm momentum conventions in `|s^TVs'| ≤ C_3FC_3`.
  - The price bounds and `M_*` (equals `transition_cap`'s `M`).
  - `N_n=2^n·4B_n`.
- **Germ symmetry.**
  - The orthogonal congruence `T^*MT=M`.
  - The orthogonality of the reversed-link tangent `-Ad_{U^{-1}}`.
  - The increment identity.
  - The regauging and uniqueness argument.
  
  See R1 for the side conditions.
- **Output construction.**
  - The Ward derivation from gauge invariance when lower-degree derivatives vanish, and `n=2` via simplicity.
  - The limit passage.
  - Leading-coefficient matching and orientation averaging.
  - Order 3 for `F_k`.
  - Budgets linear in `M`.
  - The quadratic uniqueness: `f(0)=0`; linear term zero, including the coincident-index cases; colour Schur argument; reflection parity; Ward at `e_x+e_y`; cubic term zero by full reversal.
  - `b_H^{[2]} = ½(|p|^2δ−pp)δ`, so the test value is `½` and `α=2Re f^{[2]}_{11}(e_0)` is the right normalization.
  - The real-wave bound `2d^2|Λ|ε`, with `d=4 dim g` (source `waveBank = 2(card)^2`).
  - That (a)–(d) follow.
- **Inherited loop.**
  - Moments give order two of `r̂`, and two curls give order four.
  - Four differences give `D^2μ^6·μ^{-4}=D^2μ^2`.
  - `DV(0)=0` for the nonlinear pullback.
  - The alias formula.
  - The projection: `D^*N^⊥=0`, `K_fD=0`, the elliptic equation, and the Lagrange identity `|q∧v|^2+|q̄·v|^2=|q|^2|v|^2`.
  - Invertibility from the floor.
  - Ward removal of longitudinal parts on both sides (`k_{-l}(-p) ≡ -k_l(p)`).
  - The principal term.
- **Pole transport.**
  - The linear term `T_{ab,c}` vanishes using unsigned permutations only, with all index cases checked.
  - The alias error bookkeeping at fixed `L`.
  - Nonprincipal amplitudes at zero are pure gauge.
  - `N_0(0)=μI`.
  - `H − L^4μ^2S(μp) = O(|p|^3)` and `L^4μ^4=1`.
  - The triangle inequality for `|α+λ_G log L| ≤ D_0 + C_cmp`, which matches `transition_cap` (`d=|biteCost|+N+1`).

## Not checked

- The cited producers in other chapters: part-A chapters (#143 scope), `soft-curvature-receipts`, `multileg-curvature-lift`, `thermal-contact-cancellation`, the annulus chapters and `path-attachment-producer`. Only their labelled statements were read where they are cited.
- Proofs of the individual transport lemmas in `S/Joint/Symmetry.lean`; `Premise`, `Recorded`/`noteAt` internals; the power 9 in `C_μ`.
- No Lean elaboration (the Mathlib hosts are blocked here).
