# C06 findings (author audit)

Each chapter was read in full against the pinned-source crosswalk in
`../../../correspondence.md` (sections "Continued construction details",
"Seed geometry and actual predictor", "Physical kernels, guides and affected
comparison", "Unhit comparison and predictor branch producer", "Polynomial
moments and discrete attenuation"). Every displayed inequality was rederived.
"Checked" below means that the argument follows from its stated premises as
written; it does not mean that the premises are discharged (see `ledger.md`).

## Per-chapter result

| Chapter | Result | Notes |
| --- | --- | --- |
| local-transfer | checked, unchanged | Anchored-to-site bound (constant `S_M=e{2(16M+9)}^4`), real/imaginary compression, expanded price `T+e^T T`, squarefree-exponential identity, connected-component absorption of the response, reweighting. Specialization constants verified: `p-(t+η)=1/2`, `q=d`, `d_0=W=d`. |
| local-splitting | checked; notation repair R4 | Jet read-out existence/uniqueness/gauge invariance; finite separating-functional argument; logarithmic link bound via the rescaled profile `P(y,r,tr,h)`; support correction `A_d=1+(1+w)R_d`; gas recovery bijection; reserve inequality `m(e^{|X|ς}-1) ≤ h_B ς m_+`; built cost `2F_d a+b`. |
| local-sections | checked, unchanged | Circulation separation (homogeneity, Euler identity `(k+2)A_k`), finite separating subfamily, equivariant inverse `C=D^{-1}π`, Taylor substitution with degree ≥ `r_α`, signed-permutation average, threshold price `C t^{r_α}`. |
| polynomial-moment-attenuation | checked, unchanged | Surjection `DΨ(0)K_a=M_a` (radial correction `K=Q-∇r`), filtration of higher derivatives, chain-rule induction, Newton pieces `c_j=[4(j+1)]^j`, remainder in and outside the `L`-ball, parent-displacement factor 3, displacement induction giving `(n+1)S`. |
| leaf-transfer | checked; typesetting repair R1 | Principal reserve `(u+5/2) ≤ a+e`; complex combination; projection allowance `H_d=1+2F_d(1+C_orb+C_turn)`, all four bills `≤ H_d e_0`. |
| cluster-expansion | checked; notation repair R3 | Penrose-type BFS partition (`P ⊆ G ⊆ U(P)`), kernel row bound `|Y|γ ≤ tF(Y)`, `F^k ≤ k! e^{δc}`, parent-map count `m! C(2m,m) ≤ m! 4^m`, root-anywhere normalization, recurrence `(m+1)p_{m+1}=Σ(k+1)ℓ_k p_{m-k}`, finite-alphabet limit. |
| mixed-activity-prices | checked; repairs R5, R6 | Packet count `H_B D_B^{2n}` by out-and-back walks; halo cover `c_ℓ=(2ℓ+3)^4`; distinct-set tail via `m!` enumerations; reserved tail `P_{ε,k} e^{-εT-U}`; insertion `Dj=w`, `R_*=g e^{hP}`. |
| gaussian-warnings | checked, unchanged | Orthant/Chernoff bound with singular covariance; crowding `|X| ≤ b_D m|J|`; scale comparison `C d^r ≤ P^a`; super-polynomial decay of `E(x)`; sector-mass Fubini bound and marked variant. |
| seed-geometry | checked, unchanged | Axial gauge `4(k+1)qF` by slab induction; path count `4NqE`; first-power synchronization `C_G=max{2,2/a,2/σ}` (left rotation, conjugation invariance); predictor bound `2max{1,ζ^{-1}}`; witness condition and counts. |
| seed-guides | checked; notation repair R7 | Periodic row/column sums (`|B|C`, `|A|C`, `L^4` residues in the wide column); path column bound via injectivity of translation; locality `k<r_0 log(2√h)`; `s ≤ 2t` from `c_L ≥ 0`. |
| seed-hit-comparison | checked, unchanged | Transpose lemma; plotted excess `2(√a_0+d)ΣE`; coarse split `ΣH_p ≤ H_* 𝓑`; three norm totals; defect `d_0`; constants `C_1` (before `L,W`) and `Z_0`. |
| seed-tree-patch | checked, unchanged | Root walk `|w| ≤ 8L+1`, lifted endpoint `0` or `Le_a`; shell comparison `D_L`; axial gauge on the unhit box; common bound `C_L B^{10} T`. |
| predictor-branch | checked, unchanged | Uniform uniqueness contraction `v ≤ v/2` (`ε ≤ min{δ/4,1/4}`); predictor uniqueness via the uniform tube; analyticity via the ambient implicit-function system (kernel argument `A=(n-1)A/n`); root-corrected derivative `𝒬=𝒜+d_c^{(0)}ℛ`, checked on gradients. |
| seed-unhit-comparison | checked; notation repair R7 | `√p I_0^*𝒬 = B_c d_c 𝒜` from `d_c d_c^{(0)}=0`; truncation `ω(R,h)`; global defects; localization radius `3R+4+R_pred`; delay `B^n hω/t → 0` (`T^2/t ≤ H^{-48/100}`, `e^{-τR}/t ≤ H^{-1/2}`). |
| seed-energy | checked; repair R2 | Normal defect identity; quartic bound; three coarse ranges; fine rows `a_f t^2/128`, `3λ_f/4`; discarded count `C_R=(8R+1)^4 N_p`; reserves; final allocation `≥ (m/2) t^2 n`; threshold limits. |

## Repairs made (all within owned files)

- **R1 (typesetting, leaf-transfer).** In `eq:leaf-tail-input` the subscript
  `{\rm nonprincipal}` had been corrupted into a newline followed by
  `m nonprincipal`, which renders as italic "m nonprincipal". It is now
  `\mathrm{nonprincipal}`. A scan of the whole `manuscript/` tree for
  similar control-character corruption (tab, form feed, backspace, or a brace
  ending a line inside a subscript) found no other instance.
- **R2 (completeness, seed-energy).** The final allocation needs the fine
  linear charge `c_F` of `eq:seed-fine-reserve` to equal the fine linear
  expense coefficient `C_1/L^2` of `eq:seed-hit-input`, but the chapter never
  said so; it only required `C_1/L^2 ≤ λ_f/4`. The choice `c_F=C_1/L^2` is
  now explicit, and the cancellation of the three linear expenses is spelled
  out. Source check: in `YM.Work.E09.assemble` the single parameter `cF`
  appears both in `hF : cF ≤ T.high.linear/4` and in the hit hypothesis `g`.
- **R3 (notation, cluster-expansion).** In `eq:cluster-local-tail` the order
  threshold was called `z`, which is the bound tuple variable of the section.
  It is now `m_0`. The translation sentence to `eq:leaf-cluster-tail` now
  names all four substitutions (exponent, vertex price `t`, ratio `γ`,
  threshold `z ↦ m_0`). It also notes that the forest-estimate auxiliary
  `t=h_Bγ/δ` is a different quantity.
- **R4 (notation, local-splitting).** The site price of the old flagged
  activities was written `v`, the same letter as the coefficient vectors
  (`μ(v)`, `p_t(v)`, `v=v_0+Σv_i`), and in the same paragraph as
  `eq:local-built-field`. It is now `ς`, with `κ=√ς`. The text now says that
  `ς` is the vacuum site price and that the forced mass in
  `eq:local-built-cost` is measured in units of `κ`.
- **R5 (consistency with consumer, mixed-activity-prices).** The root and
  adjacency counts and the per-seed cover cost were `H`, `D`, `s_ℓ`. Their
  consumer, `packet-estimates.tex` (C07), already calls them `H_B`, `D_B`,
  `c_ℓ`. Renaming them also removes the clash between the adjacency count and
  the insertion debt `D` in the same chapter. Labels are unchanged.
- **R6 (wrong symbol, mixed-activity-prices).** The final affordability step
  said the degree price is eventually below `H^{q_*/2}`. `H` was the halo
  count there; the intended quantity is the coupling scale `h(x)` that
  defines upper exponents in `sec:packet-estimates`. The text now says this
  and avoids clashing with the head exponent `h` of this chapter.
- **R7 (notation, seed-guides and seed-unhit-comparison).** The stage factor
  (`1` fine, `L` coarse) and the guide constant `d=2A(1+a)` shared the letter
  `d` within seed-guides, and also within seed-unhit. The stage factor is now
  `κ`.

## Notation proposals for G05 (not applied; cross-chapter)

These clashes span several chapters or packages. Under the common contract,
G05's notation contract decides them:

- N1. The coupling is `h=x+c_L` in gaussian-warnings, seed-geometry,
  seed-guides and seed-energy. In seed-tree-patch `h(x)` is redefined as the
  common small-gauge bound `C_L B^{10} T`, and seed-unhit-comparison uses
  `h` for that amplitude and `H=x+c_L` for the coupling. The consumer
  `packet-annulus.tex` (C07) calls the amplitude `H`. Proposal: coupling `h`
  everywhere; amplitude `θ` (or `H` if G05 prefers to follow C07). The
  macro gauge `H` in seed-geometry and seed-tree-patch must then be renamed
  too.
- N2. `D_L` is the shell-comparison constant in seed-tree-patch and the
  path-length constant (`k ≤ D_L(1+|z|)`) in seed-unhit-comparison.
- N3. `τ` is `P/√h` in gaussian-warnings and a truncation rate in
  seed-unhit-comparison. `t` denotes both the fine threshold and several
  local auxiliaries (local-transfer exponent, forest `t`).
- N4. `D` is the colour normalization (seed-geometry, predictor-branch,
  seed-energy) and also the predictor-curvature constant (seed-hit-comparison).
  `C_1` means different constants in seed-geometry and seed-hit-comparison.
  Each local use is defined before use.

## Literature leads for G03 (not added; bibliography is G03-owned)

- cluster-expansion: the bound `eq:cluster-tree-graph` with the BFS interval
  partition is Penrose's tree-graph identity (O. Penrose, "Convergence of
  fugacity expansions for classical systems", 1967). The convergence and
  logarithm statements are the standard polymer cluster expansion
  (Kotecký–Preiss, Comm. Math. Phys. 103 (1986) 491–498; see also
  Fernández–Procacci, Comm. Math. Phys. 274 (2007), arXiv:math-ph/0605025).
  None of these sources was opened in this session, so they are leads, not
  verified citations. The chapter's proof is self-contained, so no step
  depends on them.
- gaussian-warnings: `eq:warning-rectangle` is the exponential Chebyshev
  (Chernoff) bound, proved in full in the chapter. No citation is needed.
- polynomial-moment-attenuation: the Newton forward-difference expansion is
  classical and is proved in full. No citation is needed.

## Dependency observations

- local-transfer's specialization and leaf-transfer's allowance use the same
  constants (`F_d`, `R_d`, `h_B=(2B+1)^4`, `κ`) as local-splitting; matched.
- seed-hit-comparison's `𝓑` uses the large fine set `𝒮` that seed-energy
  defines later (a forward reference). The definitions agree: `E_p` is
  indexed by `p ∈ 𝓕` with `r(U_p)>t`, which is `𝒮`.
- seed-unhit-comparison cuts at `R=⌊B/100000⌋`, the same `R_0` as
  seed-guides, and uses `C_L B^{10}T` from seed-tree-patch; matched.

## Revision 2: answers to review PR #80

- M1: fixed. Endpoints now `Ly+i → L(y+e_b)+i` in both displays; the patch at `y` is stated to be the fine points `Ly+i`. With these endpoints telescoping gives `𝒜 d_f v = Σ_i w_i {v(L(y+e_b)+i) − v(Ly+i)}`, and adding `d_c ℛ d_f v` cancels the weighted terms, giving line "`𝒬 d_f v = d_c {v(Ly)}`" (re-derived here).
- M2: `lem:branch-nearest-projection` (a)–(d), proved: normal chart `Φ(X,N)=exp(X)(1+N)` on `𝔤 × 𝔤^⊥`, analytic inverse function theorem, first-order condition `u^*Z−1 ∈ 𝔤^⊥` for nearest points, `‖u−1‖ ≤ 2‖Z−1‖`, left translation. External input: Hall, *Lie Groups, Lie Algebras, and Representations*, 2nd ed. (2015), Def. 1.4, Def. 3.18, Thm 3.42 (local structure of a matrix Lie group near 1), and Krantz–Parks, *A Primer of Real Analytic Functions*, 2nd ed. (2002), §2.5. **These locators were given from memory; neither book was reachable from this sandbox, so they need checking against a copy** (G03). The disconnected and finite cases are covered (𝔤 = 0 gives π ≡ 1 near 1). The lemma is referenced in seed-geometry and seed-energy.
- M3: `def:geometry-sector-conditions` (S1)–(S4) with the incidence convention, referenced in seed-energy (S1, S2, orientation step) and seed-hit-comparison. Producer recorded in ledger row 33 as the packet sector definition (C07), unchecked.
- M4: leaf-transfer states the splitting hypotheses (A) addresses, (B) background bound with site price κ², separates the ingredient `φ_M` (support, majorant) from the density `dens(M)` on which 𝒯 acts, and lists (A), (B) among the remaining inputs.
- M5: gaussian-warnings defines the plateau conclusion and the fine site contraction, and proves `lem:warning-vanishes` (radius-2B event at the assigned site ⇒ radius-B events at all sites within B ⇒ plateau conclusion there ⇒ every warning type vanishes; contraction via an incident plaquette whose anchor's parent is within distance 1). The margin is stated as `R_c ≥ R_p + B` (source 300B, 30B). The plateau conclusion itself remains the analytic input X3.
- M6: `d ≤ j−2`, `α > 0`, `A` fixed before `L` stated; ledger I3 updated. The C08 use in `principal-reference-attenuation.tex` is not edited (C08-owned) and needs the same restriction.
- M7(a)–(h): all addressed (universal axial test; `B_c>0`, `B_f≤2B_c`; `ℓ_{a,i}` = path length + 4; `|z|_1`; transports from one `V` and its fine replica; `C=0` case; centre feedback by cross-reference). M7(g) (symbol `h`) left for G05 as N1.
- M8: ledger corrected (I4 split into I4 and I4' with `projection-payment-producer.tex`; X1 → C02 `thm:ex-lattice-volant-supplier`; X2 candidate C07 `local-covariance.tex`, unchecked; X3 → C07 `warning-safety.tex`; X5 adds alignment; I3 order restriction; rows 29, 33, 77).
- M9: not C06's to edit. C13 `actual-harvested-owner-energy.tex` should identify `c = C_1/L^2`; C11 `physical-reset-reorganization.tex` should not call the singleton-masked identity a specialization of `eq:local-atom-identity` (they differ by `(χ_{o_i} − χ_Y)P_i`); C07 `packet-annulus`/`local-mean` use `N_0 B_c d_c = 0`, not among the identities of `eq:unhit-flat-stack`.
