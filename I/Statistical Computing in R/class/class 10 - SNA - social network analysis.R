library(igraph)

y <- read.csv("D:/R programming runs/Class/socialnetworkdata.csv")

net <- graph.data.frame(y)

V(net) #vertices

E(net) #edges

#names as labels
V(net)$label

#define degree
V(net)$degree
V(net)$degree <- degree(net)
V(net)$degree

table(degree(net))

plot(net)

hist(V(net)$degree, col="green", main="Histogram of node degree", xlab="Degree of Vertices")


set.seed(222)
plot(net)

plot(net, vertex.color="green", vertex.size=2, vertex.label.dist=1.5, edge.arrow.size=0.1, vertex.label.cex=1)

plot(net, vertex.color=rainbow(52), vertex.size=V(net)$degree*0.4, edge.arrow.size=0.1, layout=layout.fruchterman.reingold)

plot(net, vertex.color=rainbow(52), vertex.size=V(net)$degree*0.4, edge.arrow.size=0.1, layout=layout.kamada.kawai(net))


#community(cluster) detection

net <- graph.data.frame(y, directed=F)
cnet <- cluster_edge_betweenness(net)
plot(cnet, net)
