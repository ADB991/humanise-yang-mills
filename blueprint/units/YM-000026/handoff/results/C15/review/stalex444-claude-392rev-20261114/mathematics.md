# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded review of `subsec:ex-lattice-firesky-witness` for #392.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): four reads of the subsection (the definitions and fields against their consumers; a step-by-step re-derivation of `lem:ex-lattice-firesky-solves`; a step-by-step re-derivation of `lem:ex-lattice-firesky-clock-fields`, including the root-depth repair; a re-read of `lem:ex-lattice-firesky-chamber` against the merged record 395rev), a read of the cross-references, symbols and author records, two Lean reads reported in lean-correspondence.md, and three arithmetic scripts. Each item states what was checked.
- Content SHA-256: per-file SHA-256 in `hashes.json` (`trace-firesky-gallery.tex` `ae73b506…`; author records #393 `4f0677ab…`, #395 `e3449f83…`, #397 `4a4fdbb6…`). `trace-firesky-gallery.tex` is in the `manuscript` list of YM-000026 at `1e511906`; the unit fingerprint was not computed (validation.md, Not run).
- Manuscript files and labels: `manuscript/existence/trace-firesky-gallery.tex`, `subsec:ex-lattice-firesky-witness` (l.78–342): the definitions of ℓ and w, (F1)–(F5), the corrected labels, `lem:ex-lattice-firesky-solves`, `lem:ex-lattice-firesky-chamber` (re-read), `lem:ex-lattice-firesky-clock-fields`, the Status paragraph and the closing remark; the author records `results/C15/author/hairer-claude-392-20261114/`, `hairer-claude-394-20261114/` and `hairer-claude-392clock-20261114/` (README.md). Interface passages read: `common-scale-selection.tex`, `rank-root-normalization.tex`, `trace-rounded-comparison.tex`, `trace-rounded-receipt.tex`, `actual-rank-purchases.tex`, `centered-construction.tex`, `allarity-marked-propagation.tex`, at the cited lines.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at commit `1e511906` (head of `codex/existence-monograph` when the review was claimed).
- Review task: #392 (requests https://github.com/hairer/humanise-yang-mills/issues/392#issuecomment-6882337616 and https://github.com/hairer/humanise-yang-mills/issues/392#issuecomment-6883441399); this report is added by its own pull request.
- Outcome: changes requested. M1 (Required): 395rev M1 stands at l.204. M2 (Should): (F5) and the solves lemma do not state ref(d′) ≤ k, which the cited inverse estimate needs. M3 (Should): the Status paragraph and the opening sentence predate #395 and #397. The proof of the clock-fields lemma is correct for all sufficiently large k, uniformly in 0 < b ≤ b̄, and its items 1–3 are exactly the dilation, depth and bracket of (F1) and the plateau (F2); the root-depth repair (`f1fbe95d`, l.288–293) is correct as written. M4–M6 are minor.

Line numbers are those of `trace-firesky-gallery.tex` ("gallery") at `1e511906` unless another file is named; other files are cited at the same commit. The subsection is l.78–342. The chamber lemma was reviewed at draft `29f27cdb` in `blueprint/units/YM-000026/handoff/results/C15/review/stalex444-claude-395rev-20261114/` ("395rev") and is re-read here, not reviewed afresh. "Comparison" is `trace-rounded-comparison.tex`, "receipt" is `trace-rounded-receipt.tex`, "rank-root" is `rank-root-normalization.tex`, "common-scale" is `common-scale-selection.tex`, "rank chapter" is `actual-rank-purchases.tex`, "allarity" is `allarity-marked-propagation.tex`.

## What the subsection states and what it is for

For a chart at level k with base arc b, the subsection defines the middle level ℓ and the root depth w as maxima of level ratios (l.91–101), lists five fields that a chart witness supplies (F1)–(F5) (l.103–149), and defines the corrected labels X_{N,p} (l.151–162). It proves three lemmas: the corrected labels are the unique solutions of the reading equation (l.164–180); the stencils of the insertions at a fit configuration lie inside the home chamber at depth w, which is (G4) with w_i = w (l.197–243); and, for the clock of `sec:common-scale-selection`, the dilation, depth and bracket of (F1) and the plateau (F2) hold for all large k (l.245–335). The closing remark (l.337–341) concludes that only (F3) and (F5) remain inputs from the funded construction. The fields are what the pairwise receipt (receipt (A), (B); comparison (G1)–(G4)), `prop:rank-root-output-ticket` and the output transport of allarity consume.

## Definitions (l.85–101)

- **C1. Letters (l.85–89).** μ_k is the monitor m_k of `eq:ex-lattice-firesky-gap` (l.53–57, only m_k ≥ 1 there); J and L_j are those of common-scale l.41–45. c_k is named only; its value is fixed later, at l.250–251, as a hypothesis of the clock-fields lemma (see the note on c_k below). Correct.
- **C2. The two maxima (l.94–98).** Each set is a finite set of levels, so the maximum exists or the convention max∅ = 0 applies; since a_j decreases (common-scale l.45, l.41), each nonempty set is an initial segment. The definitions agree with allarity l.939–941 and the receipt's use of the middle cell and root depth (receipt l.38–44). The convention matches `gainSky` (lean-correspondence.md L1). Correct.
- **C3. "Thus $w\le\ell\le k$" (l.98).** Immediate from the definitions in either case of the convention. Correct.
- **C4. Middle cell and root depth (l.98–101).** These are the meanings comparison l.76–79 (fitness) and receipt l.38–41 (root tests at w) use. Correct.

No finding.

## The witness fields (l.103–149)

- **C5. (F1) (l.108–116).** Dilation, depth and bracket are well formed; "so the set defining $\ell$ is nonempty" follows (if empty, ℓ = 0 and the dilation puts 0 in the set). The dilation is receipt (A) (receipt l.58–62); the bracket is the property used after the proposition at rank-root l.375–380. The wheel uses "clock factors", first given meaning at l.337–338 (M4). Correct apart from M4.
- **C6. (F3) (l.119–134, from #412).** The threshold θ_{P_j} is the one the 19:22 comment asked for ("β̂_j^(−1/2) exp((log log β̂_j)^(3/2))"), and the diff of `434c02a6` adds exactly it. Put u = log log β̂_j. Then θ_{P_j} ≤ θ_clock(j) = β̂_j^{-1/2}𝓜_j (rank-root l.395–398) holds iff u^{3/2} ≤ u², that is iff u = 0 or u ≥ 1; it fails for 0 < u < 1. So the sentence at l.130–134 is correct. The 20:04 handoff already notes that "the comparison θ(P_j) ≤ θ_clock(j) holds as soon as log log β̂_j ≥ 1". In addition, the proviso holds at every level of this clock: common-scale puts exp(exp E_j), with E_j ≥ 1, into d_j before β_* is chosen (l.143–145), requires β_* ≥ d_{j_*} (l.56), and β̂_m = β_* + s_G s_m ≥ β_* (l.60); so β̂_m ≥ e^e. The countable family is in use, since `prop:rank-root-output-ticket` adds requests to it (rank-root l.309–313). Optional: "Since" in place of "Once", with that pointer. Note also that the suppositions of rank-root Proposition (2), which (F3) imposes at every level (l.121–122), include "$\theta_R\le\theta_{\rm clock}$" (rank-root l.322), so the comparison is already part of (F3). Correct.
- **C7. (F3) budget radius (l.123–124).** ⌈(log β̂_j)²⌉² is c_j² with the lemma's c_j; the #393 record notes it is the source's `walls` (l.33). Correct.
- **C8. (F4) (l.135).** With μ_k = 𝓜_k, the right side is I_k of rank-root l.304, so (F4) is item 1 of `prop:rank-root-output-ticket` with w(k) = w (rank-root l.317–318). Correct.
- **C9. (F5) (l.136–146).** The three properties are those of `eq:rank-common-tested` (rank chapter l.113–117). The stamp-duty clause (l.146) is not defined (M4). The (N,p)-dependence of T_{d′} is fixed by l.105 and l.144 only implicitly. Correct apart from M4.
- **C10. Consequence (l.148–149).** The bracket with J nondecreasing (common-scale l.18) gives J(j) ∈ {J(k)−1, J(k)} on [w,k]; w → ∞ follows because J diverges. Same argument as rank-root l.375–379. Correct.

## Corrected labels and the solves lemma (l.151–180)

Re-derived step by step.

- **C11. Shrink factor (l.152–153).** σ = (β_{N,p,k}^{1/2}θ_k)^{-1} is t_{k,N,p} of the rank chapter l.204; θ_k is the clock threshold θ_clock(k), not θ_{P_j}. Positivity needs β_{N,p,k} > 0 and θ_k > 0, both supplied there. Correct.
- **C12. W_ρ, S_σ, X_{N,p} (l.153–159).** Diagonal maps; S_σ invertible since σ > 0; the formula is linear in e. T_{d′}^{-1} is used before l.166 states bijectivity, and the space of e is not named (M5). Correct.
- **C13. Kernel step.** If T_{d′}v = 0, the half-accuracy bound gives ‖a(v)‖ ≤ ½‖a(v)‖, so a(v) = 0. The 19:22 comment already states this: "The half-accuracy bound forces a zero readout vector into the kernel of the calibrated entry map". Correct.
- **C14. Inverse estimate (l.173–177).** a(v) = 0 gives v = 0 by `eq:rank-reference-inverse` (rank chapter l.178–179, valid for N ≥ k, which N > k supplies). That estimate is stated after "Retain only comparison levels $k\ge\operatorname{ref}(d)$" (rank chapter l.90), and D_k comes from applying the front-column bound "from the normalized reference level to $k$" (l.186–187). Neither (F5) nor the lemma states ref(d′) ≤ k (M2). Correct given that hypothesis.
- **C15. Injective, hence bijective (l.176–177).** Linearity is stated in (F5); finite dimension and T an endomorphism enter through "the argument given there" (rank chapter l.190–197). Correct.
- **C16. Uniqueness and "with $\rho=m$" (l.177–179).** v solves the equation iff T_{d′}v = S_σ^{-1}W_m e iff v = X_{N,p}e; the substitution ρ = m into `eq:rank-common-lifts` (rank chapter l.209) is formal. Correct.
- **C17. Numerical check.** `evidence/solves_linear_core.py` (exact rationals): in 160 random instances with A invertible and half-accuracy, T is never singular and X e solves the equation exactly; with A singular, or with the constant 1 in place of ½, T can be singular. A sanity check of the linear-algebra core only.

Findings: M2, M5.

## The clock-fields lemma (l.245–335)

Re-derived step by step against common-scale.

- **C18. The clock as restated (l.247–251).** β̂_m = β_* + s_Gs_m (common-scale l.60), a_m = e^{-s_m}, s_{m+1} = s_m + log L_{J(m+1)}, J = j_* + J_0 (l.44–45), L_j ≥ 3 (l.41). The proof also uses s_0 = 0 (l.44). The monitor agrees with 𝓜_k of rank-root l.301, and the cover size with allarity l.939–940 and with B(s_k) of common-scale l.79. Correct.
- **C19. Growth (l.265–273).** At steps with J(m+1) > j_*, the entry requirement (common-scale l.65–70, applicable by l.89–91) gives log L_{J(m+1)} ≤ s_m/J(m+1), so s_{m+1} ≤ 2s_m there; the first plateau is finite, so s_k ≤ C_0 2^k, hence log log β̂_k ≤ log k + C_1; and s_k ≥ k log 3 (`eq:common-scale-brackets`, l.48–50). Correct. The wording "once $J(m+1)\ge1$" is M6.
- **C20. Item 1, ℓ (l.275–279).** a_0/a_k = e^{s_k} ≥ 3^k against μ_k^{b+2} ≤ exp((b̄+2)(log k + C_1)²): j = 0 lies in the set for large k. Correct.
- **C21. Maximality bounds (l.279–287).** a_{ℓ+1}/a_k is a product of k−ℓ−1 block lengths, each ≥ 3, and is below μ_k^{b+2} by maximality; likewise for ℓ − w. Both displayed bounds follow. Correct.
- **C22. The root-depth step (l.288–293).** See the next section. Correct.
- **C23. k − w ≤ C_2(log k)² (l.293–296).** Sum of the two bounds with log c_k = O(log k). Correct. The rank chapter (l.381–383) takes this bound from the lemma's proof and also re-derives it directly. Optional: state k − w ≤ C_2(log k)² as a fourth item of the lemma.
- **C24. Item 2 (l.298–311).** If w ≥ A_j there is nothing to show. Otherwise A_j ≥ k − C_2(log k)², so k ≤ 2A_j for large k. The recursion (common-scale l.11–14) gives A_j − A_{j−1} = b_j + 2k_{j−1} + 1 ≥ 4A_{j−1} + 3, hence A_j − A_{j−1} ≥ (4/5)A_j and k − w ≤ (4/5)A_j for large A_j; so w ≥ A_{j−1}. With J_0 nondecreasing, J(i) ≥ J(k) − 1 on [w,k]. Correct. Letters: M6.
- **C25. Item 3 (l.313–334).** Monotonicity of s_m; β̂_k − β̂_w = s_G log(a_w/a_k); the four-factor split; factors 2 and 4 bounded by maximality; factors 1 and 3 are block lengths bounded by exp(s_k/(J(k)−1)) via the entry requirement and item 2 (J(t+1) ≥ J(k)−1 > j_* for large k). The right side is O(s_k/J(k)) + O((log k)²) ≤ s_k/2 for large k, so β̂_w ≥ β̂_k/2. Correct.
- **C26. Uniformity and what is used.** b enters only through b + 2 ≤ b̄ + 2; every threshold depends on b̄ and the clock. Used: s_0 = 0, L_j ≥ 3, the entry requirement, J_0 nondecreasing with steps at most 1, the A_j recursion. Correct.
- **C27. What the items deliver.** The inequalities and ranges of items 1–3 are those of (F1) dilation (l.110), depth (l.112), bracket (l.115) and (F2) (l.117–118). Correct.
- **C28. Numerical check.** `evidence/clock_fields_check.py` on four explicit clocks of the form the lemma restates (L_j = 3, 2j+1, 2·3^j+1 with j_* = 1; L_j = 3 with j_* = 10), with β_* = 3, smaller than common-scale l.56 requires, which the proof does not use, b ∈ {0.5, 5.5, 20}, k ≤ 400000: every check of items 1–3, of the repair chain and of both displayed bounds holds beyond a small k (last failure k ≤ 171 for items 1–3; ≤ 72 for nonemptiness of the w-set and for 3^ℓ ≥ c_k^{10}); the intermediate bound "right side ≤ s_k/2" waits on J(k) growing (last failure k = 4098, 5237 and 8127 for the first three clocks, k ≤ 132 for the fourth). A sanity check; the proof covers every clock of `sec:common-scale-selection`.

Finding: M6 (wording only). No required change.

### The root-depth repair (commit `f1fbe95d`, l.288–293)

The repair replaced the parent's l.279–282 (`7b80cabc`) by l.279–284 of `f1fbe95d`, which are l.288–293 at `1e511906` after the nine lines added by `434c02a6`; the text has not changed since. Each step re-derives. (i) ⌈x⌉ ≤ x + 1 ≤ 2x for x ≥ 1, and (log β̂_k)² ≥ 1 for large k since β̂_k → ∞; so c_k ≤ 2(log β̂_k)². (ii) With log log β̂_k ≤ log k + C_1 (l.270, from s_k ≤ C_0 2^k), log c_k ≤ log 2 + 2(log k + C_1) = O(log k). (iii) The first maximality bound (l.285) gives ℓ ≥ k − O((log k)²), so 10 log c_k = o(ℓ). (iv) With s_0 = 0 and `eq:common-scale-brackets`, a_0/a_ℓ = e^{s_ℓ} ≥ 3^ℓ ≥ c_k^{10} for large k, so j = 0 lies in the set defining w. That is exactly the nonemptiness item 1 claims, and the depth of (F1) is the defining inequality at w. The reason given before the repair, that c_k is at most a fixed power of C_0 2^k, bounds 10 log c_k only by a multiple of k, which need not be below ℓ log 3; the repair closes that. In `evidence/clock_fields_check_output.txt` nonemptiness of the w-set and 3^ℓ ≥ c_k^{10} hold from k = 73 on in every case tested. Verdict: the root-depth repair is correct as written, and this review certifies it independently. The 19:22 comment states "I authored the final root-depth repair in #397, so this review does not certify that edit independently".

## The chamber lemma, re-read (l.197–243)

`git diff 29f27cdb 1e511906` on the gallery has three hunks (+111/−4): the (F3) threshold and the bracket pointer (`434c02a6`, at l.124–134 and l.190–191) and the insertion after l.243 (`44ed50d6`, `7b80cabc`, `f1fbe95d`). None touches the lemma: l.197–243 at `1e511906` are byte-identical to l.188–234 at `29f27cdb` (diff exit 0), as are l.1–120, which hold the definitions of ℓ and w and of the middle cell that fitness uses (fitness itself is stated in the lemma, l.200–202). The interface files the lemma cites (comparison, receipt, `centered-construction.tex`, `centered-estimates.tex` (hashed in 395rev), common-scale) and the #395 author record are unchanged between the two commits. Each point of 395rev at the merged text (395rev line numbers +9):

- **395rev M1 (Required): standing.** l.204 reads "for every $N$ with", followed by the mesh condition only (l.206); l.222 reads "Since $a_k/a_N$ is an integer". The only "N>k" in the subsection is l.105, scoped to the field list, and (F3) at l.119. Sharpened: under the (F1) depth c_k^{10} ≤ a_w/a_ℓ, for ℓ ≤ N one has a_N ≤ a_ℓ ≤ a_w/c_k^{10}, so the mesh condition holds once c_k^{10} > 8(Z_d+2)/3; and ℓ < k once mμ_k² > 1. Then every N with ℓ ≤ N < k satisfies the mesh condition and a_k/a_N is not an integer. For the clock (μ_k > 1, b > 0, c_k → ∞) this holds for every chart at large k, for each fixed d, by item 1 of the clock-fields lemma. It does not hold for an arbitrary chart (μ_k = c_k = 1 gives w = ℓ = k). `evidence/chamber_range_check.py` (exact rationals; L_j = 3, k = 20, mμ_k² = 3^5, c_k = 2, Z_d = 0) gives ℓ = 15, w = 8 and mesh-satisfying N = 10…19, all below k with a_k/a_N not an integer; it is an example, not the argument. Repair as in 395rev: "for every $N\ge k$ with" (or $N>k$). (G4) and its consumer are unaffected (comparison l.72, l.235).
- **395rev M2 (Minor, optional): standing.** "the centered tiling at depth $w$" (now l.210) does not name its base.
- **395rev M3 (Minor; author record): standing.** The #395 record is unchanged; its l.5 still reads `67de733`.
- **395rev C1–C9: standing.** The proof text and the interface files are unchanged; 395rev C9 concerned the diff `63820370`→`29f27cdb` and is superseded for the merged state by the paragraph above.
- **395rev #393-interface note: reviewed here.** 395rev read w ≤ ℓ ≤ k, the middle-cell spacing a_ℓ and the depth of the root tests as an interface it did not establish; C2–C4 above check them. The clock-fields lemma also proves, for the clock and large k, that the sets defining ℓ and w are nonempty; the chamber proof uses only w ≤ ℓ.
- **395rev final-combination note: standing.** At `1e511906` the lemma's labels occur only in the gallery itself (`git grep -n ex-lattice-firesky-chamber`: l.198, 205, 212, 231, 240); receipt l.287–289 still lists the root depth as open.

No response to 395rev M1 was found at `1e511906` (`git grep` for `395rev`, `#395` and N ≥ k wording in the C15 records); the 19:22 comment says the inequality holds "uniformly once N is large at fixed w and d".

## The Status paragraph and the closing remark (l.182–195, l.337–341)

- **C29. Status, first sentence (l.182).** The fields correspond to the funded witness (lean-correspondence.md L2–L6); (F3) is a consequence of a witness field, as the #393 record says (l.25). Correct as prose.
- **Status, l.183–185.** "This section records them but does not construct them." is contradicted by the clock-fields lemma and the remark at l.337–341. Defect: M3.
- **C30. Status items (l.186–193).** True of the gallery: (A) is the (F1) dilation, the root-depth identification is C4 with the chamber lemma, the bracket is (F1), and the ticket is (F4). The pointer of #412 resolves (rank-root l.308). Correct.
- **C31. Wheel remark (l.337–338).** With the clock factor of stage j its block length, min(L_{J(k)}, L_{J(k)−1}) ≥ 3 ≥ 2 (common-scale l.41) once J(k) − 1 ≥ j_*, which holds for large k. Correct.
- **C32. Inventory (l.338–341).** Dilation, depth, bracket from items 1–2, plateau from item 3, wheel from the remark, (F4) from item 1 of `prop:rank-root-output-ticket` (whose hypothesis w(k) → ∞ is l.148–149): nothing in (F1), (F2), (F4) is missing. It holds for all sufficiently large k, base arcs up to b̄, the μ_k and c_k of l.250–251, and with the requests of `eq:rank-root-ticket-requests` included; these come from the lemma and the Proposition the remark cites, and the consumers need only that eventual form (receipt K_A(d), K_B(d)). Correct; optional wording in M3.

## Findings

### M1. The chamber lemma's range of N omits N ≥ k (Required; 395rev M1, standing)

Where: l.204 (quantifier), l.206 (mesh condition); proof l.222. As stated in 395rev (`mathematics.md` M1 there; `lean-correspondence.md` L5 there) and sharpened in the re-read above. Suggested repair: "for every $N\ge k$ with" at l.204 (or $N>k$, as at l.105). Affects: the statement of the lemma only.

### M2. ref(d′) ≤ k is not stated where the solves lemma needs it (Should)

Class: statement (a missing hypothesis). Where: (F5) l.136–146; proof l.173–176.

The proof cites `eq:rank-reference-inverse`, obtained in the rank chapter at levels kept by "Retain only comparison levels $k\ge\operatorname{ref}(d)$" (l.90), with D_k built "from the normalized reference level to $k$" (l.186–187). The subsection does not mention ref, and no line of l.78–342 supplies it. Outside the subsection, the one-step chart output "covers all reference grades through $d$" (gallery l.40–42); in the source this is the field `TimberSky.early` (`∀ u: Fin (d+1), C.ref u ≤ i` at the output chart's level i, `Prom/Zoom/Boats.lean:44`). Neither (F5) nor the proof cites it, and the subsection does not say that it gives ref(d′) ≤ k for its witness. The hypothesis can also be restored by enlarging the threshold in "At every sufficiently large level $k$" (gallery l.19), since only finitely many grades occur. Unlike M1, whose gap is present at every large k, this gap is confined to finitely many levels; hence Should. In the source the hypothesis is `hk : C.ref d ≤ k` of `reference_size` and `Tested.bijective` (`Next/RANK/Matrices.lean:58, 78`), supplied by the field `PoisedSky.early` (lean-correspondence.md L6). The #393 record's (F5) row lists "`PoisedSky.charts` (`Charting` ⇒ `Tested`) and `supply`" (l.27), and the 19:22 comment matches the readings to "PoisedSky.charts and supply"; neither names `early`.

Suggested repair: add to (F5) (or as a further field) ref(d′) ≤ k for every d′ ≤ d, citing l.40–42 where it applies, and say in the proof that the estimate applies because ref(d′) ≤ k < N. Affects: the statement of (F5) and the lemma.

### M3. The Status paragraph and the opening predate #395 and #397 (Should; expository)

Where: l.183–185; l.82–84; l.337–341.

The Status paragraph says "This section records them but does not construct them." and names the funded run's cost and staging construction as the fields' source (l.184–185). The clock-fields lemma (l.245–263) derives the dilation, depth and bracket of (F1) and (F2) from the clock, and the remark (l.337–341) derives the wheel bound, replaces (F4) by `prop:rank-root-output-ticket`, and says "only the lawful history (F3) and the readings (F5) remain inputs". The opening promises to "prove the one property that follows from definitions alone" (l.83–84); the subsection now proves three lemmas, and since `63820370` the solves lemma rests on a proved estimate of the rank chapter. The diffs confirm these sentences are unchanged since `67de7339`. The #397 record (l.19) and the 15:31 comment on #392 give the new list of remaining inputs; neither concerns these two sentences. Mathematics unaffected.

Suggested repair: in Status, say that, for the clock of `sec:common-scale-selection` and all sufficiently large k (with the requests of `eq:rank-root-ticket-requests` included), (F1), (F2) and (F4) are supplied by the clock-fields lemma, the remark after it and `prop:rank-root-output-ticket`, and that (F3) and (F5) remain inputs; adjust l.83–84 to count the three lemmas. Optional: add "for all sufficiently large $k$" to the remark's "Consequently" sentence (l.338); that scope is inherited from the lemma (l.251–253) but not stated at l.338.

### M4. Two terms of the fields are not defined (Minor)

Where: l.146; l.113–114 against l.337–338.

(i) "It also carries a stamp duty with the same reading." (l.146): `git grep -i 'stamp duty'` at `1e511906` finds only this line and the rank chapter l.436, whose sentence (l.436–437) says the stamp duty "still has to be established". Its Lean counterpart is `StampDuty` (`Next/RANK/Tilt.lean:23`), mapped in the #393 record (l.27). Suggested: one sentence stating what the stamp duty asserts, or say the clause is recorded by name for the source. (ii) "the clock factors" (l.113) are first identified with the block lengths at l.337–338; the #397 record (l.19) states the same identification. Suggested: write min(L_{J(k)}, L_{J(k)−1}) ≥ 2 at l.113, or move the identification up. The stage J(k)−1 exists for large k because J diverges.

### M5. Notation in (F5) and the corrected labels (Minor, optional)

- ‖·‖ "in coefficient size" (l.143) is the |·|₁ of the proof (l.175) and of `eq:rank-common-tested` (rank chapter l.113–117); writing |·|₁ in (F5) removes the mismatch.
- "the grade-$j$ component of a label" (l.154) does not say which of a coordinate's two degrees is meant; the rank chapter has "Denote multiplication by $\rho$ to the first degree by $W_\rho$" (l.200–201), the position degree, and S_t for the factor degree; j is also the level index of (F1)–(F3). The manuscript's grade convention and the Lean `weightTag` (`(grades i).1`) agree with the position degree, so this is wording only.
- T_{d′}^{-1} is used at l.158, before l.166 states bijectivity (the fact is proved earlier in the book, rank chapter l.195–197); the space of e is not named.
- θ_k (l.153) is θ_clock(k) of l.131, and μ_k (l.86) is the 𝓜_k of rank-root l.301 (bridged in receipt l.22–23); β̂_j is used from l.117 and defined in this file at l.248, β_{N,p,k} (l.152) has no pointer (rank chapter l.94–97).

### M6. Wording in the clock-fields lemma (Minor, optional)

- "In particular $s_{m+1}\le2s_m$ once $J(m+1)\ge1$" (l.267–268). The entry bound is given at steps with J(m+1) > j_* (l.265). Read within that scope the clause is redundant; read on its own it covers first-plateau steps where it can fail (m = 0, if j_* ≥ 1: s_1 = log L_{j_*} > 0 = 2s_0). The conclusion s_k ≤ C_0 2^k holds either way, and "at each such step" would remove the doubt.
- The letter m is a level index in the statement and proof (l.248–249, 265, 313) and μ_k^b in item 1 (l.256, 276, from l.92). The proof of item 2 sets j = J_0(k) (l.298) and uses the recursion integers b_j, k_{j−1} (l.304) beside the base arc b and the level k, while j is a level in the statement (l.258, 260). The proof points to the notation of common-scale (l.298–299). Suggested: another letter for the level index (the proof already uses t at l.281, 324) and for the stage index.

## Notes without severity

- **The cover size c_k.** The #393 record already says: "The clock's \"cover size\" c_k is introduced by name only; the manuscript does not otherwise define it." (l.32). At `1e511906` the formula c_k=⌈(log β̂_k)²⌉ appears at l.250–251 (from #397) and at allarity l.939–940; it equals B(s_k) of common-scale l.79. l.89 still names c_k only. For μ_k the value is fixed elsewhere (rank-root l.300–301), and receipt l.22–23 identifies μ_k with 𝓜_k.
- **For the final combination (records note).** Four sentences in cited files predate #393 (`git blame`: `6865f2b3`, `413e82ad`, `71b21fae`, all before `67de7339`) and are now stale: receipt l.266–267 ("neither displays this inequality nor defines the middle cell"; (A) is the (F1) dilation, the middle cell is defined at l.98–99); receipt l.287–289 (root depth still listed as open; the chamber lemma supplies it, subject to M1); rank-root l.381–383 (the bracket "is not displayed in" the gallery; it is (F1) at l.115, proved by item 2); allarity l.763–764 ("We have not located their display"; items 2 and 5 there are (F2) and (F3)). The comparison Status (l.332–351) states nothing false. The rank chapter l.321–325 and l.433–437 agree with the closing remark. 395rev already noted the receipt item 3.
- **Cited files (no change requested of this subsection).** The rank chapter supplies the tested readout "for all sufficiently large $N$, uniformly in $p$" (l.435–436), while (F5), receipt (B) and (G3) are stated for every N > k; the consumer needs N > k_i only on a set of the ultrafilter (comparison l.234–236), and the Lean field is for every N > k (lean-correspondence.md L6). In the rank chapter, C_1 at l.383 (the clock-fields constant) also names the first front-column bound C_{u+1} at l.183–185.
- **The #412 pointer.** The 19:22 comment says "(the current subsec: pointer has no target)". `\label{subsec:rank-root-output-ticket}` is at rank-root l.283 at `67de7339`, `434c02a6^` and `1e511906` (added in `413e82ad`), and the bracket paragraph (rank-root l.375–386) lies in that subsection; the old pointer resolved. The new pointer is also correct. No change.
- **Author records.** The #393 record's l.15 and l.34 (injectivity hypothesis) describe `67de7339`, as its own Revision (l.42–44) says. The #397 record (last changed by `7b80cabc`) predates `f1fbe95d` and does not mention the repair; none of its sentences is made false by it. `f1fbe95d` and `434c02a6` change only the gallery and have no author record. The record-level points about Lean citations are lean-correspondence.md L15.

## Required changes and remaining uncertainty

Required: M1 (add N ≥ k, or N > k, at l.204). Should: M2 (state ref(d′) ≤ k), M3 (Status and opening). Minor: M4, M5, M6.

Not checked:

- N1. The cited interiority argument (`centered-construction.tex` l.192–196) beyond what 395rev records; where S_d is constructed.
- N2. The derivation of `eq:rank-reference-inverse` itself (the purchased front-column bounds); taken as a cited result, with only its hypotheses checked; how (G2)'s E_d is identified with the grade-d′ label space, and convergence along the ultrafilter.
- N3. The "row bound of the stage" and "along the course of the chart" in (F3); the sources behind "the cost and staging construction of the funded run".
- N4. The author records' build claims (`latexmk` exit 0, 1042 or 1043 pages, 0 undefined references, pages inspected; `check_blueprint.py` "see the PR"). No LaTeX build was run.
- N5. Whether the clock of common-scale satisfies the source's `Supply.Paid` and the hypotheses of `atlasSky`; the source never instantiates its abstract clock with A_j and J_0.

N6–N8 concern the Lean correspondence and are listed in lean-correspondence.md.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
