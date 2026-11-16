#!/usr/bin/env python3
"""Numeric checks of the conventions of the free-field witness (not part of the Lean build).

Run: python3 check_conventions.py     (needs numpy, scipy, sympy)

Checks, with the definitions of FreeField/TwoPoint.lean, Wick.lean, Fock.lean, Symmetry.lean:
 1. Sr_euclid:  int exp(-tau E + i u.p) weight dp  =  Sr(sqrt(tau^2+|u|^2)).
 2. lineC_euclid for one time derivative: lineC(e_t,0,i tau,u) = lineS(e_t,0,(u,tau)) = -d/dtau S,
    lineC(0,e_t) = +d/dtau S, lineC(e_t,e_t) = -d^2/dtau^2 S.
 3. inner_Psi / cut_identity in the simplest cases:
    (a) one letter xi_{e_t}:  ||Psi||^2 = int |Bmono|^2 |fhat|^2 dmu  equals
        wightW([(adjL xi, conj f), (xi, f)]) = -int Amono*Bmono |fhat|^2 dmu   (sign of adjL);
    (b) normalisation 1/k!: with all line factors 1, for words of monomials,
        #closed matchings(u^dagger ++ v) = sum_k (1/k!) #open(u,k) #open(v,k).
 4. Psi_covariant, leg factors: sum_b' c_{b' b} Bmono(b',p) = Bmono(b, Lambda^T p) and the same for
    Amono, where c are the coefficients of the substitution X_j -> sum_i rho_ij X_i,
    rho = D^-1 Lambda D, D = diag(1,1,1,i); first and second order, random Lorentz Lambda.
"""
import itertools, math, sys
import numpy as np
from scipy import integrate
import sympy as sp

ok = True
def report(name, a, b, tol):
    global ok
    good = abs(a - b) <= tol * max(1.0, abs(a), abs(b))
    ok &= good
    print(f"{'PASS' if good else 'FAIL'}  {name}: {a:.10g} vs {b:.10g}")

def w(s):                      # weight as a function of s = E^2 - k^2 >= 0
    return s * s / math.log(math.e + s) ** 2

def radial(tau, u, epow=0):
    """int E^epow exp(-tau E + i u p_1) weight dp, by the angular integral 4 pi sin(uk)/(uk)."""
    def inner(E):
        f = lambda k: 4 * math.pi * k * k * (np.sinc(u * k / math.pi)) * w(E * E - k * k)
        v, _ = integrate.quad(f, 0, E, limit=200)
        return E ** epow * math.exp(-tau * E) * v
    v, _ = integrate.quad(inner, 0, 80 / tau, limit=400, epsabs=1e-10, epsrel=1e-10)
    return v

def Sr(r, epow=0):
    return radial(r, 0.0, epow)

tau, u = 1.3, 0.7
rho = math.hypot(tau, u)
# 1. Euclidean invariance
report("1  Sr_euclid", radial(tau, u), Sr(rho), 1e-7)
# 2. time derivatives; S(u,tau) = Sr(sqrt(tau^2+u^2))
h = 1e-3
S = lambda t: Sr(math.hypot(t, u))
dS = (S(tau + h) - S(tau - h)) / (2 * h)
d2S = (S(tau + h) - 2 * S(tau) + S(tau - h)) / h ** 2
# Amono(e_t) = E, Bmono(e_t) = -E ; lineS(a,b) = (-1)^{|a|} d^{a+b} S
report("2a lineC(e_t,0) = lineS(e_t,0) = -dS/dtau", radial(tau, u, 1), -dS, 1e-5)
report("2b lineC(0,e_t) = lineS(0,e_t) = +dS/dtau", -radial(tau, u, 1), dS, 1e-5)
report("2c lineC(e_t,e_t) = lineS(e_t,e_t) = -d2S/dtau2", -radial(tau, u, 2), -d2S, 1e-4)

# 3a. one letter xi_{e_t}, Gaussian test f(x) = exp(-|x|^2/2): fhat(p) = (2 pi)^2 exp(-|p|^2/2)
def gauss_moment(epow):
    def inner(E):
        f = lambda k: 4 * math.pi * k * k * w(E * E - k * k) * math.exp(-(E * E + k * k))
        v, _ = integrate.quad(f, 0, E)
        return E ** epow * v
    v, _ = integrate.quad(inner, 0, 12)
    return (2 * math.pi) ** 4 * v
norm_sq = gauss_moment(2)                      # int |Bmono(e_t)|^2 |fhat|^2 dmu, Bmono = -E
adj_sign = (-1) ** 1                           # adjL {e_t} = (-1)^{tdeg} {e_t}
wight = adj_sign * (-gauss_moment(2))          # Amono(e_t) * Bmono(e_t) = E * (-E)
report("3a ||Psi[xi_t(f)]||^2 = wightW(dagger ++ word) > 0", norm_sq, wight, 1e-12)
ok &= norm_sq > 0

# 3b. counting: closed matchings versus open matchings
def closed(sizes):
    legs = [(v, i) for v, s in enumerate(sizes) for i in range(s)]
    def rec(rem):
        if not rem:
            return 1
        a, rest = rem[0], rem[1:]
        return sum(rec(rest[:j] + rest[j + 1:]) for j, b in enumerate(rest) if b[0] != a[0])
    return rec(legs)
def opened(sizes, k):          # external slots form one extra vertex with k distinguishable legs
    return closed([k] + list(sizes))
for usz, vsz in [((1,), (1,)), ((2,), (2,)), ((2, 1), (1, 2)), ((3,), (1, 2)), ((2, 2), (3, 1)),
                 ((1, 1, 2), (2, 2)), ((3, 2), (2, 2, 1))]:
    lhs = closed(list(reversed(usz)) + list(vsz))
    rhs = sum(opened(usz, k) * opened(vsz, k) / math.factorial(k) for k in range(0, 12))
    report(f"3b cut counting u={usz} v={vsz}", lhs, rhs, 1e-12)

# 4. leg factors under Lorentz transformations
rng = np.random.default_rng(1)
def boost(axis, chi):
    L = np.eye(4); L[axis, axis] = L[3, 3] = math.cosh(chi); L[axis, 3] = L[3, axis] = math.sinh(chi)
    return L
def rot(a, b, th):
    L = np.eye(4); L[a, a] = L[b, b] = math.cos(th); L[a, b] = -math.sin(th); L[b, a] = math.sin(th)
    return L
Lam = boost(0, 0.7) @ rot(0, 1, 0.4) @ boost(2, -0.3) @ rot(1, 2, 1.1)
D = np.diag([1, 1, 1, 1j])
rhoM = np.linalg.inv(D) @ Lam @ D             # rho_ij = D_i^-1 Lam_ij D_j ; Lam_ij = (Lam e_j)_i
X = sp.symbols('X0:4'); P = sp.symbols('p0:4')
bvec = [sp.I, sp.I, sp.I, -1]                  # Bmono(e_j, p) = b_j p_j
avec = [-sp.I, -sp.I, -sp.I, 1]                # Amono(e_j, p) = a_j p_j
def mono(vec, alpha, p):
    return sp.prod([(vec[j] * p[j]) ** alpha[j] for j in range(4)])
pnum = rng.normal(size=4)
LTp = Lam.T @ pnum
subsX = {X[j]: sum(sp.nsimplify(0) + complex(rhoM[i, j]) * X[i] for i in range(4)) for j in range(4)}
for alpha in [(1, 0, 0, 0), (0, 0, 0, 1), (1, 0, 0, 1), (0, 0, 0, 2), (0, 2, 0, 0), (1, 1, 0, 1)]:
    poly = sp.Poly(sp.expand(sp.prod([X[j] ** alpha[j] for j in range(4)]).subs(subsX, simultaneous=True)), *X)
    for name, vec in (("Bmono", bvec), ("Amono", avec)):
        lhs = sum(complex(c) * complex(mono(vec, beta, list(pnum))) for beta, c in poly.terms())
        rhs = complex(mono(vec, alpha, list(LTp)))
        good = abs(lhs - rhs) < 1e-9 * max(1, abs(rhs)); ok &= good
        print(f"{'PASS' if good else 'FAIL'}  4  {name} alpha={alpha}: {lhs:.8g} vs {rhs:.8g}")

print("ALL PASS" if ok else "SOME FAILED")
sys.exit(0 if ok else 1)
