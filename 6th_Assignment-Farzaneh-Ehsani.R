library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") #ONLY change the "data" part of this path if necessary

str(gapminder)
colnames(gapminder)

gapminder %>% group_by(continent,year) %>% 
  summarize(mean_life_exp=mean(lifeExp)) %>% 
ggplot()+
  geom_point(aes(x = year, y = mean_life_exp, color = continent))+ 
  geom_line(aes(x = year, y = mean_life_exp, color = continent)) 

#3rd Question
#Create Box plot
list_of_countries<- c("Brazil", "China", "El Salvador", "Niger", "United States")
new_data<-gapminder %>% filter(country %in% list_of_countries)
  ggplot(data=new_data, mapping= aes(x = country, y = lifeExp))+geom_point(alpha=1, color="orange")+
  geom_boxplot(alpha=0.3, color="blue")+
  geom_jitter(alpha = 0.2, color="tomato")+
    ggtitle("Life Expectancy of Five Countries")+
    xlab("Name of countries")+
    ylab("Life Expectancy")
    
