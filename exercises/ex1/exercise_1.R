## ---- echo = FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(comment=NA, tidy=TRUE, prompt=FALSE)


## ----Connection to the data.---------------------------------------------
con <- url("http://www.finley-lab.com/files/data/batting.RData")
load(con)
close(con)
rm(con)


## ----List all objects in the workspace.----------------------------------
ls()


## ----Structure of JimRiceBA----------------------------------------------
JimRiceBA
str(JimRiceBA)


## ----Summary stats for Jim Rice.-----------------------------------------
mean(JimRiceBA)
max(JimRiceBA)
which.max(JimRiceBA)
min(JimRiceBA)
which.min(JimRiceBA)


## ----Changes in performance from year to year.---------------------------
JimRiceBAdiffs <- diff(JimRiceBA, lag=1)
JimRiceBAdiffs
max(JimRiceBAdiffs)
which.max(JimRiceBAdiffs)
min(JimRiceBAdiffs)
which.min(JimRiceBAdiffs)


## ----Correlations between different performance metrics.-----------------
cor(JimRiceBA, JimRiceRBI)
cor(JimRiceBA, JimRiceHR)
cor(JimRiceHR, JimRiceRBI)
plot(JimRiceBA, JimRiceRBI)
plot(JimRiceBA, JimRiceHR)
plot(JimRiceHR, JimRiceRBI)


## ------------------------------------------------------------------------
names(batting_stats)
dim(batting_stats)
batting_stats[90000, c(32, 25, 13, 14)] 
batting_stats[c(90000, 91000, 92000), c(32, 25, 13, 14)]


## ------------------------------------------------------------------------
RockyColavito <- subset(batting_stats, playerName == "Rocky Colavito")
RockyColavito[, c(32, 25, 13, 14)]
Over400 <- subset(batting_stats, BA > 0.4 & G >= 100)
dim(Over400)
Over400[, c("playerName", "BA", "yearID")]

