library(sf)

points <- data.frame('id' = c('A','B','B'),
                     'obj.id' = c('x1', 'x2', 'x3'),'x' = c(60, 65, 66),
                     'y' = c(130, 134, 135))

lines <- data.frame('id' = c('A','B'),
                    'x1' = c(58, 64), 'y1' = c(128, 132),
                    'x2' = c(61, 67), 'y2' = c(131, 135))

rows <- split(lines, seq(nrow(lines)))
lines <- st_sfc(lapply(rows, function(row) {                      
    lmat <- matrix(unlist(row[2:5]), ncol = 2, byrow = TRUE)
    st_linestring(lmat)}))
lines <- st_sf('id'=c('A','B'),'geometry'=lines)

points <- st_as_sf(points, coords = c("x", "y"), 
                   agr = "constant")

st_distance(points, lines)

# Transform sf objects to EPSG:4326 ---------------------------------------

pointsWgs84.sf <- st_transform(points.sf, crs = 4326)
lineWgs84.sf <- st_transform(line.sf, crs = 4326)


# Calculate distances -----------------------------------------------------

dist <- geosphere::dist2Line(p = st_coordinates(pointsWgs84.sf), line = st_coordinates(lineWgs84.sf)[,1:2])


# Create 'sf' object ------------------------------------------------------

dist.sf <- st_as_sf(as.data.frame(dist), coords = c("lon", "lat"))
dist.sf <- st_set_crs(x = dist.sf, value = 4326)

# Plot --------------------------------------------------------------------

xmin2 <- min(st_bbox(pointsWgs84.sf)[1], st_bbox(lineWgs84.sf)[1])
ymin2 <- min(st_bbox(pointsWgs84.sf)[2], st_bbox(lineWgs84.sf)[2])
xmax2 <- max(st_bbox(pointsWgs84.sf)[3], st_bbox(lineWgs84.sf)[3])
ymax2 <- max(st_bbox(pointsWgs84.sf)[4], st_bbox(lineWgs84.sf)[4])

plot(pointsWgs84.sf, pch = 19, col = "#53A8BD", xlab = "Longitude", ylab = "Latitude",
     xlim = c(xmin2, xmax2), ylim = c(ymin2, ymax2), graticule = st_crs(4326), axes = TRUE)
plot(lineWgs84.sf, col = "#C72259", add = TRUE)
plot(dist.sf, col = "#6C5593", add = TRUE, pch = 19, cex = 0.75)
text(st_coordinates(pointsWgs84.sf), as.character(1:7), pos = 3, col = "#53A8BD")
text(st_coordinates(lineWgs84.sf), LETTERS[1:5], pos = 1, col = "#C72259")
text(st_coordinates(dist.sf), as.character(1:7), pos = 2, cex = 0.75, col = "#6C5593")