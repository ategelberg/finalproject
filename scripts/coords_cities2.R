# This file is me attempting to match our coordinates to a csv file that I found that has
# all of the coordinates for most cities. However, when I matched our file with this file 
# joining, only 4 of the coordinates actaully crossed over. So what I am doing below is 
# attempting to round up all of the coordinates on both dataframes to whole numbers 
# so that we can get semi-precise city names for each language. However, each longitude 
# and latitude column needs to be numeric in order to round the values and some of them right
# now are strings. All of the stuff I've tried to do is not working to change it to numeric
# instead of characters so we should discuss what we want to do. Otherwise, if the columns were 
# numeric we'd be able to merge the dataframes and see if we have enough value matches to use 
# the rounded coordinates for matching. 

# Load in libraries 
library(dplyr)

# Load in files
extinct_lang <- read.csv("../data/extinctlanguages.csv", stringsAsFactors = F)
cities <- read.csv("../data/cities.csv", stringsAsFactors = F)

# Parse down dataframe 
cities <- cities %>% 
  select("X", "X.1", "X.2", "X.4", "X.5") %>% 
  rename(Country = X, Region = X.1, City = X.2, Latitude = X.4, Longitude = X.5) 

# This should work to make the cities dataframes lat and long columns numeric 
# but it's not so....any new solution ideas?
cities <- transform(cities, Latitude = as.numeric(Latitude))
cities <- transform(cities, Longitude = as.numeric(Longitude))

# Round dataframe values 
cities <- mutate(cities, Latitude = round(Latitude, 1),
                 Longitude = round(Longitude, 1))

extinct_lang <- mutate(extinct_lang, Latitude = round(Latitude,1),
                       Longitude = round(Longitude, 1))

# Join dataframes to match latitude and longitude 
df <- left_join(extinct_lang, cities)

