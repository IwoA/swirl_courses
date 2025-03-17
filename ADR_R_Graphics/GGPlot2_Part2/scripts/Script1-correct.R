# Aby móc wyświetlić wartości maksymalne, musimy utworzyć nową zmienną,
# która będzie składać się z wartości maksymalnych w odpowiednich wierszach i NA w pozostałych.
# Aby to osiągnąć, potrzebujemy funkcji „mutate” z pakietu dplyr
# i funkcji „ifelse”, aby odróżnić wartości maksymalne od niemaksymalnych.
# Taka funkcja jest dostępna również w programie Excel.

data_long <- data_long %>% 
  group_by(Indices) %>% # musimy grupować dane, ponieważ potrzebujemy maksimów każdego indeksu
  mutate(max_val = ifelse(value==max(value), value, NA)) # ifelse(test_logiczny, co_jesli_tak, co_jesli_nie)