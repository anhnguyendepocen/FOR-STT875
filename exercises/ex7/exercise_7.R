## ----global_options------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## ---- cache = TRUE, tidy=TRUE--------------------------------------------
WorldBank <- read.csv("http://www.finley-lab.com/files/data/WorldBank.csv", header = TRUE, 
                      stringsAsFactors = TRUE)
str(WorldBank)


## ------------------------------------------------------------------------
levels(WorldBank$region)


## ------------------------------------------------------------------------
WorldBank$region2 <- WorldBank$region
levels(WorldBank$region2) <- c("EastAsia", "Europe", "LatAmer", "MideastAndNorthAfrica", "NorthAmer", "SouthAsia", "SubSaharanAfrica")


## ------------------------------------------------------------------------
table(WorldBank$region2)


## ------------------------------------------------------------------------
sort(table(WorldBank$region2))
sort(table(WorldBank$region2), decreasing = TRUE)


## ------------------------------------------------------------------------
#Number of unique years
n.years <- length(unique(WorldBank$year))


## ------------------------------------------------------------------------
#Use table to tabulate the number of countries per region
sort(table(WorldBank$region2))/n.years


## ------------------------------------------------------------------------
table(WorldBank$life.expectancy > 60)


## ------------------------------------------------------------------------
table(WorldBank$life.expectancy > 60, dnn = "Life Expectancy more than 60 years")


## ------------------------------------------------------------------------
table(WorldBank$region2, WorldBank$life.expectancy > 60)


## ------------------------------------------------------------------------
# TODO 7.1: Create the labeled two-way table here


## ------------------------------------------------------------------------
with(WorldBank, table(life.expectancy > 60, dnn = "Life Expectancy more than 60 years"))


## ------------------------------------------------------------------------
# TODO 7.2: Create the table here


## ------------------------------------------------------------------------
with(WorldBank, mean(life.expectancy[region2 == "EastAsia"]))


## ------------------------------------------------------------------------
# TODO 7.3: Compute the mean of the non-missing life expectancies for EastAsia here


## ------------------------------------------------------------------------
with(WorldBank, mean(life.expectancy[region2 == "Europe"], na.rm = TRUE))
with(WorldBank, mean(life.expectancy[region2 == "LatAmer"], na.rm = TRUE))


## ------------------------------------------------------------------------
with(WorldBank, tapply(X = life.expectancy, INDEX = region2, FUN = mean, na.rm = TRUE ))


## ------------------------------------------------------------------------
with(WorldBank, tapply(X = life.expectancy, INDEX = list(region2, income), FUN = mean, na.rm = TRUE ))


## ------------------------------------------------------------------------
with(WorldBank, mean(life.expectancy[0 <= latitude & latitude < 23.5], na.rm = TRUE))


## ------------------------------------------------------------------------
# TODO 7.4: Compute the mean life expectancy for the southern tropics here


## ------------------------------------------------------------------------
x <- 0:50
cut(x, breaks = c(0, 10, 20, 30, 40, 50))
cut(x, breaks = c(0, 10, 20, 30, 40, 50), include.lowest = TRUE)
cut(x, breaks = c(0, 10, 20, 30, 40, 50), right = FALSE)
cut(x, breaks = c(0, 10, 20, 30, 40, 50), right = FALSE, include.lowest = TRUE)
cut(x, breaks = c(0, 10, 20, 30, 40, 50), labels = c("low", "midlow", "mid", "midhigh", "high"), include.lowest = TRUE)


## ------------------------------------------------------------------------
# TODO 7.5: Calculate the mean life expectancies here

