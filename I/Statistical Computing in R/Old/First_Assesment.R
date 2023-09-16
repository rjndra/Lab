
# First Assessment 1

# 7. Do the following in R studio and with R script to knit HTML output:
# a) Load the in-built "air quality" data available in base R as AQ object
AQ <- airquality

# b) Check the structure of AQ and explain class of each variable
str(AQ)

# c) Replace missing values of Ozone variable with median of this variable
ozone.median = median(AQ$Ozone, na.rm = TRUE)
AQ$Ozone <- ifelse(is.na(AQ$Ozone), ozone.median, AQ$Ozone)

# d) Replace missing values of Solar. R variable with mean of this variable
solar.R.mean <- mean(AQ$Solar.R, na.rm = T)
AQ$Solar.R <- ifelse(is.na(AQ$Solar.R), solar.R.mean, AQ$Solar.R)

# e) Create "Date" variable on AQ object using "Month" and "Day" variables for year
AQ$Date <- as.Date(paste("2020",AQ$Month, AQ$Day) ,"%Y%m%d")

# 8. Use the cleaned "AQ" object to do following in R Studio with R script to knit HTML
# a) Create line plot of "Temp" with "Day" as the row index and interpret it carefully
plot(AQ$Date,
     AQ$Temp,
     type = "l")

plot(AQ$Day,
     AQ$Temp,
     type = "l")

# b
qqline(AQ$Temp, col="red")


# b) Create bar plot of "Temp" variable after defining class intervals systematically
AQ <- airquality
(max.temp <- max(AQ$Temp))
(min.temp <- min(AQ$Temp))
(temp.range <- max.temp - min.temp)
(interval <- round(sqrt(temp.range)))

t <- ceil(max.temp/interval)

(breaks <- seq(min.temp,max.temp,by=interval))
(cyl.bin <- cut(AQ$Temp,breaks))
barplot(table(cyl.bin),
        main = "Barplot of Air Quality",
        xlab = "Temperature",
        ylab = "Frequency")

# c) Create histogram of "Temp" variable and ompare it with the bar plot of "Temp*
hist(AQ$Temp)

# d) Plot Normal Q-Q plot of "Temp" variable and interpret it carefully
AQ <- airquality
qqnorm(AQ$Temp)

# e) Create a scatter plot of "Temp" and "Wind" variables and interpret it 
# carefully 
plot(AQ$Temp, AQ$Wind)

# Qn no.9

library(tidyverse)
country <- c("Nepal", "Afgan", "Bhutan", "India","Pakistan","Sirlanka","Burma","USA","UK","Canada")
year <- c(2019,2019,2019,2019,2019,2019,2019,2019,2019,2019)
cases <- sample(200:5000,10, replace=T)
population <- sample(10000:500000,10,replace = T)

tibble1 <- tibble(
  country,
  year,
  cases,
  population
)


tibble2 <- tibble1 %>% 
  pivot_longer(
    cols = c('year','cases','population'),
    names_to = "key",
    values_to = "value"
  )
tibble2

LnCase <- log(tibble1$cases)
LnPop <- log(tibble1$population)

par(mfrow = c(2,2))

plot(tibble1$cases,tibble1$population)

plot(LnCase,tibble1$population)

plot(tibble1$cases,LnPop)

plot(LnCase,LnPop)

par(mfrow = c(1,1))
plot(LnCase,LnPop)

## 9 OR
# Assuming "airquality" is the dataset with "Temp" column

# Calculate the mean and standard deviation of the "Temp" variable
(temp_mean <- mean(AQ$Temp, na.rm = TRUE))
(temp_sd <- sd(AQ$Temp, na.rm = TRUE))

# Calculate the lower and upper bounds of the reference range
lower_bound <- temp_mean - (2 * temp_sd)
upper_bound <- temp_mean + (2 * temp_sd)

# Print the results
cat("Reference Range (Mean ± 2 * Standard Deviation):\n")
cat("Lower Bound:", lower_bound, "\n")
cat("Upper Bound:", upper_bound, "\n")

# Plot the histogram of "Temp" variable with outliers
hist(AQ$Temp, main = "Histogram of Temperature",
     xlab = "Temperature", ylab = "Frequency", col = "lightblue", border = "black")

# Add vertical lines for the lower and upper bounds of the reference range
abline(v = c(lower_bound, upper_bound), col = "red", lwd = 2)

# 9c
# Calculate the mean and standard deviation of the "Temp" variable
(temp_median <- median(AQ$Temp, na.rm = TRUE))
(temp_IQR <- IQR(AQ$Temp))

# Calculate the lower and upper bounds of the reference range
median_lower_bound <- temp_median - (2 * temp_IQR)
median_upper_bound <- temp_median + (2 * temp_IQR)

# Print the results
cat("Reference Range (Median ± 2 * IQR):\n")
cat("Lower Bound:", median_upper_bound, "\n", col = "blue")
cat("Upper Bound:", median_lower_bound, "\n", col = "blue")

# Plot the histogram of "Temp" variable with outliers
hist(AQ$Temp, main = "Histogram of Temperature",
     xlab = "Temperature", ylab = "Frequency", col = "lightblue", border = "black")

# Add vertical lines for the lower and upper bounds of the reference range
abline(v = c(median_upper_bound, median_lower_bound), col = "blue", lwd = 2)


boxplot(AQ$Temp)

outliers_median_iqr <- AQ$Temp[AQ$Temp < median_lower_bound | AQ$Temp > median_upper_bound]
if (length(outliers_median_iqr) > 0) {
  points(1, outliers_median_iqr, col = "red", pch = 20, cex = 1.5)
  legend("topright", legend = "Outliers (Median ± 1.5 * IQR)", col = "red", pch = 20, bty = "n")
}

# 10. Load the "graph" package in R studio and do the basic SNA as follows 
# with R script and HTML output:
# a) Define g as graph object with (1,2) as its elements
library(igraph)
g <- graph(c(1,2))

# b) Plot the g and interpret it carefully
plot(g)

# c) Define gl as graph object with 
# ("R", "S", "S", "T", "T", "R", "R", "T", "U", "S") 
# as its elements
gl <- graph(c("R", "S", "S", "T", "T", "R", "R", "T", "U", "S"))

# d) Plot gl with node color as green, node size as 30, link color as red and 
# link size as 5 and interpret it
plot(gl,
     vertex.color = "green",
     vertex.size = 30,
     edge.color = "red",
     edge.size = 5)

# e) Get degree, closeness and betweenness of gl and interpret them carefully.
degree(gl)
closeness(gl)
betweenness(gl)

# 10 OR
# Do as follows in R Studio and do as follows with R script and HTML outputs:
# a) Open R and then go to Help and Manuals if PDF and open 
# "An Introduction to R" file

# Added file from Help to Documents directory as per ease in mac device.

# b) Import this pdf file in R using "paftools" rackage
setwd("~/Documents")
library(readr)
library(pdftools)
pdf_files <- list.files(pattern = ".pdf")

pdfText <- pdftools::pdf_text("An Introduction to R.pdf")
pdfText
# c) Perform pre-processing and create 'corpus atierwards

library(tm)

text <- paste(pdfText)

text <- tolower(text)

text <- removeNumbers(text)

text <- removePunctuation(text)

myStopwords <- setdiff(stopwords("english"), c("r", "big"))
text <- removeWords(text,myStopwords)

library(tm)
myCorpus <- Corpus(VectorSource(text))


# d) Find the most frequent terms and create histogram of the most frequent

myTdm <- TermDocumentMatrix(myCorpus, control=list(wordLengths=c(1,Inf))) 
str(myTdm)

(freq.terms <- findFreqTerms(myTdm, lowfreq=10))

text.matrix <- as.matrix(myTdm[freq.terms,])
text.matrix

hist(text.matrix)

# e) Create word cloud of the corpus, color it using rainbow or RColorBrewer 
# package
library(wordcloud)
m <- as.matrix(myTdm)
freq <- sort(rowSums(m), decreasing=T)
wordcloud(words=names(freq),
          freq=freq,
          min.freq=4,
          random.order=F,
          colors = rainbow(7))

# f) Perform topic modelling and interpret the result carefully
library(topicmodels)
set.seed(25)
myLda <- LDA(as.DocumentTermMatrix(myTdm), k=5) #5 topics
terms(myLda, 3)

# Note: Save the R scripts and knitted HTML files of Group B questions with 
# your name/roll number!
