## @knitr libraries
library(dplyr); library(leaflet); library(RCurl)


## @knitr getData

# scrape travel log data
# URL https://docs.google.com/spreadsheets/d/1Bvxokjblb0Jv1dSphDpBdLPgdsndckdbHdRorkyD4vk/pubhtml

f = getForm("https://spreadsheets.google.com/spreadsheet/pub", 
              hl ="en_US", key = "1Bvxokjblb0Jv1dSphDpBdLPgdsndckdbHdRorkyD4vk", 
              output = "csv", 
              .opts = list(followlocation = TRUE, verbose = TRUE, ssl.verifypeer = FALSE)) 

tLog <- read.csv(textConnection(f))


## @knitr desc
# check data frame
glimpse(tLog)
head(tLog)


## @knitr plot
# plot it
leaflet(data = tLog, width = 910, height = 500) %>% 
  setView(lat = 25, lng = -38, zoom = 2) %>%
  addTiles() %>%
  addMarkers(~Lon, ~Lat, popup = ~as.character(Location))

## @knitr plotMobile
# plot it
leaflet(data = tLog, width = 400, height = 500) %>% 
  setView(lat = 25, lng = -38, zoom = 2) %>%
  addTiles() %>%
  addMarkers(~Lon, ~Lat, popup = ~as.character(Location))
