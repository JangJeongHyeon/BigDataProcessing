install.packages("data.table")
install.packages("class")
install.packages("gmodels")
library(gmodels)
library(class)
library(readr)
##################################################### Trial 1 ##################################################### 

# Define K

K <- 3
x2 <- 48
y2 <- 142000

# Initialize data set

col_name <- c('Age','Loan','Class')
age_v <- c(25,35,45,20,35,52,23,40,60,48,33)
loan_v <- c(40000,60000,80000,20000,120000,18000,95000,62000,100000,220000,150000)
Class <- c('N','N','N','N','N','N','Y','Y','Y','Y','Y')

# Check data length

length(age_v) == length(loan_v)
length(age_v) == length(Class)

data <- cbind(age_v,loan_v,Class)
View(data)
data <- as.data.frame(data)


# Create function
distance <- function(x1,x2,y1,y2){
  return(sqrt((x2-x1)^2 + (y2-y1)^2))  
}


# calculate distance
distance_v = c()
for(i in 0 : 11){
  x1 <- data[i,]$age_v
  y1 <- data[i,]$loan_v
  x1 <- as.numeric(x1)
  y1 <- as.numeric(y1)
 distance_v[i] <- distance(x1,x2,y1,y2)  
}


# merge distance result
data <- cbind(data, distance_v)

# check result data set
View(data)



##################################################### Trial 2 #####################################################

# Wisconsin Breast Cancer Diagnostic
wbcd <- read.csv("chapter03/wisc_bc_data.csv", stringsAsFactors=FALSE)

# drop the id feature altogether
wbcd <- wbcd[-1]

# Check data
View(wbcd)

# Change the label “M” and “B” of diagnosis feature into Benign and Malignant.
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B","M"), labels = c("Benign","Malignmant"))


# using prop.table() we can see table information in details.
round(prop.table(table(wbcd$diagnosis))* 100, digits = 1)


# The remaining features are all numeric, by being numeric, they consist of number of characteristics. If we take a closer look at those features
summary(wbcd[c("radius_mean","area_mean","smoothness_mean")])

# You can recongnize scale is very defferent each variables


# Below we are creating a min-max normalization in R
normalize <- function(x){
  return((x-min(x)) / (max(x) - min(x)))
}

# To perform this function on the data set we should use lapply()
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

wbcd_n

# To confirm the transformation let’s see the data set details again.
summary(wbcd_n$area_mean)
summary(wbcd_n$radius_mean)
summary(wbcd_n$smoothness_mean)


# Split data set into test and traning, to make sure K-NN is working
wbcd_train <- wbcd_n[1:469,]
wbcd_test <- wbcd_n[470:569,]

wbcd_train_labels <- wbcd[1:469,1]
wbcd_test_labels <- wbcd[470:569,1]

# Using knn() function to classify the test data set
wbcd_test_pred <- knn(train = wbcd_train, test= wbcd_test, cl = wbcd_train_labels, k = 21)


# Check result
# CrossTable() function is return confusion matrix 
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)


##################################################### Trial 2 #####################################################
# Change the label “Y” and “N” of class
dump_data <- dump_data[-4]
dump_data <- data
label <- data$fac
result <- knn(train = dump_data, test= list(x2,y2), cl=label, k=3)


