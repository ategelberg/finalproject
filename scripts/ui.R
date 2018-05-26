#Load libraries
library(shiny)
library(shinyWidgets)

#Source analysis file
source("analysis.R")

#Define UI
ui <- shinyUI(fluidPage(
  
  h1("Near Exctinct World Languages"),
  
  p("The data that was used for this visualization talks about different langu
      ages around the world that are close to being considered extinct."),
  
  h2("Filter"),
  
  selectInput("filter_countries",
              label = "Countries Spoken",
              choices = spoken_countries,
              selected = 1),
  
  br(),
  
  sliderTextInput("filter_endangerment", 
              label = "Degree of Endangerment",
              choices = danger_levels,
              selected = danger_levels[c(1, 5)]),
  
  br(),
  
  sliderInput("filter_speakers", 
              label = "Number of Speakers", 
              min = 0, 
              max = 7500000, 
              value = c(0, 7500000)),
  
  br(),
  
  hr(),
  
  h2("Display"),
  
  br(),
  
  fluidRow(
    column(4,
           
           checkboxGroupInput("display_languages", 
                              label = "Other Languages", 
                              choices = list("Spanish" = 1, 
                                             "French" = 2))
           
           ),
    
    column(4,
           
           checkboxGroupInput("display_location",
                              label = "Location:",
                              choices = list("City" = 1,
                                             "Country" = 2,
                                             "Lat, Long" = 3))
           
           ),
    column(4, 
           
           checkboxGroupInput("display_other",
                              label = "Other Options:",
                              choices = list("Countires Spoken" = 1,
                                             "Language Description" = 2,
                                             "Total Speakers" = 3,
                                             "Endangerment" = 4))
           
           ))
  )
)
