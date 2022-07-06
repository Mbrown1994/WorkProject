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

# Read in the Data
# Read in the Data
Data <- read_excel("Work Dataset.xlsx")
  
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
            src = "Color.png",
            height = '400 px',
            width = '550 px'
            
          ),
          
          # Describe what this app will be used for
          h3("The Investigation"),
          "This app explores all off-colors at our Salisbury, NC location. Multiple", tags$br(),
          "things can contribute to an off-color including undispersed pigment,", tags$br(),
          "contamination, and blend times. The point of this study is to find the", tags$br(),
          "root cause to the high number of off-colors recorded at this location.", tags$br(),
          "Our weekly off-color numbers have varied anywhere from 75% to 89% since", tags$br(),
          "February and we need to identify any issues that may contribute to these", tags$br(),
          "high numbers."
        ),
        sidebarPanel(
          
          # Section for discussing the data
          h3("The Data"),
          "The data set explores 560 observations of 6 variables",
          "produced in the plant. The variables include line number",
          "lot number, color, customer, month produced, and pass/fail",
          "data described below:",
          br(),
          br(),
          "- The Salisbury plant has 8 lines, 3 single screws and",
          "5 twins",
          br(),
          br(),
          "- Colors include Blue, Green, Yellow, Pink, Red, Orange",
          "Brown, Tan, Black, and White",
          br(),
          br(),
          "- Months produced include February - June",
          "- Noted Off-Colors involve anything that did not meet customer",
          "specifications",
          br(),
          br(),
          "All of the observations were pulled directly from the",
          "QC logs used for quality checks. The dataset gets updated at",
          "the end of every week so that a trend analysis is readily",
          "available."
          
        ),
        
      ),
      
      # Create the tab for the Data section of the app
      tabPanel(
        # Add the title
        title = "Data",
        
        # Create a side panel
        sidebarPanel(
          # Filter the data by month
          selectInput(
            inputId = "specificmonth",
            label = "Filter by month produced",
            choices = unique(Data$Month),
            selected = unique(Data$Month),
            multiple = TRUE,
            selectize = TRUE
          ),
          
          
          # Filter by Color
          selectInput(
            inputId = "specificcolor",
            label = "Filter by color",
            choices = unique(Data$Color),
            selected = unique(Data$Color),
            multiple = TRUE,
            selectize = TRUE
          ),
        
          
          # Filter by line number
          selectInput(
            inputId = "specificline",
            label = "Filter by line",
            choices = unique(Data$Line),
            selected = unique(Data$Line),
            multiple = TRUE,
            selectize = TRUE
          ),
          
          # Filter for the display of columns
          selectInput(
            inputId  = "selectedCols",
            label = "Filter Columns",
            choices = colnames(Data),
            selected = colnames(Data),
            multiple = TRUE,
            selectize = TRUE
          ),
          
          # Allow the data to be downloaded by the user
          downloadButton("Download", "Download the data here")
          
        ),
        
        # Output the table
        mainPanel(
          dataTableOutput(outputId = "table")
        )
        
      )
    
      
      
      
      
      
      
      )
  )
  )

      
     