## ------------------------------------------------------------------------
#TODO 8.1: Read in LifeExp.csv and check that it was read in correctly


## ------------------------------------------------------------------------
#TODO 8.2: calculate mean, median, minimum, and maximum life expetancy for each year here


## ------------------------------------------------------------------------
#TODO 8.3: Change gapminder1 from wide to long format here


## ------------------------------------------------------------------------
# TODO 8.4 Changer gapminder2 from long to wide, compare result to gapminder1


## ---- eval = FALSE-------------------------------------------------------
## gapminder2$year <- substr(x = gapminder2$year, start = 2, stop = 5)


## ---- eval = FALSE-------------------------------------------------------
## gapminder2$year <- as.integer(gapminder2$year)


## ------------------------------------------------------------------------
#TODO 8.5: Draw histogram here


## ------------------------------------------------------------------------
#TODO 8.6: Draw side boxplots here


## ------------------------------------------------------------------------
##TODO 8.7: Draw line graph here


## ------------------------------------------------------------------------
##TODO 8.8: Draw line graph grouped by country here


## ------------------------------------------------------------------------
library(tidyr)
str(us_rent_income)
head(us_rent_income)

