install.packages("dplyr")
install.packages("caret")
library(caret)
library(dplyr)



### confustion matrix format
### TP FN
### FP TN



# load data set(to be predicted)
sms_data <- read.csv("./Dataset/sms_results.csv")

# check prediction result by confustion matrix
confusionMatrix(sms_data$predict_type, sms_data$actual_type, positive = "spam")

# check predction result by simple matrix
table(sms_data$actual_type, sms_data$predict_type)

# Accuracy : 0.9755

# Sensitivitiy
sensitivity(sms_data$predict_type, sms_data$actual_type, positive = "spam")



######################## Classification and check test result #######################################


fake_news <- read.csv("./Dataset/fake.csv", stringsAsFactors = TRUE)
