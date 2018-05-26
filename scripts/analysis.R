library(tidyr)

#Source function scripts
source("coords2country.R")

#Read in data
extinct_lang <- read.csv("../data/extinctlanguages.csv", stringsAsFactors = F)
countries<- read.csv(("../data/countries.csv"), stringsAsFactors = F)

#Unique Endangerment
danger_levels <- unique(extinct_lang$Degree.of.endangerment)

#vector of all countries present in countries column
expanded_countries <- expand(extinct_lang, Countries)

#loop for getting a list of all the individual spoken countries
spoken_countries <- c()

for(i in 1:length(expanded_countries)) {
  instance_countries <- strsplit(expanded_countries[[1]][i], ", ")
  for(j in 1:length(instance_countries)) {
    if (!is.element(j + 1, spoken_countries)) {
      spoken_countries <- c(spoken_countries, instance_countries[[3]][j])
    }
  }
}

for(country_list in 1:length(expanded_countries)) {
  instance_countries <- strsplit(expanded_countries[[1]][country_list], ", ")
  for(country in 1:length(instance_countries)) {
    if(!is.element(instance_countries[[1]][country], spoken_countries)) {
      spoken_countries <- c(spoken_countries, instance_countries[[1]][country])
    }
  }
}