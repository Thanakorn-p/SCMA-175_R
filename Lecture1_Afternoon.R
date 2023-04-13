a <- 49
sqrt(a)

#string
b <- "Tonkampu is a nice restaurant"
sub("nice","grate",b)

#logic
c <- (1+1==3)
c

###############################################
#Data structure
## Vector (All element must be the same data type)
name <- c("Mike","lucy","John")
name
age <- c(20,25,30)
name[2:3]
age[3]

## matrix (Two additional attributes: row and the number columns)
x <- matrix(c(1,2,3,4), nrow = 2)
x
x1 <- matrix(c(1:9), nrow = 3)
x1
x2 <- matrix(c(1:9), nrow = 3, byrow = TRUE)
x2
x2[2,3]

## list (contain elements of different types)
y <- list(name = "Mike", gender = "M", company = "ProgramCreek", age = 30)
y
y$age

## Data frame (A list of vector of equal lenth)

name <- c("Mike", "Lucy", "John")
age <- c(20, 25, 30)
student <- c(TRUE, FALSE, TRUE)
df = data.frame(name, age, student)
df
df$age

#################################################################
#install a library
install.packages("tidyverse")

# import a library

library(tidyverse)
# Data manipulation
round(pi, 6)

## pipe operator
pi %>% round(6)
pi %>% log() %>% round(2)


## Rename column
# Function rename() in dplyr, which is included in the tidyverse library, 
# can be used to rename columns in a data frame. 
# We can integrate this with a pipe operator %>%
## to use this please import dataset Parcel_delivery.xls in the correct name.
MLR_PD <-
  Parcel_delivery %>%
  rename(
    dist_trav = `Distance traveled (KM)`,
    no_deliv = `Number of deliveries`,
    fuel_price = `Fuel price (THB)`,
    trav_time = `Travel time (HR)`
  )
# Functionslice()canextractrowsbyposition
MLR_PD %>% slice(1:5)
# Functionfilter()canextractrowsthatmeetpre-definedlogicalcriteria
MLR_PD %>% filter(fuel_price>24, trav_time>6)
MLR_PD %>% filter(fuel_price>24| trav_time>6)
# Functionselect()canselectorremoveanycolumnbyitsname
MLR_PD %>% select(-trav_time)

