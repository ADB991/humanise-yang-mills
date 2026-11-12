# C01 review, part 2: Lean correspondence

- Package: C01 (issue #42), author draft PR #81 at `165fb24`; changes `git diff 18d0327 HEAD`.
- Part 2 scope: `manuscript/existence/free-kernel-estimates.tex`, `free-kernel-components.tex`, `kernel-transport-identities.tex`, plus the evidence files `blueprint/units/YM-000026/free-kernel-estimates-evidence.md` and `free-kernel-components-evidence.md`, and the rows of `handoff/results/C01/RESULTS.md` that name these chapters.
- Source: pinned upstream `3456e5e75cf8d4cd558955a5c7638fba2d68f464` under `Lean/`. Declarations were read in the source; nothing was elaborated or built.
- Role: Lean correspondence (review question II). Reviewer session `schmittj-claude-c01-review-20261112`; Claude agent. No human acceptance is recorded.

## Summary

All cited declarations exist under the stated names and paths. I opened about 150 declarations (table below) and read their exact types and the definitions that determine their meaning (`Flight`, `Train`, `wire`, `copper`, `stake`, `pilot`, `scriptA`, `scriptT`, `spread`, `meshBook`, `forwardC`/`advanceC`, `Secured`, `Pay`, `Moderate`, `SafeCube`, `Row.strip`, `tape`, `levelD`, `bulb`, `bend`, and others). The manuscript's definitions of the dual stencil, its branches, the residue symbol, the carry, the train recursion and the transport columns agree with the source term by term. The main theorem `thm:ex-lattice-wire-tower-strip` matches `YM.Next.Free.Secured.honored` and in fact needs fewer hypotheses: it does not use the reality field `pearl`. The PR #81 statement that it "corrects the free-kernel source anchors" holds for the anchors that concern these chapters. Two correspondence defects matter: the source theorem `Flight.pilot_cost`, which feeds the A₀ strip receipts, has no counterpart in the manuscript (L1), and the installed display omits `Inputs.primal`, which the ledger nevertheless lists (L2). The rest are minor.

## Findings

### L1. GAP. `YM.Next.Free.Flight.pilot_cost` has no manuscript counterpart, although the manuscript relies on its consequence. Manuscript; pre-existing.

Location: `kernel-transport-identities.tex` lines 136–137, 187–193; `free-kernel-estimates.tex` lines 624–626, 633 (added by PR #81); `free-kernel-components.tex` (no statement). Same defect as M1 in `part2-mathematics.md`.

Inspected evidence. `Lean/YM/Next/FREE_KERNELS/Strands.lean`: `secure_both (k) (hk : 0<k) (hj : 4 ≤ j) (ht : 4 ≤ t) : Secured (Flight.pilot k) ∧ Secured (Flight.wire k)`. Its `pay` field for the pilot is `Flight.pilot_cost` (`Docked.lean` line 103: `Pay (fun i => decay j (l i)) fun i p => pilot k (F i) p (l i)`). The proof of `pilot_cost` uses `ahead_cost`, `gains_cost`, `sluice_cost`, `sig_budget` and, through `abide_firm` (`Buffer.lean`), a lower bound for $sa$. `Lean/YM/Next/FREE_KERNELS/Priced.lean` line 51 applies `Secured.honored … 1` to the pilot (the A₀ receipt, $e=1$) and line 52 applies `… 2` to the wire. `Flight.duo` (`Primal.lean`) sets `A0 := meshBook (pilot k) 1 [] P` and `T := meshBook (wire k) 2 [] P`. The manuscript proves the analogue of `wire_budget` (`prop:ex-lattice-wire-entrywise-bound`) but not of `pilot_cost`, while `kernel-transport-identities.tex` line 193 calls the pilot column "already estimated", and `rg-horizon-geometry.tex` lines 290–296 uses the resulting $L^{-(1+r)}$ A₀ receipts. The identity part does correspond: the regular form $B_l+\operatorname{diag}(g_{l,a})x_l\sigma$ is exactly `Flight.pilot = ahead + mask 1 (gains) * signal L 0 (aliasAt p l) * sluice` (`Pilot.lean`). Here `ahead` is $B_l$ (with `span • portD` for $l\ne0$ and `bulb(toe)` for $l=0$), `fled`/`rests` are the gains of lines 176–184, `abide` is $sa$, and `sluice` is $\sigma$.

Requested change: add the pilot-column estimate as a lemma corresponding to `Flight.pilot_cost`, or as an explicit input that names it. Record it in `free-kernel-components-evidence.md`.

### L2. INACCURACY. The installed display omits `Inputs.primal`, which the ledger lists. Manuscript (pre-existing) and RESULTS (PR #81).

Location: `kernel-transport-identities.tex` lines 260–274; `RESULTS.md` edge `C01-original-transport-identities` ("gives the original primal, curl and dual identities") and its source line `YM.Next.Free.Flight.{tangent,scaled_tri,scaled_mul,adjust_adj}`.

Inspected evidence. `Flight.tangent` (`Primal.lean`) concludes `Inputs S A ((record W).acts f) ((record W').acts c) ∧ T.transpose * d 1 f = d 1 c * mean S ∧ T*((record W').acts c)*d 1 c=(record W).acts f*d 1 f*A`. `structure Inputs` (`Lean/YM/PREC/TreeMatch.lean` line 76) has the fields `primal : K H*W=(mean S).transpose*K H'` and `dual : mean S*W=1-S.kernel.penalty⁻¹ • K H'`. The manuscript display gives the curl, the $T$ intertwining and the dual identities. The primal one, which corresponds to the first identity of `scaled_tri` (`rotor 1 k P.wing q * A = Q*rotor 1 k P.land p`), is proved in punctured form (eq. `transport-punctured-three`, first identity) but never stated in installed form. The English is therefore weaker than `tangent`, and RESULTS overstates what the label contains.

Requested change: add $d_{1,f}^{\mathsf T}H_fd_{1,f}A_0=Q^{\mathsf T}d_{1,c}^{\mathsf T}H_cd_{1,c}$ to the display, or correct RESULTS.

### L3. INACCURACY. The transport chapter cites the wrong object for the covariance $D_{v,a}$. Manuscript; pre-existing.

Location: `kernel-transport-identities.tex` lines 16–19. The diagonal entries must be `Train.levelD k v a` (scaled by `scaleD`), as in `Flight.scriptA`/`scriptT` (`Scripts.lean`, through `fieldD`). They are not `Train.drive`, which is what $D_{v,a}$ denotes in `free-kernel-components.tex` line 59. Same as M5.

### L4. NIT. The evidence file misstates the formal price of the second nonzero-branch term. Records (evidence file, not changed by PR #81).

Location: `free-kernel-components-evidence.md`, paragraph after the table ("Its second term has weight `grade(l)^(-4) * mix(l)^(-j)`"). In the source, `levy_budget` (`Cable.lean` line 73) has type `Moderate (fun _ => 1) …`: the levy is priced at one, and `stake_budget` multiplies it with `flux_budget` (`decay j`) and the notch (weight one). The stated weight is a true upper bound, but it is not the formal price, as the same paragraph's parenthesis ("before raising its price to one") concedes. Suggest: "formally priced `decay j (l)`, after the levy is raised to price one".

### L5. NIT. A different but valid proof route for `lem:ex-lattice-residue-difference`. Manuscript; the PR #81 restatement is correct.

`Secured.traverse` (`Sprout.lean`) proves `advanceC P.L (meshBook f e [] P) u = meshBook f e u P` by reading symbols back (`bankRead`, which uses the `pearl` reality field through `palette`/`record_eq`) and then `RRead_injective`. The manuscript instead identifies Fourier coefficients directly and takes real parts, which needs no reality. Both are valid. The recursion and carry conventions agree exactly: `advanceC (i::l) = forwardC (advanceC l) i`, and `forwardC` subtracts `step i` exactly when `lift a.1 i = L/2`, which is the manuscript's $c_a(r)$ and the atlas chapter's $\epsilon_a(r)$. `enters` is the manuscript's symbol identity at line 213.

## Correspondence of the main statements

| Manuscript statement | Lean declaration(s) | Matched? | Notes |
| --- | --- | --- | --- |
| `lem:ex-lattice-uniform-strip-extraction`, eqs. `wire-coefficient`, `wire-width` | `YM.Next.Free.tapes_sound`, `hol_on_thickening`, `YM.Work.F07.widthRealPart` | Yes | The source takes width $b=\min(\theta,\eta)/3$ and $h=b$; the constant $(2(1+b)/b)^4$ is identical. The source takes the min of analytic and overlap widths (cf. M8). |
| Bound $\sum\Gamma^{-2}\le81$ | `decay_cost` (statement only) | Yes (existence) | The manuscript proves its own explicit constant. |
| Eq. `ex-lattice-spread-symbol` | `YM.Next.Free.spread` | Yes | `mode (aliasAt p i) (lift r)`, `toll L e = L^{-e}`, `listChip`, `chip z = exp(iz)-1`. |
| Eq. `ex-lattice-spread-supremum` | `Secured.propels`, `differential_bound`, `residue_cost` | Yes | Same hypothesis `u.length ≤ j-2`. The source phase bound is $e^{4\,\mathrm{zone}}$ and the manuscript's is $e^{2\eta}$; both are uniform. |
| `lem:ex-lattice-residue-difference` | `carryStep`, `cover_step`, `enters`, `Secured.traverse`, `YM.Precision.forwardC`, `advanceC` | Yes | See L5. |
| `thm:ex-lattice-wire-tower-strip` | `YM.Next.Free.Secured.honored` (with `bankCost`, `limited_lengths`, `staple`) | Yes; the English needs fewer hypotheses | `honored` assumes `Secured f` (pay, relay, pearl) and `4 ≤ j`. The English assumes only pay and relay, and the proof is valid without pearl. The conclusion `(advanceC P.L (meshBook f e [] P) u).strip σ (C/L^(e+|u|))` for all `u.length ≤ j-2` matches. |
| Wire receipt, eq. `ex-lattice-wire-overlap` | `Flight.wire_budget`, `secure_both`, `Secured.relay`, `Flight.knots_shift`, `alias_exchange`, `Flight.script_shift` | Yes | `relay` holds on `realCube zone`, with `zone = π/4`. |
| Eqs. `ex-lattice-wire-zero`, `ex-lattice-wire-nonzero` | `Flight.copper`, `Flight.stake`, `Flight.wire` | Yes, term by term | $f_P$=`footY`, $B_P$=`brace`, $h_P$=`latch p 2 * signal 1 1 p`, $M_P$=`mouth`, $N_P$=`notch`, $Y_{P,l}$=`levy`, $\Phi_{P,r}(p,l)$=`flux P r (aliasAt p l)`, $\mathfrak d_P$=`span`. |
| Branch identities (lines 401–565) | `Flight.stake_match`, `copper_match`, `wire_match`, `foot_is`, `bank_mouth`, `notch_match`, `portion_field`, `brace_match`, `undo_hinges`, `hinge_transport`, `bulb_network`, `toe_feed` | Yes | Same factor order. The source's `hh` uses `L*f₂=1`, i.e. $\lambda f_2=I$ (M7). |
| Feed/noise recursion (lines 339–378; transport lines 61–76) | `bind_feeds`, `Train.nozzle`, `drive_links`, `radices`, `jointAlias`, `Train.levelD`, `D_feedback` (statement) | Yes | `drive_links`: `(hop P v).drive a p = pullLine P a (v.mass • p) * v.drive a p`. |
| Reality paragraph (PR #81) | `Secured.pearl`, `Flight.knots_reflect`, `Flight.script_reflect`, `Secured.palette`, `record_eq` | Yes | `knots_reflect` at `p=0` handles `l=0` by computation and `l≠0` by `wire_none`/`pilot_none`, as in the English. |
| `lem:ex-lattice-rail-alias-decay` | `alias_rail`, `scaled_alias_upper`, `scaled_alias_lower`, `rail_lower`, `Moderate.kept`, `Moderate.inv` | Yes | The source works on `cube zone`; the English quantifier "$\eta\le\eta_0$" (PR #81) is compatible. The continuation radius `min (η/4) (min θ (c*η/(8*C)))` and constant `c/2` are identical. |
| `lem:ex-lattice-principal-plank` | `principal_plank` | Yes | $c_0$=`plankCost` = `meter.high*domainRadius/plankMin`, $p_0$=`plankMin`. |
| `lem:ex-lattice-mass-flux-weight` | `Flight.bills`, `bills_firm`, `hinges_budget`, `flux_budget` | Yes | `bills_firm` gives the constant `exp(-4·plankCost)^j`. |
| `lem:ex-lattice-scaled-signal-weight` | `sig_budget`, `sigQ_budget`, `scaled_seed` | Yes | Weight `grade (l i)`, independent of `r`. |
| `lem:ex-lattice-train-component-bounds` | `Train.extra_cube`, `extra_root`, `smooth_upper`, `smooth_lower`, `smooth_cost`, `feed_budget`, `noise_budget`, `tapMoney`, `drain_reserve`, `bulb_budget`, `bulb_firm`, `bend_budget`, `bend_firm`, `recover_rho`, `D_bulb` | Yes | Constants `exp(8*zone*(M/L))`, `exp(-(8*plankCost*(M/L)))`, `D^j*exp(8*zone)`, `t^j*u`; the noise constant is `C*2`. All agree with the English. |
| `lem:ex-lattice-port-denominator-weights` | `portD_budget`, `portR_budget`, `levy_budget`, `blow_control`, `blow_firm` | Yes | Weights `(grade^2)⁻¹` and `((grade^2)^2)⁻¹`; the levy is priced at one. |
| `lem:ex-lattice-tail-notch-weights` | `tail_budget`, `notch_budget`, `latch_budget`, `mouth_budget`, `foot_budget`, `brace_budget` | Yes | Does not cover `abide`/`abide_firm` (see L1). |
| `prop:ex-lattice-wire-entrywise-bound` | `Flight.copper_budget` (weight 1), `stake_budget` (`decay j`), `wire_budget` | Yes | Index family arbitrary (flights and trains); see M10. |
| Eqs. `transport-A`, `transport-T` | `Flight.scriptA`, `Flight.scriptT`, `rotor`, `pipe`, `cloud`, `chainY`, `weightsE`, `tabE`, `total` | Yes | $e_l$=`weightsE`, $a$=`tabE`, $y_l$=`chainY`, $C$=`cloud`, $R$=`rotor 1`, $\pi$=`pipe 1`. |
| Eq. `transport-punctured-three`, eq. `transport-alias-sum` | `Flight.genuine_alias`, `genuine_sum` (statements via `scaled_tri`, `scaled_mul`) | Yes | |
| Regular columns (lines 135–237) | `Flight.pilot`, `ahead`, `gains`, `fled`, `rests`, `sluice`, `abide`, `hills`, `Flight.wire`/`copper`, `pilot_match`, `wire_match` | Yes | Estimate of the pilot missing (L1). |
| Installed identities (lines 254–277) | `Flight.scaled_tri`, `scaled_mul`, `adjust_adj`, `Flight.tangent`, `Inputs` | Partly | Normalisation $L^{-3}$ matches `adjust_adj` (`stageVolume L = L^4`). Primal identity missing (L2). Fourier-block step not reconstructed (M2). |

## The PR #81 claims for these chapters

- "Correct the free-kernel source anchors": the RESULTS row for `thm:ex-lattice-wire-tower-strip` cites `YM.Next.Free.{Flight.wire_budget,secure_both,carryStep,cover_step,enters}` in `{Cable,Strands,Sprout}.lean`, `YM.Next.Free.{matrix_cover,record_eq}` in `MatrixPay.lean`, and `YM.Next.Free.Moderate.{kept,inv}` in `Moderate.lean`. All exist at those paths and namespaces, and each supports the step attributed to it. The transport anchors `YM.Next.Free.Flight.{tangent,scaled_tri,scaled_mul,adjust_adj}` in `Primal.lean` exist. RESULTS' "the patch mass is `area^J`, a positive power of a product of planks" matches `massFilter P p = area P.L p ^ P.J`. The new transport sentence (lines 244–248) is correct for this definition; the old one was not.
- "Make cost signs and convergence premises explicit": in these chapters it concerns only the theorem's hypotheses (lines 670–683), which now match the source's quantifiers. `Flight` itself carries `Odd L`, `3 ≤ L`, `4 ≤ j`, `t ≤ j ≤ t+1`, and `secure_both` adds `0 < k` and `4 ≤ t`.

## Lean declarations opened

All paths are relative to `Lean/YM/`. "Matched" means that the type, as read, supports the English use. "Def" means a definition read to fix meaning.

| Fully qualified name | Path | Status |
| --- | --- | --- |
| `YM.Next.Free.Flight` (structure) | `Next/FREE_KERNELS/Signal.lean` | Def; matches "flight" |
| `YM.Next.Free.Train`, `.mass`, `.extra`, `.smooth`, `.bind` | `Next/FREE_KERNELS/Train.lean` | Def; matched |
| `YM.Next.Free.area`, `rail`, `plank`, `mid`, `twirl` | `Next/FREE_KERNELS/Train.lean`, `Lines.lean` | Def; matched |
| `YM.Next.Free.chip`, `zone`, `domainRadius`, `narrow`, `seedQ`, `divisor`, `blow`, `blow_zero` | `Next/FREE_KERNELS/Chip.lean` | Def; matched |
| `YM.Next.Free.scaled_alias_upper`, `scaled_alias_lower` | `Next/FREE_KERNELS/Chip.lean` | Matched |
| `YM.Next.Free.alias_rail`, `principal_plank` | `Next/FREE_KERNELS/Lines.lean` | Matched |
| `YM.Next.Free.Train.extra_cube`, `extra_root`, `smooth_upper`, `smooth_lower`, `smooth_cost` | `Next/FREE_KERNELS/Train.lean` | Matched |
| `YM.Next.Free.massFilter`, `pullLine`, `yen`, `shuttle`, `feed`, `slide`, `Train.drive`, `Train.drive_links`, `Train.nozzle`, `stream`, `levelNoise`, `levelD`, `lid`, `high`, `drain`, `pole_split` | `Next/FREE_KERNELS/Feed.lean` | Def/matched |
| `YM.Next.Free.Train.bulb`, `halo`, `bend`, `rho`, `jewel` | `Next/FREE_KERNELS/Bend.lean` | Def; matched |
| `YM.Next.Free.pulse`, `vault` | `Next/FREE_KERNELS/Heart.lean` | Def; matched |
| `YM.Next.Free.tripQ`, `signal`, `mirage`, `hinges`, `flux`, `hinge_transport`, `scaleD`, `scaleR`, `fieldD`, `rotor`, `pipe` | `Next/FREE_KERNELS/Signal.lean` | Def/matched |
| `YM.Next.Free.Flight.span`, `portD`, `portR`, `toe`, `heel`, `above`, `tailings`, `fore`, `hills`, `abide` | `Next/FREE_KERNELS/Portions.lean` | Def; matched |
| `YM.Next.Free.Flight.total`, `tabE`, `weightsE`, `scriptA`, `cloud`, `chainY`, `scriptT` | `Next/FREE_KERNELS/Scripts.lean` | Def; matched |
| `YM.Next.Free.Flight.latch`, `footY`, `brace`, `mouth`, `copper`, `levy`, `notch`, `stake`, `wire`, `undo_hinges`, `bank_mouth`, `notch_match`, `portion_field`, `foot_is`, `brace_match`, `stake_match`, `copper_match`, `wire_match` | `Next/FREE_KERNELS/Wire.lean` | Def/matched |
| `YM.Next.Free.Flight.priorG`, `sluice`, `ahead`, `rebates`, `fled`, `rests`, `gains`, `pilot` | `Next/FREE_KERNELS/Pilot.lean` | Def; matched (L1) |
| `YM.Next.Free.Flight.pilot_cost` | `Next/FREE_KERNELS/Docked.lean` | Statement read; no manuscript counterpart (L1) |
| `YM.Next.Free.Flight.copper_budget`, `stake_budget`, `wire_budget`, `levy_budget` | `Next/FREE_KERNELS/Cable.lean` | Matched |
| `YM.Next.Free.Flight.bills`, `bills_firm`, `flux_budget`, `sig_budget`, `portD_budget`, `portR_budget`, `tail_budget` | `Next/FREE_KERNELS/Buffer.lean` | Matched |
| `YM.Next.Free.Train.noise_budget`, `tapMoney` | `Next/FREE_KERNELS/Reserve.lean` | Matched |
| `YM.Next.Free.SafeCube`, `Moderate`, `Firm`, `Moderate.kept`, `Moderate.inv`, `physical`, `baseCube`, `realCube` | `Next/FREE_KERNELS/Moderate.lean` | Def/matched |
| `YM.Next.Free.Pay`, `record`, `matrix_cover`, `record_eq` | `Next/FREE_KERNELS/MatrixPay.lean` | Def/matched |
| `YM.Next.Free.up`, `grade`, `mix`, `decay` | `Next/FREE_KERNELS/AliasWeights.lean` | Def; matched ($\Gamma_L$, $g_L$) |
| `YM.Next.Free.Overlaps`, `physical_overlap_hol`, `hol_on_thickening`, `tape`, `RRead`, `RRead_paints`, `tapes_sound`, `tapes_read` | `Next/FREE_KERNELS/Glue.lean` | Def/matched |
| `YM.Next.Free.Secured`, `secure_both`, `toll`, `listChip`, `spread`, `meshBook`, `differential_bound`, `residue_cost`, `Secured.propels`, `Secured.layout`, `Secured.palette` | `Next/FREE_KERNELS/Strands.lean` | Def/matched |
| `YM.Next.Free.carryStep`, `cover_step`, `enters`, `Secured.bankCost`, `Secured.bankRead`, `Secured.traverse`, `Secured.limited_lengths`, `Secured.honored` | `Next/FREE_KERNELS/Sprout.lean` | Matched |
| `YM.Precision.forwardC`, `advanceC`, `YM.Precision.Towers.Deep` | `PREC/Stacks.lean` | Def; matched |
| `YM.Precision.Inputs` | `PREC/TreeMatch.lean` | Def; see L2 |
| `YM.Next.Free.Flight.knots_shift`, `knots_reflect`, `script_shift`, `script_reflect` | `Next/FREE_KERNELS/Ends.lean` | Matched |
| `YM.Next.Free.Flight.duo`, `scaled_tri`, `scaled_mul`, `adjust_adj`, `tangent` | `Next/FREE_KERNELS/Primal.lean` | Matched, with L2 |
| `YM.Next.Free.pledges` | `Next/FREE_KERNELS/Priced.lean` | Read lines 45–95; uses `honored` with `e=1` (pilot) and `e=2` (wire) |
| `YM.Next.Free.stageVolume` | `Next/FREE_KERNELS/Gear.lean` | Def (`n^4`); matched |
| `YM.Bloch.Row`, `YM.Bloch.Row.strip`, `YM.Bloch.Row.acts`, `YM.Bloch.Cross`, `YM.Bloch.Co` | `CellFourier/Circulant.lean`, `CellFourier/Shuttle.lean` | Def; per-label strip as in the English |
| `YM.Laurent.mode`, `strip`, `reciprocal`, `read`, `Width` | `Laurent/Eval.lean` | Def; Fourier sign convention $\sum_xe^{ip\cdot x}a_x$ matches |
| `YM.Laurent.Vane` | `Laurent/Rune.lean` | Def; matched |
| `YM.Work.F07.widthRealPart` | `Work/F07/Read.lean` | Matched |
| `YM.Bloch.aliasAt` | `CellFourier/Alias.lean` | Def ($p/L+$`mon l`); matched |

The existence of the remaining names in the two evidence files (for example `Train.feed_budget`, `drain_reserve`, `bulb_budget`, `bend_firm`, `heart_budget`, `abide_firm`, `alias_refine`, `D_feedback`, `pilot_match`, `genuine_alias`, `genuine_sum`, `YM.Laurent.Vane.issues`, `readRealPart`) was confirmed by a grep for their declaration lines. Their statements were not read.

## Not checked

- No Lean elaboration, build, `#print axioms` or kernel replay.
- The proofs (as opposed to statements) of `pilot_cost`, `D_feedback`, `genuine_alias`, `genuine_sum`, `pilot_match`, `sail_run`, `phi_run` and the `Runs` calculus used in `tangent`.
- Hidden instances and coercions beyond those visible in the definitions read (for example `Fintype` on face types and the `ℕ+` coercion of `Side`).
