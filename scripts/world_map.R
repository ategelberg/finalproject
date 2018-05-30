library(plotly)
df <- read.csv("../data/extinctlanguages.csv")

# geo styling
g <- list(
  showland = TRUE,
  landcolor = toRGB("gray95"),
  subunitcolor = toRGB("gray85"),
  countrycolor = toRGB("gray85"),
  countrywidth = 0.5,
  subunitwidth = 0.5,
  showcountries = TRUE
)

p <- plot_geo(df, lat = ~Latitude, lon = ~Longitude) %>%
  add_markers(
    text = ~paste(Name.in.English, 
                  Degree.of.endangerment, 
                  sep = "<br />"),
    color = ~Degree.of.endangerment, symbol = I("circle"), size = I(6), hoverinfo = "text"
  ) %>%
  layout(geo = g)
