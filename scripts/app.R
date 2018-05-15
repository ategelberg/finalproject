#Load libraries
library(shiny)

#Source in server files
source("server.R")

#Run the app
shinyApp(ui = ui, server = server)
