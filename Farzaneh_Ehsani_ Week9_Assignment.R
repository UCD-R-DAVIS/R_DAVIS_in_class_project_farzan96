library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv") 

# I still need to understand the first part of assignment.



mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

#Filtering the columns

mloa<- mloa %>% select("windDir","windSpeed_m_s","baro_hPa","temp_C_2m",
                "temp_C_10m","temp_C_towertop","rel_humid", "precip_intens_mm_hr") %>% 
  map(max,na.rm=TRUE)
  

C_to_F<- function(x){
  
x * 1.8+32
}

mloa<-mloa %>% mutate(
  
  temp_F_2m= C_to_F(temp_C_2m),
  temp_F_10m= C_to_F(temp_C_10m),
  temp_F_towertop= C_to_F(temp_C_towertop)
)


