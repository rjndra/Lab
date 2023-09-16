# it is extension of simple linear regression
# it will have more than one independent variable

str(mtcars)

lm(mpg~cyl, mtcars)
lm(mpg~disp, mtcars)
lm(mpg~hp, mtcars)
lm(mpg~drat, mtcars)
lm(mpg~wt, mtcars)
lm(mpg~qsec, mtcars)
lm(mpg~vs, mtcars)
lm(mpg~am, mtcars)
lm(mpg~gear, mtcars)
lm(mpg~carb, mtcars)


#multiple linear regression
mlr <- lm(mpg~., data = mtcars)
summary(mlr)

library(car)
vif(mlr)

#remove highest ie. disp i.e 10 vanda besi hataunu paro (VIF < 10)
# remove one var at a time
# removing disp

mlr1 <- lm(mpg~cyl+hp+drat+wt+qsec+vs+am+gear+carb, mtcars)
summary(mlr1)

vif(mlr1)

#removing cyl again
mlr2 <- lm(mpg~hp+drat+wt+qsec+vs+am+gear+carb, mtcars)
summary(mlr2)

vif(mlr2)

# Now we can interpret that wt variable is significant


# yasari one by one hernu dherai time lagxa besi variable xa vane, so we using "regularization" methods

# Common are 
#Ridge - L1 penalty
#Lasso - L2 penalty
#Elastic net regression - L1 & L2 penalty

# We will be mostlye using Lasso

