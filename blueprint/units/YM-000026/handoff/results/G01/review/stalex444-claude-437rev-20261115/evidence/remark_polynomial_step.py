"""Exact check of the polynomial step in rem:headline-nonconstant-sections
(construction-headline.tex l.52-56 at 9c631687). Plain Python, fractions only.

Model: jet coordinates x (order j=0, weight 2) and y (order j=1, weight 3);
a label is a polynomial in (x, y); h.J scales x by h^2 and y by h^3
(scaleJet, YM/Source/Local.lean:82; generation = j+2, YM/Labels/Polynomial.lean:51).
A monomial x^a y^b has weight 2a+3b (height) and a+b curvature factors
(bidegree second slot, used by Frame.scaled, YM/Labels/Reference.lean:58).
"""
from fractions import Fraction as Fr
from itertools import product

def weight(m): return 2*m[0] + 3*m[1]
def factors(m): return m[0] + m[1]

def h_poly(v, J):
    """coefficients in h of h -> v(h.J), as dict power -> Fraction"""
    x, y = J
    out = {}
    for m, c in v.items():
        out[weight(m)] = out.get(weight(m), 0) + c * x**m[0] * y**m[1]
    return {k: c for k, c in out.items() if c != 0}

def taylor_through(v, J, d):
    """k-th derivative at h=0 divided by k!, k <= d (exact, from the polynomial)"""
    p = h_poly(v, J)
    return [p.get(k, Fr(0)) for k in range(d+1)]

grid = [(Fr(a), Fr(b)) for a, b in product(range(-3, 4), repeat=2)]

# 1. A label of weighted degree <= d: Taylor data through d determine v(h.J) for all h.
d = 6
v = {(0, 0): Fr(5), (1, 0): Fr(2), (0, 1): Fr(-1), (2, 0): Fr(3), (1, 1): Fr(7), (3, 0): Fr(1)}  # weights 0,2,3,4,5,6
assert all(weight(m) <= d for m in v)
for J in grid:
    T = taylor_through(v, J, d)
    for h in [Fr(1), Fr(-2), Fr(1, 3)]:
        direct = sum(c * (h**2*J[0])**m[0] * (h**3*J[1])**m[1] for m, c in v.items())
        assert direct == sum(T[k] * h**k for k in range(d+1))
print("1 ok: weighted degree <= d => h -> v(h.J) is its own Taylor polynomial of order d")

# 2. Constant section with value c forces Taylor data (c,0,...,0), hence v(J) = c on the grid.
#    Conversely, any v with a nonzero non-constant part violates it at some grid jet.
def violates_constant(v, d):
    for J in grid:
        T = taylor_through(v, J, d)
        if any(T[k] != 0 for k in range(1, d+1)):
            return True
    return False
assert violates_constant(v, d)
assert not violates_constant({(0, 0): Fr(4)}, d)
print("2 ok: only constant labels have Taylor data (c,0,...,0) at every jet")

# 3. The bound weighted degree <= d is used: a weight-5 monomial is invisible through order 4.
w5 = {(1, 1): Fr(1)}
assert not violates_constant(w5, 4) and violates_constant(w5, 5)
print("3 ok: x*y (weight 5) has zero Taylor data through order 4; the degree bound is needed")

# 4. d = 0 and d = 1: every monomial of weight <= 1 is the constant one (weights start at 2).
for dd in (0, 1):
    mons = [m for m in product(range(4), repeat=2) if weight(m) <= dd]
    assert mons == [(0, 0)]
print("4 ok: V_0 and V_1 contain only constants; the remark is vacuous but true there")

# 5. Two gradings differ but D_t is invertible for t > 0: weight vs factor count.
assert (weight((2, 0)), factors((2, 0))) == (4, 2) and (weight((0, 1)), factors((0, 1))) == (3, 1)
t = Fr(2, 5)
D  = {m: c * t**factors(m) for m, c in v.items()}
Di = {m: c / t**factors(m) for m, c in D.items()}
assert Di == v and violates_constant(D, d)
print("5 ok: D_t (factor count) is diagonal with nonzero entries; D_t of a nonconstant label is nonconstant")
