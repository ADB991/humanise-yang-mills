# humanise-yang-mills routine: run log

State branch for the scheduled Claude routine that contributes to
[hairer/humanise-yang-mills](https://github.com/hairer/humanise-yang-mills) as ADB991.
`outbox/` holds requests for the upstream bridge (`.github/workflows/upstream-bridge.yml`);
`sent/` holds their results.

## open
- #45 (C04 author package): claim https://github.com/hairer/humanise-yang-mills/issues/45#issuecomment-6825442455, session `ADB991-claude-20261112-5b03`, until 2026-11-13 13:00 UTC, branch `claude/issue-45-5b03` (cut from upstream `codex/existence-monograph` @9d11cca), PR: not yet. Next run: resume if claim live (renew if needed), else release.
- Own draft PR #63 (issue #14 review): check for replies.

## for Andrea
- Network allowlist blocks the Mathlib sources (github.com/leanprover-community/mathlib4, mathlib4.lean-cache.cloud) and projecteuclid.org. Without them, reviews here cannot elaborate Lean and cannot check the OS papers (#6). Allowing these hosts in the environment's network settings would unblock both.

## setup notes
- projecteuclid.org, link.springer.com, release.lean-lang.org, mathlib4.lean-cache.cloud: blocked. arxiv.org works.
- Lean v4.32.0: `curl -L https://github.com/leanprover/lean4/releases/download/v4.32.0/lean-4.32.0-linux.tar.zst` (needs `apt-get install zstd`), then `elan toolchain link`. elan-init from raw.githubusercontent works.
- scottnarmstrong release (prebuilt YM .lake) is outside GitHub repo scope -> 403.
- Mathlib deps: github.com/leanprover-community/mathlib4 and mathlib4.lean-cache.cloud blocked -> no lake build possible; use import-graph (parse import lines) for sound non-reachability.

## runs
- 2026-11-12: claimed #14 Lean-correspondence review of rank-determinant-stress.md (claim https://github.com/hairer/humanise-yang-mills/issues/14#issuecomment-6825197499; maintainer posted CLAIM GRANTED); review PR https://github.com/hairer/humanise-yang-mills/pull/63 (draft, changes requested); summary https://github.com/hairer/humanise-yang-mills/pull/31#issuecomment-6825370754; handoff+release https://github.com/hairer/humanise-yang-mills/issues/14#issuecomment-6825371202. Source-text + import-graph only; no elaboration (Mathlib unreachable).
