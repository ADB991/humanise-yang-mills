"""Response audit checks for #384 (trace-rounded-receipt.tex at 3166276d).
1. M1 reduced-threshold argument: for random positive spacings a_j, monitors mu_j >= 1,
   base arcs b > 5 and thresholds theta, any returned (k, b) with g_b(k) < theta'
   has k >= K; and theta' <= theta.  Also a counter-check: with theta instead of theta',
   levels k < K do occur (so the reduction is doing work).
2. Supply arithmetic with M: I = log(mu)/(16M), a = e^{2I} = mu^{1/(8M)},
   e^I / a = e^{-I} = mu^{-1/(16M)} (symbolic).
3. K(i, 1/(i+1)) monitor conditions with M_i = i+2 (log10 of the binding bound).
"""
import math, random
import sympy as sp

random.seed(384)
viol = 0; below_K_without_reduction = 0; trials = 0
for _ in range(20000):
    K = random.randint(0, 12)
    n = K + 30
    a = [10 ** random.uniform(-8, 0) for _ in range(n)]
    mu = [10 ** random.uniform(0, 3) for _ in range(n)]
    theta = 10 ** random.uniform(-10, 1)
    thp = min([theta] + a[:K]) if K > 0 else theta
    assert 0 < thp <= theta
    for k in range(n):
        b = 5 + random.uniform(1e-9, 3)
        g = a[k] * mu[k] ** b
        assert g >= a[k]
        trials += 1
        if g < thp and k < K:
            viol += 1
        if g < theta and k < K:
            below_K_without_reduction += 1
print("M1: trials", trials, "returned k<K with g<theta':", viol,
      "| k<K with g<theta (unreduced):", below_K_without_reduction)

mu, M = sp.symbols('mu M', positive=True)
I = sp.log(mu) / (16 * M)
a_ = sp.exp(2 * I)
print("a - mu^(1/(8M)) =", sp.simplify(sp.powsimp(a_ - mu ** (1 / (8 * M)), force=True)))
print("e^I/a - e^-I =", sp.simplify(sp.exp(I) / a_ - sp.exp(-I)))
print("e^-I - mu^(-1/(16M)) =", sp.simplify(sp.powsimp(sp.exp(-I) - mu ** (-1 / (16 * M)), force=True)))

for i in range(5):
    Mi = i + 2
    cost = 16 * Mi * math.log10(i + 1)
    width = 0.5 * math.log10(800)
    print(f"i={i} M={Mi}: log10 mu >= max(cost {cost:.2f}, width {width:.2f}) = {max(cost, width):.2f}")
