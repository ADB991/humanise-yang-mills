# Review ADB991-claude-20261114-5156: stable check of r^8 log^2(1/r) Sr(r) -> 384*pi (scaled variable u = s r^2).
from mpmath import mp, quad, besselk, sqrt, log, e, pi, inf, exp, mpf
mp.dps = 30
# r^8 log^2(1/r) Sr(r) = 2π ∫_0^∞ u^{5/2} K1(√u) [L / log(e + u e^{2L})]^2 du,  L = log(1/r)
def F(L):
    L = mpf(L)
    return 2*pi*quad(lambda u: u**2.5*besselk(1, sqrt(u))*(L/log(e+u*exp(2*L)))**2, [0, 1e-6, 1, 10, 100, inf])
for L in [5, 20, 100, 1000, 10**4, 10**6]:
    v = F(L); print(f"L={L}: {mp.nstr(v,12)}  ratio to 384π: {mp.nstr(v/(384*pi),10)}")
