
## k-means with iris
library(ClusterR) 
library(cluster)

# Get, check and make data 
data(iris)
str(iris)
iris_1 <- iris[,-5]

# Fitting K-Means clustering Model to training dataset
set.seed(240)
kmeans.res <- kmeans(iris_1,
                     centers = 3, nstart = 20)
kmeans.res

# Confusion Matrix
cm <- table(iris$Species, kmeans.res$cluster)
cm

#Accuracy
(accuracy <- sum(diag(cm))/sum(cm))
(mce <- 1 - accuracy)

# Model Evaluation and visualization
plot(iris_1[c("Sepal.Length", "Sepal.Width")])

plot(iris_1[c("Sepal.Length", "Sepal.Width")],
     col = kmeans.res$cluster)

plot(iris_1[c("Sepal.Length", "Sepal.Width")],
     col = kmeans.res$cluster,
     main = "K-means with 3 clusters")

# Getting cluster centers
kmeans.res$centers
kmeans.res$centers[,c("Sepal.Length","Sepal.Width")]

# Plotting cluster centers
points(kmeans.res$centers[, c("Sepal.Length","Sepal.Width")],
       col = 1:3,
       pch = 8, cex = 3)

# Visualizing clusters
y_kmeans <- kmeans.res$cluster
library(cluster)
clusplot(iris_1[, c("Sepal.Length", "Sepal.Width")],
         y_kmeans,
         lines = 0,
         shade = TRUE, color = TRUE,
         labels = 2,
         plotchar = FALSE, span = TRUE,
         main = paste("Cluster iris"),
         xlab = 'Sepal.Length',
         ylab = 'Sepal.Width')
