# =============================================================================
# Makefile -- Solvable Quantum Many-Body Models in Condensed Matter
# -----------------------------------------------------------------------------
# Root document  : main.tex   (chapter sources live under chapters/)
# Default engine : XeLaTeX via latexmk  (matches "% !TEX program = xelatex")
# pdfLaTeX is kept as a supported alternative (see the pdflatex target).
#
# Common usage:
#   make            build main.pdf with XeLaTeX (default, incremental)
#   make pdflatex   build with pdfLaTeX instead
#   make watch      continuous rebuild on every file save
#   make clean      remove auxiliary files (keep the PDF)
#   make distclean  remove auxiliary files and the compiled PDF
#   make help       list available targets
# =============================================================================

MAIN     := main
LATEXMK  := latexmk
LMKFLAGS := -interaction=nonstopmode -halt-on-error -file-line-error

# Source files: the root file plus every chapter under chapters/.
# A change in any of them triggers a rebuild; latexmk then decides how many
# passes are actually required to resolve the table of contents and cross-refs.
SOURCES  := $(MAIN).tex $(wildcard chapters/*.tex)

.PHONY: all pdf xelatex pdflatex watch clean distclean help

# Default target: build with the recommended XeLaTeX engine.
all: pdf

pdf: $(MAIN).pdf

# Incremental build: only recompiles when a source file is newer than the PDF.
$(MAIN).pdf: $(SOURCES)
	$(LATEXMK) -xelatex $(LMKFLAGS) $(MAIN).tex

# ---------------------------------------------------------------------------
# Explicit engine targets (always run latexmk, regardless of timestamps)
# ---------------------------------------------------------------------------
xelatex:
	$(LATEXMK) -xelatex $(LMKFLAGS) $(MAIN).tex

pdflatex:
	$(LATEXMK) -pdf $(LMKFLAGS) $(MAIN).tex

# Continuous preview: rebuild automatically on each save (Ctrl-C to stop).
watch:
	$(LATEXMK) -xelatex $(LMKFLAGS) -pvc $(MAIN).tex

# ---------------------------------------------------------------------------
# Cleaning
# ---------------------------------------------------------------------------
# clean    : remove LaTeX auxiliary files, keep main.pdf
# distclean: remove auxiliary files AND main.pdf
clean:
	$(LATEXMK) -c $(MAIN).tex

distclean:
	$(LATEXMK) -C $(MAIN).tex

help:
	@echo "Available targets:"
	@echo "  make            build main.pdf with XeLaTeX (default)"
	@echo "  make pdflatex   build main.pdf with pdfLaTeX instead"
	@echo "  make watch      continuous rebuild on file changes"
	@echo "  make clean      remove auxiliary files (keep PDF)"
	@echo "  make distclean  remove auxiliary files and PDF"
