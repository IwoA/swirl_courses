# Użyj filter(), aby wybrać wszystkie wiersze, dla których size_mb jest
# mniejsze lub równe (<=) 0,5.
#
# Jeśli chcesz, aby wyniki były pokazane w konsoli, dodaj
# print na końcu łańcucha.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  # funkcja filter() powinna się znaleźć tutaj
