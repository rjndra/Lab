

#Hint

# Supervised Learning:

ind = sample(2, nrow(data), replace = T, prob = c(0.8,0.2))
train = data[ind == 1,]
test = data[ind == 2,]
lm <- lm(dependnent ~ independent variable, data = train)


#Data Partition
ind <- sample(2, nrow(plot.data), replace = T, prob = c(0.7,0.3))
trainset <- plot.data[ind==1,] 
testset <- plot.data[ind==2,]

#Neural Network
library(neuralnet)
#NN model
nn <- neuralnet(Deaths_total ~ SN,
                data=trainset,
                hidden=c(3,1),
                linear.output=FALSE,
                threshold=0.01)
#Plot the NN model 
plot(nn)

#Test the resulting output
temp_test <- subset(testset, select = c("SN"))
head(temp_test)

#Prediction using compute for NN model with neuralnet package!
nn.results <- compute(nn, temp_test)

#Model validation
results <- data.frame(actual = testset$SN, prediction = nn.results$net.result)
results

#Model Accuracy
deviation=((results$actual- results$prediction)/results$actual)
(accuracy=abs(mean(deviation))) 
(error=1-accuracy)

#Binary Logistic Regression
model.full <- glm(Survived ~., data=data, family = binomial)
summary(model.full)
# Intercept and first five variables are statistically significant!
exp(coef(model.full)) 

# plot for a predictor (age)
(mfpr2 <- 1 - (model.full$deviance/model.full$null.deviance))

library(ggplot2)
ggplot(data, aes(x=Age, y=Survived)) + 
  geom_point() +
  stat_smooth(method="glm", family="binomial", se=FALSE)

# VIF
library(car)
vif(model.full)

#Accept for VIF < 2

#Prediction
predict <- predict(model.full, type="response")
#Prediction to binary variable predcted.fm <-
as.numeric(ifelse(predict>0.5,1,0))
# Confusion matrix
(cm <- table(predcted.fm, data$Survived))

# Sensitivity, Specificity, Accuracy
(accuracy <- sum(diag(cm))/sum(cm))
(error <- (1 - accuracy))
(sensitivity <- cm[1,1]/(cm[1,1]+cm[2,1]))
(FNR <- 1 - sensitivity)
(specificity <- cm[2,2]/(cm[2,1]+cm[2,2]))
(FPR <- 1 - specificity)

#Confusion Matrix and diagnostic accuracy from caret package
library(caret)
predicted <- factor(ifelse(predict>0.5,1,0))
reference <- factor(data$Survived)
confusionMatrix(predicted, reference)


# Bagging
library(ipred)
MBTree <- bagging(NSPF~LB+AC+FM, data = train, coob=T)
print(MBTree)