library(caret)

lm1 <- lm(mpg~wt, data=mtcars)

#predict for wt = 6 slide dekhi copy garne

#saving predicted values
data <- data.frame(pred=predict(lm1), actual = mtcars$mpg)
head(data)

mean((data$actual - data$pred)^2)

R2 <- R2(data$pred, data$actual)
#R square = SSR/TSS 
#Error = 1 - R2


RMSE <- RMSE(data$pred, data$actual)
#Root of MSE

MAE <- MAE(data$pred, data$actual)

summary(lm1)

MAPE <- mean(abs(data$actual - data$pred)/data$actual)*100

#split train test either 70-30 or 80-20