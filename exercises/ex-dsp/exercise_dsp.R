## ----global_options-----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, tidy = TRUE)


## -----------------------------------------------------------------------------
library(tuneR)
library(downloader)

download("http://www.finley-lab.com/files/data/tempVarSongs.zip", 
         destfile="./tempVarSongs.zip", mode="wb") 

unzip("tempVarSongs.zip", exdir = ".")

list.files("tempVarSongs")

morning <- readWave("tempVarSongs/tempMorning.wav")
afternoon <- readWave("tempVarSongs/tempAfternoon.wav")
evening <- readWave("tempVarSongs/tempEvening.wav")
morning
afternoon
evening


## ---- eval = FALSE------------------------------------------------------------
## # TODO 17.1: write code to play the three sound files within R


## -----------------------------------------------------------------------------
# TODO 17.2 Produce the spectrograms for all three sounds


## -----------------------------------------------------------------------------
# TODO 17.3: Reproduce the morning spectrogram over the frequency range 2kHz - 10kHz.


## ---- include = FALSE---------------------------------------------------------
library(soundecology)
multiple_sounds(directory = paste(getwd(), "tempVarSongs", sep = "/"), resultfile = "data.csv", 
                soundindex = "acoustic_diversity", max_freq = 16000)


## -----------------------------------------------------------------------------
temporalData <- read.csv("data.csv", stringsAsFactors = FALSE)
head(temporalData)
temporalData$FILENAME <- factor(temporalData$FILENAME, levels = c("tempMorning.wav", "tempAfternoon.wav", 
                                                                  "tempEvening.wav"), ordered = TRUE)


## -----------------------------------------------------------------------------
# TODO 17.4: remove the even rows from temporalData


## ----out.width = "50%", echo=FALSE, fig.align="center"------------------------
library(knitr)
include_graphics("http://www.finley-lab.com/files/data/adiComparison.png") 


## -----------------------------------------------------------------------------
# TODO 17.5: produce a bar plot of the left channel ADI values across the three time periods


## ----out.width = "50%", echo=FALSE, fig.align="center"------------------------
include_graphics("http://www.finley-lab.com/files/data/adiBandComparison.png") 


## ---- warning = FALSE, message = FALSE, output = FALSE------------------------
# TODO 17.6: Produce the figure above

