# Run from the repository root. This entry point does not certify release QC.
SHELL := /bin/bash
.DEFAULT_GOAL := build
.NOTPARALLEL:

# Prefer the conventional PDF; accept provided lecture notes without inventing a PDF.
LECTURE ?= $(firstword $(wildcard lecture/mbse-material.pdf) $(filter-out lecture/README.md,$(wildcard lecture/*.pdf lecture/*.pptx lecture/*.md)) lecture/mbse-material.pdf)
SYSML_SOURCES := $(wildcard model/behavior/*.sysml model/structure/*.sysml model/requirements/*.sysml model/traceability/*.sysml model/verification/*.sysml)
DIAGRAMS := requirements use-case activity sequence state-machine bdd ibd

.PHONY: setup build _build check-model

setup:
	npm ci

check-model:
	node tools/sysml.mjs --check
	python3 tools/sync-requirements.py
	python3 model/verification/check_model.py
	npm test

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
	for tool in node npm python3 rsvg-convert latexmk pdflatex xelatex biber; do \
	  if ! command -v "$$tool" >/dev/null 2>&1; then \
	    printf 'Missing tool: %s\n' "$$tool"; missing=1; \
	  fi; \
	done; \
	for source in "$(LECTURE)" $(SYSML_SOURCES) package-lock.json node_modules/sysml-v2-lsp/package.json node_modules/sysml-v2-support/package.json \
	  report/main.tex report/bibliography.bib presentation/main.tex; do \
	  if [ ! -s "$$source" ]; then printf 'Missing/empty source: %s\n' "$$source"; missing=1; fi; \
	done; \
	if [ "$$missing" -ne 0 ]; then \
	  printf 'Prerequisites not met; no rendering or compilation performed.\n'; exit 1; \
	fi
	node --version
	npm --version
	node tools/sysml.mjs
	python3 tools/sync-requirements.py
	python3 model/verification/check_model.py
	npm test
	rsvg-convert --version
	latexmk -v
	xelatex --version
	biber --version
	@set -eu; for name in $(DIAGRAMS); do \
	  rsvg-convert -f pdf -o "assets/diagrams/$$name.pdf" "assets/diagrams/$$name.svg"; \
	done
	latexmk -xelatex -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex
	latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error presentation/main.tex
	test -s report/main.pdf
	test -s presentation/main.pdf
