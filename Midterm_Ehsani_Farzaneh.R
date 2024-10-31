library(tidyverse)
surveys<-read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv")
str(surveys)
colnames(surveys)

# 2nd Prompt
#I want to see what kinds of activites we have in the sports column.
sports_cat<-factor(surveys$sport)
levels(sports_cat)
filtered_surveys<-surveys %>% 
  filter(sport=="running")
dim(filtered_surveys)

#3rd Prompt

surveys_Minutes_restricted<- filtered_surveys %>% filter(minutes_per_mile<10 & minutes_per_mile>5)

#4rth Prompt
surveys_added_pace_cat<-surveys %>% 
  mutate(pace= case_when(
    minutes_per_mile<6~"fast",
    minutes_per_mile>8~"slow",
    TRUE~"medium"
  )) 
  

surveys_added_form_cat<-surveys_added_pace_cat %>% 
  mutate(form= case_when(
    year<2024~"old",
    year>=2024~"new"
  ))
surveys_added_form_cat %>% colnames()

#5th prompt
surveys_final<- surveys_added_form_cat %>%
  group_by(pace) %>% 
  summarize(average_steps=mean(steps_per_minute))
table_wider<-surveys_final %>% pivot_wider(names_from = pace,values_from = average_steps)
table_wider
#Arrange the order

table_wider %>% select(slow,medium,fast)
table_one_column<- surveys_final %>% select(average_steps)
cross_joined<-cross_join(table_one_column,table_wider)
new_order<-cross_joined %>% select(average_steps, slow, medium, fast)
new_order
#6th prompt
#surveys %>% group_by(year,month) %>%
 # filter(year==2024&month %in% 6:7) %>% 
  #summary(surveys$steps_per_minute)

new_format<-surveys %>% filter(month%in%1:6&year==2024) %>%
  group_by(month) %>%
  summarize(min_steps=min(steps_per_minute),
          median_steps=median(steps_per_minute),
          max_steps=max(steps_per_minute),
          mean_steps=mean(steps_per_minute))
new_format


# It is done:), but it took me longer than I expeceted.
