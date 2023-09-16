library(readr)

titanic <- read_csv("D:\\R programming runs\\Class\\titanic.csv")

View(titanic)

#Data wrangling

data <- titanic[, -3]
str(data)

data$Pclass <- as.factor(data$Pclass)
data$Sex <- as.factor(data$Sex)

model.full <- glm(Survived ~ ., data=data, family = binomial)

summary(model.full)                  

library(ggplot2)

ggplot(data, aes(x=Age, y= Survived)) + 
  geom_point() +
  stat_smooth(method="glm", family="binomial", se=FALSE)


#prediction
predict <- predict(model.full, type="response")

#prediction to bindary variable
predicted.fm <- as.numeric(ifelse(predict>0.5, 1, 0))

#confusion matrix
(cm <- table(predicted.fm, titanic$Survived))

(accuracy <- sum(diag(cm))/ sum(cm))

(error <- 1-accuracy)

(sensitivity <- cm[1,1]/(cm[1,1]+cm[2,1]))

(FNR <- 1-sensitivity)

(specificity <- cm[2,2]/(cm[2,1]+cm[2,2]))

(FPR <- 1-specificity)


#Confusion matrix and diagnostic accuracy from caret
library(caret)

predicted <- factor(ifelse(predict > 0.5, 1, 0))

reference <- factor(data$Survived)

confusionMatrix(predicted, reference)



#Receiver Operating Characteristic(ROC) curve of full model

#ROCR curve