# Packages used for this analysis
library(shinythemes)
library(tidyverse)
library(magrittr)
library(shiny)
library(caret)
library(DT)
library(dplyr)
library(tree)
library(ggplot2)
library(readxl)

# Read in the Data
Data <- read_excel("Work Dataset.xlsx")


shinyServer(function(input, output){
  
  # Create the table for the data tab
  
  output$table <- renderDataTable({
    specificmonth <- unlist(input$specificmonth)
    specificcolor <- unlist(input$specificcolor)
    specificline <- unlist(input$specificline)
    selectedCols <- unlist(input$selectedCols)
    
    # Filter
    Data %>% filter(Month %in% specificmonth,
                    Color %in% specificcolor,
                    Line %in% specificline) %>% select(selectedCols)
    
  })
  
  
  # Allow the user to download the data
  output$Download <- downloadHandler(
    filename = function (){
      paste("Work Dataset.xls")
    },
    content = function(file){
      write_excel_csv(
        Data %>% filter(Month %in% specificmonth,
                        Color %in% specificcolor,
                        Line %in% specificline) %>% select(selectedCols),
        file,
        row.names = FALSE
      )
    }
  )
  
  
  })
