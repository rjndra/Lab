best_practice <- c("Best", "practice", "of", "some", "work")

print_words <- function(sentence){
  for(word in sentence){
    print(word)
  }
}

print_words(best_practice)
print_words(best_practice[-4])
print_words(best_practice[-5])


y <- 40
if(y < 20){
  x<- "Too low"
}else{
  x <- "Too high"
}
x

check.y <- function(y){
  if(y < 20){
    print("Too low")
  }else{
    print("Too high")
  }
}

check.y(20)
check.y(10)

y <- 30
x <- ifelse(y<20, "Too low", "Too high")
x
x <- ifelse(y<20, 1, 0)  #or TRUE & FALSE
x
class(x)
factor(x)

x <- 1:99

x.cat <- ifelse(x<20, 1, ifelse(x<40, 2, 3))
x.cat

cbind(x, "Category"=x.cat)


check.temp <- function(temps){
  for(temp in temps){
    if(temp <= 0){
      print("freezing")
    }else if(temp <= 10){
      print("cold")
    }else if(temp <= 20){
      print("cool")
    }else if(temp <= 30){
      print("warm")
    }else{
      print("hot")
    }
  }
} 

#make it work
temp <- 10:50
check.temp(temp)



#avoid using loops, try using apply, lapply, sapply, vapply


# apply takes vector or matrix as input and applies a function in 
# each row or column and output in scalar
# Apply sum function to each column of a matrix
matrix_data <- matrix(1:12, nrow = 3)
result <- apply(matrix_data, 2, sum)   # 2 le column sum garo....1 le row sum garo
print(result) 


# takes list as input and output list

# Using lapply to apply the sqrt function to each element of a list
my_list <- list(1, 4, 9, 16)
result <- lapply(my_list, sqrt)
print(result)  # Output: [[1]] 1 [[2]] 2 [[3]] 3 [[4]] 4


# takes list as input and output vector
# Using sapply to apply the sum function to each element of a list
my_list <- list(a = 1:3, b = 4:6, c = 7:9)
result <- sapply(my_list, sum)
print(result)  # Output: a  b  c  6 15 24


# same as sapply but we can specifiy what to output
# Using vapply to apply the mean function to each element of a list with a specified output type
my_list <- list(a = 1:3, b = 4:6, c = 7:9)
result <- vapply(my_list, mean, numeric(1))
print(result)  # Output: a  b  c  2  5  8

