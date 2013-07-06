# Makefile for HPC manual file

SED = gsed

MAIN = manual
MAINEN = manual-en
# pdf viewer: evince/open
VIEWER = open
# version number, which can be specified when calling make like
# make VERSION="0.5.2"
VERSION = 0.5.3

all: $(MAIN).pdf $(MAINEN).pdf

.PHONY : all clean version distclean cleantest release

$(MAIN).pdf : $(MAIN).tex *.cls *.cfg
	-latexmk -silent -f -pdf $*

$(MAINEN).pdf : $(MAINEN).tex *.cls *.cfg
	-latexmk -silent -f -pdf $*
	
view : $(MAIN).pdf  $(MAINEN).pdf
	$(VIEWER) $<

clean :
	latexmk -C

distclean : clean
	-@rm -f *.pdf

