# Independent review of PR #362: tilt cap and logarithmic zoom bound (#361)

- **Session:** `hairer-claude-361rev-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5). hairer did not author #362 or these files.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/361#issuecomment-6873861648>
- **Reviewed:** #362 head `3f5cf17` (merged `03684ad`):
  - `trace-clock-cap.tex`;
  - the citation edits in `trace-scribe-producer.tex` and `trace-small-means.tex`;
  - `trace-clock-cap-evidence.md`.
- **Source pin:** `3456e5e`. All eight Lean files read match `Lean/SOURCES.sha256` (`hashes.json`). The source was read textually; nothing was elaborated.

Human acceptance is unset.

## Verdict

**No required change.** Every displayed inequality holds, and the statements match the source. One should-fix (S1) and two minor items remain.

## Mathematics

- **Definition.** tiltcap(j) = 𝓜_j^{u_j} = exp(u_j³), with u_j = log log β̂_j. Monotonicity of c ↦ 𝓜_j^c uses 𝓜_j ≥ 1. Correct.
- **Lemma `lem:ex-lattice-trace-tiltcap-ticket`.**
  - (1) L ≥ 1 gives 0 ≤ u < L, so 1 ≤ exp(u³) ≤ exp(L³).
  - (2) For p ≥ 0 and ρ′ > 0, eventually L ≥ 1 and L^45 ≥ p/ρ′. Hence p·L³ ≤ ρ′L^48.

  The ticket definition matches the one in `trace-small-means` and `trace-bill-prices` (gate (log β̂)^48). Correct.
- **Receipt (`eq:ex-lattice-clock-cap-receipt`).** b_i = 𝓜^{c_i} with 5 < c_i ≤ u gives 1 ≤ 𝓜⁵ ≤ b_i ≤ tiltcap. Correct, given the gallery's exponent window (see S1).
- **Lemma `lem:ex-lattice-trace-log-zoom`.** We have 0 ≤ log b_i ≤ u³ ≤ L³ ≤ L^48. Also (log t)^48/t → 0. Correct.
- **Citation edits.** The scribe's third clock clause and the small-means tiltcap ticket now cite the lemmas. The other inputs remain marked as inputs. Correct.

## Lean correspondence

- `Terrace.Ticket P a v` is ∀ b > a, eventually 0 ≤ v_i ≤ exp(b·Gate(β̂_i)) (`Terrace/Fund.lean` l.12). Matches the manuscript's ticket.
- `tilt_cap P i = Station.mag P (Perch.y (β̂_i)) i` (`Fund.lean` l.36), where:
  - `mag A b k = monitor k ^ b` (`Next/RANK/Station.lean` l.47);
  - `Perch.y s = log log s` (`Next/RANK/Reign.lean` l.22);
  - `monitor m = exp((log log β̂_m)²)` (`RG/History.lean` l.81).

  This is exactly `def:ex-lattice-tiltcap`.
- `titles` (`Fund.lean` l.37) proves `Ticket P 0 tilt_cap`. `Ticket.pows` (l.27) gives every power. This matches the lemma.
- `tiltP` (`Terrace/Cabin.lean` l.39): b ≤ y(β̂_i) ⇒ mag b i ≤ tilt_cap i, via `rpow_le_rpow_of_exponent_le` with base `one_le_exp`. This is the monotonicity step.
- `TimberSky.high : 5 < b ∧ b ≤ Perch.y (clim A i)` (`Prom/Zoom/Boats.lean` l.43) is the gallery's exponent window. `zoom_BQ` (`Chart/Orr.lean` l.48–50) applies `tiltP` to `(hq.season i).1.high.2`, so the "permitted angular bound" `Perch.y (clim A i)` is `y` of the clock rate at the chart's level. **This confirms the author's flagged identification.**
- `zoom_BQ` itself bounds `log b_zoom ≤ Gate(β̂_k) = (log β̂_k)^48`, through `titles` at rate 1. The manuscript's direct bound, with exponent 3, is stronger and implies it.

## Findings

- **S1 (should).** `trace-firesky-gallery.tex` l.40–41 says "b no larger than the permitted angular bound" but never defines that bound. `trace-clock-cap.tex` supplies the identification log log β̂_{j_i}, which the source confirms. One clause in the gallery, "the permitted angular bound is log log β̂ at the chart's level", would make the receipt rest on a stated property rather than on a reading.
- **N1.** The source zoom is `b_zoom V i = mag (V i).b (V i).k`, indexed by `(V i).k`. The manuscript calls this level the frame level j_i of the i-th chart, consistently in the scribe, mission-price and small-means chapters. A one-line note in the evidence file would help a correspondence reader.
- **N2.** The source's log bound is at exponent 48 via `titles`. The manuscript proves exponent 3 directly. This is fine; say so in the evidence file.

## Checks

- `python3 scripts/check_blueprint.py`: OK.
- `git diff --cached --check`: clean.
- No LaTeX build: no `.tex` file changed in this report.
