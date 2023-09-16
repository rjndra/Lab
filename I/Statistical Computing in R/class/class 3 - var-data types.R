#1. Numeric (integer)
class(2)
class(2L)
#[1] "integer"
class(2L+4L)
#[1] "integer"
2L
#2
2L + 4L
#[1] 6

#2. Character
x <- "data"
x
#[1] "data"
class(data)
#[1] "function"
nchar(x)
#[1] 4

class(x)
#[1] "character"
y <- factor("data")
y
#[1] data
#Levels: data

class(y)
#[1] "factor"
nchar(y)
#Error in nchar(y) : 'nchar()' requires a character vector

gender <- factor(c("male", "female", "female", "female", "male"))
class(gender)
typeof(gender)
unclass(gender)
#2 1 1 1 2 as sorted with alphabetical order so female is 1
attributes(gender)


#3. Date

date1 <- as.Date("2023-03-29")
date1

date2 <- as.POSIXct("2023-03-29 06:30")
date2


date3 <- as.Date("29-03-2023", "%d-%m-%Y")
date3

Sys.time()
Sys.Date()


#4. Logical
TRUE
FALSE
TRUE * 5
FALSE * 6
"date" < "datz"