# Competition_models

current: target
-include target.mk

Sources = Makefile

##################################################################

## Content

Sources += $(wildcard *.R)

mutual.comp.Rout: mutual.R

%.comp.Rout: comp.Rout deSolve.R %.R
	$(run-R)

bifurcation.Rout: bifurcation.R

######################################################################

### Makestuff

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
