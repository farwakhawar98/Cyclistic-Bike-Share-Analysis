install.packages("tidyverse")
library("tidyverse")
install.packages("conflicted")
library(conflicted)
install.packages("data.table")
library(data.table)

conflict_prefer("filter", "dplyr")
conflict_prefer("lag", "dplyr")
conflicts_prefer(lubridate::wday)

#=====================
# STEP 1: COLLECT DATA
#=====================
# # Uploading Divvy datasets (csv files)
oct_2025 <- read_csv("202510-divvy-tripdata.csv")

str(oct_2025)
colnames(oct_2025)
nrow(oct_2025)  #How many rows are in data frame?
dim(oct_2025)  #Dimensions of the data frame?
head(oct_2025)  # the first 6 rows of data frame.  Also tail(all_trips)
tail(oct_2025)

summary(oct_2025) 
table(oct_2025$member_casual)
table(oct_2025$rideable_type)

#date
oct_2025$date <- as.Date(oct_2025$started_at)
#oct_2025$month <- format(as.Date(oct_2025$date), "%m")
oct_2025$day <- format(as.Date(oct_2025$date), "%d")
#oct_2025$year <- format(as.Date(oct_2025$date), "%Y")
oct_2025$day_of_week <- format(as.Date(oct_2025$date), "%A")

str(oct_2025)

#ride length calculation
oct_2025$ride_length <- difftime(oct_2025$ended_at,oct_2025$started_at)
oct_2025$ride_length

is.factor(oct_2025$ride_length)
oct_2025$ride_length <- as.numeric(as.character(oct_2025$ride_length))
is.numeric(oct_2025$ride_length)


##oct_2025_trips<- oct_2025[!(oct_2025$ride_length<1),]

#Descriptive Analysis
summary(oct_2025$ride_length)

#aggregate functions 
# Compare members and casual users
aggregate(oct_2025$ride_length ~ oct_2025$member_casual, FUN = mean)
aggregate(oct_2025$ride_length ~ oct_2025$member_casual, FUN = median)
aggregate(oct_2025$ride_length ~ oct_2025$member_casual, FUN = max)
aggregate(oct_2025$ride_length ~ oct_2025$member_casual, FUN = min)

# Fixing out of order days of the week 
oct_2025$day_of_week <- ordered(oct_2025$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# average ride time by each day for members vs casual users
aggregate(oct_2025$ride_length ~ oct_2025$member_casual + oct_2025$day_of_week, FUN = mean)

# analyze ridership data by type and weekday
oct_2025%>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()
  group_by(member_casual, weekday) %>%  #groups by usertype and weekday
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,average_duration = mean(ride_length)) %>% 		# calculates the average duration
  arrange(member_casual, weekday)		# sorts


table(oct_2025$member_casual)

#----------------------------------------------------------------



#----------------------------------------------------------------
#================================================================

#Aggregate by month
oct_2025%>%
  group_by(member_casual,month) %>%
  summarise(number_of_rides=n(),
            average_duration = mean(ride_length))%>%
  arrange(member_casual,month) %>%
  ggplot(aes(x=month,y= average_duration,fill=member_casual)) + geom_col(position="dodge")


#===============================================================
#---------------------------------------------------------------
#aggregate by year
oct_2025_trips %>%
  group_by(member_casual,year) %>%
  summarise(number_of_rides=n(),
            average_duration = mean(ride_length))%>%
  arrange(member_casual,year) %>%
  ggplot(aes(x=year,y= number_of_rides,fill=member_casual)) + geom_col(position="dodge")

===================================================================
  # longest/shortest ride by each usertype
  
  oct_2025%>%
  group_by(member_casual) %>%
  summarise(longest_ride=max(ride_length),shortest_ride=min(ride_length))%>%
  arrange(member_casual) 

============================================================
  
  #  visualizing  the number of rides by rider type
  oct_2025%>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")

ride_count<-oct_2025 %>%
  mutate(weekday=wday(started_at,label=TRUE)) %>%
  group_by(member_casual,weekday) %>%
  summarize(number_of_rides =n()) %>%
  arrange(member_casual,weekday)


bike_type<-oct_2025 %>%
  group_by(member_casual,rideable_type) %>%
  summarize(number_of_rides =n()) %>%
  arrange(member_casual)





write.csv(bike_type, file = '10_2025_bike_type.csv')



#==========================================================



#==========================================================
library(dplyr)
# create a visualization for average duration
oct_2025 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")

avg_duration<-oct_2025 %>%
  mutate(weekday=wday(started_at,label=TRUE)) %>%
  group_by(member_casual,weekday) %>%
  summarize(average_duration =mean(ride_length),number_of_rides=n()) %>%
  arrange(member_casual,weekday)

#=================================================
# STEP 5: EXPORT SUMMARY FILE FOR FURTHER ANALYSIS
#=================================================
#avg_ride_length <- aggregate(oct_2025$ride_length ~ oct_2025$member_casual + #oct_2025$day_of_week, FUN = mean)


write.csv(avg_duration, file = '10_2025.csv')

write.csv(oct_2025, file ='oct_2025_cleaned_data.csv')







