## ------------------------------------------------------------------------
#TODO 8.1: Read in LifeExp.csv and check that it was read in correctly
gapminder1 <- read.csv("LifeExp.csv", header = TRUE, na.strings = "")
dim(gapminder1)

## ------------------------------------------------------------------------
#TODO 8.2: rename name of the first column to "country"
names(gapminder1)[1] <- "country"

## ------------------------------------------------------------------------
#TODO 8.3: calculate mean, median, minimum, and maximum life expetancy for each year here
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, mean, na.rm = TRUE)
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, median, na.rm = TRUE)
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, min, na.rm = TRUE)
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, max, na.rm = TRUE)

## ------------------------------------------------------------------------
#TODO 8.4: Change gapminder1 from wide to long format here
library(tidyr)
gapminder1 <- gather(data = gapminder1, key = year, value = lifeExp, 2:ncol(gapminder1))
#str(gapminder1)
dim(gapminder1)

## ------------------------------------------------------------------------
gapminder1$year <- substr(x = gapminder1$year, start = 2, stop = 5)

## ------------------------------------------------------------------------
gapminder1$year <- as.integer(gapminder1$year)

## ------------------------------------------------------------------------
#TODO 8.5: Draw histogram here
library(ggplot2)
ggplot(gapminder1, aes(x = lifeExp)) + geom_histogram()

## ------------------------------------------------------------------------
#TODO 8.6: Draw side boxplots here
ggplot(gapminder1[gapminder1$year==seq(1900, 1990, by=10),], aes(x = year, y = lifeExp)) + geom_boxplot(aes(group = year))

## ------------------------------------------------------------------------
##TODO 8.7: Draw line graph here
ggplot(gapminder1[gapminder1$country=="United States",]) + geom_line(aes(x = year, y = lifeExp))
#or
ggplot(subset(gapminder1, country == "United States")) + geom_line(aes(x = year, y = lifeExp))
#or
ggplot(data = subset(gapminder1, country == "United States"), aes(x=year, y=lifeExp)) + geom_line()
names(gapminder1)

## ------------------------------------------------------------------------
##TODO 8.8: Draw line graph grouped by country here
ggplot(gapminder1[gapminder1$country %in% c("China","India","United States","Indonesia","Brazil"),]) + geom_line(aes(x = year, y = lifeExp, color=country))

ggplot(gapminder1, aes(x = lifeExp)) 

