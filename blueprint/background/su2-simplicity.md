# Real Lie-algebra simplicity for the defining SU(2) representation

- Literature task: [issue #5](https://github.com/hairer/humanise-yang-mills/issues/5).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Status: source checked; draft application argument, not independently accepted.
- Contributor and agent assistance: TrishenGunaratnam; research and drafting assisted by Codex, session `TrishenGunaratnam-codex-01`.
- Independent review: pending; no reviewed commit or review link yet.
- Claim: [coordinator grant](https://github.com/hairer/humanise-yang-mills/issues/5#issuecomment-6797130245), following the scoped request. The grant text says only “CLAIM GRANTED”; the contributor instructed this session to proceed on the requested scope and expiry, 2026-11-11 18:00 UTC.

## Result to be used

Put

$$
G=\{U\in M_2(\mathbb C):U^*U=UU^*=1,\ \det U=1\},\qquad
 L=\{X\in M_2(\mathbb C):\exp(tX)\in G\text{ for every }t\in\mathbb R\}.
$$

The scalar field of $L$ is **real**, and its bracket is
$[X,Y]=XY-YX$. The needed assertion is:

1. Some $X,Y\in L$ have $[X,Y]\ne0$.
2. Every real vector subspace $J\subseteq M_2(\mathbb C)$ such that
   $J\subseteq L$ and $[L,J]\subseteq J$ equals either $0$ or $L$.

This is exactly nonabelian simplicity of the real Lie algebra
$\mathfrak{su}(2)$. It is not abstract-group simplicity of $G$.

## Mathematical reference

The checked route uses a matrix Lie-algebra identification and a specific
complex simplicity result, followed by the explicit application below.

| Source and inspected version | Exact locator | Result used |
| --- | --- | --- |
| Brian C. Hall, *An Elementary Introduction to Groups and Representations*, arXiv:math-ph/0005032v1, 31 May 2000, [versioned PDF](https://arxiv.org/pdf/math-ph/0005032v1) | Chapter 3, Definition 3.13, printed pp. 36–37 (PDF pages 42–43); §5.4, printed pp. 37–38 (PDF pages 43–44) | The one-parameter definition of a matrix Lie algebra, and its identification for SU(n) as the skew-Hermitian traceless matrices. |
| Alexander Kirillov, Jr., *Introduction to Lie Groups and Lie Algebras*, [author-hosted preliminary electronic version](https://www.math.stonybrook.edu/~kirillov/liegroups/liegroups.pdf), inspected 11 November 2026 | §5.6, Definition 5.36 and Example 5.38, printed p. 80 (PDF page 80) | Simplicity means nonabelian with no nonzero proper ideals; the complex Lie algebra sl(2,C) is simple. |

The actual statements and the argument in Example 5.38 were inspected, not just
search excerpts. Kirillov gives a proof of this specific example. No general
classification theorem is needed. The author identifies this as a
[preliminary version](https://www.math.stonybrook.edu/~kirillov/liegroups/)
of his book. It has 177 PDF pages and
contents beginning with “Preface 9”; the numbering here refers to that file,
not an unchecked pagination in the 2008 Cambridge print edition. Hall's
arXiv notes are not the 2003 or 2015 Springer editions of his later textbook.

## Match to the formalisation

All paths below are relative to this repository; the imported source is pinned
by `source/upstream.json` to the revision above.

| Qualified declaration | Source path | Meaning checked |
| --- | --- | --- |
| `YM.GaugeU`, `YM.Gauge`, `YM.Gauge.repDim`, `YM.Gauge.mat` | `Lean/YM/Gauge/MatrixGroup.lean` | The parameter `n` indexes complex representation dimension `n+1`; `mat` forgets the unitary and subgroup subtype wrappers. |
| `YM.Next.Foundations.SUtwo` | `Lean/YM/Next/FOUNDATIONS/SU2.lean` | `n := 1`; the image is exactly determinant-one elements of U(2). Thus the matrices are 2 by 2, not 1 by 1. |
| `YM.Gauge.Generates`, `YM.Gauge.lie`, `YM.Gauge.mem_lie`, `YM.Gauge.bracket_mem`, `YM.Gauge.Simple` | `Lean/YM/Gauge/Lie.lean` | All-real-time exponential generators, a real submodule with commutator bracket, and precisely the two simplicity clauses above. |
| `YangMills.GaugeGroup`, `YangMills.GaugeGroup.IsSimple` | `Lean/PublicTheory.lean` | The public Lie algebra is tied to the same exponential condition by its `generates` field; ideals are real ambient matrix submodules contained in that algebra. |
| `YangMills.su2`, `YangMills.su2Simple`, `YangMills.su2Theory` | `Lean/ConcreteSU2.lean` | `su2` packages `SUtwo` and its `lie`; `su2Simple` uses the internal theorem directly. `su2Theory` applies `jointExistence` to these inputs. |
| `YM.Examples.SU2.simple` | `Lean/YM/Examples/SU2.lean` | Existing internal proof of `SUtwo.Simple`. Its private matrix calculations are not a new exposition task. |

The range of `mat` is exactly $G$: its wrappers require unitarity and
determinant one, and any matrix meeting these requirements supplies the two
subtype witnesses. Hence the formal exponential condition is the displayed
definition of $L$, with no additional restriction on its elements.

The commutator is the usual mathematical convention, with no factor of $i$.
Hall's identification therefore applies as stated:

$$
L=\{X:X^*=-X,\ \operatorname{tr}X=0\}.
$$

The hypotheses here are checked by the concrete matrix group above, not by
assuming an arbitrary field named `lieAlgebra` has the usual meaning. The real
submodule and bracket closure are provided by `YM.Gauge.lie` and
`YM.Gauge.bracket_mem`. The public packaging uses the same carrier.

An ambient real submodule contained in $L$ is equivalently a real vector
subspace of $L$. Its stated closure under $[L,J]$ is the ordinary Lie ideal
condition; antisymmetry also gives $[J,L]\subseteq J$. Thus no closedness of
ideals, invariance under the whole group, or complex scalar closure is being
silently added.

## Application and remaining proof obligations

The following bridge is supplied explicitly rather than identifying real and
complex simplicity without justification. Its mathematical reasoning is an
application proposed for review; it is not a claim that the Lean proof follows
this route.

### Identify the complexification

Write $\mathfrak{s}=\{Z\in M_2(\mathbb C):\operatorname{tr}Z=0\}$, with its
complex vector-space structure and matrix bracket. For $Z\in\mathfrak{s}$, put

$$
X=(Z-Z^*)/2,\qquad Y=(Z+Z^*)/(2i).
$$

Taking adjoints gives $X^*=-X$ and $Y^*=-Y$. Their traces vanish since
$\operatorname{tr}Z=\operatorname{tr}Z^*=0$, so $X,Y\in L$, and
$Z=X+iY$. This expression is unique: if $X=-iY$ with both $X,Y$
skew-Hermitian, then $-iY$ is Hermitian, so $X$ is both Hermitian and
skew-Hermitian and must be zero, as must $Y$.

Consequently $\mathfrak{s}=L\oplus iL$ as real vector spaces. The map

$$
L\otimes_{\mathbb R}\mathbb C\longrightarrow\mathfrak{s},
 \qquad X\otimes z\longmapsto zX
$$

is complex linear and bijective by this decomposition. It preserves the bracket
because $[zX,wY]=zw[X,Y]$. Thus this is the required complex Lie-algebra
identification with $\mathfrak{sl}_2(\mathbb C)$.

### Transfer the ideal conclusion back to real scalars

Let $J\subseteq L$ satisfy the real ideal condition. Inside $\mathfrak{s}$
form $J_{\mathbb C}=J+iJ$. It is a complex vector subspace: multiplication by
$i$ sends $a+ib$ to $-b+ia$. For $x,y\in L$ and $a,b\in J$,

$$
[x+iy,a+ib]=[x,a]-[y,b]+i([x,b]+[y,a])\in J+iJ.
$$

Hence it is a complex Lie ideal of $\mathfrak{s}$. If $J\ne0$, then
$J_{\mathbb C}\ne0$. Applying Kirillov's Example 5.38 gives
$J_{\mathbb C}=\mathfrak{s}$. For any $x\in L$, write $x=a+ib$ with
$a,b\in J$. Uniqueness of the decomposition in $L\oplus iL$ forces
$a=x$ and $b=0$, so $x\in J$. Thus $J=L$. If $J=0$, the other
alternative already holds. This proves exactly the second formal clause.

### Check the nonabelian clause and boundary of the application

The matrices

$$
A=\begin{pmatrix}i&0\\0&-i\end{pmatrix},\quad
 B=\begin{pmatrix}0&1\\-1&0\end{pmatrix},\quad
 C=\begin{pmatrix}0&i\\i&0\end{pmatrix}
$$

are skew-Hermitian and traceless, so belong to $L$. Direct multiplication
gives $AB=C$, $BA=-C$, hence $[A,B]=2C\ne0$. This supplies the first
formal clause independently of differences in textbook simplicity conventions.
These are also the matrices used in the inspected internal proof.

The combined argument supplies `YangMills.su2Simple`. The only use inspected in
`YangMills.su2Theory` is passing that proof as the simplicity hypothesis to
`YangMills.jointExistence`. This note establishes no other hypothesis or
conclusion of that theorem and gives no reconstruction or mass-gap result.

No quotient by the centre is needed for this real Lie-algebra result. Indeed
$\{1,-1\}$ is a nontrivial proper central subgroup of $G$: both scalar
matrices have determinant one, and $A\in G$ is neither of them. Thus an
assertion that SU(2) is simple as an abstract group would be false here. Likewise,
simple connectedness is a different property. Neither connectedness nor simple
connectedness is used in the ideal-transfer argument, and no implication in
the reverse direction from real simplicity to complex simplicity is assumed.

There is no unmatched mathematical hypothesis identified for this particular
source match. Independent verification of the carrier identification, the
complexification bridge, and the references remains required before acceptance.

## Search and unresolved questions

Searches on 11 November 2026 included `su(2) simple real Lie algebra lecture
notes university proof`, `Brian Hall Lie groups Lie algebras SU(2) simple Lie
algebra theorem pdf`, and `site.math.stonybrook.edu kirillov lie groups book pdf
simple sl(2)`. The existing background directory contained only its README;
the bounded search of `Bots/notes/`, the statement audit, and open PRs found
no competing SU(2) literature note.

- **Selected:** Hall's versioned arXiv notes for the carrier identification;
  Kirillov's author-hosted electronic text for the specific simplicity result.
- **Not used as evidence:** search snippets, Wikipedia entries, and third-party
  copies of Hall's Springer textbook. No theorem number from those editions is
  asserted to match the checked arXiv version.
- **Alternative not pursued:** Knapp's author page for the second edition of
  *Lie Groups Beyond an Introduction* supplies bibliographic information but
  did not itself supply the needed theorem statement. A general classification
  route would add unnecessary machinery.
- **Rejected substitutions:** a group simplicity assertion, a theorem about
  simple connectedness, and semisimplicity alone do not supply the target.
- **Source-audit relation:** `blueprint/public-statement.md` was inspected for
  the SU(2) roots. This note does not modify that audit; interpretation and
  correspondence remain subject to independent review.

### Inspection and validation evidence

The six files in the crosswalk were read in bounded excerpts or in full where
short. Commands actually run included:

```sh
cat Lean/ConcreteSU2.lean templates/background-result.md
cat Lean/YM/Examples/SU2.lean
cat Lean/YM/Next/FOUNDATIONS/SU2.lean
cat Lean/YM/Gauge/MatrixGroup.lean
sed -n '1,90p' Lean/PublicTheory.lean
sed -n '1,55p' Lean/YM/Gauge/Lie.lean
sed -n '120,195p' Lean/YM/Gauge/Lie.lean
sed -n '155,185p' blueprint/public-statement.md
rg -n 'su2Simple|su2Theory|simplicity|SU\(2\)' blueprint/background Bots/notes source/audit.md blueprint/public-statement.md
```

Two preliminary path searches failed because guessed paths/globs did not
exist; the correctly cased paths above were then read successfully. No
mathematical conclusion relies on those failed searches. The six inspected
source files were checked against `Lean/SOURCES.sha256`; all matched.

Structural validation: `python3 scripts/check_blueprint.py` and
`git diff --no-index --check /dev/null blueprint/background/su2-simplicity.md` found no whitespace errors (exit status 1 denotes the new-file difference). These checks do not validate background-note
references, mathematical truth, or independent acceptance.

Not performed: a fresh Lean build, elaborated-type/axiom replay, or independent
mathematical or Lean-correspondence review. This prose-only task preserves
`Lean/`; its correspondence evidence is source inspection, not a new kernel
check. Existing axiom evidence is recorded separately in `source/audit.md`.
The author-hosted Kirillov URL is mutable; reviewers should recheck the named
example and pagination in the version they inspect.
