"""Response audit of #399 (817546b7): symbol census and trace check. Reads git objects only."""
import re, subprocess, os
from fractions import Fraction as F
R = os.path.expanduser('~/ym-release/full/checks/pr377')
def show(c, p): return subprocess.run(['git','-C',R,'show',f'{c}:{p}'],capture_output=True,text=True,check=True).stdout
s = show('817546b7','manuscript/existence/trace-scribe-producer.tex').splitlines()
b = show('817546b7','manuscript/existence/trace-branch-moments.tex').splitlines()
for name, pat in [('vartheta (scribe)', r'\\vartheta'), ('lambda_i (scribe)', r'\\lambda_i'), ('theta/Theta (scribe)', r'\\theta|\\Theta')]:
    print(name, [n+1 for n,l in enumerate(s) if re.search(pat,l)])
print('vartheta (branch)', [n+1 for n,l in enumerate(b) if '\\vartheta' in l])
print('effective (scribe, line by line)', [n+1 for n,l in enumerate(s) if re.search(r'effective', l)])
# tr M(w) = 4(w1+4w2) O with w=(w1,w2,w3) (branch l.85, l.107)
for k,w in {'w0':(F(-1),F(1,4),F(-1)),'w-':(F(0),F(0),F(1)),'w+':(F(0),F(1,4),F(0))}.items():
    print(k, 'tr/O =', 4*(w[0]+4*w[1]))
