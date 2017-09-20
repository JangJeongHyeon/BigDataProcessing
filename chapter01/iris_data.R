#########################
#   Create by John marc #
#########################
install.packages("ggvis")
install.packages("readr")

library(ggvis)
library(readr)

## Read 'iris' data
iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), 
                 header = FALSE) 
## Print first line
head(iris)

# Add column names
names(iris) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

# Check the result
head(iris)

# Iris scatter plot
iris %>% ggvis(~Sepal.Length, ~Sepal.Width, fill = ~Species) %>% layer_points()
iris %>% ggvis(~Petal.Length, ~Petal.Width, fill = ~Species) %>% layer_points()

# Overall correlation 'Petal.Length' and 'Petal.Width'
cor(iris$Petal.Length, iris$Petal.Width)

# Retrun values of 'iris' levels
x = levels(iris$Species)

# Print Setosa correlation matrix
print(x[1])
cor(iris[iris$Species==x[1],1:4])

# Print Versicolor correlation matrix
print(x[2])
cor(iris[iris$Species==x[2],1:4])

# Print Virginica correlation matrix
print(x[3])
cor(iris[iris$Species==x[3],1:4])

# Return structure of 'iris'
str(iris)
