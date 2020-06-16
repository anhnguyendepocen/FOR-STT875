# Exercise: 1
# Author: Andy Finley

# Setup -------------------------------------------------------------------
con <- url("http://www.finley-lab.com/files/data/batting.RData")
load(con)
close(con)
rm(con)
ls()

# Example Question --------------------------------------------------------
## Question: What was Jim Rice's mean BA?

## Code:
mean(JimRiceBA)

## Answer: Jim Rice's mean BA was 0.292625.


# Question 1 --------------------------------------------------------------
## How many seasons did Ted Williams play? 
## Code:
# Write the code here that you used to answer the first question.

## Answer: 
length(TedWilliamsBA)

# Question 2 --------------------------------------------------------------

## In which season did Ted Williams have his highest batting average?

which.max(TedWilliamsBA)

# Question 3 --------------------------------------------------------------

## What was this highest batting average?

max(TedWilliamsBA)

# Question 4 --------------------------------------------------------------

mean(TedWilliamsBA)

# Question 5 --------------------------------------------------------------

## For which pair of the variables representing home runs, RBIs, and batting average, is the correlation the highest? What is this correlation?

cor(cbind(TedWilliamsBA,TedWilliamsHR,TedWilliamsRBI))

##TedWilliamsRBI and TedWilliamsHR with cor of 0.84

# Question 6 --------------------------------------------------------------

## What was the largest jump in Ted Williams’ RBIs from one season to the next? In which season did this jump occur?

diff(TedWilliamsRBI, lag=1)
which.max(abs(diff(TedWilliamsRBI, lab=1)))

# Question 7 --------------------------------------------------------------

## Extract all the rows giving data on the baseball player Lou Gehrig and 
## assign the result to an object called `LouGehrig`

LouGehrig <- subset(batting_stats, playerName == 'Lou Gehrig')

# Question 8 --------------------------------------------------------------

# Display the player name, batting average, numer of home runs, number of RBIs,
# and year for Lou Gehrig

LG.info <- LouGehrig[, c('playerName', 'BA', 'HR', 'RBI', 'yearID')]
LG.info
# Question 9 --------------------------------------------------------------

# Display the same data only for the years when Lou Gehrig hit at least
# 30 home runs

subset(LG.info, HR > 30)

# Question 10 -------------------------------------------------------------

# Extract all the rows from batting_stats where the number of home runs 
# is 50 or more and the batting average is over 0.300. Assign the result 
# to an object called PowerAndAverage. 

PowerAndAverage <- subset(batting_stats, HR > 50 & BA > 0.3)

# Question 11 -------------------------------------------------------------

# Which players had years with 50 or more home runs and an average over 0.300? 

unique(PowerAndAverage$playerName)

# Question 12 -------------------------------------------------------------

# In which years did these players achieve these results? 

PowerAndAverage$yearID

# Question 13 -------------------------------------------------------------

# Try to extract the rows when the number of home runs is greater than 90. 
# What happens? 

subset(batting_stats, HR > 90)
