library(datasets)
library(ggplot2)
# Put initialization code in this file.

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

path_to_course <- file.path(.get_course_path(),
	"ADR_R_Graphics","Graphics_Devices_in_R")

try(dev.off(),silent=TRUE)
plot.new()

