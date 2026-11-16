# Author response to review #277 (C07 revision 1)

Session `ADB991-claude-20261113-2bea` (Claude, scheduled agent acting for ADB991; ADB991 authored PR #271 and had not reviewed this response before submission).
Claim: https://github.com/hairer/humanise-yang-mills/issues/48#issuecomment-6865302935.
Review answered: PR #277 (mgubi, `results/C07/review/mgubi-astra-c07-revision1-review-20261113/`) at `a47df64173818aca09668234e1a062601452a908`, of PR #271 at `c68df769f649ccd6f81597ddbc56832061678729`.
This is author-side work and needs a renewed independent check by another account.

| Finding | Change | Where |
| --- | --- | --- |
| M1: empty maximum for j=0 in the proof of `lem:gaussian-base-density` | New paragraph "The case j=0" right after L(y_0)=0. For j=0, `eq:gaussian-base-density` (class B_0 in the sense of `packet-estimates`, zero-order bound included) only asks for abs(R(y_0)) <= 1, and R(y_0)=e^{L(y_0)}=1; so K_0=1, and no derivative of C or w is used. The rest of the proof is then stated for j>=1, so the maximum over 1<=r<=j is non-empty. Lemma statement unchanged. | `manuscript/existence/gaussian-differentiation.tex`, proof of `lem:gaussian-base-density` (p. 344 of the 985-page build) |
| N1: two prose occurrences of `h` for Haar measure | "with respect to h" -> "with respect to m_G"; "preserve h" -> "preserve m_G". Displays unchanged. | `manuscript/existence/haar-chart.tex` (p. 315) |
| N2: O is the source neighbourhood, not the inverse's domain | The inverse function theorem now gives a neighbourhood O of (0,0) in g x g^perp on which (u,n) -> exp(u)exp(n) is a diffeomorphism onto an open neighbourhood V of 1 in M; Log_* : V -> g is the colour component of the inverse V -> O. The later step now reads "(X,0) lies in O and is mapped to g, so g in V and, the map being injective on O, Log_*(g)=X" (previously "by uniqueness of the local inverse"). The constants paragraph is unchanged. | `manuscript/existence/compensated-variation.tex` (p. 321) |

No other manuscript change. Hypotheses, statements and labels are unchanged; the only new mathematical content is the trivial j=0 branch.

Records: `../chapter-hashes.json` updates `current_sha256` and status for the three files and adds `revision_1_response_277` with their pre-response hashes (the fingerprints review #277 inspected).
`../review-index.md` lies outside this claim and was not edited. Its rows for these three files still show the c68df76 hashes. The next C07 record update should refresh them from `chapter-hashes.json`.

Still open, as review #277 recorded: palette/local-covariance (PR #201/#220), C13 F7, canonical evidence/findings records, untouched notation findings, and the C07-to-C08 supplier joins. Independent re-check of this delta (c68df76..this commit) by another account; human acceptance.
