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
     pivot_longer(cols = -grade, names_to = "sex_class", values_to = "count") %>%
     separate(sex_class, c("sex", "class")) %>%
     print
