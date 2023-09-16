library(readr)

Cardiotocographic <- read_csv("D:\\R programming runs\\Class\\Cardiotocographic.csv")

data<- Cardiotocographic

str(data)

#NSP = 1 = Normal CTG (No hypoxia or acidosis)
#NSP = 2 = Suspicious CTG (Low probability hypoxia/acidosis)
#NSP = 3 = Pathological CTG (High probability hypoxia/acidosis)

#Changing it to factor variable
data$NSP <- factor(data$NSP)

str(data$NSP)

#data partition
set.seed(16)

ind <- sample(2,nrow(data), replace = T, prob = c(0.8,0.2))
train <- data[ind==1,]
test <- data[ind==2,]

library(party)

tree <- ctree(NSP ~ LB+AC+FM, data=train)

tree

plot(tree)
#graph ko lagi full screen garnu parxa

#WE have more than 20 node for 3 variables. So, it is a overfitting

#Pruning the tree with 99% confidence interval and split at 500 samples

tree1 <- ctree(NSP ~ LB+AC+FM, data=train, controls = ctree_control(mincriterion = 0.99, minsplit = 500))

plot(tree1)

#Now, we have 9 nodes


#predict categorical prob for each case in train data
predict(tree, type="prob")
predict(tree, type="prob")[1]

#predict for test data
predict(tree, test)

#prop.table(data$NSP)[1] check how to get it & compare with train predict

#confusion matrix
(tab <- table(predict(tree), train$NSP))

#accuracy
accuracy <- sum(diag(tab))/sum(tab)

#misclassification error
mce <- 1-accuracy


#prediction for test data again
pred.test <- predict(tree, newdata=test)

#confusion matrix
(tab1 <- table(pred.test, test$NSP))

#accuracy
accuracy1 <- sum(diag(tab1))/sum(tab1)

mce1 <- 1-accuracy1


#Bagging with ipred package
library(ipred)

MBTree <- bagging(NSP ~ ., data=train, coob=T)
print(MBTree)

#prediction
MBPredict1 <- predict(MBTree, test)
MBPredict1

#confusion matrix and accuracy
library(caret)
confusionMatrix(MBPredict1, test$NSP)

#Random forest package
library(randomForest)

set.seed(16)

#fitting random forest model
rfm <- randomForest(NSP ~ ., data=train)

#Printing random forest model
print(rfm)

plot(rfm)

#tuning rfm model

train <- as.data.frame(train)

#We can use the "tuneRF" now
t <- tuneRF(train[,-22], train[,22],
            stepFactor = 0.5,
            plot = TRUE,
            ntreeTry = 300,
            trace = TRUE,
            improve = 0.05)
#error 4 aayo so aba 4 use garne next maa

#improved rfm model

rfm1 <- randomForest(NSP~LB+AC+FM, data=train,
                     ntree=300,
                     mtry=4, #4 from error
                     importance = T,
                     proximity = T)
print(rfm1)

#boosting
#Generalized boosting regression model
library(gbm)
mod.gbm <- train(NSP~LB+AC+FM, data=train, method="gbm", verbose=F)
#more to do 


# Bagging, or bootstrap aggregation, is a technique used to reduce the variance 
# of your predictions by combining the result of multiple classifiers modeled 
# on different sub-samples of the same dataset.

# Random Forest provides an improvement over bagged trees by a small tweak that 
# decorrelates the trees.

# As in bagging, we build a number of decision trees on bootstrapped 
# training samples.

# But when building these decision trees, each time a split in a tree is 
# considered, a random sample of m predictors (mtry) is chosen as split 
# candidates from the full set of p predictors.

# Advantages of Random forest model
# Random Forests is very effective at estimating missing data and maintaining 
# accuracy when a large proportions of the data is missing.

# It can also balance errors in datasets where the classes are imbalanced.
# Most importantly, it can handle massive datasets with large dimensionality.

# However, one disadvantage of using Random Forests is that you might easily 
# “overfit” noisy datasets, especially in the case of doing regression.


# Boosting is another approach to improve the predictions resulting from 
# a decision tree.

# Like bagging and random forests, it is a general approach that can be 
# applied to many statistical learning methods for regression or classification.
 
# Boosting works in a similar way, except that the trees are grown sequentially:
# each tree is grown using information from previously grown trees.
# Boosting does not involve bootstrap sampling; instead, each tree is fitted 
# on a modified version of the original dataset.


