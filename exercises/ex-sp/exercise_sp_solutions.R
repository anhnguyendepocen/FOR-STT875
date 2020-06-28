## -----------------------------------------------------------------------------
library(downloader)

download("http://www.finley-lab.com/files/data/CO-wells.zip", 
         destfile="./CO-wells.zip", mode="wb")

unzip("CO-wells.zip", exdir = ".")

list.files("CO-wells")


## ---- message=FALSE, warning=FALSE--------------------------------------------
rm(list=ls())
library(rgdal)
library(sp)
library(leaflet)
library(dplyr)
huc <- readOGR("CO-wells", "CO-HUC", verbose = FALSE)

wells <- read.csv("CO-wells/CO-wells.csv", header = TRUE, stringsAsFactors = FALSE)

coordinates(wells) <- ~Longitude+Latitude
proj4string(wells) <- "+proj=longlat +datum=WGS84"

huc <- spTransform(huc, CRS(proj4string(wells)))

wells$HUC_ID <- over(wells, huc)$HUC_ID

huc.wells <- wells@data %>% 
  group_by(HUC_ID) %>% 
  summarize(total = length(Facil_Stat), active = sum(Facil_Stat %in% c("AC","PR")), inactive = sum(!Facil_Stat %in% c("AC","PR")))

huc@data <- left_join(huc@data, huc.wells, by = "HUC_ID")

huc@data <- huc@data %>%  
  mutate(total = ifelse(is.na(total), 0, total),
         active = ifelse(is.na(active), 0, active),
         inactive = ifelse(is.na(inactive), 0, inactive))

pal <- colorBin("YlOrRd", domain = huc$total, bins = 6, pretty = TRUE)

labels <- sprintf(
  "<strong>HUC: %s</strong><br/>Total: %g<br/>Active: %g</br>Inactive: %g",
  huc$HUC_NAME, huc$total, huc$active, huc$inactive
) %>% lapply(htmltools::HTML)

                   
leaflet(width = "100%") %>% 
   # Overlay groups
  addPolygons(data = huc, fillColor = ~pal(total),
  weight = 2,
  opacity = 1,
  color = "white",
  dashArray = "3",
  fillOpacity = 0.5,
  highlight = highlightOptions(
    weight = 5,
    color = "#666",
    dashArray = "",
    fillOpacity = 0.5,
    bringToFront = TRUE),
  label = labels,
  labelOptions = labelOptions(
    style = list("font-weight" = "normal", padding = "3px 8px"),
    textsize = "15px",
    direction = "auto"), group = "Oil & gas wells") %>% 
    # Base groups
  addProviderTiles(providers$OpenStreetMap.Mapnik, group = "OSM (default)") %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "Imagery") %>%
  addProviderTiles(providers$Esri.WorldTopoMap, group = "Topo") %>%
  # Layers control
  addLayersControl(
    overlayGroups = c("Oil & gas wells"),
    baseGroups = c("OSM (default)", "Imagery", "Topo"),
    options = layersControlOptions(collapsed = FALSE)
  )%>%
  addLegend("bottomright", pal = pal, values = huc$total,
    title = "Total number of gas and oil<br>wells by USGS HUC",
    opacity = 0.5
  )



## -----------------------------------------------------------------------------
huc.wells


## ---- echo=FALSE--------------------------------------------------------------
huc <- readOGR("CO-wells", "CO-HUC", verbose = FALSE)
huc <- spTransform(huc, CRS(proj4string(wells)))
huc@data <- left_join(huc@data, huc.wells, by = "HUC_ID")

## -----------------------------------------------------------------------------
dim(huc@data)
head(huc@data)


## -----------------------------------------------------------------------------
huc@data <- huc@data %>% 
  mutate(total = ifelse(is.na(total), 0, total),
         active = ifelse(is.na(active), 0, active),
         inactive = ifelse(is.na(inactive), 0, inactive))
head(huc@data)


## -----------------------------------------------------------------------------
pal <- colorBin("YlOrRd", domain = huc$total, bins = 6, pretty = TRUE)

leaflet(width = "100%") %>% 
  
  # Overlay groups
  addPolygons(data = huc, fillColor = ~pal(total), group = "Oil & gas wells") %>% 
  
  # Base groups
  addProviderTiles(providers$OpenStreetMap.Mapnik, group = "OSM (default)") %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "Imagery") %>%
  addProviderTiles(providers$Esri.WorldTopoMap, group = "Topo")  %>%
  
  # Layers control
  addLayersControl(
    overlayGroups = c("Oil & gas wells"),
    baseGroups = c("OSM (default)", "Imagery", "Topo"),
    options = layersControlOptions(collapsed = FALSE)
  )

