# Wywołaj pivot_longer(), aby zebrać kolumny od class1
# do class5 do nowej zmiennej o nazwie class.
# Nazwy powinny trafić do kolumny class, a wartości
# do kolumny grade.
#
# tidyr ułatwia odwoływanie się do wielu sąsiadujących
# kolumn z class1:class5, tak jak w przypadku sekwencji
# liczb.
#
# Ponieważ każdy student jest zapisany tylko na dwie z
# pięciu możliwych klas, brakuje wielu
# wartości (tj. NA). Użyj argumentu na.rm = TRUE
#, aby pominąć te wartości w końcowym wyniku.
#
# Pamiętaj, że gdy używasz operatora %>%,
# wartość po jego lewej stronie jest wstawiana jako
# pierwszy argument funkcji po prawej stronie.
#
# Jeśli utkniesz, sprawdź ?pivot_longer i/lub ?chain.
#
students3 %>%
     pivot_longer(cols = class1:class5, names_to = "class", values_to = "grade",  values_drop_na = TRUE) %>%
  print
