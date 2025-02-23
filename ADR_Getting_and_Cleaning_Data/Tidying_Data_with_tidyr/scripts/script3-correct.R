# Ten skrypt bazuje na poprzednim, dodając
# wywołanie pivot_wider(), co pozwoli nam zamienić
# wartości kolumny testowej, midterm i final, na
# nagłówki kolumn (tj. zmienne).
#
# Musisz określić tylko dwa argumenty dla pivot_wider().
# Czy potrafisz ustalić, jakie one są? (Wskazówka: Nie musisz określać argumentu data, ponieważ używamy
# operatora %>%.
#
students3 %>%
     pivot_longer(cols = class1:class5, names_to = "class", values_to = "grade",  values_drop_na = TRUE) %>%
     pivot_wider(names_from = test, values_from = grade) %>%
     print
