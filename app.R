library(shiny)
library(ggplot2)
optics <- read.csv('prescription.csv')
optics$date <- as.Date(optics$date, format="%d/%m/%Y")

ui <- fluidPage(
  headerPanel("Visual Record"),
  sidebarPanel(selectInput('ycol', 'Y Variable', names(optics)[5:7], selected = names(optics)[[5]])),
  plotOutput("plot")
)


server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(optics, aes(x=date, y=optics[,input$ycol], group=eye, fill=eye)) +
    geom_bar(stat="identity", position="dodge", colour="black") +
    scale_fill_manual(values=c("mistyrose", "lightblue"))
  })
}

shinyApp(ui = ui, server = server)