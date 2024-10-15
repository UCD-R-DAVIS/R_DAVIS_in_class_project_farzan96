#Subsetting----


animals<-c("mouse", "rat", "dog", "cat")
animals[c(1,2)]
animals[c(2,3,2,2,3,2,3)]

#logical vector subsetting
weight<-c[14,76,81,25,46]
weight[c(TRUE,TRUE, FALSE, FALSE, FALSE)]
weight[weight>50]
weight>50

##Multiple Tests----
weight<-c[14,76,81,25,46]
weight[weight>50|weight<20]
#And-->5
#Other Symbols
