# C16-to-C11 schedule endpoint

Session: `mgubi-astra-c11-c16-schedule-20261113`; issue #178.
Claim: https://github.com/hairer/humanise-yang-mills/issues/178#issuecomment-6863015786.
Contributor: mgubi, assisted by OpenAI Codex/Astra. This account reviewed C11
and authored C16. This is a C11 endpoint check and **author-side C16 comparison**,
not independent C16 approval, human acceptance or a global cycle check.

C16 is frozen at `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`;
C11 is frozen at PR #223, `1a084088a29f0ae4e4f59d3c414344a74e0843c5`.
The four numerical clauses below admit a conditional endpoint acknowledgement.
No new schedule mismatch was found. This does not construct the analytic offers
or identify independently constructed histories. Only this edge is assessed.

## Matched clauses and indices

**Drift floor.** `common-scale-selection.tex` selects the block sides after the
profile errors, so that epsilon_j/log L_j <= min(s_G/4,j^-2) and
lambda_j/log L_j <= j^-2. For each fixed stage these follow by increasing L_j;
the nondecreasing odd choice does not weaken them. They are the adjacent drift
and drift-ratio inequalities of `surviving-interval-shooting.tex`. The
realization has J(m) <= J(m+1) <= J(m)+1 and pays
`d_{J(m+1)} <= betaHat_m`, including the first plateau. Drift estimates remain
conditional on the stated kinetic/path data supplying those errors.

**Loop capacities.** Use the actual side-dependent W_j(L_j), fixed after L_j,
and positive nonincreasing protection exponents theta_j. The producer
`lem:common-loop-capacity` gives, with j=J(m+1),

- W_j(L_j) <= loopCap_m;
- loopCap_(m+1)/2 <= loopCap_m;
- 1 <= loopCap_m.

These are exactly the three inputs printed in the frozen C11 path attachment
chapter: 64 loopCap_(m+1)/128 is loopCap_(m+1)/2. The threshold is indexed by
the incoming **stage**, the receiving capacity by the outgoing **level**.
Here loopCap_m=2 P(betaHat_m)^(theta_{J(m)}),
P(x)=exp((log log x)^2). At fixed j, v_j=s_G log L_j is fixed;
P(x+v_j)^(theta_j) <= 2P(x)^(theta_j) eventually. Positivity and
nonincrease of theta then give the outgoing comparison. No common threshold
for every stage is asserted: each stage has its own Delta_j, included in d_j.
The existence of suitable path and protection inputs is not supplied by this
numerical lemma.

**Two distinct cubic purchases.** Keep them separate. Write i=J(m),
j=J(m+1), t(x)=x^(-1/2)P(x), deltaE(x)=x^(-11/10), and
A_j=drift_j+|s_G log L_j|. The physical reset chapter requires:

1. The regular allocation `eq:reset-allocation`,
   `64 v_i^reset A_j t(x)^3 <= deltaE(x)`.
2. The healthy-test purchase,
   `2 A_j C_i t(x)^3 <= F_ji(x)/2`, where
   `F_ji(x)=q_ji deltaE(x)` and q_ji>0; C_i is the profile path constant.

The second is not a consequence of the first without an additional comparison
of its constants. Both have finite fixed-stage coefficients after the sides,
rates and protection have been chosen. Their residual ratio is a constant
times `x^(-2/5) exp(3(log log x)^2)`, tending to zero. At each incoming stage
only i in {j,j-1} is admissible (intersected with natural stages). Thus finitely
many lower thresholds pay **both** purchases. The alpha bound is uniform in
N>m; no threshold depends on a later horizon or finite period. The same-data
kinetic estimate and the other portions of the reset test are still premises.

**Startup.** The startup chapter's numerical construction fixes the stage
profile and clip (including positive relaxation and direct clip <=1), and uses
s=log x, M=exp((log s)^2), t=exp(-s/2)M, B=ceil(s^2),
gamma=exp(-M/2), sigma=kappa=M. Its relaxation, smallness, regular-book,
loan, gas-size and forced-allowance conditions hold beyond a stage threshold.
In particular the regular book has logarithm constant-3s/2+5(log s)^2,
which is eventually <=-11s/10. The loan compares 2M with a positive multiple
of M^2; the forced price decays faster than exp(-M^(1/5)). Thresholds expressed
in s must be converted to entry-coupling thresholds x by exponentiation.
The source `Timing.enough` states the result directly at x=betaHat_N.

Startup consumes stage J(N), whereas the schedule payment at step m uses
J(m+1). There is no off-by-one gap: for N=n+1,
`d_{J(N)} <= betaHat_n <= betaHat_N`. At N=0 use the initial bar
`beta_* >= d_{j_*}` and J(0)=j_* (the manuscript also has J(1)=j_*).
This is exactly the two-case source receipt. Fixed finite insertion asks are
included before delays; it is not a purchase of all countably many asks at one
stage. Stronger startup reserves may be included only with their fixed data
and their own established eventual bounds.

## Why the generic list is sufficient for this numerical edge

The final-delay list in `common-scale-selection.tex` explicitly names startup
and reset thresholds, then imports the entry list in `common-funded-history.tex`.
That list explicitly includes **scalar reset and startup prices**. It fixes
profiles, block lengths, rates/gaps, protection, menus and auxiliary finite
lists before taking the finite stagewise maximum and its running maximum.
The two reset purchases above and the startup bounds are such eventual,
upward-stable inequalities. Consequently their thresholds can be included
without changing those earlier objects. Subsequent delay increases preserve
the inequalities. Only after this completion is a realization chosen.

This is a specified inclusion in a named list, not an inference that any
unspecified inequality is automatically paid. The regular allocation is also
printed later in the common-funded-history argument; its presence alone would
not pay the distinct healthy-test cubic bound. The pinned reset source supplies
that second purchase explicitly, and the startup source explicitly permits
future delay increases. No numerical circularity is introduced by these
purchases: constants must be fixed before delays, not recovered from the
resulting finite-horizon solution.

## Remaining obligations and ownership

No new C16 schedule repair is requested on this edge. C16 (#57/#178) retains
responsibility for the stated choice order and for any later change to its
threshold list. C11 (#52/#190) retains the actual path/clip, stationary response,
auxiliary service, local expansion and reset hypotheses; constructing them is
not a consequence of paying their scalar bounds. C11's named inputs preserved
by PR #223 and review #229 remain in force.

In particular a Wilson terminal construction must use the same stage profile,
clip, clock, parameters, insertion data and paid history. The common-funded
argument's retained/revised paths and normalization identifications remain
conditions, not consequences of a finite maximum. Analytic startup, nonlinear
supplier and below-terminal continuation questions are not decided here.
The other #178 edges, C12's concurrent endpoint task, the C11 part-B findings
outside these numerical clauses, and global G06/cycle closure are untouched.
An independent different-account C16 review remains necessary; this document
does not refresh or extend another reviewer's approval.
