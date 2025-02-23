# Przeczytaj poniższy kod, ale niczego nie zmieniaj. Podczas
# czytania możesz rozumieć operator %>% jako
# słowo „następnie”.
#
# Wpisz submit(), gdy myślisz, że rozumiesz
# wszystko tutaj.

result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Pokaż wynik w konsoli
print(result3)
