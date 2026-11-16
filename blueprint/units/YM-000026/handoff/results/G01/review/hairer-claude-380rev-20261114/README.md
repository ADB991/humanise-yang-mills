# Independent review of #380 (statement section: the target is satisfied by a generalized free field)

- **Session:** `hairer-claude-380rev-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/379#issuecomment-6882370024
- **Reviewed:** the additions of #380 (schmittj, head `931ae835`, merged as `5e0246e`) to `manuscript/existence/statement.tex`:
  - the paragraph "A caution about the target of this section";
  - subsection `ex-target-free-witness` with `prop:ex-target-free-witness`.

  The file is unchanged on `codex/existence-monograph` at `7edd9c2`. The SHA-256 is in `hashes.json`.
- **Independence:** hairer did not author #380. The coordinator asked for the content but wrote none of it.
- **Scope, per the acceptance of #379:** the mathematics and wording of the new subsection. The formal development (`results/G01/formal/FreeField/`) was reviewed separately (#359). It is not re-reviewed here.

## Verdict

**Accepted. No required change.** There are three optional wording notes.

## What was checked

1. **Källén–Lehmann measure.** The field has dμ = w(p) d⁴p on the closed forward cone, with w = (p²)²/log²(e+p²). The identity d⁴p = ds · d³p/(2E) at fixed **p** gives the density s² log⁻²(e+s) relative to the shell measures d³p/(2√(s+|**p**|²)). ✓
2. **Euclidean two-point function.** The measure is Lorentz invariant, so ∫e^{-τE+i**u**·**p**} dμ depends only on |ξ| for ξ = (**u**, τ), τ > 0. It therefore equals S(ξ) = ∫e^{-|ξ|E} dμ. ✓
   - The pairing convention ⟨y−x, p⟩ differs from the Minkowski one only by **p** ↦ −**p**, under which μ is invariant.
   - It gives the factor e^{iE(t_y−t_x)}, which is the right sign for positive energy. ✓
3. **The constant 384π.** For a shell of mass m, ∫ d³p/(2E) e^{-rE} = 2π m K₁(mr)/r. With s = t²/r²,

   S(r e_t) = 4π r^{-8} ∫₀^∞ t⁶ K₁(t) log^{-2}(e + t²/r²) dt.

   As r ↓ 0 the logarithm is 2 log(1/r)(1 + o(1)), uniformly on compact t-sets, and the tails are dominated. So r⁸ log²(1/r) S(r e_t) → π ∫₀^∞ t⁶K₁(t) dt = π · 2⁵Γ(4)Γ(3) = 384π. ✓
   - Numerical check run here: ∫₀^∞ t⁶K₁ = 384.000.
   - The finite-r ratio to the limit is 0.64, 0.79 and 0.88 at r = 10⁻³, 10⁻⁶ and 10⁻¹². This is consistent with the expected 1/log convergence.
4. **Normalization of Θ.** λ²·384π = 3 dim_ℝ 𝔤/π⁴ gives λ² = dim_ℝ 𝔤/(128π⁵). ✓ Θ = λφ has grade 4 + 0 = 4, and its one-point function vanishes. ✓
5. **Operator-product bounds.** The bound |∂^γS(ξ)| ≤ C_γ|ξ|^{-8-|γ|} holds at all |ξ|, by the same substitution:
   - at small |ξ| the logarithm only helps;
   - at large |ξ| the weight s² near s = 0 gives the same r^{-8} scaling.

   Wick's theorem plus Taylor expansion of the uncontracted factors gives one coefficient family for all truncation degrees. Remainders are controlled by the next Taylor order. The description is correct at the level of detail the subsection claims ("we describe the construction and do not repeat the proofs").
6. **Reconstruction properties.** The list is correct for a generalized free field. Uniqueness of the vacuum follows from positivity of the total energy a.e. in each k ≥ 1 sector, with no gap needed. Nontriviality of labels follows from positivity of w in the open cone, together with independence of the momentum polynomials of distinct Wick monomials. ✓
7. **Lattice clauses.** The subsection applies `rem:ex-target-adequacy` with homogeneity in the unit (multilinearity). It also discloses the variant used in the formal proof (indicator of the zero vector; a zero-field channel per grade). ✓
8. **"Why the target admits this" and "What this does and does not say."** These are consistent with the remark and with the target as stated. They are appropriately limited: no claim about the construction, about the stronger combined target, or about whether the constructed theory could be a generalized free field.
   - The two quotations from the review group's assessment are short and attributed.
   - Their wording matches the version as corrected in #380's second commit; I did not re-check them against the PDF.
9. **Build.** A full `latexmk -pdf existence.tex` of a tree containing #380 (base `e91c0502` plus #400, run earlier in this session) reported no undefined references.

## Optional notes

- **N1.** "the measure on ℝ⁴ with density w(p)": say "with respect to Lebesgue measure d⁴p", since the Källén–Lehmann sentence relies on that normalization.
- **N2.** The limit 384π is stated without derivation. One displayed line would let a reader check it: the substitution above and ∫₀^∞t⁶K₁(t)dt = 384.
- **N3.** The caution paragraph's last sentence ("formulating it as the main theorem of this article remains to be done") overlaps with #382 item 1. The coordinator may want to link the two when that item is taken up.

## Consequence for #379

The acceptance of #379 is a review of the mathematics and wording by someone other than the author session, plus a full build with no undefined references. Both are now met.

## Checks actually run

- Read the #380 diff of `statement.tex`.
- Numerically integrated (scipy) ∫t⁶K₁ and the finite-r ratio.
- The earlier full LaTeX build noted in item 9.
- `python3 scripts/check_blueprint.py`.
- The formal development was not rebuilt.
