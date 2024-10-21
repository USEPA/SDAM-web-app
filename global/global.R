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

## regional report panels
source('./report/report_aw.R')
source('./report/report_gp.R')
source('./report/report_pnw.R')
source('./report/report_wm.R')
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
