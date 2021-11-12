#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(plotly)
library(shiny)
data(iris)
force(iris)

fluidPage(
  
  # Application title
  titlePanel("IRIS Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h2("Instruction on How to use!!"),
      br(),
      div(textOutput("howTo")),
      br(),
      br(),
      
      checkboxGroupInput("field",
                         "Fields you want on the page",
                         choices = c("Sepal.Length", "Sepal.Width",
                                     "Petal.Width", "Petal.Length"),
                         selected = c("Sepal.Length", "Sepal.Width"),
                         choiceNames = c("Sepal.Length", "Sepal.Width",
                                         "Petal.Width", "Petal.Length"),
                         choiceValues = c("Sepal.Length", "Sepal.Width",
                                          "Petal.Width", "Petal.Length")),
      radioButtons("compare", 
                         "Type of stats you want to view",
                         choices = c("summary", "mean"),
                         selected = c("mean"),
                   choiceNames  = c("summary", "mean"),
                   choiceValues  = c("summary", "mean")),
      textOutput("resp", inline=TRUE), 

    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
      tabPanel("Graph", plotlyOutput("distPlot")),
      tabPanel("Summary",tableOutput('mytab'))
      )
    )
  )
)
