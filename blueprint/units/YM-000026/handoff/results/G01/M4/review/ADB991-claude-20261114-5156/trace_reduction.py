# Independent check of the free-field trace normalisation (ADB991-claude-20261114-5156).
# Sr(r) = ∫_{R^4} e^{-r p_t} w(p) d^4p, w = s^2/log^2(e+s) on the forward cone, s = p_t^2-|p|^2.
# Reduction: d^4p|_{cone} = ds d^3p/(2E), ∫ d^3p e^{-rE}/(2E) = 2π √s K1(√s r)/r.
from mpmath import mp, quad, besselk, sqrt, log, e, pi, inf, exp, gamma
mp.dps = 30
I = quad(lambda u: u**2.5*besselk(1, sqrt(u)), [0, 1, 10, 100, inf])
print("int u^(5/2) K1(sqrt u) du =", I, " (Mellin: 2*2^5*Gamma(3)*Gamma(4) =", 2*2**5*gamma(3)*gamma(4), ")")
# check the 3d reduction at one mass/radius by direct quadrature
m, r = mp.mpf('1.3'), mp.mpf('0.7')
lhs = quad(lambda k: 4*pi*k**2*exp(-r*sqrt(m**2+k**2))/(2*sqrt(m**2+k**2)), [0, inf])
print("3d reduction:", lhs, 2*pi*m*besselk(1, m*r)/r)
def Sr(r):
    return quad(lambda s: s**2/log(e+s)**2 * 2*pi*sqrt(s)*besselk(1, sqrt(s)*r)/r,
                [0, 1, 1/r**2, 10/r**2, 100/r**2, inf])
print("limit target 384*pi =", 384*pi)
for k in [2, 4, 8, 16, 32, 64]:
    r = mp.mpf(10)**(-k)
    print(f"r=1e-{k}: r^8 log^2(1/r) Sr(r) =", mp.nstr(r**8*log(1/r)**2*Sr(r), 12))
