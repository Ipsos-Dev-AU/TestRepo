library(shiny)

ui <- fluidPage(
  textInput(
    inputId = "Name1",
    label = Sys.getenv("my_var")
  ),
  textInput(
    inputId = "Name",
    label = Sys.getenv("my_var2")
  )
  ),
  textInput(
    inputId = "Name",
    label = Sys.getenv("my_var3")
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)