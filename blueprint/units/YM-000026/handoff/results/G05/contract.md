# G05 proposed notation and order contract (draft)

Originally audited at `d3c7a1901390f4821d4b91f6f639bb5c60c63604`; refreshed basis `b13f2ef462ee35a0329a5e1256daf49a31e82c84`; source
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Session
`TrishenGunaratnam-terra-g05-20261113`. This is a proposal for the respective
owners, not a change to the shared glossary or to any chapter. The shared
`docs/notation.md` and `blueprint/glossary.md` take precedence for published
aliases. Review and exact producer/consumer matching remain open. The index
reflects the **current prose** at this base, not a claim that every proposed
rename has already been applied.

## Principal interfaces: observed notation and intended crosswalk

Locations are first introduction in the named scope unless marked first use;
labels provide stable navigation, line numbers describe this exact base. Local
variables in subsidiary computations are not promoted to global notation.

| Symbol, type and scope | Introduction / anchor | Convention and action |
| --- | --- | --- |
| `G ⊂ U(r_G)`, real Lie algebra `𝔤` | `statement.tex:16`, `ex-statement` | Fixed matrix representation; `r_G` is complex representation dimension, not `dim_R 𝔤`. |
| `x=(bold x,t)`, `V̄_+` | `statement.tex:25` | Time last; Minkowski square `t²−|bold x|²`. Explicitly convert the time-first coordinate system at its C04 boundary; an orthogonal permutation maps the two coordinate descriptions, not an assertion that the coordinate tuples are identical. |
| `P_p,D_N,a_N` | `statement.tex:29` | Physical linear period, positive integer denominator, mesh `a_N=D_N^{-1}`. Distinguish period from site count. |
| `Λ_{N,p}` | first use `statement.tex:56`; definition `lattice.tex:201`, `subsec:ex-lattice-scales` | `(Z/(P_pD_N)Z)^4`; insert that definition before the sum. This is a documented forward introduction, not a missing LaTeX label. |
| `S_ℓ`, `U_{ij}`, `β`, `μ_{ℓ,β}` | `lattice.tex:19–63`, `eq:ex-lattice-action` | `i<j` once; action uses `1−Re tr(U_ij)/r_G`, no extra half. Wilson law has probability Haar prior and normalized `exp(−βS_ℓ)`. `S_ℓ` is not the continuum table `S`. |
| `O_{N,p,v}, M_{N,p}, W_{N,p}` | `statement.tex:31,53–57`, `ex-smearing` | Token observable, its moment, and smeared moment; latter carries `a_N^{4n}`. `W` is not an arbitrary raw correlation. |
| running slope `σ` in statement | `statement.tex:43`, `ex-running-input` | Positive real, convergence uniform in period; propose canonical `s_𝒲` to avoid shared glossary's refinement `σ`. Keep it distinct from kernel penalty and scale-dependent coupling. |
| `p(k),q(k)` in target | `statement.tex:140` | Requested period-index sequence and its refinement; proposal `varrho,σ` under glossary, including the composed `varrho∘σ` and all quantifiers. One family precedes the request. |
| `Conf_n`, `Gen`, `Cyc_p`, `NoHit_p` | `statement.tex:49`; `limits.tex:19–30`, `sec:ex-limits` | `Gen⊂Conf`; coordinate ties and torus coincidences have different exclusions. Preserve each topology and period dependence. |
| `𝒞` used for a Wilson family | `limits.tex:13`, `sec:ex-limits` | Shared glossary reserves `𝒲` for public Wilson family and `𝒞` for internal construction family. Replace this local family letter by `𝒲` **if** the assumptions really describe the public family; its multilinearity assumption is additional, so state it separately. If internal data are intended, give the projection and additional multilinearity hypotheses rather than relabel by fiat. |
| `f=(f_mesh,f_per)` | `limits.tex:35`, `def:ex-limits-estimates` | Ordered pair of strictly increasing sequences; outer period threshold, then mesh threshold depending on period. General internal order is not automatically the public request or a diagonal limit. |
| `S`, `S^χ`, `S^mix` | `statement.tex:70`, `ex-mixture`; `limits.tex:30` | Distinguish internal table, selected/character correlation and mixture. Their identification needs the phase construction and same-table hypotheses. The public target does not add multilinearity of all correlations. |
| `𝓕_d`, field labels | `statement.tex:64`, `ex-statement` | Finite-dimensional complex grade spaces injected in a common label space; not automatically a scaling dimension. Shared glossary writes public `F_d`; conversion requires matching the actual hierarchy, not just renaming. |
| `X,ν,χ_*` | `statement.tex:67`, `ex-mixture` | Target phase space, full-support probability and selected character; separate from scaling witness `X` in the glossary. Propose `Ξ,ν_ph,χ_*`; match `phase-selection.tex`'s `Ξ,μ` at `ex-character-measure`, preserving the actual phase identification. |
| `ℋ,Ω,𝒟,Φ` | `statement.tex:89`, `ex-reconstructed` | Hilbert space, normalized vacuum, common dense invariant field domain, field operators. `𝒟` is also reserved for a contact device in the glossary; propose `𝒟_field` for the domain and carry its dense/invariant properties. |
| `𝓗`, `P_𝓗`, `M`, `A` in sector | `sector-gram.tex:13–40`, `eq:sector-precision` | Active free bonds, projection, normalized selected-row map, completed precision `A=M* M+P_{𝓗ᶜ}`. All squared norms are unnormalized physical counting sums; inactive completion is identity. It is not a statement that flat and actual curved Gram matrices are equal. |
| `λ=q^{-1/2}` in sector | `sector-gram.tex:21`, `eq:sector-precision` | `q` signed channels, hence `λ²=1/q`; use the same rows, field and tags. Other chapters use `λ` for a coupling rescaling, a separate local meaning. |
| `D_{v,a}`, `\mathscr D_{v,a}` | `free-kernel-components.tex:59`; `free-kernel-estimates.tex:341` | Drive and level response respectively. `kernel-transport-identities.tex:16–19` incorrectly names its covariance `D_{v,a}`; see action A4. |
| Gaussian `Q,C,λ,J_λ` | `finite-volume-parameter-continuity.tex:21,46–51`, `eq:parameter-gaussian-rescale` | `Q` positive precision, normalized density `c_Q exp(−zᵀQz/2)`, `J_λ=λ^d p(λz)/p(z)`. The covariance, if called `C`, is `Q^{-1}`. Merged PR #104 adds this distinction at the current basis. |
| `D` in C08 | `results/C08/edges.md` lines 72–77 | Distinct local coordinate dimension, insertion debt and degree growth factor. Propose `d_coord`, `D_debt`, `D_deg` in their defining scopes and any connecting statements; do not infer a single global object. |
| `F_m`, `F`, `K` in C05 | `results/C05/findings.md` F6–F7 | Packet spaces, coefficient space and several locally defined `K` objects. Propose subscripts `F_m^pkt`, `F^coef`, `K^proj_m` where multiple meanings meet. Retain explicit `A_c`/`p_c` conversion rather than asserting identity outside the existing bridge. |
| `ν=(4π²)^{-1}` | `trace-free-rank.tex:194`, `sec:ex-lattice-trace-free-rank` | A local scalar Green-function coefficient, not the phase probability. Prefer `c_Green` locally; retain all occurrences and powers. |
| `T(r)`, `Θ` | `assembly.tex:46–54`, `ex-trace-limit` | Selected phase's centered grade-four trace two-point function and trace field. The coefficient and `r⁸ log²(r^{-1})` normalization in the displayed limit must remain unchanged. |

## Exact bounded actions for chapter owners

1. **C03 / target owner:** in `statement.tex` insert `ℓ_{N,p}=P_pD_N` and
   `Λ_{N,p}=(Z/ℓ_{N,p}Z)^4` before `ex-smearing`, with the centered-site
   embedding used by the sum. This moves an already stated definition, not a
   new construction claim. Rename the slope to `s_𝒲` throughout that target
   clause and align the requested/refining sequences with the glossary.
2. **C03 / G04:** distinguish public `𝒲` and internal `𝒞` in `limits.tex`
   as specified in the table; spell out the bridge and extra multilinearity
   assumption. `Conf`, `Gen`, `Cyc`, `NoHit` must retain their distinct domains.
3. **C03/C04:** use `Ξ,ν_ph` for the target's phase space and measure and
   `𝒟_field` for its operator domain, with a one-line crosswalk at
   `ex-character-measure`. Confirm the same constructed phase space and
   measure before claiming the target is supplied.
4. **C01:** in `kernel-transport-identities.tex:16–19` replace the covariance
   entries `D_{v,a}` by `\mathscr D_{v,a}` as defined in `free-kernel-estimates.tex`;
   retain `D_{v,a}` for the drive in `free-kernel-components.tex`. Check every
   subsequent equation and its fine/coarse scaling before editing. The existing
   C01 independent review M5 reports that reading the drive as covariance
   makes the identities false; this exact base retains the clash. Separately,
   the same transport subsection uses `π=ρ^{-1}x^*D^{-1}` for a row
   functional `ℂ⁴→ℂ` with `πx=1`; `xπ` is the projection. Propose
   `ℓ_cov` for that functional and `ℓ_cov,l` for its fine alias throughout.
   The factorization `π=s^{-1}σ` near line 169 is the same functional, not
   a second projection. This avoids the glossary reservation of plain `π`.
5. **C01:** review M9 flags `lem:ex-lattice-residue-difference`'s overlap
   premise: give the exact earlier assumption or move the cost clause after
   its producer. Review also flags `cloud_P`, `scriptT`, `pullLine`, `chip`
   and several aliases in `free-kernel-estimates.tex` around lines 339–605;
   establish definitions and aliases at their first use on the final version.
   The review is version-scoped; it does not prove all remain undefined on
   other PR heads.
6. **C05/C08/C15:** apply the local qualified names in the table where their
   scopes meet, preserving the explicit projection, norm, degree and Green
   normalization. In merged C09 #104 retain the added `Q=C^{-1}` with its fixed Gaussian-space scope.
7. Any rename affecting a mathematical statement or its crosswalk must be
   independently reviewed at the new fingerprints. Do not update another
   reviewer's approvals. The main include and glossary are separate owners.

## Versions

* #103 and #104 are merged at `6b811855d82d4aa5a39a339fc57bc963c6ed7b45`
  and `770a51c16d8d665023dadfb4403522c4331e6ad0`; the current base contains
  their changes. `proposed-versions.json` is retained as a historical
  merge-base-relative record, not current status. Refreshed chapter hashes
  are in `chapter-hashes.sha256`; repeat the audit after later C changes.

The raw lexical and reference scans are navigation aids; they do not parse all
TeX, infer a symbol's mathematical type, or establish first definition or
absence of collision. The table above is a focused principal-interface audit;
the remaining local-symbol candidates need owner review before a final index.

## Targeted source anchors

* `YangMills.WilsonFamily`, `.mesh`, `.place`, `.finiteMoment`,
  `Lean/PublicWilson.lean:35–57`: period and denominator are positive integer
  sequences, their product is the site modulus, mesh is inverse denominator,
  and the moment is a product-of-insertions integral.
* `YM.Extraction.Order`, `.refine`, `.late`, `Lean/YM/Extraction/Orders.lean:34–47`:
  refinement composes each component; the period eventuality is outside the
  mesh eventuality. Neither statement gives arbitrary diagonal convergence.
* `YM.Next.Free.Train.drive`, `YM.Next.Free.Train.levelD`, `Lean/YM/Next/FREE_KERNELS/Feed.lean`:
  distinct definitions found at lines 40 and 133; the namespace was checked in the same file. Source inspection is not Lean elaboration.

**Additional first-use action (C01).** `free-kernel-estimates.tex:251,271`
uses `area_L` and `rail_L`; the displayed definitions first occur in the
later `free-kernel-components.tex:16–23`. Extract the definition block before
both consumers, including the centered lift and train/side hypotheses. The
concrete split and remaining premise check are in `order.md`; simply swapping
the chapters leaves their reverse references unresolved.

## C06–C07 local-geometry contract (N1–N4)

These are proposed bounded substitutions at the exact scopes in
`results/C06/findings.md` N1–N4; the affected authors must check each use,
including type, first definition and any existing same-symbol local collision,
before applying them.

* Use `h_{\rm cpl}=x+c_L` for the positive coupling in
  `gaussian-warnings`, `seed-geometry`, `seed-guides`, `seed-energy`,
  `seed-unhit-comparison` and the matching `packet-annulus` input.
  Write `\vartheta_{\rm g}=C_L B^{10}T` for the common small-gauge
  amplitude in `seed-tree-patch`, `seed-unhit-comparison` and
  `packet-annulus`; use `\mathcal G_{\rm macro}` for the distinct macro
  gauge currently called `H` in `seed-geometry`/`seed-tree-patch`.
  Include the conversion wherever one of these chapters cites another;
  replacing a letter does not establish that separately chosen gauge data agree.
* Write `D_{\rm shell}(L)` for the shell comparison constant and
  `D_{\rm path}(L)` for the constant in `k≤D_{\rm path}(L)(1+|z|)`;
  do not assert they are equal. State their dependence on the fixed parameters.
* Use `\tau_{\rm win}=P/\sqrt{h_{\rm cpl}}` for the warning window and
  `\tau_{\rm trunc}` for the separately chosen truncation rate. Give the
  finite-geometry threshold and forest/interpolation time distinct local
  subscripts when they occur together; preserve the order in which each is chosen.
* Use `D_{\rm col}` for colour normalization, `C_{\rm pc}` for the
  predictor-curvature bound, and `C_{\rm geom}`, `C_{\rm hit}` for the
  distinct constants now called `C_1`. No equality or uniformity of those
  constants is implied by the renaming.

These proposals respond to an existing scoped author finding, rather than an
independent proof that every occurrence is compatible. The shared glossary
owner must approve any new global reservation; otherwise these are local
crosswalks. Further review is required at the changed chapter hashes.

## C13 and C14 scoped follow-up at the refreshed base

* In `sec:marked-healthy-cumulant-launch`, `epsilon=H^{-v}` at
  `eq:healthy-middle-purchases` is a field-coordinate error, while the
  telescope uses the same glyph for a per-step row/covariance error. C13
  independent review M5 requests `epsilon_field` and `epsilon_step`, with
  the actual purchase `epsilon_step≤H^{-v}` stated or both errors retained.
  We directly checked the two displayed uses; the producer of that purchase
  remains a separate mathematical obligation, not an editorial equality.
* `allarity-marked-propagation.tex` and `rank-root-normalization.tex` use
  respectively a marker weight `r≤1` and a decay price `a≥1`. Independent
  C13 review M6 identifies a missing amplification/normalization bridge.
  Keep the proposed `a=r H^U` as a question, not an established formula;
  match the actual unamplified label and chosen history in the consumer.
* The selected-history root-row width and C11 paid path width both use
  `v_m`; distinguish `v_m^row` and `v_m^path`, preserving the strict width
  gap required for the summable tails (C13 review M7).
* C14 revision 1c names `r_i=s_{n_i}` and `U_{i,d}=C_{i,d}` on one comparison curve in the manuscript; the source-level question whether both public consumers use that same scaling witness remains untraced and requires independent review. Do not infer its discharge solely from the new prose.
