set.seed(1)

#generate sample data
x <- rnorm(500)
y <- x + rnorm(500)


plot(cars)
lines(lowess(cars), col="green", lwd=4)
str(cars)

my_ts <- ts(matrix(rnorm(500), nrow = 500, ncol=1), start = c(1950,1), frequency = 12)
#ts = time series

my_dates <- seq(as.Date("2005/1/1"), by="month", length=50)
my_factor <- factor(mtcars$cyl)

fun <- function(x) x^2
par(mfrow = c(2,3)) #2x3 plots

my_ts
my_dates
my_factor
fun

plot(x,y, main="Scatterplot")
plot(my_factor, main="Barplot")
plot(my_factor, rnorm(32), main="Boxplot")
plot(my_ts, main="Time series")
plot(my_dates, rnorm(50), main="Time based plot")
plot(fun, 0, 10, main="Plot as a function")

par(mfrow = c(1,1))
