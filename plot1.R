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

#Plot 1
#Create histogram w/o values, define title, lables, color
hist(df$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)",  xaxt = "n", yaxt = "n")
#Label X-Axis
axis(side = 1, at=seq(0,6,2), labels = seq(0,6,2))
#Label Y-Axis
axis(side = 2, at=seq(0,1200,200), labels = seq(0,1200,200))


#Repeat histogram code but save to .png
png("plot1.png")
hist(df$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)", xlim = c(0,8), breaks = 12, xaxt = "n", yaxt = "n")
axis(side = 1, at=seq(0,6,2), labels = seq(0,6,2))
axis(side = 2, at=seq(0,1200,200), labels = seq(0,1200,200))
dev.off()

