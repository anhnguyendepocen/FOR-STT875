## ----global_options------------------------------------------------------
knitr::opts_chunk$set(comment = NA)


## ------------------------------------------------------------------------
con <- url("http://www.finley-lab.com/files/data/ZF_trees.gz")
load(con)
close(con)
rm(con)
ls()


## ------------------------------------------------------------------------
# TODO 3.1: List the species here
spp[1:25]


## ------------------------------------------------------------------------
# TODO 3.2: List the DBH here
dbh[1:25]


## ------------------------------------------------------------------------
# TODO 3.3: List the volume here
vol[1:25]


## ------------------------------------------------------------------------
animals <- c("dog", "cat", "dog", "cat", "horse", "dog")
table(animals)


## ------------------------------------------------------------------------
# TODO 3.4: Show the table here
table(spp)


## ------------------------------------------------------------------------
# TODO 3.5: Show the sorted table here
spp_table <- sort(table(spp))


## ------------------------------------------------------------------------
# TODO 3.6: Write the three most abundant spp here (comment out your answer using the # symbol)


## ------------------------------------------------------------------------
# TODO 3.7: Create the top_spp table here
top_spp <- spp_table[(length(spp_table)-2):length(spp_table)]
top_spp


## ------------------------------------------------------------------------
# TODO 3.8: Create the bar graph here
barplot(top_spp)


## ------------------------------------------------------------------------
# TODO 3.9: Create the bar graph with y-axis labels here
barplot(top_spp, ylab="Number of trees")


## ------------------------------------------------------------------------
# TODO 3.10: Show the sorted table here
sort(table(spp), decreasing=TRUE)


## ------------------------------------------------------------------------
# TODO 3.11: Compute the answer here
length(dbh)


## ------------------------------------------------------------------------
animals
names(animals) <- c("Asta", "Felix", "Snowy", "Garfield", "Mr. Ed", "Spud")
animals


## ------------------------------------------------------------------------
# TODO 3.12: Create the vectors with names and list the first ten elements of each here.
names(dbh) <- spp
names(vol) <- spp

dbh[1:10]
vol[1:10]


## ------------------------------------------------------------------------
set.seed(123) #Set the seed for reproducible random number generation
x <- rbinom(10, 20, 0.9) #Generate 10 binomial(20, 0.9) values
y <- rbinom(10, 20, 0.8) #Generate 10 binomial(20, 0.8) values
x
y
x[x > 16] #Values of x which are larger than 16
x[x == 18] #Values of x which are equal to 18
length(x[x == 18]) #How many values of x are equal to 18?
x[y < 15] #Values of x for which the corresponding values of y are less than 15
x[x < y] #Values of x which are less than the corresponding values of y
x[x == 18] <- 0 #Replace 18 by 0 in x
x


## ------------------------------------------------------------------------
# TODO 3.13: Count the number of maple trees here
length(spp[spp=="maple"])
sum(spp=="maple")


## ------------------------------------------------------------------------
c(FALSE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)
c(FALSE, TRUE, FALSE) & c(TRUE, TRUE, FALSE)


## ------------------------------------------------------------------------
a <- 1:5

b <- c(TRUE, TRUE, TRUE, FALSE, FALSE)
e <- c(TRUE, FALSE, FALSE, FALSE, TRUE)

a[b | e]


## ------------------------------------------------------------------------
letters
letters %in% c("a", "m", "q", "s")


## ----QuestionA-----------------------------------------------------------
# TODO 3.14: Answer to question here
dbh_l_sf <- dbh[spp %in% c("larch","silver fir")]


## ----QuestionB-----------------------------------------------------------
# TODO 3.15: Answer to question here
mean(dbh_l_sf)
sd(dbh_l_sf)


## ----QuestionC-----------------------------------------------------------
# TODO 3.16: Answer to question here
dbh_l_sf_2 <- dbh[spp=="larch" | spp=="silver fir"]


## ----QuestionD-----------------------------------------------------------
# TODO 3.17: Answer to question here
max(dbh[spp=="beech"])
max(vol[spp=="beech"])


## ------------------------------------------------------------------------
library(multcomp)
zurich.df <- data.frame(spp = spp, dbh, vol)
zurich.df.sub <- zurich.df[zurich.df$spp %in% c('ash', 'larch', 'maple', 
						'silver fir'), ]
zurich.df.sub$spp <- factor(zurich.df.sub$spp)
# Run ANOVA
anova.out <- aov(dbh ~ spp, data = zurich.df.sub)
summary(anova.out)
# Tukey's Pairwise comparisons
tukey.out <- glht(anova.out, linfct = mcp(spp = 'Tukey'))
tukey.out
# Letters are obtained from the above
cld(tukey.out)
boxplot(dbh ~ spp, data = zurich.df.sub, xlab = 'Species', ylab = 'DBH', 
	col = 'grey', names = c('Ash', 'Larch', 'Maple', 'Silver Fir'), 
	las = 1, ylim = c(0, 100), 
	main = 'Results of One-Way ANOVA and Tukeys Pairwise Comparisons')
text(x = 1, y = 85, labels = 'C')
text(x = 2, y = 100, labels = 'B')
text(x = 3, y = 65, labels = 'A')
text(x = 4, y = 82, labels = 'B')

