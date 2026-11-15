# Re-read of lem:ex-lattice-firesky-chamber (trace-firesky-gallery.tex l.197-243 at 1e511906),
# finding M1 of review stalex444-claude-395rev-20261114: does the mesh condition
#     a_N (Z_d + 2) < (3/8) a_w                      (l.206)
# force N >= k?  Exact rational arithmetic; no manuscript text.
#
# Spacings: a_0 = 1, a_{m+1} = a_m / L_{m+1}, block lengths odd and >= 3.
# Definitions (l.95-96): ell = max{ j <= k : a_j/a_k >= D },  D = m*mu_k^2 (> 1),
#                        w   = max{ j <= ell : a_j/a_ell >= C }, C = c_k^10 (>= 1),
# with max(empty) = 0.  D and C are treated as free chart data here.
#
# General fact checked: if D > 1 then ell < k, and if C > 8(Z_d+2)/3 then N = ell
# satisfies the mesh condition (a_ell/a_w <= 1/C), so every N in [ell, k) does,
# while a_k/a_N = 1/(L_{N+1}...L_k) is not an integer for N < k.
from fractions import Fraction as Fr
import random

def levels(L, k, D, C):
    a = [Fr(1)]
    for j in range(1, k + 1):
        a.append(a[-1] / L[j])
    S = [j for j in range(k + 1) if a[j] / a[k] >= D]
    ell = max(S) if S else 0
    S = [j for j in range(ell + 1) if a[j] / a[ell] >= C]
    w = max(S) if S else 0
    return a, ell, w

def bad_N(a, k, w, Z):
    out = []
    for N in range(0, k):
        if a[N] * (Z + 2) < Fr(3, 8) * a[w]:
            r = a[k] / a[N]
            out.append((N, r.denominator != 1))
    return out

# 1. A concrete example with every block length 3 (the smallest allowed).
k, D, C, Z = 20, 3**5, 2**10, 0           # D = m mu_k^2, C = c_k^10 with c_k = 2
L = [None] + [3] * k
a, ell, w = levels(L, k, D, C)
bn = bad_N(a, k, w, Z)
print("example: L_j=3, k=%d, m*mu^2=%d, c_k^10=%d, Z_d=%d -> ell=%d, w=%d" % (k, D, C, Z, ell, w))
print("  N < k satisfying the mesh condition:", [n for n, _ in bn])
print("  a_k/a_N non-integer for all of them:", all(f for _, f in bn))
N = ell
print("  at N=ell=%d: a_N(Z+2)=%s < 3a_w/8=%s ; a_k/a_N=%s" % (N, a[N] * (Z + 2), Fr(3, 8) * a[w], a[k] / a[N]))

# 2. Randomised: odd block lengths 3..15, D in (1, 10^6], C = c^10 with c in 2..5, Z in 0..30.
random.seed(392)
trials = fails = 0
for _ in range(20000):
    k = random.randint(2, 60)
    L = [None] + [random.choice(range(3, 16, 2)) for _ in range(k)]
    D = Fr(random.randint(2, 10**6), random.randint(1, 1))
    C = random.randint(2, 5) ** 10
    Z = random.randint(0, 30)
    if not C > Fr(8 * (Z + 2), 3):
        continue
    a, ell, w = levels(L, k, D, C)
    if not (a[ell] / a[k] >= D and a[w] / a[ell] >= C):
        continue   # dilation or depth of (F1) fails (empty set); outside the lemma's setting
    trials += 1
    # claim: ell < k, and N = ell satisfies the mesh condition with a_k/a_ell non-integer
    ok = ell < k and a[ell] * (Z + 2) < Fr(3, 8) * a[w] and (a[k] / a[ell]).denominator != 1
    if not ok:
        fails += 1
print("random trials with dilation and depth of (F1) and c_k^10 > 8(Z_d+2)/3: %d ; trials where N=ell<k fails to be a counterexample: %d" % (trials, fails))
