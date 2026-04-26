# Dodaj poniżej wywołanie funkcji unique  
# Usunie ona zduplikowane wiersze z funkcji student_info.
#
# Podobnie jak w przypadku wywołania funkcji print poniżej,
# pomiń nawiasy po nazwie funkcji.
# To fajna funkcja %>%, która ma zastosowanie, gdy
# nie ma dodatkowych argumentów do określenia.
# Pamiętaj, że wbudowana funkcja |> nie ma takiej właściwości
#
student_info <- students4 %>%
  select(id, name, sex) %>%
  unique %>%
  print
