#Use the attached "titanic.csv" data and do as follows in R Studio with R script:
  
#1. Read the titanic.csv data with base R function and save it as "data" and
# remove the name column and save again as data
setwd("/Users/arpan/Desktop/MDS/01 MDS I-I/MDS 503 - Statistical Computing with R/Class Lab/Data")
data <- read.csv("Arpan Sapkota - titanic.csv")
data <- data[, -3]  # Remove the name column
head(data)
str(data)


#2. Fit binary logistic regression model with "Survived" variable as dependent 
# variable and rest of variables as independent variables using "data", 
# get summary of the model, check VIF and interpret the results carefully

#Converting factor
data$Survived <- as.factor(data$Survived)
data$Pclass <- as.factor(data$Pclass)
str(data$Pclass)
data$Sex <- as.factor(data$Sex)
str(data$Sex)

model.full <- glm(Survived~., data= data, family = binomial)
summary(model.full)
library(car)
vif(model.full)

# The VIF values indicate that there is no severe multicollinearity among the 
# predictor variables in the logistic regression model. The variables Pclass, Sex, 
# Age, Siblings.Spouses.Aboard, Parents.Children.Aboard, and Fare have VIF values 
# ranging from 1.167931 to 2.115788 These values suggest that there is little to 
# moderate correlation between the predictor variables, indicating that they can 
# be included in model without significant issues related to multicollinearity.

#3. Randomly split the data into 70% and 30% with replacement of samples as 
#"train" and "test" data
set.seed(07)
ind <- sample(2,nrow(data), replace = T, prob = c(0.7,0.3))
train <- data[ind==1,]
test <- data[ind==2,]

#4. Fit binary logistic regression classifier, knn classifier, ann classifier, 
# naive bayes classifier, svm classifier, decision tree classifier, decision 
# tree bagging classifier, random forest classifier, tuned random forest 
# classifier and random forest boosting classifier models using the "train" data

# Binary logistic regression classifier
model.full <- glm(Survived~., data= train, family = binomial)

# KNN classifier
library('caret')
model.knn <- train(Survived~., data = train, method = "knn")

# ANN classifie
library(nnet)
nn_model <- nnet(Survived~., data = train, size = 5, linear.output= TRUE)

# Naive bayes classifier
library(e1071)
model.nb <- naiveBayes(Survived~., data = train)

# SVM classifier
library('e1071')
model.svm <- svm(formula = Survived~., data= train,
                 type= 'C-classification',
                 kernel = 'linear')

# Decision tree classifier
library(party)
tree <- ctree(Survived~., data= train)

# Decision tree bagging classifier
library(ipred)
MBTree <- bagging(Survived~., data = train, coob= T)

# Random forest classifier
library(randomForest)
set.seed(07)
rfm <- randomForest(Survived~., data= train)

par(mar = c(3, 3, 2, 2))

# Tuned random forest classifier 
t <- tuneRF(train[,-1],train[,1],
            stepFactor = 0.5,
            plot = T,
            ntreeTry = 300,
            trace = T,
            improve = 0.05)
# Improve "rfm" model
rfm1 <- randomForest(Survived~., data= train, ntree= 300, mtry = 4,
                     improtance = T, proximity= T)

# Random forest boosting classifier models
library(caret)
mod.gbm <- train(Survived~., data= train, method = "gbm",verbose = F)


#5. Get confusion matrix and accuracy/misclassification error for all the 
# classifier models and interpret them carefully

#Binary logistic regression classifier
predict.test <- predict(model.full,test, type= "response")
predicted.test <- factor(ifelse(predict.test>0.5,1,0))
reference.test <- factor(test$Survived)
(Bcm <- table(predicted.test, reference.test))
(Baccuracy <- sum(diag(Bcm))/sum(Bcm))
(Berror <- 1 -Baccuracy)

# KNN classifier
kpredict.test <- predict(model.knn, test)
(kcm <- table(kpredict.test, test$Survived))
(kaccuracy <- sum(diag(kcm))/sum(kcm))
(kerror <- 1 -Baccuracy)


# ANN classifier
Apredict.test <- predict(nn_model, test)
Apredicted.test <- factor(ifelse(predict.test>0.5,1,0))
Areference.test <- factor(test$Survived)
(Acm <- table(Apredicted.test, Areference.test))
(Aaccuracy <- sum(diag(Acm))/sum(Acm))
(Aerror <- 1 -Aaccuracy)

# Naive bayes classifier
Npredict.test <- predict(model.nb, test)
(Ncm <- table(Npredict.test, test$Survived))
(Naccuracy <- sum(diag(Ncm))/sum(Ncm))
(Nerror <- 1 -Naccuracy)

# SVM classifier
Spredict.test <- predict(model.svm, test)
(Scm <- table(Spredict.test, test$Survived))
(Saccuracy <- sum(diag(Scm))/sum(Scm))
(Serror <- 1 -Saccuracy)

# Decision tree
Dpredict.test <- predict(tree, test)
(Dcm <- table(Dpredict.test, test$Survived))
(Daccuracy <- sum(diag(Dcm))/sum(Dcm))
(Derror <- 1 -Daccuracy)

# Decision tree bagging classifier
Mpredict.test <- predict(MBTree, test)
(Mcm <- table(Mpredict.test, test$Survived))
(Maccuracy <- sum(diag(Mcm))/sum(Mcm))
(Merror <- 1 -Maccuracy)

# Random forest classifier
Rpredict.test <- predict(rfm, test)
(Rcm <- table(Rpredict.test, test$Survived))
(Raccuracy <- sum(diag(Rcm))/sum(Rcm))
(Rerror <- 1 - Raccuracy)

# Tuned random forest classifier  
Rtpredict.test <- predict(rfm1, test)
(Rtcm <- table(Rtpredict.test, test$Survived))
(Rtaccuracy <- sum(diag(Rtcm))/sum(Rtcm))
(Rterror <- 1 - Rtaccuracy)

# Random forest boosting classifier
Fpredict.test <- predict(mod.gbm, test)
(Fcm <- table(Fpredict.test, test$Survived))
(Faccuracy <- sum(diag(Fcm))/sum(Fcm))
(Ferror <- 1 - Faccuracy)

#Based on the accuracy values, the Random Forest model achieved the 
# highest accuracy of approximately 0.8201439 However, comparing accuracy alone 
# may not provide a comprehensive evaluation of the models. 

#6. Get confusion matrix and accuracy/misclassification error for all the 
# predicted models and interpret them carefully

# Binary logistic regression classifier
predict.test <- predict(model.full,test, type= "response")
predicted.test <- factor(ifelse(predict.test>0.5,1,0))
reference.test <- factor(test$Survived)
(Bcm <- table(predicted.test, reference.test))
confusionMatrix(Bcm)

# KNN classifier
kpredict.test <- predict(model.knn, test)
(kcm <- table(kpredict.test, test$Survived))
confusionMatrix(kcm)

# ANN classifier
Apredict.test <- predict(nn_model, test)
Apredicted.test <- factor(ifelse(predict.test>0.5,1,0))
Areference.test <- factor(test$Survived)
Acm <- table(Apredicted.test, Areference.test)
confusionMatrix(kcm)

# Naive bayes classifier
Npredict.test <- predict(model.nb, test)
Ncm <- table(Npredict.test, test$Survived)
confusionMatrix(Ncm)

# SVM classifier
Spredict.test <- predict(model.svm, test)
Scm <- table(Spredict.test, test$Survived)
confusionMatrix(Scm)

# Decision Tree
Dpredict.test <- predict(tree, test)
Dcm <- table(Dpredict.test, test$Survived)
confusionMatrix(Dcm)

# Decision tree bagging classifier
Mpredict.test <- predict(MBTree, test)
Mcm <- table(Mpredict.test, test$Survived)
confusionMatrix(Mcm)

# Random forest classifier
Rpredict.test <- predict(rfm, test)
Rcm <- table(Rpredict.test, test$Survived)
confusionMatrix(Rcm)

# Tuned random forest classifier  
Rtpredict.test <- predict(rfm1, test)
(Rtcm <- table(Rtpredict.test, test$Survived))
confusionMatrix(Rtcm)

# Random forest boosting classifier
Fpredict.test <- predict(mod.gbm, test)
Fcm <- table(Fpredict.test, test$Survived)
confusionMatrix(Fcm)

#7. Compare accuracy and misclassification error of predicted models based on 
# "test" data to decide the "best" model

# Comparing all the model, random forest boosting classifier have higher 
# accuracy which is 0.8201 and less misclassification error

#8. Write a reflection on your own word focusing on "what did I learn from this assignment?"

# 1. Data Preparation: I learned the importance of handling missing values and 
# converting variables into appropriate formats before building models.

# 2. Logistic Regression: I gained knowledge on fitting logistic regression models, 
# interpreting coefficients, and checking multicollinearity using VIF.

# 3. Classifier Models: Explored various classifiers such as knn, ANN, Naive Bayes, 
# SVM, Decision Trees, Bagging, Random Forests, Tuned RF, and RF Boosting.

# 4. Evaluation Metrics: Used confusion matrices and accuracy to assess the 
# performance of classifier models.

# 5. Model Comparison: Compared the accuracy and misclassification error of 
# different models to select the best one.

# 6. Iterative Process: Emphasized the iterative nature of model building, 
# evaluation, and refinement.

# 7. Practical Skills: Acquired hands-on experience in data preparation, model 
# fitting, interpretation, and evaluation.

# 8. Foundation for ML: Developed a strong foundation for further exploration in 
# machine learning and predictive modeling.
