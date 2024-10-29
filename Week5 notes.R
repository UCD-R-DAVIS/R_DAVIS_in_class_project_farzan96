# pivoting command
#Week5_Join_R studio

library(tidyverse)
tail<-read_csv('data/tail_length.csv')
head(tail)
dim(tail)
#psuedo code
#join function(data frame a, data frame b, how to join )
#inner_join
surveys<-read_csv('data/portal_data_joined.csv')
inner_join(x=surveys, y=tail, by='record_id')
dim(inner_join(x=surveys, y=tail, by='record_id'))
dim(surveys)
dim(tail)


surveys_left_joined<-left_join(x=surveys,y=tail, by= 'record_id')
dim(surveys_left_joined)
surveys_full_joined<-full_join(x=surveys,y=tail)
dim(surveys_full_joined)

#pivoting or reshaping
# We just change how we array the cells.

