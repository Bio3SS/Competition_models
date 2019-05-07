mainplot <- function(){
	plot(NULL, NULL
		, log="xy"
		, xlim = c(0.5, 2)
		, ylim = c(0.5, 2)
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
	text(0.8, 0.8 , "Coexistence")
}

mainplot(); bifLines(); coex(); 

excl <- function(){
	text(1.25, 0.8 , "Species 2 dominates")
	text(0.8, 1.25 , "Species 1 dominates")
}

mainplot(); bifLines(); coex(); excl()

founder <- function(){
	text(1.25, 1.25 , "Founder control")
	
}

mainplot(); bifLines(); coex(); excl(); founder()

cCurve <- function(C){
	curve (C/x, add=TRUE, col="blue")
	text(C, 1.08, paste("C=", C), col="blue")
}

mainplot(); bifLines(); coex(); excl(); founder(); cCurve(0.7)
mainplot(); bifLines(); coex(); excl(); founder(); cCurve(1); cCurve(1.43); cCurve(0.7)
