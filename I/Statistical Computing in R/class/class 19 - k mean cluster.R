#ISLR book
set.seed(2)

x <- matrix(rnorm(50*2), ncol=2)
x[1:25, 1] <- x[1:25,1] + 3
x[1:25, 2] <- x[1:25,2] - 4

#k-means clustering
km.out <- kmeans(x,2, nstart = 20)

#checking clusters
km.out$cluster
km.out
#we have used k=2 as we have created a random data with 2 groups


km.out <- kmeans(x,3, nstart = 20)
km.out
km.out <- kmeans(x,4, nstart = 20)

#jati kmeans ko center(2,3,4,...) jati increase garxum tyati cluster ko sum of square badxa
#yasto bela adjusted R square use garne, not R square
#check when to use nstart =1 & nstart=20

