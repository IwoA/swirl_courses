match_call <- function(correct_call = NULL) {
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correct_call)) return(TRUE)
  # Get full correct call
  full_correct_call <- expand_call(correct_call)  
  # Expand user's expression
  expr <- deparse(e$expr)
  full_user_expr <- expand_call(expr)
  # Compare function calls with full arg names
  identical(full_correct_call, full_user_expr)
}

# Utility function for match_call answer test
# Fills out a function call with full argument names
expand_call <- function(call_string) {
  # Quote expression
  qcall <- parse(text=call_string)[[1]]
  # If expression is not greater than length 1...
  if(length(qcall) <= 1) return(qcall)
  # See if it's an assignment
  is_assign <- is(qcall, "<-")
  # If assignment, process righthandside
  if(is_assign) {
    # Get righthand side
    rhs <- qcall[[3]]
    # If righthand side is not a call, can't use match.fun()
    if(!is.call(rhs)) return(qcall)
    # Get function from function name
    fun <- match.fun(rhs[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Get expanded call
    full_rhs <- match.call(fun, rhs)
    # Full call
    qcall[[3]] <- full_rhs
  } else { # If not assignment, process whole thing
    # Get function from function name
    fun <- match.fun(qcall[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Full call
    qcall <- match.call(fun, qcall)
  } 
  # Return expanded function call
  qcall
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
          
          if (!requireNamespace("dplyr", quietly = TRUE)) {
            install.packages("dplyr")
          }
          
          if (file.exists("results.RDS")) {
               tmp <- readRDS('results.RDS')
               new <- data.frame(name = name, id = id, lesson = lesson_name, course = course_name, time = Sys.time())
               tmp <- dplyr::bind_rows(tmp,new)
          } else {
               tmp <- data.frame(name = name, id = id, lesson = lesson_name, course = course_name, time = Sys.time()) 
          }
          saveRDS(tmp, "results.RDS")
     }
}