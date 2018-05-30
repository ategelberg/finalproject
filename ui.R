#Load libraries
library(shiny)
library(shinyWidgets)

#Source analysis file
source("scripts/analysis.R")

#Define UI
ui <- shinyUI(fluidPage(
  
  titlePanel("Near Extinct World Languages"),
  
  p("The total number of contemporary languages in the world is unknown. Language is a vital part of humanity. We use language on a daily basis to communicate with our loved ones, send emails to colleagues and catch up on literature. Language 
    has the power to connect people from all corners of the globe. It is essential to
    ones identity, and almost all communication is expressed through language.")
  
  p("As a group, we decided we wanted to show just how many rare languages have been spoken
    on this earth. We wanted people to be able to look at map, find where their ancestors
    are from, and look to see the languages spoken in that area. Thus we can help people
    keep their language, as well as their culture alive.")
    
  p("The following map shows insights about and the locations today where", `total_lang`, "rare and extinct languages are spoken. By visualizing the location of the language's 
    origin on a map, people can learn how many people speak it, where is it also spoken
    and it's degree of endangerment. Using this information, people can map their ancestry,
    taking note of the languages that their ancestors may have been exposed to. People
    can then research these languages to learn more about their cultural identity.")
    
  p("The" a(data, href='https://www.kaggle.com/the-guardian/extinct-languages/data') "we used
    to source this map is from Kaggle. This data features", `total_lang`, "different 
    languages are sorts them into four categories: vulnerable, definitely endangered, 
    severely endangered, critically endangered, and extinct. As you hover over each 
    point on the map, information such as number of speakers, and the names of other 
    countries where this language is spoken will appear under the language name. Using 
    the tools around the map, users are able to only show specific degrees of endangerment 
    or just display data for a single country. These tools are useful when users are 
    trying to look for a language in a specific country or with a specific endangerment level.")
  
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
      
      p(paste0("1: Vulernable, ",
        "2: Definitely Endangered, ",
        "3: Severely Endangered, ",
        "4: Critically Endangered, ",
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
