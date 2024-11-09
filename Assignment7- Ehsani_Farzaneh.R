library(tidyverse)
library(ggplot2)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
str(gapminder)
colnames(gapminder)



gapminder %>% select(country, continent, pop, year) %>% 
  filter(year==2002 | year==2007, continent %in% c("Africa", "Americas", "Asia", "Europe")) %>% 
  pivot_wider(names_from = year, values_from= pop) %>% rename(pop_2002='2002', pop_2007= '2007') %>% 
  mutate(pop_dif= pop_2007-pop_2002) %>% arrange(desc(pop_dif)) %>% 
  ggplot(aes(x=reorder(country, pop_dif), y=pop_dif, fill = continent))+
  geom_bar(stat="identity", color=NA)+
  theme(axis.text.x= element_text(angle=45, hjust=1))+ 
  labs(x= "country", y= "changes in population between 2002 and 2007")+ # naming the x and y axis
  facet_wrap(~continent,scales ="free", nrow=2)+
  theme_light()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8,# adjusting the messed up labels
                            
                               ))




