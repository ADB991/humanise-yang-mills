# C14 author audit and interface repairs

Session `mgubi-codex-c14-20261113`, contributor @mgubi with Codex assistance.
Issue [#55](https://github.com/hairer/humanise-yang-mills/issues/55), parent #26.
[Live claim](https://github.com/hairer/humanise-yang-mills/issues/55#issuecomment-6839183587).
Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

**Author draft; independent mathematics and Lean-correspondence review pending.**
This pass repairs four chapters and audits their joins to the existing C14
arguments. It does not newly review every argument in all 23 chapters or certify
the public construction. Existing bounded reviews remain evidence with their
original scope; no approvals or fingerprints have been refreshed.

Started from released checkpoint `b2f59c320ec41ad3485b495d4c4fe2b9af17957d`,
then rebased before committing onto `81538d6` to consume the integrated C12
statements. All 23 C14 starting files match the coverage inventory. The author
worked alone in `/tmp/ym-c14-20261113`; the previously requested PR72/82
review agents did not participate in C14.

- [Findings](findings.md): repairs, upstream gaps, and review limits.
- [Input/output ledger](ledger.md): coherent groups and common-data edges.
- [Correspondence](correspondence.md): directly inspected source and inherited evidence.
- [Validation](validation.md): actual checks and render evidence.
- [Hashes](hashes.json): exact starting and final contents of all 23 chapters.
- [Source hashes](inspected-source.sha256): manifest-checked files inspected in this pass.
- [Handoff](handoff.md): review priorities and integration conditions.

The authoritative proof is in the manuscript. This directory records its
correspondence and status; it does not duplicate the proof in Markdown.
