# wybierz() kolumny id, class, midterm i final
# (w tej kolejności) i zapisz wynik w gradebook.
#
gradebook <- students4 %>%
  select(id, class, midterm, final) %>%
  print
