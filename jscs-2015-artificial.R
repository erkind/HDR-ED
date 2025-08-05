# Reference : Satman and Diyarbakirlioglu (2015), "Reducing EIV bias in
# linear regression using CGA's", J of Statistical Computation and
# Simulation
#
# Importing the data

# source(paste("http://raw.githubusercontent.com/erkind/",
#              "eiv-coe/main/g-f-HM-Zmat.R",
#              sep = ""))

# Importing from GitHub
data <- read.csv(file = paste("http://raw.githubusercontent.com/",
                              "erkind/hdr-ed/main/",
                              "jscs-2015-artificial.csv", sep = ""),
                 header = TRUE, sep = ";")
#
# # Importing from local drive
# data <- read.csv(file = paste("C:/Users/68596/Documents/docs/",
#                               "data/eiv/jscs-2015-artificial.csv", sep = ""),
#                        header = TRUE, sep = ";")
head(data)
dim(data)
#
# Description of the data
# Description goes here...
#
# Importing "eive" library
library(eive)
#
# Fit OLS regression of y on clean variables W1 and W2
fit.ols <- eive.cga(dirtyx = X1, otherx = W2,
                    y = y, numdummies = 10)$ols

# Fit OLS regression of y on dirty X1 and clean W2


# Fit CGA regression of y on filtered X1 and clean W2