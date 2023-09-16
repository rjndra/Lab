am.freq <- table(mtcars$am)
#automatic or manual
#?mtcars
am.freq


#two sample - 
#Assumptions
  # 1. Dependent variable must be normally distributed 
  # 2. Variance by groups are equal
    # H0: student t-test says it will be equal   - in R var.test
    # H1: inequal - welch t-test   - 

#assumption 1  - category wise normal dekhaunu paro

library(dplyr)

am.0 <- with(mtcars, mpg[am==0])
am.1 <- mtcars %>% filter(mpg, am == 1)

mean(am.0)
mean(am.1)

shapiro.test(am.0)
shapiro.test(am.1)
 #both p-val > 0.05 so normally distributed


#Assum 2

var.test(mpg ~ am, data= mtcars)
# F = 0.38 > 0.05 so using Ho

t.test(mtcars$mpg ~ mtcars$am, var.equal = TRUE )
# p-value < 0.05

summary(lm(mtcars$mpg ~ mtcars$am))
#lm =linear model


#proportion test

prop.test(am.freq, length(mtcars))
prop.test(19, 32)
# p > 0.05 so accepted
