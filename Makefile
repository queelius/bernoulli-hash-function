TEX = pdflatex
BIB = bibtex
MAIN = main
FLAGS = -interaction=nonstopmode

.PHONY: all clean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex defs.tex references.bib gloss.tex $(wildcard sections/*.tex)
	$(TEX) $(FLAGS) $(MAIN).tex
	$(BIB) $(MAIN)
	$(TEX) $(FLAGS) $(MAIN).tex
	$(TEX) $(FLAGS) $(MAIN).tex

clean:
	rm -f $(MAIN).{aux,bbl,blg,log,out,toc,lof,lot,loa,pdf,acn,glo,ist,nlo,slo,fls,fdb_latexmk,synctex.gz}
