rm(list=ls())
library(rgdal)
library(leaflet)

##https://rstudio.github.io/leaflet/

wells <- read.csv("CO-wells.csv", stringsAsFactors=FALSE, header=TRUE)
head(wells)

##reproject
##map and modify look
##popups
##analysis, color, and legend


co <- readOGR(".", "CO-state-bounds")

co.huc <- readOGR(".", "CO-HUC")

proj4string(co)
proj4string(co.huc)



co.huc <- spTransform(co.huc, CRS(proj4string(co)))


names(wells)


coordinates(wells) <- ~Longitude+Latitude

proj4string(wells) <- proj4string(co)

leaflet() %>% addPolygons(data=co.huc) %>% addCircleMarkers(data = wells[wells$Facil_Stat == "PR",], popup = ~Facil_Stat) %>% addTiles() 



dim(dat)
names(dat)
head(dat)
head(dat$Spud_Date, n=100)

Latitude <- dat$Latitude
Longitude <- dat$Longitude
Spud_Date <- dat$Spud_Date
Spud_Year <- dat$Spud_Year 
Facil_Stat <- dat$Facil_Stat 
Max_TVD <- dat$Max_TVD 


save(Spud_Date, Facil_Stat

## Max_TVD Maximum Total Vertical Depth 

## table(dat$Facil_Stat)

## Spud_Date spud is the process of beginning to drill a well in the oil and gas industry

## Facil_Stat  AB-Abandoned,
##             AC-Active,
##             AL-Abandoned location,
##             CL-Closed,
##             CM-Commingled,
##             DA-Dry and abandoned,
##             DG-Drilling,
##             DM-Domestic well,
##             IJ-Injecting,
##             PA-Plugged and abandoned,
##             PR-Producing,
##             RC-Recompleted,
##             SI-Shut-in,
##             TA-Temporarily abandoned,
##             WO-Waiting on completion,
##             XX-Approved Permit
