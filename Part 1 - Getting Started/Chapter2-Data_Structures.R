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
'''
Variables can be described as nominal, ordinal, or continuous. 
Nominal variables are categorical, without an implied order. Diabetes(Type1, Type2)
We coded them as it is. No order is implied.

Ordinal variables imply order but not amount. Status(poor, improved, excellent) is
a good example of an ordinal variable. 

Continuous variables can yake on any value within some range, and both order 
and amount are implied.

Categorical(nominal) and ordered categorical variables in R are called factors. Factors are crucial in R
because they determine how data will be analyzed and presented visually.

The function factor() stores the categorical values as a vector of integers in the range[1,,,k]
'''
diabetes <- c("Type1", "Type2", "Type1", "Type1")
diabetes <- factor(diabetes) # Stores as (1,2,1,1)
diabetes

# For Vectors representing ordinal variables, you add the parameter 
# ordered = TRUE to factor() function.

# Makes a character vector 
status <- c("Poor", "Improved", "Excellent", "Poor")
# Converts character vector to ordered factor and overwrite it.
status <- factor(status, ordered = TRUE)
status

# We can also override the default by specifying a levels option.
status <-factor(status, order = TRUE, 
                levels = c("Poor", "Improved", "Excellent"))

# Entering data as vectors
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
# Make diabetes factor
diabetes <- factor(diabetes)
# Make status ordered factor
status <- factor(status, order=TRUE)
# Make a dataframe
patientdata <- data.frame(patientID, age, diabetes, status)
str(patientdata) # Displays the object structure.
# 'data.frame':  4 obs. of  4 variables:
# $ patientID: num  1 2 3 4
# $ age      : num  25 34 28 52
# $ diabetes : Factor w/ 2 levels "Type1","Type2": 1 2 1 1
# $ status   : Ord.factor w/ 3 levels "Poor"<"Improved"<..: 1 2 3 1

summary(patientdata) # Displays object summary
#    patientID         age         diabetes       status 
# Min.   :1.00   Min.   :25.00   Type1:3   Poor     :2  
# 1st Qu.:1.75   1st Qu.:27.25   Type2:1   Improved :1  
# Median :2.50   Median :31.00             Excellent:1  
# Mean   :2.50   Mean   :34.75                          
# 3rd Qu.:3.25   3rd Qu.:38.50                          
# Max.   :4.00   Max.   :52.00 

# Lists:
'''
Lists are the most complex of the R data types. List is an ordered 
collection of objects. It allows you to gather a variety of objects
under one name. list() function is using.

mylist <- list(object1, object2, ....)

You can name the objects in a list

mylist <- list(name1 = object1, name2 = object2, ...)

'''
g <- "My First List"
h <- c(25,26,18,39)
j <- matrix(1:10, nrow = 5)
k <- c("one", "two", "three")
mylist <- list(title = g, ages=h, j , k)
mylist
# $title
# [1] "My First List"
#
# $ages
# [1] 25 26 18 39
# 
# [[3]]
# [,1] [,2]
# [1,]    1    6
# [2,]    2    7
# [3,]    3    8
# [4,]    4    9
# [5,]    5   10
#
# [[4]]
# [1] "one"   "two"   "three"

mylist[[2]] # prints the second component
# [1] 25 26 18 39

mylist[["ages"]] # prints ages part.
# [1] 25 26 18 39


## Data Input
#################
''' Variety of different data could be imported to R.'''

''' 
The simplest method of data entry is from the keyboard. The edit() 
function in R will invoke a text editor that will allow you to enter
your data manually.
1. Create an empty data frame (or matrix) with the variable names and 
modes you want to have in the final dataset.
2. Invoke the text editor on this data object, enter your data, and save
the results back to the data object.
'''

# Creates an empty data.frame with default values of speciied variables.
mydata <- data.frame(age = numeric(0),
                     gender = character(0), weight = numeric(0))
# When you run the last function it says 0 observations and 3 variables

# Now we will write them manually.
mydata <- edit(mydata)

# shortcut of the last function of R  is 
fix(mydata) 

# Works well for small datasets.

# Importing data from a delimited text file.
'''
mydataframe <- read.table(file, header = logical_value, sep = "delimeter", 
                          row.names = "name")
# where file is a delimited ASCII file.
'''
grades <- read.table("studentsgrades.csv", header = TRUE, sep = ",", 
                     row.names = "STUDENTID")
# To work with it you should have studentsgrades.csv file/

# On windows RODBC package to access EXcel files.
install.packages("RODBC")
library(RODBC)
# We can import data from excel using following procedure.
channel <- odbcConnectExcel("path to file") #It works for 32-bit windows.
mydataframe <- sqlFetch(channel, "mysheet")
odbcClose(channel)
help(RODBC)

# for XLSX format which excel 2007 and later versions use.
install.packages("xlsx")
library(xlsx)
workbook <- "C:/Users/Pc-41/Desktop/Academic Career/Scientific Dictionary.xlsx"
mydataframe <- read.xlsx(workbook, 1)
# This is very useful when we are dealing with a lot of excel files.


""" 
In Webscraping the user extracts information embedded in a web page
available over the internet and saves it into R structures for further 
analysis.

One way to accomplish this is to download the web page using the readLines()
function and manipulate it with functions such as grep() and gsub().
"""

# Importing data from SPSS
  # they can be important into R via the read.spss() function in the foreign package

install.packages("Hmisc")
library(Hmisc)
# This imports the data
mydataframe <- spss.get("mydata.sav", use.value.labels = TRUE)

# Annotating Datasets
"""
Data analysts typically annotate datasets to make the results easier to interpret.
Typically
annotation includes adding descriptive labels to variable names and value labels
to the codes used for categorical variables. For example, for the variable age, you
might want to attach the more descriptive label "Age at hospitalization (in years)." For
the variable gender coded 1 or 2, you might want to associate the labels "male" and
"female."
"""

# R's ability to handle variable labels is limited.

# One approach is to use variable label as the variable's name and then 
#   refer to the variable by its position.

# Renames age to "Age at hospitalization (in years)"
names(patients)[2] <- "Age at hospitalization (in years)"

# factor() function can be used to create value labes for categorical varibles.

# creates value labels with the code.
patientdata$gender <- factor(patientdata$gender,
                             levels = c(1,2),
                             labels = c("male", "female"))

"""
- length(object)             Number of elements/components.
- dim(object)                Dimensions of an object.
- str(object)                Structure of an object.
- class(object)              Class or type of an object.
- mode(object)               How an object is stored.
- names(object)              Names of components in an object.
- c(object, object,...)      Combines objects into a vector.
- cbind(object, object, ...) Combines objects as columns.
- rbind(object, object, ...) Combines objects as rows.
- object                     Prints the object.
- head(object)               Lists the first part of the object.
- tail(object)               Lists the last part of the object.
- ls()                       Lists current objects.
- rm(object, object, ...)    Deletes one or more objects. The statement rm(list = ls()) will remove most objects
from the working environment.
- newobject <- edit(object)  Edits object and saves as newobject.
- fix(object)                Edits in place.
"""

# One of the  most challenging tasks in data analysis is data preparation.
# In this chapter you have seen haw you can prepare your data.

############################### END OF CHAPTER ##############################