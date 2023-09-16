die <- 1:6

sample(x=die, size=1)
sample(x=die, size=2)
sample(x=die, size=2, replace = TRUE)

roll <- function(){
  die <- 1:6
  dice <- sample(die, 2, TRUE)
  sum(dice)
}

roll()
roll()
roll()

roll2 <- function(die = 1:6){
  dice <- sample(die, 2, TRUE)
  sum(dice)
}

roll2(1:12)
roll2()

best_practice <- c("Best", "practice", "of", "some", "work")

print_words <- function(sentence){
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
}

print_words(best_practice)
print_words(best_practice[-5])
best_practice[-6]
print_words(best_practice)