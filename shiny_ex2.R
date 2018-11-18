library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", label = "Choose N",
              value = 250, min = 1, max = 1000),
  sliderInput(inputId = "bin", label = "Choose # of bins",
              value = 10, min = 1, max = 100),
  plotOutput(outputId = "hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    title <- "N random normal values"
    hist(rnorm(input$num), breaks=input$bin, col="mistyrose", main = title)
    })
}

shinyApp(ui = ui, server = server)
