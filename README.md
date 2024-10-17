# swirl courses for **Programming in R and Python** course at Wroclaw University of Economics and Business

This is a collection of interactive courses for use with the [swirl R package](http://swirlstats.com). 


For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl).

## There are following modules to finish, **organized by level of difficulty**:


1. **R Programming**: The basics of programming in R [Download the module](https://github.com/IwoA/swirl_courses/blob/master/PRPT_R_Programming.swc)
2. **Getting and Cleaning Data**: dplyr, tidyr, lubridate, oh my! [Download the module](https://github.com/IwoA/swirl_courses/blob/master/PRPT_Getting_and_Cleaning_Data.swc)
3. **R Graphics** [Download the module](https://github.com/IwoA/swirl_courses/blob/master/PRPT_R_Graphics.swc)



## Install and run a course automatically from swirl

**This is the preferred method of installing courses.** It automates the process by allowing you to do everything right from the R console.

1) Make sure you have a recent version version of swirl:

```
install.packages("swirl")
```
If a window pops up with question "Do you want to install from sources the package which needs compilation?" and three answers: "Tak", "Nie", "Anuluj" choose "Nie" (No).


2) Enter the following from the R console:

```
library(swirl) # loads the swirl package into your current R session
```
```
uninstall_all_courses() # removes all built-in courses
```

```
install_course() # installs the downloaded course. 
```
You will be prompted to interactively select the file you downloaded. The pop-up window could be hidden behind the RStudio window.
You can install one file at once therefore repeat this step until you install all four courses.

Type `swirl()` and **choose PRPT R Programming as the first course**.

As you will see the name of each of these three courses starts from 'PRPT' and consist of many lessons. Finish all of them in the order they are presented in the menu.



If the answers for the question "Would you like to continue with one of these lessons?" are following:

1: Exploratory Data Analysis Principles of Analytic Graphs

2: R Programming Basic Building Blocks

3: No. Let me start something new.

Then choose "3: No. Let me start something new." and in the next menu pick one of PRPT R Programming, PRPT Getting and Cleaning Data or PRPT R Graphics.





## Submit results

After completing a lesson you will be asked if you wish to save your progress. If you confirm your progress will be saved to file `results.RDS` which you can send to your instructor or to other computer if you wish to continue work at home. In such case copy the file to your documents directory.

## Uninstall a course

If you'd like to remove a course at any time, you can use `uninstall_all_courses()`.


