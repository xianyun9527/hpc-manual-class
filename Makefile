# Makefile for HPC manual file

SED = gsed

MAIN = sample
# pdf viewer: evince/open
VIEWER = open
# version number, which can be specified when calling make like
# make VERSION="0.5.2"
VERSION = 0.5.3

all: $(MAIN).pdf

.PHONY : all clean version distclean cleantest release

$(MAIN).pdf : $(MAIN).tex *.cls *.cfg
	-latexmk -silent -f -pdf $*

view : $(MAIN).pdf 
	$(VIEWER) $<

clean :
	latexmk -C

distclean : clean
	-@rm -f *.pdf

