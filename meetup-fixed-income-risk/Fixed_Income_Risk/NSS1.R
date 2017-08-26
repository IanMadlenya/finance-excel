install.packages("NMOF")
library(NMOF)

### From the help section

tm <- c(c(1, 3, 6, 9) / 12, 1:10)  ## in years
param <- c(6, 3, 8, 1)
yM <- NS(param, tm)
plot(tm, yM, xlab = "maturity in years", 
     ylab = "yield in percent")

param <- c(6, 3, 5, -5, 1, 3)  
yM <- NSS(param, tm) 
plot(tm, yM, xlab = "maturity in years", 
     ylab = "yield in percent")

## Not run: 
## get Bliss/Diebold/Li data (used in some of the papers in References)
u <- url("http://www.ssc.upenn.edu/~fdiebold/papers/paper49/FBFITTED.txt")
open(u); BliDiLi <- scan(u, skip = 14); close(u)
mat <- NULL
for (i in 1:372) 
  mat <- rbind(mat,BliDiLi[(19*(i-1)+1):(19*(i-1)+19)])
mats  <- c(1,3,6,9,12,15,18,21,24,30,36,48,60,72,84,96,108,120)/12

## the obligatory perspective plot
persp(x = mat[,1], y = mats, mat[ ,-1L],
      phi = 30, theta = 30, ticktype = "detailed",
      xlab = "time",
      ylab = "time to maturity in years",
      zlab = "zero rates in %")

## End(Not run)
