#How R Thinks About Data

## Vectors----
weight_g<-c(50,60,65,82)
weight_one_value<-c(50)
animals<-c("mouse", "rat", "dogs")
##inspection-----
length(weight_g)
#Finding the structure-----
str(weight_g)
## Change Vectors----
# #Symbols
%in%
  #==pairwisematching--order matters
  animals%in%c("rat", "cat", "dog", "duck", "goat")
animals==c("rats")