# Możesz zaimplementować funkcję my_mean w dowolny sposób, pod warunkiem, że
# zwróci ona średnią wszystkich liczb w `my_vector`.
#
# Wskazówka nr 1: sum() zwraca sumę wektora.
# Np.: sum(c(1, 2, 3)) daje wynik 6
#
# Wskazówka nr 2: length() zwraca rozmiar wektora.
# Np.: length(c(1, 2, 3)) daje wynik 3
#
# Wskazówka nr 3: Średnia wszystkich liczb w wektorze jest równa sumie wszystkich
# liczb w wektorze podzielonej przez rozmiar wektora.
#
# Uwaga dla tych, którzy czują się super mądrzy: nie używaj funkcji mean()
# podczas pisania tej funkcji. Próbujemy cię czegoś nauczyć
# tutaj!
#
# Pamiętaj, aby zapisać ten skrypt i wpisać submit() w konsoli po
# wprowadzeniu zmian.

my_mean <- function(my_vector) {
  # Napisz swój kod tutaj!
  # Pamiętaj: zostanie zwrócone ostatnie ocenione wyrażenie!
  sum(my_vector)/length(my_vector)
}
