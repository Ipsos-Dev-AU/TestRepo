library(shiny)
# This function prints to console in a desired colour - use for debugging --------
print_colour <-
  function(...,
           col = 32,
           sep = " ",
           cat_to_console = TRUE,
           cat_file = "Print_Log.txt",
           append = TRUE) {
    
    if (!missing(...)) {
      if (cat_to_console) {
        cat(paste0("\033[0;", col, "m", paste(...,  sep = sep), "\033[0m", "\n"))
      }
      cat(paste0(paste(...,  sep = sep), "\n"), file = cat_file, append = append)
    } else {
      for (col in c(1:9,30:47,90:107)) {
        cat(paste0("\033[0;", col, "m", col, "\033[0m", "\n"))
      }
    }
  }

# Setting Debug Status ----------------------------------------------------
enviorment_status <- function() {
  if (!startsWith(Sys.getenv("CONNECT_SERVER"), "https://au-rconnect.ipsos.com")) {
    print_colour("You are in RWB")
    repo <- git2r::repository_head(git2r::repository("."))$name
    write.table(repo, "Current_Branch.txt", row.names = FALSE, col.names = FALSE)
    print_colour(paste0("Re/Creating Current_Branch: ",repo), col = 30)
    enviorment = "RWB"
    repo <- read.table(
      "Current_Branch.txt"
    )
  } else {
    repo <- read.table(
      "Current_Branch.txt"
    )
    print(paste0("CONNECT_SERVER: ", Sys.getenv("CONNECT_SERVER")))
    print(paste0("CONNECT_CONTENT_GUID: ", Sys.getenv("CONNECT_CONTENT_GUID")))
    print(paste0("UAT_appguid: ", Sys.getenv("UAT_appguid")))
    
    if (Sys.getenv("CONNECT_CONTENT_GUID") == Sys.getenv("UAT_appguid")) {
      enviorment = "UAT"
    } else if(Sys.getenv("CONNECT_CONTENT_GUID") == Sys.getenv("PROD_appguid")) {
      enviorment = "PROD"
    } else {stopApp()}
  }
  
  return(
    list(
      "repo" = repo,
      "enviorment" = enviorment
    )
  )
}

enviorment_status()

ui <- fluidPage(
  textInput(
    inputId = "Name1",
    label = Sys.getenv("my_var")
  ),
  textInput(
    inputId = "Name",
    label = Sys.getenv("my_var2")
  ),
  textInput(
    inputId = "Name",
    label = Sys.getenv("my_var3")
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)