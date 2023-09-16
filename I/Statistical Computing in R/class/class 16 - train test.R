data <- mtcars

set.seed(16)

ind <- sample(2, nrow(mtcars), replace=T, prob = c(0.7,0.3))

train.data <- data[ind==1,]

test.data <- data[ind==2,]

lm4 <- lm(mpg~wt, data=train.data)

library(dplyr)
library(caret)

predictions <- lm4 %>% predict(test.data)

data.frame(R2 = R2(predictions, test.data$mpg),
           RMSE = RMSE(predictions, test.data$mpg),
           MAE = MAE(predictions, test.data$mpg))

summary(lm4)

MSE <- mean(lm4$residuals^2)

RMSE <- sqrt(MSE)

#check for train data & check for wt=6
new.wt <- data.frame(wt = 6)
predict(lm4, newdata = new.wt)
############################################################ 

#LOOCV - leave one out cross validation
train.control <- trainControl(method = "LOOCV")

#train the model
model1 <- train(mpg~wt, data=train.data, method="lm", trControl = train.control)
#model fit in train data & validate with test data

#summarise
print(model1)

#validate with test data
predictions1 <- model1 %>% predict(test.data)

data.frame(R2 = R2(predictions1, test.data$mpg),
           RMSE = RMSE(predictions1, test.data$mpg),
           MAE = MAE(predictions1, test.data$mpg))




############################################################ 

# k-fold cross validation

train.control <- trainControl(method="cv", number = 10)

#train model
model2 <- train(mpg~wt, data=train.data, method="lm", trControl = train.control)

#summarise
print(model2)


#validate with test data
predictions2 <- model2 %>% predict(test.data)

data.frame(R2 = R2(predictions2, test.data$mpg),
           RMSE = RMSE(predictions2, test.data$mpg),
           MAE = MAE(predictions2, test.data$mpg))


############################################################ 

# repeated k-fold cross validation
train.control <- trainControl(method="repeatedcv", number = 10, repeats = 3)

#train model
model <- train(mpg~wt, data=train.data, method="lm", trControl = train.control)

#summarise
print(model)


#validate with test data
predictions3 <- model %>% predict(test.data)

data.frame(R2 = R2(predictions3, test.data$mpg),
           RMSE = RMSE(predictions3, test.data$mpg),
           MAE = MAE(predictions3, test.data$mpg))


############################################################

#all different model of training maa different aayo but test maa same aayo
#small data vayera same aako ho...large data maa alik farak aaunu sakxa

# jati ramro model tyati ramro test data aaudaina....sabai check garnu parxa
# jun test data ko R2 besi aauxa tyo model use garne i.e. minimum error 1-R2

############################################################ 


#test data ko R2 vanda train data ko R2 dherai besi ayo vane either overfitting vayo 
#or non-linear data maa linear model use vayo
# should be test R2 > train R2