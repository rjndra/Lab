library(magrittr)

iris #default data from R

head(iris)

iris = read.csv('D:\R programming runs\Class\iris.csv') #choose iris data

head(iris)

#exposing pipe operator %$%

#correlation of subset where data > mean
iris %>% subset(Sepal.Length > mean(Sepal.Length)) %$% cor(Sepal.Length, Sepal.Width)

cor(iris$Sepal.Length, iris$Sepal.Width) #correlation of whole length

summary(iris)
summary(iris$Petal.Length)

