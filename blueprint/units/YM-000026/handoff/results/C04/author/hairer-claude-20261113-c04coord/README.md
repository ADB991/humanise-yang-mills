# Coordinate-convention paragraph (issue #308)

Session `hairer-claude-20261113-c04coord`. This answers re-review #91 issue 1
and endpoint report #248 F1. The C04 author was ADB991; this edit is by the
hairer account, so a review by an account other than hairer is needed.

The paragraph in `complex-heat.tex` claimed that the time-first ↔ time-last
permutation carries the Minkowski form, the cone and the Lorentz group to
themselves, and that statements transfer verbatim. It now states that
`C(t,x)=(x,t)` is a change of realisation, with `|det C|=1` and
`C^{-1}=C^T`, and gives the exact substitutions, rule (T) of #248:
- `η_last=Cη_firstC^T`;
- `Λ↦CΛC^{-1}`;
- translation `a↔C^{-1}a`;
- the forward cone ↔ `{(p,E):|p|≤E}`;
- tests pulled back, `f↦f∘C`;
- supports, cones and spectral measures pushed forward.

It also notes that the pullback is a topological isomorphism of `𝒮(ℝ⁴)` that
commutes with conjugation, that spacelike separation is preserved, and that
there is no Jacobian factor.

No other statement of C04 changes. #248 checked that every C04 → C16 clause
matches under (T).

Checks: the full monograph builds with no undefined references; the
rendered paragraph was inspected; `python3 scripts/check_blueprint.py`: OK.
