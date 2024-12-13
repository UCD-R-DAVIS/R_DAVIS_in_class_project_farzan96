library(tidyverse)
library(ggplot2)
library(dplyr)
library(lubridate)


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
    mutate(speed_Per_Lap = (total_distance_m / total_elapsed_time_s) * 60)
  
surveys_2 %>% 
  ggplot(aes(x = steps_per_minute, y =speed_Per_Lap, color= time_period)) +
  geom_boxplot()+
  geom_smooth(method = "lm", se = FALSE, aes(group = time_period), 
              color = "cyan", size = 1, linetype = "solid")+
  labs(
    title = "Boxplot of Speed by Steps per Minute",
    x = "Steps per Minute (SPM)",
    y = "Speed (meters per minute)"
  ) +
  theme_minimal()

# New Arrangment- Post Intervention Runs
# New Filtering Applied.

Surveys_2<- surveys_2 %>% filter(timestamp>as.Date("2024-06-30"))

dis_in_miles <- numeric(length = nrow(surveys_2))
meters_to_miles <- 1 / 1609.34
for (i in 1:nrow(surveys_2)) {
  dis_in_miles[i] <- surveys_2$total_distance_m[i] * meters_to_miles
}
surveys_2$total_distance_miles <- dis_in_miles
surveys_2 %>% filter(dis_in_miles<=3) %>% mutate(date = as.Date(timestamp)) %>%
  group_by(date) %>%
  mutate(lap_number = rank(timestamp)) %>%
  ungroup() %>% 
  ggplot( aes(x = steps_per_minute, y = speed_Per_Lap, color = as.factor(lap_number))) +
  geom_point(alpha = 0.6) + 
  geom_smooth(mmethod = "lm", se = FALSE, color = "black") + 
  labs(
    title = "Steps per Minute vs. Speed by Lap (Post-July 1, 2024)",
    x = "Steps per Minute",
    y = "Speed per Lap ",
    color = "Lap Number"
  ) +
  theme_minimal() 

# This is the funal result:)






