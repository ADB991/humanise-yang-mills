from pathlib import Path
import re,json,csv,collections,subprocess
root=Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],text=True).strip())
out=Path(__file__).resolve().parent
data=json.loads((out/'chapter-inventory.json').read_text())['chapters']
# Lexical candidates, not parsed TeX or a semantic inventory. Strip comments.
pattern=re.compile(r'\\(?:mathcal|mathscr|mathfrak|mathbf|boldsymbol)\s*\{[A-Za-z]+\}|\\(?:alpha|beta|gamma|delta|epsilon|varepsilon|zeta|eta|theta|vartheta|kappa|lambda|mu|nu|xi|pi|rho|varrho|sigma|tau|phi|varphi|chi|psi|omega|Gamma|Delta|Theta|Lambda|Xi|Pi|Sigma|Phi|Psi|Omega)\b|(?<![A-Za-z\\])[A-Za-z](?:_\{[^{}\n]{1,30}\}|_[A-Za-z0-9])?')
math=re.compile(r'(?<!\\)\$\$(.*?)(?<!\\)\$\$|(?<!\\)\$(.*?)(?<!\\)\$|\\\((.*?)\\\)|\\\[(.*?)\\\]|\\begin\{(?:equation\*?|align\*?|gather\*?|multline\*?)\}(.*?)\\end\{(?:equation\*?|align\*?|gather\*?|multline\*?)\}',re.S)
rows=[]
for c in data:
 text=(root/c['path']).read_text();text=re.sub(r'(?<!\\)%[^\n]*','',text)
 first={}
 for block in math.finditer(text):
  body=next((x for x in block.groups() if x is not None),'')
  start=block.start()+block.group().find(body)
  for m in pattern.finditer(body):
   token=m.group(); pos=start+m.start()
   if token not in first:
    line=text.count('\n',0,pos)+1
    section=next((h['title'] for h in reversed(c['headings']) if h['line']<=line),'')
    first[token]=(line,section,re.sub(r'\s+',' ',body[max(0,m.start()-45):m.end()+65]).strip())
 for token,(line,section,excerpt) in first.items():rows.append((c['order'],c['path'],line,section,token,excerpt))
with (out/'lexical-first-occurrences.tsv').open('w',newline='') as f:
 w=csv.writer(f,delimiter='\t',lineterminator='\n');w.writerow(['chapter_order','path','approx_line','preceding_heading','token','math_context']);w.writerows(rows)
print('candidate rows',len(rows))
# References are navigation only. Distinguish from premise DAG.
labels={}
for c in data:
 for l in c['labels']:labels.setdefault(l['label'],[]).append((c['path'],l['line'],c['order']))
refs=[]
for c in data:
 text=(root/c['path']).read_text();text=re.sub(r'(?<!\\)%[^\n]*','',text)
 for m in re.finditer(r'\\(?:eqref|ref)\{([^}]+)\}',text):
  targets=labels.get(m.group(1),[])
  refs.append({'source':c['path'],'line':text.count('\n',0,m.start())+1,'label':m.group(1),'targets':targets})
(out/'reference-scan.json').write_text(json.dumps({'scope':'included 241 chapter files; ref and eqref only; text scan does not parse TeX expansion, assess dependencies or first-use definitions','reference_count':len(refs),'unresolved':[r for r in refs if not r['targets']],'duplicate_label_keys':{k:v for k,v in labels.items() if len(v)>1},'references':refs},indent=2)+'\n')
print('refs',len(refs),'unresolved',sum(not x['targets'] for x in refs),'duplicate labels',sum(len(x)>1 for x in labels.values()))
