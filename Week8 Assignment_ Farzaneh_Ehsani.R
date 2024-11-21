library(lubridate)
library(tidyverse)
library(ggplot2)

# Read and clean data
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv") %>%
  
  # Filter out missing values for relevant columns
  filter(!is.na(rel_humid) & !is.na(temp_C_2m) &!is.na(windSpeed_m_s)) %>%
  
  mutate(datetime=as.POSIXct(paste(year, month, day, hour24, min),
                             format = "%Y %m %d %H %M",
                             tz = "UTC")) 
mutate(mloa, datetimeLocal = with_tz(datetime, tzone = "Pacific/Honolulu")) %>% 
    mutate(local_month= month(datetimeLocal,label = TRUE),
      local_hour= hour(datetimeLocal)) %>% 
    
  group_by(local_month, local_hour) %>% 
  summarize(mean_hourly_temp = mean(temp_C_2m, na.rm=TRUE)) %>% 
  ggplot(aes(x = local_month, y = mean_hourly_temp, color=local_hour)) +
  geom_point(aes(col = local_hour)) +
  scale_color_viridis_c()+
  theme_classic()
# It is a better coding, but still differs from the intended graph
