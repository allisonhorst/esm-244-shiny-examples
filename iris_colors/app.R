#######################
# iris_colors
# A simple app with a drop-down menu
#######################

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Iris Scatterplot, Vary Point Color"),
   
   # Sidebar with a dropdown menu for color selection
   sidebarLayout(
      sidebarPanel(
         selectInput("input_color", 
                     label = h3("Choose a color"),
                     choices = list("blue","green","orange"))
      ),
      
      # Show generated scatterplot (from server)
      mainPanel(
         plotOutput("iris_graph")
      )
   )
)

# Grab the input, make a graph, render output:
server <- function(input, output) {
   
   output$iris_graph <- renderPlot({
     
     ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
       geom_point(color = input$input_color)
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

