# Użyj mutate(), aby dodać kolumnę o nazwie size_mb, która zawiera
# rozmiar każdego pobrania w megabajtach (tj. size / 2^20).
#
# Jeśli chcesz, aby wyniki były pokazane w konsoli, dodaj
# print na końcu łańcucha.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20)
