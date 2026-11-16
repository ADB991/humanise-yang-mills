"""Forward-lens checks for PR #377 (commit 01f5bf3c), scribe normalization lemma.

Run: python3 -I math_forward_377.py
Checks (all finite-dimensional / scalar algebra, no external data):
 1. P_cal = q r^4 U^{-1}  equals  lambda^{-1} * Psf,  Psf = beta_Z r^4 U^{-1}, lambda = beta_Z/q.
 2. V_{k,c} = pi(c theta^2 A^{-1}) is linear in c, so the scribe moment map is lambda^{-1} times the branch one.
 3. tr M(w) = 4(w1+4w2) O at w^0, w^-, w^+  -> 0, 0, 4 O (eq:ex-branch-three-traces), scribe line 410 arithmetic.
 4. Toy sequences: two ratios -> 1 give lambda -> 1, lambda^{-1} <= 2 eventually, and the three transfers.
 5. Counter-toy: if the two clocks had different slopes (b != kappa), lambda -> kappa/b != 1
    (shows the lemma needs the SAME hatted clock in both ratio hypotheses).
"""
import random
import sympy as sp

ok = True

# 1. identity of maps, with a random invertible matrix standing for U
q, bZ, r = sp.symbols('q beta_Z r', positive=True)
random.seed(377)
U = sp.Matrix(4, 4, lambda i, j: random.randint(-3, 3) + (5 if i == j else 0))
assert U.det() != 0
Pcal = q * r**4 * U.inv()
Psf = bZ * r**4 * U.inv()
lam = bZ / q
d1 = sp.simplify(Pcal - (1 / lam) * Psf)
print("1. P_cal - lambda^{-1} Psf == 0:", d1 == sp.zeros(4, 4))
ok &= d1 == sp.zeros(4, 4)

# 2. V_{k,c} linear in c
c, th = sp.symbols('c theta', positive=True)
A = sp.Matrix(3, 3, lambda i, j: random.randint(-2, 2) + (4 if i == j else 0))
pi = sp.Matrix(2, 3, lambda i, j: random.randint(-2, 2))
V = lambda cc: pi * (cc * th**2 * A.inv())
w_br = bZ * r**4
w_sc = q * r**4
d2 = sp.simplify(V(w_sc) - (1 / lam) * V(w_br))
print("2. V_{k,q r^4} - lambda^{-1} V_{k,omega} == 0:", d2 == sp.zeros(2, 3))
ok &= d2 == sp.zeros(2, 3)

# 3. traces of material tensors
def trM(w):
    return 4 * (w[0] + 4 * w[1])
w0 = (sp.Integer(-1), sp.Rational(1, 4), sp.Integer(-1))
wm = (0, 0, 1)
wp = (0, sp.Rational(1, 4), 0)
t = [trM(w0), trM(wm), trM(wp)]
print("3. tr M(w^0), tr M(w^-), tr M(w^+) in units of O:", t)
ok &= t == [0, 0, 4]
print("   scribe line 410: 4(0+4*1/4) =", 4 * (0 + 4 * sp.Rational(1, 4)))

# 4. toy sequences
import math
kappa, bbar = 1.7, 0.3
def bhat(k): return bbar + kappa * k
def betaZ(k): return bhat(k) * (1 + 1 / math.sqrt(k))
def zeta(k): return bhat(k) * (1 + 1 / math.log(k + 2))
ks = [10**e for e in range(1, 8)]
lams = [betaZ(k) / zeta(k) for k in ks]
print("4. lambda_k along k = 10..10^7:", [round(x, 6) for x in lams])
print("   lambda^{-1} <= 2 for all listed k:", all(1 / x <= 2 for x in lams))
# transfers: P(k) -> M entrywise; z_k tr Psf -> 0 with exponent one
M = 2.5
P = [M + 1 / k for k in ks]
Pc = [p / l for p, l in zip(P, lams)]
print("   field transfer |P_cal - M|:", [f"{abs(x - M):.2e}" for x in Pc])
wash = [bhat(k) * math.exp(-0.1 * k**0.5) for k in ks]
wash_c = [w / l for w, l in zip(wash, lams)]
print("   washout transfer z*tr P_cal:", [f"{x:.2e}" for x in wash_c])

# 5. counter-toy: different slope in the branch clock
b_other = 2.0
def bhat_other(k): return bbar + b_other * k
def betaZ_other(k): return bhat_other(k) * (1 + 1 / math.sqrt(k))
lam_other = [betaZ_other(k) / zeta(k) for k in ks]
print("5. with branch slope b=2.0, scribe kappa=1.7: lambda ->", round(lam_other[-1], 6),
      "(kappa ratio b/kappa =", round(b_other / kappa, 6), ")")

print("ALL ALGEBRAIC CHECKS PASS:", bool(ok))
