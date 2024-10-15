surveys<-read.csv('data/portal_data_joined.csv')

surveys[,"species_id"]
surveys_base<- surveys[1:5000,c("species_id", "plot_type","weight")]
surveys_base
surveys_base["species_id"]<-as.factor("species_id")
surveys_base["plot_type"]<-as.factor("plot_type")

#Remove all rows where there is an NA in the weight column.
surveys_base <-surveys_base[!is.na(surveys_base$weight), ]
surveys_base
#CHALLENGE: Create a second data frame called challenge_base that only consists of individuals from your surveys_base data frame with weights greater than 150g.
challenge_base<- surveys_base[-c(surveys_base$weight<150),]
