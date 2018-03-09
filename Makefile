# Competition_models
### Hooks for the editor to set the default target

current: target
-include target.mk

##################################################################

# make files

Sources = Makefile .ignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

mutual.comp.Rout: mutual.R

%.comp.Rout: comp.Rout deSolve.R %.R
	$(run-R)

bifurcation.Rout: bifurcation.R

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
