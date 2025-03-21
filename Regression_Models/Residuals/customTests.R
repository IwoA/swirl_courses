# Returns TRUE if the user has created a specified lm model
# with a specified name.
creates_lm_model <- function(correctExpr){
  e <- get("e", parent.frame())
  # Do what the user should have done
  eSw <- cleanEnv(e$snapshot)
  mdlSw <- eval(parse(text=correctExpr), eSw)
  # Recreate what the user has done
  eUsr <- cleanEnv(e$snapshot)
  mdlUsr <- eval(e$expr, eUsr)
  # If the correct model is named:
  if(length(ls(eSw))>0){
    # Check whether the model's name is correct
    nameGood <- sum(ls(eUsr) %in% ls(eSw)) & sum(ls(eSw) %in% ls(eUsr))
    # If not, highlight the misspelling
    if(!nameGood){
      swirl_out(paste0("You seem to have misspelled the model's name. I was expecting ", ls(eSw), 
                       " but you apparently typed ", ls(eUsr), "."))
      return(FALSE)
    } else {
      # Append the result, as a list to e$delta for progress restoration
      e$delta <- c(e$delta, as.list(eUsr))
    }
  }
  # Check for effective equality of the models
  isTRUE(all.equal(sort(as.vector(mdlUsr$coefficients)), sort(as.vector(mdlSw$coefficients)))) &
    isTRUE(all.equal(mdlUsr$fitted.values, mdlSw$fitted.values))
}


# Returns TRUE if e$val is identical to the value that would
# have been created by the correct expression.
creates_val_identical_to <- function(correctExpr){
  e <- get("e", parent.frame())
  correctVal <- eval(parse(text=correctExpr), cleanEnv(e$snapshot))
  results <- expectThat(e$val,
                        is_identical_to_legacy(correctVal, label=correctExpr),
                        label=deparse(e$expr))
  return(results$passed)
}


# Returns TRUE if e$expr matches any of the expressions given
# (as characters) in the argument.
ANY_of_exprs <- function(...){
  e <- get("e", parent.frame())
  any(sapply(c(...), function(expr)omnitest(expr)))
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
          name <- readline("What is your full name? ")
          id <- readline("What is your student's number? ")
          # Get course and lesson names
          course_name <- attr(e$les, "course_name")
          lesson_name <- attr(e$les, "lesson_name")
          
          if (file.exists("results.RDS")) {
               tmp <- readRDS('results.RDS')
               new <- data.frame(name = name, id = id, lesson = lesson_name, course = course_name, time = Sys.time())
               tmp <- dplyr::bind_rows(tmp,new)
          } else {
               tmp <- data.frame(name = name, id = id, lesson = lesson_name, course = course_name, time = Sys.time()) 
          }
          saveRDS(tmp, "results.RDS")
     }
     TRUE
}