library(igraph)

g <- graph(c(1,2))
plot(g)

plot(g, vertex.color="green", vertex.size = 40, edge.color="red", edge.size=20)


g <- graph(c(1,2,2,3,3,4,4,1))
plot(g, vertex.color="green", vertex.size = 40, edge.color="red", edge.size=20)

g <- graph(c(1,2,2,3,3,4,4,1), directed = F, n=7)
plot(g, vertex.color="green", vertex.size = 40, edge.color="red", edge.size=20)

g1 <- graph(c("Sita","Ram","Ram","Rita","Rita","Sita","Sita","Rita", "Anju","Ram"))
plot(g1, vertex.color="green", vertex.size = 40, edge.color="red", edge.size=20)

degree(g1)
degree(g1,mode="all")

diameter(g1,directed=F, weights=NA)
#diameter = 2 means 2 nodes has directed relation from inside & outside

#edge density
edge_density(g1, loops=F)
#or
ecount(g1)/(vcount(g1)*(vcount(g1)-1))
#5/4*(4-1)

reciprocity(g1)
#tied_edge/total_edge == 2/5

closeness(g1, mode="all", weights=NA)
betweenness(g1, directed=T, weights=NA)   #inner arrow

