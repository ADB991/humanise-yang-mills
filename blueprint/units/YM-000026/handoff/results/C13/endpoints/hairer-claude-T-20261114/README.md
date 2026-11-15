# The tested readout (input (T); M7 of review #409): source supplier and reduction (audit report)

- **Session:** `hairer-claude-T-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/415#issuecomment-6883522616
- **Base:** `codex/existence-monograph` @ `edd3c4e`. **Pin:** `3456e5e`. All cited Lean files match `Lean/SOURCES.sha256` (`hashes.json`).
- **Status:** report-only and unreviewed. This is a textual reading; nothing was elaborated.

Labels: (Q) quoted; (I) inference; (U) unchecked.

## 1. What is needed

The readout of `eq:rank-common-tested` is a complex-linear T: V_d → V_d with three properties:
- T e₀ = e₀;
- T v̄ = conj(T v);
- |A v − T v|₁ ≤ ½|A v|₁ for every v, where A = A_{k,N,p} is the primary-coordinate map including the factor a_k^{−d}.

It is needed at every large k on the same endpoint, eventually in N and uniformly in p. The source type is `YM.Next.Rank.Price.Tested` (`Next/RANK/Matrices.lean:67`), with `unit`, `preserves` and `score`. Tested maps are bijective by `Tested.bijective`, using `reference_size`. That is the injectivity already used in the gallery via `eq:rank-reference-inverse`.

## 2. The source supplier

1. **`YM.Next.Rank.East.mintingSky`** (`TraceExtension/Prom/Orion/Eupho.lean:18`). Eventually in k, for all N ≥ k and p, given a representation Q with the stage threshold and budget radius, and a stamp `Hail`, it produces a `StampDuty` Y. The map Y.T is signed-motion equivariant and satisfies `InvoiceSky`, i.e. relative error ≤ H^{−1/2}. That is stronger than ½.
   (Q) The readout comes from `obtain ⟨T,hT⟩ := hf N p hN K L hX.2 hM`, where `hf` is the filter of `kpc_plusSky`.
2. **`YM.Next.Rank.LiftMark.kpc_plusSky`** (`TraceExtension/Prom/Orion/Ducat.lean:42`). For an atlas X and a Taylor reader `L : Heater F k d` it requires two things:
   - the covariance bound ‖control X cov‖ ≤ B, with B = `tin s n`;
   - `MarkedStart L Q n B g ε`, with ε = H^{−1}.

   It then gives `∃ T, LCheque … (Wick X L) T (κ H^{−1/2})`. The numerics come from `terms_paySky`, which holds eventually in k.
3. **`pins_extra`/`pins`** (`Next/RANK/Rails.lean`). (Q) `let P := (expose F').leftInverse.comp (printed (Wick X L)); let T := F'.scaled z ∘ₗ P`.
   - **The readout is explicit.** Apply the Wick projection under the atlas covariance to the Taylor reader. Keep its printed (frame) part, invert the exposure, and rescale by z = t/g (clock threshold over gauge scale).
   - **The estimate.** The unit clause comes from L(1) = 1, and reality from the symmetry clause of `MarkedStart`. The error is bounded by 2c(ε + B·annuity(t,B,ε,n)) ≤ κ, where c is the frame constant of `zonal` and `annuity t c e n = n(tc)(2c)^n + e(2(n+2))^n c^n` (`Pin.lean:61`).
4. **`MarkedStart`** (`Rails.lean`) has four clauses:
   - (MS1) L(1) = 1;
   - (MS2) deg L v ≤ n, and the coefficient size of the rescaled L v is ≤ B|A v|;
   - (MS3) the printed Wick projection of L v is the exposure of a frame vector w, and that of v̄ is the exposure of w̄ (colour invariance and reality);
   - (MS4) the **pin**: there are a transport T and data with `Diet X T B` such that the *garnished* reading of the rescaled L v (the Taylor reader composed with the actual nonlinear gauge transport, truncated at frame grade) reproduces the actual primary coordinate within ε|A v|.
5. **`Heating`** (`Next/RANK/ParticleGate.lean:31`) bundles `Tested` with the primal bound, the degree bound and the `Verdict` test. **`StampDuty`** (`Next/RANK/Tilt.lean:23`) adds the stamp `coupon`, a `Ticket` on the halo of radius qB, with price H^{−D}.

## 3. Manuscript counterparts

| Source | Manuscript | Status |
| --- | --- | --- |
| atlas covariance X, ‖cov‖ ≤ B, its rescaled smallness ε | `sec:allarity-coordinate-calibration`: the enlarged mean m and covariance Q with \|Q − F^ext\| ≤ PT², B = H^λ, ε = H^{−2}, `eq:allarity-meridian-purchases` | (I) present, in a slightly different normalization (B = H^λ against `tin s n`); (U) the rescaling by z = t/g is not checked |
| Wick evaluation 𝒲_{Q,μ} | `sec:allarity-cumulant-comparison` (Wick evaluation, l. 17ff.) | present |
| (MS1)–(MS2), Taylor reader with degree and coefficient bounds | the polynomial curvature coordinates of `sec:allarity-coordinate-calibration` (finite differences recover the jets) | (I) partly present; the coefficient bound by B\|A v\| is not stated |
| (MS3), colour invariance and reality of the projected reading | not found | missing |
| (MS4), the pin of the actual primary coordinate by the garnished reading | not found. The calibration section *assumes* \|awake u\| ≤ 2\|Tu\| (l. 216–223) | **missing; this is the analytic core** |
| `pins`, from MarkedStart to Tested | not found | missing, but elementary given (MS1)–(MS4) (I) |
| numerics `terms_paySky` | not found | elementary, eventual (I) |
| `StampDuty.coupon` | the gallery's (F5) stamp | open (#398) |

## 4. Reduction of (T)

(I) Input (T) follows from:
- **(T-a)** the Taylor reader of the calibration section, with (MS1)–(MS2) at the clock threshold;
- **(T-b)** (MS3), reality and frame-invariance of its Wick projection;
- **(T-c)** (MS4), the pin with ε = H^{−1};
- **(T-d)** the covariance bound of `eq:allarity-meridian-purchases`, after rescaling by t/g;
- **(T-e)** the elementary Wick-projection lemma, the manuscript form of `pins`. It defines T as the rescaled printed Wick projection, and proves the three properties of `eq:rank-common-tested` with relative error ≤ 2c(ε + B·annuity).

Only (T-c) is substantial. (T-e) and the numerics can be written directly from the source. Whether (T-c) is available is the question for the next session. It is the comparison between the actual primary coordinate (the lattice reading along holonomy paths) and the polynomial Taylor reading.

## 5. Recommendation

Open a producer task with two parts:
1. Write (T-e) as a lemma in `sec:allarity-coordinate-calibration`, defining T explicitly. This replaces the sentence that assumes T.
2. Audit whether the existing coordinate-recovery argument ("Recovering polynomial curvature coordinates from differences") together with the actual covariance estimates gives (MS4). If it does not, state (MS4) as the single named input.

## Checks actually run

- Textual reads of the files listed in `hashes.json`.
- SHA-256 of those files compared with the pin manifest.
- `python3 scripts/check_blueprint.py`.
