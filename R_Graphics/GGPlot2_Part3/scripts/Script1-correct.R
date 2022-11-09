# To be able to show maximum values we need to create new variable
# which consist max values in appropriate rows and NA in others.
# In order to achieve this we need function 'mutate' from dplyr package
# and 'ifelse' function to differentiate between max and non-max values. 
# Such a function is available also in Excel.

data_long <- data_long %>% 
  group_by(Indices) %>% # we must group data because we need maximums of each indice
  mutate(max_val = ifelse(value==max(value), value, NA)) # ifelse(logical_test, what_if_yes, what_if_no)
