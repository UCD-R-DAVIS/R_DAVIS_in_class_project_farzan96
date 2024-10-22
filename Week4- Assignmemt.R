library('tidyverse')
surveys<-read_csv('data/portal_data_joined.csv')
biggest_critters<-surveys
biggest_critters%>% 
  filter(weight>30& weight<50) %>%
  select(species_id, sex, weight) %>% 
  group_by(sex, weight, species_id) %>% 
  summarize(max_weight=max(weight, na.rm=TRUE))


surveys<-read_csv('data/portal_data_joined.csv') 
surveys%>% 
  arrange(sex, hindfoot_length, plot_id) %>%
  mutate(sex_na_count=sum(is.na=TRUE)) %>% 
  select(sex_na_count)










  
  


  

