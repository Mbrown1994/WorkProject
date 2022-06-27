# Packages used for this analysis
library(shinythemes)
library(tidyverse)
library(magrittr)
library(shiny)
library(caret)
library(tree)
library(dplyr)
library(DT)
library(ggplot2)

# Ignore a few warnings
suppressWarnings(library(caret))

  
  # Define UI for application that draws a histogram
  shinyUI(navbarPage(
    
    # Application title
    title = "Off-Color Project",
    
    # Add a theme
    theme = shinytheme("cerulean"),  
    
    # Add in the different tabs
    tabsetPanel(
      
      # Create the tab for the 'About' section of the app
      tabPanel(
        # Add the title
        title = "About",
        
        # Create a main panel for this specific tab
        mainPanel(
          
          # Add in the image
          img(
            src = "Chroma.png",
            height = '450 px',
            width = '500 px'
            
          ),
          # Describe what this app will be used for
          h3("The Main Purpose of This App"),
          "This app explores all off-colors at our Salisbury, NC location. Multiple", tags$br(),
          "things can contribute to an off-color including undispersed pigment,", tags$br(),
          "contamination, and blend times. The point of this study is to find the", tags$br(),
          "root cause to the high number of off-colors recorded at this location.", tags$br(),
        ),
        sidebarPanel(
          
          # Section for discussing the data
          h3("The Data"),
          "The data set explores 300 jobs produced in",
          "the plant by color, customer, line, and raws.", 
          
        )
        
      )
    )
  ))

      
     