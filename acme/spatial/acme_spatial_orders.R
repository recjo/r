
library(sp) #for spatial data
library(ggplot2)

#globals
jitter <- FALSE

#function definitions
trim <- function(x) gsub("^\\s+|\\s+$", "", x)

#======== ORDER SOURCE =========
dfAllOrders = read.csv("test_orders.csv", stringsAsFactors = FALSE)
dfAllOrders$State = toupper(dfAllOrders$State)

#extract U.S. orders by date
dfOrders <- subset(dfAllOrders, CountryCode == 1 & as.Date(OrderDate) >= "2016-04-15")
#add column for city/state in lowercase for comparison
dfOrders$Loc = tolower(paste(trim(dfOrders$City), trim(dfOrders$State), sep=", "))
#create vector of city/state from orders
vcOrderLocations <- sort(as.vector(dfOrders$Loc))
#if not using jitter, then eliminate duplicates
if (isTRUE(jitter) == FALSE) {
  vcOrderLocations <- unique(vcOrderLocations)
}

#========== LONG/LAT ===========
#get city/long/lat lookup table
dfLongLatMaster = read.csv("LongLat.csv", sep="\t")
#extract only the Long/Lat coords for cities with orders
if (isTRUE(jitter) == FALSE) {
  #no jitter, so remove duplicate city long/lats
  vlFound <- (vcOrderLocations %in% dfLongLatMaster$Loc)
  dfLongLats <- dfLongLatMaster[vlFound,]
} else {
  #jitter enabled, so leave duplicate city long/lats
  index <- match(vcOrderLocations, dfLongLatMaster$Loc)
  dfLongLats <- dfLongLatMaster[na.omit(index), ]
}
#remove "row.names" column of dfLongLats
row.names(dfLongLats) <- NULL


#========== PLOT ===========
ggplot() + 
  ggtitle("U.S. ORDERS BY LONG/LAT") +
  geom_point(data=dfLongLats, aes(x=Longitude, y=Latitude), col = "darkred")

##plot using sp plot command
##extract long/lat values for coordinates (each row is a point)
#coords <- cbind(Longitude = dfLongLats$Longitude, Latitude = dfLongLats$Latitude)
##create points dataframe of coords. # df[row,col], negative index means drop that column, leading comma means all rows
#points <- SpatialPointsDataFrame(coords, dfLongLats[,-1], proj4string = CRS("+init=epsg:4326"))
##plot points
#plot(points, pch = ".", col = "darkred")



