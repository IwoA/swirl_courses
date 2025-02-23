# Chcemy, aby wartości w kolumnach klasy wynosiły
# 1, 2, ..., 5, a nie class1, class2, ..., class5.
#
# Użyj funkcji mutate() z dplyr wraz z
# parse_number(). Wskazówka: Możesz „nadpisać” kolumnę
# za pomocą mutate(), przypisując nową wartość do istniejącej
# kolumny zamiast tworzyć nową kolumnę.
#
# Sprawdź ?mutate i/lub ?parse_number, jeśli
# potrzebujesz odświeżenia.
#
students3 %>%
     pivot_longer(cols = class1:class5, names_to = "class", values_to = "grade",  values_drop_na = TRUE) %>%
     pivot_wider(names_from = test, values_from = grade) %>%
     ### Funkcja mutate() powinna być tutaj %>%
     print
