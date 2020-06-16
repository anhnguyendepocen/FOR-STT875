## ----global_options------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## ---- cache = TRUE-------------------------------------------------------
location <- "http://www.finley-lab.com/files/data/gapminder.tsv"
gapminder <- read.delim(location)


## ------------------------------------------------------------------------
str(gapminder)


## ------------------------------------------------------------------------
# TODO 4.1: Extract the third row here
gapminder[3,]


## ------------------------------------------------------------------------
# TODO 4.2: Extract the first 50 elements of the variable year here
gapminder$year[1:50]


## ------------------------------------------------------------------------
# TODO 4.3: Display the unique values in the variable year here
unique(gapminder$year)


## ------------------------------------------------------------------------
gapminder1952 <- subset(gapminder, year == 1952)
str(gapminder1952)


## ------------------------------------------------------------------------
# TODO 4.4: Create the data frame here
gapminder2002 <- subset(gapminder, year == 2002)
str(gapminder2002)


## ------------------------------------------------------------------------
# boxplot for all 5 continents
boxplot(gapminder1952$lifeExp)

# boxplots separated by continent
boxplot(lifeExp ~ continent, data = gapminder1952)


## ------------------------------------------------------------------------
# TODO 4.5: Draw the boxplots here
boxplot(lifeExp ~ continent, data = gapminder2002)


## ------------------------------------------------------------------------
# TODO 4.6: Calculate the median life expectancies here
median(gapminder1952$lifeExp)
median(gapminder2002$lifeExp)


## ------------------------------------------------------------------------
# TODO 4.7: Calculate the mean and median GDPs here
median(gapminder1952$gdpPercap)
mean(gapminder1952$gdpPercap)
median(gapminder2002$gdpPercap)
mean(gapminder2002$gdpPercap)


## ------------------------------------------------------------------------
# TODO 4.8: Create the data frame and draw the scatter plots here
gapminderChina <- subset(gapminder, country == "China")
plot(gapminderChina$year, gapminderChina$lifeExp)
plot(gapminderChina$year, gapminderChina$gdpPercap)
library(ggplot2)
ggplot(gapminderChina, aes(x = year, y = lifeExp)) + 
  geom_point()


## ------------------------------------------------------------------------
Madagascar <- subset(gapminder, country == "Madagascar")
plot(Madagascar$year, Madagascar$lifeExp, main = "Madagascar")


## ------------------------------------------------------------------------
1/0
0/0
1/0 + 5
1/0 - 1/0
-2^(10000)
exp(Inf)
exp(-Inf)
0^0
Inf^0
0^Inf
log(0)
log(-Inf)


## ------------------------------------------------------------------------
# TODO 4.9: Enter 0.2 == 0.6/3 and see what happens. Explain the potentially surprising result in commented text.
0.2 == 0.6/3


## ------------------------------------------------------------------------
point3 <- c(0.3, 0.4 - 0.1, 0.5 - 0.2, 0.6 - 0.3, 0.7 - 0.4)
point3


## ------------------------------------------------------------------------
# TODO 4.10: Perform the test here
point3 == 0.3


## ------------------------------------------------------------------------
.Machine$double.eps


## ------------------------------------------------------------------------
all.equal(0.2, 0.6/3)


## ------------------------------------------------------------------------

n <- 100
(1 + 1/n)^n
n <- 10000
(1 + 1/n)^n
n <- 1000000
(1 + 1/n)^n
n <- 100000000
(1 + 1/n)^n


## ------------------------------------------------------------------------
n <- 1000000000
(1 + 1/n)^n
n <- 10000000000
(1 + 1/n)^n
n <- 100000000000
(1 + 1/n)^n


## ------------------------------------------------------------------------
n <- 1000000000000
(1 + 1/n)^n
n <- 10000000000000
(1 + 1/n)^n
n <- 100000000000000
(1 + 1/n)^n
n <- 1000000000000000
(1 + 1/n)^n
n <- 10000000000000000
(1 + 1/n)^n


## ------------------------------------------------------------------------
us.gm <- subset(gapminder, country == 'United States')
cor(us.gm$year, us.gm$gdpPercap)
plot(us.gm$year, us.gm$gdpPercap, pch = 24, col = 'black', 
     bg = 'lightskyblue1', axes = FALSE, ylab = 'GDP Per Capita', 
     xlab = 'Year', main = 'United States', xlim = c(1950, 2010), 
     ylim = c(10000, 50000), cex = 1.5)
axis(1)
axis(2)
text(x = 1960, y = 40000, labels = expression(rho~"= 0.99"))
abline(lm(gdpPercap ~ year, data = us.gm), col = 'black', lty = 2)

