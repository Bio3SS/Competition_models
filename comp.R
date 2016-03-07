compEq = function(time, vars, parms){
	x1dot <- with(as.list(c(vars, parms)),
		r1*x1*(1-(x1+alp21*x2)/K1)
	)
	x2dot <- with(as.list(c(vars, parms)),
		r2*x2*(1-(x2+alp12*x1)/K2)
	)
	list(c(x1dot,x2dot))
}

compSim = function (x1, x2, steps, MaxTime, parms){
	as.data.frame(lsoda(
		y = c(x1=x1, x2=x2),
		times = (0:steps)*MaxTime/steps,
		func = compEq,
		parms=parms
	))
}

phasePlot <- function(simlist, pplots, title=""){
	mlist <- apply(sapply(simlist, function(sim){
		sapply(sim, max)
	}), 1, max)

	if ((pplots=="b") | (pplots == "n")){

		plot(NULL, NULL,
			xlab = "Species 1 density (indiv/m sq)",
			ylab = "Species 2 density (indiv/m sq)",
			xlim = c(0, mlist[["x1"]]), ylim=c(0, mlist[["x2"]]),
			main=title
		)

		sapply(simlist, function(currsim){
			with(currsim, {
				lines(x1, x2, lwd=1.5)
				points(x1[1], x2[1], cex=1.5)
				steps = length(x1)
				points(x1[steps], x2[steps], pch=16, cex=1.5)
				arrows(x1[steps/10], x2[steps/10], x1[1+steps/10],
					x2[1+steps/10])
			})
		})
	}

	# Log plot

	if ((pplots=="b") | (pplots == "l")){
		plot(NULL, NULL,
			xlab = "Species 1 density (indiv/m sq)",
			ylab = "Species 2 density (indiv/m sq)",
			xlim = c(0.1, mlist[["x1"]]), ylim=c(0.1, mlist[["x2"]]),
			log="xy",
			main=title
		)

		sapply(simlist, function(currsim){
			with(currsim, {
				lines(x1, x2, lwd=1.5)
				points(x1[1], x2[1], cex=1.5)
				steps = length(x1)
				points(x1[steps], x2[steps], pch=16, cex=1.5)
				arrows(x1[steps/10], x2[steps/10], x1[1+steps/10],
					x2[1+steps/10])
			})
		})
	}
}

timePlot <- function(sim, title=""){
	with(sim, {
		plot(time, x1,
			xlab="Time (years)", 
			ylab = "Population density (indiv/m sq)",
			type = "l", 
			ylim = c(0, max(c(x1, x2))), lwd=1.5,
			main=title
		)
		lines(time, x2, lty=2, lwd=1.5)
		legend("topleft", legend = c("Species 1", "Species 2"), lty=c(1, 3))
	})
}

compPlots = function (x1=1, x2=1, r1=1, r2=1, K1=100, K2=100,
	steps=1000, MaxTime=40, alp12=1, alp21=1, plots="b", pplots="b", title=""){
	parms <- list(r1=r1, r2=r2, K1=K1, K2=K2, alp12=alp12, alp21=alp21)
	simlist <- mapply(compSim, x1, x2,
		MoreArgs=list(steps=steps, MaxTime=MaxTime, parms=parms),
		SIMPLIFY=FALSE
	)

	if ((plots=="b") | (plots == "p")){
		phasePlot(simlist, pplots, title=title)
	}

	if ((plots=="b") | (plots == "t")){
		for(sim in simlist){timePlot(sim, title=title)}
	}
	# simlist
}

