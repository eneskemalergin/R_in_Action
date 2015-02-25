# Author: Enes Kemal Ergin

# vectors:
a <- c(1,2,3,4,5,6,7) # Numerical Vector
b <- c("one", "two", "three") # Character Vector
c <- c(TRUE, TRUE, TRUE, FALSE, FALSE,TRUE) # boolean Vector

# Vectors with one element
# We used them to strore constants
f <- 3
g <- "Turkey"
h <- T

# We can refer elements of vector using brackets
a[4]
# [1] 4

a[c(1,3,5)] # give me 1st, 3rd and 5th element
# [1] 1 3 5

a[2:6] # give me elements from 2nd to 6th 

## a <- c(2:6) # It will store vector from 2 to 6

# Matrices
'''
A matrix is a two-dimensional array where each element has the same mode
(numeric, character, or logical)

They created with matrix() function. General Format:
mymatrix <- matrix(vector, nrow=number_of_columns, ncol=number_of_columns,
                  byrow=logical_value, dimnames=list(char_vector_rownames
                  , char_vector_colnames))

'''
y <- matrix(1:20, nrow=5, ncol=4)
y
#      [,1] [,2] [,3] [,4]
# [1,]    1    6   11   16
# [2,]    2    7   12   17
# [3,]    3    8   13   18
# [4,]    4    9   14   19
# [5,]    5   10   15   20

# Creating needed info
cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")

# 2x2 matrix filled by rows
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=T, 
                   dimnames=list(rnames, cnames))
mymatrix
#    C1 C2
# R1  1 26
# R2 24 68

# 2X2 matrix filled by columns
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=F, 
                   dimnames=list(rnames, cnames))
mymatrix
#    C1 C2
# R1  1 24
# R2 26 68

# We will use matrix subscripts
x <- matrix(1:10, nrow=2)
x
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

x[2,] # That means take everything from second row
# [1]  2  4  6  8 10

x[,2] # That means take everthing from second column
# [1] 3 4

x[1,4] # Element in 1st row 4th column
# [1] 7

x[1, c(4,5)] # Elements in 1st row in 4th and 5th column
# [1] 7 9

# Arrays
'''
Arrays are similar to matrices but can have more than two dimensions.
They are created with an array function of the following form:
myarray <- array(vector, dimensions, dimnames)
'''

# Creating 2X3X4 array
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2,3,4), dimnames=list(dim1, dim2, dim3))
z
# , , C1
#
# B1 B2 B3
# A1  1  3  5
# A2  2  4  6
#
# , , C2
#
# B1 B2 B3
# A1  7  9 11
# A2  8 10 12
#
# , , C3
# 
# B1 B2 B3
# A1 13 15 17
# A2 14 16 18
#
# , , C4
# 
# B1 B2 B3
# A1 19 21 23
# A2 20 22 24

# Data Frames:
'''
A data frame is more general than a matrix in that different columns can
contain different modes of data. Data frames are the most common data 
structure you will deal with in R.

A Data frame is created with the data.frame() function:

mydata <- data.frame(col1, col2, col3,...)
'''
# Creating columns information
patientID <- c(1,2,3,4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
# Creates a data.frame and store it in patientdata
patientdata <- data.frame(patientID, age, diabetes,status)
patientdata
#   patientID age diabetes    status
# 1         1  25    Type1      Poor
# 2         2  34    Type2  Improved
# 3         3  28    Type1 Excellent
# 4         4  52    Type1      Poor


# there are several ways to identify the elements of a data frame

patientdata[1:2] # Getting 1st and 2nd column info
# patientID age
# 1         1  25
# 2         2  34
# 3         3  28
# 4         4  52

patientdata[c("diabetes", "status")] # Getting "diabetes" and "status" columns info
#   diabetes    status
# 1    Type1      Poor
# 2    Type2  Improved
# 3    Type1 Excellent
# 4    Type1      Poor

patientdata$age # Indicates age variable in patient data frame
# [1] 25 34 28 52


# If we want to cross tabulate diabetes type by status we can use table()
table(patientdata$diabetes, patientdata$status)
#         Excellent Improved Poor
# Type1         1        0    2
# Type2         0        1    0


# attach() function adds the data frame to the R seach path.
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)

# This one could be written as :
# Very Cool Feature
attach(mtcars)
  summary(mpg)
  plot(mpg, disp)
  plot(mpg, wt)
detach(mtcars) # Removes the data.frame from the search path.

# an alternative approach is to use the with() function.
with(mtcars, {
  summary(mpg, disp, wt)
  plot(mpg, disp)
  plot(mpg, wt)
})

# It will show one time and erase the variable inside
with(mtcars, {
  stats <- summary(mpg)
  stats
})
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 10.40   15.42   19.20   20.09   22.80   33.90 
stats
# Error: object 'stats' not found

# If you want to keep the variable that you made inside of the with use <<-

with(mtcars, {
  nokeepstats <- summary(mpg)
  keepstats <<- summary(mpg)
})
nokeepstats
# Error: object 'nokeepstats' not found
keepstats
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  10.40   15.42   19.20   20.09   22.80   33.90 

# Factors:
