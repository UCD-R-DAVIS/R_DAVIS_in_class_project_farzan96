#2nd Week Homework

set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

prob1<- hw2[hw2>=14&hw2<=38]
prob1<-prob1[!is.na(prob1)]
prob1

times3<-prob1*3
times3
plus10<-times3+10
plus10

final_set<-plus10[c(1,3,5,7,9,11,13,15,17,19,21,23)]
final_set
