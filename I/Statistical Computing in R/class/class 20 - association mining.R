#create a list of baskets

market_basket <- list(
  c("bread", "milk"),
  c("bread", "diapers", "beer", "Eggs"),
  c("milk", "diapers", "beer", "cola"),
  c("bread", "milk", "diapers", "beer"),
  c("bread", "milk", "diapers", "cola")
)

#set transaction names (T1 to T5)

names(market_basket) <- paste("T", c(1:5), sep="")

market_basket

library(arules)

#transformation

trans <- as(market_basket, "transactions")

#dimensions
dim(trans)

#item labels
itemLabels(trans)

#summary
summary(trans)

#plot
image(trans)
# probability image ho...black count garne

inspect(trans)

#minimum support kati rakhne afai decide garne tara justify garnu paro
# supervised jastai 70-30 or 80-20 maa test garera justify garnu sakinxa

#min support 0.3, confidence as 0.5

rules <- apriori(trans, 
                 parameter = list(supp=0.3,
                                  conf=0.5,
                                  maxlen=10,
                                  target="rules")
                 )

summary(rules)
inspect(rules)

#lift greater than 1 herne


rules2 <- apriori(trans, 
                  parameter = list(supp=0.3,
                                   conf=0.5,
                                   maxlen=10,
                                   minlen=2,
                                   target="rules")
                  )
summary(rules2)
inspect(rules2)

#For example, to analyze what items customers buy before buying {beer},
# we set rhs=beer and default=lhs
beer_rules_rhs <- apriori(trans, 
                          parameter = list(supp=0.3,
                                           conf=0.5,
                                           maxlen=10,
                                           minlen=2),
                          appearance=list(default="lhs", rhs="beer"))

inspect(beer_rules_rhs)
#only check lift > 1

# we check with lhs=beer i.e. what customers buy before buying beer

beer_rules_lhs <- apriori(trans, 
                          parameter = list(supp=0.3,
                                           conf=0.5,
                                           maxlen=10,
                                           minlen=2),
                          appearance=list(default="rhs", lhs="beer"))

inspect(beer_rules_lhs)

#product recommendation rule
rules_conf <- sort(rules2,
                   by="confidence",
                   decreasing = T)

#inspect the rules
#show the support, lift & confidence for all rules
inspect(head(rules_conf))

library(arulesViz)
plot(rules2)

plot(rules2, method = "two-key plot")

#graph based visualization

plot(rules2, engine = "plotly")

subrules <- head(rules2, n=10, by='confidence')

plot(subrules, method="graph", engine="htmlwidget")

plot(subrules, method="paracoord")

