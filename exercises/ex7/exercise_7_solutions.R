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
table(WorldBank$region2, WorldBank$life.expectancy > 60, dnn = c("Region","Life Expectancy more than 60 years"))


## ------------------------------------------------------------------------
with(WorldBank, table(life.expectancy > 60, dnn = "Life Expectancy more than 60 years"))


## ------------------------------------------------------------------------
# TODO 7.2: Create the table here
with(WorldBank, table(region2, life.expectancy > 60, dnn = c("Region","Life Expectancy more than 60 years")))


## ------------------------------------------------------------------------
with(WorldBank, mean(life.expectancy[region2 == "EastAsia"]))


## ------------------------------------------------------------------------
# TODO 7.3: Compute the mean of the non-missing life expectancies for EastAsia here
with(WorldBank, mean(life.expectancy[region2 == "EastAsia"], na.rm=TRUE))


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
with(WorldBank, mean(life.expectancy[-23.5 <= latitude & latitude < 0], na.rm = TRUE))


## ------------------------------------------------------------------------
x <- 0:50
cut(x, breaks = c(0, 10, 20, 30, 40, 50))
cut(x, breaks = c(0, 10, 20, 30, 40, 50), include.lowest = TRUE)
cut(x, breaks = c(0, 10, 20, 30, 40, 50), right = FALSE)
cut(x, breaks = c(0, 10, 20, 30, 40, 50), right = FALSE, include.lowest = TRUE)
cut(x, breaks = c(0, 10, 20, 30, 40, 50), labels = c("low", "midlow", "mid", "midhigh", "high"), include.lowest = TRUE)


## ------------------------------------------------------------------------
# TODO 7.5: Calculate the mean life expectancies here
x <- cut(WorldBank$latitude, breaks = c(-66.5, -23.5, 0, 23.5, 66.5), include.lowest = TRUE, right = FALSE, labels=c("Southern temperate","Southern tropics","Northern tropics", "Northern temperate"))

with(WorldBank, tapply(X = life.expectancy, INDEX = x, FUN = mean, na.rm = TRUE ))


## ---- message = FALSE, warning = FALSE, out.width = '100%'---------------
library(ggbiplot)
pca.wb <- na.omit(WorldBank[, c('fertility.rate', 'life.expectancy',
                                'population', 'GDP.per.capita.Current.USD', 
                                'X15.to.25.yr.female.literacy', 'region2')])
out.pca <- prcomp(pca.wb[, -ncol(pca.wb)],
                 center = TRUE,
                 scale. = TRUE) 
summary(out.pca)
ggbiplot(out.pca, groups = pca.wb$region2) + 
  theme_bw()

