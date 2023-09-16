#positive value means positive lienar relationship & negative values means negative linear relationship
#0 means no linear relationship

plot(mtcars$wt, mtcars$mpg)
#abline(mtcars$wt, mtcars$mpg)

cov(mtcars$wt, mtcars$mpg)
#-5.11 so negative linear relationship
?mtcars$wt


cor(mtcars$wt, mtcars$mpg)
#-0.86

# low degree < 0.25
# medium degree 0.25-0.75
# high degree > 0.77


#lm1 (wt, mpg )
#wt lb to kg
mtcars$wt2 <- mtcars$wt * 0.45359237


#intercept is a & 2nd var is b in y = a + bx i.e. mx+c
# intercept value is 37.28 i.e. average mpg & -5 in b means mpg degcreases as wt increases