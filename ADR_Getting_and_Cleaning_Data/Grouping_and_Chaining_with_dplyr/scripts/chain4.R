# Posortuj arrange() wynik według rozmiaru_mb, w kolejności malejącej.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  # Funkcja arrange() powinna się znaleźć tutaj
