AUTO_DETECT_NEWVAR <- FALSE

script_results_identical <- function(result_name) {
  # Get e
  e <- get('e', parent.frame())
  # Get user's result from global
  if(exists(result_name, globalenv())) {
    user_res <- get(result_name, globalenv())
  } else {
    return(FALSE)
  }
  # Source correct result in new env and get result
  tempenv <- new.env()
  # Capture output to avoid double printing
  temp <- capture.output(
    local(
      try(
        source(e$correct_script_temp_path, local = TRUE),
        silent = TRUE
      ),
      envir = tempenv
    )
  )
  correct_res <- get(result_name, tempenv)
  # Compare results
  identical(user_res, correct_res)
}

# Multiple expression version of expr_creates_var
multi_expr_creates_var <- function(correctName=NULL){
  e <- get("e", parent.frame())
  # TODO: Eventually make auto-detection of new variables an option.
  # Currently it can be set in customTests.R
  delta <- if(!customTests$AUTO_DETECT_NEWVAR){
    safeEval(e$expr, e)
  } else {
    e$delta
  }
  if(is.null(correctName)){
    passed <- length(delta) > 0
  } else {
    passed <- correctName %in% names(delta)
  }
  passed <- isTRUE(passed)
  if(passed){
    e$newVar <- e$val
    e$newVarName <- names(delta)[1]
    e$delta <- mergeLists(delta, e$delta)
  }
  return(passed)
}

# Check that the output/value produced by a script is correct
script_vals_identical <- function() {
  # Get e
  e <- get('e', parent.frame())
  # Get value produced from user's script
  user_val <- capture.output(
    local(
      try(
        # Must use eval-parse combo, not source, if we don't force user
        # to print result
        eval(e$expr),
        silent = TRUE
      )
    )
  )
  # Get value produced from correct script
  correct_val <- capture.output(
    local(
      try(
        # Must use eval-parse combo, not source, if we don't force user
        # to print result
        eval(parse(file = e$correct_script_temp_path)),
        silent = TRUE
      )
    )
  )
  # Compare values
  identical(user_val, correct_val)
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

# Funkcja sprawdza, czy wprowadzone wyrażenie jest właściwe. 
# Jej przewaga polega na tym, że ignoruje spacje.
checkExpr <- function(exp){
  e <- get("e", parent.frame())
  e <- e$expr #mutate(cran3, size_mb = size/2^20, size_gb = size_mb / 2^20)
  # is.call(e)  # TRUE
  # substr(exp, 1,6) == "mutate"
  e <- deparse(e)
  # exp == 'mutate(cran3, size_mb = size/2^20, size_gb = size_mb / 2^10)'
  # substr(gsub(" ", "", exp), 1,49) == "mutate(cran3,size_mb=size/2^20,size_gb=size_mb/2^" # do 49 znaku jest ok a potem ?
  # exp == 'mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)'
  
  identical(gsub(" ", "", e), gsub(" ", "", exp))
  # nchar(e) == 58
  # gsub(" ", "", exp) == "mutate(cran3,size_mb=size/2^20,size_gb=size_mb/2^20)"
  # substr(e, 1, 58) == "mutate(cran3, size_mb = size/2^20, size_gb = size_mb/2^20)" # do 52 znaku się zgadza, potem zamiast " " jest "/"
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