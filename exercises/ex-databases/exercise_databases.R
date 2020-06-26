## ----global_options------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## ---- error = TRUE-------------------------------------------------------
library(RSQLite)
library(DBI)
con <- dbConnect(RSQLite::SQLite(), "myDBDir")


## ---- echo = FALSE-------------------------------------------------------
if(length(dbListTables(con)) != 0) {
  dbRemoveTable(con, "baseball")
  dbRemoveTable(con, "batting")
  dbRemoveTable(con, "pitching")
  dbRemoveTable(con, "fielding")
}


## ---- echo = FALSE-------------------------------------------------------
library(Lahman)
names(Master) <- tolower(names(Master))
names(Pitching) <- tolower(names(Pitching))
names(Batting) <- tolower(names(Batting))
names(Fielding) <- tolower(names(Fielding))


## ------------------------------------------------------------------------
library(Lahman)
dbWriteTable(con, 'baseball', Master)
dbWriteTable(con, 'batting', Batting)
dbWriteTable(con, 'pitching', Pitching)
dbWriteTable(con, 'fielding', Fielding)


## ------------------------------------------------------------------------
dbListTables(con)


## ---- message = FALSE----------------------------------------------------
library(dplyr)
battingTable <- tbl(con, "batting")
baseballTable <- tbl(con, "baseball")
fieldingTable <- tbl(con, "fielding")
pitchingTable <- tbl(con, "pitching")
battingTable


## ------------------------------------------------------------------------
dbListFields(con, "batting")


## ---- tidy = FALSE, warning = FALSE--------------------------------------
#TODO 16.1: write the dplyr query here


## ---- tidy = FALSE, warning = FALSE--------------------------------------
battingTable %>% 
  inner_join(baseballTable)


## ---- tidy = FALSE-------------------------------------------------------
# TODO 16.2: replace playerID with namefirst and namelast using an inner join


## DELETE FROM tableName

## WHERE playerid IN ('a player id', 'another player id')


## ------------------------------------------------------------------------
# TODO 16.3: remove all records of Barry Bonds, Mark McGwire, and Sammy Sosa from the database


## ---- tidy = FALSE, warning = FALSE--------------------------------------
#TODO 16.4: rerun the query listing those players with greater than 40 home runs


## ---- eval = FALSE-------------------------------------------------------
## dbDisconnect(con, shutdown = TRUE)


## UPDATE tableName

## SET desiredVariable = desiredValue

## WHERE conditions


## ------------------------------------------------------------------------
#TODO 16.5: perform the update here

