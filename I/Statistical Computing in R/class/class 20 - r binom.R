

# A random process is one that generates a different outcome according to 
# some rules each time it is executed.
# They are tightly linked to the concept of uncertainty: you are unsure about 
# the outcome the next time the process is executed.
# There are two basic ways to introduce randomness in R:
# • Random deviates 
# • Resampling

# Random deviates:
# • At the end of each year, each individual alive at the start can either 
# live or die.
# • There are two outcomes here, and suppose each individual has an 80% chance
# of surviving.
# • The number of individuals that survive is the result of a 
# binomial random process in which there were n individuals alive at the start
# of this year and p is the probability that any one individual survives 
# to the next year.

# We can execute a binomial random process with p=0.8 and n=100 like this in R:
rbinom(n=1, size=100, prob=0.8)

# We can also plot it with a bit of tweaking:
survivors <- rbinom(1000, 100, 0.8)
hist(survivors, col="red")

# We could also use other processes like log normal:
# It generates random numbers such that the log of the values are 
# normally-distributed with mean equal to logmean and 
# standard deviation equal to logsd
hist(rlnorm(1000,0,0.1), col="tomato")

#check for normal distrubution - use ks-test

#we can also use qqplot
qqnorm(survivors)
qqline(survivors)


# Resampling of 1 to 10
sample(x=1:10, size=5)

#Sample with replacement
sample(x=c('a','b','c'), size=10, replace=T)

# Sample with set probabilities
sample(x = c("live", "die"), size = 10, replace = T, prob = c(0.8, 0.2))

# Reproducing randomness:
x = rnorm(30,500,30)
x

# Replication in R:
means = replicate(n = 1000, 
                  expr = { x_i = sample(x, length(x), replace = T)
                  mean(x_i) 
                  })

# Mean and SE same in x and 1000 replicated means of x?
se = sd(x)/sqrt(length(x))
# Check means first
mean(means); mean(x)

#Standard error of mean 
sd(means); se(x)


# For loops

#1
for (i in 1:5) {
  print(i^2) 
}
#2 
results=numeric(5) 
for (i in 1:5) {
  results[i] = i^2 
} 
results


nt = 100 # number of years
N = NULL # container for (fish)
N[1] = 1000 # first end-of-year abundance
#Loop for replication
for (t in 2:nt) {
  #N this year is N last year * growth *
  # randomness * fraction that survive harvest
  N[t] = (N[t-1] * 1.1 * rlnorm(1, 0, 0.1)) * (1 - 0.08)
}

# Let’s plot it:
plot(N, type = "l", pch = 15, xlab = "Year", ylab = "Abundance")


# Function writing for Monte Carlo simulation:
pop_sim = function(nt, grow, sd_grow, U, plot = F) { 
  N = NULL
  N[1] = 1000
  for (t in 2:nt) {
    N[t] = (N[t-1] * grow * rlnorm(1, 0, sd_grow)) * (1 - U) 
    }
  if (plot) { 
    plot(N, type = "l", pch = 15, xlab = "Year", ylab = "Abundance")
  } 
  N 
  }

#Replicate the simulation for 1000 times
out = replicate(n = 1000, expr = pop_sim(100, 1.1, 0.1, 0.08, F))

#View this matrix in R Studio: 
View(out)
