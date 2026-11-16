# Validation and provenance

Worktree `/home/jo314/ym-wt/g01`, branch `claude/g01-m4-review`, HEAD `525ce60c03b75b3a73cb61077138b3fb1cdba963`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Session `schmittj-claude-g01-m4-review-20261113`, issue #162. Only this review directory was written. Nothing was committed, pushed or posted by the reviewing agent.

## Reviewed content (SHA-256, computed with `sha256sum` in the worktree)

| File | SHA-256 |
| --- | --- |
| `blueprint/units/YM-000026/handoff/results/G01/M4/README.md` | `c6597d4918beec3c43c4f9187efcdb11760ccb41b4adfa69252e80fca0ba3d6f` |
| `blueprint/units/YM-000026/handoff/results/G01/M4/trace_constant.py` | `6599d7b54a91f688359cce48501073c8e2426f0228dad55a997dc3ce50cfb1af` |
| `Lean/PublicTheory.lean` | `94111ad258b4218a263fcc0a7136446d5a6eff0e090809b72036fb3a7aecfff8` |
| `Lean/PublicWilson.lean` | `c1542c816cd42d23448b66b4cb021c7f3bdad64b64f1c643dde27147ce0c3233` |
| `Lean/ChallengeSpec.lean` | `e48b0be2b72d16b9b87c6c1923b3ae814270387bf9312b5cb0661dfa3e243749` |
| `Lean/TraceBridge.lean` | `b3fa347e6ab79cd69a5b0e29a3ad1a743c9cedffe727a7f13bfc6328cf125a35` |
| `Lean/YM/TraceExtension/Wick/Refute.lean` | `cb0340c14c23b700b0cc84f212578206304710e93d9b766b8224093d553024c6` |
| `blueprint/units/YM-000026/handoff/results/G01/formal/Adequacy.lean` | `581880ef39e48a1af37af8b67b50869a011958411be2c6fb291a5a38e43b18f3` |
| `blueprint/units/YM-000026/handoff/results/G01/statement-ledger.md` (aid) | `2c76bee7546081668bfdbd240ee96e847a45a5d696380c501ed83df6e5854352` |
| `blueprint/units/YM-000026/handoff/results/G01/adequacy.md` (aid, not read in full) | `fe5619785d3db48a414788137eb2f282521cc8803b3c779a6d06f05f816d57fa` |
| `trace_check.py` (this directory) | `3f6981f4f64f29d480e1c201c7d23c7bd09c01d96f69c7d260a436df2ceedac9` |

The hashes of the two reviewed files, the three public Lean files, `TraceBridge.lean`, `Refute.lean` and `Adequacy.lean` equal those recorded by the first review (`../mgubi-astra-g01-m4-review-20261113/validation.md`). The last commit touching `M4/README.md` is `c55c16531bbe1eb33dd3c22c289e45d86c8b5d00` (`git log -1 --format=%H -- <path>`).

## Commands run and results

- `git log --oneline -3`, `git rev-parse HEAD`, `git branch --show-current`, `git status --short`: HEAD as above; the only untracked path is this directory.
- `sha256sum` on the files above: values as in the table.
- `python3 -I blueprint/units/YM-000026/handoff/results/G01/M4/trace_constant.py` (numpy 2.3.4, scipy 1.16.2): `int_0^inf u^6 K1(u) du = 384.00000000000006`; ratios `[0.549795, 0.72302, 0.843941, 0.932514, 0.965327]` for both `dim g = 3` and `8`. This reproduces the record's numbers (the first review could not run the script).
- `python3 -I trace_check.py` in this directory (mpmath 1.3.0, 30 digits; about four minutes). Output:
  - `1. int u^6 K1 = 384.0  closed form 2^5 Gamma(4) Gamma(3) = 384.0`
  - `2. m=1.0 r=0.7  mass-shell integral / Delta_m(r) = 248.050213442398561403810520537  (2 pi)^3 = 248.050213442398561403810520537`; the same for `m=3.0 r=0.2`.
  - `3. m1 = 1.78259818232507911547738669804  m2 = 3.34734553527501144507642141695`; ratio and three-term expansion: `L=5: 0.549795, 0.688642`; `L=10: 0.723020, 0.743901`; `L=20: 0.843941, 0.846845`; `L=50: 0.932514, 0.932713`; `L=100: 0.965327, 0.965352`.
  - `4. 48 c / pi^2 / A = 1.0  c = 0.0189977219329383...  c/(2 pi)^3 = n/(128 pi^5) = 0.0000765882103840637...` (for `n = 3`).
  The ratios are computed by quadrature in the original variable $s$, independently of the author's substituted integral, and agree with the author's to six digits. The differences from the expansion decrease like $L^{-3}$, as expected. This is a sanity check, not a proof of the limit; the limit is proved by dominated convergence in `mathematics.md` §5.
- `grep` for `charFun` in a local Mathlib checkout at `a3a10db0e9d66acbebf76c5e6a135066525ac900` (`/home/jo314/lean/prop51formal/.lake/packages/mathlib`), which is **not** the pinned Mathlib `81a5d257c8e410db227a6665ed08f64fea08e997`: `charFun μ t = ∫ x, exp (⟪x, t⟫ * I) ∂μ`.
- Text reads: all of `Lean/PublicTheory.lean`, `Lean/PublicWilson.lean`, `Lean/ChallengeSpec.lean`; `M4/README.md`, `trace_constant.py`; the four files of the first review; `statement-ledger.md` in full; `formal/Adequacy.lean` l.640–770; `Lean/YM/TraceExtension/Wick/Refute.lean` l.1–95; `Lean/TraceBridge.lean` l.25–44; excerpts of `LogScaling.lean`, `Wick/Log.lean`, `Wick/Expansion.lean`.

## Not run, not read

- No Lean build, elaboration, `#print axioms` or replay; `formal/Adequacy.lean` was not recompiled.
- `review/hairer-claude-20261113/mathematics.md` M3–M6 was read in full. `adequacy.md` and `formal/README.md` were read only in the excerpts matching `grep -n "^#\|(H1)\|vanish\|multilinear\|grade-zero\|grade zero"` and `grep -n "^#\|hH\|VanishesAtZero\|compiled\|axioms"` (the statement and proof steps of section (c), the hypotheses of the witness theorem, the recorded build and axiom output); the task asked for them in full. Nothing in the excerpts conflicts with the readings used here. `adequacy.md` (b) cites `YM.Points.volume_nil` for the unit point mass on `Points 0`, which supports reading (I) in `lean.md`.
- No literature was opened. Every citation in `mathematics.md` is from memory and carries no theorem number; none is load-bearing, since each cited fact is also argued directly.
- `python3 scripts/check_blueprint.py` was not run (no blueprint record or unit metadata was changed; only a review directory was added). No LaTeX was changed.
- No GitHub read or write was made by this agent; the live issue was not rechecked by it.

Agent review. Human acceptance is unset.
