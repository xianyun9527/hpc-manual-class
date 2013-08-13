# Makefile for HPC manual file

SED := gsed

MAIN 	:= sample
MAIN_EN	:= sample_en
DOCCLASS := hpcmanual
LATEX_OPT := -xelatex -f
PANDOC_DIR := pandoc
PANDOC_TEX := -f markdown -t latex --template=$(DOCCLASS).latex --toc --listings --smart --standalone
PANDOC_WIKI := -f markdown -t mediawiki --smart --standalone
# pdf viewer: evince/open
VIEWER = open
# version number, which can be specified when calling make like
# make VERSION="0.5.2"
VERSION = 0.5.3

all: $(MAIN).pdf $(MAIN).wiki

.PHONY : all clean version 

%.pdf : %.tex $(DOCCLASS).cls $(DOCCLASS).cfg Makefile
	-latexmk $(LATEX_OPT) $*

%.wiki : %.mkd Makefile
	@pandoc $(PANDOC_WIKI) $*.mkd -o $@

%.tex : $(DOCCLASS).latex %.mkd Makefile
	@pandoc $(PANDOC_TEX) $*.mkd -o $@

$(DOCCLASS).% :
	cp $(PANDOC_DIR)/$@ .

view : $(MAIN).pdf 
	$(VIEWER) $<

clean :
	-@latexmk -C
	-@rm *.tex *.toc *.aux *.fls *.fdb_latexmk *.out

