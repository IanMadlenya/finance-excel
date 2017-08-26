install.packages('psych')
library(psych)

d = read.csv('YieldChanges_orig.csv')

pca.plot = fa.parallel(d,n.obs=NULL,fm="OLS",fa="pc",main="Parallel Analysis Scree Plots",
            n.iter=100,error.bars=FALSE,se.bars=TRUE,SMC=FALSE,ylabel=NULL,show.legend=TRUE,
            sim=TRUE,quant=.95,cor="cor",use="pairwise",plot=TRUE,correct=.5)
abline(h=1,col='purple')


# Manual Approach - Covariance
d_centered = scale(d,center=TRUE,scale=FALSE)
covmat = cov(d_centered)
e = eigen(covmat)
loadings = e$vectors

# Plot Variances
plot(e$values) # Variance
plot(e$values/sum(e$values)) # Proportional Variance
plot(e$values/(sum(e$values)/length(e$values))) # Relative Variance
abline(h=1,col='purple')
plot(cumsum(e$values)/sum(e$values))

# Select k
k = 3



sd = sqrt(e$values)
pct_var = sum(e$values[1:k])/sum(e$values)



pc = as.matrix(d) %*% loadings[,1:3]
cov(pc)


# install.packages('xlsx')
library(xlsx)
wb <- createWorkbook()
filename = 'MyWorkbook2.xlsx'
saveWorkbook(wb,filename)



write.xlsx(loadings, file=filename, sheetName="loadings")
write.xlsx(sd, file=filename, sheetName="sd",append = TRUE)
write.xlsx(pct_var, file=filename, sheetName="pct_var",append = TRUE)
