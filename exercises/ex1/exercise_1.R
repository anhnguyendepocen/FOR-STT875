## ----Connection to the data.---------------------------------------------
con <- url("http://blue.for.msu.edu/FOR875/data/batting.RData")
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

