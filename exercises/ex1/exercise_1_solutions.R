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
