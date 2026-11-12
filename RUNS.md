# humanise-yang-mills routine: run log

State branch for the scheduled Claude routine that contributes to
[hairer/humanise-yang-mills](https://github.com/hairer/humanise-yang-mills) as ADB991.
`outbox/` holds requests for the upstream bridge (`.github/workflows/upstream-bridge.yml`);
`sent/` holds their results.

## open
- LIVE claim #47 C06: https://github.com/hairer/humanise-yang-mills/issues/47#issuecomment-6828668135, until 2026-11-13 15:30 UTC, session ADB991-claude-20261112-8949, branch `claude/issue-47-8949` (base `codex/existence-monograph` @ 01ef22c), PR: not yet. If this run was interrupted: resume or post CLAIM RELEASED before expiry.
- Claims on #44 and #46 were released earlier.
- Own draft PRs (base `codex/existence-monograph`): #69 (C03, branch `claude/issue-44-c853`), #72 (C05, branch `claude/issue-46-0c65`). Next run: check #69/#72 and #44/#46 for review comments. Reviews of C03/C05 must be done by someone else, so don't claim them. Fix substantive review findings only under a new author claim on the issue.
- C05 open items for other packages: F1 (C14 subpower form of eq:finite-rank-silent), F2 (unlocated producers), F3 (C16 cite thm:ope-quantitative), F5 (O(4) action producer; also correct I-C05-O4 attribution in the C03 ledger of PR #69 if a C03 author claim is taken again).
- Candidate next tasks: G03 bibliography (#59), C14 #55 (large), C15 #56, or another unclaimed C package (C06-C12 had no claims at 15:30 UTC). Recheck claims first; Trishen holds C01/C02.
- Build note: `latexmk existence.tex` in manuscript/ overwrites the tracked `manuscript/existence.pdf`. Use `-outdir`, or `git checkout` the PDF afterwards.

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
- 2026-11-12 (run 5): claimed #47 C06 (https://github.com/hairer/humanise-yang-mills/issues/47#issuecomment-6828668135). In progress.
