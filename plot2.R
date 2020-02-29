setwd("~/OneDrive/Transfer/Coursera/Tasks/Exploratoy Data Analysis/Week 1/ExData_Plotting1")

library(RSQLite)
library(sqldf)
library(lubridate)

#Use SQL commands to read in just the lines with the specified dates
df<- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date == "1/2/2007" OR Date == "2/2/2007"', sep = ";")
closeAllConnections()

#Set all ? to NA
df[df == "?"] <- NA

#Create new Variable containing Date and Time
df$datetime<- with(df, dmy(Date) + hms(Time))

#Plot 2
#Set System to English because otherwise weekdays in legend would appear in German
Sys.setlocale("LC_TIME", "en_US")

#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Global_active_power, type = "n", xlab = "", 
     ylab="Global Active Power (kilowatts)")
#Insert line in plot
lines(df$datetime,df$Global_active_power, type = "l")

#Repeat code but save to .png
png("plot2.png")
#Set System to English because otherwise weekdays in legend would appear in German
Sys.setlocale("LC_TIME", "en_US")

#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Global_active_power, type = "n", xlab = "", 
     ylab="Global Active Power (kilowatts)")
#Insert line in plot
lines(df$datetime,df$Global_active_power, type = "l")
dev.off()
