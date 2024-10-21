# region checker
library(sf)

# Load shapefile with regions
regions_shp <- read_sf("./spatial/simplified_regions.shp")

# Check user's lat/long coordinates and return a list of possible secondary regions based 
# on a distance threshold (i.e. 10 miles)
region_checker <- function(lat, lon, dist_mi=10){

    df <- tibble('lon'=lon, 'lat'=lat)
    pnts_df <- sf::st_as_sf(df, 
                        coords = c("lon", "lat"), 
                        crs = 4326, 
                        remove = FALSE)

    regions <- regions_shp$region
    distance_mi <- st_distance(pnts_df, regions_shp) / 1609.34      # convert meters to miles
    dist_df <- tibble(
        'region'= regions,
        'distance_mi'= as.numeric(distance_mi[1,])
    ) 
    dist_df %<>% filter(distance_mi <= dist_mi & distance_mi > 0)
    dist_df$region

}