datafile<- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

intro_page <- tabPanel(
  "Intro",
  h2("Introduction"),
  p("The global population has recently hit 8 billion people. It has grown immensely over the past 200 years, and is still continuing to grow.
    In turn, the deamnd for food, supplies, and goods has increased as well. In this report, we will explore the different levels of co2 in
    different countries compared to their population."),
  h2("About the Data"),
  p("The data set that we are exploring in this project is from Our World in Data. The data includes information regarding CO2 emissions for countries over time. For example,
    the data set includes Co2  emissions per capita, energy units, GDP, etc. The data also includes other information regarding greenhouse gas, oil usage, methane, and more.
    The data was collected by Hannah Ritchie, Max Roser, Edouard Mathieu, Bobbie Macdonald and Pablo Rosado. Their goal in collecting this data and making to easier to understand
    and more accessible to everyone. By doing so it will be easier to tackle the problem at hand. Understanding what the issue is, will allow us to find the best solutions. Possible
    limitations to this data are that current values are missing due to the lack of information from the earlier centuries or being in a country that is less developed with less
    accessible or non-existent data. While analyzing the data it is important to see that current values may not be available depending on the country as well as the time period.
    Another limitation with the datais that the co2 emmissions is from 1800 to 2022. It would be interesting to view the data spanning over a larger time frame. However it
    would be difficult to obtain data from before."),
  h3("5 Summary Values"),
  p("For these values I wanted to take a look at the years and values of the highest co2 levels for different countries. For the world, the highest co2 emmission occured in 2021
      and was 37,123.823. It is interesting to see that this happened the year after COVID. It may be correlated to the fact that in 2021, people were able to travel or go out more freely
      than in 2020 due to the vaccines being released. The maximum for the United States occured in 2005, and that value was 6137.604. It was suprising to see that the year that it occured
      was 22 years ago as I would have thought it would be a more recent year. The lowest co2 for the United States occured in 1800 which is when the data set began. The maximum co2 level for Canada occured in
      2007, and the value for that was 593.516. The population in Canada is significantly smaller than the US, however it is still interesting to see their max versus the US. The country with the lowest maximm co2
      levek was Tuvalu. This is a small country in Oceania that had a population of about 11K in 2011. As there population is much smaller than larger countries this is not suprising."),
  h3("Conclusion"),
  p("In conclusion, we can see a trend between many countries is that as the population increases the co2 levels increase as well. As the population increases more resources are needed for
      each country. While technology may be advancing that assists with the co2 emmissions, it may not be able to counteract the raising popualation and consumerism in today's society."),

)

# Sidebar with a slider input for number of bins
sidebar <- sidebarPanel(
  selectInput(inputId = "Select_Country",
              label = "Selected Country",
              choices= datafile$country,
              selected = "United States",
              multiple = TRUE
  ),


  sliderInput(
    inputId = "Population",
    label = "Population",
    min = 1,
    max = 7909295104,
    value = c(1, 7909295104), sep = ""
  )

)
# Show a plot of the generated distribution
main<- mainPanel(
  plotlyOutput(outputId = "graph")
)

graph_page <- tabPanel(
  "My Graph",
  sidebarLayout(
    sidebar,
    main
  )
)

ui <- navbarPage("A4",
                 intro_page,
                 graph_page
)