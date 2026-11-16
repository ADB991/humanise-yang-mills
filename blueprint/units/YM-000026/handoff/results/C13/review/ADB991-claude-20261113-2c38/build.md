# Build and rendering check (session ADB991-claude-20261113-2c38)

- Source: `git archive 36a84131f93540baf83ab7253c71f2fb5a761b3f` (merge of PR #310) exported to a scratch directory.
- Command: from the exported `manuscript/` directory, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch>/build existence.tex`.
- Result: exit 0. The PDF has 1011 pages, and `existence.log` contains no "undefined" warning.
- Pages inspected at 80 dpi:
  - p. 706: the interface paragraph after (840) = `eq:planted-holes`, the transport paragraph and the regrouping sentence;
  - p. 715: Proposition 170.2 = `prop:corrected-forced-output`, its statement and its proof through the new closing sentence.

  Both render correctly: italics on "forced activities of Q", and the `k_{X,I}` display intact. The references to Propositions 170.1 and 170.2 and Section 93 resolve.
- TeX: Ubuntu `texlive-latex-extra` and `texlive-science`, installed with apt in this container.
