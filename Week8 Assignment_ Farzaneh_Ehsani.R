library(lubridate)
library(tidyverse)
library(ggplot2)

# Read and clean data
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv") %>%
  
  # Filter out missing values for relevant columns
  filter(!is.na(rel_humid) & !is.na(temp_C_2m) &!is.na(windSpeed_m_s)) %>%
  
  mutate(datetime=as.POSIXct(paste(year, month, day, hour24, min),
                             format = "%Y %m %d %H %M",
                             tz = "GMT"),
         datetimeLocal = with_tz(datetime, tzone = "Pacific/Honolulu")) %>% 
  group_by(hour24, month) %>% 
  summarize(mean_hourly_temp = mean(temp_C_2m)) %>% 
  ggplot(aes(x = month, y = mean_hourly_temp, color=hour24)) +
  geom_point(size = 2) +
  scale_color_viridis_d()+
  theme_classic()
# I don't know why it plots nothing!
# I have to check the code a couple of times.

