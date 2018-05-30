#Load libraries
library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

#Source files
source("ui.R")
source("analysis.R")

#Define Server
server <- shinyServer(function(input, output, session) {
  
  #Rendering the world map
  output$world_map <- renderPlotly({
    
    #Data frame that has filtered everything except countries
    filter_stats <- extinct_lang %>% 
      filter( Number.of.speakers >= input$filter_speakers[1] &
              Number.of.speakers <= input$filter_speakers[2] &
              Danger.number >= input$filter_endangerment[1] &
              Danger.number <= input$filter_endangerment[2])
    
    #Checks which countries should be shown on map based off what has been inputed               
    show_countries <- c()
    for(i in 1:nrow(filter_stats)) {
      show_countries <- c(show_countries, Reduce("|", sapply(input$filter_countries, grepl, filter_stats$Countries)[i,]))
    }
    
    #When "All" button clicked, adds all countries to the select country input
    observeEvent(input$filter_all, {
      updateSelectInput(session, "filter_countries",
                        selected = spoken_countries)
    })
    
    #When "Clear" button clicked, removes all countries from the select country input
    observeEvent(input$filter_clear, {
      updateSelectInput(session, "filter_countries",
                        selected = "")
    })
    
    #Map Creation
    #Filter based on sliders and inputs
    extinct_lang %>% 
      filter(Number.of.speakers >= input$filter_speakers[1] &
             Number.of.speakers <= input$filter_speakers[2] &
             Danger.number >= input$filter_endangerment[1] &
             Danger.number <= input$filter_endangerment[2]) %>%
      filter(show_countries) %>% 
      #Plot long and lat
      plot_geo(lat = ~Latitude, lon = ~Longitude) %>%
      #Markers that are seen when hovering over each location
      add_markers(
        text = ~paste(Name.in.English, 
                      Degree.of.endangerment,
                      paste("Number of Speakers:", Number.of.speakers),
                      sep = "<br />"),
        color = ~Degree.of.endangerment, symbol = I("circle"), size = I(6), hoverinfo = "text"
      ) %>%
      #Changing settings for default map
      layout(geo = list(
        showland = TRUE,
        landcolor = toRGB("gray95"),
        subunitcolor = toRGB("gray85"),
        countrycolor = toRGB("gray85"),
        countrywidth = 0.5,
        subunitwidth = 0.5,
        showcountries = TRUE
      ))
      
  })
  
})
