df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
aggregate(df1$Sales, by=list(df1$State), FUN=sum)

library(dplyr)
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))


world_cup_matches <- read.csv("C:/Users/Hamil/OneDrive/Desktop/WorldCupMatches.csv")

dim(world_cup_matches)

summary(world_cup_matches)

length(unique(world_cup_matches$City))

mean(world_cup_matches$Attendance, na.rm = TRUE)

aggregate(world_cup_matches$Home.Team.Goals, by = list(world_cup_matches$Home.Team.Name), FUN = sum)

aggregate(world_cup_matches$Attendance, by = list(world_cup_matches$Year), FUN = mean, na.rm = TRUE)

library(dplyr)

avg_attendance_by_year <- world_cup_matches %>%
  group_by(Year) %>%
  summarize(avg_attendance = mean(Attendance, na.rm = TRUE))

avg_attendance_by_year


library(ggplot2)

# Create a scatter plot 
ggplot(avg_attendance_by_year, aes(x = Year, y = avg_attendance)) +
  geom_point() +
  labs(title = "Average Attendance by Year",
       x = "Year",
       y = "Average Attendance")


metabolite <- read.csv("C:/Users/Hamil/OneDrive/Desktop/metabolite.csv")

n_Alzheimer <- sum(metabolite$Label == "Alzheimer")
cat("Number of Alzheimer patients:", n_Alzheimer, "\n")

missing_count <- colSums(is.na(metabolite))
cat("Number of missing values for each column:\n")
print(missing_count)

metabolite1 <- metabolite[!is.na(metabolite$Dopamine), ]
metabolite1$c4.OH.Pro <- ifelse(is.na(metabolite1$c4.OH.Pro),
                                median(metabolite1$c4.OH.Pro, na.rm = TRUE),
                                metabolite1$c4.OH.Pro)
print(head(metabolite1)) 
