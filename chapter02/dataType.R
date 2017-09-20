#########################
#   Create by John marc #
#########################

# vector data structure
# 'c' keyword is mean "Combine"

subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)

# Index start from 1 in R
# check data using index

# R vectors are inherently ordered so the records can be accessed by counting the item's number in the set
temperature[2]

# A range of values can be obtained using the (:) colon operator
temperature[2:3]

# Specify a logical vector indicating whether each item should be included
temperature[c(TRUE,TRUE,FALSE)]


# A factor is a special case of vector 
# Is solely used to represent categorical or ordinal variables
# e.g., male or female

# A factor is a special case of vector 
# Is solely used to represent categorical or ordinal variables
# e.g., male or female

# factor() function
gender <- factor(c("MALE","FEMALE","MALE"))
gender

# The levels variable comprise the set of possible categories factor could take
blood <- factor(c("O", "AB", "A"), levels = c("A", "B", "AB", "O")) 
blood[1:2] 

 
# We can include information about the order of a nominal variable's categories

symptoms <- factor(c("SEVER","MILD","MODERATE"),
                   levels=c("MILD","MODERATE","SEVER"),
                   ordered = TRUE)
symptoms
symptoms > "MODERATE"

# A list is a data structure, much like a vector, in that it is used for storing an ordered set of elements
# Difference : A list allows different types of elements to be collected

# Create list Object 
subject1 <- list(fullname=subject_name[1],
                 temperature=temperature[1],
                 flu_status=flu_status[1],
                 gender=gender[1],
                 blood=blood[1],
                 symptoms=symptoms[1])

# Check dataset of objects
subject1

# A list can still be accessed using methods similar to a vector
subject1[2]

# To return a single list item in its native data type, use double brackets ([[ and ]])
subject1[[2]]

# For clarity
subject1$temperature

# It is possible to obtain several items
subject1[c("temperature","flu_status")]


# Data frames
# The most important R data structure utilized in machine learning
# A structure analogous to a spreadsheet or database
# - Has both rows and columns of data
# A list of vectors or factors, each having exactly the same number of values

pt_data <- data.frame(subject_name, temperature, flu_status, gender, blood, symptoms, stringsAsFactors = FALSE)

# To extract entire columns (vectors) of data
pt_data$subject_name

# A vector of names can be used to extract several columns from a data frame
pt_data[c("temperature","flu_status")]

# To extract values in the data frame 
pt_data[,1]

# To extract all the columns of the first row
pt_data[1,]

# To extract all the columns of the first row
pt_data[1, ]

# To extract everything
pt_data[ , ]


# Matrix and array

# A matrix is a data structure that represents a two-dimensional table with rows and columns of data.

# What is difference between data frames and matrix?
# - data frame can be save different data type but, matrix is not

# To create a matrix, supply a vector of data to the matrix() function with (nrow) and (ncol).
m <- matrix(c(1,2,3,4), nrow=2)
m


# Saving, loading, and removing R data structure

# You shouldn't recreate your work each time you restart your R session

# Use the save() function
# - Writes one or more R data structures to the location specified by the file parameter
# - R data files have an .RData extension

# Example
# save(age,blood,fat, file="myData.RData")
# load("myData.RData")
# save.image() is just a short-cut for 'save my current workspace'

# ls() listing function returns a vector of all the data structure currently in the memory
ls()

# The rm() remove function can be used for freeing up the memory
rm(m, subject1)

# Be careful while executing the preceding command, as you will not be prompted before  your objects are removed.

# Importing and saving data from csv file

# The read.csv() function can be used as follow to load the file into R
csvData <- read.csv("F:/JJH/Desktop/usedcars.csv", stringsAsFactors = FALSE)

# If a csv file does not have a header, specify the option
# header = FALSE
# R will assign default feature names in the V1 and V2 froms
csvData <- read.csv("F:/JJH/Desktop/usedcars.csv", stringsAsFactors = FALSE, header = FALSE)
csvData
head(csvData)
# But, The easeist way of importing CSV files into R is to use RStudio interface

# Exploring and understanding data

# The better you understand your data
# - The better you will be able to match a machine learning model to your learning problem

# We will explore the usedcars.csv dataset
# - Actual data about used cars recently advertised for sale on a popular U.S.website
csvData <- read.csv("F:/JJH/Desktop/usedcars.csv", stringsAsFactors = FALSE)

# The str() function provieds a method to display the structure of R data Structure
# - Data frame, vector, lists, etc
str(csvData)

# The str() provides
# - Number of objects and variables, feature information and data types

# The summary() function display several common summary statistics
summary(csvData$year)
summary(csvData[c("price","mileage")])

# What is min ? 1st Qu?, Median?, Mean?, 3rdQu?, max
# - The six summary
# - Powerful tools to investigate data
# - They can be divided into tow type
# - (a) measures of center  (b) measures of spred
 
# Measures of central tendency are used to identify a value that falls in the middle of a set of data
# What is the simplest way of measuring the center?
# - Average

# Mean is a measurement defined as the sum of all values divided by the number of values
mean(csvData$year)

# Median is the value that occur halfway through an ordered list of values
mean(c(36000,44000,56000))
median(c(36000,44000,56000))
median(csvData$year)

# Measuring spread - five-number summary
# Mean or Median tells us little about whether or not there is diversity in the measurements

# We need to measure spread of data
# - hwo tightly or loosely the values are spaced

# The five-number summary is a set of five statistic that roughtly depict the spread of a feature's values
# - Minimum(Min)
# - First quartile, or Q1(1st Qu)
# - Median, or Q2(Median)
# - Thrid quartile, or Q3(3rd Qu)
# - Maximum(Max)

# Minimum and maximum are the most extreme feature values, indicating the samllest and largest values
# - R provides the min() and max() functions


# The span between the minimum and maximum value is known as the range
# - The range() function returens both the minimum and maximum value
range(csvData$price)

# - Combining range() with the diff() difference function
diff(range(csvData$price))

# The quartiles divide a dataset into four portion, each with the same number of values

# Quartiles are a special case of a type of statistics called quartiles
# - tertiles(three parts)
# - quintiles(five parts)
# - deciles(10 parts)
# - percentiles(100 parts)

# The quantile() function provides a robust tool to identfy quantiles for a set of values
quantile(csvData$price)
quantile(csvData$price, probs=c(0.01,0.99))
quantile(csvData$price, seq(from=0,to=1, by=0.20))



# Visualizing numeric variable - boxplots
# A common visualization of the five-number summary is boxplot
boxplot(csvData$price, main="Boxplot of Used Car prices", ylab="Price($)")
boxplot(csvData$mileage, main="Boxplot of Used Car Mileage", ylab="Odometer(Mi.)")


# A histogram is another way to graphically depict the spread of a numberic variable
hist(csvData$price, main="Boxplot of Used Car prices", ylab="($)")
hist(csvData$mileage, main="Boxplot of Used Car Mileage", ylab="Odometer(Mi.)")


# Exploring categorical variables

# Categorical data is typically examined using table
# A table that presents a single categorical variables is known as a one-way table
# The table() function can be used to generate one-way tables for our used car data
table(csvData$year)
table(csvData$model)
table(csvData$color)

model_table <- table(csvData$model)
prop.table(model_table)

# Want to make it more clear?
color_table <- table(csvData$color)
color_pct <- prop.table(color_table)*100
round(color_pct,digits=1)

# A scatterplot is a diagram that visualizes a bivariate relationship
# The plot() function along with the main, xlab and ylab can ouput scatterplot
plot(x=csvData$mileage, y=csvData$price, main = "Scatterplot of Price vs Mileage", ylab="Used Car Price($)", xlab="Used Car Odometer(mi.)")
