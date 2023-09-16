str(mtcars)

#1-sample z-test can't be directly used to mpg. We need to see if they are normally distributed
#Assumptions
  # 1. Dependent variable is normally distributed
    # a. Graphical (suggestive) -> qqplot
    # b, Informational(Confirmatory) -> n=32, s-w test(shapiro test)
  # 2. let(claim) mew = 20 (mpg) with sigma (s.d.) = 2 (taking 10% of mean)


qqnorm(mtcars$mpg)
qqline(mtcars$mpg)
# not normal as points in x of 1 & 2 are deviated
# not normal so using non-parametric test

shapiro.test(mtcars$mpg)
# w= 0.94756 & p-value = 0.1229 (>0.05)
# p >0.05 so normally distributed

# t-test works as z-test so using t-test instead of z-test here
t.test(mtcars$mpg)

z <- function(var, mew, sd){
  # x_bar = x(bar) i.e. mean
  # mew = sample mean
  # sd (sigma) = standard deviation
  
  x_bar <- mean(var)
  n <- length(var)
  
  z = (x_bar - mew) / (sd/sqrt(n))
  print(z)
}

z <- z(mtcars$mpg, 20, 2)

pnorm(z)
1-pnorm(z)
(1-pnorm(z)) * 2
#determine which to use

t.test(mtcars$mpg, mu=20)
t <- 0.08506

(1 - pnorm(t) ) * 2
# this is equal to p-value of t-test  > 0.05
# so it's normal
