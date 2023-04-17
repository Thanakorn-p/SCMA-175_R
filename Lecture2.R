# Lecture 2

#import tidyverse
library(tidyverse)

####################################

starwars <- starwars

view(starwars)
glimpse(starwars)
## glimpse() is like a transposed version of print(): 
## columns run down the page, and data runs across. This makes it possible to see every column in a data frame.
unique(starwars$gender)

#convert data type
starwars$gender <- as.factor(starwars$gender)
## Have a glimpse at the starwars data set again
glimpse(starwars)
## Recheck the type of the variable "gender" only
class(starwars$gender)
##check the level of the variable "gender"
levels(starwars$gender)
##Rearrange the gender levels
starwars$gender <- factor((starwars$gender),
                          levels = c("masculine",
                          "feminine"))
## Recheck the level of the variable "gender"
levels(starwars$gender)

## Recode variables
starwars %>% 
  select(name,gender) %>% 
  mutate(gender_coded = recode(gender,
                               "masculine" =  1,
                               "feminine" = 2))

############################################################

# Data filter

## Display all the column names
names(starwars)

###****Might be in the exam
## Display some specific columns It is not gonna change any thing
starwars %>%
  select(name, height)
## Assign new datatype there is some thing change
new_dataset <- starwars %>%
  select(name, height)
## Display some specific columns
starwars %>%
  select(name, height, ends_with("color")) %>%
  names()

## Filter observation
filter_data <- starwars %>%
  select(name, height, ends_with("color")) %>%
  filter(hair_color %in% c("blond","brown") &
         height < 180)

##########################################################

# Deal with missing data
## Determine the average height
mean(starwars$height)

## Determine the avg height after removing NA
mean(starwars$height, na.rm = TRUE)

## Display data with name, gender, hair_color, height\
starwars %>%
  select(name, gender, hair_color, height)

## Remove all rows with NA and keep the data
## in another subject
complete_starwars <- starwars %>%
  select(name, gender, hair_color, height) %>%
  na.omit

## Display observation that have been removed
starwars %>%
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) #filter only incomplete

## Remove observation according to incomplete data
## in the variable "height" only
starwars %>%
  select(name, gender, hair_color, height) %>%
  drop_na(height) # remove na in height

## Replace NA with "none" in "hair_color"
## and keep it in another object
complete_hair <- starwars %>%
  select(name, gender, hair_color, height) %>%
  mutate(hair_color=replace_na(hair_color, "none")) #so there are no na in the hair color

## Mutate and keep the data in a new column
complete_hair <- starwars %>%
  select(name, gender, hair_color, height) %>%
  mutate(hair_color2=replace_na(hair_color, "none"))

########################################################

# Deal with duplicate
## Import iris
iris <- iris
## Data overview
glimpse(iris)

## Check the duplicates
duplicated(iris)

## Use the unique command to remove duplicate
unique_iris <- unique(iris) # show me 149. the one that duplicate has been removed
## Use the distinct command to remove duplicate. Require tidyverse to use
distinct_iris <- distinct(iris)

# Remove duplicates based on specific columns
### Remove duplicates based on Sepal.Length &
### Petal.Width
new_iris <- iris %>% distinct(Sepal.Length, 
                              Petal.Width,
                              .keep_all = TRUE)
