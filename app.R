library(shiny)

ui <- fluidPage(
  textInput(
    inputId = "Name",
    label = Sys.getenv("my_var")
  ),
  textInput(
    inputId = "Name",
    label = Sys.getenv("my_var2")
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)