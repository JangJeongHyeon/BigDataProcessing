library(readr)
library(class)
library(gmodels)
library(C50)
library(caret)

## load bank data set
# attribute : age, job, martial, education, default(has credit card), balance, housing, loan, contact, 


bank_full <- read.csv("./Dataset/bank.csv", sep=";", stringsAsFactors = TRUE)
View(bank_full)
summary(bank_full)
bank_full
################################# Classification ######################################
# FETCH age, balance, previous, y colunms
age <- bank_full[,1]
balance <- bank_full[,6]
previous <- bank_full[,15]
y <- bank_full[,17]
y <- as.factor(y)
BankData <- data.frame(age,balance,previous,y, stringsAsFactors = TRUE)
BankData

#### K-NN
#### CREATE NORMALIZE FUNCTION
normalize <- function(x) {
  return ((x -min(x)) / (max(x)-min(x)))
}

## Check desity of result
round(prop.table(table(BankData$y))*100, digits=1)
round(prop.table(table(bank_full$y))*100, digits=1)

## Basic statistic information
summary(BankData[c("age","balance","previous")])


## normalized
bankData_n <- as.data.frame(lapply(BankData[1:3], normalize))
summary(bankData_n[c("age","balance","previous")])


## DO K-NN
nrow(bankData_n)
## training data 70%
bankData_train <- bankData_n[1:3521,]
bankData_test <- bankData_n[3522:4521,]
bankData_train_label <- BankData[1:3521,4]
bankData_test_label <- BankData[3522:4521,4]

## k = 6 -> 88%
bank_test_pred <- knn(train=bankData_train, test = bankData_test, cl=bankData_train_label, k=6)

CrossTable(x=bankData_test_label, y=bank_test_pred, prop.chisq = FALSE)


confusionMatrix(bank_test_pred, bankData_test_label, positive = "no")


####################### Decision Tree ########################
# CREATE DATA SET FOR DECISION TREE 
## job, marital, education, housing, loan
job <- bank_full["job"]
marital <- bank_full["marital"]
education <- bank_full['education']
housing <- bank_full['housing']
loan <- bank_full['loan']
previous <- bank_full['poutcome']
result <- bank_full['y']
d_Bank <- data.frame(job, marital,education,housing,loan, previous, result)

nrow(d_Bank)
d_Bank
set.seed(123)
train_index <- sample(4521,3521)
str(d_Bank_train)
d_bank_train <- d_Bank[train_index,]
d_bank_train_label <- d_Bank[train_index,5]
d_bank_test <- d_Bank[-train_index,]
d_bank_test_label <- d_Bank[-train_index,5]

d_Bank_model <- C5.0(d_bank_train, d_bank_train_label)

# check model
summary(d_Bank_model)

# generate predict model
d_Bank_predict <- predict(d_Bank_model, d_bank_test)
d_Bank_predict


CrossTable(x=d_bank_test_label, y=d_Bank_predict, prop.chisq = FALSE)

confusionMatrix(d_Bank_predict, d_bank_test_label, positive = "no")
# write.csv(summary(bank_full),"./summary.csv")
