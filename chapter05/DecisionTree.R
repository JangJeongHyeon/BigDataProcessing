#########################
#   Create by John marc #
#########################
library(data.table)
library(readxl)
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

table(credit$checking_balance)

table(credit$savings_balance)

table(credit$months_loan_duration)

table(credit$amount)