library(tidyverse)
library(ggplot2)


surveys <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/main/data/tyler_activity_laps_12-6.csv") 
surveys_2<-surveys %>% 
  filter(sport=="running",
         minutes_per_mile<=10 & 
         minutes_per_mile>5) %>% 
         filter( minutes_per_mile>1) %>%
  mutate(new_cat = case_when(
  month%in%1:6 & year==2024~ "first_period",
  month>6 & year==2024)~"second_period",
  year!=2024~ "third_period") %>% 
  mutate(speed = (total_distance_m / total_elapsed_time_s)*60)
  
surveys_2 %>% 
  ggplot(aes(x = steps_per_minute, y = speed, color= new_cat)) +
  geom_boxplot()+
  geom_smooth(method = "lm", se = FALSE, aes(group = new_cat), 
              color = "cyan", size = 2, linetype = "solid")+
  labs(
    title = "Boxplot of Speed by Steps per Minute",
    x = "Steps per Minute (SPM)",
    y = "Speed (meters per minute)"
  ) +
  theme_minimal()



