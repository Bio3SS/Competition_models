# Competition_models
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: coexist.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

coexist.Rout: coexist.R

##################################################################

## Content

Sources += $(wildcard *.R)

%.comp.Rout: comp.Rout deSolve.R %.R
	$(run-R)


######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
