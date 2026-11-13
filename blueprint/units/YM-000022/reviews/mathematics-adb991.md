# Review of a proof unit

- Unit: YM-000022, `blueprint/units/YM-000022/`
- Role: mathematical validity
- Human reviewer: ADB991 (no acceptance recorded; see the last section)
- Agent assistance: one Claude agent running as a scheduled session (`ADB991-claude-20261113-af9e`) on behalf of ADB991. It checked the argument, opened the cited sources and wrote this report. ADB991 had not read it before submission. No other model was used.
- Content SHA-256: `24db9174727f1abf8bcb4211cb1c3bc601711dfd4c193983b1fde864a02ce056` (`python3 scripts/check_blueprint.py --fingerprint YM-000022` on `main` at `f73c5002e8d7e716fe5cce58185ec46ea74951b4`, i.e. after PR #115 merged; equal to the fingerprint announced in the #114 handoff)
- Reviewed content (file SHA-256): `manuscript/pilots/running-coupling.tex` `105a1a28e30be0756cd37ac9f8c22c77ed82547148c086a71788865670845426`; `manuscript/preamble.tex` `0827ef173e55ac6cf7b9726f3cbaaa5be93a5dfac8ffb2cfdf7b3faed65e90df`; `manuscript/references.bib` `844ea80b635fd9c4227dcc2baf4032ccb8403f018af160bc2dd0f2a6da89ac53`; `correspondence.md` `c9feae1ff19f0173ec2658c81379f038a3b54228b261be57cfd964749d1c655f`; `unit.json` `cfc20482faefa90b34cca4d903b0b21620efd55e60dd333cbeb69b8b96986731`.
- Manuscript files and labels: `manuscript/pilots/running-coupling.tex` (`sec:running-coefficient`, `eq:running`, `prop:uniform-extraction`, `prop:running-asymptotic`), `manuscript/preamble.tex`, `manuscript/references.bib`. The section inputs nothing else, so the `manuscript` list in `unit.json` is complete.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22), claim https://github.com/hairer/humanise-yang-mills/issues/22#issuecomment-6848731664; this report-only draft PR against `main`.
- Outcome: no change required; locally correct, conditional on the stated input `eq:running`. Three optional suggestions below. This is an agent review: no human acceptance and no approval field is set.

ADB991 is not an author of YM-000022 and wrote none of its earlier revisions or reviews. I read the earlier reports (`*-mgubi.md`, `*-schmittj.md`) but rechecked every step myself, and I reviewed the whole section, not only the PR #115 diff.

## Findings and evidence

### Opening: matrix Lie algebra and the Hall citation (new in PR #115)

Correct, and the citation is accurate. I downloaded arXiv:math-ph/0005032v1 (PDF SHA-256 `2be9f80e…f7f1`) and read the cited items with `pdftotext -layout`:

- Definition 2.2 (printed p. 9): a matrix Lie group is a subgroup of GL(n; C) such that every convergent sequence in it has its limit in it or non-invertible, i.e. a closed subgroup of GL(n; C).
- Definition 3.13 (printed p. 36): the Lie algebra of a matrix Lie group G is the set of all matrices X with e^{tX} ∈ G for all real t. This is exactly the displayed set in lines 7–10.
- Theorem 3.16 (statement p. 40, proof of point 3 finished on p. 41): for X, Y ∈ g, sX ∈ g for real s, X + Y ∈ g, and XY − YX ∈ g.

So the bibliography locator "pp. 36 and 40–41" is right. Hall's hypothesis is checked in line 11: G is closed in U(r_G), which is compact and hence closed in GL(r_G, C), so G is closed in GL(r_G, C). Theorem 3.16 then gives a real vector subspace closed under the commutator.

### Skew-Hermitian generators, inner product, Casimir, positivity

All correct; I recomputed each step.

- For X ∈ g, t ↦ exp(tX) is a smooth curve in U(r_G) through I with derivative X at 0. Differentiating exp(tX)^*exp(tX) = I gives X^* + X = 0.
- ⟨X,Y⟩ = −r_G^{-1} Re tr(XY) is real bilinear and symmetric. On skew-Hermitian X, −tr(XX) = tr(X^*X) = Σ|X_ab|², which is positive for X ≠ 0. (In line 23 the `Re` is dropped because tr(X^*X) is real; this was already noted as a nit in PR #113.)
- Basis independence: if f_i = Σ_j q_ij e_j with q orthogonal, then Σ_i q_ij q_ik = (qᵀq)_jk = δ_jk, which gives the displayed identity. Any two orthonormal bases are related in this way.
- Invariance: both ⟨[X,Y],Z⟩ and −⟨Y,[X,Z]⟩ equal −r_G^{-1} Re(tr(XYZ) − tr(YXZ)), using cyclicity tr(YZX) = tr(XYZ). [X,Z] ∈ g by Theorem 3.16, so ad e_j is a skew-adjoint endomorphism of g. Hence −Tr_g((ad e_j)²) = Σ_ℓ ‖[e_j,e_ℓ]‖² ≥ 0. If every [e_j,e_ℓ] vanished, bilinearity would make g abelian. Therefore C_g > 0 and b_0(G) > 0.
- Only the nonabelian clause of simplicity is used. This matches the correspondence record, which says the manuscript replaces the source's `casimir_pos` argument (through `trace_adjoint`, which uses full simplicity) rather than paraphrasing it.

### Input `eq:running` and scale divergence

The input is stated with its quantifiers in the right order: one fixed intercept β̄; for every η > 0 a threshold m_0(η); then for all m ≥ m_0, N ≥ m and all p. The threshold is uniform in N and p, and that uniformity is what the proofs use. The divergence s_m ≥ m log 3 → ∞ follows from a_m = (∏_{j<m} B_j)^{-1} with B_j ≥ 3. The input is correctly presented as an outstanding hypothesis, not proved here.

### Proposition `prop:uniform-extraction`

Correct. Since s_m → ∞, a threshold exists beyond which s_m > 2(|A|+1)/ε > 0. Beyond the larger of the two thresholds,
|β/s − c| = |β − cs|/s ≤ (|β − (A + cs)| + |A|)/s ≤ ε/2 + |A|/s,
and |A|/s < ε|A|/(2(|A|+1)) < ε/2. Both thresholds are independent of N and p. The proposition is stated for arbitrary real A, c, and as the text says, the proof does not use c > 0.

### Proposition `prop:running-asymptotic`

Correct.

- The thresholds are combined properly: for each ε, take the maximum of the extraction threshold and the index after which i ≤ N(i). The substitution m = i, N = N(i), p = k(i) is legitimate because the extraction bound is uniform in N ≥ m and in p. That is why no condition on k is needed.
- Positivity: taking ε = c/2 gives x_i > c/2 > 0 eventually, so β_{N(i),k(i),i} = s_i x_i > 0 there.
- Limit rules: I checked Lebl's statements. The HTML host in the bibliography URL is blocked by this environment's proxy, so I read the author's LaTeX source on the `master` branch of `github.com/jirilebl/ra`, file `ch-seq-ser.tex` (SHA-256 `18657062…d1ce`, fetched 2026-11-13), in the section "Facts about limits of sequences". `realanal.tex` declares lemma, proposition, corollary, example, remark and definition on the shared theorem counter, numbered within sections. Counting environments in that section gives Proposition 2.2.5, the algebra of limits, whose item (iv) is the quotient rule with y_n ≠ 0 for all n and lim y_n ≠ 0. It also gives Proposition 2.2.6: if x_n ≥ 0 for all n and x_n converges, then √x_n → √(lim x_n). Both are applied on a positive tail. The remark on modifying finitely many terms covers the "for all n" hypotheses. (I verified the source text and numbering, not the rendered HTML page the bibliography names. The two are generated from the same source, but the HTML edition inspected on 11 November is not pinned to a commit.)
- The final identity 1/√x_i = √s_i/√β = g √(log a_i^{-1}) holds by uniqueness of positive square roots on that tail.

### Closing remark

The remark is accurate and suitably limited. At N(i) = i the coefficient is the multiplier of the Wilson energy Σ(1 − r_G^{-1} Re tr U_p); see the Lean report for the source check. The text explicitly declines to identify the proxy with a physically defined coupling.

## Required changes and remaining uncertainty

No change is required. Optional suggestions:

- **S1 (wording, lines 12–14).** The citation supports "real vector space closed under the commutator". Finite dimensionality is not in Hall's Theorem 3.16; it holds trivially because g is a real subspace of M_{r_G}(C) ≅ ℝ^{2r_G²}. One clause saying so would keep the citation from appearing to supply it.
- **S2 (reader orientation, optional, not needed for correctness).** b_0(G) is defined with the normalized trace form, so it is not the textbook coefficient. A reader comparing it with the usual one-loop β-function may be misled. Here is my own computation (I have not checked it against a cited source). Take Hermitian generators T^a with tr(T^aT^b) = T_F δ^{ab} and structure constants normalized by f^{acd}f^{bcd} = C_A δ^{ab}. Then e_a = (r_G/T_F)^{1/2} iT^a is orthonormal for ⟨·,·⟩, and the section's constant is C_g = r_G C_A / T_F. For SU(N) in the fundamental representation (T_F = 1/2) this gives C_g = 2N², e.g. C_g = 8 for SU(2) with e_a = iσ_a. Therefore b_0(G) = (r_G/T_F) · 11C_A/(48π²). With the Wilson convention β = r_G/(T_F g²) (β = 2N/g² for SU(N)), the slope 2b_0(G) of `eq:running` is exactly the standard one-loop slope of β in log a^{-1}. Correspondingly the proxy satisfies g_{N,p,m}² = (T_F/r_G) g_{\rm std}². A one-sentence remark with a verified textbook citation would help readers and would also settle consistency questions elsewhere (see the G04 finding G04-F1 in PR #119). The section's current disclaimer is correct without it.
- **S3 (nit, line 4).** "in the indicated unitary representation" could read "in a fixed faithful unitary representation", matching the source structure `YM.Gauge` (a closed subgroup of U(r_G)).

Not checked: the construction family and the proof of `eq:running` (outside the unit; stated as an outstanding input); the rendered Lebl HTML page; any physics literature for S2.

Commands actually run (all on `main` at `f73c500`): `python3 scripts/check_blueprint.py --fingerprint YM-000022` (output above); `python3 scripts/check_blueprint.py` ("Blueprint structure OK: 2 units"); `python3 -m unittest discover -s tests` (22 tests OK); `curl -sSL https://arxiv.org/pdf/math-ph/0005032v1` then `pdftotext -layout`; `curl https://raw.githubusercontent.com/jirilebl/ra/master/{ch-seq-ser,realanal}.tex`; and the LaTeX build recorded in the Lean report.

## Acceptance

Not recorded. An agent review is evidence for a human reviewer and is not acceptance. `unit.json` approvals remain null. Any change to the listed files changes the fingerprint and needs renewed review.
