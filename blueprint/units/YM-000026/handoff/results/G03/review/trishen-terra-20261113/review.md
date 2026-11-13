# Independent G03 bibliography review — bounded findings

Reviewer session `TrishenGunaratnam-terra-g03-review-20261113`, claim
<https://github.com/hairer/humanise-yang-mills/issues/59#issuecomment-6841843309>.
Review target PR #102 at `1eb2f61c12ba89ebfa7c956b42e07a6f200f0cd5`, manuscript
basis `d3c7a1901390f4821d4b91f6f639bb5c60c63604`. This is an independent
bibliography/attribution review, not acceptance of the full manuscript or a Lean
correspondence review of its mathematics. Final chapters and G04 Section 2 remain
outstanding. `basis-hashes.json` fingerprints the 241 included chapters, main file,
six author records and proposed bibliography at this target.

## Findings for the G03 author and integrator

1. **Correct the general Sawyer statement in ledger L4.** Sawyer, Chapter 6,
   Theorem 32, printed p. 78, gives a positive Borel measure with **limited**
   regularity on a general locally compact Hausdorff space; Theorem 33, p. 87,
   supplies full regularity under sigma-compactness. The ledger's parenthetical
   “regular” as a general conclusion elides this distinction. The actual space
   `Xi` in `phase-selection.tex:12–46` is compact Hausdorff, hence sigma-compact,
   so full regularity follows and the representing-measure application is not
   invalidated. Cite Theorem 33 if full regularity is claimed in the ledger;
   cite Theorem 32 for the representation. Source: Sawyer's [lecture notes](https://math.mcmaster.ca/~sawyer/Publications/Advanced_Real_Analysis.pdf),
   pp. 78 and 87. The chapter only says positive Borel measure here.
2. **Qualify the blanket pass verdict.** `findings.md` and PR #102 say no
   load-bearing citation is misapplied, but the author explicitly could not
   inspect Krantz–Parks and some other original statements. The visible
   hypotheses are plausible, and checks below strengthen several entries, but
   absence of a found error is not verification of every cited source. State
   which applications were checked and retain the unresolved source-access
   limitation. No counterexample to the Krantz–Parks application is asserted.
3. **Complete Tropp and update status comments.** The original identifies Joel
   A. Tropp, *ACM 204: Matrix Analysis*, Caltech CMS Lecture Notes 2022-01,
   Winter 2022, typeset 22 August 2022, DOI 10.7907/nwsv-df59, Theorem 6.32,
   p. 52. The proposed bibliography omits it because it was unidentified; the
   owner can now add this verified entry and cite the precise version. Hall and
   Jaffard status comments should distinguish the source inspections below from
   the author's earlier access limits. BHV's exact formula still needs a visual
   check because available extraction mangles its character notation.

## Source and application checks

- **Hall 2015, second edition**, GTM 222. A full-text reproduction of the book
  was read at [this source](https://studylib.net/doc/26259296/b.c.-hall---lie-groups--lie-algebras-and-representations-...):
  Definition 1.4 says a matrix Lie group is a subgroup closed in `GL(n,C)`;
  Definition 3.18, p. 56, defines its algebra by `exp(tX) in G` for every real
  `t`; Theorem 3.42, p. 68, gives an epsilon below `log 2` such that `A=exp X`
  with small `X` lies in `G` iff its logarithm is in that algebra. Theorem 2.8
  supplies `log(exp X)=X` on the ball. `predictor-branch.tex:10–64` assumes
  `G` closed in `U(N)` and uses precisely this algebra and the local result;
  its Frobenius norm controls the operator norm. The quoted reproduction is a
  nonpublisher host, and OCR is imperfect; the edition and numbered statements
  were checked there, not against the publisher's copy. The author-checked
  arXiv version provides an independent alternative rather than identical
  pagination.
- **Krantz–Parks**, *A Primer of Real Analytic Functions*, 2nd ed., Birkhäuser,
  2002: the accessible [table of contents](https://unina2.on-line.it/sebina/repository/catalogazione/documenti/Krantz%2C%20Parks%20-%20A%20primer%20of%20real%20analytic%20functions.%202.nd%20ed..pdf)
  places §2.5, “The Inverse Function Theorem,” at p. 47, and §2.3, “The
  Implicit Function Theorem,” at p. 35. It contains front matter only: the
  theorem statement itself was not accessible. `predictor-branch.tex:57–64`
  has an analytic map between finite-dimensional real spaces with derivative
  `(X,N) -> X+N`, an isomorphism, as needed for the usual local analytic
  inverse theorem. Section title alone does not verify the cited version's
  hypotheses or the uncited implicit-theorem application at line 231.
- **Tropp**, [author-hosted notes](https://www.tropp.caltech.edu/notes/Tro22-Matrix-Analysis-LN.pdf),
  Theorem 6.32: for a unitarily invariant norm on finite square matrices and
  conjugate `p,q>1`, `|||AB||| <= ||| |A|^p |||^(1/p) ||| |B|^q |||^(1/q)`.
  For finite `r` and finite `u,v>r` with `1/r=1/u+1/v`, taking the Schatten
  `r` norm and `p=u/r`, `q=v/r` gives the manuscript's two-factor inequality;
  the stated endpoint limiting argument uses finite-dimensional continuity.
  `centered-estimates.tex:80` supplies this reduction and iterates it for a
  finite word. The source gives a proof sketch and points to Bhatia for a
  detailed proof; this is not an assertion of a separate Bhatia check.
- **BHV**, *Kazhdan's Property (T)*, author manuscript dated 23 February 2007,
  [Theorem D.3.1, p. 397](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf):
  for a continuous unitary representation of an LCA group, there is a unique
  regular PVM on its dual; the definitions in Appendix A require strong
  continuity. `spectral-measure.tex:9–23` states strong continuity and applies
  this to `R^4`, identifying its dual with `R^4`. The dual homeomorphism and
  Fourier-sign convention require the separately flagged explanation (F4).
  The web-accessible PDF text was read in context, but extraction mangles the
  theorem's character notation and screenshot attempts failed; visually
  verify the sign before treating the formula as checked. Neither a full PDF
  visual check nor a proof of the representation's upstream strong continuity
  is claimed here.
- **Jaffard**, [original journal scan](https://www.numdam.org/article/AIHPC_1990__7_5_461_0.pdf),
  *Ann. Inst. H. Poincaré, Analyse non linéaire* 7 (1990), 461–476, Definition 1
  p. 463 and Proposition 2 p. 464: on a discrete metric space with uniform
  exponential distance sums for every positive parameter, an `E_gamma`
  matrix invertible on `l²` has inverse in `E_gamma'` for some positive smaller
  rate. The class permits constants depending on each rate below gamma.
  `local-covariance.tex:9–58` has a finite coordinate set, defines the distinct
  address metric, supplies the distance sum and exponential bound, and assumes
  positive definiteness. The chapter proves its own uniform rate and constants;
  the qualitative proposition alone does not supply those uniform estimates.
- **Williams**, [14 February 2024 notes](https://math.dartmouth.edu/~dana/bookspapers/cstar.pdf),
  Theorems 2.13, 2.17, 2.19: nonzero commutative `C*` algebra Gelfand
  isomorphism, spectral permanence for a unital subalgebra with shared unit,
  and continuous functional calculus of a normal element in a unital algebra.
  `phase-selection.tex:22–28, 84–89` and `complex-heat.tex:9–12` use the
  stated unital/commutative or self-adjoint cases. This confirms the locator
  correction F1; it does not review the preceding construction of the algebra.
- **Melrose**, [Chapter 1 notes](https://citeseerx.ist.psu.edu/document?doi=39db0dfc8aea32b6d77f6d5b15819f0cd6f02a6f&repid=rep1&type=pdf),
  §1.7, formulae (1.59)–(1.61) and Theorem 1.3: Fourier transform and inverse
  are continuous inverse maps on Schwartz space, with the displayed radian
  normalization. This matches `boundary-detection.tex:38–40`. The accessible
  copy's pagination differs from the cited Chapter 1 copy; theorem and formulas
  checked, exact p. 22 in the cited edition not independently checked.
- **Osterwalder–Schrader**, [1975 journal scan](https://projecteuclid.org/journals/communications-in-mathematical-physics/volume-42/issue-3/Axioms-for-Euclidean-Greens-functions-II-with-an-Appendix-by/cmp/1103899050.pdf),
  §IV.1, p. 287, states `E' (or E'') -> R'` using the strengthened growth
  condition plus E1–E4 and concludes a uniquely determined Wightman theory.
  The title page credits the appendix to Stephen Summers. The manuscript
  (`reflection.tex:204–214`) explicitly presents this as a possible route with
  the growth and other assumptions still to be matched. This confirms F2 as
  an attribution/locator improvement, not an established application.

## Inventory and proposed versions

A fresh literal scan of the 241 `existence.tex` inputs found seven `\\cite`
occurrences: three Williams, one each Sawyer, Melrose, BHV and OS75; the main
file has five bibitems. The inline Hall, Krantz–Parks, Jaffard and Tropp uses
were checked separately. This corroborates the explicit-citation inventory,
not an exhaustive semantic search of unnamed or implicit literature use.
The author catalogues named standard results but spot-checks rather than proves
all their applications. No whole-manuscript mathematical review is implied.

PR #103 head `bddbedcf2981f7bf2c9f68394cbd75385a14e4a3` and PR #104 head
`10d5d565ec2c4c1ea85fa0abb3b78cc726733f20` each have base `d3c7a190...`.
Their 8 and 9 changed manuscript-file patches were read separately. No added
or deleted line names a listed source, adds/removes `\\cite` or `\\bibitem`,
or mentions bibliography; a targeted scan for common named analytical
results found only an unrelated wording change about a Cauchy sequence. These
proposed files are not part of the G03 basis and their mathematical applications
were not independently reviewed. Re-audit the integrated final files and G04
historical outline; the two proposed PRs do not supply final chapter hashes.

## Actual validation and limits

- `git fetch upstream pull/102/head:refs/remotes/upstream/g03-review-candidate`
  initially failed in the network sandbox (DNS); an approved escalated retry
  succeeded, and `git rev-parse` identified the exact requested head. A new
  isolated clone and branch were used; no push or PR was made.
- Python parsed the 241 distinct include directives, printed seven citation
  occurrences and computed the accompanying 249-file SHA-256 manifest. The
  eight named literature-use chapter hashes match the author validation record.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean
  and mathematics were not verified.` No Lean build, axiom replay, book access
  to Krantz–Parks theorem body, or full manuscript proof review was performed.
- Web source text was read as stated above. One guessed Dartmouth URL and MIT
  URL failed; correct Williams and alternate Melrose copies were found. BHV
  screenshot calls failed; OCR notation remains a sign-check limitation.
- Existing author reports and the proposed bibliography were not edited. This
  report is independent review evidence for the stated target only, not a
  machine-readable approval, a final whole-proof verdict, or human acceptance.
