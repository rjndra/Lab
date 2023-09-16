# 6. Open the R studio and do the followings wit R script and knit HTML output
# a) What happens when 4L is multiplied by 3.2?
# b) What happens when 4L is multiplied by 2L?
# c) Define blood with 0, 0, A, A, B, B and check its type and attributes with your comments
# d) Define x with 1,2,NA,8,3,NA,3 and get its mean with or without pipes.
# e) Get the first and sixth elements of x using sub setting codes and its explanation


# 7. Do the following in R studio and with R script to knit HTML output
# a) Define an object "rating" with 9, 2, 5, 8, 6, 1, 3. 2, 8, 4, 6, 8, 7, 1, 2, 6, 10, 5, 6, 9, 6, 2, 4, 7
# b) Replicate the given table obtained from SPSS software for the rating object in R

# Valid 	Frequency	Percent	Valid Percent	Cumulative Percent
# 1	      2	        8.3	    8.3	          8.3
# 2	      4	        16.7	  16.7	        25.0
# 3	      1	        4.2	    4.2	          29.2
# 4	      2	        8.3	    8.3	          37.5
# 5	      2	        8.3	    8.3	          45.8
# 6	      5	        20.8	  20.8	        66.7
# 7	      2	        8 3	    8.3	          75.0
# 8	      3	        12.5	  12.5	        87.5
# 9	      2	        8 3	    8.3	          95.8
# 10	    1	        4.2	    4.2	          100.0
# Total	  24	      100	    100.0	

rating <- c(9, 2, 5, 8, 6, 1, 3, 2, 8, 4, 6, 8, 7, 1, 2, 6, 10, 5, 6, 9, 6, 2, 4, 7)
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
# 8. Use the "air quality" data as AQ to do following in R Studio with R script to knit HTML output:
# a) Replace missing values of Ozone variable with the best measure of central tendency
# b) Create a Date variable in AQ using Month and Day variable for year 2022.
# c) Create line plot of "Ozone" variable with "Date" as the row index and interpret it carefully
# d) Get class intervals of the cleaned Ozone variable using range, its square root and zero rounding
# e) Get frequency distribution (n and %) of Ozone variable class intervals and interpret it carefully


  
# 9. Do the following in R Studio with tidyverse package using R Script to knit HTML output
# a) Define a tibble having country, year, cases and population variables with 100 random data each
# b) Transform the cases variable as log of cases (LnCase) and population variable as log of population (LnPop)
# c) Create scatter plots of 1. Cases and population, 2. LnCase and population, 3. Cases and LnPop and 4.LnCase and LnPop in a single graph window with base R plot code and interpret it carefully

# OR

# Load the "igraph" package in R studio and do the basic SNA as follows with R script and HTML output:
# a) Define g as graph object with (1,2,2,3,3,4,4,1) as its elements
# b) Plot g with node color as green, node size as 30, link color as red and link size as 5 and interpret it
# c) Plot the g as undirected arguments and interpret it carefully
# d) Plot g with seven nodes and interpret it carefully
# e) Get degree, closeness and betweenness of g and interpret them carefully.

# 10. Use the cleaned "AQ" file in R studio and do as follows with R Scripts and HTML outputs:
# a) Get reference range of "Ozone" variable using mean and standard deviation
# b) Plot histogram of "Ozone" variable and show the outliers of "Ozone" with reference range limits
# c) Get reference range of "Ozone" variable using median and inter-quartile range
# d) Plot boxplot of "Ozone" variable and show the outliers of "Ozone" with reference range limits
# e) Write a summary of the results obtained from the histogram and boxplot

# OR

# 10. Do as follows in R Studio and do as follows with R script and HTML outputs:
# a) Open R and then go to Help and Manuals if PDF and open 'An Introduction to R' file
# b) Import this pdf file in R using "pdftools" package
# c) Perform pre-processing and create corpus® afterwards
# d) Find the most frequent terms and create histogram of the most frequent 
# e) Create word cloud of the corpus, color it using rainbow or R Color Brewer package 
# f) Perform topic modelling and interpret the result carefully


# Note: Save the knitted HTML files of Group B questions with your name/roll number!