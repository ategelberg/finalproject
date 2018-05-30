#Load libraries
library(shiny)
library(shinyWidgets)

#Source analysis file
source("analysis.R")

#Define UI
ui <- shinyUI(fluidPage(
  
  titlePanel("Near Exctinct World Languages"),
  
  p("The data that was used for this visualization talks about different languages around the world that are close to being considered extinct."),
  
  h2("Filter"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("filter_countries",
                  label = "Countries Spoken",
                  choices = sort(spoken_countries),
                  selected = "United States of America",
                  multiple = TRUE),
      
      actionButton("filter_all", "All"),
      actionButton("filter_clear", "Clear"),
      
      br(),
      
      sliderTextInput("filter_endangerment", 
                      label = "Degree of Endangerment",
                      choices = list("Vulnerable" = 1,
                                     "Definately endangered" = 2,
                                     "Severely endangered" = 3,
                                     "Critically endangered" = 4,
                                     "Extinct" = 5),
                      selected = c(1, 5)),
      
      p(paste0("1: Vulernable",
        "2: Definitely Endangered",
        "3: Severely Endangered",
        "4: Critically Endangered",
        "5: Extinct")),
      
      br(),
      
      sliderInput("filter_speakers", 
                  label = "Number of Speakers", 
                  min = 0, 
                  max = 7500000, 
                  value = c(0, 7500000)),
      
      br()
      
    ),
    
    mainPanel(
      
      plotlyOutput("world_map")
      
    )
    
  ))
)
