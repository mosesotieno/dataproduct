# Name: dataproduct
# Purpose: Data product ro predict the price of diamond based on a set of
#          parameter
# Author: Moses Otieno
#
# Date : 18 Dec 2020

library(shiny)
library(tidyverse)


# Load the diamonds datasets
diamond <- ggplot2::diamonds

# UI interface

shinyUI(pageWithSidebar(
    headerPanel("Prediction of Diamond Price"),
    sidebarPanel(
        numericInput('Carat', 'Enter the weight in carats', 1.0 , min = 0.2, max = 5.0, step = 0.01),
        selectInput('Cut', 'Select Cut:', c('Fair', 'Good' ,'Very Good', 'Premium','Ideal')),
        selectInput('Color', 'Select Color:', c('D', 'E', 'F', 'G', 'H', 'I', 'J')),
        selectInput('Clarity', 'Select Clarity:', c("I1", "SI2", "SI1","VS2", "VS1",  "VVS2", "VVS1", "IF")),
        numericInput('Depth', 'Enter Depth(40 to 80):', 60.0 , min = 43, max = 79.0, step = 0.1),
        submitButton('Submit'),
        br(),
        p(strong(em("Documentation:",a("Diamond pick",href="index.html")))),

    ),
    mainPanel(
        h3('Based on the inputs, the price is :'),
        verbatimTextOutput("prediction")
    )
))
