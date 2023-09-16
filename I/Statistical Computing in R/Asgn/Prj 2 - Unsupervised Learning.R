#Project 2: Unsupervised Learning


#Use the in-built "mtcars" data of R and do as follows in R studio with R script:

# 1. Perform the principal component analysis in the data and exact the 
# dimensions based on components with eigenvalues >1, check it with screeplot 
# as well and interpret the result carefully


# Load the mtcars dataset
data(mtcars)

# Principal Component Analysis (PCA)
pca <- princomp(mtcars, cor = TRUE)  # Perform PCA
eigenvalues <- pca$sdev^2  # Extract eigenvalues
eigenvalues

# Calculate cumulative variance
cumulative_variance <- cumsum(eigenvalues) / sum(eigenvalues)  
cumulative_variance

# Adjust figure margins
par(mar = c(3, 3, 2, 2))

# Screeplot
plot(1:length(eigenvalues), eigenvalues, type = "b", xlab = "Component", 
     ylab = "Eigenvalue", main = "Screeplot") 
abline(h = 1, lty = 2, col = "red")  # Add a line at eigenvalue = 1



#Interpretation of PCA with eigenvalues > 1: 
# The components with eigenvalues greater than 1 indicate dimensions that 
# explain more variance in the data than a single variable. In this case, 
# components with eigenvalues greater than 1 can be considered meaningful.
# It is recommended to retain the first two components (Comp.1 and Comp.2) as 
# they explain a significant amount of variance in the data. These components 
# are considered meaningful dimensions that summarize the key patterns and 
# trends present in the original variables.

#2. Perform the principal component analysis with varimax rotation in the data 
# and exact the dimensions based on eigenvalue >1 and check it with Screeplot 
# as well and interpret the result carefully

# Principal Component Analysis with Varimax rotation
library(psych)

pca_rotated <- principal(mtcars, nfactors = length(eigenvalues), rotate = "varimax")  # Perform PCA with varimax rotation
eigenvalues_rotated <- pca_rotated$values  # Extract eigenvalues
eigenvalues_rotated

# Screeplot
plot(1:length(eigenvalues_rotated), eigenvalues_rotated, type = "b", xlab = "Component", ylab = "Eigenvalue", main = "Screeplot (Varimax Rotation)")
abline(h = 1, lty = 2, col = "red")  # Add a line at eigenvalue = 1

#Interpretation of PCA with varimax rotation and eigenvalues > 1: 
# Similar to the previous analysis, components with eigenvalues greater than 1 
# are considered significant. Based on the eigenvalues greater than 1 criterion 
# and the varimax rotation, it is recommended to retain the first two components 
# as they explain a substantial amount of variance in the data. These components, 
# along with the varimax rotation, provide a meaningful representation of the 
# key patterns and relationships in the original variables, capturing the most 
# important information while reducing the complexity and correlation among the 
# components.

#3. Perform the classical multidimensional scaling in the data, revise the 
# results using stress values and interpret the result carefully 

# Classical Multidimensional Scaling (MDS)
library(stats)

# Perform classical multidimensional scaling
mds <- cmdscale(dist(mtcars))
mds
plot(mds, pch = 19)
abline(h=0, v=0, lty=2)

# Calculate stress values
dissimilarity_matrix <- dist(mtcars)  # Dissimilarity matrix of the original data
reduced_distances <- as.dist(dist(mds))  # Distances in the reduced-dimensional space
stress_values <- sqrt(sum((dissimilarity_matrix - reduced_distances)^2)) / sqrt(sum(dissimilarity_matrix^2))

stress_values


# Interpretation of MDS using stress values: 
# The stress value obtained from the classical multidimensional scaling (MDS) 
# analysis is 0.001862287. The stress value is a measure of the discrepancy 
# between the distances in the reduced-dimensional space and the original 
# dissimilarity matrix.

#The stress values represent the goodness-of-fit of the MDS solution. 
# Lower stress values indicate a better representation of distances in 
# the reduced space. To interpret the MDS results, compare stress values across 
# different MDS solutions and choose the solution with the lowest stress value 
# as it provides the best representation of the original distances.


# 4. Perform the hierarchical cluster analysis in the data and determine the 
# number of clusters to exact using the dendogram and cut at the various 
# distances with justification

# Hierarchical Cluster Analysis
dist_matrix <- dist(mtcars)  # Calculate dissimilarity matrix
hclust_res <- hclust(dist_matrix, method = "complete")
hclust_res

# Dendrogram
plot(hclust_res, main = "Dendrogram")

# Determine the number of clusters using the dendrogram
cut_heights <- c(100, 150, 200)  # Adjust based on dendrogram visual inspection
cut_clusters <- cutree(hclust_res, h = cut_heights)
cut_clusters

# Justification: 
# Cut height of 100: This results in a large number of clusters, with each 
# observation assigned to its own cluster. It allows for a fine-grained analysis 
# of individual cases and identification of unique patterns within the data.

# Cut height of 150: This leads to a moderate number of clusters, indicating a 
# higher level of aggregation compared to the previous cut height. It captures 
# broader similarities among observations and identifies groups with similar 
# characteristics.

# Cut height of 200: This further reduces the number of clusters, suggesting a 
# higher level of aggregation and grouping of more similar observations. It helps 
# identify larger, distinct groups and provides a broader perspective on trends 
# and patterns in the data.

#Interpretation of Hierarchical Cluster Analysis: 
# The dendrogram provides a visual representation of the hierarchical 
# clustering results. To determine the number of clusters, look for significant 
# gaps between clusters in the dendrogram. Adjust the cut heights based on visual 
# inspection to obtain a reasonable number of distinct clusters.

#5. Perform the k-means cluster analysis in the data based on the number of 
# clusters identified using dendogram and interpret the result carefully

# 5. K-means Cluster Analysis
library(cluster)

# Perform k-means clustering based on the number of clusters identified from the dendrogram
k <- 3  # Adjust based on the dendrogram analysis
kmeans_res <- kmeans(mtcars, centers = k)
kmeans_res

# Interpretation of K-means Cluster Analysis: 
# Number of clusters: The data has been divided into three clusters, with cluster 
# sizes of 7, 11, and 14 observations, respectively.

#Cluster means: The cluster means represent the average values of each variable 
# within each cluster. For example, in cluster 1, the average mpg is 19.74, the 
# average cyl is 6, the average disp is 183.31, and so on. These cluster means 
# provide insights into the typical characteristics of the observations within 
# each cluster.

# Clustering vector: The clustering vector indicates the assignment of each 
#observation to a specific cluster. 

# Within cluster sum of squares: This metric measures the variability within each 
# cluster. A lower value indicates that the observations within the cluster are 
# more similar to each other. In this case, cluster 2 has the lowest 
# within-cluster sum of squares, followed by cluster 1, and cluster 3 has the 
# highest sum of squares.

#Between-cluster sum of squares: This metric measures the variability between 
# the clusters. The percentage value (80.8%) indicates how much of the total 
# variability in the data is accounted for by the differences between 
# the clusters. A higher percentage suggests that the clusters are 
# well-separated and distinct from each other.
