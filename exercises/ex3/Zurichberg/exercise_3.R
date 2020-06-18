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


## ------------------------------------------------------------------------
# TODO 3.2: List the DBH here


## ------------------------------------------------------------------------
# TODO 3.3: List the volume here


## ------------------------------------------------------------------------
animals <- c("dog", "cat", "dog", "cat", "horse", "dog")
table(animals)


## ------------------------------------------------------------------------
# TODO 3.4: Show the table here


## ------------------------------------------------------------------------
# TODO 3.5: Show the sorted table here


## ------------------------------------------------------------------------
# TODO 3.6: Write the three most abundant spp here (comment out your answer using the # symbol)


## ------------------------------------------------------------------------
# TODO 3.7: Create the top_spp table here


## ------------------------------------------------------------------------
# TODO 3.8: Create the bar graph here


## ------------------------------------------------------------------------
# TODO 3.9: Create the bar graph with y-axis labels here


## ------------------------------------------------------------------------
# TODO 3.10: Show the sorted table here


## ------------------------------------------------------------------------
# TODO 3.11: Compute the answer here


## ------------------------------------------------------------------------
animals
names(animals) <- c("Asta", "Felix", "Snowy", "Garfield", "Mr. Ed", "Spud")
animals


## ------------------------------------------------------------------------
# TODO 3.12: Create the vectors with names and list the first ten elements of each here.


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


## ----QuestionB-----------------------------------------------------------
# TODO 3.15: Answer to question here


## ----QuestionC-----------------------------------------------------------
# TODO 3.16: Answer to question here


## ----QuestionD-----------------------------------------------------------
# TODO 3.17: Answer to question here

