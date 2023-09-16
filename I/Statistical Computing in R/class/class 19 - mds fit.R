
# Multidimensional scaling is a visual representation of distances or 
# dissimilarities between sets of objects.
# Objects that are more similar (or have shorter distances) are closer together 
# on the graph than objects that are less similar (or have longer distances).

# There exist several types of MDS, and they differ mostly in the 
# loss function they use.
# Kruskal-Shepard distance scaling
# vs 
# Classical Torgerson–Gowerinner- product scaling
# Or,
# Metric scaling
# vs
# Nonmetric scaling

# Basics Steps
# 1. Assign a number of points to coordinates in n-dimensional space.
# 2. Calculate Euclidean distances for all pairs of points.
# 3. Compare the similarity matrix with the original input matrix by evaluating 
# the stress function.
# 4. Adjust coordinates, if necessary, to minimize stress.

#getting scaled data sans 3rd variable
USArrests.1 <- scale(USArrests[,-3])

# classical mds using kruskall's stress

#distance calculation
state.disimilarity <- dist(USArrests.1)

#MDS fit
mds.1 <- cmdscale(state.disimilarity)

summary(mds.1)

#mds plot
plot(mds.1, pch=19)
abline(h=0, v=0, lty=2)
text(mds.1, pos=4, labels = rownames(USArrests.1), col = 'tomato')

#alternative approach with Sammon's stress

mds.2 <- MASS::sammon(state.disimilarity)

plot(mds.2$points, pch=19)
abline(h=0, v=0, lty=2)
text(mds.2$points, pos=4, labels = rownames(USArrests.1), col = 'tomato')

# To improve
# We can try using Sammon’t stress!
# Alternative approach with Sammon's stress
mds.2 <- MASS::sammon(state.disimilarity, trace = FALSE)
plot(mds.2$points, pch = 19)
abline(h=0, v=0, lty=2)
text(mds.2$points, pos = 4, labels = rownames(USArrests.1))

#fitting PCA in new data
pca.1 <- prcomp(USArrests.1)

#compare with pca(first two PCs)
arrows(x0=mds.2$points[,1], 
       y0=mds.2$points[,2],
       x1=pca.1$x[,1],
       y1=pca.1$x[,2],
       col='red', pch=19, cex=0.5
       )

# Clustering
# Since clustering is popular in many fields, there exist a great number of 
# clustering methods. In this section we focus on perhaps the two best-known 
# clustering approaches: 

# K-means clustering and 
# hierarchical clustering.

# In K-means clustering, we seek to partition the observations into a 
# pre-specified number of clusters.

# On the other hand, in hierarchical clustering, we do not know in advance 
# how many clusters we want and we use “dendogram” to find the number of 
# clusters for the data


