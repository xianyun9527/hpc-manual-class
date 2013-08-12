# Makefile for HPC manual file

SED := gsed

MAIN 	:= sample
MAIN_EN	:= sample_en
DOCCLASS := hpcmanual
LATEX_OPT := -xelatex -f
PANDOC_TEX := -f markdown -t latex --template=$(DOCCLASS).latex --toc --listings --smart --standalone
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
	@pandoc $(PANDOC_TEX) $*.mkd -o $@

view : $(MAIN).pdf 
	$(VIEWER) $<

clean :
	latexmk -C
#	-@rm *.tex *.toc *.aux *.fls *.fdb_latexmk

distclean : clean
	-@rm -f *.pdf

# TODO
## pandoc --data-dir=DIRECTORY option
## pandoc --normalize
## pandoc --indented-code-calsses
## pandoc --include-before-body
## pandoc --reference-links
## pandoc --listings
## pandoc --incremental
## pandoc --bibliography=bibdb
## Math Rendering in HTML
