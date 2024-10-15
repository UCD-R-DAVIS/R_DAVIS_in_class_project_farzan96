# Other data types
##Lists

c(4,6, "dog")
a<-list(4,6,"dog")
a
class(a)
str(a)

#Data.frames
letters
data.frame(letters)
df<-data.frame(letters)
length(df)
dim(df)
nrow(df)
ncol(df)

#factors
animals<-factor(c("duck", "duck", "goose", "goose"))
class(animals)
levels(animals)
nlevels(animals)
animals<- factor(x=animals, levels=c("goose","pigs","duck"))
animals

year<- factor(c(1978, 1980, 1934, 1979))
year
as.numeric(year)
levels(year)

as.numeric(animals)
as.character(animals)

surveys<-read.csv('data/portal_data_joined.csv')
class(surveys)
nrow(surveys)
ncol(surveys)
head(surveys)
tail(surveys)
colnames(surveys)
rownames(surveys)
str(surveys)
summary(surveys)
length(unique(surveys$species))
# first element in the first column of the data frame (as a vector)
surveys[1, 1] # first element in the first column of the data frame (as a vector)
surveys[1, 1] 
surveys[1,6]
surveys[,1]
# first three elements in the 7th column (as a vector)
surveys[1:3,7]
#the 3rd row of the data frame (as a data.frame)
surveys[3, ]    
# equivalent to head_surveys <- head(surveys)
head_surveys <- surveys[1:6, ] 
surveys[,-1]#Tho whole indices except for the first column. 

#Create a new data frame called surveys_200 containing row 200 of the surveys dataset.

surveys_200<-surveys[200,]
surveys_200
str(surveys)
nrow(surveys)
surveys[34786,]
tail(surveys)
surveys_middle<-surveys[17393,]
surveys[-c(7:34786),]

library(tidyverse)
t_surveys<-read_csv("data/portal_data_joined.csv")
class(t_surveys)
t_surveys[,1]
t_surveys<-read_csv('data/portal_data_joined.csv')

# Factors and Characters
sex<-factor(c("male","female","male","female"))