# Reference : Satman and Diyarbakirlioglu (2015), "Reducing EIV bias in
# linear regression using CGA's", J of Statistical Computation and
# Simulation
#
# Importing data
data <- read.csv(file = paste("http://raw.githubusercontent.com/",
                              "erkind/hdr-ed/main/",
                              "jscs-2015-artificial.csv", sep = ""),
                 header = TRUE, sep = ";")
attach(data)
#
# Importing "eive" library
library(eive)
#
# OLS regression of Y on (true) W1 and (true) W2
fit.ols <- lm(formula = y ~ W1 + W2)
#
# OLS regression of Y on (eiv) X1 and (true) W2
fit.eiv <- lm(formula = y ~ X1 + W2)
# 
# CGA regression of Y on (cga) X1 and (true) W2
fit.cga <- eive.cga(dirtyx = X1, otherx = W2, y = y)$eive
#
# Summary output
t(summary(fit.ols)$coefficients[,c(1,3)])
t(summary(fit.eiv)$coefficients[,c(1,3)])
t(summary(fit.cga)$coefficients[,c(1,3)])

