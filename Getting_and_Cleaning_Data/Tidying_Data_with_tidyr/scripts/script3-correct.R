# This script builds on the previous one by appending
# a call to pivot_wider(), which will allow us to turn the
# values of the test column, midterm and final, into
# column headers (i.e. variables).
#
# You only need to specify two arguments to pivot_wider().
# Can you figure out what they are? (Hint: You don't
# have to specify the data argument since we're using
# the %>% operator.
#
students3 %>%
     pivot_longer(cols = class1:class5, names_to = "class", values_to = "grade",  values_drop_na = TRUE) %>%
     pivot_wider(names_from = test, values_from = grade) %>%
     print
