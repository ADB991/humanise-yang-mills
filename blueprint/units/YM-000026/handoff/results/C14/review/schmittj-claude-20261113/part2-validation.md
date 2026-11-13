# C14 review, part 2: validation record

Session `schmittj-claude-c14-review-20261113`, reviewer 2 of 4 (Claude agent for `schmittj`). Worktree `/home/jo314/ym-wt/c14-review`, HEAD `e058a61`. Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Nothing outside this review directory was modified.

## Hashes

Command (run at start and again at end of the review; identical output both times):

```
sha256sum manuscript/existence/physical-angular-actions.tex manuscript/existence/physical-ward-analytic-continuation.tex manuscript/existence/physical-ward-free-classification.tex manuscript/existence/physical-ward-packet-prices.tex manuscript/existence/physical-ward-propagation.tex
```

```
c244c72a1430cb535c2d18683faa9e020974e628b9133feba82f048753c0c09f  manuscript/existence/physical-angular-actions.tex
685077ff658493e10dc2bbc222ee1ac3871c4c40d477ade070039a8e68d825c8  manuscript/existence/physical-ward-analytic-continuation.tex
784e7d1c0ef6a2f6b909744c609a76bda66991861f7edbe91a36ea8c2eecc514  manuscript/existence/physical-ward-free-classification.tex
0afac1f02737ff43e867661fefdfc2edaeaf08b4dea04b3237dd154b5b71d92d  manuscript/existence/physical-ward-packet-prices.tex
8d221691d726121ff612090714fe44e54dd736ef1e8af8f6d2b783663696e634  manuscript/existence/physical-ward-propagation.tex
```

Comparison with the coordinator's `c14-hashes.txt` (scratchpad): `grep -F -f <current hashes> c14-hashes.txt | wc -l` returned `5`, i.e. all five match. They also equal both `start_sha256` and `final_sha256` for these files in `results/C14/hashes.json`.

## Other commands actually run

- `git log --oneline -1` → `e058a61 Merge pull request #108 ...`.
- `git diff --stat bfe20e7~1 bfe20e7 -- <the five chapters>` → empty (PR #98 changed none of them); `git diff --stat bfe20e7~1 bfe20e7` lists the four changed chapters and the C14 result files only.
- Read in full: the five chapters; `AGENTS.md` (in context), `docs/proof-standard.md`, `handoff/COMMON-CONTRACT.md`, `handoff/C14.md`, `results/C14/{README,handoff,ledger}.md`, the relevant rows of `correspondence.md`, `findings.md`, `validation.md`, and the evidence files `physical-ward-{free-classification,propagation,analytic-continuation(partly),packet-prices(partly)}-evidence.md`, `physical-angular-actions-evidence.md`. Read in part for inputs: `all-grade-free-detectors.tex` 215–420, `actual-stress-normalization.tex` (whole), `free-collision-pole-separation.tex` 223–243, `free-maxwell-radial-flux.tex` 30–75, `label-descent.tex` 1–60.
- Label resolution: `grep -rl "label{<l>}"` for the twelve cross-referenced labels (`input:calibrated-actions`, `prop:lorentz-label-descent`, `sec:lorentz-covariance`, `sec:complex-heat`, `sec:spectral-measure`, `sec:physical-ward-stress-cone`, `sec:free-maxwell-ward-flux`, `thm:free-internal-erasure`, `sec:actual-stress-normalization`, `sec:free-collision-pole-separation`, `sec:free-maxwell-radial-flux`, `sec:free-internal-ward-erasure`): each resolves to exactly one file.
- Lean: targeted `grep -n`/`sed -n` on the files listed in `part2-lean.md`, plus a loop checking existence of fifteen evidence-cited names (`YM.PDE.flow_step` exists in `Lean/YM/Ward/PDE.lean`; all others found where cited) and `grep -n "^namespace"` to confirm qualified names.
- Hand computations (no software): free field-strength two-point function and $\kappa_z=4\nu|z|^{-4}$; cross-seed values $-2\nu$ (both orderings); six-leg Wick identity; parity selections; Maxwell/Bianchi signs; propagation exponent arithmetic; packet-chapter interpolation, ceiling/floor, gap, seven-error algebra and dyadic kernel constants; angular-chapter bracket, Casimir, iteration identities and norm induction.

## Not run

- No LaTeX build (audit-only review; no LaTeX changed).
- No Lean build, `lake env lean`, `#print axioms`, or `python3 scripts/check_blueprint.py` (no blueprint metadata changed by this review).
