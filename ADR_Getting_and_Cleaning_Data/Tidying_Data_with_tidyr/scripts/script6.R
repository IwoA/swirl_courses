# Dodaj wywołanie unique() poniżej, które usunie
# zduplikowane wiersze z funkcji student_info.
#
# Podobnie jak w przypadku wywołania funkcji print() poniżej,
# możesz pominąć nawiasy po nazwie funkcji.
# To fajna funkcja %>%, która ma zastosowanie, gdy
# nie ma dodatkowych argumentów do określenia.
# Pamiętaj, że wbudowana funkcja |> nie ma takiej właściwości
#
student_info <- students4 %>%
  select(id, name, sex) %>%
  ### Wpisz swój kod tutaj %>%
  print
