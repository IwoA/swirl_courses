# Nie zmieniaj żadnego w poniższym kodzie. Po prostu wpisz submit()
# kiedy jeśli sądzisz, że wszystko rozumiesz. Jeśli uważasz, że jest to
# mylące, masz absolutną rację!

result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)
