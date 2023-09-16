# 6. Do the following in R

# a. Prepare a column vector of miles per gallon (mpg) variable with random range
#    between 10 and 50 of 500 values.
# b. Plot histogram of this "mgp" variable and interpet iterators
# c. Refine the histogram by filling the bars with "blue" color and changing number of bins to 8
# d. Add a vertical abline at the arithmetic mean of the mpg variable
# e. Plot Q-Q plot of mpg variable, add normal Q-Q line of red color on it and interpert it. 
# f. Plot density plot of mpg variable without the boarder, fill it with yellow color and interpert it.

# Step a
set.seed(07) # Setting a seed for reproducibility
mpg <- runif(500, min = 10, max = 50)

# Step b
hist(mpg)

#Interpretation:
#The histogram represents the distribution of miles per gallon (mpg) values. The x-axis shows the mpg ranges (bins), and the y-axis shows the frequency of occurrences within each bin. The histogram helps visualize the data's frequency distribution and provides an overview of the data's central tendency and spread.

# Step c
hist(mpg, col = "blue", breaks = 8)

# Step d
mean_mpg <- mean(mpg)
hist(mpg, col = "blue", breaks = 8)
abline(v = mean_mpg, col = "red", lwd = 2)


# Step e
qqnorm(mpg)
qqline(mpg, col = "red")

#Interpretation:
#The Q-Q plot (Quantile-Quantile plot) is a graphical tool used to assess if a dataset follows a normal distribution. If the points on the plot roughly follow a straight line, it indicates that the data is approximately normally distributed. Deviations from the straight line suggest departures from normality.


# Step f
density_plot <- density(mpg)
plot(density_plot, col = "yellow", border = NA)

#Interpretation:
#The density plot provides a smooth estimate of the probability density function for the miles per gallon (mpg) variable. It helps visualize the data's underlying distribution, highlighting peaks and modes. The yellow-filled area represents the estimated density of the data points.


#OR

# 6. Use ggplot2 package and do the following
# a. Define first layer of thhe ggplot object with diamond data, caret as x-axis and price as y-axis
# b. Add layer with geometric aesthetics as "point", statstics and position as "identity"
# c. Add layers with scale of y and x variable as continous
# d. Add layer with coordinate system as Cartesian
# e. Add layer with appropriate title and interpert 

library(ggplot2)

# Create a synthetic dataset (replace this with your own data)
set.seed(42)
diamond_data <- data.frame(
  caret = rnorm(100, mean = 2.5, sd = 0.5),
  price = rnorm(100, mean = 3000, sd = 500)
)

# a. Define the first layer of the ggplot object with diamond data, caret as x-axis, and price as y-axis
p <- ggplot(data = diamond_data, aes(x = caret, y = price))

# b. Add a layer with geometric aesthetics as "point", statistics, and position as "identity"
p <- p + geom_point(stat = "identity")

# c. Add layers with scales of y and x variable as continuous
p <- p + scale_y_continuous() + scale_x_continuous()

# d. Add a layer with the coordinate system as Cartesian (the default, so not necessary)

# e. Add a layer with an appropriate title and interpretation
p <- p + labs(
  title = "Scatter Plot of Price vs. Carat",
  x = "Carat",
  y = "Price"
)

# Print the plot
print(p)

#Interpretation:
#The plot shows a scatter plot of the synthetic data, where the x-axis represents the "caret" (carat) values, and the y-axis represents the "price" values. Each point on the plot represents a data point in the dataset. The plot helps visualize the relationship between the carat size and the price of diamonds. As carat size increases, the price tends to increase, indicating a positive correlation between carat and price. The title "Scatter Plot of Price vs. Carat" provides a clear description of the plot's content.


# 7 Do the following in R studio
# a. Prepare a data with 100 random observations and two variables: miles per gallon (mpg) with random range
    # between 10 and 50 and transmission gears (gear) as random binary variable (3=3 gear, 4 = four gear and 
    # and 5=five gears).
# b. Perform goodness of fit test on miles per gallon (mpg) variable to check if it follows normal distribution or not. 
# c. Perform goodness of fit test on miles per gallon (mpg) variable to check if the variances of mpg are equal
    # or not on gears variable categories.
# d. Perform the best 1-way analysis of variance test based on goodness-of-fit results with justification.
# e. Can you use this test for this data ? Interpert


# Step a
set.seed(42) # Setting a seed for reproducibility

# Generating random observations
n_obs <- 100
mpg <- runif(n_obs, min = 10, max = 50)
gear <- sample(c(3, 4, 5), n_obs, replace = TRUE)

# Creating the dataset
data <- data.frame(mpg, gear)

# Step b
# Shapiro-Wilk Test for normality
shapiro.test(data$mpg)

# Step c
library(car)
# Perform KS test to compare "mpg" distributions among "gear" categories
result <- ks.test(data$mpg[data$gear == 3], data$mpg[data$gear == 4])
result


# Step d
# One-way ANOVA to test if the means of mpg differ across gear categories
fit <- aov(mpg ~ gear, data = data)
summary(fit)


#Step e:
#The tests performed (Shapiro-Wilk, Levene's, and ANOVA) help assess the normality of the "mpg" variable, check for equal variances, and determine significant differences in means among "gear" categories. The appropriateness of the tests relies on meeting their respective assumptions for accurate interpretation.



# 8. Do the following in R 

# a. Prepare a data with 200 random observations and four variables: miles per gallon with random range
   # between 10 and 50, transmission (am) as random binary variable (0-automatic, 1-manual), weight (wt) 
   # with random range of 1 to 10 and horse power (hp) with random ranhge of 125 and 400.
# b. Divide the data into train and test dataset with 70;30 random split.
# c. Fit the supervised linear regression model for the train data
# d .Explain the model fit and BLUE coefficients for the fitted model.
# e. Predict the mpg variable in the test data, get fit indices and interpret. 


# Step a
set.seed(42) # Setting a seed for reproducibility

n_obs <- 200
mpg <- runif(n_obs, min = 10, max = 50)
am <- sample(c(0, 1), n_obs, replace = TRUE)
wt <- runif(n_obs, min = 1, max = 10)
hp <- runif(n_obs, min = 125, max = 400)

# Creating the dataset
data <- data.frame(mpg, am, wt, hp)


# Step b
set.seed(42) # Setting a seed for reproducibility
train_indices <- sample(1:n_obs, 0.7 * n_obs, replace = FALSE)
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]


# Step c
lm_model <- lm(mpg ~ am + wt + hp, data = train_data)


summary(lm_model)

# The BLUE (Best Linear Unbiased Estimators) coefficients are the estimates of the model parameters (intercept and slopes) that minimize the sum of squared residuals and are unbiased under the assumption of linear regression.


# Step e
predicted_mpg <- predict(lm_model, newdata = test_data)

# Calculate fit indices
SSE <- sum((predicted_mpg - test_data$mpg)^2) # Sum of Squared Errors
MSE <- SSE / (nrow(test_data) - 3) # Mean Squared Error
RMSE <- sqrt(MSE) # Root Mean Squared Error
R_squared <- 1 - (SSE / sum((test_data$mpg - mean(test_data$mpg))^2)) # R-squared

# Interpret the fit indices
cat("Root Mean Squared Error (RMSE):", RMSE, "\n")
cat("R-squared:", R_squared, "\n")


# 9 Do the following in R 

# a. Prepare a data with four random variables and 300 observations: miles per gallon (mpg) with random 
  # range between 10 to 50, transmission (am) as random binary variable (0-automatic, 1-manual), weight (wt)
  # with random range of 1 to 10 and horse power (hp) with random range of 125 and 400. 
# b. Divide this data into train and test datasets with 80:20 random spilts. 
# c. Fit a suoervided logestic regresstion model on train data with transmission (am) as dependent variable
# and miles per gallon (mpg), horse power (hp) and weight (wt) as independent variable.
# d. Predict the tranmission variable in the test data and interpret. 
# e. Get the confusion matrix, sensitity, specificity of the predicted model and interet. 


# Step a
set.seed(42) # Setting a seed for reproducibility

n_obs <- 300
mpg <- runif(n_obs, min = 10, max = 50)
am <- sample(c(0, 1), n_obs, replace = TRUE)
wt <- runif(n_obs, min = 1, max = 10)
hp <- runif(n_obs, min = 125, max = 400)

# Creating the dataset
data <- data.frame(mpg, am, wt, hp)

# Step b
set.seed(42) # Setting a seed for reproducibility
train_indices <- sample(1:n_obs, 0.8 * n_obs, replace = FALSE)
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]


# Step c
logistic_model <- glm(am ~ mpg + hp + wt, data = train_data, family = binomial)


# Step d
predicted_am <- predict(logistic_model, newdata = test_data, type = "response")

# Converting predicted probabilities to binary classes (0 or 1)
predicted_am_class <- ifelse(predicted_am > 0.5, 1, 0)


# Step e
# Confusion matrix
conf_matrix <- table(test_data$am, predicted_am_class)

# Sensitivity and specificity
sensitivity <- conf_matrix[2, 2] / (conf_matrix[2, 2] + conf_matrix[2, 1]) # True positive rate
specificity <- conf_matrix[1, 1] / (conf_matrix[1, 1] + conf_matrix[1, 2]) # True negative rate

# Interpret the results
cat("Confusion Matrix:\n")
print(conf_matrix)
cat("\nSensitivity (True Positive Rate):", sensitivity, "\n")
cat("Specificity (True Negative Rate):", specificity, "\n")


# The confusion matrix displays the comparison between the actual values of the transmission variable (am) in the test dataset and the predicted values by the logistic regression model. It presents the count of true positives, true negatives, false positives, and false negatives.

# Sensitivity (True Positive Rate) represents the proportion of actual "manual" (am=1) transmissions that were correctly predicted by the model. A higher sensitivity indicates that the model is good at identifying positive cases correctly.

# Specificity (True Negative Rate) represents the proportion of actual "automatic" (am=0) transmissions that were correctly predicted by the model. A higher specificity indicates that the model is good at identifying negative cases correctly.



# 10 Do the following using mtcars datasets in r

# a. Check the head and the structure of the datasets
# b. Create a "cars scale" using Principal component Analysis (PCA) model based on nine numerical
# variable with centering and scaling of the variables
# c. Based on the PCA summary resut, how many components must be extracted ? Why?
# d. Get the bi-plot of the fitted model and interpret 
# e. Improve the fitted model with VARIMAX process and interpret.


# Step a
data(mtcars)

# Check the first few rows of the dataset
head(mtcars)

# Check the structure of the dataset
str(mtcars)


# Step b
# Selecting nine numerical variables for PCA
selected_vars <- c("mpg", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear")

# Scaling the variables (centering and scaling)
scaled_data <- scale(mtcars[, selected_vars])

# Performing PCA
pca_model <- prcomp(scaled_data)


# Step c
summary(pca_model)


#In the PCA summary, you will see the standard deviations of the principal components. The proportion of variance explained by each principal component is given as well. To decide how many components to extract, you can look at the cumulative proportion of variance explained (Cumulative Proportion). Generally, it is recommended to extract components that explain a significant amount of total variance, e.g., components that contribute to a cumulative proportion of variance close to or greater than 0.85 to 0.95. The number of such components will be the number of principal components to be retained.


# Step d
biplot(pca_model)


# Step e
library(psych)

# Applying VARIMAX rotation to the PCA model
rotated_pca_model <- principal(scaled_data, nfactors = 3, rotate = "varimax")

# Getting the rotated loadings and the new biplot
rotated_loadings <- rotated_pca_model$loadings
biplot(rotated_pca_model)

# VARIMAX rotation is a technique used to improve the interpretability of the PCA results by maximizing the variance of the loadings of each principal component. It simplifies the loading structure, making it easier to identify the variables with significant contributions to each component.

# In the biplot of the rotated model, you can observe a clearer separation of variables and components, aiding in the interpretation of the PCA results.




# OR

# 10 Do the following using "USArrest" datasets in R

# a. Get the dissimilarity distance as state.dissimilarity object
# b. Fit a classical multidimentional model using the state dissimilarity object
# c. Get the summary of the model and interpret it carefully. 
# d. Get the plot of the model and interpret 
# e. Compare the model with the first tow components from the Principal componet Analysis in this data.


# Step a
data("USArrests")
state_dissimilarity <- dist(USArrests, method = "manhattan")


# Step b
classical_mds_model <- cmdscale(state_dissimilarity, k = 2)

# Step c
summary(classical_mds_model)

#The summary provides information about the dimensions of the MDS model. In this case, we specified k=2, so it shows the results for the first two dimensions. The output includes eigenvalues, proportion of variance explained by each dimension, and cumulative proportion of variance explained. The proportion of variance explained by each dimension indicates how well each dimension represents the dissimilarity distances in the original data. The cumulative proportion of variance explains the total variance represented by the model.

# Step d
plot(classical_mds_model, type = "n") # Create an empty plot
text(classical_mds_model, labels = rownames(USArrests), col = "blue") # Add labels for states

# The plot shows the positions of the states in a two-dimensional space based on the dissimilarity distances. Each point represents a state, and the proximity of the points indicates their similarity in the original data. The plot helps visualize how the states cluster based on their crime rate characteristics.

# Step e
# Perform PCA on the USArrests dataset
pca_model <- prcomp(USArrests)

# Extract the first two principal components
pca_components <- pca_model$x[, 1:2]

# Compare the positions of states from classical MDS with PCA components
plot(pca_components, type = "n", xlab = "PCA Component 1", ylab = "PCA Component 2")
text(pca_components, labels = rownames(USArrests), col = "red")


# In this step, we performed PCA on the "USArrests" dataset and extracted the first two principal components. Then, we compared the positions of states based on the classical MDS model with the positions based on the first two PCA components. The plot shows how the states are positioned in the two-dimensional space of the PCA components.

# Comparing the classical MDS plot with the PCA plot allows us to see how both methods represent the data in a reduced dimension. MDS focuses on preserving the pairwise distances, while PCA captures the variance of the original data. The interpretation and clustering patterns in the two plots may differ, depending on the characteristics of the data. Both techniques provide different perspectives on the data's structure and can be valuable for different types of analyses.
