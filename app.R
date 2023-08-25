library(shiny)

ui <- fluidPage(
  textInput(
    inputId = "Name",
    label = "Name"
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)