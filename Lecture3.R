install.packages("car")
install.packages("PerformanceAnalytics")
install.packages("caret")
install.packages("leaps")

library(car) #Library for applied regression library(PerformanceAnalytics) #Library for performance and risk analysis library(caret) #Library for machine learning workflows
library(leaps) #Library for computing best subsets regressions

#import and prepare the data
library(tidyverse)
## Rename column
MLR_PD <- Parcel_delivery %>%
  rename(
    dist_trav = 'Distance traveled (KM)',
    no_deliv = 'Number of deliveries',
    fuel_price = 'Fuel price (THB)',
    trav_time = 'Travel time (HR)'
  )

###################################################

# Multiple linear regression
## Step1: Identify x's
ind_var <- MLR_PD %>% select(1:3)

## Step3: Check linearity assumption
plot(x = MLR_PD$dist_trav, y = MLR_PD$trav_time)
plot(x = MLR_PD$no_deliv, y = MLR_PD$trav_time)
plot(x = MLR_PD$fuel_price, y = MLR_PD$trav_time)

## Step4: Detect multicollinearity
library(car) #Library for applied regression
library(PerformanceAnalytics) #Library for the performance indicators
library(caret) #Library for machine learning workflow
library(leaps) #Library for determining the best subset regression

### Calculate Pearson's correlation
ps_corr <- cor(ind_var, method = "pearson")
round(ps_corr,2)

### Create a graph
chart.Correlation(ind_var, histogram = FALSE, phc = 20)

## Calculate VIF
full_model <- lm(trav_time~., data = MLR_PD)
full_model
car::vif(full_model)

## Step5 Determin the best subset
### USe the regsubsets to fina the best subset
bss_model <- regsubsets(trav_time~., data=MLR_PD,
                        nvmax = 3, method = "exhaustive")
summary(bss_model)

### Determine related indicators
res_sum <- summary(bss_model)

bss_measures <- data.frame(
  Adj_R2 = res_sum$adjr2,
  CP = res_sum$cp,
  BIC = res_sum$bic)

bss_measures
