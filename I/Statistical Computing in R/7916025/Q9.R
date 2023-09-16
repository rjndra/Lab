#9 
# Load libraries
library(caTools)   # For splitting data
library(e1071)     # For Naive Bayes classifier
library(caret)     # For confusion matrix and model evaluation

# Load mtcars dataset
data(mtcars)

#a 
set.seed(7916025)  
ind = sample(c(1,2),nrow(mtcars),replace = T, prob = c(0.7,0.3))
train_9 <- mtcars[ind == 1,]
test_9 <- mtcars[ind == 2,]

# b
# Logistic Regression Model
lm.model <- glm(am ~ mpg + disp + hp + wt, data = train_9, family = binomial)

# Naive Bayes Classification Model
nb.model <- naiveBayes(am ~ mpg + disp + hp + wt, data = train_9)


# c
test_9$pred_lm <- predict(lm.model, newdata = test_9, type = "response")
test_9$pred_lm <- factor(ifelse(test_9$pred_lm > 0.5, 1, 0), levels = c(0, 1))

test_9$pred_nb <- predict(nb.model, newdata = test_9)

# Interpretation: 


# d
# Confusion matrix and evaluation for Logistic Regression Model
confusion_matrix_lm <- confusionMatrix(table(test_9$pred_lm, test_9$am))
sensitivity_lm<- confusion_matrix_lm$byClass[1]
specificity_lm <- confusion_matrix_lm$byClass[2]


# Confusion matrix and evaluation for Naive Bayes Model
confusion_matrix_nb <- confusionMatrix(table(test_9$pred_nb, test_9$am))
sensitivity_nb <- confusion_matrix_nb$byClass[1]
specificity_nb <- confusion_matrix_nb$byClass[2]

# e
cat("Logistic Regression Model:\n")
cat("Confusion Matrix:\n")
print(confusion_matrix_lm$table)
cat("\nSensitivity:", sensitivity_lm, "\n")
cat("Specificity:", specificity_lm, "\n\n")

cat("Naive Bayes Model:\n")
cat("Confusion Matrix:\n")
print(confusion_matrix_nb$table)
cat("\nSensitivity:", sensitivity_nb, "\n")
cat("Specificity:", specificity_nb, "\n\n")
