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
 group_by(species_id) %>%
  arrange() %>% 
  summarize(na_number=sum(is.na(species_id))) %>% 
  count()
surveys %>% 
group_by(taxa) %>%
  arrange() %>% 
  summarize(na_number_taxa=sum(is.na(taxa))) %>% 
  count()
#number of "NA"s in taxa is 4.
surveys %>% 
  group_by(plot_id) %>%
  arrange() %>% 
  summarize(na_number_taxa=sum(is.na(plot_id))) %>% 
  count()
# If the coding is correct, 24 of the plot_id is"NA".

# The 5th section of the assignment.
surveys<- read_csv('data/portal_data_joined.csv') 
surveys%>% 
filter(!is.na(weight)) %>% 
group_by(species_id,sex,weight) %>%
summarize(average_weight=mean(weight,na.rm=TRUE)) %>% 
surveys %>% 






  












  
  


  

