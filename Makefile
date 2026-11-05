# Run from the repository root. This entry point does not certify release QC.
SHELL := /bin/bash
.DEFAULT_GOAL := build
.NOTPARALLEL:

# Prefer the conventional PDF; accept provided lecture notes without inventing a PDF.
LECTURE ?= $(firstword $(wildcard lecture/mbse-material.pdf) $(filter-out lecture/README.md,$(wildcard lecture/*.pdf lecture/*.pptx lecture/*.md)) lecture/mbse-material.pdf)
PUML_SOURCES := model/behavior/use-case.puml model/behavior/activity.puml \
	model/behavior/sequence.puml model/behavior/state-machine.puml \
	model/structure/bdd.puml model/structure/ibd.puml

.PHONY: build _build

build:
	@mkdir -p logs
	@set -eu -o pipefail; capture=$$(mktemp); \
	trap 'rm -f "$$capture"' EXIT; \
	started=$$(TZ=Asia/Jakarta date '+%Y-%m-%d %H:%M:%S %Z'); \
	set +e; \
	$(MAKE) --no-print-directory _build 2>&1 | tee "$$capture"; \
	result=$${PIPESTATUS[0]}; \
	set -e; \
	{ printf '\n## %s — make build\n\n' "$$started"; \
	  printf -- '- Command: `make build`\n- Lecture: `%s`\n- Exit code: %s\n' '$(LECTURE)' "$$result"; \
	  if [ "$$result" -eq 0 ]; then \
	    printf -- '- Result: render/compile succeeded; log and release QC still required\n'; \
	  else printf -- '- Result: failed; build-unverified\n'; fi; \
	  printf '\n```text\n'; cat "$$capture"; printf '\n```\n'; \
	} >> logs/build.md; \
	exit "$$result"

_build:
	@set -eu -o pipefail; missing=0; \
	for tool in python3 mmdc plantuml java dot rsvg-convert latexmk pdflatex; do \
	  if ! command -v "$$tool" >/dev/null 2>&1; then \
	    printf 'Missing tool: %s\n' "$$tool"; missing=1; \
	  fi; \
	done; \
	for source in "$(LECTURE)" model/requirements/requirements.mmd $(PUML_SOURCES) \
	  report/main.tex report/bibliography.bib presentation/main.tex; do \
	  if [ ! -s "$$source" ]; then printf 'Missing/empty source: %s\n' "$$source"; missing=1; fi; \
	done; \
	if [ "$$missing" -ne 0 ]; then \
	  printf 'Prerequisites not met; no rendering or compilation performed.\n'; exit 1; \
	fi
	python3 model/verification/check_model.py
	mmdc --version
	plantuml -version
	java -version
	dot -V
	rsvg-convert --version
	latexmk -v
	pdflatex --version
	@set -eu -o pipefail; for backend in biber bibtex; do \
	  if command -v "$$backend" >/dev/null 2>&1; then "$$backend" --version; fi; \
	done
	mkdir -p assets/diagrams
	mmdc -i model/requirements/requirements.mmd -o assets/diagrams/requirements.pdf
	@set -eu -o pipefail; for source in $(PUML_SOURCES); do \
	  name=$$(basename "$$source" .puml); \
	  printf 'Rendering %s -> assets/diagrams/%s.svg and .pdf\n' "$$source" "$$name"; \
	  plantuml -failfast2 -tsvg -pipe < "$$source" > "assets/diagrams/$$name.svg"; \
	  rsvg-convert -f pdf -o "assets/diagrams/$$name.pdf" "assets/diagrams/$$name.svg"; \
	done
	latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
	latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
	test -s report/main.pdf
	test -s presentation/main.pdf
