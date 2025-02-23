# Nie zmieniaj poniższego kodu. Po prostu wpisz submit()
# jeśli uważasz, że rozumiesz.

# Już zrobiliśmy tę część, ale powtarzamy ją
# tutaj dla jasności.

by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Oto nowa część, ale wykorzystująca to samo podejście, którego
# używaliśmy przez cały czas.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Pokaż rezultat w konsoli
print(result1)
