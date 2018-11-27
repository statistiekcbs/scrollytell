
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](https://www.r-pkg.org/badges/version/scrollytell)](https://cran.r-project.org/package=scrollytell)
[![Travis build
status](https://travis-ci.org/statistiekcbs/scrollytell.svg?branch=master)](https://travis-ci.org/statistiekcbs/scrollytell)
[![Build
status](https://ci.appveyor.com/api/projects/status/hrkr0bi6y9svkcyi/branch/master?svg=true)](https://ci.appveyor.com/project/edwindj/scrollytell/branch/master)

# scrollytell

scrollytell is used to generate scrolly tell presentations in R shiny.

## Installation

A development version of scrolly tell can be installed from github:

``` r
devtools::install_github("edwindj/scrollytell")
```

## Example

``` r
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(scrollytell)

# Define UI for application that draws a histogram

ui <- fluidPage(

    # Application title
    titlePanel("Scrolly Telling"),

    scrolly_container("scr"
             , scrolly_graph( textOutput("section"),
                              plotOutput("distPlot")

                            )
             , scrolly_sections(
                scrolly_section( id = "green",
                     sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30)
                ),
                scrolly_section(id = "red",
                    h3("Title"),
                    p("dit is een paragraaf, die de grafiek rood maakt")
                ),
                scrolly_section(id = "blue","Blauw"),
                scrolly_section(id = "pink","Rose"),
                scrolly_section(id = "purple","Paars"),
                scrolly_section(id = "orange","Oranje boven!")
             )
    ),
    div("Footer")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        col <- input$scr
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = col, border = 'white')
    })

    output$scr <- renderScrollytell({scrollytell()})
    output$section <- renderText(paste0("Section: ", input$scr))

    observe({cat("section:", input$scr, "\n")})
}

# Run the application
shinyApp(ui = ui, server = server)
```
