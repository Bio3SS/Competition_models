mainplot <- function(){
	plot(NULL, NULL
		, xlim = c(0, 2)
		, ylim = c(0, 2)
		, xaxs = "i"
		, yaxs = "i"
		, xlab = expression(E[21])
		, ylab = expression(E[12])
	)
}

mainplot()

bifLines <- function(){
	abline(h=1)
	abline(v=1)
}

mainplot(); bifLines()

coex <- function(){
	text(0.5, 0.5 , "Coexistence")
}

mainplot(); bifLines(); coex(); 

excl <- function(){
	text(1.5, 0.5 , "Species 2 dominates")
	text(0.5, 1.5 , "Species 1 dominates")
	
}

mainplot(); bifLines(); coex(); excl()

founder <- function(){
	text(1.5, 1.5 , "Founder control")
	
}

mainplot(); bifLines(); coex(); excl(); founder()
