"""Independent check of the M4 trace constant (review schmittj-claude-20261113).

Conventions. Time is the last coordinate. Delta_m(r) = m K_1(m r) / (4 pi^2 r) is the kernel of
(-Laplace + m^2)^(-1) on R^4. S(r) = int rho(ds) Delta_{sqrt s}(r), rho(ds) = c s^2 (log s)^(-2) 1{s >= e^2} ds.
Target: r^8 log(1/r)^2 S(r) -> A = 3 n / pi^4.

Checks:
 1. int_0^inf u^6 K_1(u) du = 384 (mpmath, 30 digits).
 2. int_{R^3} exp(-r E) / (2 E) d^3p = (2 pi)^3 Delta_m(r), E = sqrt(m^2 + |p|^2): the unnormalised mass-shell
    measure delta(p_t^2 - |p|^2 - s) 1{p_t > 0} d^4p gives (2 pi)^3 times the standard kernel.
 3. S(r) by direct quadrature in the variable s (not the substituted form used by the author), ratio to A,
    compared with the three-term expansion 1 - 2 m1 / L + 3 m2 / L^2, L = log(1/r), where m1, m2 are the first two
    moments of log u under the density u^6 K_1(u) / 384.
 4. The constant: c = n / (16 pi^2) for the standard kernel; c / (2 pi)^3 = n / (128 pi^5) for the unnormalised measure.
Run: python3 -I trace_check.py   (needs mpmath)
"""
from mpmath import mp, mpf, quad, besselk, gamma, pi, log, exp, sqrt, inf, digamma, polygamma

mp.dps = 30

# 1
moment = quad(lambda u: u**6 * besselk(1, u), [0, 1, 10, 50, inf])
print("1. int u^6 K1 =", moment, " closed form 2^5 Gamma(4) Gamma(3) =", 2**5 * gamma(4) * gamma(3))

# 2
def delta(m, r):
    return m * besselk(1, m * r) / (4 * pi**2 * r)

for m, r in ((mpf(1), mpf("0.7")), (mpf(3), mpf("0.2"))):
    lhs = quad(lambda p: 4 * pi * p**2 * exp(-r * sqrt(m**2 + p**2)) / (2 * sqrt(m**2 + p**2)), [0, 1, 10, 100, inf])
    print("2. m=%s r=%s  mass-shell integral / Delta_m(r) =" % (m, r), lhs / delta(m, r), " (2 pi)^3 =", (2 * pi)**3)

# 3
m1 = log(2) + (digamma(4) + digamma(3)) / 2
m2 = m1**2 + (polygamma(1, 4) + polygamma(1, 3)) / 4
print("3. m1 = <log u> =", m1, " m2 = <log^2 u> =", m2)

def S(r, c):
    # s = exp(t); integrand c s^2 (log s)^-2 Delta_{sqrt s}(r) ds
    f = lambda t: c * exp(3 * t) / t**2 * delta(exp(t / 2), r)
    tmax = 2 * log(200 / r)
    pts = [mpf(2)] + [2 + (tmax - 2) * k / 40 for k in range(1, 41)]
    return quad(f, pts)

n = 3
A = 3 * n / pi**4
c = mpf(n) / (16 * pi**2)
for L in (5, 10, 20, 50, 100):
    r = exp(-mpf(L))
    ratio = r**8 * L**2 * S(r, c) / A
    print("   L=%3d  ratio = %.6f   three-term expansion = %.6f" % (L, ratio, 1 - 2 * m1 / L + 3 * m2 / L**2))

# 4
print("4. 48 c / pi^2 / A =", 48 * c / pi**2 / A, "  c =", c, " c/(2 pi)^3 =", c / (2 * pi)**3, " n/(128 pi^5) =", mpf(n) / (128 * pi**5))
