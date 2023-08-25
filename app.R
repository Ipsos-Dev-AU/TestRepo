library(shiny)

ui <- fluidPage(
  textInput(
    inputId = "Name",
    label = Sys.getenv("my_var")
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)