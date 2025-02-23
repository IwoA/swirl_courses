# Powtórz wywołania pivot_longer() i separate(), ale tym razem
# użyj operatora %>%, aby połączyć polecenia bez
# przechowywania wyniku pośredniego.
#
# Jeśli po raz pierwszy widzisz operator %>%, sprawdź
# ?chain, co spowoduje wyświetlenie odpowiedniej dokumentacji.
# Możesz również zajrzeć do sekcji Przykłady na dole
# ?pivot_longer i ?separate.
#
# Głównym pomysłem jest to, że wynik po lewej stronie %>%
# zastępuje pierwszy argument funkcji po prawej stronie. Dlatego pomijasz pierwszy argument każdej
# funkcji.
#
students2 %>%
     pivot_longer( , , ) %>%
     separate( , c("", "")) %>%
     print
