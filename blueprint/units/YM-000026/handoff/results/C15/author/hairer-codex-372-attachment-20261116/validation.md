# Validation

- Full manuscript build: success, 1191 pages, 6235771 bytes. Command from `manuscript`: `TEXMF=/usr/share/texlive/texmf-dist TEXINPUTS='/tmp/g3-tex:./:' TEXFORMATS='/tmp/g3-tex:' MFBASES='/tmp/g3-tex:' TEXFONTMAPS='/tmp/g3-tex:' latexmk -g -pdf -interaction=nonstopmode -halt-on-error -outdir=build-g3 existence.tex`.
- The fresh runtime lacked generated TeX formats and font maps. Initial build attempts failed for missing pdflatex.fmt, mf.base and font maps. Generated isolated formats in /tmp/g3-tex from the installed distribution, using language.us and the installed AMS font maps; no repository source or preamble changes were needed.
- Final log: no undefined or multiply defined references. Existing whole-manuscript layout warnings remain; no overfull warning in the new receipt proof.
- New proof pages 1140–1143 rendered with pdftoppm and visually inspected: readable, no overlap or clipping.
- `git diff --check`: pass. `python3 scripts/check_blueprint.py`: structure OK, four units; neither Lean nor mathematics checked by this command.
- Cross-reference scan of all five modified files: every cited label exists.
- No Lean elaboration. Imported Lean and historical reviews untouched. Generated PDF, formats, fonts and logs are excluded from publication.
