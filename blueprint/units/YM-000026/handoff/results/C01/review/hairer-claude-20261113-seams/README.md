# Independent check: Wilson seam positivity attached to the planted inequality (#287, audit #291)

Session `hairer-claude-20261113-seams-review`. Reviewer account `hairer`
(coordinator), which did not author `lattice.tex`, the consumer
`prop:ex-centered-planted` (#286) or the audit #291. Canonical
`codex/existence-monograph` at `7daea59b`:
- `lattice.tex` SHA-256 `b8172d7e2c6aafb27a8ad007858e0a49159a9a4f9c00caa07addf99a29a7764f`;
- `centered-estimates.tex` SHA-256 `f470c06431eafa5533dd10dee647bce9abdf9a4a018afd7498465dd8231f2313`.

Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Textual
mathematical check only; I did not re-audit the producer's proof, which
was reviewed by a different account in #83, nor its Lean correspondence.

**Verdict: the attachment is correct, and the audit's conclusion stands.**
One minor manuscript-completeness point (M1) is recommended as a separate
small task.

## Hypothesis mapping (producer → consumer)

| `prop:ex-centered-planted` premise | `prop:ex-lattice-finite-reflection` and `lattice.tex` | Check |
| --- | --- | --- |
| Finite torus of side `2hℓ`, `h,ℓ≥1` | Even side `2h'`, `h'≥1`; take `h'=hℓ` | ✔ |
| One normalized law `μ` | `μ_{2h',β}`, `β≥0`, the normalized Wilson law on `G⊂U(r_G)` | ✔ |
| Site seam `x_a↦2c−x_a`, `c=b_a+ℓp_a`; positive half `(0,hℓ)` | Site cut `t↦−t`, strict sector `1≤t<h'`, translated by `c` | ✔ |
| Link seam `x_a↦2c−1−x_a`; positive half `[0,hℓ)` | Link cut `t↦−1−t`, sector `0≤t<h'`, translated by `c` | ✔ |
| Every `p` and every axis `a` | "the same statement holds at every translated cut and for every choice of time axis" | ✔ |
| Pullback with reversal of oriented links | `ΘU` pulls back along reflected oriented edges, a reversed edge read as the inverse | ✔ |
| `H` bounded, measurable, gauge invariant, links with both endpoints in the half | `F` bounded Borel, gauge invariant, same locality (Borel and measurable agree here) | ✔ |
| `E_μ[H·conj(H∘R)]∈[0,∞)` | `∫F·conj(F∘Θ)dμ≥0`, stated real | ✔ |
| Law invariant under every `R_{p,a}` | **Not stated in the manuscript**; see M1 | ✔ mathematically |

## M1 — reflection invariance of the Wilson law is not stated in the manuscript (minor, recommended)

`prop:ex-centered-planted` assumes that `μ` is invariant under every seam
reflection `R_{p,a}`. `lattice.tex` proves gauge invariance of the law
(`Gauge invariance of the finite action and law`) and reflection positivity,
but has no statement of reflection invariance. The argument is currently
given only in the audit record (#291, `mathematics.md`, "Reflection
invariance checked"). It is correct:
- the reflection is an automorphism of the even torus;
- the pullback permutes the product Haar coordinates and inverts reversed
  links, and Haar measure is inversion invariant;
- each plaquette holonomy is sent to that of the reflected plaquette, up to
  cyclic conjugation and inversion;
- for `G⊂U(r_G)`, `Re tr(V^{-1})=Re tr(V^*)=Re tr V`, and trace is
  conjugation invariant, so `S_ℓ` and the density are invariant.

For the chain #286 → `lem:ex-centered-root-seminorm` → I-C02-root-seminorm to be
complete in the manuscript, this should be a short proposition (or
paragraph) in `lattice.tex` beside the gauge-invariance proposition. Since
`lattice.tex` is read-only for #287, I recommend a separate bounded task.
It does not affect the audit's conclusion.

## Other observations

- The site-cut strict sector is empty when `h'=1`. The positivity statement
  is then trivially true, and the consumer's geometry never needs that case
  separately.
- The copy-parity convention (one seam flips one parity and conjugation is
  applied outside the pullback) matches the producer's form. #290 already
  reviewed its use inside #286's proof.

## Not checked

- The producer's proof (reviewed in #83; unchanged since).
- Lean correspondence of `YM.Slice.reflected_positive`.
- The selection of the actual law at downstream cutoffs, RG budgets and
  continuum limits.

## Checks run

Statements read at the canonical commit above. `python3 scripts/check_blueprint.py`
passes. No manuscript change, hence no build.
