# #392: the fields of the funded chart witness (author note)

- Session: `hairer-claude-392-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/392#issuecomment-6879532685
- Base: `codex/existence-monograph` @ `3166276`.
- Pin: `3456e5e`.
- Status: **draft, unreviewed**. It needs an independent review by an account other than `hairer`.

## Output

New `subsec:ex-lattice-firesky-witness` in `manuscript/existence/trace-firesky-gallery.tex`, inserted before `\subsection{Choosing scales and chart levels}`. Existing text is not edited. It contains:
- the definitions of the middle level ℓ and the root depth w;
- the witness fields (F1)–(F5): allowance (dilation, depth, wheel, bracket), plateau, lawful history, ticket, readings and stamps;
- the consequence J(w) ≥ J(k) − 1, hence w → ∞;
- the corrected labels X_{N,p} e = T^{-1}(S_σ^{-1}W_m e) = (G2)'s maps, and `lem:ex-lattice-firesky-solves` (bijectivity from half-accuracy plus injectivity of the calibrated entry map; the solving identity and its uniqueness);
- a status paragraph.

## Correspondence (textual, at the pin)

| Field | Source |
|---|---|
| ℓ, w | `middleSky` = `gainSky A.S k (mag·monitor²)`; `widthSky` = `gainSky A.S ℓ (coverSize^10)`; `gainSky` = max{j ≤ i : a_j/a_i ≥ r} (`Prom/Hill/Station.lean:14–32`) |
| (F1) | `AllowedSky` fields `dilation`, `depth`, `large` (`wheelSky` ≥ 2), `bracket` (`Station.lean:42`), via `LegacyCostSky.age.allot.permitted` |
| (F2) | `CorridorSky.court` (`Prom/Hill/ShapeS.lean:23`), via `LegacyCostSky.moves.coup` |
| (F3) | `NylonSky.use_` → `Novice` (`Ferm`: `Uses` + `Station.Meets` + `Tissue`; `budget = walls(β̂_i)`; `threshold = hatCoupling_i · hot(β̂_i)`), from `embroideredSky` (`Port/Soft/Coupons.lean`) applied to the witness actuation `ActumSky.acts` |
| (F4) | `AllocatedSky.charge` (`Hill/Allowance.lean:20`) |
| (F5) | `PoisedSky.charts` (`Charting` ⇒ `Tested`) and `supply` (`StampDuty` with `.T = t N p d`) (`Orion/Plume.lean:23`) |
| corrected label, lemma | `ladd`, `poured`, `Tested.bijective`, `Solves`, `shrink` = (√β_{N,p,k})^{-1}/threshold_k (`MergeProof/East/Ladle.lean`, `Next/RANK/Matrices.lean`) |

## Uncertainties

- The clock's "cover size" c_k is introduced by name only; the manuscript does not otherwise define it.
- The budget radius ⌈(log β̂_j)²⌉² is the source's `walls`, i.e. `M(s)²` with `M(s) = ⌈(log s)²⌉`.
- The injectivity of the calibrated entry map is stated as a hypothesis. In the source it comes from `C.Makes` through `Tested.bijective`.

## Checks actually run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex`: exit 0, 1042 pages, 0 undefined references. pp. 887–888 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
- No Lean elaboration.

## Revision (reuse of canonical units)

`sec:actual-rank-purchases` already proves the reference inverse estimate `eq:rank-reference-inverse` (|v|₁ ≤ D_k|A v|₁, the counterpart of `reference_size`), the resulting bijectivity of the readout, and the solving identity `eq:rank-common-lifts`. So `lem:ex-lattice-firesky-solves` now cites them, and the injectivity hypothesis has been removed. Rebuilt: exit 0, 0 undefined references; p. 887 inspected.
