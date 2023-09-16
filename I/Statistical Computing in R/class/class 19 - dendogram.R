#getting scaled data sans 3rd variable
USArrests.1 <- USArrests[,-3]

#distance calculation
state.disimilarity <- dist(USArrests.1)

hirar.2 <- hclust(state.disimilarity, method='complete')

plot(hirar.2, labels=rownames(USArrests.1), ylab="Distance")

abline(h=150, col='red')
abline(h=200, col='blue')
abline(h=100, col='green')
abline(h=50, col='lightgreen')

library(NbClust)
NbClust(USArrests.1, method = 'complete', index = 'all')$Best.nc
