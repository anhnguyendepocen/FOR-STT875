## ----global_options------------------------------------------------------
knitr::opts_chunk$set(comment = NA)


## ---- cache = TRUE-------------------------------------------------------
gapminder <- read.delim("http://www.finley-lab.com/files/data/gapminder.tsv", header = TRUE)
str(gapminder)


## ------------------------------------------------------------------------
library(ggplot2)
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()


## ------------------------------------------------------------------------
ggplot(data = gapminder, aes(x = log10(gdpPercap), y = lifeExp)) +
  geom_point()


## ------------------------------------------------------------------------
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10()


## ------------------------------------------------------------------------
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10(name = "per capita GDP (log10 scaled)")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10() + 
  xlab("per capita GDP (log10 scaled)")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10() + 
  labs(x = "per capita GDP (log10 scaled)")


## ------------------------------------------------------------------------
p <- ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  scale_x_log10() + 
  labs(x = "per capita GDP (log10 scaled)", y = "life expectancy")
p + geom_point()


## ----p-col, echo=FALSE---------------------------------------------------
p + geom_point(aes(color = continent)) + labs(title = "TODO 6.1: plot 1")


## ----p-col-lm, echo=FALSE------------------------------------------------
p + geom_point(size=1, aes(color = continent)) + stat_smooth(method = lm, se = FALSE) + labs(title = "TODO 6.2: plot 2")


## ----p-col-lm-grn, echo=FALSE--------------------------------------------
p + geom_point(aes(color = continent)) + stat_smooth(method = lm, se = FALSE, lwd = 2, color = "green") + labs(title = "TODO 6.3: plot 3")


## ----p-col-lm-grn-cont, echo=FALSE---------------------------------------
p + geom_point(aes(color = continent)) + stat_smooth(method = lm, se = FALSE, aes(color = continent), lwd = 1.5) + labs(title = "TODO 6.4: plot 4")


## ----p-col-sm-grn-cont, echo=FALSE---------------------------------------
p + geom_point(aes(color = continent)) + stat_smooth(method = loess, se = FALSE, aes(color = continent), lwd = 1.5) + labs(title = "TODO 6.5: plot 5")


## ---- echo=FALSE---------------------------------------------------------
ggplot(data = subset(gapminder, country == "Rwanda"), aes(x = year, y = lifeExp)) + geom_line() + labs(title = "TODO 6.6: plot 6")


## ---- echo=FALSE---------------------------------------------------------
ggplot(data = subset(gapminder, country == "Rwanda"), aes(x = year, y = lifeExp)) + geom_line() + geom_point() + labs(title = "TODO 6.7: plot 7")


## ---- echo=FALSE---------------------------------------------------------
five_countries <- c("China", "United States", "Finland", "Germany", "Norway")
ggplot(data = subset(gapminder, country %in% five_countries), aes(x = year, y = lifeExp, color = country)) + 
  geom_line() + 
  geom_point() + 
  labs(title = "TODO 6.8: plot 8")


## ------------------------------------------------------------------------
ggplot(data = gapminder, aes(x = lifeExp)) + geom_histogram()


## ------------------------------------------------------------------------
ggplot(data = subset(gapminder, year %in% c(1952, 1972) & continent != "Oceania"), aes(x = lifeExp)) + 
  geom_histogram(aes(fill = continent)) +
  facet_wrap(continent ~ year)
ggplot(data = subset(gapminder, year %in% c(1952, 1972) & continent != "Oceania"), aes(x = lifeExp)) +
  geom_histogram(aes(fill = continent)) +
  facet_wrap(year ~ continent)
ggplot(data = subset(gapminder, year %in% c(1952, 1972) & continent != "Oceania"), aes(x = lifeExp)) + 
  geom_histogram(aes(fill = continent)) + 
  facet_grid(continent ~ year)
ggplot(data = subset(gapminder, year %in% c(1952, 1972) & continent != "Oceania"), aes(x = lifeExp)) + 
  geom_histogram(aes(fill = continent)) + 
  facet_grid(year ~ continent)


## ------------------------------------------------------------------------
ggplot(data = subset(gapminder, continent != "Oceania"), aes(x = lifeExp)) + geom_histogram(aes(fill = continent)) + facet_grid(continent ~ .)


## ------------------------------------------------------------------------
ggplot(gapminder, aes(x = year, y = lifeExp)) + geom_boxplot(aes(group = year))


## ---- echo = FALSE, fig.height = 12, message = FALSE---------------------
library(ggthemes)
library(ggpubr)
plot.1 <- p + 
  geom_point(aes(color = continent)) + 
  scale_color_colorblind() + 
  stat_smooth(method = lm, se = FALSE, aes(color = continent)) + 
  theme_bw() + 
  labs(x = 'Year', y = 'Life Expectancy', color = 'Continent')
plot.2 <- ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
      geom_boxplot(aes(group = year), fill = 'grey') + 
      theme_classic() + 
      labs(x = 'Year', y = 'Life Expectancy')
plot.3 <- ggplot(data = subset(gapminder, country == 'United States'), 
		 aes(x = year, y = lifeExp)) + 
	    geom_line(col = 'blue') + 
	    geom_point(col = 'black') + 
	    labs(x = 'Year', y = 'Life Expectancy')
ggarrange(plot.1, plot.2, plot.3, ncol = 1, nrow = 3, labels = c('A', 'B', 'C'))

