# Oblicz cztery wartości, w następującej kolejności, z
# zgrupowanych danych:
#
# 1. count = n()
# 2. unique = n_distinct(ip_id)
# 3. countries = n_distinct(country)
# 4. avg_bytes = mean(size)
#
# Kilka rzeczy, na które należy uważać:
#
# 1. Oddziel argumenty przecinkami
# 2. Upewnij się, że masz zamykający nawias
# 3. Sprawdź pisownię!
# 4. Zapisz wynik w pack_sum
#
# Powinieneś również przyjrzeć się ?n i ?n_distinct, aby
# naprawdę zrozumieć, co się dzieje.

pack_sum <- summarize(by_package,
                      count = ,
                      unique = ,
                      countries = ,
                      avg_bytes = )
