# C14 review, part 1: commands actually run

Session `schmittj-claude-c14-review-20261113`, reviewer 1 of 4. Worktree `/home/jo314/ym-wt/c14-review` at `e058a615f318232519f871e6ee4d8054367b5a1a`. Only this directory was written; no commit, push, GitHub post, Lean build or LaTeX build.

## Hashes

`sha256sum` in `manuscript/existence/`, run at the start and again at the end of the review; both runs identical and identical to the coordinator's `c14-hashes.txt` (scripted comparison printed `MATCH` for all seven):

```
004d418a0f2121ed1fa3bd3ec3b1b6c06f39afa62203d23e17e0f2b6cabcedef  trace-free-rank.tex
66d6a6671deec2afa2f09e52f2164f6f3475090fc5a01147dea4db1bcb10e27a  free-maxwell-ward-flux.tex
6f3b7f68d9edd297d18e875d0d55d5971c851a4f339b4ceafcf0aafa4026a135  free-maxwell-radial-flux.tex
cd74f687b56f188c37705268bd0bf96bfe0f82360e2aac1515b8bf226194c274  all-grade-free-detectors.tex
be439656e77b0823f1bddd9628380d2cf265a24ef03f70901e3ff7c50ff4bf14  free-internal-ward-erasure.tex
9a1cc07bcac9a869aa4a9dd3653d892d498d6891ed31984f7c9ceae42a385a1d  free-collision-pole-separation.tex
c6da79dfc7cf7bffc4d81b47fc75bcea0a873bc1fd87d8f034b9e64c5811d327  finite-rank-kernel-transport.tex
```

## PR #98 scope

- `git diff --stat bfe20e7~1 bfe20e7 -- manuscript/existence/`: only `actual-equation-kernel-relay.tex`, `actual-insertion-derivative-relay.tex`, `actual-stress-annulus.tex`, `actual-stress-shell-nodes.tex`.
- `git diff --stat bfe20e7~1 e058a61 -- <the seven chapters>`: empty. None of the part-1 chapters changed.

## Symbolic recomputation (sympy, script in the session scratchpad `c14r1/probes.py`)

Definitions exactly as in `trace-free-rank.tex` lines 194–239 ($G=\nu|x|^{-2}$, curl kernel $C$, $H$, $\mathcal D_w$), evaluated at $e_0$ and divided by $\nu^2$ (the factor $d_G$ omitted). Output:

```
S0101_00 32*w1 + 64*w2
S1212_00 64*w2
S0212_01 -16*w3
div0101 -256*w1 - 512*w2 + 128*w3
div1212 -512*w2 - 128*w3
third ok True
done
```

`third ok True` confirms \eqref{eq:ex-trace-green-third} for all 64 index triples. The script also checked that $\sum_u\partial_uS_w(ij,kl;ub;x)=0$ for $w=(1,-\tfrac14,1)$ at a generic rational point for four field-pair choices and all $b$ (no nonconservation printed), i.e. the kernel line is the conserved Maxwell stress.

By hand (recorded in `part1-mathematics.md`): invariant-form argument; orbit counts; Bianchi completion; spanning identities via the radial-gauge formula; regulator Laplacian, scaling and unit mass; regulated pulse divergence; coordinate-charge sign; $d\iota_vf$; homogeneity exponents; factor $1/2$; Kelvin response constant and reflection bracket; Taylor-shift identity; covariance orientation and the $(-1)^k$ sign; removal recurrence; house covariance values; quarter-turn identity; alternating-tensor lemma; radial Laplacian coefficient; peeling lemma; contraction orders; projection, extraction, determinant, kernel-dimension and conjugator identities.

## Source inspection

`grep -n`, `sed -n`, `ls` on the Lean files listed in `part1-lean.md` (declarations-opened table), plus `grep -n '^namespace\|^end'` on `Org/Input.lean`, `Euclid/Comparator.lean`, `MergeProof/Thrush.lean`, `MergeProof/Potage.lean`, `Pert/Lifted.lean`, `Next/RANK/Monitors.lean` and the `Next/MAXWELL`, `FREE_DETECTOR_ALGEBRA`, `STRESS_FLUX` files to confirm fully qualified names.

## Not run

- `python3 scripts/check_blueprint.py` (no blueprint record changed by this review).
- LaTeX build and rendered-page check (no chapter changed).
- Lean build, `#print axioms`.
