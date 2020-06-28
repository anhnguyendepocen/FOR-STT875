## ----global_options-----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## -----------------------------------------------------------------------------
library(ISLR)
str(Weekly)


## ---- message=FALSE, tidy = FALSE---------------------------------------------
library(ggplot2)
library(dplyr)

Weekly <- mutate(Weekly, binDirection=ifelse(Direction == "Up", 1, 0))

ggplot(Weekly, aes(x = Lag1, y = binDirection)) + 
  geom_point() + 
  stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)


## -----------------------------------------------------------------------------
##TODO 13.1: Draw the five remaining scatter plots here, i.e., Lag2, Lag3, Lag4, Lag5, Volume, versus binDirection 


## -----------------------------------------------------------------------------
Weekly.train <- subset(Weekly, Year < 2009)
Weekly.test <- subset(Weekly, Year >= 2009)


## -----------------------------------------------------------------------------
lr.all <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data = Weekly.train, family = "binomial" )
summary(lr.all)


## -----------------------------------------------------------------------------
##TODO 13.4: Obtain the predictions and display the confusion matrix and the percent of correct predictions here.


## -----------------------------------------------------------------------------
##TODO 13.6: Fit a logistic regression model with `Lag1` as the only predictor, and display the confusion matrix and the percent of correct predictions.


## -----------------------------------------------------------------------------
##TODO 13.7: Fit a logistic regression model with `Lag2` as the only predictor, and display the confusion matrix and the percent of correct predictions.


## -----------------------------------------------------------------------------
##TODO 13.8: Fit a logistic regression model with `Volume` as the only predictor, and display the confusion matrix and the percent of correct predictions.


## -----------------------------------------------------------------------------
##TODO 13.10: Fit a k nearest neighbors model with `Lag2` as the only predictor and k=1, and display the confusion matrix and the percent of correct predictions.


## -----------------------------------------------------------------------------
##TODO 13.11: Fit a k nearest neighbors model with `Lag2` as the only predictor and k=3, and display the confusion matrix and the percent of correct predictions.


## -----------------------------------------------------------------------------
##TODO 13.12: Fit a k nearest neighbors model with `Lag2` as the only predictor and k=5, and display the confusion matrix and the percent of correct predictions.

