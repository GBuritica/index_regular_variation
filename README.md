# Index of regular variation

Functions : alphaestimator2 (implemented from the package fExtremes)
                   alphaestimator 
                   
                   
Further functions from the fExtremes package to model the index of regular variation.

shaparmPlot(-sample, plottype = "upper", doplot=T)
hillPlot(sample, start = 15)


Examples of implemenation: 


sample   <- abs( arima.sim(n = 8000, list(ar=0.5, ma=0), rand.gen=function(n) rt(n,df=4) ) )
alphaestimator(sample, plot=TRUE , R0 = 50,  hill=TRUE,   k1 = 1000 )
alphaestimator(sample, plot=TRUE , R0 = 100, hill=FALSE,  k1 = 1000 )
abline(h=0.25,col = "red")
