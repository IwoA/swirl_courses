# Elipsy mogą być używane do przekazywania argumentów innym funkcjom, które są
# używane w ramach funkcji, którą piszesz. Zwykle funkcja, która ma
# elipsy jako argument, ma elipsy jako ostatni argument. Użycie
# takiej funkcji wyglądałoby następująco:
#
# ellipses_func(arg1, arg2 = TRUE, ...)
#
# W powyższym przykładzie arg1 nie ma wartości domyślnej, więc należy podać wartość
# dla arg1. arg2 ma wartość domyślną, a inne argumenty mogą występować po arg2
# w zależności od tego, jak są zdefiniowane w dokumentacji ellipses_func().
# Co ciekawe, użycie funkcji paste jest następujące:
#
# paste (..., sep = " ", collapse = NULL)
#
# Zauważ, że elipsy są pierwszym argumentem, a wszystkie inne argumenty po
# elipsach mają wartości domyślne. To ścisła zasada w programowaniu R: wszystkie
# argumenty po wielokropku muszą mieć wartości domyślne. Przyjrzyj się poniższej
# funkcji simon_says:
#
# simon_says <- function(...){
# paste("Simon mówi:", ...)
# }
#
# Funkcja simon_says działa tak samo jak funkcja paste, z tą różnicą, że
# początek każdego ciągu jest poprzedzony ciągiem "Simon mówi:"
#
# Telegramy były kiedyś doprawiane słowami START i STOP, aby
# rozgraniczyć początek i koniec zdań. Napisz poniżej funkcję o nazwie
# telegram, która formatuje zdania dla telegramów.
# Na przykład wyrażenie `telegram("Good", "morning")` powinno zostać ocenione jako:
# "START Good morning STOP"

telegram <- function(...){
  paste("START", ..., "STOP")
}