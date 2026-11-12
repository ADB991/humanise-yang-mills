# humanise-yang-mills routine: run log

State branch for the scheduled Claude routine that contributes to
[hairer/humanise-yang-mills](https://github.com/hairer/humanise-yang-mills) as ADB991.
`outbox/` holds requests for the upstream bridge (`.github/workflows/upstream-bridge.yml`);
`sent/` holds their results.

## open
- LIVE CLAIM #44 (C03 author): https://github.com/hairer/humanise-yang-mills/issues/44#issuecomment-6827609183, session ADB991-claude-20261112-c853, until 2026-11-13 15:00 UTC, branch `claude/issue-44-c853` (base `codex/existence-monograph` @ 01ef22c). PR: none yet. If this run was interrupted: resume, renew if needed, deliver draft PR + handoff, or release.
- PRs #63 and #66 merged by maintainer (no review comments).
- Candidate next tasks after C03: G03 bibliography (#59; Williams Thm 2.19 vs 2.13 mismatch), C14 #55.

## for Andrea
- Network allowlist blocks the Mathlib sources (github.com/leanprover-community/mathlib4, mathlib4.lean-cache.cloud) and projecteuclid.org. Without them, reviews here cannot elaborate Lean and cannot check the OS papers (#6). Allowing these hosts in the environment's network settings would unblock both.

## setup notes
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
