# Zrealizuj następujące trzy cele:
#
# 1. select() wszystkie kolumny, które NIE zawierają słowa „total”,
# ponieważ jeśli mamy dane dotyczące mężczyzn i kobiet, zawsze możemy
# odtworzyć całkowitą liczbę w osobnej kolumnie, jeśli tego chcemy.
# Wskazówka: Użyj funkcji contains(), którą
# znajdziesz szczegółowo w sekcji „Funkcje specjalne” polecenia ?select.
#
# 2. pivot_longer() wszystkie kolumny Z WYJĄTKIEM score_range, używając
# names_to = part_sex i values_to = count.
#
# 3. separate() part_sex do dwóch oddzielnych zmiennych (kolumn),
# nazwanych odpowiednio „part” i „sex”. Może być konieczne sprawdzenie
# sekcji „Examples” polecenia ?separate, aby zapamiętać, jak powinien być sformułowany
# argument „into”.
#
sat %>%
  select(-contains("total")) %>%
  pivot_longer(cols = -score_range, names_to = "part_sex", values_to = "count") %>%
  separate(part_sex, c("part", "sex")) %>%
  print
