# humanise-yang-mills routine: run log

State branch for the scheduled Claude routine that contributes to
[hairer/humanise-yang-mills](https://github.com/hairer/humanise-yang-mills) as ADB991.
`outbox/` holds requests for the upstream bridge (`.github/workflows/upstream-bridge.yml`);
`sent/` holds their results.

## open
(none live). Claim on #47 released (https://github.com/hairer/humanise-yang-mills/issues/47#issuecomment-6829136812); claims on #44 and #46 were released earlier.
- Own draft PRs (base `codex/existence-monograph`): #69 (C03, branch `claude/issue-44-c853`), #72 (C05, branch `claude/issue-46-0c65`), #73 (C06, branch `claude/issue-47-8949`). No reviews or comments on #69 or #72 as of 16:20 UTC. Next run: check #69, #72 and #73 and issues #44, #46 and #47 for review comments. Reviews of C03, C05 and C06 must be done by someone else, so don't claim them. Fix substantive review findings only under a new author claim on the issue.
- C06 open items for other packages: X1 (`eq:transfer-nonlinear-input`), X2 (`eq:warning-covariance`) and X3 (`eq:warning-plateau`) have no producer label. X4 and X5 (path data, flat stack) have no owning package. G05 notation proposals N1–N4; G03 leads (Penrose, Kotecký–Preiss) unverified.
- Candidate next tasks: another unclaimed C package (C07–C12 and C15/C16 had no claims at 16:20 UTC; C07 #48 and C08 #49 are the main consumers of C06), G03 bibliography (#59), or C14 #55 (large). Recheck claims first. Trishen holds C01 and C02.
- Build note: `latexmk existence.tex` in manuscript/ overwrites the tracked `manuscript/existence.pdf`, so use `-outdir`.

## for Andrea
- Network allowlist blocks the Mathlib sources (github.com/leanprover-community/mathlib4, mathlib4.lean-cache.cloud) and projecteuclid.org. Without them, reviews here cannot elaborate Lean and cannot check the OS papers (#6). Allowing these hosts in the environment's network settings would unblock both.

## setup notes
- LaTeX was already installed in this container in run 4 (latexmk present); full build ~20 s.
- LaTeX: `apt-get update` first, then `apt-get install -y latexmk texlive-latex-extra texlive-science poppler-utils` works (~5 min). Full existence.tex builds in a few minutes.
- Bridge `pr` requests accept `"base"` (read from .github/workflows/upstream-bridge.yml); monograph packages want base `codex/existence-monograph`.
- math.dartmouth.edu blocked (proxy 403).
- projecteuclid.org, link.springer.com, release.lean-lang.org, mathlib4.lean-cache.cloud: blocked. arxiv.org works.
- Lean v4.32.0: `curl -L https://github.com/leanprover/lean4/releases/download/v4.32.0/lean-4.32.0-linux.tar.zst` (needs `apt-get install zstd`), then `elan toolchain link`. elan-init from raw.githubusercontent works.
- scottnarmstrong release (prebuilt YM .lake) is outside GitHub repo scope -> 403.
- Mathlib deps: github.com/leanprover-community/mathlib4 and mathlib4.lean-cache.cloud blocked -> no lake build possible; use import-graph (parse import lines) for sound non-reachability.

## runs
- 2026-11-12: claimed #14 Lean-correspondence review of rank-determinant-stress.md (claim https://github.com/hairer/humanise-yang-mills/issues/14#issuecomment-6825197499; maintainer posted CLAIM GRANTED); review PR https://github.com/hairer/humanise-yang-mills/pull/63 (draft, changes requested); summary https://github.com/hairer/humanise-yang-mills/pull/31#issuecomment-6825370754; handoff+release https://github.com/hairer/humanise-yang-mills/issues/14#issuecomment-6825371202. Source-text + import-graph only; no elaboration (Mathlib unreachable).
- 2026-11-12 (run 2): claimed #45 C04 (https://github.com/hairer/humanise-yang-mills/issues/45#issuecomment-6825442455); audited all 11 chapters; added cor:word-motion-inputs (discharges prop:word-motion's Poincaré input = Lean Work.C28), notation fixes, results/C04 ledger; draft PR https://github.com/hairer/humanise-yang-mills/pull/66; handoff+release https://github.com/hairer/humanise-yang-mills/issues/45#issuecomment-6825750554; pointer https://github.com/hairer/humanise-yang-mills/issues/26#issuecomment-6825750885.
- 2026-11-12 (run 3): claimed #44 C03 (https://github.com/hairer/humanise-yang-mills/issues/44#issuecomment-6827609183); audited 13 chapters; repairs: l-inf separation in fixedbounds thm, rem:ex-limits-fullmesh, J=R_rho conj in reflection-transport; results/C03 ledger+findings; draft PR https://github.com/hairer/humanise-yang-mills/pull/69; handoff+release https://github.com/hairer/humanise-yang-mills/issues/44#issuecomment-6827870758; pointers https://github.com/hairer/humanise-yang-mills/issues/26#issuecomment-6827871062 and C04 E4 correction https://github.com/hairer/humanise-yang-mills/issues/45#issuecomment-6827871403.
- 2026-11-12 (run 4): claimed #46 C05 (https://github.com/hairer/humanise-yang-mills/issues/46#issuecomment-6828067693); audited 14 chapters, no math errors; added reference-match dictionary + prop:ope-match-assembly (one-label Q_n), producer pointers, phase-prices notation fix, results/C05 ledger; draft PR https://github.com/hairer/humanise-yang-mills/pull/72; handoff+release https://github.com/hairer/humanise-yang-mills/issues/46#issuecomment-6828559398; pointer https://github.com/hairer/humanise-yang-mills/issues/26#issuecomment-6828559745. Full monograph builds (875 pp, 0 warnings, out-of-tree). Lean by source text only.
- 2026-11-12 (run 5): claimed #47 C06 (https://github.com/hairer/humanise-yang-mills/issues/47#issuecomment-6828668135). Audited 15 chapters and found no math errors. Repairs: corrupted \rm (leaf-transfer), explicit c_F=C_1/L^2 (seed-energy, checked against YM.Work.E09.assemble), local notation. Added results/C06 ledger. Draft PR https://github.com/hairer/humanise-yang-mills/pull/73; handoff+release https://github.com/hairer/humanise-yang-mills/issues/47#issuecomment-6829136812; pointer https://github.com/hairer/humanise-yang-mills/issues/26#issuecomment-6829137198. Build 874 pp, 1 pre-existing warning outside C06. LaTeX installed via apt in this run (~10 min).
