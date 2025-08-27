# Minimal example for the CGA estimation of the classical EIV model
#
# Reference : Satman and Diyarbakirlioglu (2015), "Reducing EIV bias in
# linear regression using CGA's", J. of Stat. Computation and Simulation
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
fit_ols <- lm(formula = y ~ W1 + W2)
fit_ols_coef <- summary(fit_ols)$coefficients[,c(1,2)]

# OLS regression of Y on (eiv) X1 and (true) W2
fit_eiv <- lm(formula = y ~ X1 + W2)
fit_eiv_coef <- summary(fit_eiv)$coefficients[,c(1,2)]
# 
# CGA regression of Y on (cga) X1 and (true) W2
fit_cga <- eive.cga(dirtyx = X1, otherx = W2, y = y)$eive
fit_cga_coef <- summary(fit_cga)$coefficients[,c(1,2)]
rownames(fit_cga_coef) <- c("(Intercept)", "X1_CGA", "X2")
#
# Summary output
fit_ols_coef
fit_eiv_coef
fit_cga_coef