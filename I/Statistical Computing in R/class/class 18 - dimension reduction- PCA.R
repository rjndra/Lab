head(USArrests)

#getting criminality scale after removing 3rd column i.e. Urban
library(dplyr)
USArrests.1 <- USArrests[,-3] %>% scale
#scale used to scale all variables in same range
head(USArrests.1)

#fitting PCA in new data
pca.1 <- prcomp(USArrests.1)
summary(pca.1)
#PC1 explained around 79% of variance whereas PC2
#explained around 15% and PC3 explained around 6% of
#variance with the latent variable i.e. criminality score.

#sd^2 is eigen value i.e. PC1 1.5358^2 is eigen value & eigen value >= 1

#Alternatively usign Psych

fa.1 <- psych::principal(USArrests.1, nfactors = 3, rotate = "none")
fa.1
#SS loadings = Eigenvalues (check with squared SD)

biplot(fa.1, labels = rownames(USArrests.1))


#rotate PCA with variance

fa.2 <- psych::principal(USArrests.1, nfactors = 3, rotate = "varimax")
fa.2
#SS loadings = Eigenvalues (check with squared SD)

biplot(fa.2, labels = rownames(USArrests.1))


#screeplot 
var_explained = pca.1$sdev^2 / sum(pca.1$sdev^2)
library(ggplot2)
qplot(c(1:3), var_explained) +
  geom_line()+
  xlab("Principal Component") +
  ylab("Variance Explained") +
  ggtitle("Scree Plot") +
  ylim(0, 1)


fa.3 <-
  psych::principal(USArrests.1,
                   nfactors = 2, rotate = "none")
fa.3
