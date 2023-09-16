
# a)
set.seed(7916025)
data_count = 250
age <- sample(c(18:99),data_count, replace = T)
set.seed(7916025)
sex <- as.factor(sample(c("male","female"),data_count, replace = T))
set.seed(7916025)
education_levels <- as.factor(sample(c("No education","Primary","Secondary","Beyond Secondary"),data_count,replace = T))
set.seed(7916025)
socio_economic_status <- as.factor(sample(c("Low","Medium","High"),data_count,replace = T))
set.seed(7916025)
BMI <- sample(c(14:18),data_count, replace = T)

dataset8 <- data.frame(age,sex,education_levels,socio_economic_status,BMI)



# b
plot(dataset8$age, dataset8$BMI, main = "Scatterplot of Age and Body Mass Index",
     xlab = "Age", ylab = "Body Mass Index", pch = 16, col = "blue")

# Interpretation:



# d
correlation_coefficient <- cor(dataset8$age, dataset8$BMI, method = "pearson")
cat("Correlation Coefficient (Pearson):", correlation_coefficient, "\n")



# e


cor_test_result <- cor.test(dataset8$age, dataset8$BMI, method = "pearson")

# p-value of the test
p_value <- cor_test_result$p.value
cat("p-value:", p_value, "\n")

if (p_value < 0.05) {
  cat("The correlation coefficient is statistically significant at the 5% level.\n")
} else {
  cat("The correlation coefficient is not statistically significant at the 5% level.\n")
}
