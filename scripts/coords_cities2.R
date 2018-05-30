# Load in libraries 
library(dplyr)

# Load in files
extinct_lang <- read.csv("../data/extinctlanguages.csv", stringsAsFactors = F)
cities <- read.csv("../data/cities.csv", stringsAsFactors = F)

# Parse down dataframe 
cities <- cities %>% 
  select("X", "X.1", "X.2", "X.4", "X.5") %>% 
  rename(Country = X, Region = X.1, City = X.2, Latitude = X.4, Longitude = X.5) 

# Remove first row of df
cities <- cities[-1, ]

# Make cities Latitude and Longitude columns numeric
cities <- mutate(cities, Latitude = as.numeric(Latitude))
cities <- mutate(cities, Longitude = as.numeric(Longitude))

# Round dataframe values for general city matching
cities <- mutate(cities, Latitude = round(Latitude, 0),
                 Longitude = round(Longitude, 0))

extinct_lang <- mutate(extinct_lang, Latitude = round(Latitude, 0),
                       Longitude = round(Longitude, 0))

# Join dataframes to match latitude and longitude per language to a city
df <- left_join(extinct_lang, cities, by = c('Latitude', 'Longitude'))

languages_cities <- group_by(df, Name.in.English) %>% 
  filter(row_number()==1)

# Write df to a new csv file in the data folder
write.csv(languages_cities, file = "../data/languages_cities.csv")

