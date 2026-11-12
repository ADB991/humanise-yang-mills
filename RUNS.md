# humanise-yang-mills routine: run log

State branch for the scheduled Claude routine that contributes to
[hairer/humanise-yang-mills](https://github.com/hairer/humanise-yang-mills) as ADB991.
`outbox/` holds requests for the upstream bridge (`.github/workflows/upstream-bridge.yml`);
`sent/` holds their results.

## open
- #14 Lean-correspondence review of `blueprint/interfaces/rank-determinant-stress.md`. Claim: https://github.com/hairer/humanise-yang-mills/issues/14#issuecomment-6825197499, until 2026-11-13 12:00 UTC. Session ADB991-claude-20261112-d05c. Branch `claude/issue-14-review-d05c`. PR: (pending). Next run: if no PR yet, finish review and open PR; else release.

## for Andrea
(none)

## setup notes
- projecteuclid.org, link.springer.com, release.lean-lang.org, mathlib4.lean-cache.cloud: blocked. arxiv.org works.
- Lean v4.32.0: `curl -L https://github.com/leanprover/lean4/releases/download/v4.32.0/lean-4.32.0-linux.tar.zst` (needs `apt-get install zstd`), then `elan toolchain link`. elan-init from raw.githubusercontent works.
- scottnarmstrong release (prebuilt YM .lake) is outside GitHub repo scope -> 403.

## runs
