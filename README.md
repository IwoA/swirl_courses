# swirl courses for **Programming in R and Python** course at Wroclaw University of Economics and Business

This is a collection of interactive courses for use with the [swirl R package](http://swirlstats.com). 


For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl).

There are following courses to finish, organized by level of difficulty:


1. **R Programming**: The basics of programming in R
2. **Regression Models**: The basics of regression modeling in R
3. **Getting and Cleaning Data**: dplyr, tidyr, lubridate, oh my!



## Install and run a course automatically from swirl

**This is the preferred method of installing courses.** It automates the process by allowing you to do everything right from the R console.

1) Make sure you have a recent version version of swirl:

```
install.packages("swirl")
```

2) Enter the following from the R console:

```
library(swirl)
install_course_github("IwoA", "swirl_courses", multi = TRUE)
swirl()
```

## Submit results

After completing part of the course you will be asked if you wish to save your progress. If you confirm your progress will be saved to file `results.RDS` which you can send to your instructor.

## Uninstall a course

If you'd like to remove a course at any time, you can use `uninstall_all_courses()`.


