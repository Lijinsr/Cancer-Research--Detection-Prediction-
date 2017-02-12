## Cnr Data Study 5/1/2016
#colon cnr alon et al 1999
install.packages("devtools") # we are using datamicroarray package in github and to install
# we need devtools packge
library(devtools)
install_github("ramhiser/datamicroarray") #installing data microarray package from github


# setting working directory
setwd("~/RWorld")
library(datamicroarray)
data("alon", package = "datamicroarray")# attaching the alon data set in microarray package
str(alon)
str(iris3) #comparing with iris3
head(alon)
alon1 <- alon[[1]]  #alon is a list hence asssigning the first value of list to a vector
str(alon1)
str(iris3)
dni <- dimnames(alon1)
dni

#comparing the case with iris3
iris3
head(iris)
?aperm
#ii <- data.frame(matrix(aperm(iris3, c(1,3,2)), ncol = 4, 
#dimnames =list(NULL, sub("L.", ".Length", 
#                         sub("W.", ".Width", dni3[[2]])))),
#Species = gl(3, 50, labels = sub("S", "s", sub("V", "v", dni3[[3]]))))
test_iris3 <- aperm(iris3, c(1,3,2))
test_iris3
Tstirs3mx <- matrix(test_iris3, ncol = 4)
Tstirs3mx

#continuing with original case
#No need of aperm function here since we will be given gene data of a un known patient
# and we have to predict which group the patient belongs to thus gene data are features
new_alon <- data.frame(alon1) #no need to use matrix function and dimnames as it is allredy
#in this format
head(new_alon)
new_alon[1:4, 1:4] # head function is not helpfull here due to large number  of features
library(datamicroarray)
head(alon[2])

#since we have 2000 features we are reducing the number of features using PCA
library(caret)
alonpca <- preProcess(new_alon, method = ("pca"), thresh = 0.95)
new_alonpca <- predict(alonpca, new_alon)
head(new_alonpca, n = 3)
# Hence we have 31 new PCs


## Adding the factor in alon set to the newalon set
alon2 <- data.frame(alon1, Status = alon[2])
str(alon2)
head(alon2[1:4, 1999:2001])
dni[3] <- "Status"
dni[3]
