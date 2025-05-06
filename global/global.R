# app packages
library(tidyverse)
library(randomForest)
library(bslib)
library(sf)
# library(rgdal)
library(shiny)
library(shinycssloaders)
library(shinycustomloader)
library(shinyWidgets)
library(formatR)
library(shinyjs)
library(magrittr)
library(rslates)
library(leaflet)
library(leaflet.extras)
library(dataRetrieval)
library(ggplot2)
library(usmap)
library(gotop)
library(StreamCatTools)
library(nhdplusTools)
library(prism)
library(raster)

# check for webshot and phantom
#list of packages required
list.of.packages <- c("webshot")

#checking missing packages from list
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

#install missing ones
if(length(new.packages)) install.packages(new.packages, dependencies = TRUE)

# check for phantom.js
ws <- webshot:::find_phantom()
if (is.null(ws)){
    webshot::install_phantomjs()
}

Sys.setenv(OPENSSL_CONF="/dev/null")
# app code inputs
#-----------------------------------------

## data processing and model imports
source('./models/sdam_models.R')
source('./models/model_inputs.R')

## regional data entry panels
source('./panels/panels_aw.R')
source('./panels/panels_gp.R')
source('./panels/panels_pnw.R')
source('./panels/panels_wm.R')
source('./panels/panels_ne.R')
source('./panels/panels_se.R')

## regional report panels
source('./report/report_aw.R')
source('./report/report_gp.R')
source('./report/report_pnw.R')
source('./report/report_wm.R')
source('./report/report_ne.R')
source('./report/report_se.R')
# source('./report/report_params.R')

## addtional information tabs
# source('./info/info_aw.R')
# source('./info/info_gp.R')
# source('./info/info_pnw.R')
# source('./info/info_wm.R')

## spatial funtions
source('./spatial/region_check.R')

# Load shapefile with regions
regions_leaflet <- read_sf("./spatial/regions_simp_noPRVI.shp")

# pre-load random forest models for each region
load("./models/rf_models/all_refined_rf_mods.Rdata")
aw_rf <- all_refined_rf_mods[[1]]
gp_rf <- readRDS("./models/rf_models/GreatPlainsFinal.rds")
wm_rf <- all_refined_rf_mods[[3]]
ne_rf <- readRDS("./models/rf_models/NortheastFinal.rds")
se_rf <- readRDS("./models/rf_models/SoutheastFinal.rds")

  
# return the SDAM region using lat/long inputs
point_region <- function(
  user_lat = 0,
  user_lon = 0
){
  df <- tibble(lat = user_lat,
               lon = user_lon)
  pnts_df <- sf::st_as_sf(df, coords = c("lon", "lat"), crs = 4326, remove = FALSE)
  pnts_join_df <- sf::st_join(pnts_df, regions_leaflet) 

  pnts_join_df
}


# Query StreamCat and NHDPlus APIs to get mean watershed mean elevation
# mean elevation returned in feet
ws_elev <- function(lng, lat, unit = "m"){
  # get comid from NHDPlus
  sfc <- st_sfc(st_point(c(lng,lat)), crs=4326)
  comid <- discover_nhdplus_id(sfc)
  # get mean elev (m) ## Switched from StreamCat R package to raw API due to timeouts
  # x <- sc_get_data(comid=comid, aoi='ws', metric='elev')
  url <- paste0("https://api.epa.gov/StreamCat/streams/metrics?name=elev&areaOfInterest=ws&comid=", comid)
  req <- httr::GET(url)
  x <- httr::content(req)
  # round
  if (unit == 'm'){
    x <- round(x$items[[1]]$elevws,1)
  } else if (unit == 'ft') {
    x <- round(x$items[[1]]$elevws * 3.28084,1) # convert from meters to feet
  }
  x
}


# function to retrieve 30 year normal precip data for specified lat/long
prism_fetch <- function(long, lat){
    main_dir <- "./prism_temp"
    download_dir <- file.path(main_dir)
    prism_set_dl_dir(main_dir)
    mydf <- data.frame(lat=lat, long=long)
    mydf_sf<-st_as_sf(mydf,
                        coords=c("long","lat"),
                        remove=F,
                        crs=4326)
    #Turn them into rasters with projection info
    ppt.m05_RS<-pd_stack("PRISM_ppt_30yr_normal_800mM4_05_bil")
    proj4string(ppt.m05_RS)<-CRS("+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
    ppt.m06_RS<-pd_stack("PRISM_ppt_30yr_normal_800mM4_06_bil")
    proj4string(ppt.m06_RS)<-CRS("+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
    ppt.m07_RS<-pd_stack("PRISM_ppt_30yr_normal_800mM4_07_bil")
    proj4string(ppt.m07_RS)<-CRS("+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
    ppt.m08_RS<-pd_stack("PRISM_ppt_30yr_normal_800mM4_08_bil")
    proj4string(ppt.m08_RS)<-CRS("+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
    ppt.m09_RS<-pd_stack("PRISM_ppt_30yr_normal_800mM4_09_bil")
    proj4string(ppt.m09_RS)<-CRS("+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
    ppt.m10_RS<-pd_stack("PRISM_ppt_30yr_normal_800mM4_10_bil")
    proj4string(ppt.m10_RS)<-CRS("+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")

    mydf_prism<-data.frame(UID='user_input') %>% 
        mutate(ppt.m05 = raster::extract(ppt.m05_RS, mydf_sf, fun=mean, na.rm=T, sp=F)[1],
            ppt.m06 = raster::extract(ppt.m06_RS, mydf_sf, fun=mean, na.rm=T, sp=F)[1],
            ppt.m07 = raster::extract(ppt.m07_RS, mydf_sf, fun=mean, na.rm=T, sp=F)[1],
            ppt.m08 = raster::extract(ppt.m08_RS, mydf_sf, fun=mean, na.rm=T, sp=F)[1],
            ppt.m09 = raster::extract(ppt.m09_RS, mydf_sf, fun=mean, na.rm=T, sp=F)[1],
            ppt.m10 = raster::extract(ppt.m10_RS, mydf_sf, fun=mean, na.rm=T, sp=F)[1])

    avg <- round(mean(c(mydf_prism$ppt.m05, mydf_prism$ppt.m06, mydf_prism$ppt.m07)),2)
    avg
}