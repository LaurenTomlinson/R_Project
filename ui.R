#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
rests <- read.csv(file = "./testdf6.csv")



# Define UI for application that draws a histogram
shinyUI(fluidPage(

  titlePanel("AZ Restaurants"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput(inputId = "city",
                     label = "Cities",
                     choices = unique(rests$city)),
      selectizeInput(inputId = "cuisine",
                     label = "Cuisine",
                     choices = unique(rests$cuisine))
    ),
    mainPanel(
      plotOutput("count"),
      imageOutput("img")
      )
  )
)
)


