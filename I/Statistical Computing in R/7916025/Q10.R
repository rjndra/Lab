head(iris)
df <- iris[1:4]
head(df)
# Fit k-means clustering model with k = 2
k2 <- kmeans(df, centers = 2)

# Fit k-means clustering model with k = 3
k3 <- kmeans(df, centers = 3)

# Cluster means and WSS for k = 2
k2_cluster_means <- k2$centers
k2_wss <- k2$tot.withinss

# Cluster means and WSS for k = 3
k3_cluster_means <- k3$centers
k3_wss <- k3$tot.withinss

# Plot for k = 2
plot(df, col = k2$cluster, pch = 16)

#the plot of iris with 4 first variable shows that the are two clusters in relation with other variables

# Plot for k = 3
plot(df, col = k3$cluster, pch = 16)

#here the plot of shows 3 clusters of data 



plot(df,      col = (k3$cluster + 1),
     main = "K-Means Clustering Results with K = 3",     pch = 20, cex = 2)
#three cluster are found
plot(df, col=(k3$centers + 1), main = "K-means clustering results with centers of k = 3", pch = 20, cex=2)
#The three clusters with overlapping centre are formed