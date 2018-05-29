# This file is attempting to match coordinates to cities based on google API's. I cannot
# get the connection to run all of the API's, might have been because I was over my daily
# alloted usage, capped at 2500, or because the connection to the API was not strong enough. 
# Both of these are reasons explained online by other users. However, if the connection would
# work, the following works. I know this because it works when I filter the dataframe all the way 
# down to just one location, I just can't get it to run for the entire thing. I have also kept
# the record of all of the other stuff I tried even further below just for a record, but the top
# is the only method that has worked and used the correct coordinates from our dataframe in matching.

# Load in libraries
library(dplyr)
library(ggmap)

# Cite usage of ggmap
# Google Maps API Terms of Service: http://developers.google.com/maps/terms.
# Please cite ggmap if you use it: see citation('ggmap') for details.
citation('ggmap')
#  D. Kahle and H. Wickham. ggmap: Spatial Visualization with ggplot2. The R Journal,
# 5(1), 144-161. URL http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf

# Load in files
extinct_lang <- read.csv("../data/extinctlanguages.csv", stringsAsFactors = F)

# The following works just fine when I filter down to one ID and run the geo_information,
# But when I go to do it for the entire dataset it doesn't work.

# Create dataset with only coordinates of languages
coords <- extinct_lang %>% 
  select("ID", "Longitude", "Latitude")
 
# Run API information to match location with coordinates
geo_information <- do.call(rbind,
                  lapply(1:nrow(coords),
                         function(i)revgeocode(as.numeric(coords[i, 3:2]),
                                               output = c("more"))))

# Combine location information to coordinate dataframe
data <- cbind(coords, geo_information)

# The above works, just the system is giving me this error after about 20 or so
# coordinates are passed..Error in readLines(connect) : 
# cannot open the connection to 
# 'http://maps.googleapis.com/maps/api/geocode/json?latlng=93.8946,24.7667&sensor=false'

# practice stuff I tried before I found the above method
coords <- transform(coords, Longitude = as.numeric(Longitude))
coords <- transform(coords, Latitude = as.numeric(Latitude))

geo_information <- revgeocode(c(coords$Longitude, coords$Latitude),
                              output = "more")

coords_final <- cbind(coords, geo_information)

coords$location <- mapply(FUN = function(lon, lat) revgeocode(c(lon, lat)),
                             coords$lon, coords$lat)
result <- do.call(rbind,lapply(1:nrow(coords),
                         function(i)revgeocode(as.numeric(coords$Longitude, coords$Latitude))))
coords <- cbind(coords,geo_information)

# What I had originally done on Saturday that ended up not using any of the coordinates from
# our coordinate list so even though it doesnt work with our data, it worked!

# Generate list of dataframes with location names for each of the coordinates
location_lists <- lapply(with(coords, paste(Name.in.English, Latitude, Longitude, sep = ",")),
                         geocode, output = "more")

# Removing empty dataframes from lists before converting full list to df
location_lists <- Filter(function(x) dim(x)[1] > 0, location_lists)

# convert lists to dataframe
location_df <- bind_rows(location_lists, .id = "column_label")

# Slim down dataframe 
location_df <- location_df %>% 
  select(lon,
         lat,
         country,
         locality,
         administrative_area_level_1,
         administrative_area_level_2,
         administrative_area_level_3)

# change location_df column name to match extinct_lang for joining
location_df <- rename(location_df, Latitude = lat)

# Join location_df and extinct_lang for df with location names for each coordinate
languages_final <- left_join(extinct_lang, location_df)
