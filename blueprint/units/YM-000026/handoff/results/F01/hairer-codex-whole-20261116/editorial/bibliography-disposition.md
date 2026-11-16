# Bibliography and attribution disposition

## Prior reviews used

- G03 independent review `review/trishen-terra-20261113/review.md` checked
  Williams (Theorem 2.13 p.29; 2.17/2.19 pp.33–34), Sawyer (Theorem 32 p.78),
  Melrose (Theorem 1.3 p.22; Fourier conventions pp.21–22), OS75 (named theorem
  IV.1 p.287), Tropp (Theorem 6.32 p.52) and Jaffard (Proposition 2 p.464).
- Sawyer Theorem 32 gives representation and limited regularity in general;
  Theorem 33 p.87 gives full regularity under sigma-compactness. The compact
  character space satisfies that extra hypothesis. Do not attribute general
  full regularity to Theorem 32 alone. The manuscript currently needs Borel
  representation only.
- G04 `finalization-20261113/historical.md` inspected Wilson 1974 §III
  pp.2451–2452, Gross–Wilczek 1973 pp.1343–1344, Politzer 1973 pp.1346–1348,
  Balaban 1987 abstract/§0 pp.249–251, OS73 pp.88–90 and OS75 p.282/§IV.1.
  These are context citations, not imported construction proofs. OS75 corrects
  the earlier OS73 sufficiency argument; the outline says so.
- Hall book locators were independently inspected in a nonpublisher OCR copy.
  Prefer the separately checked author arXiv v1: Definition 2.2 p.9, Theorem 3.6
  p.32, Definition 3.13 p.36 and Theorem 3.23 p.44. Existing `hall2000` is retained.

## Newly checked analytic inverse replacement

Primary MIT OpenCourseWare lecture notes:
https://ocw.mit.edu/courses/18-117-topics-in-several-complex-variables-spring-2005/989bea2ba42545febc2830a2b5f59cf2_18117_lec07.pdf

Opened the complete three-page PDF and visually inspected page 1 on 16 November.
The holomorphic inverse theorem on page 1 assumes an invertible complex
Jacobian and concludes a local biholomorphic inverse. The implicit-function
statement immediately following it and its proof on page 2 reduce to this.
This supplies a directly accessible replacement for the old Krantz–Parks
locator, whose theorem body was not checked by G03. A search result labelled
as that book instead downloaded an unrelated 2019 quantum-systems slide deck;
it is discarded, not evidence for the book.

Recommended replacement in `predictor-branch.tex` (parent-owned chapter), for
the text from “By the real-analytic inverse function theorem” through “there is”:

```tex
Complexify the finite-dimensional real spaces. The convergent power series
of $\Phi$ gives a holomorphic extension whose derivative at zero is the
complexification of $(X,N)\mapsto X+N$, hence an isomorphism. The holomorphic
inverse theorem \cite[p.~1]{MITSCV} gives a local holomorphic inverse.
Conjugation invariance of $\Phi$ and uniqueness of that inverse imply that
it maps real points to real points. Its restriction is therefore
real-analytic. Thus there is
```

At the later real-analytic implicit-function use, append:

```tex
Here the analytic implicit-function theorem follows from the same inverse
theorem: for an equation $F(x,y)=0$ with invertible $D_yF$, apply it to
$(x,y)\mapsto(x,F(x,y))$ and restrict the inverse to $(x,0)$.
```

No new uniform radius is imported by this argument: finite-dimensional local
invertibility is all that this citation supplies.

## Other recommended exact attribution changes

In `centered-estimates.tex`, replace the incomplete parenthetical
`(\emph{Matrix Analysis}, 2022, Theorem 6.32, p.~52)` by
`\cite[Theorem~6.32, p.~52]{Tropp}`. The existing reduction to Schatten Holder
and endpoint continuity stays unchanged.

Jaffard's current complete footnote may stay; for a unified bibliography it
may be replaced with `\cite[Proposition~2, p.~464]{Jaffard}`. This is qualitative
context only; retain the manuscript's independent uniform bound.

Hall's inline book locator in predictor-branch can be replaced with the above
verified `hall2000` statements, matching the exact assertion at each use.

## Remaining precision limitation

BHV's SNAG Theorem D.3.1 p.397 was checked in indexed primary text by G03, but
its exact displayed character convention was not visually checked there. A
fresh direct download timed out here. The theorem's existence of a PVM on the
dual and strong-continuity hypothesis were checked by that review. The outline
now explicitly identifies the real dual by $p\mapsto(x\mapsto e^{ip\cdot x})$;
the manuscript should keep its own convention independent of source glyphs.
This is not a claim of a fresh full BHV page verification.

## Prerequisites

The new outline paragraph explicitly includes Fubini–Tonelli, pi-lambda,
Bochner integration, Cauchy formula, Hahn–Banach, Hilbert spaces, Schwartz
Fourier transform, Gaussian inequalities and Wick's rule. It identifies Lie
groups/Haar integration as prerequisites and points to local citations for
non-elementary spectral/representation/local-analytic inputs. No generic
statement that all named external theorems have been audited is made.
