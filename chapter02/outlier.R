#########################
#   Create by John marc #
#########################

# Cerate vector variables
age <- c(23,23,27,27,39,41,47,49,50,52,54,54,56,57,58,58,60,61)
fat <- c(9.5, 26.5, 7.8, 17.8, 31.4, 25.9, 27.4, 27.2, 31.2, 34.6, 42.5, 28.8, 33.4, 30.2, 34.1, 32.9, 41.2, 35.7)


# Check five statistics factor
summary(fat)
summary(age)

# Check outlier factor using boxplot
boxplot(fat)
boxplot(age)

# The formula for detect to outlier factor
# Interquartile(IQR) = Q3 - Q1
# UpperFence = Q3+1.5*IQR
# LowerFence = Q1-1.5*IQR


# Assign Q1 and Q3 value from summary result to each Q1,Q3 variables
age_Q1 <- 23.50
age_Q3 <- 56.75

fat_Q1 <- 26.68
fat_Q3 <- 33.92

# Calculate IQR value
age_IQR <- age_Q3 - age_Q1
fat_IQR <- fat_Q3 - fat_Q1

# Check IQR value
age_IQR
fat_IQR

# Calculate LowerFence value and UpperFence value
fat_LowerFence = fat_Q1 - 1.5*fat_IQR
fat_UpperFence = fat_Q3 + 1.5*fat_IQR

age_LowerFence = age_Q1 - 1.5*age_IQR
age_UpperFence = age_Q3+ 1.5*age_IQR


# Detect to outlier value
fat[fat<fat_LowerFence]
fat[fat > fat_UpperFence]

age[age < age_LowerFence]
age[age > age_UpperFence]


# Remove outlier factor
fat <- fat[fat > fat_LowerFence]

fat
age
