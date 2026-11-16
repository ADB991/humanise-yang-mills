# Independent review of PR #356: pointwise rounded comparison (#336)

- **Session:** `hairer-claude-356rev-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5). hairer did not author #356 or these files.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/336#issuecomment-6874102679>
- **Reviewed:** `subsec:trace-rounded-comparison` (`trace-rounded-comparison.tex`, as merged on `codex/existence-monograph`), together with its `\input` and status sentence in `trace-asymptotic.tex` and the author README.
- **Source pin:** `3456e5e`. The six Lean files read match `Lean/SOURCES.sha256`. The source was read textually; nothing was elaborated.

Human acceptance is unset.

## Verdict

**No required change.** Under (G1)–(G4) and (Ph1)–(Ph3), every step is correct. The conclusions match `Verse.seat` and `Verse.conj_M`, and the corollary meets the pointwise, continuity and window clauses of `input:trace-scales` exactly, including the form ε_i(1+M). The author's status paragraph is accurate: (G3) is an open input, and the source obtains it from a private lemma (`MergeProof.East.await` via `lava_vSky`). There are two minor items.

## Mathematics

- **Rounding.** The error is < 1/m in each of 4n coordinates, so |ρ_m(x) − x| ≤ 2√n/m. Idempotence holds. Fitness depends only on ⌈mx⌉. Correct.
- **Corrected polynomial.** Existence and uniqueness follow by induction, and Φ_{0,1} = (f₀ − j₀)(f₁ − j₁) − κ, recomputed. Correct.
- **`lem:trace-rounded-conjugate`.** χ is a star homomorphism, so χ(Z) = 0 for all χ. Then ‖ZΩ‖² = ∫|χ(Z)|²dμ = 0 by the spectral state, and Z = 0 because Ω is separating. Correct.
- **`prop:trace-rounded-comparison`.**
  - Step 1: the three packets, their cutoff polynomials and their compressed limits are correct. The packet hypotheses (grid sites, coordinatewise separation, (N,p)-independent coefficients, label convergence, w_i ≤ k_i, chamber domain on an 𝓛-large set, root price ε_i) are each checked against (G1)–(G4).
  - Step 2: the full-support moment lemma gives |χ(D)| ≤ ε_i for every χ. Then the identity S_χ(w) − (κ + j₀j₁) = χ(D₀₁) + j₀χ(D₁) + j₁χ(D₀) was verified by expanding S_χ(w_c) = χ(D_c) + j_c.
  - Step 3: the null-relation clause is used only for the selected χ, after Step 2 has been proved for all χ. Correct.
  - The threshold depends only on d.
- **`cor:trace-rounded-input`.**
  - m_i ≥ μ_{k_i}^5 → ∞ gives q_i(x) → x.
  - The interior-plus-separation neighbourhood argument and the width clause give fitness.
  - The bound is ε_i(1+M_{αβ}), as `eq:trace-basis-error` requires.
  - Continuity follows from the assumed continuity of the reference correlations.
  - Window: |x(t)₀ − x(t)₁| = t, |x(t)| = t, and x(t) is coordinatewise separated.

  Correct.

## Lean correspondence

- `Verse.seat` (`Verse/Pears.lean` l.23–28): ∀ᶠ i, ∀ x with `FitSky` and `fad x ∈ Scaling.window 100 2`, ‖classMoment − reference‖ ≤ costHint i + (‖m.part slot0‖ + ‖m.part slot1‖)·costHint i. This is (eq:trace-rounded-comparison), with m the one-point parts.
- `costHint k = (k+1)⁻¹` (`Next/UV_STRESS/Rates.lean` l.21–22), which is ε_i.
- `Scaling.window R n = {spaced R⁻¹ ∧ ‖x‖ ≤ R}` (`Climb/Tests.lean` l.40), which is 𝒲 at R = 100.
- `SeqPair` (`Prom/Zoom/Boats.lean` l.21–29):
  - `width` is the width clause;
  - `boot` gives the root tests of the corrected-polynomial parts for every nonempty mode set, for N > i (the chart level), every period and every fit x in the window, with bound ε.

  This is (G3) exactly. It is produced only by the private `await` (l.31–) from `PoisedSky` via `lava_vSky` and `Ship.diminishes`, which confirms the author's finding that (G3) has no manuscript producer.
- `Verse.conj_M` (`Verse/Stars.lean` l.22–) is `lem:trace-rounded-conjugate`, by the same character argument.

## Findings

- **N1.** Step 1 says "constants, sums and products preserve that [chamber-local] domain". This is true and used in the source (`Verse/Part.lean`, the `hu` step for the cut fields), but the text gives no manuscript reference. Cite the chamber-domain algebra in `sec:actual-phase-detector-moments`, or add one sentence.
- **N2.** (G1) asserts μ_k^5 → ∞. This follows from μ_k = exp((log log β̂_k)²) and β̂_k → ∞ (`sec:ex-lattice-trace-clock-cap`, now merged), and could be cited rather than assumed.

## Not established

(G3) remains open (see #336), and so do (G2) and (G4) as stated inputs, (Ph1)–(Ph3), and the identification of the chart sequence with the comparison subsequence (#337).
