
## Hierarchical cluster analysis (HCA):
## One potential disadvantage of K- means clustering is that it requires us to 
## pre-specify the number of clusters K.

## Hierarchical clustering is an alternative approach which does not require 
## that we commit to a particular choice of K.
## Hierarchical clustering has an added advantage over K-means clustering in 
## that it results in an attractive tree-based representation of the 
## observations, called a dendrogram.


## The hierarchical clustering dendrogram is obtained via an extremely 
## simple algorithm.
## We begin by defining some sort of dissimilarity measure between each pair 
## of observations. Most often, Euclidean distance is used.


USArrests.1 <- USArrests[,-3]
state.disimilarity <- dist(USArrests.1)

# Hierarchical clustering  with
# single linkage
hirar.1 <- hclust(state.disimilarity, method='single')
plot(hirar.1, labels=rownames(USArrests.1), ylab="Distance")

# complete linkage
hirar.2 <- hclust(state.disimilarity, method='complete')
plot(hirar.2, labels=rownames(USArrests.1), ylab="Distance")

# average linkage
hirar.2 <- hclust(state.disimilarity, method='average')
plot(hirar.2, labels=rownames(USArrests.1), ylab="Distance")
