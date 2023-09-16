mtcars

str(mtcars)
table(mtcars$cyl)

cyl.factor <- as.factor(mtcars$cyl)
cyl.factor

hist(mtcars$mpg)
barplot(mtcars$cyl)

barplot(cyl.factor)
# error - height must be a vector or matrix
plot(cyl.factor)
#plot to get barplot of factor

barplot(table(mtcars$cyl))

table(mtcars$gear)
barplot(table(mtcars$gear))

barplot(table(mtcars$carb))

table(mtcars$am)

mtcars$mpg
barplot(mtcars$mpg)
#mpg is continuos so we need to modify the beans in barplot
table(mtcars$mpg)
range(mtcars$mpg)

range_diff <- 33.9-10.4
i <- round(sqrt(range_diff))

breaks = c(10,15,20,25,30,35) #or
breaks = seq(10,35, by=5)
mpg.bin <- cut(mtcars$mpg, breaks, labels = c("10-15", "15-20", "20-25", "25-30", "30-35"))

table(mpg.bin)

barplot(table(mpg.bin))
hist(mtcars$mpg)
#hist directly creates breaks of 5 BTS & for barplot we did it manually
#hist shows for continuous & barplot is with range

hist(mtcars$mpg)
abline(v=mean(mtcars$mpg), lwd=3, lty=2)

qqline(mtcars$mpg, col="red")
plot(density(mtcars$mpg))


hist(mtcars$mpg)
abline(v=median(mtcars$mpg), lwd=3, lty=2)

cumsum(mtcars$mpg)
plot(cumsum(mtcars$mpg))
?cumsum

cummax(mtcars$mpg)
plot(cummax(mtcars$mpg))



cummin(mtcars$mpg)
plot(cummin(mtcars$mpg))

lines(cummin(mtcars$mpg), cummax(mtcars$mpg))
abline(v=median(mtcars$mpg), lwd=3, lty=2)



hist(mtcars$mpg, probability = TRUE) #probabilty = true so that it will use Density instead of frequency
                                       # lines shows with density so we use density for histogram
lines(density(mtcars$mpg))

#bardiagram shows in density & histogram shows in frequency


hist(mtcars$mpg)
table(mtcars$mpg)
#it has multiple high frequency so to calculate mode we use 3*median - 2*mean
mode <- 3*median(mtcars$mpg) - 2*mean(mtcars$mpg)
mode

#from table 17.3 has 1 frequency but from the mode it shows the mode of 17.41875 which can be interpret as wrong. So, 
# we say that the output mode is from the statistics.

abline(v=mode)


#boxplot gives median but no any graph gives mean



mtcars$mpg

hist(mtcars$mpg, col="lightblue")

abline(v=mean(mtcars$mpg), lwd=3, col="red")
abline(v=median(mtcars$mpg), lwd=3, col="green")
abline(v=mode, lwd=3, col="orange")
legend("topright", legend=c("mean", "median", "mode"), col=c("red", "green", "orange"), lwd=3) 

#scatterplot with abline
plot(mtcars$mpg, mtcars$wt, pch=16, xlab="MPG", ylab="Weight")
abline(v=15, col="red", lwd=2)
abline(v=30, col="red", lty=2)
#plot is wrong as weight is in y-axis & mpg is in x-axis. Dependent variable must be in y-axis


#scatterplot with mean+- 1 * sd of y-variable

plot(mtcars$wt, mtcars$mpg, pch=16, xlab="Weight", ylab="MPG", ylim=c(0,40))
abline(h=mean(mtcars$mpg), lwd=2, col="red")
abline(h=mean(mtcars$mpg)+1*sd(mtcars$mpg), lwd=3, lty=2, col="blue")
abline(h=mean(mtcars$mpg)-1*sd(mtcars$mpg), lwd=3, lty=2, col="blue")
#ouliers = mean+-2*sd
abline(h=mean(mtcars$mpg)+2*sd(mtcars$mpg), lwd=3, lty=2, col="green")
abline(h=mean(mtcars$mpg)-2*sd(mtcars$mpg), lwd=3, lty=2, col="green")


library(tidyverse)

table(mtcars$mpg)
mtcars
mtcars %>% filter(mpg > mean(mpg)+2*sd(mpg)) %>% rownames(mpg)


plot(mtcars$hp, mtcars$disp, pch=16, xlab="Horse Power", ylab="Displacement")
abline(lm(mtcars$disp ~ mtcars$hp), col="red", lwd=3)
lines(lowess(mtcars$hp, mtcars$disp), col="green", lwd=4)
#lowess = Locally weighted scatterplot smoothing

