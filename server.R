# Name: dataproduct
# Purpose: Data product ro predict the price of diamond based on a set of
#          parameter
# Author: Moses Otieno
#
# Date : 18 Dec 2020

library(shiny)
library(tidyverse)

#---- Load the data

diamond <- ggplot2::diamonds

myfit <- lm(price ~ carat + cut + clarity + color + depth, data = diamond)
summary(myfit)


predict.lm(myfit)

# Encapsulate the function to predict the price of the diamond

predictprice <- function(x){
    predict.lm(myfit, newdata = x)
}



# Define server

shinyServer(function(input, output) {
        output$prediction <- renderPrint(predictprice(x = tibble(
            carat=input$Carat,cut=input$Cut, color=input$Color,
            clarity=input$Clarity, depth=input$Depth)))


})
