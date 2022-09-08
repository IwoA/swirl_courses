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
     selection <- getState()$val
     if(selection == "Yes"){
          name <- readline("What is your name? (first name and surname) ")
          id <- readline("What is your student's number? ")
          lesson <- "Workspace and files"
          if (file.exists("results.RDS")) {
               tmp <- readRDS('results.RDS')
               new <- data.frame(name = name, id = id, lesson = lesson, time = Sys.time())
               tmp <- rbind(tmp,new)
          } else {
               tmp <- data.frame(name = name, id = id, lesson = lesson, time = Sys.time()) 
          }
          saveRDS(tmp, "results.RDS")
     }
     TRUE
}