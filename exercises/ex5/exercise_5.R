## ----global_options------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)

## ------------------------------------------------------------------------
data(swiss)
str(swiss)
head(swiss)
cor(swiss)

## ------------------------------------------------------------------------
plot(swiss$Education, swiss$Fertility)
plot(Fertility ~ Education, data = swiss)

## ------------------------------------------------------------------------
swiss.lm <- lm(Fertility ~ Education, data = swiss)
is.list(swiss.lm)
names(swiss.lm)

## ------------------------------------------------------------------------
swiss.lm.coef.1 <- swiss.lm$coefficients
swiss.lm.resid.1 <- swiss.lm$residuals

## ------------------------------------------------------------------------
swiss.lm.coef.1
swiss.lm.resid.1

## ------------------------------------------------------------------------
is.vector(swiss.lm.coef.1)
is.vector(swiss.lm.resid.1)

## ------------------------------------------------------------------------
# TODO 5.1: Create swiss.lm.coef.2 and swiss.lm.coef.3 here, then print swiss.lm.coef.1, swiss.lm.coef.2, and swiss.lm.coef.3

## ------------------------------------------------------------------------
# TODO 5.2: Apply is.vector and is.list on swiss.lm.coef.1, swiss.lm.coef.2, and swiss.lm.coef.3 here

## ------------------------------------------------------------------------
gapminder <- read.delim("http://blue.for.msu.edu/FOR875/data/gapminder.tsv")
str(gapminder)

## ------------------------------------------------------------------------
mean(gapminder$pop[gapminder$country == "France"])

## ------------------------------------------------------------------------
unique(gapminder$country[gapminder$continent == "Africa"])

## ------------------------------------------------------------------------
boxplot(gapminder$gdpPercap[gapminder$year == 1952])
hist(gapminder$gdpPercap[gapminder$year == 1952])
boxplot(gapminder$gdpPercap[gapminder$year == 2002])
hist(gapminder$gdpPercap[gapminder$year == 2002])

## ------------------------------------------------------------------------
gapminder$country[gapminder$pop > 150000000 & gapminder$year == 1992]

## ------------------------------------------------------------------------
# TODO 5.3: Add code to get the population of all countries meeting the noted conditions

## ------------------------------------------------------------------------
mean(gapminder$pop[gapminder$country %in% c("United States", "Mexico", "Canada") & gapminder$year == 1997])

## ------------------------------------------------------------------------
dd <- data.frame(x = c("dog", "cat", "oink", "pig", "oink", "cat", "dog", "cat", "dog"), y = c("dog", "cat", "cat", "pig", "cow", "dog", "dog", "cat", "pig"), stringsAsFactors = FALSE)
dd
dd$x[dd$x == "oink"] <- "pig"
dd
dim(dd)
dd$same <- rep("no", dim(dd)[1])
dd
dd$same[dd$x == dd$y] <- "yes"
dd

## ------------------------------------------------------------------------
# TODO 5.4: Add the G8 variable to the gapminder data frame here

## ------------------------------------------------------------------------
# TODO 5.5: Set the G8 variable to 1 for G8 countries here

## ------------------------------------------------------------------------
##Create x here
x <- seq(from=-2*pi, to=2*pi, length.out=1000)

## ------------------------------------------------------------------------
# TODO 5.6: Draw the plot here

## ------------------------------------------------------------------------
# TODO 5.7: Draw the second plot here

## ------------------------------------------------------------------------
ltrs <- c("a", "b", "q", "z")
rep(ltrs, length.out = 9)
rep(ltrs, each = 3)
rep(ltrs, times = 3)
rep(ltrs, times = c(3, 2, 4, 7))

