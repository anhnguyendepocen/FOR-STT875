## ------------------------------------------------------------------------
#TODO 8.1: Read in LifeExp.csv and check that it was read in correctly
gapminder1 <- read.csv("LifeExp.csv", header = TRUE, na.strings = "")
dim(gapminder1)


## ------------------------------------------------------------------------
#TODO 8.2: calculate mean, median, minimum, and maximum life expetancy for each year here
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, mean, na.rm = TRUE)
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, median, na.rm = TRUE)
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, min, na.rm = TRUE)
apply(gapminder1[,2:ncol(gapminder1)], MARGIN = 2, max, na.rm = TRUE)


## ------------------------------------------------------------------------
#TODO 8.3: Change gapminder1 from wide to long format here
library(tidyr)
gapminder2 <- pivot_longer(data = gapminder1, cols = 2:ncol(gapminder1), 
			   names_to = 'year', values_to = 'lifeExp') 
str(gapminder2)
dim(gapminder2)


## ------------------------------------------------------------------------
# TODO 8.4 Changer gapminder2 from long to wide, compare result to gapminder1
gapminder3 <- pivot_wider(data = gapminder2, names_from = year, values_from = lifeExp)
all.equal(gapminder1, as_tibble(gapminder3))


## ------------------------------------------------------------------------
gapminder2$year <- substr(x = gapminder2$year, start = 2, stop = 5)


## ------------------------------------------------------------------------
gapminder2$year <- as.integer(gapminder2$year)


## ------------------------------------------------------------------------
#TODO 8.5: Draw histogram here
library(ggplot2)
ggplot(gapminder2, aes(x = lifeExp)) + geom_histogram()


## ------------------------------------------------------------------------
#TODO 8.6: Draw side boxplots here
typeof(gapminder2$year)
ggplot(gapminder2[gapminder2$year %in% seq(1900, 1990, by=10),], aes(x = year, y = lifeExp)) + geom_boxplot(aes(group = year))

ggplot(gapminder2[gapminder2$year %in% seq(1900, 1990, by=10),], aes(x = factor(year), y = lifeExp)) + geom_boxplot()


## ------------------------------------------------------------------------
##TODO 8.7: Draw line graph here
ggplot(gapminder2[gapminder2$country=="United States",]) + geom_line(aes(x = year, y = lifeExp))
#or
ggplot(subset(gapminder2, country == "United States")) + geom_line(aes(x = year, y = lifeExp))
#or
ggplot(data = subset(gapminder2, country == "United States"), aes(x=year, y=lifeExp)) + geom_line()
names(gapminder2)


## ------------------------------------------------------------------------
##TODO 8.8: Draw line graph grouped by country here
ggplot(gapminder2[gapminder2$country %in% c("China","India","United States","Indonesia","Brazil"),]) + geom_line(aes(x = year, y = lifeExp, color=country))

countries <- c("China", "India", "United States", "Indonesia", "Brazil")
lifeExp_countries <- subset(gapminder2, country %in% countries)
ggplot(lifeExp_countries, aes(year, lifeExp, group = country)) + geom_line(aes(color = country))


## ------------------------------------------------------------------------
fish.wide <- fish_encounters %>%
  pivot_wider(names_from = station, values_from = seen)
fish.long <- fish.wide %>%
  pivot_longer(cols = -fish, names_to = 'station', values_to = 'seen')
fish.long
fish_encounters


## ------------------------------------------------------------------------
str(us_rent_income)
head(us_rent_income)


## ------------------------------------------------------------------------
us_rent_income %>%
  pivot_wider(
    names_from = variable,
    names_sep = ".",
    values_from = c(estimate, moe)
  )

