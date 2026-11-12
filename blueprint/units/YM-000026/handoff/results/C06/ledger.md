# C06 input/output ledger

Status words:
- **proved here**: a detailed proof in the C06 chapter, conditional only on
  the listed premises.
- **input**: a stated premise produced elsewhere.
- **internal**: produced by another C06 chapter.

"Producer" names the package that owns the producing chapter according to
`coverage-inventory.json` at `01ef22c`. A producer entry assigns
responsibility. It does not claim that the producer has delivered, or that
the statements have been matched on both sides. Every cross-package edge
stays open until the producer acknowledges it and the independent reviewer
agrees.

## Outputs (theorem level)

| Output (labels, chapter) | Statement in brief | Incoming premises |
| --- | --- | --- |
| `eq:transfer-root-hit` (local-transfer) | anchored per-mark bound at exponent a+1 gives a site bound N S_M c at exponent a, uniform in the period | none (proved) |
| `eq:transfer-inventory-cost`, `eq:transfer-expanded-cost`, `eq:transfer-elementary-identity` (local-transfer) | finite elementary list of price T; the compatible-product list has price ≤ T+e^T T and represents the same density | I1 (real/imaginary construction, `sec:ope-singletons`); anchored singleton expansions (hypothesis of the section) |
| `eq:transfer-closure` and the coarse local representation after reweighting (local-transfer) | the response J moves into the flagged gas exactly; singleton profile q'_v; flagged price e^A-1; one-scale propagation under `eq:transfer-duty` | I2 (`eq:ope-forest-price`), I1 (uniqueness after `eq:ope-single-coin`), X1 (`eq:transfer-nonlinear-input`) |
| `eq:local-read-price`, `eq:local-test-log-input` (local-splitting) | unique gauge-invariant jet projection Π_{o,X}; μ(v(f)) ≤ R_d c; logarithmic test-link bound | test holonomy identities (geometric definition); none external |
| `eq:local-atom-identity`, `eq:local-atom-cost`, `eq:local-gas-recovery`, `eq:local-merge-cost`, `eq:local-meeting-reserve`, `eq:local-built-cost` (local-splitting) | exact masked splitting χ_X f = p_t(v)+χ_Z g+r; gas recovery of the response; built remainder 2F_d a+b | internal: `eq:local-section-price` (local-sections); address/eligibility hypothesis on the forced alphabet |
| `eq:local-section-column-price`, `eq:local-section-price` (local-sections) | finite polynomial cylinder section on a fixed stencil Y, equivariant, signed-permutation covariant, ‖T(e_α)‖ ≤ C t^{r_α} | analytic inverse function theorem (reader prerequisite) |
| `eq:polynomial-moment-null` (polynomial-moment-attenuation) | vanishing holonomy tests through degree d imply vanishing polynomial moments of total weight ≤ d | none (proved) |
| `eq:moment-newton` and its application to A_0 | discrete Newton decomposition with uniform constants; applies to the installed A_0 row | I3 (A_0 normalization and strip difference bounds) |
| attenuation bound `(n+1)S` (polynomial-moment-attenuation) | derivative of an insertion with vanishing tests is O(ξ^{d+1}) along the displacement segment | `eq:moment-regular-bound` (the regular-norm conversion, a local hypothesis) |
| `eq:ope-leaf-projection` numerical bound via `eq:leaf-projection-allowance` (leaf-transfer) | elementary insertion gives a coefficient field with bounds Q_e m and exact density L^d T f; marked transition with fine cost 2m | I4 (`eq:leaf-raw-identity` with marked profile; `eq:leaf-tail-input`; `eq:leaf-flag-input`), I5 (`eq:leaf-principal-input` primitives; `eq:leaf-small-inputs` on the selected history) |
| `eq:cluster-tree-graph`, `eq:cluster-forest-bound`, `eq:cluster-marked-size`, `eq:cluster-local-tail`, `eq:cluster-exact-log` (cluster-expansion) | Penrose-type cancellation; rooted forest bound; connected tail; Z = e^𝓛 > 0 | vertex condition `eq:cluster-vertex-input` (hypothesis; supplied by mixed-activity-prices for the actual alphabet) |
| `eq:mixed-packet-hit`, `eq:mixed-distinct-tail`, `eq:mixed-reserved-tail`, `eq:mixed-ceiling`, marked-footprint bound (mixed-activity-prices) | packet site price; reserved tails with polynomial order k, seed count r, cost T; insertion j with Dj=w and price R_* | I6 (`eq:mixed-packet-analytic`, packet weight bound); optional activity site bound; projected-footprint and rate inputs |
| `prop:warning-crowding`, `eq:warning-actual-price`, `eq:warning-sector-mass`, `eq:warning-marked-mass` (gaussian-warnings) | correlated-warning bound (2b_D p e^{-H})^{|X|}; E(x) ≤ h^{-N}; integration before multiplication | X2 (`eq:warning-covariance` for the physical covariance, M uniform), X3 (local plateau estimates `eq:warning-plateau`); packet, forced and logarithmic pointwise bounds |
| `eq:geometry-axial`, `eq:geometry-path-count`, `eq:geometry-cluster`, `eq:geometry-frame`, `eq:geometry-predictor-curvature`, witness and count statements (seed-geometry) | first-power predictor curvature r(Q_p) ≤ C L^{-2} P_x on both branches; large coarse plaquettes lie in the hit region; K_0 | local sector conditions (from the packet sector definition); none external |
| `eq:guide-periodic-rows`, `eq:guide-allowance`, `eq:guide-path-sums`, `eq:guide-clipped`, `eq:guide-maximum` (seed-guides) | row/column kernel sums with L^{±2}; clipped guide fields ≤ dt, dL^{-2}t | X4 (tower strip bounds and `eq:guide-path-input` path expansions at both stages) |
| `eq:hit-final` (seed-hit-comparison) | hit-region rows ≥ λ_c s Σ_{C_2} r(V_p) − C_1 t 𝓑 − Z t² B⁴ d_A | internal: seed-geometry, seed-guides |
| `eq:tree-shell`, `eq:tree-common-gauge` (seed-tree-patch) | shell comparison; common gauge with fine and coarse chords ≤ C_L B^{10} T near an unhit plaquette | internal: seed-geometry; actual block-tree slice (definition) |
| uniqueness/analyticity, `eq:branch-frame-derivative`, `eq:branch-probe` (predictor-branch) | uniform frame and predictor uniqueness; analytic normalized frame; 𝒬 = 𝒜 + d_c^{(0)} ℛ | analytic implicit function theorem (reader prerequisite); internal: seed-geometry |
| `eq:unhit-linear-zero`, `eq:unhit-kernel-near`, `eq:unhit-global`, `eq:unhit-final` (seed-unhit-comparison) | unhit rows ≥ −ε t² n | X5 (`eq:unhit-flat-stack` full flat identities and aligned path expansion), X4; internal: predictor-branch, seed-tree-patch |
| `eq:seed-curvature-bound`, `eq:seed-three-ranges`, `eq:seed-fine-income`, `eq:seed-predictor-income`, reserves, final gain `μ=m/2` (seed-energy) | assigned energy ≥ (m/2) t² n; orientation-averaged Q_A^core ≥ μ t² n | internal: seed-geometry (`eq:seed-geometric-counts`), seed-guides, seed-hit-comparison (`eq:seed-hit-input`), seed-unhit-comparison (`eq:seed-unhit-input`) |

## Incoming edges

| Edge ID | Producer → consumer | Exact statement needed | Status |
| --- | --- | --- | --- |
| I1 = C05-to-C06-singletons | C05 `ope-singletons.tex` (`sec:ope-singletons`, `eq:ope-single-coin`) → local-transfer | (a) Higher arrays of site price q are represented by finite elementary insertions of total site price ≤ 4q (real/imaginary split, unused-slot property). (b) With nonzero coarse unmarked density, the singleton coefficient determines the ordinary singleton field uniquely. (c) Absolute convergence of indexed background profiles bounded by ∏(1+\|k_j^0\|). | input; C05 checked locally in PR #72; needs a C05 acknowledgement |
| I2 = C05-to-C06-forest-price | C05 `ope-grouping.tex` (`eq:ope-forest-price`) → local-transfer | Connected-support estimate: for t+η ≥ 0 and (2M_E+1)^4 A ≤ p−(t+η), a component array with unique output map has site price ≤ e^A−1 at exponent t+η | input |
| I3 = C01-to-C06-A0-kernel | C01 `kernel-transport-identities.tex`, `curvature-horizon-producer.tex` → polynomial-moment-attenuation | Physical normalization of the installed A_0 kernel, the odd-block carry, and the strip difference bounds ‖Δ_w A_0‖_α ≤ A L^{-1-\|w\|} for \|w\| ≤ d | input (C01 claimed by TrishenGunaratnam) |
| I4 = C08-to-C06-raw-expansion | C08 `leaf-expansion.tex` → leaf-transfer | Localized expansion `eq:leaf-raw-identity`, with absolute domination, integrability, and the marked profile identity; nonprincipal reserved mass `eq:leaf-tail-input`; flagged cost `eq:leaf-flag-input` (leaf-expansion says at line 113 that it proves the latter) | input |
| I5 = C08-to-C06-principal-and-funding | C08 `projection-payment-producer.tex` → leaf-transfer | The primitives behind `eq:leaf-principal-input` (‖h_*‖ ≤ Dω Φ, ω e^{(a+e)D_X} ≤ 1, D ≤ m/g) and `eq:leaf-small-inputs` on the same selected history | input |
| I6 = C07-to-C06-packet-weight | C07 `packet-estimates.tex` → mixed-activity-prices | `eq:mixed-packet-analytic`: the sum over analytic variants at each packet is ≤ C exp((s−g)n) | input |
| X1 = ?-to-C06-nonlinear-transition | producer not located → local-transfer | `eq:transfer-nonlinear-input`: for every prepared finite list of price ≤ M_*, T𝓔 = e^{E_E} exp(ΣF̂) 𝒢(K̂) with the stated prices, uniform in list and period | input, **no producer label found** by a reference search over `manuscript/existence/` |
| X2 = ?-to-C06-warning-covariance | producer not located → gaussian-warnings | the physical covariance satisfies `eq:warning-covariance` with M independent of period and x | input, no producer label found |
| X3 = ?-to-C06-warning-plateau | producer not located → gaussian-warnings | outside the enlarged seed region: local error δτ split three ways; guide bounds Aτ/L², Aτ (`eq:warning-plateau`) | input, no producer label found |
| X4 = lattice-to-C06-path-data | lattice/tower author (correspondence says "assigned to the lattice author"; package not identified) → seed-guides, seed-unhit-comparison | per-type strip bounds for Φ, Φ', N; `eq:guide-path-input` path expansions with σ r_0 ≥ 1 at both stages | input, producer package not identified |
| X5 = lattice-to-C06-flat-stack | as X4 → seed-unhit-comparison | `eq:unhit-flat-stack` (three full-matrix identities in physical counting coordinates) | input, producer package not identified |

## Outgoing edges (consumers of C06 outputs)

Found by searching every `\ref`/`\eqref` to a C06 label from a non-C06
chapter. Labels were not changed by this pass, so these consumers are not
affected, except that R2 makes explicit how the C13 consumer must choose
`c_F`.

| Edge ID | C06 output → consumer (package) |
| --- | --- |
| C06-to-C05-transfer | `sec:local-transfer` → reference-difference, reference-match, ope-local-projection (C05); `sec:leaf-transfer` → `eq:ope-leaf-projection` |
| C06-to-C02-transfer | `sec:local-transfer` → centered-construction, finite-menu-history-handoff (C02) |
| C06-to-C03-transfer | `sec:local-transfer` → phase-quantitative-producer (C03) |
| C06-to-C14-transfer | `sec:local-transfer` → actual-stress-shell-nodes (C14) |
| C06-to-C07-mixed-and-warnings | `sec:mixed-activity-prices`, `sec:gaussian-warnings` (`eq:warning-scales`, `eq:warning-monitor-pays`), `sec:predictor-branch`, `sec:seed-guides` (`eq:guide-maximum`), `sec:seed-tree-patch` (`eq:tree-shell`), `sec:seed-unhit-comparison` (`eq:unhit-flat-stack`, `eq:unhit-kernel-near`, `eq:unhit-global`, `eq:unhit-linear-zero`), `sec:seed-energy`, `sec:seed-geometry` → packet-estimates, packet-annulus, activity-jet-assembly, gaussian-moment-prices, actual-palette-warning, warning-safety, local-mean, mean-action-jets, sector-gram, actual-global-row-prices (C07) |
| C06-to-C08-cluster-and-leaf | `sec:cluster-expansion`, `sec:leaf-transfer`, `sec:local-splitting`, `sec:mixed-activity-prices`, `sec:polynomial-moment-attenuation`, `eq:leaf-raw-identity`, `eq:leaf-flag-input`, `eq:leaf-principal-input`, `eq:leaf-small-inputs` → leaf-expansion, forced-exclusion, forest-average-log, high-degree-cluster-prices, marked-activity-jets, projection-payment-producer, principal-reference-attenuation (C08) |
| C06-to-C09 | `sec:local-sections`, `sec:local-splitting`, `sec:polynomial-moment-attenuation`, `sec:leaf-transfer`, `sec:predictor-branch` → primary-calibration-producer, heading-history-handoff, regular-principal-producer, stationary-action-prices (C09) |
| C06-to-C10 | `sec:predictor-branch` → weighted-frame-penalty (C10) |
| C06-to-C11 | `sec:cluster-expansion`, `sec:local-splitting` → sector-analytic-prices, physical-reset-reorganization (C11) |
| C06-to-C12 | `sec:local-sections` → marked-campaign-producer (C12) |
| C06-to-C13-energy | `sec:seed-energy`, `sec:seed-hit-comparison`, `sec:seed-unhit-comparison`, `eq:seed-discarded-count`, `eq:seed-final-smallness`, `sec:seed-guides`, `sec:predictor-branch`, `sec:mixed-activity-prices` → actual-harvested-owner-energy, actual-local-compiler-handoff, restarted-rank-history (C13). Note: actual-harvested-owner-energy reruns the allocation at a threshold ν; it should use the same explicit choice c_F = (fine linear expense coefficient) as R2. |
| C06-to-C05-matched-field (known-open-edges) | the C06 share of `C06-C08-C12-C16-to-C05-matched-field`: elementary projection (`eq:ope-leaf-projection`) and its marked transition identity are proved in leaf-transfer from I4/I5. The match to the single finite-cutoff Q_n is C05's side. |
