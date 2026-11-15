"""Renewed check of the chamber lemma at dae5af1f (gallery l.218-265).
Exact rationals. Clock: a_m = 1/prod_{t=1}^m L_{J(t)}, L odd >= 3.
For each instance: compute ell, w (gallery l.101-102), then for every N
in a window check, for N >= k: a_k/a_N integer, q = a_w/a_N odd integer,
and for every integer offset |u| <= q/8 and stencil coordinate |s| <= Z_d,
mesh a_N(Z_d+2) < 3/8 a_w  =>  |u|+Z_d+1 < (q-1)/2 (strict interior).
Also report mesh-satisfying N < k with a_k/a_N non-integer (the range
the revision excludes).  An example, not the argument."""
from fractions import Fraction as F
import itertools, random, math

def run(Ls, k, mmu2, ck10, Zd):
    a = [F(1)]
    for t in range(1, k + 12):
        a.append(a[-1] / Ls[t])
    ell = max([j for j in range(k + 1) if a[j] / a[k] >= mmu2], default=0)
    w = max([j for j in range(ell + 1) if a[j] / a[ell] >= ck10], default=0)
    bad = []; below = []; ok = 0
    for N in range(0, k + 10):
        mesh = a[N] * (Zd + 2) < F(3, 8) * a[w]
        if not mesh:
            continue
        r = a[k] / a[N]
        if N < k:
            if r.denominator != 1:
                below.append(N)
            continue
        q = a[w] / a[N]
        if r.denominator != 1 or q.denominator != 1 or q.numerator % 2 == 0:
            bad.append((N, 'integrality')); continue
        q = q.numerator
        umax = q // 8  # largest integer with u <= q/8
        if not (umax + Zd + 1 < F(q - 1, 2)):
            bad.append((N, 'interior')); continue
        # the displayed chain: q/8+Zd+1 < q/2-1 < (q-1)/2
        if not (F(q, 8) + Zd + 1 < F(q, 2) - 1 < F(q - 1, 2)):
            bad.append((N, 'chain')); continue
        ok += 1
    return ell, w, ok, bad, below

random.seed(427)
total_ok = 0; total_bad = []; n_below = 0; nk_equal_ok = 0
for trial in range(400):
    k = random.randint(6, 22)
    Lval = [random.choice([3, 5, 7]) for _ in range(40)]
    Lval.sort()  # nondecreasing
    Ls = [None] + Lval
    mmu2 = F(random.choice([3, 9, 27, 81, 243]))
    ck10 = F(random.choice([1, 3, 9, 27]))
    Zd = random.randint(0, 4)
    ell, w, ok, bad, below = run(Ls, k, mmu2, ck10, Zd)
    total_ok += ok; total_bad += bad; n_below += bool(below)
# the 392rev example: L=3, k=20, m mu^2 = 3^5, c_k = 2, so c_k^10 = 2^10, Zd=0
ell, w, ok, bad, below = run([None] + [3] * 40, 20, F(3 ** 5), F(2 ** 10), 0)
print("random instances: 400; N>=k cases passing:", total_ok, "failures:", total_bad[:5])
print("instances with a mesh-satisfying N<k and a_k/a_N non-integer:", n_below)
print("392rev example: ell=%d w=%d; N>=k passing=%d; failures=%s; excluded N<k=%s" % (ell, w, ok, bad, below))
# N = k is included and needed by nothing downstream: the consumer uses N > k_i.
