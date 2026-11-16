# Independent review of PR #309: C04 coordinate-convention paragraph

- Unit: YM-000026 (existence monograph), C04 `manuscript/existence/complex-heat.tex`, the paragraph "Coordinate convention in Sections complex-heat–locality" (l. 104–127 at the reviewed revision). Also read: the author note `results/C04/author/hairer-claude-20261113-c04coord/README.md`, issue #308, rule (T) of endpoint report PR #248 (F1).
- Role: mathematical validity and textual Lean correspondence (both).
- Human reviewer: none yet. This report was prepared autonomously by Claude (Anthropic) as a scheduled agent on behalf of ADB991. ADB991 has not read it. Under `docs/proof-standard.md`, a human reviewer must take responsibility before acceptance.
- Agent assistance: Claude Code, session `ADB991-claude-20261113-454c` (single agent, no subagents).
- Independence: the edit under review is by the hairer account (session `hairer-claude-20261113-c04coord`). The C04 chapters were drafted earlier under ADB991 (sessions in `results/C04/handoff.md`), including the superseded version of this paragraph; this session did not write the new paragraph. Issue #308 asks for review "by an account other than the editor", which this satisfies. If the coordinator prefers a reviewer independent of the original C04 author as well, this report should be treated as a second opinion.
- Reviewed content: PR #309 head `c611ebe8bb791eee7ea5adfa5a2f7ae5c3bf423b`, merged into `codex/existence-monograph` as `44c05e4`. `complex-heat.tex` SHA-256 `781730fb1e704bca1aba9f1e2a357d90ad58004790dd630fe780483019b51e59`, byte-identical at the integration head `922d1fe5` checked here. Hashes in `hashes.json`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (imported `Lean/` tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`).
- Review task: https://github.com/hairer/humanise-yang-mills/issues/308 (claim https://github.com/hairer/humanise-yang-mills/issues/308#issuecomment-6866981879).
- Outcome: **no required change.** Every substitution in the new paragraph is correct, the false claims of the old paragraph (that the permutation is a symmetry, and that statements transfer verbatim) are gone, and the paragraph agrees with rule (T) of #248 and with the target conventions of `statement.tex` and `Lean/PublicTheory.lean`. Minor notes N1–N2 and optional notes O1–O2 follow.

## Mathematics

Write `x = (t, 𝐱)` for time-first and `y = (𝐲, s)` for time-last coordinates, and `C(t,𝐱) = (𝐱,t)`. As a matrix `C` is the permutation matrix of the 4-cycle `0→3, 1→0, 2→1, 3→2` on indices. I checked each assertion independently.

1. **`|det C| = 1`, `C⁻¹ = Cᵀ`.** A permutation matrix is orthogonal. Here `det C = −1` (a 4-cycle is odd), so the absolute value in the text is needed and correct (see O2).
2. **Minkowski matrices.** The time-last form is `Q_last(y) = Q_first(C⁻¹y) = yᵀ C⁻ᵀ η_first C⁻¹ y = yᵀ C η_first Cᵀ y`, using `C⁻ᵀ = C`. So `η_last = C η_first Cᵀ`, and `Q_last ∘ C = Q_first`. Correct; `η_last = diag(−1,−1,−1,1)` agrees with the form `t² − |𝐱|²` of `statement.tex` l. 30–31.
3. **Lorentz matrices.** If `Λᵀ η_first Λ = η_first`, then `(CΛC⁻¹)ᵀ η_last (CΛC⁻¹) = C Λᵀ η_first Λ Cᵀ = η_last`. Conjugation preserves the determinant, and `C` maps the time-first forward cone onto the time-last one (item 5), so `Λ ↦ CΛC⁻¹` is a group isomorphism of the proper orthochronous groups in the two realisations. In particular it lands in `ProperLorentz` of `Lean/PublicTheory.lean` (det 1, preserves `minkowskiSquare`, preserves `forwardCone`). Correct.
4. **Translations and tests.** For a time-last test `f`, `(f(· − a)) ∘ C = (f∘C)(· − C⁻¹a)`, since `Cx − a = C(x − C⁻¹a)`. For the affine pullback `f_{(a,Λ')}(y) = f(Λ'⁻¹(y − a))` (the `pullback` field of `PoincareAction`), `f_{(a,Λ')} ∘ C = (f∘C)_{(C⁻¹a, C⁻¹Λ'C)}`. So "time-last translation by `a` ↔ time-first translation by `C⁻¹a`", "`f ↦ f∘C`" and "Poincaré action conjugated by `C`" are mutually consistent, and the group law `(Λ₁,a₁)(Λ₂,a₂) = (Λ₁Λ₂, Λ₁a₂ + a₁)` (`productCoordinates`) is preserved by `(Λ,a) ↦ (CΛC⁻¹, Ca)`. Correct.
5. **Cone and spectral measures.** `C{p : p⁰ ≥ |𝐩|} = {(𝐩,E) : |𝐩| ≤ E}`, which is `\overline V_+` of `statement.tex` l. 31 and `forwardCone` of `PublicTheory.lean` l. 64. For the spectral measure: the target relates the energy–momentum measure to translations by `charFun`, i.e. by the Euclidean pairing on `EuclideanSpace ℝ (Fin 4)` (`W0.spectralRepresentation`). Since `C` is orthogonal, `⟨C⁻¹a, p⟩ = ⟨a, Cp⟩`, so if `T_first(b) = ∫ e^{i⟨b,p⟩} dP(p)` then `T_last(a) = T_first(C⁻¹a) = ∫ e^{i⟨a,q⟩} d(C_*P)(q)`. The same holds for the Minkowski pairing by item 2. So "spectral measures pushed forward by `C`" is exact, with no sign or transpose correction, and the spectrum condition transfers because the cone is pushed forward by the same map. Correct.
6. **Supports and locality.** `supp(f∘C) = C⁻¹ supp f`, so supports are pushed forward by `C` when passing from time-first to time-last. By item 2, `Q_last(Cx − Cx') = Q_first(x − x')`, so spacelike separation is preserved. Correct.
7. **Schwartz space, conjugation, Jacobian.** Composition with an invertible linear map is a topological linear isomorphism of `𝒮(ℝ⁴)`; `\overline{f∘C} = \bar f ∘ C`, so the adjoint relation `⟨Φ(A,f)ψ,η⟩ = ⟨ψ,Φ(A*,\bar f)η⟩` transfers; `|det C| = 1` gives `∫ f∘C = ∫ f`. Correct.
8. **What is no longer claimed.** The old text said the permutation "carries the Minkowski form, the forward cone and the Lorentz group to themselves" and that statements transfer "verbatim". Neither survives. The new sentence "a change of realization, not a symmetry of either one" is accurate: `C` does not preserve `η_first` (it maps it to `η_last ≠ η_first`).
9. **Consistency with the rest of the monograph.** `argument-outline.tex` l. 312–317 states the same transport (`η_last = Cη_firstCᵀ`, `Λ_last = CΛ_firstC⁻¹`, cone by the same map). The time-first sections use `\overline V_+ = {p : p⁰ ≥ |𝐩|}` (`spectral-measure.tex` l. 110, `fourier-support.tex` l. 112) and `V_+ = {q : q⁰ > |𝐪|}` (`full-tube.tex` l. 18), matching the paragraph's time-first cone. The boundary-value statement `eq:public-selected-boundary` separates the complex time variable from the spatial points, so the coordinate order does not affect tube direction or height ordering; #248 checked these against `ChallengeSpec.Reconstructed` and I did not repeat that.

No literature citation is needed: the content is elementary linear algebra.

### Notes

- **N1 (minor, notation).** The symbol `\overline V_+` has two meanings in the monograph: the time-last cone `{(𝐩,E): |𝐩| ≤ E}` in `statement.tex` l. 31, and the time-first cone `{p : p⁰ ≥ |𝐩|}` in `spectral-measure.tex` l. 110 and `fourier-support.tex` l. 112 (and `V_+` in `full-tube.tex` l. 18). The paragraph identifies the two sets correctly but does not say that the symbol is reused. One clause would do, e.g. "in these sections `\overline V_+` denotes the time-first cone `{p⁰ ≥ |𝐩|} = C⁻¹\overline V_+`".
- **N2 (minor, notation).** The letter `C` for the coordinate change clashes with other objects inside the same range of sections: `C_e` (a linear map in the boost construction, `locality.tex` l. 33–40) and the cones `C_n`, `C_n^∘` (`full-tube.tex` l. 16–17). Nothing is ambiguous in context, since the coordinate change is only used in this paragraph, but a different letter (or a subscript, e.g. `C_{\rm tl}`) would avoid any confusion; `argument-outline.tex` l. 313 would need the same change.
- **O1 (optional).** "The Poincaré action is conjugated by `C`" could be made explicit for labels as well as states: at the time-last element `(Λ', a)` both actions are the time-first ones at `(C⁻¹Λ'C, C⁻¹a)`. This is what item 4 verifies and what the endpoint check #248 uses.
- **O2 (optional).** `det C = −1`. This is harmless (conjugation preserves `det Λ = 1`, and no orientation enters the Wightman data), but writing `det C = −1` instead of `|det C| = 1` would preempt the question whether `C` itself is a proper Lorentz transformation in some realisation.
- **Outside this PR.** `results/C04/handoff.md` still lists the revision-1 hash `f22685be…` for `complex-heat.tex` (it has since changed in `9e7326b8` and `c611ebe8`); it is a dated record, so this is not an error, but the C04 hash table is not current. The C04 correspondence row M4 (`results/C04/correspondence.md` l. 82) still cites only `YM.timeAxis`; it could add `timeAxis`/`forwardCone`/`minkowskiSquare`/`PoincareAction.pullback` of `Lean/PublicTheory.lean`, which are the target-side definitions the paragraph is matched against.

## Lean correspondence (textual; nothing elaborated)

The paragraph is an expository convention; it does not claim to correspond to a source declaration. The target-side conventions it must match were read at the pinned revision in `Lean/PublicTheory.lean`:

- `timeAxis := Fin.last 3`, `time x = x timeAxis`, `spatial x` the first three coordinates (l. 51–60): time last, as in `statement.tex`.
- `forwardCone := {x | ‖spatial x‖ ≤ time x}` (l. 64) and `minkowskiSquare x = time x ^ 2 − ‖spatial x‖ ^ 2` (l. 66): the images under `C` of the time-first cone and form (items 2, 5).
- `ProperLorentz` (l. 209–212): determinant 1, preserves `minkowskiSquare` and `forwardCone`; the image of the time-first proper orthochronous group under `Λ ↦ CΛC⁻¹` (item 3).
- `PoincareAction.productCoordinates` and `pullback` (l. 236–243): the group law and affine pullback used in item 4.
- `W0.spectralRepresentation` (l. 271–273, via Mathlib `charFun`; that `charFun` uses the inner product of `EuclideanSpace` is from memory of Mathlib, which is not vendored here and whose sources are unreachable from this sandbox; item 5 holds for either the Euclidean or the Minkowski pairing, so nothing depends on it) and `W0.positiveEnergy` (l. 274–275): item 5.
- `YM.timeAxis := Fin.last 3` (`Lean/YM/Space/Index.lean` l. 20), cited by the C04 correspondence row M4: the internal source also puts time last. So the time-first convention of the manuscript sections is an expository reorganisation, and the transport (T) is a manuscript-level proof obligation. The paragraph discharges it.

## Evidence (commands actually run)

On `codex/existence-monograph` at `922d1fe5` (contains PR #309 as `44c05e4`):
- `git diff --quiet c611ebe8 HEAD -- manuscript/existence/complex-heat.tex`: identical.
- `sha256sum` of the files in `hashes.json`: values recorded there.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex`: exit 0, 1011 pages, no undefined references in the log. The paragraph is on p. 191 ("Coordinate convention in Sections 40–50"); p. 191 rendered with `pdftoppm -r 110` and inspected: formulas, the two section references and the cone display render correctly.
- No Lean command was run (nothing elaborated); the correspondence above is textual.
