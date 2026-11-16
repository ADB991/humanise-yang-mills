# Lean source map for the path attachment producer

Checkout inspected: `/tmp/ym-whole-stationary-source`, monograph base `a62f08fbcccdc92797ab910ace65f3e02ee79a06`; preserved Lean upstream revision is `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Read-only source inspection; no Lean build and no edits made.

## `BasesFine` / `beckon`: exact retained-path interface

In `Lean/YM/Next/STATIONARY/Level/Recurse.lean:93ff`,

`BasesFine G P Z w A := ∀ j, ∀ m→∞, ∀ clip p with p.direct≤Z j, ∀ bed B, ... → ∃ R ...`

with premises: `B.roots.strip (P.α j) (pacesE P j)`; all-side `Floor B p i (P.η j) (pacesE P j)`; selected-sequence `Bid.Sworn B (m i) G`; and selected-period identity `B.diagonal.acts (m i)=1`. Conclusion is a *single* path (R) such that:

- `R.row=rowPath B`, `Attached B R`;
- all loop coefficients vanish;
- for every positive width τ at most (w_j), every path price (a≥A_j), and every Λ≥0, `R.Bounds p τ a Λ`;
- at every chosen side and every order (n≤4), `SameJet n (mainTerm p R) Wilson.energy`.

Here `pacesE P j=max 0 (P.Ω j)`. The source theorem `beckon` (same file, line 101) obtains, for each j, `launch G (P.α j) (pacesE P j) (Z j)`; then sets (w_j) to the launch width and (A_j=max(C_j,operatorname{rowPrice}(P.α_j,operatorname{pacesE}P_j))), where (C_j) is the launch's nonlinear correction budget. It converts the launch bound to any (a≥A_j). No choices depend on the later τ, (a), or loop budget Λ.

`launch` in `Shape/Scaled.lean:270ff` constructs the terminal Wilson-matching base path: it takes order-2 and order-3 Wilson coefficient pictures (`Wilson_stream G 2`, `G 3`), sets (M=1+C_2+C_3≥1), and invokes `assembly G 1 σ₀ A Z`. `assembly` (`Shape/ClassicalMatch.lean:561ff`) subtracts the blank path’s `inputSeries` from the target response, supplies order-2 and order-3 records and a cubic-ray remainder, and produces cubic/quartic atom fields (X,V). Then `emitBase G B (blank B G).loop X V` retains the root row and blank loop, adds the nonlinear corrections, and `matched` gives equality of main-term jets through order four at every selected period. Its resulting σ is `min τ σ₀`, and its price is (M K); the bound additionally takes the max with the fixed row price.

In the manuscript, `BasesFine` corresponds to the universal base-path output; the terminal base path is not a separate free input. The proof source is `beckon` plus `launch`/`assembly`.

## One-step ordering (`transition_cap`, source analogue of flux cap)

The concrete producer is `YM.Stationary.transition_cap` in `Lean/YM/Next/STATIONARY/Level/Transition.lean:93ff`; there is no declaration literally named `flux_cap`. Its type orders quantifiers as

\[
\exists \kappa\ge0,\ s>0,\quad \forall \tau>0,\ A\ge0,\quad
\mathrm{HorizCalc}(G,w,\epsilon,D,Z,\tau,A)\to
\exists d,\gamma>0,u,\beta,\Lambda_0,\ mathrm{Transition}(\ldots).
\]

Thus the pregranted κ and positive width s precede τ,A and the annulus calculation; d,γ,u,β,Λ₀ are chosen only after those. The source comment says these widths do not enter the schedule demand. The first, pre-τ,A stage uses `honored` to set chart/phase costs and `setWest` to set compatible direct cutoffs; `t`, `M`, `color_pipe`, then determine a positive response scale and pregrant κ,s. The second stage combines `HorizCalc`, `tideMark`, `bequest`, and `age_control` to choose the drift allowance, rate, period threshold, amplitude and Λ₀. This is the source justification for the manuscript’s reel/κ/s-before-τ,A,L choice order; do not reorder by deriving the reel from the later path price.

The exact cap accounting is in `cap_invoice` (`Transition.lean:61ff`): with (x+y) controlled by d, (V,\gamma,\Lambda,B\ge0), (B\gamma\le1/4), Λ/2≤Λ′, and (2((C+(d+|y|)V)\gamma)≤\Lambda′), it proves
\[
(C+|x|V+B\Lambda)\gamma\le\Lambda'.
\]
The theorem defines (\Lambda_0(L)=2((P(L)+(d+|G.slopeConstant\log L|)B)\ell)), so the first terms consume at most half of Λ′, and the `BγΛ` term uses `Bγ≤1/4` and Λ/2≤Λ′ to consume the other half. In actual retained-history construction `energized` calls the transition with the ordinary incoming Λ=`loopCap (m+1)` and uses `clocks` to obtain Λ/2≤`loopCap m` (`Level/Recurse.lean:30ff, around 250ff). The schedule proves
\[
W_j(L_j)\le loopCap_m,\quad loopCap_{m+1}/2\le loopCap_m,\quad 1\le loopCap_m.
\]

**Factor check:** this actual source route is a half-contraction of the unamplified loop cap. The manuscript path interface states the stronger-looking Λ/128≤Λ′ and elsewhere uses `64 loopCap` for a loop halo. In the Lean `energized` call inspected here the incoming `R.Bounds` has loop budget `loopCap(m+1)` (not `64*loopCap`) and the `Transition` premise is Λ/2. If the manuscript keeps the factor-64 loop halo at the one-step boundary, it must explicitly reconcile it with this source interface (e.g. explain a rescaling/normalization before `Transition`, or treat the factor-64 loop halo as a later weakened bound); one cannot directly substitute Λ=64 loopCap into the source Λ/2≤loopCap inequality. The ordinary source `clocks` result alone only yields the half contraction for unamplified loopCap. This looks like the key quantitative audit point.

At the final application, `energized` receives `hy : R.Bounds ... loopCap(m+1)` and attachedness. The input price profile `U.paths` is separately used in `Transition`; the `64` budget amplification in manuscript is primarily for row/cubic/quartic/loop profiles at the public interface. Inspect the exact manuscript wrapper before deciding which loop constant is intended.

## Terminal assembly and finite history

`budding` (`Level/Recurse.lean:220ff`) instantiates `BasesFine` on the retained horizon at terminal level N. `energized` builds one downward step: from `Paid`/horizon receipts and `Proceed`, it constructs `Scud`, applies `Transition`, then populates all-forest receipts with `Bid.one_for_all ... Work.F05.answer ...`. Its `Bubble` result carries the next path with `loopCap m`, and `plowed` performs finite downward induction, assembling one full retained history. Thus base path choice precedes each `transition_cap` call and is uniform in the selected torus sequence.

## Forest independence: actual `Work.F05.answer` proof

`YM.Bid.F05` is defined in `Lean/YM/Bid/Station.lean:92ff`. It asserts for any two forests (H,T), a common path W, critical charts ρ,u, positive `PriceGap`s, and `LocalRatio P`:

1. the tested actions along their stationary charts agree as germs;
2. their thermal functions agree up to an additive constant as germs.

`YM.Work.F05.answer` (`Lean/YM/Work/F05.lean:60ff`) proves it via `same_thermal` (`F05.lean:38ff`). The mechanism:

- `graph_switch` (`F05/Graphs.lean:29ff`) defines the smooth chart switch from the H slice to the T slice. It tends to zero at the origin and is itself critical for the T tested action, because the tested actions are related by the exact switch identity (`tested_switch`). Strict positive `PriceGap` for T makes the Hessian positive definite; `station_unique` then identifies this switched critical graph with u near zero. Thus tested actions match after chart transport and the stationary actions coincide as germs.
- At stationary points the Hessian chain rule has no second-derivative-of-chart correction: `hessian_transition` proves
  
  `det Hess_H(x,ρ(x)) = det(D move)^2 * det Hess_T(x,switch(x,ρ(x)))`.
  `hessian_ratio` transfers this identity to the u graph using the graph-switch equality.
- Independently, `toll_switch` (`F05/Jacobian.lean:...`) proves the physical Haar/local-ratio toll transforms as
  `toll_H(y) = |det D move(y)| * toll_T(switch(y))`.
  It proves this by comparing pushforward measures on compact subsets of the two forest parcels, applying the change-of-variables theorem to the smooth injective move map, then identifying continuous densities pointwise by compact testing. The finite coordinate permutation has determinant modulus one, and the free-dimension normalization cancels via `free_card`.
- Thermal quantity is 
  \\(\mathcal L_W(x,\rho(x)) + \tfrac12\log\det Hess_H(x,\rho(x))-\log toll_H(\rho(x))\\).
  Substituting δ² in the determinant and \det absolute value in toll cancels exactly:
  \\(\frac12\log(d^2 B)-\log(|d|k)=\frac12\log B-\log k\\).
  The loop term agrees by the chart-switch identity. `same_thermal` actually proves equality (additive constant 0); `Work.F05.answer` packages it in the weaker `+cd` statement.

`Bid.one_for_all` (`Lean/YM/Bid/Scope.lean:35ff`) applies F05 to transfer `ClassicalMatch` from a selected forest to every forest: the germ equality transfers all derivatives, while the Hessian/match right side is forest-independent. `energized` uses this to produce per-forest `ClassicalMatch` and `FiniteBound` receipts for all charts. This source proves the forest-independence announced as outstanding input (B) in the manuscript, provided the manuscript's thermal function uses the same local-ratio/Haar toll convention and hypotheses.

## Formula/citation cautions

- The source output matching identity is `SameJet` for `mainTerm` vs `Wilson.energy` at the terminal base, then `ClassicalMatch` for the one-step outgoing path. Do not state direct matching of the whole finite action unless the curvature terms are included through the assembly proof.
- `F05`’s Haar cancellation is not a statement that the additive Hessian alone is coordinate-invariant. It explicitly pairs the squared Jacobian from Hessian determinant with one Jacobian in the physical Haar toll.
- To cite `toll_switch`, inspect the remaining lines of `F05/Jacobian.lean` if line details are needed; proof chain is `cost_compact` -> `gate_cost` -> `toll_switch`.
- The factor-128 issue above is explicitly marked as a scope mismatch to reconcile, not an established contradiction; code and monograph interfaces may be using different intermediate Λ normalizations.
