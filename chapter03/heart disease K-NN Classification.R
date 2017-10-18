#########################
#   Create by John marc #
#########################
install.packages("readr")
install.packages("gmodels")
install.packages("class")
library(class)
library(gmodels)
library(readr)

## Read 'heartData' data
heartData <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.switzerland.data"), 
                 header = FALSE, sep=",") 
## Print first line
head(heartData)

# Add column names
names(heartData) <- c("age","sex","cp","trestbps","chol","fbs","restecg","thalach","exang","oldpeak","slope","ca","thal","num")

# check data featrue
summary(heartData)

################################################# preprocessing 1 #################################################

# remove garbage column
# remove fbs, restecg, exang, ca
heartData <- heartData[,-6]
heartData <- heartData[,-6]
heartData <- heartData[,-6]
heartData <- heartData[,-10]

# check processing result
summary(heartData)

################################################# preprocessing 2 #################################################
View(heartData)

# export csv file
write.csv(x=heartData,file="heartDataBeforeProcessing.csv")

heart <- read.csv(file="heartDataBeforeProcessing.csv")
View(heart)
heart <- heart[,-1]
heart

# check processed data
round(prop.table(table(heart$cp))* 100, digits = 1)

# check number of row
nrow(heart)

train <- heart[1:75,]
test <- heart[76:106,]
train_label <- heart[1:75,3]
test_label <- heart[76:106,3]

k_nn <- knn(train=train, test=test, cl=train_label, k=21)
k_nn
test$cp
