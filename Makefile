# Makefile for HPC manual file

SED := gsed

MAIN 	:= sample
DOCCLASS := hpcmanual
LATEX_OPT := -xelatex -f
# pdf viewer: evince/open
VIEWER = open
# version number, which can be specified when calling make like
# make VERSION="0.5.2"
VERSION = 0.5.3

all: $(MAIN).pdf

.PHONY : all clean version distclean release

%.pdf : %.tex $(DOCCLASS).cls $(DOCCLASS).cfg Makefile
	-latexmk $(LATEX_OPT) $*

%.tex : $(DOCCLASS).latex %.mkd Makefile
	@pandoc -f markdown -t latex --template=$(DOCCLASS).latex --toc -s $*.mkd > $@

view : $(MAIN).pdf 
	$(VIEWER) $<

clean :
	latexmk -C
#	-@rm *.tex *.toc *.aux *.fls *.fdb_latexmk

distclean : clean
	-@rm -f *.pdf

