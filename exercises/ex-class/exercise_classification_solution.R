## ----global_options------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)

## ------------------------------------------------------------------------
library(ISLR)
str(Weekly)

## ---- message=FALSE, tidy = FALSE----------------------------------------
library(ggplot2)
library(dplyr)

Weekly <- mutate(Weekly, binDirection=ifelse(Direction == "Up", 1, 0))

ggplot(Weekly, aes(x = Lag1, y = binDirection)) + 
  geom_point() + 
  stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)

## ------------------------------------------------------------------------
##TODO 13.1: Draw the five remaining scatter plots here, i.e., Lag2, Lag3, Lag4, Lag5, Volume, versus binDirection 
ggplot(Weekly, aes(x = Lag2, y = binDirection)) + geom_point() + stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)
ggplot(Weekly, aes(x = Lag3, y = binDirection)) + geom_point() + stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)
ggplot(Weekly, aes(x = Lag4, y = binDirection)) + geom_point() + stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)
ggplot(Weekly, aes(x = Lag5, y = binDirection)) + geom_point() + stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)
ggplot(Weekly, aes(x = Volume, y = binDirection)) + geom_point() + stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)

## ------------------------------------------------------------------------
Weekly.train <- subset(Weekly, Year < 2009)
Weekly.test <- subset(Weekly, Year >= 2009)

## ------------------------------------------------------------------------
lr.all <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data = Weekly.train, family = "binomial" )
summary(lr.all)

## ------------------------------------------------------------------------
##TODO 13.4: Obtain the predictions and display the confusion matrix and the percent of correct predictions here.
percent.correct <- function(x){100*sum(diag(x))/sum(x)}

pred <- predict(lr.all, Weekly.test, type = "response")
pred.1 <- rep("No", length(pred))
pred.1[pred > 0.5] <- "Yes"
x.1 <- table(pred.1, Weekly.test$Direction)
x.1
percent.correct(x.1)

## ------------------------------------------------------------------------
##TODO 13.6: Fit a logistic regression model with `Lag1` as the only predictor, and display the confusion matrix and the percent of correct predictions.
lr.all <- glm(Direction ~ Lag1, data = Weekly.train, family = "binomial" )
summary(lr.all)
pred <- predict(lr.all, Weekly.test, type = "response")
pred.1 <- rep("No", length(pred))
pred.1[pred > 0.5] <- "Yes"
x.2 <- table(pred.1, Weekly.test$Direction)
x.2
percent.correct(x.2)

## ------------------------------------------------------------------------
##TODO 13.7: Fit a logistic regression model with `Lag2` as the only predictor, and display the confusion matrix and the percent of correct predictions.
lr.all <- glm(Direction ~ Lag2, data = Weekly.train, family = "binomial" )
summary(lr.all)
pred <- predict(lr.all, Weekly.test, type = "response")
pred.1 <- rep("No", length(pred))
pred.1[pred > 0.5] <- "Yes"
x.3 <- table(pred.1, Weekly.test$Direction)
x.3
percent.correct(x.3)

## ------------------------------------------------------------------------
##TODO 13.8: Fit a logistic regression model with `Volume` as the only predictor, and display the confusion matrix and the percent of correct predictions.
lr.all <- glm(Direction ~ Volume, data = Weekly.train, family = "binomial" )
summary(lr.all)
pred <- predict(lr.all, Weekly.test, type = "response")
pred.1 <- rep("No", length(pred))
pred.1[pred > 0.5] <- "Yes"
x.4 <- table(pred.1, Weekly.test$Direction)
x.4
percent.correct(x.4)

## ------------------------------------------------------------------------
##TODO 13.10: Fit a k nearest neighbors model with `Lag2` as the only predictor and k=1, and display the confusion matrix and the percent of correct predictions.
library(class)
set.seed(875)
blah <- knn(Weekly.train[3], Weekly.test[3], Weekly.train[,9], k = 1, prob = TRUE)
k.1 <- table(blah, Weekly.test[,9])
k.1
percent.correct(k.1)

## ------------------------------------------------------------------------
##TODO 13.11: Fit a k nearest neighbors model with `Lag2` as the only predictor and k=3, and display the confusion matrix and the percent of correct predictions.
set.seed(875)
blah <- knn(Weekly.train[3], Weekly.test[3], Weekly.train[,9], k = 3, prob = TRUE)
k.3 <- table(blah, Weekly.test[,9])
k.3
percent.correct(k.3)

## ------------------------------------------------------------------------
##TODO 13.12: Fit a k nearest neighbors model with `Lag2` as the only predictor and k=5, and display the confusion matrix and the percent of correct predictions.
set.seed(875)
blah <- knn(Weekly.train[3], Weekly.test[3], Weekly.train[,9], k = 5, prob = TRUE)
k.5 <- table(blah, Weekly.test[,9])
k.5
percent.correct(k.5)

