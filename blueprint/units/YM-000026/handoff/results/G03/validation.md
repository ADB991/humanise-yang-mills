# G03 validation (commands actually run)

Basis `codex/existence-monograph` @ `d3c7a1901390f4821d4b91f6f639bb5c60c63604`, 2026-11-13.

## Inventory searches (from `manuscript/existence/`)

| Command (abridged) | Result |
| --- | --- |
| `grep -c '\\input{existence' ../existence.tex` | 241 included chapters (245 files in the directory) |
| `grep -rhoE '\\cite[a-z]*(\[[^]]*\])?\{[^}]*\}'` over `manuscript/` | 7 cites: Williams ×3, Sawyer, OS75, Melrose, BHV in `existence/`; `lebl` ×2 in `pilots/` (out of scope) |
| `grep -n 'bib\|thebibliography'` in `existence.tex`, `main.tex` | inline `thebibliography` at `existence.tex:272–294` (5 entries); `main.tex` uses `references.bib` (1 entry) |
| `grep -noE '.{0,90}(19[4-9][0-9]\|20[0-2][0-9])[^0-9].{0,60}' *.tex` | inline references: Tropp (`centered-estimates.tex:80`), Jaffard (`local-covariance.tex:43`), Hall and Krantz–Parks (`predictor-branch.tex:44,64`) |
| `grep -nE 'pp\.\|Springer\|Press\|edition\|Annales\|Lecture\|\\S ?[0-9IVX]'` | same set; nothing new |
| `grep -ohE "[A-Z][a-zé]+('s\|--[A-Z][a-z]+)" *.tex \| sort \| uniq -c` and a list of ≈80 mathematicians' names | named standard results (ledger §B) |
| `grep -nE 'well[- ]known\|classical (theorem\|result)\|standard (theorem\|result\|fact)\|[Tt]heorem of [A-Z]\|et al\|arXiv'` | no further literature invocations |

## Sources

| Command | Outcome |
| --- | --- |
| `curl -sSL -o hall.pdf https://arxiv.org/pdf/math-ph/0005032v1; pdftotext -layout` | OK, 128 pp.; Def. 2.2 (p. 9), Thm 3.6 (p. 32), Def. 3.13 (p. 36), Thm 3.23 (p. 44) read in context (printed page numbers from running heads) |
| `curl` to math.dartmouth.edu, math.mcmaster.ca, math.mit.edu, perso.univ-rennes1.fr, numdam.org, projecteuclid.org, web.archive.org | all failed (HTTP 000, host not allowed); WebFetch for math.dartmouth.edu: ENOTFOUND |
| `curl -o /dev/null -w '%{http_code} %{redirect_url}' https://doi.org/10.1103/PhysRevD.10.2445` | `302 https://link.aps.org/doi/10.1103/PhysRevD.10.2445` (DOI exists; content not inspected) |
| same for `10.1007/BF01608978` (OS II) | `302 http://link.springer.com/10.1007/BF01608978` |
| `curl -H 'Accept: text/x-bibliography' https://doi.org/…`; `api.crossref.org` | empty responses (metadata unavailable) |

Earlier verification records reused (not re-run): `blueprint/units/YM-000026/reviews/draft-review.md`
lines 164, 335, 372; `phase-evidence.md`; `reconstruction-evidence.md`; `results/C04/review/mathematics.md` M9;
`results/C07/validation.md:32`; `blueprint/background/osterwalder-schrader.md` at main `4cf1c97`.

## Hashes of audited chapters (SHA-256 at basis)

```
08e6d49ad766e1b62ba1268e6f9ac23791b360fdb2574ef622d18b9782ea1dab  manuscript/existence.tex
f22685be41a0255a1441ad4d98ddef46666e32f293ed4979ffebf7ee98b46ad0  existence/complex-heat.tex
76adab11cc2aae6f37f6d8de2332cf28ef7afece2a68e2bc2d41defd4ef98a2a  existence/phase-selection.tex   (= hash in draft-review.md:186)
9de3ba7c3ea0d2839424e260aebd31bac261363812b0079c3591b23af8970c9a  existence/spectral-measure.tex
d3207f915e5d6a535ec0a3f40981c7e8555e3d272daebdadc3672e75ab0b41a9  existence/boundary-detection.tex
a3600967845dcf8654a3ef0f757a62524350125ba9c3b92684ac982db33c8393  existence/reflection.tex
b5de687585fa37c7ac01b0e149d50d0982d7f11a55d54c393c4aea50e859edb7  existence/local-covariance.tex
2ac3c8a13fcb98a2a126607c20899a5d58a037879780ddcd0f059df3eec98c20  existence/predictor-branch.tex
a40af4d099d2badf3cf6a0ca7f478835a795000957cea2d05f55a7253ed50f3f  existence/centered-estimates.tex
127906c20579e173f17e715a27069d2b519bcbd0370b8c2e4e6e04f06331301d  existence/statement.tex
ca8cf3864927ef5d6d9a64a70f88ea31bb6340559320be56d52a56ed5bf100fd  existence/phase-regularity.tex
ba6a04989fe19c2a3c5430dfce09dacc2d060ffc516d1e0ee8968af9cdfee70f  existence/phase-ward-inheritance.tex
9e00afa255750126bd8511581002cfe22380b0d2c78918796ff4b716248a67b1  existence/heat-vectors.tex
796a6d135d63cf8dba55cdbdda77379c2e54fa2874f70051ad73a6a8b8e43a6b  existence/actual-stress-annulus.tex
cd74f687b56f188c37705268bd0bf96bfe0f82360e2aac1515b8bf226194c274  existence/all-grade-free-detectors.tex
```

Output: `manuscript/existence/verified-references.tex` SHA-256
`f11dc6ad293da8f1a7ac061541e568514e02ada8778e8d1939f41af3044e4161`.

## Checks

| Command | Result |
| --- | --- |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | 22 tests OK |
| `git diff --cached --check` | clean |
| Wrapper (`article`, T1/utf8, `url`) citing all nine keys and `\input` of `verified-references.tex`, `pdflatex` ×2 (TeX Live 2023 from apt) | exit 0, no warnings; rendered reference list inspected via `pdftotext`: nine entries, accents and URLs render |

Not run: the full `existence.tex` build (no chapter changed; the new file is not `\input`); any Lean command
(no claim in this package depends on a declaration).
