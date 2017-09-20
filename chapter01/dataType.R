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
# Writes one or more R data structures to the location specified by the file parameter
# R data files have an .RData extension






# Importing and saving data from csv file PPT.NO 19

csvData <- read.csv("F:/JJH/Desktop/usedcars.csv", stringsAsFactors = FALSE)
csvData
head(csvData)

str(csvData)

summary(csvData$year)
summary(csvData[c("price","mileage")])
round(mean(csvData$year))

age <- c(23,23,27,27,39,41,47,49,50,52,54,54,56,57,58,58,60,61)

fat <- c(9.5, 26.5, 7.8, 17.8, 31.4, 25.9, 27.4, 27.2, 31.2, 34.6, 42.5, 28.8, 33.4, 30.2, 34.1, 32.9, 41.2, 35.7)

summary(fat)
