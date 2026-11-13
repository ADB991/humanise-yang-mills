"""Numerical check of the trace asymptotic for the generalized free field of M4.

rho(ds) = c s^2 (log s)^(-2) 1{s >= e^2} ds,  c = dim(g) / (16 pi^2).
Prints the Bessel moment int_0^inf u^6 K_1(u) du (= 384) and the ratio
r^8 log(1/r)^2 S(r) / (3 dim(g) / pi^4) for L = log(1/r) = 5, ..., 100.
Requires numpy and scipy (not a repository check script).
"""
import numpy as np
from scipy import integrate, special

moment, _ = integrate.quad(lambda u: u**6 * special.k1(u), 0, np.inf)
print("int_0^inf u^6 K1(u) du =", moment)

def ratio(L, dimg):
    A = 3 * dimg / np.pi**4
    c = dimg / (16 * np.pi**2)
    # r^8 log^2(1/r) S(r) = c/(8 pi^2) int_{e r}^inf u^6 K1(u) L^2/(L+log u)^2 du, u = e^t
    f = lambda t: np.exp(t)**7 * special.k1(np.exp(t)) * L**2 / (L + t)**2
    v, _ = integrate.quad(f, 1.0 - L, np.log(60.0), limit=500)
    return c / (8 * np.pi**2) * v / A

for dimg in (3, 8):
    print("dim g =", dimg, [round(ratio(L, dimg), 6) for L in (5, 10, 20, 50, 100)])
