

library(ggplot2)
library(dplyr)
library(scales)
library(plotly)

datafile<- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)


# Define server logic required to draw a histogram
server <- function(input, output) {

  output$graph<- renderPlotly ({
    validate(
      need(input$Select_Country, "Selected Country")
    )

    subset_df <- datafile %>% filter(country %in% input$Select_Country) %>%
      filter(population >= input$Population[1] & population <= input$Population[2])

    linegraph<- ggplot(data = subset_df) +
      geom_line(aes(x = year, y = co2, color = country)) +
      labs(x = "Population Size", y = "Carbon Dioxide Level", title = "Co2 Levels Compared to Population") +
      scale_x_continuous(labels = label_number_si())

    return(ggplotly(linegraph))
  })
}