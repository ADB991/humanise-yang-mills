# G03 findings (author pass 1, basis `d3c7a19`)

No cited result was found to be misapplied: in every load-bearing citation (L1–L6, L9–L11) the
hypotheses of the result as stated in the ledger hold in the application. The findings are about
locators, source verification and attribution.

**F1. Williams bibitem carries one theorem's locator for three uses (shared file, `existence.tex:277–280`).**
The entry says "Theorem 2.13, pp. 29--31", but `complex-heat.tex:12` cites Thm 2.19 and
`phase-selection.tex:89` cites Thms 2.17 and 2.19. This is the C04 review's item M9, which the C04
author deferred to G03 (`results/C04/findings.md:118`). The citations in the chapters are right
(PRIOR-V); only the bibitem is wrong. Fix: patch P1 (a locator-free entry; each `\cite` keeps its own).

**F2. OS75 bibitem page range (`existence.tex:273–276`).** "especially §IV.1, pp. 287--288" covers
both the named reconstruction theorem E′ (or E″) → R′ (p. 287) and the intermediate Theorem 4.1
(p. 288), which the #6 note warns must not be confused with it. The entry also omits the appendix
by S. Summers, which is part of the article's title and its attribution. Patch P2.

**F3. Several load-bearing locators have never been checked against the source by anyone other than
the author, or only through indexed text.**
- L9/L10 (Hall 2015; Krantz–Parks 2002): written from memory in C06 revision 2 (this account's earlier
  run, recorded on PR #87). No-one has opened either book. For Hall, a verified freely available
  substitute exists (arXiv:math-ph/0005032v1, checked in this pass; ledger L9), and it supplies
  exactly the two facts the proof uses. Patch P4 offers it as an addition, keeping the book.
  Krantz–Parks remains UNVERIFIED; the uncited "analytic implicit function theorem" at
  `predictor-branch.tex:231` should cite the same source once checked.
- L6 (BHV, SNAG): checked only through search-engine indexed page text; two independent attempts
  to fetch the PDF failed. A visual check of Thm D.3.1 (and of the manuscript date "23 February
  2007") is still needed.
- L8 (Jaffard): checked only by the C07 author. It is not load-bearing, so this is low priority.
G03 could not close these from this sandbox: every non-arXiv host failed (`validation.md`).

**F4. SNAG application uses \(\widehat{\mathbb R^4}\cong\mathbb R^4\) without citation (`spectral-measure.tex:14–16`).**
BHV's PVM lives on the dual group. The chapter "identif[ies] the character indexed by \(p\) with
\(a\mapsto e^{ip\cdot a}\)". That this map \(\mathbb R^4\to\widehat{\mathbb R^4}\) is a homeomorphism
(so that regular PVMs correspond and the support statements transfer) is standard but is neither
proved nor cited. Minor; a one-line reference or reader-prerequisite note suffices (C04 owner).

**F5. Attribution gaps (front matter and the Wilson action).**
(a) `existence.tex` does not say that the argument follows the pinned Lean formalisation
(`yang-mills-group/OpenAI-YM-20261028` at `3456e5e7…`, source manifest `source/upstream.json`),
nor credit Scott Armstrong's informalization project, whose source map and declaration tables
CONTRIBUTING.md asks to be credited "in the task, proof unit, or resulting manuscript note".
(b) Wilson's lattice action is used with no citation. The standard reference is K. G. Wilson,
"Confinement of quarks", Phys. Rev. D **10** (1974), 2445–2459; G03 confirmed only that
DOI `10.1103/PhysRevD.10.2445` resolves to the APS site (`validation.md`); title, pages and
content were **not** inspected, so it is not placed in the verified bibliography.
Proposed front-matter wording: patch P5 (for F01).

**F6. Incomplete reference in `centered-estimates.tex:80` (C02).** "Tropp's … (*Matrix Analysis*,
2022, Theorem 6.32, p. 52)" lacks the author's full name, the document type (lecture notes?),
institution/publisher and URL, so a reader cannot locate it. G03 could not identify or check it.
The inequality is a textbook fact; either complete the reference after checking it, or replace it
by a checked textbook locator (e.g. a Schatten–Hölder statement in Bhatia, *Matrix Analysis*,
GTM 169 — **candidate only, not checked here**). Owner: C02.

**F7. The stated reader prerequisites are narrower than what the text uses (`statement.tex:11–14`, C16).**
The list names Lie groups, Haar measure, Lebesgue integration/dominated convergence and elementary
Hilbert-space theory. The text also uses without proof: Cauchy's theorem and formula (≈20 uses),
Bochner integration of Banach-valued functions, Hahn–Banach, Dynkin's π–λ theorem, Gaussian
probability inequalities (Markov/Chernoff/Jensen, Wick's rule), Schwartz spaces and the Fourier
transform (cited), basic C\*-algebra theory (cited), and the real-analytic inverse/implicit function
theorems (cited once, used twice). Either extend the list (patch P3) or cite each use. This is an
editorial choice for C16/G04/F01; G03 recommends extending the list, because these are graduate
textbook results and per-use citation would add noise.

**F8. Bibliography mechanics (for F01).** `manuscript/existence.tex` uses an inline
`thebibliography`, while `manuscript/main.tex` uses `references.bib` (one entry, `lebl`, owned by the
#22 pilot). Two of the eleven references (Jaffard, Hall/Krantz–Parks) and Tropp are footnotes or inline
text rather than bibliography entries, so they would not appear in any bibliography. The proposed
`manuscript/existence/verified-references.tex` gives one `thebibliography` with keys for all
checked entries; F01 can `\input` it in place of the inline list and convert the inline citations
to `\cite` (patch P6). No chapter was edited.
