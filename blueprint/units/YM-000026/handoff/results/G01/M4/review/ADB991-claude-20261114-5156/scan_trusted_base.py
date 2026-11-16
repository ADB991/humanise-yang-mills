# Comment/string-stripping keyword scan used by review ADB991-claude-20261114-5156.
# Usage (from results/G01/formal/): python3 scan_trusted_base.py $(find FreeField -name "*.lean") Adequacy.lean GroupIndependence.lean
import re,sys,pathlib
def strip(src):
    out=[];i=0;n=len(src);depth=0
    while i<n:
        if src.startswith('/-',i): depth+=1;i+=2;continue
        if depth and src.startswith('-/',i): depth-=1;i+=2;continue
        if depth:
            if src[i]=='\n': out.append('\n')
            i+=1;continue
        if src.startswith('--',i):
            j=src.find('\n',i); i=n if j<0 else j; continue
        if src[i]=='"':
            j=i+1
            while j<n and src[j]!='"':
                j+= 2 if src[j]=='\\' else 1
            out.append('""'); i=j+1; continue
        out.append(src[i]); i+=1
    return ''.join(out)
pat=re.compile(r'\b(sorry|admit|axiom|unsafe|extern|implemented_by|native_decide|opaque|partial|ofReduceBool|reduceBool|skipKernelTC|elab|macro|macro_rules|syntax|notation|infix|infixl|infixr|prefix|postfix|run_cmd|run_tac|run_elab|initialize|builtin_initialize|addDecl|csimp|export|private|set_option|instance|local|scoped|open|attribute|decreasing_by|termination_by|noncomputable|irreducible_def|Classical|cast|unsafeCast|lcProof|Quot\.sound|mutual)\b')
from collections import Counter
for f in sys.argv[1:]:
    s=strip(open(f).read())
    for ln,l in enumerate(s.split('\n'),1):
        for m in pat.finditer(l):
            print(f"{f}:{ln}:{m.group(1)}:{l.strip()[:140]}")
