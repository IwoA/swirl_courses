# Dodaj dwa kolejne wywołania funkcji, aby wykonać następujące czynności:
#
# 1. Użyj group_by() (z dplyr), aby pogrupować dane według części i
# płci, w tej kolejności.
#
# 2. Użyj mutate, aby dodać dwie nowe kolumny, których wartości zostaną
# automatycznie obliczone group-by-group:
#
# * total = sum(count)
# * prop = count / total
#
sat %>%
  select(-contains("total")) %>%
  pivot_longer(cols = -score_range, names_to = "part_sex", values_to = "count") %>%
  separate(part_sex, c("part", "sex")) %>%
  ### <Wywołanie funkcji group_by()> %>%
  mutate(###,
         ###
  ) %>% print
