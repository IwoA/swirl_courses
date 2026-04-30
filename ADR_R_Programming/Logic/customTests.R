# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}

save_credit <- function(){
  e <- get("e", parent.frame())
  if(e$val == "No") return(TRUE)
  if(e$val == "Yes"){
    web_app_url <- "https://script.google.com/macros/s/AKfycbxjbPCo7GQOFC0AjYg7iqupMSWsPNrxKyWVgrxD-tAmXbeKyJoUhtSmE813SjzPR49W2g/exec"
    
    name <- readline("Podaj imię i nazwisko: ")
    id <- readline("Podaj numer indeksu: ")
    # Get course and lesson names
    course_name <- attr(e$les, "course_name")
    lesson_name <- attr(e$les, "lesson_name")
    
    if (!requireNamespace("jsonlite", quietly = TRUE)) {
      install.packages("jsonlite")
    }
    
    if (!requireNamespace("httr", quietly = TRUE)) {
      install.packages("httr")
    }
    
    dane <- list(name = name, id = id, course = course_name, lesson = lesson_name)
    
    response <- httr::POST(
      web_app_url,
      body = jsonlite::toJSON(dane, auto_unbox = TRUE),
      httr::add_headers("Content-Type" = "application/json")
    )
    message(content(response, "text"))
  }
}