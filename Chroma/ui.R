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

shinyUI(navbarPage(
  
  # Application title
  title = "Off-Color Project",
  
  # Add a theme
  theme = shinytheme("cerulean"),  
  
  # Add in the different tabs
  tabsetPanel(
  )
))