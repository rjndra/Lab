
x <- c(1:10)
x
y <- c(5:-5)
y
y * 2
length(x)
length(y)
x * y
x + y


x <- 1:10
x
z <- c(1,2)
z
x + z
#1+1, 2+2, 3+1, 4+2, 5+1, 6+2, ..... works if it could be paired if c(1,2,3) will give error


apropos("mea*")

zchar <- c("Hockey", NA, "Cricket")
zchar
nchar(zchar)  

z <- c(1,2,NA,8,3,NA,3)
mean(z)
#NA
mean(z,na.rm = TRUE)
#3.4


z <- c(1,NULL,3)
z
is.null(z)

x <- 1:10
mean(x)

theDF <- data.frame(First = x, Second = c(1:10) )
theDF
theDF[,"First"]

array1 <- array(1:12, dim = c(2,3,2))
array1
array1[1,,]
array[1,,1]
array[,1,]
