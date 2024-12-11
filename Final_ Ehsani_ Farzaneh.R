library(tidyverse)
library(ggplot2)


surveys <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/main/data/tyler_activity_laps_12-6.csv") 
surveys_2<-surveys %>% 
  filter(sport=="running",
         minutes_per_mile<=10 & 
         minutes_per_mile>5) %>% 
         filter( minutes_per_mile>1) %>%
  mutate(time_period = case_when(
    as.Date(timestamp) < as.Date("2024-01-01") ~ "Pre_2024",
    as.Date(timestamp) >= as.Date("2024-01-01") & as.Date(timestamp) <= as.Date("2024-06-30") ~ "Rehab_Jan_Jun_2024",
    as.Date(timestamp) > as.Date("2024-06-30") ~ "Post_July_2024"
  )) %>% 
    mutate(speed = (total_distance_m / total_elapsed_time_s) * 60)
  
surveys_2 %>% 
  ggplot(aes(x = steps_per_minute, y =speed, color= time_period)) +
  geom_boxplot()+
  geom_smooth(method = "lm", se = FALSE, aes(group = time_period), 
              color = "cyan", size = 1, linetype = "solid")+
  labs(
    title = "Boxplot of Speed by Steps per Minute",
    x = "Steps per Minute (SPM)",
    y = "Speed (meters per minute)"
  ) +
  theme_minimal()



