#load libraries
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

#list of each unique country
spoken_countries <- c()

#loop for getting a list of all the individual spoken countries
#goes through every row of the extinct languages dataset
for(i in 1:sapply(expanded_countries, NROW)) {
  #convert each string into a list of seperated strings for each country
  instance_countries <- strsplit(expanded_countries[[1]][i], ", ")
  #goes through every row of seperated countries
  for(j in 1:sapply(instance_countries, NROW)) {
    #checks if that country is already apart of the unique country vector
    if (!is.element(j, spoken_countries)) {
      #if its not, it adds it to the unique country vector
      spoken_countries <- c(spoken_countries, instance_countries[[1]][j])
    }
  }
}