library(tidyverse)
surveys<-read_csv('data/portal_data_joined.csv')
str(surveys)
#surveys %>% surveys_organized %>% 
  #group_by(plot_type, genus) %>% 
  #filter(!is.na(hindfoot_length)) %>% 
  #summarize(mean_hindfoot_length= mean(hindfoot_length)) %>% 
  #select(plot_type, genus, mean_hindfoot_length) %>% 
  #pivot_wide<-pivot_wider(names_from= genus, values_from= mean_hindfoot_length)

surveys_wide<-surveys %>%
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>%
  summarize(mean_hindfoot_length=mean(hindfoot_length)) %>% 
  select(plot_type, genus, mean_hindfoot_length) %>% 
  pivot_wider(names_from=plot_type, values_from=mean_hindfoot_length)
surveys_wide

#second part of the assignment

summary(surveys$weight)
surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(
  weight_cat=case_when(
    weight<=20 ~"small",
    weight>=280 ~"large",
    TRUE~"medium"
  )) 

  # second part of the assignment_partB
  surveys %>% 
  summary(surveys$weight)
surveys %>% filter(!is.na(weight)) %>% first_quartile<-quartile(surveys$weight, 0.25)
surveys %>% filter(!is.na(weight)) %>% third_quartile<-quartile(surveys$weight, 0.75)
surveys %>% 
  mutate(
    weight_cat=case_when(
      weight<=first_quartile ~"small",
      weight>=third_quartile ~"large",
      TRUE~"medium"
    )) 
getwd()
  
  
  
  




