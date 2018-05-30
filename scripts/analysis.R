#load libraries
library(tidyr)
library(dplyr)

#Source function scripts
source("coords2country.R")
source("world_map.R")

#Read in data
extinct_lang <- read.csv("../data/extinctlanguages.csv", stringsAsFactors = F)
extinct_lang_cities <- read.csv("../data/languages_cities.csv", stringsAsFactors = F)
countries<- read.csv(("../data/countries.csv"), stringsAsFactors = F)

#merge datasets
extinct_lang_merged <- left_join(extinct_lang, extinct_lang_cities, by = "ID")
extinct_lang$City <- extinct_lang_merged$City
extinct_lang$Country <- extinct_lang_merged$Country

#Unique Endangerment
danger_levels <- unique(extinct_lang$Degree.of.endangerment)

#Adds a column to the dataframe that is the endagerment level as an integer
danger_numbers_temp <- c()
for (i in 1:nrow(extinct_lang)) {
  for (j in 1:5) {
    if (extinct_lang$Degree.of.endangerment[i] == danger_levels[j]) {
      danger_numbers_temp <- c(danger_numbers_temp, j)
    }
  }
}
extinct_lang$Danger.number <- danger_numbers_temp


#vector of all countries present in countries column
expanded_countries <- expand(extinct_lang, Countries)

#list of each unique country
spoken_countries <- c()

#loop for getting a list of all the individual spoken countries
#goes through every row of the extinct languages dataset
for(i in 1:sapply(expanded_countries, NROW)) {
  instance_countries <- strsplit(expanded_countries[[1]][i], ", ")
  for(j in 1:sapply(instance_countries, NROW)) {
    if (!is.element(j, spoken_countries)) {
      spoken_countries <- c(spoken_countries, instance_countries[[1]][j])
    }
  }
}