# Build Log

> Catat seluruh rendering dan kompilasi.

Template:

```md
## YYYY-MM-DD HH:MM — <artifact>

- Command:
- Tool/version:
- Result: success | failed | warning
- Output:
- Warnings:
- Errors:
- Notes:
```

## 2026-11-02 10:28:29 WIB — make build

- Command: `make build`
- Lecture: `lecture/mbse-material.pdf`
- Exit code: 2
- Result: failed; build-unverified

```text
Missing/empty source: lecture/mbse-material.pdf
Missing/empty source: model/requirements/requirements.mmd
Missing/empty source: model/behavior/use-case.puml
Missing/empty source: model/behavior/activity.puml
Missing/empty source: model/behavior/sequence.puml
Missing/empty source: model/behavior/state-machine.puml
Missing/empty source: model/structure/bdd.puml
Missing/empty source: model/structure/ibd.puml
Missing/empty source: report/main.tex
Missing/empty source: report/bibliography.bib
Missing/empty source: presentation/main.tex
Prerequisites not met; no rendering or compilation performed.
make[1]: *** [_build] Error 1

```

## 2026-11-02 10:29:37 WIB — make build

- Command: `make build`
- Lecture: `lecture/mbse-material.pdf`
- Exit code: 2
- Result: failed; build-unverified

```text
Missing/empty source: lecture/mbse-material.pdf
Missing/empty source: model/requirements/requirements.mmd
Missing/empty source: model/behavior/use-case.puml
Missing/empty source: model/behavior/activity.puml
Missing/empty source: model/behavior/sequence.puml
Missing/empty source: model/behavior/state-machine.puml
Missing/empty source: model/structure/bdd.puml
Missing/empty source: model/structure/ibd.puml
Missing/empty source: report/main.tex
Missing/empty source: report/bibliography.bib
Missing/empty source: presentation/main.tex
Prerequisites not met; no rendering or compilation performed.
make[1]: *** [_build] Error 1

```

## 2026-11-02 10:29:42 WIB — isolated toolchain smoke checks

- Scope: temporary generic fixtures only; no traffic model or lecture file created. Temporary artifacts removed after checks. This does not verify the project build.
- Commands: `mmdc -i <temporary smoke.mmd> -o <temporary smoke-mermaid.pdf>`; `plantuml -failfast2 -tsvg -pipe`; `rsvg-convert -f pdf -o <temporary smoke-plantuml.pdf> <temporary smoke.svg>`.
- Versions: Mermaid CLI 12.0.0; PlantUML 1.2026.9; librsvg 2.60.0; Java 21.0.1.
- Mermaid PDF smoke: PASS; exit code 0.

```text
Generating single mermaid chart
```
- PlantUML SVG smoke: PASS; exit code 0.
- PlantUML invalid input rejected: PASS; exit code 200.

```text
ERROR
1
Syntax Error? (Assumed diagram type: sequence)
```

## 2026-11-02 10:32:17 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 2
- Result: failed; build-unverified

```text
Missing/empty source: model/requirements/requirements.mmd
Missing/empty source: model/behavior/use-case.puml
Missing/empty source: model/behavior/activity.puml
Missing/empty source: model/behavior/sequence.puml
Missing/empty source: model/behavior/state-machine.puml
Missing/empty source: model/structure/bdd.puml
Missing/empty source: model/structure/ibd.puml
Missing/empty source: report/main.tex
Missing/empty source: report/bibliography.bib
Missing/empty source: presentation/main.tex
Prerequisites not met; no rendering or compilation performed.
make[1]: *** [_build] Error 1

```

## 2026-11-03 09:09:53 WIB — rendering diagram, Tahap 3–8

- Tools: Mermaid CLI 12.0.0; PlantUML 1.2026.9; rsvg-convert 2.60.0.
- Mermaid: attempted --pdfFit (unsupported, exit1); corrected to default command `mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf`.
- PlantUML command per source: `plantuml -failfast2 -tsvg -pipe < <source> > assets/diagrams/<name>.svg`; conversion `rsvg-convert -f pdf -o <pdf> <svg>`.
- model/behavior/activity.puml: exit 200; ERROR
24
Syntax Error? (Assumed diagram type: activity).
- model/behavior/sequence.puml: exit 200; ERROR
4
Syntax Error? (Assumed diagram type: sequence).
- model/behavior/state-machine.puml: exit 200; ERROR
6
Syntax Error? (Assumed diagram type: state).
- model/behavior/use-case.puml: exit 200; ERROR
7
Syntax Error? (Assumed diagram type: component).
- model/structure/bdd.puml: exit 200; ERROR
5
Syntax Error? (Assumed diagram type: sequence).
- model/structure/ibd.puml: exit 200; ERROR
7
Syntax Error? (Assumed diagram type: component).

## 2026-11-03 09:25:01 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 2
- Result: failed; build-unverified

```text
Missing/empty source: presentation/main.tex
Prerequisites not met; no rendering or compilation performed.
make[1]: *** [_build] Error 1

```

## 2026-11-03 09:25:34 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
No existing .aux file, so I'll make a simple one, and require run of *latex.
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Category 'other':
  Rerun of 'pdflatex' forced or previously required:
    Reason or flag: 'Initial setup'

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
No file main.toc.
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]
(./sections/01-introduction.tex

Package natbib Warning: Citation `lecture02' on page 2 undefined on input line 
3.


Package natbib Warning: Citation `mondal2022' on page 2 undefined on input line
 3.


Package natbib Warning: Citation `mathiane2023' on page 2 undefined on input li
ne 3.


Package natbib Warning: Citation `lecture01' on page 2 undefined on input line 
5.

) (./sections/02-theory-literature.tex

Package natbib Warning: Citation `lecture01' on page 2 undefined on input line 
3.


Package natbib Warning: Citation `omg2019' on page 2 undefined on input line 3.



Package natbib Warning: Citation `omg2019' on page 2 undefined on input line 5.



Package natbib Warning: Citation `mondal2022' on page 2 undefined on input line
 8.

[2]

Package natbib Warning: Citation `mathiane2023' on page 3 undefined on input li
ne 13.


Package natbib Warning: Citation `campo2023' on page 3 undefined on input line 
18.


LaTeX Warning: Reference `tab:evidence' on page 3 undefined on input line 23.


Underfull \hbox (badness 10000) in paragraph at lines 31--32
[]|\T1/lmr/m/n/10.95 (+20) Disposition per-be-da-an pse-u-do-co-
[3]

Package natbib Warning: Citation `lecture01' on page 4 undefined on input line 
45.


Package natbib Warning: Citation `lecture02' on page 4 undefined on input line 
45.

) (./sections/03-problem.tex [4]) (./sections/04-requirements.tex [5{/usr/local
/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2
026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist
/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7] [8]) (./sections/05-models.tex

LaTeX Warning: Reference `fig:requirements' on page 9 undefined on input line 2
.


LaTeX Warning: Reference `fig:ibd' on page 9 undefined on input line 2.

[9] [10 <../assets/diagrams/requirements.pdf>] [11 <../assets/diagrams/use-case
.pdf>] [12 <../assets/diagrams/activity.pdf>] [13 <../assets/diagrams/sequence.
pdf>] [14 <../assets/diagrams/state-machine.pdf>] [15 <../assets/diagrams/bdd.p
df>] [16 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex

Package longtable Warning: Column widths have changed
(longtable)                in table 3 on input line 30.

(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)

LaTeX Warning: Reference `tab:results' on page 17 undefined on input line 35.

[17]) (./sections/07-discussion-conclusion.tex [18]) [19]
No file main.bbl.

Package natbib Warning: There were undefined citations.


Package longtable Warning: Table widths have changed. Rerun LaTeX.

(./main.aux)

LaTeX Warning: There were undefined references.


LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.


Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.

 )
(see the transcript file for additional information)</usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/local/texlive/2026/texmf-dist/f
onts/type1/public/lm/lmbx12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1
/public/lm/lmmi10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm
/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr12.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr17.pfb></usr/local
/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr8.pfb></usr/local/texlive/202
6/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/texlive/2026/texmf-di
st/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (19 pages, 501520 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Missing input file 'main.toc' message in .log file:
  No file main.toc.
Latexmk: Missing bbl file 'main.bbl' in following:
 No file main.bbl.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Create bibtex main
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Category 'other':
  Rerun of 'bibtex main' forced or previously required:
    Reason or flag: 'Initial set up of rule'

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Warning--empty year in lecture01
Warning--empty year in lecture02
(There were 2 warnings)
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.bbl
  main.out
  main.toc

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex

Package natbib Warning: Citation `lecture02' on page 3 undefined on input line 
3.


Package natbib Warning: Citation `mondal2022' on page 3 undefined on input line
 3.


Package natbib Warning: Citation `mathiane2023' on page 3 undefined on input li
ne 3.


Package natbib Warning: Citation `lecture01' on page 3 undefined on input line 
5.

) (./sections/02-theory-literature.tex

Package natbib Warning: Citation `lecture01' on page 3 undefined on input line 
3.


Package natbib Warning: Citation `omg2019' on page 3 undefined on input line 3.



Package natbib Warning: Citation `omg2019' on page 3 undefined on input line 5.



Package natbib Warning: Citation `mondal2022' on page 3 undefined on input line
 8.

[3]

Package natbib Warning: Citation `mathiane2023' on page 4 undefined on input li
ne 13.


Package natbib Warning: Citation `campo2023' on page 4 undefined on input line 
18.


Underfull \hbox (badness 10000) in paragraph at lines 31--32
[]|\T1/lmr/m/n/10.95 (+20) Disposition per-be-da-an pse-u-do-co-
[4]

Package natbib Warning: Citation `lecture01' on page 5 undefined on input line 
45.


Package natbib Warning: Citation `lecture02' on page 5 undefined on input line 
45.

) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/local
/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2
026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist
/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl)

Package natbib Warning: There were undefined citations.

[21] (./main.aux

Package natbib Warning: Citation(s) may have changed.
(natbib)                Rerun to get citations correct.

)

LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )
(see the transcript file for additional information)</usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/local/texlive/2026/texmf-dist/f
onts/type1/public/lm/lmbx12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1
/public/lm/lmmi10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm
/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr12.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr17.pfb></usr/local
/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr8.pfb></usr/local/texlive/202
6/texmf-dist/fonts/type1/public/lm/lmri10.pfb></usr/local/texlive/2026/texmf-di
st/fonts/type1/public/lm/lmsy10.pfb></usr/local/texlive/2026/texmf-dist/fonts/t
ype1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 530208 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 2 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Warning--empty year in lecture01
Warning--empty year in lecture02
(There were 2 warnings)
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.toc

------------
Run number 3 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
Underfull \hbox (badness 10000) in paragraph at lines 31--32
[]|\T1/lmr/m/n/10.95 (+20) Disposition per-be-da-an pse-u-do-co-
[4]) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texliv
e/2026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-d
ist/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )
(see the transcript file for additional information)</usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/local/texlive/2026/texmf-dist/f
onts/type1/public/lm/lmbx12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1
/public/lm/lmmi10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm
/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr12.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr17.pfb></usr/local
/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr8.pfb></usr/local/texlive/202
6/texmf-dist/fonts/type1/public/lm/lmri10.pfb></usr/local/texlive/2026/texmf-di
st/fonts/type1/public/lm/lmsy10.pfb></usr/local/texlive/2026/texmf-dist/fonts/t
ype1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 530453 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 3 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Warning--empty year in lecture01
Warning--empty year in lecture02
(There were 2 warnings)
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.toc

------------
Run number 4 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
Underfull \hbox (badness 10000) in paragraph at lines 31--32
[]|\T1/lmr/m/n/10.95 (+20) Disposition per-be-da-an pse-u-do-co-
[4]) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texliv
e/2026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-d
ist/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )
(see the transcript file for additional information)</usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/local/texlive/2026/texmf-dist/f
onts/type1/public/lm/lmbx12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1
/public/lm/lmmi10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm
/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr12.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr17.pfb></usr/local
/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr8.pfb></usr/local/texlive/202
6/texmf-dist/fonts/type1/public/lm/lmri10.pfb></usr/local/texlive/2026/texmf-di
st/fonts/type1/public/lm/lmsy10.pfb></usr/local/texlive/2026/texmf-dist/fonts/t
ype1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 530453 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
No existing .aux file, so I'll make a simple one, and require run of *latex.
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Category 'other':
  Rerun of 'pdflatex' forced or previously required:
    Reason or flag: 'Initial setup'

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict)
No file main.nav.
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]

Package natbib Warning: Citation `lecture02' on page 2 undefined on input line 
34.

[2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd)
Underfull \hbox (badness 3919) in paragraph at lines 45--45
[]\T1/lmss/m/n/10 Kajian persepsi; bukan efek

Package natbib Warning: Citation `mondal2022' on page 3 undefined on input line
 45.


Package natbib Warning: Citation `mathiane2023' on page 3 undefined on input li
ne 45.


Package natbib Warning: Citation `campo2023' on page 3 undefined on input line 
45.

[3]

Package natbib Warning: Citation `lecture01' on page 4 undefined on input line 
58.


Package natbib Warning: Citation `lecture02' on page 4 undefined on input line 
58.


Package natbib Warning: Citation `omg2019' on page 4 undefined on input line 58
.

[4] [5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/us
r/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../a
ssets/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-di
st/fonts/enc/dvips/lm/lm-rm.enc}] [12] [13]
No file main.bbl.
[14]

Package natbib Warning: There were undefined citations.

(./main.aux)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.

 )
(see the transcript file for additional information)</usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/texmf-dist/f
onts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1
/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm
/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmssbx10.p
fb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso10.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb>
Output written on main.pdf (14 pages, 180325 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Missing input file 'main.nav' message in .log file:
  No file main.nav.
Latexmk: Missing bbl file 'main.bbl' in following:
 No file main.bbl.
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Create bibtex main
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Category 'other':
  Rerun of 'bibtex main' forced or previously required:
    Reason or flag: 'Initial set up of rule'

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: ../report/bibliography.bib
Warning--empty year in lecture01
Warning--empty year in lecture02
(There were 2 warnings)
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.bbl
  main.nav
  main.out

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}]

Package natbib Warning: Citation `lecture02' on page 2 undefined on input line 
34.

[2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd)
Underfull \hbox (badness 3919) in paragraph at lines 45--45
[]\T1/lmss/m/n/10 Kajian persepsi; bukan efek

Package natbib Warning: Citation `mondal2022' on page 3 undefined on input line
 45.


Package natbib Warning: Citation `mathiane2023' on page 3 undefined on input li
ne 45.


Package natbib Warning: Citation `campo2023' on page 3 undefined on input line 
45.

[3]

Package natbib Warning: Citation `lecture01' on page 4 undefined on input line 
58.


Package natbib Warning: Citation `lecture02' on page 4 undefined on input line 
58.


Package natbib Warning: Citation `omg2019' on page 4 undefined on input line 58
.

[4] [5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/us
r/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../a
ssets/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-di
st/fonts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl

Package hyperref Warning: Token not allowed in a PDF string (Unicode):
(hyperref)                removing `\translate ' on input line 1.

(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14]

Package natbib Warning: There were undefined citations.

(./main.aux

Package natbib Warning: Citation(s) may have changed.
(natbib)                Rerun to get citations correct.

)

Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.

 )
(see the transcript file for additional information)</usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/texmf-dist/f
onts/type1/public/lm/lmr6.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmss10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/l
mss12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmss8.pfb><
/usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmssbx10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso10.pfb></usr/local/texliv
e/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb></usr/local/texlive/2026/tex
mf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 255824 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 2 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: ../report/bibliography.bib
Warning--empty year in lecture01
Warning--empty year in lecture02
(There were 2 warnings)
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.nav
  main.out

------------
Run number 3 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd)
Underfull \hbox (badness 3919) in paragraph at lines 45--45
[]\T1/lmss/m/n/10 Kajian persepsi; bukan efek
[3] [4] [5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}
{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6]
[7 <../assets/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl

Package hyperref Warning: Token not allowed in a PDF string (Unicode):
(hyperref)                removing `\translate ' on input line 1.

(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)
(see the transcript file for additional information)</usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/texmf-dist/f
onts/type1/public/lm/lmr6.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmss10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/l
mss12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmss8.pfb><
/usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmssbx10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso10.pfb></usr/local/texliv
e/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb></usr/local/texlive/2026/tex
mf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256013 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:27:42 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  ./bibliography.bib
Category 'changed_user':
  ./bibliography.bib

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  main.bbl
  main.tex
  sections/02-theory-literature.tex
  sections/03-problem.tex
  sections/05-models.tex
  sections/06-trace-verification.tex
  sections/07-discussion-conclusion.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  main.tex
  sections/02-theory-literature.tex
  sections/03-problem.tex
  sections/05-models.tex
  sections/06-trace-verification.tex
  sections/07-discussion-conclusion.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texliv
e/2026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-d
ist/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux

Package natbib Warning: Citation(s) may have changed.
(natbib)                Rerun to get citations correct.

) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/l
ocal/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/local/texli
ve/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
r8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmri10.pfb></u
sr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/t
exlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 531248 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 2 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texliv
e/2026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-d
ist/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 531264 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  ../report/bibliography.bib
Category 'changed_user':
  ../report/bibliography.bib

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: ../report/bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
  main.bbl
  main.tex
Category 'changed_user':
  ../assets/diagrams/use-case.pdf
  main.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux

Package natbib Warning: Citation(s) may have changed.
(natbib)                Rerun to get citations correct.

) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/l
ocal/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive
/2026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texm
f-dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fon
ts/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/pu
blic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/
lmsso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pf
b></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/lo
cal/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256058 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 2 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: ../report/bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:29:33 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texliv
e/2026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-d
ist/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 532657 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:31:21 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/04-requirements.tex
  sections/06-trace-verification.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/04-requirements.tex
  sections/06-trace-verification.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texliv
e/2026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-d
ist/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 533328 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:32:12 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5]) (./sections/04-requirements.tex [6{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texliv
e/2026/texmf-dist/fonts/enc/dvips/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-d
ist/fonts/enc/dvips/lm/lm-mathit.enc}] [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 533335 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:32:53 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/01-introduction.tex
  sections/02-theory-literature.tex
  sections/03-problem.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/01-introduction.tex
  sections/02-theory-literature.tex
  sections/03-problem.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11] [12 <../assets/diagrams/requirements.pdf>] [13 <../assets/diagrams/us
e-case.pdf>] [14 <../assets/diagrams/activity.pdf>] [15 <../assets/diagrams/seq
uence.pdf>] [16 <../assets/diagrams/state-machine.pdf>] [17 <../assets/diagrams
/bdd.pdf>] [18 <../assets/diagrams/ibd.pdf>])
(./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [19])
(./sections/07-discussion-conclusion.tex [20]) [21] (./main.bbl) [22]
(./main.aux)

LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.


Package rerunfilecheck Warning: File `main.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.

 )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/lo
cal/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/local/texliv
e/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/tex
mf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fon
ts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/pu
blic/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmri10.pfb></us
r/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/te
xlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (22 pages, 534354 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.out
  main.toc

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) (./main.toc
[1{/usr/local/texlive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/l
ocal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}]) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11] [12 <../assets/diagrams/requirements.pdf>] [13 <../assets/diagrams/us
e-case.pdf>] [14 <../assets/diagrams/activity.pdf>] [15 <../assets/diagrams/seq
uence.pdf>] [16 <../assets/diagrams/state-machine.pdf>] [17 <../assets/diagrams
/bdd.pdf>] [18 <../assets/diagrams/ibd.pdf>])
(./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [19])
(./sections/07-discussion-conclusion.tex [20]) [21] (./main.bbl) [22]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (22 pages, 534726 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:37:01 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  main.tex
  sections/05-models.tex
  sections/06-trace-verification.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  main.tex
  sections/05-models.tex
  sections/06-trace-verification.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux)

LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/lo
cal/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/local/texliv
e/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/tex
mf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fon
ts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/pu
blic/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmri10.pfb></us
r/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/te
xlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 534056 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.toc

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 534056 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
  main.tex
Category 'changed_user':
  ../assets/diagrams/use-case.pdf
  main.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:38:05 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 534053 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:40:57 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/05-models.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/05-models.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13] [14 <../assets/diagrams/activity.pdf>] [15 <../assets/diagrams/seq
uence.pdf>] [16 <../assets/diagrams/state-machine.pdf>] [17 <../assets/diagrams
/bdd.pdf>] [18 <../assets/diagrams/ibd.pdf>])
(./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [19])
(./sections/07-discussion-conclusion.tex [20]) [21] (./main.bbl) [22]
(./main.aux)

LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/lo
cal/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/local/texliv
e/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/tex
mf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fon
ts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/pu
blic/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmri10.pfb></us
r/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/te
xlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (22 pages, 514433 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.toc

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13] [14 <../assets/diagrams/activity.pdf>] [15 <../assets/diagrams/seq
uence.pdf>] [16 <../assets/diagrams/state-machine.pdf>] [17 <../assets/diagrams
/bdd.pdf>] [18 <../assets/diagrams/ibd.pdf>])
(./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [19])
(./sections/07-discussion-conclusion.tex [20]) [21] (./main.bbl) [22]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (22 pages, 514435 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256061 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:42:35 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/05-models.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/05-models.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux)

LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

 )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.pfb></usr/lo
cal/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/local/texliv
e/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texlive/2026/tex
mf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/texmf-dist/fon
ts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/pu
blic/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmri10.pfb></us
r/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/local/te
xlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 514209 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: References changed.
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux
  main.toc

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 514207 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
  main.tex
Category 'changed_user':
  ../assets/diagrams/use-case.pdf
  main.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256423 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: applying rule 'bibtex main'...
Rule 'bibtex main':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 1 of rule 'bibtex main'
------------
------------
Running 'bibtex  "main.aux"'
------------
This is BibTeX, Version 0.99e (TeX Live 2026)
The top-level auxiliary file: main.aux
The style file: plainnat.bst
Database file #1: ../report/bibliography.bib
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  main.aux

------------
Run number 2 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256423 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:43:21 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/06-trace-verification.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/06-trace-verification.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 514225 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256423 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```

## 2026-11-03 09:46:30 WIB — make build

- Command: `make build`
- Lecture: `lecture/01-pengantar-mbse.md`
- Exit code: 0
- Result: render/compile succeeded; log and release QC still required

```text
python3 model/verification/check_model.py
PASS: 576 order pairs, maximum wait 208s; category/tie/input/state and 24 requirement links checked.
mmdc --version
12.0.0
plantuml -version
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
(GPL source distribution)

Build Version: 1.2026.9
Git Commit: 18d0aae
Compile Time: 2026-10-17 08:25:10 UTC

Java Runtime: OpenJDK Runtime Environment
JVM: OpenJDK 64-Bit Server VM
Default Encoding: UTF-8
Language: en
Country: ID
 
PLANTUML_LIMIT_SIZE: 4096

GraphViz: dot - graphviz version 12.2.1 (20241206.2353)
Installation seems OK. File generation OK
java -version
openjdk version "21.0.1" 2023-10-17
OpenJDK Runtime Environment (build 21.0.1+12-29)
OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
dot -V
dot - graphviz version 12.2.1 (20241206.2353)
rsvg-convert --version
rsvg-convert version 2.60.0
latexmk -v
Latexmk, John Collins, 9 March 2026. Version 4.88
pdflatex --version
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
biber version: 2.21
BibTeX 0.99e (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
mkdir -p assets/diagrams
mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
Generating single mermaid chart
Rendering model/behavior/use-case.puml -> assets/diagrams/use-case.svg and .pdf
Rendering model/behavior/activity.puml -> assets/diagrams/activity.svg and .pdf
Rendering model/behavior/sequence.puml -> assets/diagrams/sequence.svg and .pdf
Rendering model/behavior/state-machine.puml -> assets/diagrams/state-machine.svg and .pdf
Rendering model/structure/bdd.puml -> assets/diagrams/bdd.svg and .pdf
Rendering model/structure/ibd.puml -> assets/diagrams/ibd.svg and .pdf
latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'report/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/04-requirements.tex
  sections/06-trace-verification.tex
Category 'changed_user':
  ../assets/diagrams/activity.pdf
  ../assets/diagrams/bdd.pdf
  ../assets/diagrams/ibd.pdf
  ../assets/diagrams/requirements.pdf
  ../assets/diagrams/sequence.pdf
  ../assets/diagrams/state-machine.pdf
  ../assets/diagrams/use-case.pdf
  sections/04-requirements.tex
  sections/06-trace-verification.tex

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/article.cls
Document Class: article 2025/01/22 v1.4n Standard LaTeX document class
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo))
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/txtbabel.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel/locale/id/babel-indonesia
n.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/babel-indonesian/indonesian.ldf
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype-pdftex.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/microtype.cfg))
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pdflscape/pdflscape-nometadata.st
y (/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/lscape.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/enumitem/enumitem.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/latex/microtype/mt-cmr.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd) [1{/usr/local/texl
ive/2026/texmf-var/fonts/map/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/
texmf-dist/fonts/enc/dvips/lm/lm-ec.enc}] (./main.toc) [2]
(./sections/01-introduction.tex) (./sections/02-theory-literature.tex [3]
[4]) (./sections/03-problem.tex [5] [6{/usr/local/texlive/2026/texmf-dist/fonts
/enc/dvips/lm/lm-mathsy.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-rm.enc}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.
enc}]) (./sections/04-requirements.tex [7] [8] [9]) (./sections/05-models.tex
[10] [11 <../assets/diagrams/requirements.pdf>] [12 <../assets/diagrams/use-cas
e.pdf>] [13 <../assets/diagrams/activity.pdf>] [14 <../assets/diagrams/sequence
.pdf>] [15 <../assets/diagrams/state-machine.pdf>] [16 <../assets/diagrams/bdd.
pdf>] [17 <../assets/diagrams/ibd.pdf>]) (./sections/06-trace-verification.tex
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd) [18])
(./sections/07-discussion-conclusion.tex [19]) [20] (./main.bbl) [21]
(./main.aux) )</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx10.
pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmbx12.pfb></usr/
local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/local/texl
ive/2026/texmf-dist/fonts/type1/public/lm/lmr10.pfb></usr/local/texlive/2026/te
xmf-dist/fonts/type1/public/lm/lmr12.pfb></usr/local/texlive/2026/texmf-dist/fo
nts/type1/public/lm/lmr17.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/p
ublic/lm/lmr8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr
i10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></
usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt10.pfb>
Output written on main.pdf (21 pages, 514733 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ./bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
Rc files read (in order):
  NONE
Latexmk: This is Latexmk, John Collins, 9 March 2026. Version 4.88.
Latexmk: Changing directory to 'presentation/'
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex':  Reasons for rerun
Changed files or newly in use/created:
  ../assets/diagrams/use-case.pdf
Category 'changed_user':
  ../assets/diagrams/use-case.pdf

------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -interaction=nonstopmode -halt-on-error -file-line-error -recorder  "main.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.29 (TeX Live 2026) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./main.tex
LaTeX2e <2025-11-01>
L3 programming layer <2026-01-19>
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamer.cls
Document Class: beamer 2026/01/22 v3.77 A class for typesetting presentations
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemodes.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/etoolbox/etoolbox.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasedecode.sty))
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/iftex.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoptions.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/keyval.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/iftex/ifvtex.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/math/pgfmath.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
) (/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/pgf.revision.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmath.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathutil.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathparser.code.tex
)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.code.
tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.basic
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.trigo
nometric.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.rando
m.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.compa
rison.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.base.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.round
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.misc.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfunctions.integ
erarithmetics.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathcalc.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfmathfloat.code.tex)
)) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/size11.clo)
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/basiclayer/pgfcore.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/systemlayer/pgfsys.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgf.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-pdftex.d
ef
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsys-common-p
df.def)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsyssoftpath.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/systemlayer/pgfsysprotocol.
code.tex)) (/usr/local/texlive/2026/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics-cfg/color.cfg)
(/usr/local/texlive/2026/texmf-dist/tex/latex/graphics/mathcolor.ltx))
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcore.code.tex
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/math/pgfint.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepoints.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathconst
ruct.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathusage
.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorescopes.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoregraphicst
ate.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretransform
ations.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorequick.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreobjects.c
ode.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepathproce
ssing.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorearrows.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreshade.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreimage.cod
e.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoreexternal.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorelayers.co
de.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcoretranspare
ncy.code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorepatterns.
code.tex)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pgf/basiclayer/pgfcorerdf.code.
tex))) (/usr/local/texlive/2026/texmf-dist/tex/latex/pgf/utilities/xxcolor.sty)
 (/usr/local/texlive/2026/texmf-dist/tex/latex/base/atbegshi-ltx.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdfescape/pdfescape.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/infwarerr/infwarerr.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/hycolor/hycolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/refcount/refcount.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/kvoptions/kvoptions.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/generic/stringenc/stringenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2026/texmf-dist/tex/generic/intcalc/intcalc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2026/texmf-dist/tex/latex/url/url.sty)
(/usr/local/texlive/2026/texmf-dist/tex/generic/bitset/bitset.sty
(/usr/local/texlive/2026/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty))

Package hyperref Message: Stopped early.

) (/usr/local/texlive/2026/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2026/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty

(/usr/local/texlive/2026/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
))) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaserequires.sty

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecompatibility.st
y) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasefont.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/sansmathaccent/sansmathaccent.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlfile-hook.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/koma-script/scrlogo.sty)))))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetranslator.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasemisc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetwoscreens.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseoverlay.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetitle.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasesection.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframe.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseverbatim.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframesize.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.
sty) (/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasecolor.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenotes.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetoc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseauxtemplates.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaseboxes.sty)))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbaselocalstructure.s
ty (/usr/local/texlive/2026/texmf-dist/tex/latex/tools/enumerate.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigation.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasenavigationsymbol
s.tex))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasetheorems.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/amscls/amsthm.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerbasethemes.sty))
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemedefault.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerfontthemedefault.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemedefault.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemedefault.st
y))) (/usr/local/texlive/2026/texmf-dist/tex/latex/base/fontenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/lmodern.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/booktabs/booktabs.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/tools/array.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/natbib/natbib.sty)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerthemeMadrid.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemewhale.sty)

(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamercolorthemeorchid.sty
)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerinnerthemerounded.st
y)
(/usr/local/texlive/2026/texmf-dist/tex/latex/beamer/beamerouterthemeinfolines.
sty)) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmss.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def)
(./main.aux)
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2026/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2026/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
(/usr/local/texlive/2026/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(./main.out) (./main.out)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-basic-dicti
onary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-bibliograph
y-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-environment
-dictionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-months-dict
ionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-numbers-dic
tionary-English.dict)
(/usr/local/texlive/2026/texmf-dist/tex/latex/translator/translator-theorem-dic
tionary-English.dict) (./main.nav) [1{/usr/local/texlive/2026/texmf-var/fonts/m
ap/pdftex/updmap/pdftex.map}{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips
/lm/lm-ec.enc}] [2] (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/ot1lmss.fd
) (/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omllmm.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omslmsy.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/omxlmex.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/amsfonts/umsb.fd) [3] [4]
[5{/usr/local/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathsy.enc}{/usr/lo
cal/texlive/2026/texmf-dist/fonts/enc/dvips/lm/lm-mathit.enc}] [6] [7 <../asset
s/diagrams/use-case.pdf>] [8] [9] [10] [11{/usr/local/texlive/2026/texmf-dist/f
onts/enc/dvips/lm/lm-rm.enc}] [12] [13] (./main.bbl
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmr.fd)
(/usr/local/texlive/2026/texmf-dist/tex/latex/lm/t1lmtt.fd)) [14] (./main.aux) 
)</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmmi10.pfb></usr/loc
al/texlive/2026/texmf-dist/fonts/type1/public/lm/lmr6.pfb></usr/local/texlive/2
026/texmf-dist/fonts/type1/public/lm/lmss10.pfb></usr/local/texlive/2026/texmf-
dist/fonts/type1/public/lm/lmss12.pfb></usr/local/texlive/2026/texmf-dist/fonts
/type1/public/lm/lmss8.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/publ
ic/lm/lmssbx10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lm
sso10.pfb></usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsso8.pfb>
</usr/local/texlive/2026/texmf-dist/fonts/type1/public/lm/lmsy10.pfb></usr/loca
l/texlive/2026/texmf-dist/fonts/type1/public/lm/lmtt8.pfb>
Output written on main.pdf (14 pages, 256423 bytes).
Transcript written on main.log.
Latexmk: Getting log file 'main.log'
Latexmk: Examining 'main.fls'
Latexmk: Examining 'main.log'
Latexmk: Found input bbl file 'main.bbl'
Latexmk: Log file says output to 'main.pdf'
Latexmk: Using bibtex to make bibliography file(s).
  ===Source file 'main.bbl' for 'pdflatex'
Latexmk: Found bibliography file(s):
  ../report/bibliography.bib
Latexmk: All targets (main.pdf) are up-to-date
Latexmk: Undoing directory change

test -s report/main.pdf
test -s presentation/main.pdf

```
