#######################################################################
#######################################################################
#######################################################################
#######################################################################
#### Gloria Buriticá
#### Index of regular variation
#######################################################################
#######################################################################
source("/Users/Buritica/Dropbox/Thèse/git/index_regular_variation/IndexofRV.R")
source("/Users/Buritica/Dropbox/Thèse/git/Auxiliar_functions/random_paths.R")
require(ggplot2)
library(ExtDist)
#######################################################################
### Parameters
n <- 4000
a <- NULL
N <- 500
### Simulation from different models
for(i in 1:N) a <- c(a,alphaestimator(rBurr(n,1,2,2), k1=floor(150))$xi)
a2 <- NULL
for(i in 1:N) a2 <- c(a2,alphaestimator(rfrechet(n,shape=4),k1=floor(400))$xi)
a3 <- NULL
for(i in 1:N) a3 <- c(a3,alphaestimator(ARMAX1(0.7,n,al=4),k1=floor(800))$xi)
a4 <- NULL
for(i in 1:N) a4 <- c(a4,alphaestimator(ARMAX1(0.8,n,al=4),k1=floor(400))$xi)
a5 <- NULL
for(i in 1:N) a5<- c(a5,alphaestimator(abs(rt(n,df=4)),k1=floor(100))$xi)
### Plot Boxplot results
{
  al <- cbind(a/0.25, rep("BURR(1,2,2)",N) )
  al <- rbind(al, cbind(a2/0.25, rep("FRECHET(4)",N)) )
  al <- rbind(al, cbind(a3/0.25, rep("ARMAX(0.7)",N)))
  al <- rbind(al, cbind(a4/0.25, rep("ARMAX(0.8)",N)))
  al <- rbind(al, cbind(a5/0.25, rep("STUDENT",N)))
  al <- as.data.frame(al)
  names(al) <- c("stat", "type")
  
  ggplot(al, aes( x=as.factor(type),y= as.double(stat) )) + 
    geom_boxplot(alpha = 0.3, fill = "grey") +
    geom_hline(yintercept = 1, lty = 2)+ ylim(0.25,1.75)+
    theme_classic() + xlab("") + ylab("")+
    ggtitle("Gamma")+
    scale_x_discrete(name ="", 
                     limits=c("BURR(1,2,2)","FRECHET(4)","ARMAX(0.7)","ARMAX(0.8)","STUDENT"))+
    theme(axis.text.x = element_text(angle = 45,hjust = 1),
          plot.title = element_text(color="black", size=15, face="bold"))
}
par(mfrow=c(1,1))
boxplot(a5/0.25)
abline(h=1)
