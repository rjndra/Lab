
ratings <- c("9","2","5","8","6","1","3","2","8","4","6","8","7","1","2","6","10","5","6","9","6","2","4","7")

(frequency7 <- table(ratings))

data_fre <- frequency7[1]

data7 <- data.frame(frequency7)

colnames(data7) <- c("Valid","Frequency")

data7$Percentage <- data7$Freq/sum(data7$Freq)*100

data7$Percentage <- round(data7$Percentage, digits = 2)

data7$ValidPerent <- data7$Percentage

data7$CumilativePercentage <- cumsum(data7$Percentage)

colnames(data7) <- c("Valid","Frequency","Percentage","Valid Percent","Cumilative Percent")

newRow <- c("Total",sum(data7$Frequency),100,100,NA)

data7 <- rbind(data7,newRow)

data7



# Ordering 10 in correct position
valid <- c(1:10)
frequency <- c(2,4,1,2,2,5,2,3,2,1)

data <- data.frame(valid, frequency)

data$Percentage <- data$frequency/sum(data$frequency)*100

data$Percentage <- round(data$Percentage, digits = 2)

data$ValidPerent <- data$Percentage

data$CumilativePercentage <- cumsum(data$Percentage)

colnames(data) <- c("Valid","Frequency","Percentage","Valid Percent","Cumilative Percent")

data$Valid <- as.character(data$Valid)

newRow <- c("Total",sum(data$Frequency),100,100,NA)

data <- rbind(data,newRow)

data