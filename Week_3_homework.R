# Import the table into R studio.
surveys<-read.csv('data/portal_data_joined.csv')
# calling out the "species_id column in the table. 
surveys[,"species_id"]
# Selecting particular columns and limiting it into the first 5000 rows.
surveys_base<- surveys[1:5000,c("species_id", "plot_type","weight")]
surveys_base
surveys_base$species_id<-factor(surveys_base$species_id)
surveys_base$plot_type<-factor(surveys_base$plot_type)
class(surveys_base$species_id)
class(surveys_base$plot_type)
levels(surveys_base$species_id)
levels(surveys_base$plot_type)

# The thing that I understood was that in factor function categorizes the data and gives value to each identifier, but when applying the character it doesn't just sees the data as a list with no particular priority and order assigned to each one. 
# we my use factors when we want to analyze the data drawn from a survey with  Likert scale questions rating something from 1 to 3 or 1 to 5.  
#Remove all rows where there is an NA in the weight column.
surveys_base <-surveys_base[complete.cases(surveys_base$weight), ]
surveys_base
#CHALLENGE: Create a second data frame called challenge_base that only consists of individuals from your surveys_base data frame with weights greater than 150g.
challenge_base<- surveys_base[-c(surveys_base$weight<150),]




