library(dplyr)
library(nycflights13)

flights

str(flights)

filter(flights, month == 1, day == 1)

jan1 <- filter(flights, month == 1, day == 1) 
(jan1 <- filter(flights, month == 1, day == 1))   #directly prints with bracket

filter(flights, month == 11 | month == 12)


filter(flights, month %in% c(11,12))

filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120 | dep_delay <= 120)

select(flights, year, month, day)
select(flights, year:day) #column from year to day
select(flights, -(year:day)) #exclude column from year to day
select(flights, starts_with("y"))
#ends_with, contains, matches(reg_ex) & others

flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
flights_sml


flights_sml <- mutate(flights_sml, gain = dep_delay - arr_delay, speed = distance/air_time * 60)
flights_sml <- mutate(flights_sml, hours = air_time/60, gain_per_hour = gain / hours)
flights_sml


transmute(flights, gain = dep_delay - arr_delay, hours = air_time/60, gain_per_hour = gain / hours)
#mutate combines variable to old data & transmute only gives new variables

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))
summarise(flights, delay = sd(dep_delay, na.rm = TRUE))


hist(flights$dep_delay)

summary(flights$dep_delay)
IQR(flights$dep_delay, na.rm = TRUE)

boxplot(flights$dep_delay)

by_day <- group_by(flights, year, month, day)
by_day

summarise(by_day, delay = mean(dep_delay, na.rm=TRUE))

delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL" )

delays

not_cancelled <- flights %>%
  filter(!is.na(dep_delay),
         !is.na(arr_delay))

not_cancelled

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(delay = mean(arr_delay))

delays

hist(delays$delay)

str(not_cancelled)


str(flights)



fav_dest <- not_cancelled %>%
  group_by(dest) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

fav_dest

head(fav_dest)
tail(fav_dest)

#most used 
#filter, arrange, select, mutate

str(flights)


#first & last flight in each day
not_cancelled %>% 
  group_by(year, month, day) %>%
  summarise(
    first = min(dep_time),
    last = max(dep_time)
  )


#which destination have most carriers
not_cancelled %>%
  group_by(dest) %>%
  summarise(carriers = n_distinct(carrier)) %>%
  arrange(desc(carriers))


flights %>% slice(1L) #1st line ? 
flights %>% slice(n())

flights %>% slice(1:4)
slice(flights, -(1:4))

flights %>% slice_sample(n=5)
flights %>% slice_sample(n=5, replace = TRUE)

set.seed(123)
train_data <- flights %>% slice_sample(prop=0.8)
train_data

test_data <- flights %>% slice_sample(prop=0.2)
test_data
