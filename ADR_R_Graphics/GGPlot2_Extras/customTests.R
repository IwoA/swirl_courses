# So swirl does not repeat execution of plot commands
AUTO_DETECT_NEWVAR <- FALSE

# Returns TRUE if e$expr matches any of the expressions given
# (as characters) in the argument.
ANY_of_exprs <- function(...){
  e <- get("e", parent.frame())
  any(sapply(c(...), function(expr)omnitest(expr)))
}

equiv_val <- function(correctVal){
  e <- get("e", parent.frame()) 
  #print(paste("User val is ",e$val,"Correct ans is ",correctVal))
  isTRUE(all.equal(correctVal,e$val))
  
}

# Stage a variable for inclusion is swirl's protected list. Staged variables
# will be included if and only if a user's answer passes all the current tests.
stageVariable <- function(name_of_variable, value){
  name_of_variable <- as.character(name_of_variable)
  e <- getState()
  e$delta[[name_of_variable]] <- value
}

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