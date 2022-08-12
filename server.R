#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
rests <- read.csv(file = "./testdf6.csv")

function(input, output) {
  output$count <- renderPlot(
    rests %>%
      filter(city == input$city & cuisine == input$cuisine) %>%
      group_by(stars) %>%
      count() %>%
      ggplot(aes(x = stars, y = n)) +
      geom_col(fill = "lightblue") +
      ggtitle("Number of Restaurants")
  )
  
  output$img <- renderImage({
    filename <- normalizePath(file.path('./www',
                                        paste(input$city, '.png', sep='')))
    
    # Return a list containing the filename and alt text
    list(src = filename,
         alt = paste("Image", input$city))
    
  }, deleteFile = FALSE)
  
  
}