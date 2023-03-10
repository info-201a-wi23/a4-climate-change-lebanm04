#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/



# load packages and data out here so that it only runs once
library(shiny)
library(dplyr)
library(ggplot2)
library(scales)
library(plotly)
datafile<- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

shiny("https://lebanm04.shinyapps.io/a4-climate-change-jasminempham/")

#data file for the summary values
us_data <- datafile %>%
  group_by(country, co2_growth_abs) %>%
  filter(country %in% c("United States"))

maximumcountry <- datafile %>%
  group_by(country) %>%
  summarize(maximumcountry = max(co2, na.rm = TRUE))

#source your ui and server to get ui and server bars
source("ui.R")
source("server.R")

# Run the application
shinyApp(ui = ui, server = server)


