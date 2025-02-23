# Możesz przekazywać funkcje jako argumenty do innych funkcji tak samo, jak możesz przekazywać
# dane do funkcji. Załóżmy, że zdefiniujesz następujące funkcje:
#
# add_two_numbers <- function(num1, num2){
# num1 + num2
# }
#
# multiply_two_numbers <- function(num1, num2){
# num1 * num2
# }
#
# some_function <- function(func){
# func(2, 4)
# }
#
# Jak widać, używamy nazwy argumentu „func” jak funkcji wewnątrz
# „some_function().” Przekazując funkcje jako argumenty
# some_function(add_two_numbers) będzie oceniane jako 6, podczas gdy
# some_function(multiply_two_numbers) będzie oceniane jako 8.
#
# Zakończ definicję funkcji poniżej, tak aby jeśli funkcja zostanie przekazana do
# argumentu „func” i pewne dane (takie jak wektor) zostaną przekazane do argumentu dat
# funkcja evaluate() zwróci wynik dat przekazanego jako
# argument do func.
#
# Wskazówki: To ćwiczenie jest trochę trudne, więc podam kilka przykładów, jak
# evaluate() powinno działać:
# 1. evaluate(sum, c(2, 4, 6)) powinno zostać ocenione jako 12
# 2. evaluate(median, c(7, 40, 9)) powinno zostać ocenione jako 9
# 3. evaluate(floor, 11.1) powinno zostać ocenione jako 11

evaluate <- function(func, dat){
  # Napisz swój kod tutaj!
}
