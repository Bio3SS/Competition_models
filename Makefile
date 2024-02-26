# Competition_models

current: target
-include target.mk

Sources = Makefile

##################################################################

## Content

Sources += $(wildcard *.R)

## Basic functions; also used elsewhere (evaluation)
comp.Rout: comp.R
	$(wrapR)

mutual.comp.Rout: mutual.R

## second.comp.Rout: comp.rda deSolve.R second.R
%.comp.Rout: comp.rda deSolve.R %.R
	$(run-R)

bifurcation.Rout: bifurcation.R
	$(run-R)

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

-include makestuff/pipeR.mk
-include makestuff/pdfpages.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
