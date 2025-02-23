# Uzupełnij poniższy ciąg, abyśmy mogli
# wybrać kolumnę id, name i sex z students4
# i zapisać wynik w student_info.
#
student_info <- students4 %>%
  select(id, name, sex) %>%
  print
