## ------------------------------------------------------------------------
con <- url("http://www.finley-lab.com/files/data/NE-temp.RData")
load(con)
close(con)
rm(con)
ls()


## ------------------------------------------------------------------------
is.vector(ne.station.1)
is.numeric(ne.station.1)


## ------------------------------------------------------------------------
head(ne.station.1)
mean(ne.station.1)
max(ne.station.1)
summary(ne.station.1)


## ---- comment=NA---------------------------------------------------------
which.max(ne.station.1)
ne.station.1[which.max(ne.station.1)]
max(ne.station.1)


## ------------------------------------------------------------------------
cor(ne.station.1, ne.station.2)


## ---- fig.width=4, fig.height=4, fig.align='center'----------------------
plot(ne.station.1, ne.station.2)


## ------------------------------------------------------------------------
length(ne.station.2)


## ------------------------------------------------------------------------
which.max(ne.station.2)
#or
names(which.max(ne.station.2))
#or
ne.station.2[which.max(ne.station.2)]


## ------------------------------------------------------------------------
which.min(ne.station.2)
#or
names(which.min(ne.station.2))
#or
ne.station.2[which.min(ne.station.2)]


## ------------------------------------------------------------------------
mean(ne.station.2)


## ------------------------------------------------------------------------
library(leaflet)

##find some really hot and cold stations
hot.stations <- subset(ne.stations, yr2010.m07 > 22 & elev >= 700)
cold.stations <- subset(ne.stations, yr2010.m01 < -12 & elev >= 700)

##make a pretty map with labels
all.popup <-  paste("Station ID: ",ne.stations[,"stationID"],"<br>July 2010 temp (C): ",round(ne.stations[,"yr2010.m07"],2),sep="")
hot.popup <- paste("Station ID: ",hot.stations[,"stationID"],"<br>July 2010 temp (C): ",round(hot.stations[,"yr2010.m07"],2),sep="")
cold.popup <- paste("Station ID: ",cold.stations[,"stationID"],"<br>January 2010 temp (C): ",round(cold.stations[,"yr2010.m01"],2),sep="")

m <- leaflet(ne.stations, width="100%")%>%
    addCircleMarkers(~lon, ~lat, radius=2, fillOpacity=0.5, color="orange", popup=all.popup)%>%
    addMarkers(~lon, ~lat, data=hot.stations, group="Hot stations", popup= ~hot.popup) %>%
    addMarkers(~lon, ~lat, data=cold.stations, group="Cold stations", popup= ~cold.popup) %>%
    addTiles(group = "Roads etc.") %>%
    addProviderTiles("Esri.WorldImagery", group = "Satellite") %>%
    addProviderTiles("Thunderforest.Landscape", group = "Topographical") %>%
    addLayersControl(baseGroup = c("Roads etc.", "Satellite", "Topographical"),
                     overlayGroups = c("Hot stations", "Cold stations"),
                     options = layersControlOptions(collapsed = FALSE)
                     ) %>%
    hideGroup(c("Hot stations", "Cold stations"))

m

