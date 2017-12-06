#########################
#   Create by John marc #
#########################
install.packages("C50")
library(data.table)
library(readxl)
library(C50)
library(gmodels)
##################################################### Trial 1 ##################################################### 


## Define Entropy function 
Entropy <- function(a, b){
  return (round((-(a*log2(a))-(b*log2(b))),2))
}

## loading data set
buyComputerData <- read_excel("chapter05/decisonTreeDataset.xlsx", stringsAsFactors=FALSE)
View(buyComputerData)

## check data table
summary(buyComputerData)


5/14*Entropy(3/5,2/5)+4/14*0.0+5/14*Entropy(2/5,3/5)


##################################################### Trial 2 #####################################################

## load data set
credit <- read.csv("chapter05/credit.csv",stringsAsFactors = FALSE)


## check data
summary(credit)

# table() output for a couple of loan features that seem likely to predict a default. 
# The applicant's checking and savings account balance are recorded as categorical variables:


# see data set

table(credit$checking_balance)

table(credit$savings_balance)

summary(credit$months_loan_duration)

summary(credit$amount)


# generate random data

set.seed(123)
train_sample <- sample(1000,900)
str(train_sample)

# use 90 percent of the data for training and 10 percent for testing
# which will provide us with 100 records to simulate new applicants

## generate train data set by random index
credit_train <- credit[train_sample, -17]
credit_train_label <- credit[train_sample, 17]

## generate test data set
credit_test <- credit[-train_sample,]
credit_train_label <- as.factor(credit_train_label)

## generate decison tree model using ny c5.0 algorithm from packages
credit_model <- C5.0(credit_train,credit_train_label)

## check model
summary(credit_model)

## To apply decison tree to the test data set, use the predict() function
credit_pred <- predict(credit_model, credit_test)
CrossTable(credit_test$default, credit_pred)

predict_accurcy <- (59+14)/100
predict_accurcy


##################################################### Trial 3 #####################################################
golfData <- read_excel("./chapter05/golfData.xlsx")
golf_test <- c("Sunny","Mild","Normal","False")
golfData <- as.data.frame(golfData)

golfData$PlayGolf <- as.factor(golfData$PlayGolf)
golfData$Outlook <- as.factor(golfData$Outlook)
golfData$Temperature <- as.factor(golfData$Temperature)
golfData$Humidity <- as.factor(golfData$Humidity)
golfData$Windy <- as.factor(golfData$Windy)

# check column number
length(names(golfData))
golf_train <- golfData[1:14,-5]
golf_train_label <- golfData[1:14,5]
golf_test <- golfData[15,-5]
golf_test_label <- golfData[]

golf_model <- C5.0(golf_train, golf_train_label)

# check model
summary(golf_model)

# generate predict model
golf_predict <- predict(golf_model, golf_test)
golf_predict
CrossTable(x=d_bank_test_label, y=d_Bank_predict, prop.chisq = FALSE)
##################################################### Trial 4 #####################################################

## Each data assigned to vectors
Outlook <- c('Rainy','Rainy','Overcast','Sunny','Sunny','Sunny','Overcast','Rainy','Rainy','Sunny','Rainy','Overcast','Overcast','Sunny','Sunny')
Temperature <- c('Hot','Hot','Hot','Mild','Cool','Cool','Cool','Mild','Cool','Mild','Mild','Mild','Hot','Mild','Mild')
Humidity <- c('High','High','High','High','Normal','Normal','Normal','High','Normal','Normal','Normal','High','Normal','High','Normal')
Windy <- c(FALSE, TRUE, FALSE, FALSE,  FALSE, TRUE,TRUE,FALSE, FALSE,FALSE, TRUE,TRUE,FALSE,TRUE,FALSE)
PlayGolf <- c('No','No','Yes','Yes','Yes','No','Yes','No','Yes','Yes','Yes','Yes','Yes','No','?')

## Transforom Data.frame
Data <- data.frame(Outlook,Temperature,Humidity,Windy,PlayGolf)

## check data type of each columns
class(Data$Outlook)
class(Data$Temperature)
class(Data$Humidity)
class(Data$Windy)
class(Data$PlayGolf)

## prepare train data set and train label
train_data <- Data[1:14,-5]
train_data_label <- Data[,5]

## generate model by decison tree
decison_model <- C5.0(train_data,train_data_label)
## Error message : Error in UseMethod("QuinlanAttributes") : 
## no applicable method for 'QuinlanAttributes' applied to an object of class "logical"


