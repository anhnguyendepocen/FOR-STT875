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
## play(morning, "aplay")
## play(afternoon, "aplay")
## play(evening, "aplay")


## -----------------------------------------------------------------------------
# TODO 17.2 Produce the spectrograms for all three sounds
library(seewave)
spectro(morning)
spectro(afternoon)
spectro(evening)


## -----------------------------------------------------------------------------
# TODO 17.3: Reproduce the morning spectrogram over the frequency range 2kHz - 10kHz.
spectro(morning, flim = c(2, 10))


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
temporalData <- temporalData[c(1, 3, 5), ]
temporalData


## ----out.width = "50%", echo=FALSE, fig.align="center"------------------------
library(knitr)
include_graphics("http://www.finley-lab.com/files/data/adiComparison.png") 


## -----------------------------------------------------------------------------
# TODO 17.5: produce a bar plot of the left channel ADI values across the three time periods
library(ggplot2)
ggplot(data = temporalData, aes(x = FILENAME, y = LEFT_CHANNEL)) + 
  geom_bar(stat = "identity", color = "blue", fill = "red") + 
  labs(y = "Acoustic Diversity Index", x = "Recording") + 
  theme_classic()


## ----out.width = "50%", echo=FALSE, fig.align="center"------------------------
include_graphics("http://www.finley-lab.com/files/data/adiBandComparison.png") 


## ---- warning = FALSE, message = FALSE, output = FALSE------------------------
# TODO 17.6: Produce the figure above
adiMorning <- acoustic_diversity(morning, max_freq = 16000)
adiAfternoon <- acoustic_diversity(afternoon, max_freq = 16000)
adiEvening <- acoustic_diversity(evening, max_freq = 16000)
longADIMorning <- data.frame(adiMorning$left_band_values, 1:length(adiMorning$left_band_values), 
                             rep("morning", times = length(adiMorning$left_band_values)))
colnames(longADIMorning) <- c("values", "range", "time")
longADIAfternoon <- data.frame(adiAfternoon$left_band_values, 1:length(adiAfternoon$left_bandrange_values), 
                             rep("afternoon", times = length(adiAfternoon$left_band_values)))
colnames(longADIAfternoon) <- c("values", "range", "time")
longADIEvening <- data.frame(adiEvening$left_band_values, 1:length(adiEvening$left_bandrange_values), 
                             rep("evening", times = length(adiEvening$left_band_values)))
colnames(longADIEvening) <- c("values", "range", "time")
allADI <- rbind(longADIMorning, longADIAfternoon, longADIEvening)
allADI$range <- factor(allADI$range, order = FALSE)
head(allADI)
ggplot(data = allADI, aes(x = time, y = values, fill = range)) +
  geom_bar(stat = "identity", position = "dodge")

