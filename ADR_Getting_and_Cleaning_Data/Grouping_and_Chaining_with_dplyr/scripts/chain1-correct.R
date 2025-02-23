# select() następujące kolumny z cran. Pamiętaj, że
# gdy używasz operatora łańcuchowego, nie
# musisz określać nazwy tabeli danych w wywołaniu
# select().
#
# 1. ip_id
# 2. country
# 3. package
# 4. size
#
# Wywołanie print() na końcu łańcucha jest opcjonalne,
# ale konieczne, jeśli chcesz, aby wyniki były
# pokazane w konsoli. Pamiętaj, że ponieważ nie ma dodatkowych argumentów
# do print(), możesz pominąć nawiasy po
# nazwie funkcji. Jest to wygodna funkcja operatora %>%.
# Jednakże wbudowany operator |> wymaga nawiasów nawet w takiej sytuacji.

cran %>%
  select(ip_id, country, package, size) %>%
	print
