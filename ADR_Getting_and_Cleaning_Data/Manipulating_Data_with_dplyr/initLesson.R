### Code used to download and save data
# logurl <- 'http://cran-logs.rstudio.com/2025/2025-02-12.csv.gz'
# filepath <- paste0('~/', basename(logurl))
# download.file(logurl, filepath)
# cranlog <- read.csv(filepath)
# cran_sampled <- cranlog |> dplyr::group_by(package) |> dplyr::slice_sample(n=10)
# write.csv(cran_sampled, 'Getting_and_Cleaning_Data/Manipulating_Data_with_dplyr/2025-02-12.csv')
# unlink(filepath)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Make path to csv available to user
path2csv <- file.path(.get_course_path(),
                      'ADR_Getting_and_Cleaning_Data',
                      'Manipulating_Data_with_dplyr',
                      '2025-02-12.csv')

# Create datasets for user. We don't advertise that we're
# doing this, but it will be necessary for students who
# quit and later resume. We are not saving the variable
# to the progress file to save on performance.
cran <- tibble::as_tibble(read.csv(path2csv, stringsAsFactors = FALSE))
cran2 <- select(cran, size:ip_id)
cran3 <- select(cran, ip_id, package, size)
