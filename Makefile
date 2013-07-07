# Makefile for HPC manual file

SED = gsed

MAIN = sample
DOCCLASS = hpcmanual
# pdf viewer: evince/open
VIEWER = open
# version number, which can be specified when calling make like
# make VERSION="0.5.2"
VERSION = 0.5.3

all: $(MAIN).pdf

.PHONY : all clean version distclean release

%.pdf : %.tex $(DOCCLASS).cls $(DOCCLASS).cfg Makefile
	-latexmk -silent -f -pdf $*

view : $(MAIN).pdf 
	$(VIEWER) $<

clean :
	latexmk -C

distclean : clean
	-@rm -f *.pdf

