# Independent bounded C10 annulus review

- Task: [#51](https://github.com/hairer/humanise-yang-mills/issues/51), parent #26.
- Author PR: [#95](https://github.com/hairer/humanise-yang-mills/pull/95).
- Reviewed commit: `ebc64a227e0572bd4fe8f6ecb744f6529ef01e07`.
- Reviewer session: `mgubi-codex-c10-annulus-20261113`, Codex acting for @mgubi;
  separate from the C10 author agents. Human acceptance is not recorded here.
- [Claim](https://github.com/hairer/humanise-yang-mills/issues/51#issuecomment-6839623836).
- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Scope: `annulus-fleet-face-estimates.tex`, `annulus-two-wave-estimates.tex`,
  `annulus-recording-yield.tex`, `annulus-same-data-binding.tex`, and their
  C10-to-C11 annulus interface. The other thirteen C10 chapters are not reviewed.

**Outcome: changes requested at the exported dependency boundary (R1).**
No additional numerical or local algebra error was identified in the four
reviewed arguments. The fixed-film recording calculus is explicitly unproved,
but the final annulus statement and handoff describe a smaller set of remaining
inputs. The required correction is detailed in [review.md](review.md).

This is a report-only review. No manuscript, author report, existing review,
source, shared metadata or approval fingerprint was changed. The reviewed
manuscript is the immutable author snapshot above, not necessarily the version
on this report branch. Exact hashes are in [hashes.json](hashes.json).

- [Mathematical findings and verdict](review.md)
- [Lean correspondence and input/output match](correspondence.md)
- [Actual validation and limits](validation.md)
- [Inspected-source hashes](inspected-source.sha256)

The local checks do not establish whole-package or whole-argument closure.
After the author repairs R1, review the new semantic diff and hashes. Human
acceptance and the unresolved supplier edges remain separate requirements.
