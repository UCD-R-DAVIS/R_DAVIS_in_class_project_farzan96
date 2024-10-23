library('tidyverse')
surveys<-read_csv('data/portal_data_joined.csv')
str(surveys)

#select columns
month_day_year<- select(surveys,month,day, year)
year_1981<-filter(surveys, year==1981)
filter(surveys, year%in%c(1981:1983))
filter(surveys,hindfoot_length>40 & !is.na(weight))
small_animals<- filter(surveys, weight<5)

surveys %>% 
  filter(year==1981)

library(tidyverse)
surveys<-read_csv('data/portal_data_joined.csv')
surveys %>% 
  mutate(weight_kg=weight/1000) %>% 
  mutate(weight_kg2=weight*2) %>%
  str(surveys)




 


