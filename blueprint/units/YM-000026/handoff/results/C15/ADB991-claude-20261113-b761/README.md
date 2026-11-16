# C15 weighted-receiver locator revision (#335)

Session `ADB991-claude-20261113-b761` (Claude, Anthropic, scheduled agent on
behalf of ADB991). Claim:
https://github.com/hairer/humanise-yang-mills/issues/335#issuecomment-6867978415.
Base `codex/existence-monograph` @ `08e85a78`; Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464` (the `Lean/` tree is identical on
the base and on `main`: tree `328ad19b`). Paths are relative to
`Lean/YM/TraceExtension/` unless given in full. All source checks are
textual; nothing was elaborated.

## Finding being resolved

Review #112 (`review/mgubi-astra-c15-scribe-20261113/lean-correspondence.md`,
"Weighted receiver lemma" row and the closing paragraph) reported that the
C15 part-B records name `scout` as the source anchor of
`lem:ex-lattice-trace-weighted-price` (`manuscript/existence/trace-weighted-estimates.tex`
l.12–33), whereas the weighted conclusion is `permute`/`spend`/`expenses`.
No later correction of the part-B rows was found: at `08e85a78` the
part-B `correspondence.md` row and the `ledger.md` output row still named
`scout`. The unit evidence files `trace-calibration-producer-evidence.md`
(l.18, 36) and `trace-weighted-estimates-evidence.md` (l.22) already name
`plumage`/`spend`/`expenses`; they are consistent with the correction and
were not changed.

## Source verification

`Terrace/Delta.lean`, section `continuity`, variables
`E H` finite-dimensional real normed spaces,
`f : E →L H`, `v : ℕ → E →L H`, `U : H →L E`, `u : ℕ → H →L E`, `x : E`,
`w : ℕ → E`.

| Declaration | Line | Statement (hypotheses → conclusion) | Role |
| --- | --- | --- | --- |
| `fitV` | 10 | pointwise convergence `A_i x → g x` for all `x` ⇒ `A_i → g` in operator norm (finite-dimensional domain) | basis-to-norm step of the manuscript proof |
| `plumage` | 20 | `x ≠ 0`, `ker f = ℝx` (as `∀y, f y = 0 ↔ ∃a, y = a•x`), `f∘U = id` ⇒ `∃ A : E →L ℝ, ∀y, y = U(f y) + A(y)•x` | identity (*) of the manuscript proof |
| `beak` | 29 | `A_i → g`, `v_i → p` ⇒ `A_i(v_i) → g(p)` | joint continuity of evaluation |
| `scout` | 31 | `u_i → U`, `f∘U = id`, eventually `v_i∘u_i = id`, `w_i → x`, `v_i(w_i) → 0`, `x ≠ 0`, `ker f = ℝx` ⇒ `v_i → f` in operator norm | **unweighted** chart convergence; not the weighted lemma |
| `permute` | 45 | `L : E →L ℝ`, `e : ℕ → ℝ`; `u_i → U`; eventually `v_i∘u_i = id`; `w_i → x`; `v_i → f`; `x ≠ 0`; `ker f = ℝx`; `f∘U = id`; `e_i • v_i(w_i) → 0`; `e_i · L(w_i) → 0` ⇒ `e_i • ((L∘u_i)∘v_i − L) → 0` in operator norm | the manuscript lemma's conclusion with `μ_i = ρu_i`, `ρ = L` |
| `spend` | 61 | same hypotheses (with `ρ`) ⇒ `∃ μ_i, m`, `μ_i → m` and `e_i • (μ_i∘v_i − ρ) → 0`; witness `μ_i = ρ∘u_i`, `m = ρ∘U` | packaging; convergence of `μ_i` gives boundedness |
| `expenses` | 63 | same hypotheses ⇒ `∃ μ_i` linear, `C ≥ 0`, eventually `∀y, ‖μ_i y‖ ≤ C‖y‖`, and `∀ z > 0`, eventually `∀y`, `‖e_i(μ_i(v_i y) − ρ y)‖ ≤ z‖y‖` | the all-vector form consumed by `Prosper.vote` |
| `revise` (`Terrace/Rivers.lean`) | 8 | `V_i → 1`, `W_i∘V_i → T` ⇒ `W_i → T` (finite-dimensional, via openness of units and continuity of inversion) | the step "multiplication by `V_i^{-1}`" |

Proof dependencies, read in the proof text: `permute` uses `plumage`,
`fitV`, `beak`, `revise`; it does not use the hypothesis `v_i → f`.
`spend` calls `permute`; `expenses` calls `spend`. `scout` uses
`plumage`, `fitV`, `beak`, `revise` and is called by neither `permute`,
`spend` nor `expenses`.

Caller, `Terrace/Lease.lean`: `springs` (l.34) takes a sequence `v_i → Stem5`,
the weighted field estimate `hueK·s_i(v_i) → 0` and the weighted price
estimate `hueK·Lease(v_i) → 0`. It first divides by the weight
(`hueK → ∞`, `> 0`) to get `s_i(v_i) → 0`, then calls `scout` (l.45) to get
`s_i → Vbase`, and passes that as the hypothesis `hv` of `expenses` (l.46),
with `e_i = hueK(Stern V i)` and `ρ = Lease`. The result fills both fields of
`Prosper` (l.27): `alpha` from `scout`, `vote` from `expenses`. No other
caller of `scout`, `permute`, `spend` or `expenses` exists in `Lean/`
(`grep -rn` for the four names; the other hits are unrelated structure
fields named `spend` in `Prom/Front/West/` and `Prom/Hill/ShapeS.lean`).

## Quantifier match with the manuscript

`lem:ex-lattice-trace-weighted-price` has exactly the hypotheses of
`permute`/`spend`/`expenses`, including `v_i → f` and arbitrary real
`e_i`. Its conclusion is the operator-norm form of `permute` with
`μ_i = ρu_i`, plus "uniformly bounded operator norms": since `u_i → U`
the sequence is bounded for every `i`, which implies the eventual bound of
`expenses`; operator-norm convergence implies the all-vector form of
`expenses`. Verdict: match. Two observations, neither requiring a change
in this scope:

- O1. The hypothesis `v_i → f` is unused in the manuscript proof and in
  `permute`'s proof (the proof needs `u_i → U`, `v_iu_i = id` eventually,
  `w_i → x` and the two weighted limits). It is harmless; a manuscript
  author may drop it or remark on it.
- O2. The `scout` step (deriving `s_i → f` from `s_i(w_i) → 0`) has its
  manuscript counterpart in YM-000033 `prop:trace-prosper-sensor`, as
  `trace-weighted-estimates.tex` l.163–171 states; this revision did not
  re-review that proposition.

## Changes

Only two rows change, both in C15 part-B:

- `part-B/correspondence.md`, row `lem:ex-lattice-trace-weighted-price`:
  source anchor replaced by `permute`/`spend`/`expenses` with helpers and
  the caller `springs`; the separate role of `scout` stated; verdict
  `match`.
- `part-B/ledger.md`, output row for the two trace-weighted-estimates
  lemmas: Lean column now separates the weighted-price anchors from
  `scout` and keeps `aspiring` for the medium receipts.

Historical review records (including #112's report) are unchanged.
`inspected-sha256.txt` freezes the inspected files and the pre-edit
part-B files.

## Checks actually run

- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units.`
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --check`: clean.
- Not run: Lean elaboration (no change to `Lean/` or to any statement);
  LaTeX build (no `.tex` changed).

Independent check needed: a reviewer other than ADB991 should confirm the
two rows against `Terrace/Delta.lean` and `Terrace/Lease.lean`.
