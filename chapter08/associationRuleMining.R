install.packages("arules")
library(data.table)
library(readr)
library(arules)

groceries <- read.transactions("F:/JJH/DevProject/R/BigDataProcessing/Dataset/Machine-Learning-with-R-datasets-master/groceries.csv", sep =",")
View(groceries)
summary(groceries)

inspect(groceries[1:5])

groceriesRule <- apriori(groceries, parameter =  list(support=0.006, confidence=0.25, minlen=2))

summary(groceriesRule)

inspect(groceriesRule[1:3])



###################### Potato ######################

# CREATE DATASET

food <- read.transactions("F:/JJH/DevProject/R/BigDataProcessing/Dataset/food.csv", sep=",")
View(food)
summary(food)

inspect(food[1:5])
food_rule <- apriori(food, parameter = list(support=0.4, confidence=0.7, minlen=3))

summary(food_rule)
inspect(food_rule)
