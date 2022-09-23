# extract  Extract one column into multiple columns.
# parse_numeric	Extract numeric component of variable.
# gather	Gather columns into key-value pairs.
# separate	Separate one column into multiple columns.
# spread	Spread a key-value pair across multiple columns.
# spread_	Standard-evaluation version of 'spread'.
# unite	Unite multiple columns into one.

library(readr)
library(tidyr)
library(dplyr)

# column headers are values, not variable names

?pivot_longer
pivot_longer(students, cols = -grade, names_to = sex, values_to = count)

# multiple variables are stored in one column


# variables are stored in both rows and columns

students3 %>%
     pivot_longer(class, cols = class1:class5, names_to = grade,na.rm = TRUE)

# res2 <- students3 %>%
#   pivot_longer(class, cols = class1:class5, names_to = grade,na.rm = TRUE) %>%
#   mutate(class = parse_numeric(class)) %>%
#   select(name, class, test, grade) %>%
#   arrange(name, class)

# res2 %>% pivot_wider(names_from = test, values_from = grade)

students3 %>%
     pivot_longer(class, cols = class1:class5, names_to = grade,na.rm = TRUE) %>%
     pivot_wider(names_from = test, values_from = grade)

students3 %>%
     pivot_longer(class, cols = class1:class5, names_to = grade,na.rm = TRUE) %>%
     pivot_wider(names_from = test, values_from = grade) %>%
  mutate(class = parse_numeric(class))


# multiple types of observational units are stored in the same table

students4

student_info <- students4 %>%
  select(id, name, sex) %>%
  unique()
student_info

gradebook <- students4 %>%
  select(id, class, midterm, final)
gradebook

# a single observational unit is stored in multiple tables

passed <- passed %>%
  mutate(status = "passed")
failed <- failed %>%
  mutate(status = "failed")

rbind_list(passed, failed) %>%
  arrange(desc(status), name, class)

# real data examples

sat1 <- select(sat, -contains("total"))
sat1 <- pivot_longer(sat1, cols = -score_range, names_to = column, values_to = count)
sat1 <- separate(sat1, column, c("part", "sex"))
sat1

by_part <- group_by(sat1, part, sex)
sat2 <- mutate(by_part,
               total = sum(count),
               prop = count / total)


arrange(sat1, desc(count))

sat %>%
     pivot_longer(cols = -score_range, names_to = column, values_to = count) %>%
  separate(column, c("part", "sex"))
	
	
sat %>%
  select(-contains("total")) %>%
     pivot_longer(cols = -score_range, names_to = column, values_to = count) %>%
  separate(column, c("part", "sex")) %>%
  group_by(part, sex) %>%
  mutate(total = sum(count),
         prop = count / total
  )

