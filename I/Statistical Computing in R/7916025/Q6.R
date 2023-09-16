
# a)
set.seed(7916025)
data_count = 150
age <- sample(c(18:99),data_count, replace = T)
set.seed(7916025)
sex <- as.factor(sample(c("male","female"),data_count, replace = T))
set.seed(7916025)
education_levels <- as.factor(sample(c("No education","Primary","Secondary","Beyond Secondary"),data_count,replace = T))
set.seed(7916025)
socio_economic_status <- as.factor(sample(c("Low","Medium","High"),data_count,replace = T))
set.seed(7916025)
BMI <- sample(c(14:18),data_count, replace = T)

dataset6 <- data.frame(age,sex,education_levels,socio_economic_status,BMI)

# b)
library(ggplot2)

# Sub-divided bar diagram of BMI by sex
ggplot(dataset6, aes(x = sex, y = BMI, fill = sex)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(title = "Sub-divided Bar Diagram of BMI by Sex",
       x = "Sex", y = "BMI")

# Sub-divided bar diagram of BMI by Socio Economic status
ggplot(dataset6, aes(x = socio_economic_status, y = BMI, fill = socio_economic_status)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(title = "Sub-divided Bar Diagram of BMI by Socio_Eco_Status",
       x = "Sex", y = "BMI")


# c)

# Multiple bar diagram of age variable with sex and education_levels variables
ggplot(dataset6, aes(x = sex, y = age, fill = education_levels)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(title = "Multiple Bar Diagram of Age by Sex and Education Levels",
       x = "Sex", y = "Age")

# d)
# Box plot of age
ggplot(dataset6, aes(x = "", y = age)) +
  geom_boxplot() +
  labs(title = "Box Plot of Age", x = NULL, y = "Age")

# Box plot of BMI
ggplot(dataset6, aes(x = "", y = BMI)) +
  geom_boxplot() +
  labs(title = "Box Plot of BMI", x = NULL, y = "BMI")

# e)
# Histogram of age
ggplot(dataset6, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Histogram of Age", x = "Age", y = "Frequency")

# Histogram of BMI
ggplot(dataset6, aes(x = BMI)) +
  geom_histogram(binwidth = 2, fill = "lightgreen", color = "black") +
  labs(title = "Histogram of BMI", x = "BMI", y = "Frequency")


