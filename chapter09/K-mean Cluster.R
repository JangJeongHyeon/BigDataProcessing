##############################################################################################
teens <- read.csv("./Dataset/Machine-Learning-with-R-datasets-master/snsdata.csv")
table(teens$gender, useNA = "ifany")
summary(teens$age)

teens$age <- ifelse(teens$age >= 13 & teens$age < 20, teens$age, NA)
summary(teens$age)


teens$female <- ifelse(teens$gender == "F" & !is.na(teens$gender), 1, 0)
teens$no_gender <- ifelse(is.na(teens$gender),1,0)
table(teens$gender, useNA = "ifany")

table(teens$female, useNA = "ifany")

table(teens$no_gender, useNA = "ifany")

mean(teens$age)
mean(teens$age, na.rm = TRUE)

aggregate(data=teens, age~gradyear, mean, na.rm = TRUE)

ave_age <- ave(teens$age, teens$gradyear, FUN= function(x) mean(x, na.rm = TRUE))
teens$age <- ifelse(is.na(teens$age), ave_age, teens$age)
summary(teens$age)


interest <- teens[5:40]
interest_z <- as.data.frame(lapply(interest, scale))
set.seed(2345)
teen_clusters <- kmeans(interest_z, 5)


teen_clusters$size
teen_clusters$centers


##############################################################################################

## Read 'wine' data
wine <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"), 
                 header = FALSE) 
